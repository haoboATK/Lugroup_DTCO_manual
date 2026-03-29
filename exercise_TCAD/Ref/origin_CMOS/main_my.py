from base_function import *
import os
import time
import subprocess


def count_xvfb():
    result = subprocess.run(
        ["pgrep", "-c", "Xvfb"],
        stdout=subprocess.PIPE,
        text=True
    )
    return int(result.stdout.strip())


if __name__ == "__main__":
    # 配置路径
    env_file = "/home/haobo/synopsys_project/synopsys_bashrc" # 替换成你的环境脚本
    project_dir = "/home/haobo/sentaurus_simulation"              # 工程目录
    origin_dir = "/home/haobo/sentaurus_simulation/origin"        # 工程目录
    sprocess_file = "sprocess.cmd"                                # 工艺流程输入文件
    svisual_file = "svisual_str.tcl"                                 #
    sdevice_file = "sdevice.cmd"  # sdevice流程输入文件
    simulation_num = 1000
    param_ranges = {
        "param_1_dose":   (0.8, 1.2),
        "param_1_energy": (0.8, 1.2),

        "param_2_time":   (0.8, 1.2),
        "param_2_temp":   (0.8, 1.2),

        "param_3_time":   (0.8, 1.2),
        "param_3_temp":   (0.8, 1.2),

        "param_4_time":   (0.8, 1.2),
        "param_4_temp":   (0.8, 1.2),
        "param_4_rate":   (0.8, 1.2),

        "param_5_dose":   (0.8, 1.2),
        "param_5_energy": (0.8, 1.2),
        "param_5_tilt":   (0.8, 1.2),

        "param_6_dose":   (0.8, 1.2),
        "param_6_energy": (0.8, 1.2),

        "param_7_time":   (0.8, 1.2),
        "param_7_temp":   (0.8, 1.2),

        "param_8_dose":   (0.8, 1.2),
        "param_8_energy": (0.8, 1.2),

        "param_9_time":   (0.8, 1.2),
        "param_9_temp":   (0.8, 1.2),

        "param_10_time":  (0.8, 1.2),
        "param_10_temp":  (0.8, 1.2),

        "param_11_time":  (0.8, 1.2),
        "param_11_temp":  (0.8, 1.2),
    }



    # 开始仿真
    for i in range(simulation_num):
        print(f"\n=== Run {i + 1} started ===")
        start_time = time.time()
        # Step 1: 创建路径
        run_dir = os.path.join(project_dir, f"run_{i+1}")
        if not os.path.exists(run_dir):
            os.makedirs(run_dir)
        os.chdir(run_dir)
        # Step 2: 生成参数表
        generate_param_table(param_ranges, out_dir=".", precision=6)
        # Step 3: 复制必要文件
        copy_files(origin_dir, run_dir)
        # step 4: 连接对应文件
        run_sprocess_file = os.path.join(run_dir, sprocess_file)
        run_svisual_file = os.path.join(run_dir, svisual_file)
        # Step 5: 修改文件
        replace_parameters(run_sprocess_file, "param_table.txt")
        # Step 6: 运行 SProcess
        if not sprocess_command(env_file, run_dir, run_sprocess_file):
            print(f"wanring Run {i+1}: SProcess failed, skipped")
            with open(os.path.join(run_dir, "FAILED.flag"), "w") as f:
                f.write("SProcess failed\n")
            continue
        # Step 7: 运行 SVisual 导出图像
        os.system("pkill Xvfb")
        print("Xvfb num:", count_xvfb())
        if not svisual_command(env_file, run_dir, run_svisual_file):
            print(f"wanring Run {i+1}: SVisual failed, skipped")
            with open(os.path.join(run_dir, "FAILED.flag"), "w") as f:
                f.write("SVisual failed\n")
            continue
        os.system("pkill Xvfb")
        print("Xvfb num:", count_xvfb())
        # Step 8: 运行 Sdevice
        run_sdevice_file = os.path.join(run_dir, sdevice_file)
        if not sdevice_command(env_file, run_dir, run_sdevice_file):
            print(f"wanring Run {i+1}: SProcess failed, skipped")
            with open(os.path.join(run_dir, "FAILED.flag"), "w") as f:
                f.write("SProcess failed\n")
            continue
        end_time = time.time()
        elapsed = end_time - start_time
        print(f"Run {i + 1} completed! time customed {elapsed:.2f} s ({elapsed / 60:.2f} min)")


