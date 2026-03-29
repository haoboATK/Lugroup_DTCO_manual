import subprocess
import logging
import re
import random
import os
logger = logging.getLogger(__name__)


def sprocess_command(env_script, sdevice_dir, sprocess_input_file):
    """
    调用 Sentaurus SProcess
    :param env_script: Synopsys 环境脚本路径 (例如 ~/.synopsys_bashrc)
    :param sdevice_dir: 工程所在目录
    :param sprocess_input_file: SProcess 输入文件 (.cmd)

	source /home/haobo/synopsys_project/synopsys_bashrc && sprocess '{sprocess_input_file}'
    """
    cmd = f"source {env_script} && sprocess '{sprocess_input_file}'"
    try:
        result = subprocess.run(cmd, cwd=sdevice_dir, shell=True,
                              stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                              check=True, timeout=8000)
        logger.info(f"SPROCESS ran successfully for {sprocess_input_file}")
        logger.debug(result.stdout.decode())
        return True
    except subprocess.CalledProcessError as e:
        logger.error(f"SPROCESS failed for {sprocess_input_file}: {e.stderr.decode()}")
        return False
    except subprocess.TimeoutExpired:
        logger.error(f"SPROCESS command timed out for {sprocess_input_file}")
        return False
    except Exception as e:
        logger.error(f"Unexpected error in SPROCESS for {sprocess_input_file}: {str(e)}")
        return False
    

def sde_command(env_script, sdevice_dir, sde_input_file):
    cmd = f"source {env_script} && sde -e -l '{sde_input_file}'"
    try:
        result = subprocess.run(cmd, cwd=sdevice_dir, shell=True,
                              stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                              check=True, timeout=8000)
        logger.info("SDE ran successfully")
        logger.debug(result.stdout.decode())
        return True
    except subprocess.CalledProcessError as e:
        logger.error(f"SDE failed: {e.stderr.decode()}")
        return False
    except subprocess.TimeoutExpired:
        logger.error("SDE command timed out")
        return False
    except Exception as e:
        logger.error(f"Unexpected error in SDE: {str(e)}")
        return False


def sdevice_command(env_script, sdevice_dir, sdevice_input_file):
    cmd = f"source {env_script} && sdevice --tcl '{sdevice_input_file}'  "
    try:
        result = subprocess.run(cmd, cwd=sdevice_dir, shell=True,
                              stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                              check=True, timeout=600000)
        logger.info(f"SDEVICE ran successfully for {sdevice_input_file}")
        logger.debug(result.stdout.decode())
        return True
    except subprocess.CalledProcessError as e:
        logger.error(f"SDEVICE failed for {sdevice_input_file}: {e.stderr.decode()}")
        return False
    except subprocess.TimeoutExpired:
        logger.error(f"SDEVICE command timed out for {sdevice_input_file}")
        return False
    except Exception as e:
        logger.error(f"Unexpected error in SDEVICE for {sdevice_input_file}: {str(e)}")
        return False


def svisual_command(env_script, proj_dir, svisual_input_file, output_file=None):
    """
    调用 Sentaurus SVisual
    :param env_script: Synopsys 环境脚本路径 (例如 ~/.synopsys_bashrc)
    :param proj_dir: 工程所在目录
    :param svisual_input_file: SVisual 输入文件 (.cmd)
    :param output_file: 可选，导出的图像或数据文件
    """
    cmd = f"source {env_script} && svisual -batchX '{svisual_input_file}'  "
    
    try:
        result = subprocess.run(cmd, cwd=proj_dir, shell=True,
                                stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                check=True, timeout=8000)
        logger.info(f"SVISUAL ran successfully for {svisual_input_file}")
        logger.debug(result.stdout.decode())
        return True
    except subprocess.CalledProcessError as e:
        logger.error(f"SVISUAL failed for {svisual_input_file}: {e.stderr.decode()}")
        return False
    except subprocess.TimeoutExpired:
        logger.error(f"SVISUAL command timed out for {svisual_input_file}")
        return False
    except Exception as e:
        logger.error(f"Unexpected error in SVISUAL for {svisual_input_file}: {str(e)}")
        return False


def generate_param_table(param_ranges, out_dir="param_set", precision=6):
    """
    生成一个随机参数表，保存为 <out_dir>/param_table.txt
    # ===== 示例用法 =====
    if __name__ == "__main__":
        param_ranges = {
            "param_1_dose":   (0.8, 1.2),
            "param_1_energy": (0.9, 1.1),
            "param_2_time":   (0.85, 1.15),
            "param_2_temp":   (0.95, 1.05),
        }·
    generate_param_table(param_ranges, out_dir="run_1")
    参数
    ----
    param_ranges : dict[str, tuple]
        参数范围 {param_name: (low, high)}
    out_dir : str
        保存路径（目录，字符串）
    precision : int
        保留小数位数
    """
    if not os.path.exists(out_dir):
        os.makedirs(out_dir)
    out_file = os.path.join(out_dir, "param_table.txt")
    with open(out_file, "w") as f:
        for name, (low, high) in param_ranges.items():
            value = random.uniform(low, high)
            f.write(f"fset {name:<15} {value:.{precision}f}\n")


def copy_files(origin_dir, run_dir):
    """
    使用系统 cp 命令复制文件
    """
    if not os.path.exists(run_dir):
        os.makedirs(run_dir)

    os.system(f"cp {origin_dir}/* {run_dir}/")


def replace_parameters(cmd_file, param_file):
    """
    将 param_file 的内容替换到 cmd_file 中
    ##Process_Parameters_begin## 和 ##Process_Parameters_end## 之间

    参数:
    cmd_file : str    原始 CMD 文件路径
    param_file : str  param_table.txt 文件路径
    output_file : str 替换后输出文件路径 (默认为覆盖原文件)
    """
    # 读取 param_table.txt
    with open(param_file, "r") as f:
        param_lines = f.readlines()
        # 确保每行都以换行符结尾
        if param_lines and not param_lines[-1].endswith("\n"):
            param_lines[-1] += "\n"
    # 读取 CMD 文件
    with open(cmd_file, "r") as f:
        lines = f.readlines()
    new_lines = []
    inside_block = False
    for line in lines:
        if "##Process_Parameters_begin##" in line:
            new_lines.append(line)
            new_lines.extend(param_lines)   # 插入参数内容
            inside_block = True
            continue
        if "##Process_Parameters_end##" in line:
            inside_block = False
            new_lines.append(line)
            continue
        if not inside_block:
            new_lines.append(line)
    # 写回 CMD 文件
    with open(cmd_file, "w") as f:
        f.writelines(new_lines)

