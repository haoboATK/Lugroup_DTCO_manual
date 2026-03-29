#include "PMIModels.h"
#include <cmath>

class Masetti_DopingDepMobility : public PMI_DopingDepMobility {

protected:
const double T0;
double k, Lch;

public:
  Masetti_DopingDepMobility (const PMI_Environment& env,
                            const PMI_AnisotropyType anisotype);

  ~Masetti_DopingDepMobility ();

  void Compute_m
    (const double n, const double p,
     const double t, double& m);

  void Compute_dmdn
    (const double n, const double p,
     const double t, double& dmdn);

  void Compute_dmdp
    (const double n, const double p,
     const double t, double& dmdp);

  void Compute_dmdt
    (const double n, const double p,
     const double t, double& dmdt);

};

Masetti_DopingDepMobility::
Masetti_DopingDepMobility (const PMI_Environment& env,
                          const PMI_AnisotropyType anisotype) :
  PMI_DopingDepMobility (env, anisotype),
  T0 (300.0)
{
}

Masetti_DopingDepMobility::
~Masetti_DopingDepMobility ()
{
}


void Masetti_DopingDepMobility::
Compute_m (const double n, const double p,
           const double t, double& m)
{
  double mob;

  mob = k * Lch;

  if (mob < 1.0) {
    m = 1.0;
  }
  else if (mob > 10000.0) {
    m = 10000.0;
  } 
  else {
    m = mob;
  }

//  std::cout << "k= " << k << "\n";
//  std::cout << "L= " << Lch << "\n";
//  std::cout << "BAL Mob= " << mob << "\n";
//  std::cout << "BAL Mob= " << m << "\n";
}

void Masetti_DopingDepMobility::
Compute_dmdn (const double n, const double p,
              const double t, double& dmdn)
{
  dmdn = 0.0;
}

void Masetti_DopingDepMobility::
Compute_dmdp (const double n, const double p,
              const double t, double& dmdp)
{
  dmdp = 0.0;
}

void Masetti_DopingDepMobility::
Compute_dmdt (const double n, const double p,
              const double t, double& dmdt)
{
  dmdt = 0.0;
}


class Masetti_e_DopingDepMobility : public Masetti_DopingDepMobility {
public:
  Masetti_e_DopingDepMobility (const PMI_Environment& env,
                               const PMI_AnisotropyType anisotype);

  ~Masetti_e_DopingDepMobility () {}
};

Masetti_e_DopingDepMobility ::
Masetti_e_DopingDepMobility (const PMI_Environment& env,
                             const PMI_AnisotropyType anisotype) :
  Masetti_DopingDepMobility (env, anisotype)
{
  // default values
  k = InitParameter ("k_e", 20.0);
  Lch = InitParameter ("Lch", 1.0e4);
}


class Masetti_h_DopingDepMobility : public Masetti_DopingDepMobility {
public:
  Masetti_h_DopingDepMobility (const PMI_Environment& env,
                               const PMI_AnisotropyType anisotype);

  ~Masetti_h_DopingDepMobility () {}
};

Masetti_h_DopingDepMobility ::
Masetti_h_DopingDepMobility (const PMI_Environment& env,
                             const PMI_AnisotropyType anisotype) :
  Masetti_DopingDepMobility (env, anisotype)
{
  // default values
  k = InitParameter ("k_h", 20.0);
  Lch = InitParameter ("Lch", 1.0e4);
}


extern "C"
PMI_DopingDepMobility* new_PMI_DopingDep_e_Mobility
  (const PMI_Environment& env, const PMI_AnisotropyType anisotype)
{
  return new Masetti_e_DopingDepMobility (env, anisotype);
}

extern "C"
PMI_DopingDepMobility* new_PMI_DopingDep_h_Mobility
  (const PMI_Environment& env, const PMI_AnisotropyType anisotype)
{
  return new Masetti_h_DopingDepMobility (env, anisotype);
}


