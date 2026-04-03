# 2024_Quantum_Limits_Contact_Resistance_Ballistic_Transport_Akinwande.pdf

nature electronics
Volume 8 | February 2025 | 96–98 | 96
https://doi.org/10.1038/s41928-024-01335-5
Comment
The quantum limits of contact resistance 
and ballistic transport in 2D transistors
Deji Akinwande, Chandan Biswas & Debdeep Jena
The development of transistors based on 
two-dimensional semiconductors requires 
a consistent approach to calculating and 
evaluating quantum contact resistances.
The development of silicon transistor technology via dimensional 
downscaling is rapidly approaching its physical limits. As a result, 
two-dimensional (2D) semiconductors are of increasing interest in 
the development of next-generation energy-efficient electronics. 
Such atomically thin semiconductors can be used to reduce the chan-
nel length of field-effect transistors (FETs), maximizing current while 
reducing operational voltage and power. In highly engineered 2D FETs, 
channel lengths are now approaching the electron mean free path — 
around 10 nm for monolayer transitional metal dichalcogenides. 
Accordingly, charge transport is likely to approach dissipation-less 
ballistic transport.
In the ballistic limit, it is known that transport is limited by the con-
tact resistance (Rc) (ref. 1), which represents the interfacial resistance 
from the metallic contacts (considered reservoirs of electrons) to the 
semiconductor channel (which offers a limited density of states). As 
with most physical phenomena in solid-state physics that experience 
dimensional reduction, as the channel is scaled below the mean free 
path, the transistor resistance does not vanish but rather approaches 
a minimum or quantum resistance contact (Rcq) limit2. It is thus becom-
ing common in the community to use Rcq as a benchmark to judge the 
quality of contacts to scaled 2D semiconductors3–6. Eventually, for 
fully ballistic transport, the overall transistor device conductance 
under low-field operation will be around 1/Rcq, as demonstrated for 
graphene nanoribbons7.
There are, however, at least three different formulas for Rcq for 
2D FETs made from the prototypical 2D semiconductor molybdenum 
disulfide (MoS2). The general width-normalized expression in all the 
formulas takes the form of the Landauer–Buttiker formalism with a 
unity transmission (T) factor (that is, no Schottky barrier)8:
RcqW =
h
2e2 (
1
Meff
) =
h
2e2 (
α
√n2D
)
(1)
where the prefix is the quantum resistance derived from Planck’s con-
stant, h, and the electron charge, e, including spin degeneracy (gs = 2). 
W is the channel width, Meff is the (effective) number of modes, n2D is the 
carrier density in the 2D semiconductor and α is a unitless parameter. 
To be precise, equation (1) represents ground-state conditions with an 
ideal parabolic dispersion and is often used to benchmark the contact 
resistance in scaled devices.
In some work2,6, α = 2/π is used, resulting in RcqW ≈ 26/√n2D; in other 
work4, α = √π/2 is used, resulting in RcqW ≈ 36/√n2D; and in other work1, 
α = √π/2 is used, resulting in RcqW ≈ 51/√n2D. Perhaps owing to this 
ambiguity, some work3 has used α = √π/2 in one place (the discussion) 
and α = √π/2 in another (the benchmarking plot). (n2D and RcqW are in 
units of 1013 cm−2 and Ω μm, respectively.)
To help advance the study of contacts and ballistic transport in 2D 
semiconductors — and prevent erroneous conclusions — it is essential 
that we have a precise and consistent formula.
Exact derivation of quantum contact resistance
An exact ground-state expression for Rcq can be derived via several 
methods. These include the semiclassical analysis of ballistic trans-
port, which was used by Sharvin to study the ballistic conductance of 
a classical point contact in metal physics in the 1960s9, and the later 
Landauer–Buttiker formalism, which is used in mesoscopic physics 
to study quantized transport such as quantum point contacts10. Here 
we use a continuum analysis that derives from band transport with no 
assumptions except for ground-state temperature.
For a 2D semiconductor connected to ideal source/drain contacts 
(T = 1), the application of an external energy stimulus (∆) perturbs the 
Fermi–Dirac step function about the Fermi energy (EF). Employing an 
n-type semiconductor as a model and requiring degenerate doping 
(EF > conduction band minimum (CBM)) to ensure band transport, 
the resulting near-equilibrium net current (I) is due to states within ∆ 
of the Fermi surface (Fig. 1a):
I = 2eA
L gv
EF+∆
∫
EF−∆
g (E)
2
⟨v (E) cos θ⟩F (E −EF) dE,
(2)
where the factor of 2 in the numerator is for spin degeneracy, gv is for 
valley degeneracy, F(∙) is the Fermi–Dirac statistics and v(E) is the elec-
tron group velocity. A is the area — width (W) × length (L) — of the 
semiconductor channel. The area-normalized density of states per 
spin is g(E), where the factor of 1/2 indicates that only half of the states 
can contribute to the net current in the channel, say, positive velocity 
(right moving) states from source to drain (Fig. 1b). The average veloc-
ity, ⟨•⟩, is needed to account for the angular distribution of velocities 
at any constant energy surface in the band structure. In 2D space, this 
angular average is taken over a semi-circle representing the right mov-
ing momentum states (k) and is given by 
π/2
∫
−π/2
v (E) cos θdθ = (2/π)v (E).
Equation (2) can be reduced to a more fundamental expression by 
replacing band properties, g(E) and v(E), with their basic definitions:
I = 2eWgv
π
EF+∆
∫
EF−∆
(dN
dE ) ( 1
ℏ
dE
dk ) F (E −EF) dE,
(3)
where ħ is the reduced Planck’s constant and N is the area-normalized 
number of states, N = k2/4π. Afterwards, Rcq can be expressed in terms 
 Check for updates
nature electronics
Volume 8 | February 2025 | 96–98 | 97
Comment
have demonstrated that semimetal contacts (such as Bi and Sb) can 
avoid metal-induced gap states caused by metal–transition metal 
dichalcogenide contact. This approach could be suitable for realizing 
dissipation-free ballistic transport.
In reports on advanced 2D FETs, there is currently a practice to use 
Rcq as a metric to benchmark individual contacts1–6, which is a desir-
able trend towards extracting the maximum current density in scaled 
devices. However, Rc is compared with Rcq in these reports featuring oth-
erwise diffusive channel lengths. We argue that the precise comparison 
is to contrast 2Rc with Rcq, reflecting the underlying quantum physics. 
Precise comparison also avoids the eventual scenario of a truly ballistic 
experimental 2D FET, whose total resistance will then be around 2Rc; 
the current practice of using Rc will then result in an error of about 2.
Using 2Rc as the appropriate experimental metric, we benchmark 
it to Rcq for recent reports of advanced 2D FETs (Fig. 2), which indicates 
a wider gap to the theoretical quantum limit than currently believed. 
Ultimately, to advance 2D FETs, the total resistance should be reported 
and compared with Rcq for near-ballistic or ballistic devices5. Indeed, 
the ballistic ratio or ballisticity parameter (β) — a metric to quantify 
the degree to which carrier-density dependent transport is ballistic — 
could be redefined as β = 2Rc /Rtot, which has a maximum of unity. This 
ballisticity parameter based on contact resistance measurements 
could be helpful to experimentalists in assessing transport in scaled 
2D transistor devices.
Outlook
This article makes two key points, that the analysis and development of 
2D transistors requires, (1) consistent use of the appropriate formula 
and value of the quantum limit of the ballistic contact resistance, and 
(2) the benchmarking of the total contact resistance (2Rc) — rather than 
Rc — to the quantum limit. On the basis of Rcq, the maximum available 
current density in scaled ballistic 2D channel devices is estimated to 
exceed 3 mA μm−1, indicating considerable room for improvement com-
pared with contemporary 2D FETs. Evidence of ballistic transport can 
be established with temperature-independent or length-invariant cur-
rent measurements, which can be supplemented with a total resistance 
profile that should feature an inverse dependence on the square root 
of the derivative of F(∙), which becomes a Dirac-delta function (δ) owing 
to the step profile of the ground-state Fermi–Dirac statistics:
R−1
cq = dI
dV = 2e2
h
Wgv
π
EF+∆
∫
EF−∆
k (E) δ (E −EF) dE = 2e2
h (Wgv
π kF) .
(4)
The item in parenthesis can be considered Meff. This 
equation reveals that transport is determined by the Fermi momen-
tum (kF), channel width and the valley degeneracy. Indeed, the case 
for gv = 1 is the Sharvin conductance of a ballistic point contact in two 
dimensions9,10.
It is also helpful to express kF in terms of the carrier density, a more 
controllable parameter in experimental devices. Considering a para-
bolic dispersion, kF = √2πn2D/gv, this leads to:
RcqW =
h
2e2 (√
π
2
1
√gv n2D ) ≈
51
√gv n2D Ω μm
(5)
where n2D is in units of 1013 cm−2. This result is the particular d = 2 case 
of a generalized d-dimensional quantum contact resistivity given by
ρcq ≈h
e2 ( 1
d1/6
1
(gsgv)
1/d
1
(nd)
(d−1)/d )
(6)
The derivation of this general result will be presented in a separate 
work.
Rcq metric for contact resistance and ballistic transport
In the case of semiconductors with a single valley (gv = 1), RcqW ≈ 51/√n2D, 
in agreement with (equation (6.3.8) in ref. 11). Examples include 2D 
heterostructure quantum wells made from semiconductors with a 
minimum at the Γ point such as GaAs or some p-type monolayer tran-
sitional metal dichalcogenides with strong spin–orbit coupling, which 
lifts the valence band valley degeneracy per spin at the K points of the 
Brillouin zone. However, for monolayer MoS2 and similar transitional 
metal dichalcogenides, the CBM is at the K point of the Brillouin zone 
and has a valley degeneracy of 2. Hence, RcqW ≈ 36/√n2D is the appropri-
ate formula. Inversion layers in silicon due to quantization also have 
double degeneracy for the CBM11.
It is also worth reflecting on the meaning of Rcq and its application 
to transistor devices, whose total resistance (Rtot) consists of the semi-
conductor channel (Rchannel) plus its source/drain contacts (Rc): 
Rtot = 2Rc + Rchannel. A common assumption is that the two contacts 
to the channel are symmetric, yielding a total contact resistance of 2Rc.
Historically, Sharvin’s analysis of ballistic transport through a nar-
row constriction with semi-infinite electrodes9 showed that the point 
contact conductance was the total conductance of the constriction 
determined by the number of available momentum states at the Fermi 
level and width. Subsequently, quantization of the conductance of the 
quantum point contact made from a GaAs–AlGaAs semiconductor 
mesoscale constriction was reported10; this quantum conductance 
was also understood to be the total conductance of the semiconductor 
constriction12. Similarly, this has been the case for two-point conduct-
ance measurements of ballistic graphene nanoribbons7.
In this regard, for scaled semiconductors, Rcq should be inter-
preted as the total resistance in the limit of ballistic transport with 
ideal Schottky-barrier-free interfaces. In this limit, Rcq = 2Rc as the 
channel becomes dissipation free. Furthermore, recent reports3,4,6 
∆V
kx
ky
KF
∆k
θ
θ
e
e
W
∆ I
Source
Channel
Drain
L
b
a
Fig. 1 | Fermi surface and transport in a ballistic channel. a, The Fermi surface in 
2D momentum space. The ballistic current in the x direction is from the angular 
average of the momentum states in the shaded area activated by the external 
electric potential. The Fermi wavevector and electric potential difference are 
denoted as KF and ΔV, respectively. b, Transport in a ballistic channel of width, W, 
and length, L, connected to source and drain contacts serving as ideal electron 
reservoirs. The illustration depicts two forward trajectories: one in a straight 
path, and the other at an angle (θ) that undergoes specular reflection.
nature electronics
Volume 8 | February 2025 | 96–98 | 98
Comment
of the carrier density at low temperatures. Future theoretical analysis 
should consider deriving compact analytical formulas including the 
effects of band non-parabolicity and temperature on the quantum 
limit of ballistic contact resistance, which will better reflect practical 
2D materials at operational conditions.
Deji Akinwande 
  1 
, Chandan Biswas 
  1 & Debdeep Jena 
  2
1Microelectronics Research Center, The University of Texas at Austin, 
Austin, TX, USA. 2Electrical and Computer Engineering, and Materials 
Science and Engineering, Cornell University, New York, NY, USA.  
 e-mail: deji@ece.utexas.edu
Published online: 7 February 2025
References
1.	
Wang, Y. & Chhowalla, M. Nat. Rev. Phys. 4, 101–112 (2022).
2.	
Jena, D., Banerjee, K. & Xing, G. H. Nat. Mater. 13, 1076–1078 (2014).
3.	 Li, W. et al. Nature 613, 274–279 (2023).
4.	 Shen, P.-C. et al. Nature 593, 211–217 (2021).
5.	
Jiang, J., Xu, L., Qiu, C. & Peng, L.-M. Nature 616, 470–475 (2023).
6.	 Mondal, A. et al. Nat. Nanotechnol. 19, 34–43 (2024).
7.	
Baringhaus, J. et al. Nature 506, 349–354 (2014).
8.	 Buttiker, M., Imry, Y., Landauer, R. & Pinhas, S. Phys. Rev. B. 31, 6207–6215 (1985).
9.	
Sharvin, Y. V. J. Exp. Theor. Phys. 16, 517 (1965).
10.	 van Wees, B. J. et al. Phys. Rev. Lett. 60, 848 (1988).
11.	 Datta, S. Quantum Transport: Atom to Transistor (Cambridge Univ. Press, 2005).
12.	 van Houten, H., van Wees, B. J. & Beenakker, C. W. J. in Physics and Technology of 
Submicron Structures (eds Heinrich, H. et al.) 198–207 (Springer, 1988).
Acknowledgements
This work was supported in part by a National Science Foundation (NSF) Future of 
Semiconductors (FuSe) grant 2329191, and by Samsung. D.A. acknowledges the Cockrell 
Family Regents Chair Professorship. D.J. acknowledges the support of the Joint University 
Microelectronics Program (JUMP) from DARPA and the Semiconductor Research 
Corporation (SRC).
Author contributions
D.A. led the comment analysis with technical contribution from D.J. Data representation was 
performed by C.B. The Comment was written by all authors.
Competing interests
The authors declare no competing interests.
Additional information
Supplementary information The online version contains supplementary material available at  
https://doi.org/10.1038/s41928-024-01335-5.
Peer review information Nature Electronics thanks the anonymous reviewers for their 
contribution to the peer review of this work.
1
0.1
101
102
103
104
105
Semimetal contacts
Types of contact with
monolayer MoS2
Sb/MoS2 (ref. 3)
Metal contacts
 Au/In/MoS2 (ref. 1 in SI)
 Au/MoS2 (ref. 2 in SI)
 Au/MoS2 (ref. 3 in SI)
 Au/MoS2 (ref. 4 in SI)
 In/MoS2 (ref. 7)
 Ni/MoS2 (ref. 5 in SI)
 Au/Ag/MoS2 (ref. 6 in SI)
 Au/Al /Cr/doped-MoS2
(ref. 7 in SI)
 Sn/MoS2 (ref. 8 in SI)
 Ti/MoS2 (ref. 2 in SI)
1D edge contact
Graphene-edge
/MoS2 (ref. 9 in SI)
Junctionless contact
 1T-MoS2/MoS2 (ref. 10 in SI)
Tunnelling contact
 Au/Co/hBN/MoS2 (ref. 11 in SI)
 Au/Al/Al2O3/MoS2 (ref. 12 in SI)
Metal alloy contact
 In-Au alloy/MoS2 (ref. 13 in SI)
 Sn-Au alloy/MoS2 (ref. 13 in SI)
Width
Contact
Contact
Semimetal region
Quantum limit
n2D (1013 cm−2)
2Rc (Ω µm)
Rcq
Bi/MoS2 (ref. 6)
Bi/MoS2 (ref. 6)
Bi MoS2 (ref. 4)
Fig. 2 | Benchmarking of total contact resistance, 2RC, versus n2D plot of 
experimental MoS2 monolayer transistors. Total contact resistance, 2RC, 
rather than RC, is the appropriate parameter to compare with the ground-state 
ballistic quantum limit. Semimetal contacts currently provide the lowest 
contact resistances approaching the quantum limit. All measurements were 
reported at room temperature, except the Bi/MoS2 data (red connected circles), 
which was reported at 15 K. The inset image illustrates a typical transistor 
configuration. See Supplementary Information (SI) for specific values and 
references for data points.
