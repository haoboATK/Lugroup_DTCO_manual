# 2020_2D_materials_for_spintronic_devices.pdf

REVIEW ARTICLE
OPEN
2D materials for spintronic devices
Ethan C. Ahn
1✉
2D materials are attractive for nanoelectronics due to their ultimate thickness dimension and unique physical properties. A wide
variety of emerging spintronic device concepts will greatly beneﬁt from the use of 2D materials, leading a better way to
manipulating spin. In this review, we discuss various 2D materials, including graphene and other inorganic 2D semiconductors, in
the context of scientiﬁc and technological advances in spintronic devices. Applications of 2D materials in spin logic switches, spin
valves, and spin transistors are speciﬁcally investigated. We also introduce the spin-orbit and spin-valley coupled properties of 2D
materials to explore their potential to address the crucial issues of contemporary electronics. Finally, we highlight major challenges
in integrating 2D materials into spintronic devices and provide a future perspective on 2D materials for spin logic devices.
npj 2D Materials and Applications  (2020) 4:17 ; https://doi.org/10.1038/s41699-020-0152-0
INTRODUCTION
The unprecedented success of silicon-CMOS technology has been
primarily driven by transistor scaling. The early era of Dennard
scaling1,2 had two important consequences for modern comput-
ing systems; speed performance has been improved by scaling of
physical dimensions while power density has been kept practically
constant by scaling of voltages. However, since around 2005, the
voltage scaling has become a challenging task3 because further
reduction of the supply voltage (requiring the threshold voltage to
be simultaneously decreased to maintain the capability to drive
high current) was leading to an exponential increase in the
leakage current. This is due to the fundamental limit of
subthreshold swing (SS) greater than 60 mV/decade at room
temperature, which arises from the Boltzmann statistics that
govern the thermionic operation of conventional MOSFETs4.
Although tunnel FETs5–7, negative capacitance FETs8–10, and
electrostrictive FETs11,12 have recently emerged as novel device
concepts for steep SS, they still require much work to improve the
device performance and/or answer fundamental questions on
scalability, reliability, and viability. On the other hand, scaling of
physical dimensions still continued until today, towards the
technology nodes of 5 nm and beyond13,14. This led to an
inevitable increase in power density in high-performance micro-
processors, thus requiring complex power management techni-
ques15,16. In view of this, spintronics, which utilizes the quantum
mechanical property of elementary particles, called spin, has the
potential to become an innovative pathway beyond transistor
scaling to satisfying the speed and energy-efﬁciency needs of the
emerging computing paradigm (e.g., neuromorphic17,18 or quan-
tum19,20 computing).
Spintronics is an emerging form of electronics that harnesses
the intrinsic angular momentum (spin) of electrons, leading
researchers to treat them as tiny bar magnets with strong
magnetic moment (Bohr magneton, μB ~ 10−23 Am2). Immediately
after the discovery of giant magnetoresistance (GMR) in 1988 (the
GMR ratio of 10–50%, as compared with the anisotropic MR effect
of at most a few percent at that time)21,22, which has been the
foundation for constructing the hard-drive read head, research on
nanomagnetism and spintronics has made remarkable strides
over the last few decades. In 1991, the oscillatory behavior of the
interlayer exchange coupling was formulated in terms of the
Fermi surface of the spacer material23,24, leading a way to
constructing a synthetic magnetic free layer in the modern
magnetic tunnel junction (MTJ) device25,26. The concept of “spin
valve” ignited numerous research efforts exploring the ferromag-
netic sandwiches spaced by a nonmagnetic metallic layer27,28;
logical “1” or the high-resistance state is represented by the
antiparallel conﬁguration of two ferromagnetic layers while logical
“0” or the low-resistance state is dictated by the parallel
conﬁguration. This is an important milestone in spintronics
because spin valve currently serves as the most fundamental
building block for advanced spintronic devices. In 1995, insertion
of a thin insulator as the spacer layer (i.e., as the tunnel barrier)
resulted in a much higher read-out signal through the effect of
TMR (tunneling magnetoresistance)29, which continued to be
further optimized to reach 604% at room temperature in 200830.
Combined with the write mechanism of spin-transfer-torque (STT),
theoretically predicted in 199631,32 and observed in the experi-
ments of switching the magnetization direction33 and inducing
domain-wall motion34 or high-frequency oscillation35, both the
spin valve and MTJ structures (especially, MTJs employing the
crystalline MgO tunnel barrier36,37) have gained great attention in
the ﬁeld. The recent discovery of the perpendicular magnetic
anisotropy (PMA) in various heterostructure thin ﬁlms and
interfaces offered a new opportunity for low-power data storage
applications38–40. The reviving interest in the Hall effect41 will link
the spin Hall effect (SHE) with measurable quantities such as spin
accumulation, aiming at driving magnetization dynamics more
efﬁciently for the development of energy-efﬁcient spintronic
devices.
The ability of spintronics to perform previously impossible
experiments and test fundamental theories of magnetism has
recently been made possible through the use of 2D materials.
Layered materials have, indeed, existed for eons (i.e., studied
scientiﬁcally for more than 150 years42). However, only recently
have researchers begun to realize the true potential of these
layered materials for advanced technological applications. Each
layered material, when thinned down to its physical limits, exhibits
novel properties different from its bulk counterpart. Therefore,
these materials are speciﬁcally referred to as “2D materials”. The
most widely studied 2D material is graphene43, which is an
atomically-thin sheet of carbon atoms with a bonding length of
1.42 Å. Pristine graphene behaves as a zero-bandgap semimetal,
1Department of Electrical and Computer Engineering, The University of Texas at San Antonio, San Antonio, TX 78249, USA. ✉email: ethan.ahn@utsa.edu
www.nature.com/npj2dmaterials
Published in partnership with FCT NOVA with the support of E-MRS
1234567890():,;
constituting an important class of carbon allotropes exhibiting
unique 2D hexagonal structures. Readers interested in recent
advances and a broad range of commercial applications of
graphene will ﬁnd the 2019 review article by Kong et al.44 an
excellent resource. A wide spectrum of other 2D inorganic
materials is also experiencing numerous research efforts owing
to their versatile crystal structures and physical properties,
including insulators
(e.g., hexagonal boron nitride, h-BN)45,
semiconductors (e.g., transition metal dichalcogenides such as
MoS2)46,47, superconductors (e.g., NbSe2)48, and even magnets
(e.g., CrI3)49.
This review discusses 2D materials in the context of spintronic
device technologies, focusing on their progress, prospects, and
challenges. We examine how 2D materials can be interfaced with
other classes of materials, including ferromagnets (FMs), to enable,
develop, and advance spintronic devices. Spin-dependent proper-
ties of 2D materials are also highlighted in terms of spin-orbit and
spin-valley couplings. Major challenges and future perspectives for
the development of spintronic devices using 2D materials are
ﬁnally discussed.
GRAPHENE FOR SPIN LOGIC
Among
various
device
concepts
for
beyond-CMOS
logic
switches50, spin-based, non-volatile digital logic51–58 (Fig. 1a) has
attained much attention because it offers the functionality at
lower power consumption by building logic units with magnetic
elements. In particular, the proposal of all-spin logic (ASL) switch51
has been considered to be quite attractive for a future computing
paradigm due to its potential for extremely low-power consump-
tion59,60. This is because, in the ASL, nonlocal spin currents61–63 are
used to selectively route communication signals between the
input and output magnets without spin-to-charge conversion
(Fig. 1b). However, a major challenge has been to develop a
suitable spin transport channel material that simultaneously
achieves a high spin injection efﬁciency (from FM to the channel
material) and a long-distance spin propagation (within the
channel material). Graphene, a hexagonal 2D arrangement of
sp2-bonded carbon atoms, may be uniquely suited for this
purpose due to its (1) relatively long spin diffusion length and
lifetime (theoretically predicted, and experimentally being exam-
ined) and (2) ability to be readily interfaced with other classes of
materials, including FMs.
Spin injection, transport, and relaxation in graphene
Graphene exhibits properties attractive for spintronic device
applications64,65. It has intrinsically low spin-orbit coupling (SOC);
at the Γ point, the spin-orbit splitting of the σ band is calculated to
be as low as 8.8 meV66,67. This can lead to spin coherence
maintained over the long distance. Graphene also features ultra-
high
carrier
mobility
of
reaching
up
to
more
than
200,000 cm2V−1s−1 in a suspended device structure68, which
can enhance the diffusive transport of spin. Advances in spin
injection into graphene, experimental determination of spin
transport properties of graphene, and understanding of the
spin relaxation mechanism in graphene will ultimately contribute
to the development of the spin logic device adopting graphene as
a spin transport channel.
Nonlocal spin valve (NLSV)
The NLSV63,69 is the most commonly used device geometry for
generating pure spin currents. When the spin-polarized current is
injected from a FM contact into a channel material, the
accumulated spin in the vicinity of the FM/channel interface can
diffuse laterally, thus forming a pure spin current. This nonlocal
spin current constitutes a key part of the ASL switch, enabling the
input logic bit to control the state of the corresponding output
through the spin-torque mechanism70. Moreover, the spin-
dependent properties of graphene have been quantitatively
understood by measuring the NLSV built upon graphene71,
consisting of two FM (one as a spin injector and the other as a
spin detector) and two corresponding nonmagnetic (NM) metallic
contact electrodes integrated on top of the graphene spin
transport channel (Fig. 2a). In this graphene-based NLSV structure,
sweeping the in-plane magnetic ﬁeld (Hy) allows both parallel and
antiparallel conﬁgurations of two FM electrodes with different
shape anisotropy, thus resulting in the nonlocal spin signal, ΔRNL
= ΔVNL/I (Fig. 2b). ΔVNL is the nonlocal voltage difference between
parallel and antiparallel states of two FMs measured at the FM
detector side (ΔVNL = VNL
P – VNL
AP) and I is the injection current
through the FM injector. This four-terminal measurement geo-
metry is called nonlocal because the voltage is measured “outside”
the (charge) current loop. One key advantage of this NLSV
geometry is that background noise signals from charge currents
are greatly reduced due to the absence of net charge ﬂow.
Importantly, the nonlocal spin signal will only be dependent on
the relative orientation of the FM detector’s spin with respect to
those accumulated at the FM injector. Thus, it is possible that ΔRNL
is measured by varying the injector and detector separation (L)
because the magnitude of spin accumulation will decay as it
diffuses away from the injection point, with a characteristic length
known as spin diffusion length (LD). This is described by the
Fig. 1
Spin logic devices. a Reconﬁgurable spintronic logic gate52,
showing a NAND operation between X and Y. A and B are chosen to
be “1” for NAND, but one may adjust the magnetization alignments
of A and B to set different logic operations. The output is given by a
transient current response, IM(t), whose amplitude is proportional to
the spin accumulation in the semiconductor. A transient current is
allowed to pass through the probing contact (M) during the
magnetization rotation, where the potential level inside M is
perturbed and the capacitor (CM) tries to restore the new steady-
state condition (IM = 0). In order to write the magnetization
directions of the contacts in cascaded logic gates, IM(t) needs to
be converted to a binary voltage signal. Vdd is the supply voltage.
b All-spin logic (ASL) switch51, where nonlocal pure spin currents
transport information between nanomagnets (i.e., digital spin
capacitors). The state of the output magnet is determined by two
spin torques with the information provided from the input magnet:
one relatively large torque is exerted by the application of Vsupply
and the other small torque is exerted by the application of Vbias (for
“receive” and “send” respectively, in the cascaded logic gates). 1:
magnetic free layer, 2: isolation layer (electrostatic barriers or
insulation layers), 3: tunneling layer (oxides or Schottky barriers), 4:
spin-coherent channel, 5: contact, 6: spacer layer, and 7: magnetic
ﬁxed layer. Image of a reprinted by permission from Springer Nature:
ref. 52, Copyright 2007. Image of b reprinted by permission from
Springer Nature: ref. 51, Copyright 2010.
E.C. Ahn
2
npj 2D Materials and Applications (2020)  17 
Published in partnership with FCT NOVA with the support of E-MRS
1234567890():,;
equation below (Eq. 1)69.
ΔRNL ¼ η2LD
2Wσ exp L=LD
ð
Þ
(1)
In this equation, σ is the conductivity, W is the width of the
graphene channel, and L is the contact spacing. η is the spin
injection efﬁciency, often represented by the spin polarization of
the injection current ðImajorityIminority
ImajorityþIminorityÞ, where majority (minority)
means the spin direction parallel (antiparallel) to that of the FM
injector. Fundamentally, η is directly related to the spin polariza-
tion of the FM contact electrode ðDOSmajorityDOSminority
DOSmajorityþDOSminorityÞ, where DOS is
the density of states at the Fermi level, modulated by any
presence of spin-ﬂip scattering at the FM/channel interface. It is
noted that above deﬁnitions, including Eq. 1 and spin polarization
of FM electrodes, are only valid for the case of tunnel barrier
contacts.
The graphene-based NLSV also enables a precise characteriza-
tion of spin precession signals in graphene by applying an out-of-
plane magnetic ﬁeld and then measuring the nonlocal resistance
(RNL) as a function of the magnetic ﬁeld strength (the Hanle
effect61,72) (Fig. 2c). Many experimental studies on the spin
transport parameters of graphene have been performed by
conducting the Hanle measurement in the nonlocal geometry
because the Hanle spin precession curve is a strong indicator of
pure spin currents in graphene. The Hanle measurement offers a
more reliable way to study spin transport in graphene because the
approach based on Eq. 1, requiring the NLSV device structure to
be repeatedly fabricated for varying the separation distance, often
encounters a signiﬁcant challenge in reproducing the same FM/
graphene tunnel contacts73. The spin lifetime (τs) and the spin
diffusion constant (Ds) can be extracted as ﬁtting parameters to
the following equation (Eq. 2)61,72,74.
RNL / ±
Z 1
0
1
ﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
4πDst
p
exp  L2
4Dst


cos ωt
ð
Þexp  t
τs


dt
(2)
Here, the +(-) sign is for the parallel (antiparallel) magnetization
state, and ω is given by gμBB?=h, where g is the Landé factor
(g = 2.0023) and h is the reduced Planck’s constant. Once τs and
Ds are determined from the Hanle measurement and analysis, the
corresponding spin diffusion length (LD) can be calculated by
LD = (Dsτs)1/2.
Spin injection into graphene
The difﬁculty in utilizing the conventional semiconductor materi-
als (e.g., silicon) for emerging spin logic applications arises from
the facts that (1) their spin transport properties tend to degrade
with the decreasing ﬁlm thickness (i.e., poor scalability)75, and (2)
the spin injection from a FM metal contact into a semiconducting
channel material has been a great challenge due to a fundamental
conductivity (or mode) mismatch problem76. Noticeably, a recent
experimental study has reported that graphene can transport spin
signals over a relatively long distance of up to 30.5 µm77 (this
distance can be increased even up to 90 µm using carrier drift78). If
spin injection from the FM electrode into the graphene channel
can be made with a high injection efﬁciency, the use of graphene
as a spin transport channel may be considered as a practically
viable route for the development of emerging spin logic devices.
Since the ﬁrst demonstration of spin transport in graphene at
room temperature in 200771, spin injection efﬁciency into
graphene has been continuously improved. Inserting a thin
tunnel barrier (TB) at the FM/graphene interface has been widely
used to mitigate the conductivity mismatch problem and, thus,
increase the spin injection efﬁciency into the graphene layer.
Injection efﬁciencies of up to ~30% have been experimentally
demonstrated using a variety of TB materials such as TiO2
79,80,
MgO81, TiO2-seeded MgO82,83, h-BN84, and Al2O3
85–87 (Table 1).
More recently, even the ﬂuorinated graphene was used as a
homoepitaxial TB material to the graphene channel, achieving the
tunneling spin polarization of up to 60%88. It is worth, however,
noting that these TB-based approaches may still experience the
Fig. 2
Graphene nonlocal spin valve. a Schematics of the graphene nonlocal spin valve (NLSV), showing both the side and top view images
with graphene as a spin transport channel. FM and NM represent ferromagnetic and nonmagnetic metals, respectively. The spin transport
properties of graphene can be determined by measuring the difference in nonlocal resistances between parallel and antiparallel states of two
FMs (ΔRNL) with varying the injector and detector separation (L), or measuring the Hanle curve by applying an out-of-plane (Hz) magnetic ﬁeld
to induce a spin precession. b The nonlocal resistance measurement with the graphene NLSV that has the FM contact separation distance (L)
of 2.1 µm and the monolayer graphene channel width (W) of 2.2 µm82. Co (Cobalt) is used in this work to represent the four contact electrodes
(E1 through E4) with the MgO/TiO2 bilayer tunnel barrier inserted at the Co and graphene interface. The black (red) curve shows the nonlocal
resistance as the magnetic ﬁeld (H) is swept in the +y (−y) direction. ΔRNL will exponentially decay with the increasing separation distance.
c The Hanle spin precession curve for the same device structure, showing red (black) circles for parallel (antiparallel) alignment of the FM
electrodes82. The spin diffusion constant (D) and lifetime (τs) are extracted as the ﬁtting parameters to Eq. 2. Images of b and c reprinted with
permission from ref. 82 Copyright 2010 by the American Physical Society.
E.C. Ahn
3
Published in partnership with FCT NOVA with the support of E-MRS
npj 2D Materials and Applications (2020)  17 
above-mentioned issue of lacking the ability to reproduce the
same FM/graphene tunnel contacts. More studies will need to be
conducted to better quantify the spin polarization and understand
what extrinsic factors (e.g., bias-dependence) impact the experi-
mental measurements89–91.
Enhancing the spin injection efﬁciency is very important from
the power perspective; the lower spin injection efﬁciency means
that more charge currents would be pumped into the graphene
channel to form a sufﬁciently large spin accumulation that can
switch the corresponding output magnet. Most experimental
studies have used Eq. 1 to estimate the spin injection efﬁciency
parameter (η) by performing the NLSV experiment. A fundamental
limitation of this approach is that the measurement accuracy of η
will strongly depend on measurements of other parameters in the
equation. Most notably, the spin diffusion length (LD) of graphene
seems to largely vary among different studies (Table 1). Without
any further optimization or new development of the graphene
integration process (otherwise, the device integration process may
entail exposure of graphene surfaces to organic and/or inorganic
contaminants), this may impose a signiﬁcant challenge in making
the reliable measurement of spin transport parameters, conse-
quently limiting the accuracy of the spin injection efﬁciency
calculation. The next section below discusses the topic of spin
transport and relaxation in the graphene spin transport channel.
Spin transport and relaxation in graphene
Table 1 summarizes the experimental measurements of gra-
phene’s spin transport properties, with various substrate materials,
FM contact electrodes, TBs, and preparation methods. Taking a
close look at this table will provide several useful insights into the
spin transport phenomena in graphene.
First, as seen in Fig. 3a, the use of h-BN as a substrate for
graphene tends to increase the spin diffusion constant (Ds) of
graphene, thus enhancing the long-distance propagation of spin
signals in the graphene channel layer77,92,93. This is due to the
high carrier mobility in graphene, having h-BN as the substrate;
experiments
have
already
shown
that
the
measured
Hall
mobilities of graphene devices fabricated on the h-BN substrates
are
even
comparable
to
the
best-reported
values
of
the
suspended graphene devices94. By the Einstein relation, the high
carrier mobility leads to a high diffusion constant for charge
carriers. Consequently, the diffusion constant increases for spin
because spin current is carried by charged particles in the NLSV.
The graphene/h-BN or other 2D van der Waals (vdW) hetero-
structures95–97 may be considered as the high-performance spin
transport channel.
The phenomenon of spin relaxation in graphene can be
understood by examining Table 1 on how the spin transport
parameters
change
with
other
independent
variables.
For
example, investigation of a possible relation between spin lifetime
(τs) and charge carrier mobility (µ) has been a topic of great
scientiﬁc interest because it would help reveal the relevant spin
scattering mechanism. A linear dependence of τs on µ is
suggestive of the Elliott–Yafet (E.–Y.) spin scattering mechanism98,
while the inverse relation (τs ~ 1/µ) indicates the dominance of the
Dyakonov–Perel (D.–P.) mechanism99. A previous study on spin
relaxation in bilayer graphene ﬁlms on SiO2
100 observed a clear
inverse dependence of τs on µ, suggesting the D.–P. model as a
dominant mechanism that correlates the spin and charge
transports; spin phases are randomized between collisions as
electrons precess with different frequencies depending on their
momenta. However, as summarized in Table 1, it is possible that
both
the
E.–Y.
and
D.–P.
mechanisms
are
simultaneously
relevant80,92, or the E.–Y. scattering, where the precession
frequency is conserved between collisions and the phase loss
occurs only in the short time during collision, becomes a major
causative factor for spin relaxation in graphene83.
Table 1.
Summary of spin injection and transport properties of graphene.
FM/TB
η
Prep. method
Sub.
I.
Graphene mobility (cm2/Vs) Spin transport Parameters
Mecha.
Ref.
TB
Gr.
LD (µm) τS (ns)
DS (m2/s)
Co/TiO2
6%79
0.4 nm Ti, oxidation
Exfoliation h-BN
N
40,000
4.5
0.39
0.052
EY + DP
92
0.5 nm Ti, oxidation
Exfoliation SiO2
N
2,500
0.75
0.075
0.0075
–
79
0.4 nm Ti, oxidation
CVD
SiO2
Y
2,000
6
1.2
0.026
EY + DP
80
Co/MgO
30%82
1 nm MgO MBE
Exfoliation h-BN
Y
20,000
10
2
0.05
–
93
1.2 nm MgO MBE
Exfoliation h-BN
Y
20,000
30.5
12.6
0.074
–
77
–
Exfoliation SiO2
N
2,000
0.7
0.135
0.0032
DP
100
<3 nm MgO MBE
Exfoliation SiO2
N
3,000
–
<0.1
–
DP
81
0.8 nm MgO MBE
Exfoliation SiO2
Y
2,000
2.4
0.447
0.013
EY
83
0.8 nm MgO MBE
Exfoliation SiO2
Y
–
3
0.495
0.018
–
82
Co/Al2O3 10%78
1 nm Al2O3 Evaporation
Exfoliation Suspend N 100,000
2
0.2
0.02
DP
87
0.6 nm Al, Oxidation
Exfoliation SiO2
N
2,000
2
0.17
0.02
–
71
0.6 nm Al, Oxidation
Exfoliation SiO2
N
3,500
2
0.145
0.027
EY
86
Py/Al2O3
6%
ALD at 100 °C
Exfoliation SiO2
N
2,500
4.2
0.175
0.1
–
85
Py/h-BN
–
0.34nm h-BN
Exfoliation h-BN
N
2,300
1.1
0.055
0.034
–
84
Py/f-Gr.
63%
Fluorinated Gr. (with XeF2) CVD
SiO2
N
–
1.5
0.2
0.012
–
88
Spin transport parameters of graphene (LD, τS, DS) are experimentally measured at room temperature by using the four-terminal NLSV device geometry. Most
works directly measure two of these parameters via the Hanle effect61,72 (or the separation distance method69) and then calculate the other parameter based
on the fundamental relation of LD = (τSDS)1/2. Spin injection efﬁciency (η) is typically estimated by the spin polarization of the tunneling current (Eq. 1). FM/TB
indicates the type of ferromagnetic (FM) contact and tunnel barrier (TB) materials. Prep. method lists how each work prepares the tunnel barrier (TB) and
graphene (Gr.) channel materials. Most works used the mechanical exfoliation technique to integrate graphene into the NLSV device. The substrate type (Sub.)
is also shown for each work, implying that the use of h-BN tends to enhance spin transport characteristics due to increase in graphene mobility. The effect of
graphene interface treatment (see column I. for whether each study has employed any interface engineering techniques; Y for yes and N for no) on spin
transport properties is very noticeable, thus suggesting any further systematic study to elucidate the extrinsic origin of varying spin transport parameters in
graphene. Any proposed mechanism for spin relaxation is also shown in column Mecha.
E.C. Ahn
4
npj 2D Materials and Applications (2020)  17 
Published in partnership with FCT NOVA with the support of E-MRS
Another piece of information available from Table 1 is that τs
and LD values largely vary among different studies using the same
TB material. This indicates that the microscopic origin for such a
large discrepancy among various studies on spin transport in
graphene could be best understood by examining the experi-
mental
details
and
setups
of
each
study.
One
important
conclusion from such deep analyses is that some special
treatment of the graphene interface has resulted in signiﬁcant
improvement of the spin transport characteristics in graphene
(Fig. 3b). For example, the thermal annealing technique (@ 400 °C
in Ar/H2) that has been applied after transferring the CVD
(chemical
vapor
deposition)-grown
graphene
layer
yielded
signiﬁcantly higher τs and LD values of 1.2 ns and 6 µm,
respectively80, as compared with other similar studies using the
SiO2 substrate71,79,81–83,85,86,100. Furthermore, the highest values of
τs and LD ever reported to date (τs of 12.6 ns and LD of 30.5 µm)77
were obtained by synergistically combining the two interfacial
engineering techniques: (1) reversing the conventional NLSV
fabrication order (i.e., from graphene ﬁrst and then tunnel barrier,
to tunnel barrier ﬁrst and then graphene93), and (2) reducing the
contamination of the FM/TB/graphene interfaces77. More recently,
a few other works also reported spin transport in the CVD-grown
graphene over the long distance of larger than 30 µm101,102. It is
noted that τs and LD values, exceeding 100 ns and 100 µm,
respectively, have once been reported for epitaxial graphene on
SiC103. However, this experiment was conducted in the local, two-
terminal geometry, limiting the measurement accuracy. Therefore,
further research will need to be conducted to study if any
particular interface within the FM/TB/graphene tunnel junction is
responsible for signiﬁcant spin dephasing or ﬂipping. This will
ultimately help suggest practical solutions to achieve the excellent
spin propagation in graphene approaching the theoretically
predicted values (e.g., τs ~ a few µs)104–106.
Inducing magnetic moments in graphene
Fundamentally, pristine graphene is strongly diamagnetic as it
does not consist of d or f electrons. However, any possibility of
inducing magnetic moments in graphene has been the great
scientiﬁc and technological interest in the ﬁeld. In particular, from
the perspective of advancing the spin logic device, the existence
of atomically-thin permanent magnets would mean that conven-
tional FM thin ﬁlms can be replaced by a highly scalable, novel
spin injector (or detector) material. This is important because
conventional FM thin ﬁlms with thicknesses of less than 200 nm
typically
experience
noticeable
changes
in
their
magnetic
properties such as magnetic anisotropy107. It is also known that
for the magnetic thin ﬁlms even in the monolayer or few-layer
range, the magnetic ordering (Curie) temperature is strongly
affected by a variety of topological effects such as vacancies,
substrate roughness and atomic intermixing, and incomplete
crystal structures108.
Besides the recent discovery of 2D magnets49, the graphene
itself has experienced signiﬁcant research efforts to induce
magnetic moments by extrinsic factors. Introducing light adatoms
(point defects) such as hydrogen (H)109,110 or ﬂuorine (F)111,112 has
been the most popular approach to inducing localized magnetic
moments in graphene. This is possible because the hydrogen or
ﬂuorine can be reversibly chemisorbed on graphene113,114, thus
creating a sublattice imbalance by removing one pz orbital from
the π band. According to the Lieb’s theorem115, the single
hydrogen adatom can induce a quasi-localized state in graphene
with magnetic moment of 1μB. A recent theoretical study even
predicted that graphene in the form of quantum dots (e.g., zigzag
graphene nanoﬂakes) can exhibit strong edge magnetism at room
temperature due to the presence of localized edge states116.
Despite the fact that magnetic moments in graphene have been
experimentally observed by adopting the various techniques of
SQUID (superconducting quantum interference device, using the
Josephson junction to characterize the dependence of super-
currents on magnetic ﬁelds)111, MFM (magnetic force micro-
scopy)117,
and
nonlocal110
or
local112
spin
transport
measurements, making graphene permanently magnetic (beyond
just inducing the localized magnetic moments) still remains a
great challenge.
2D MATERIALS FOR MTJ AND TRANSISTORS
This section reviews recent experimental efforts to integrate 2D
materials in other equally-important classes of spintronic devices
—namely, MTJs and spin transistors. Owing to the unique ability
of 2D materials to gain the highly homogenous atomic control
over their thickness, researchers began to consider them as a
critical element for these emerging spintronic devices. Many
perspectives are being opened up in exploring the vast amount of
2D material family and their heterostructures, aiming to achieve
speciﬁc spin device properties.
MTJs
The MTJ is a modern spintronic device that can be used for
processing the bit information stored in the nanomagnet29.
Fig. 3
Spin transport properties of graphene. a Impact of graphene mobility on the spin diffusion constant (solid circles, left axis in the unit
of m2/s) and lifetime (empty triangles, right axis in the unit of nanoseconds) values. It is seen that spin diffusion constant tends to increase
when the graphene spin transport channel is prepared to be of high quality (high mobility). The dotted line is the ﬁtted curve to the data
points obtained from various studies in Table 1. Unlikely, the spin lifetime exhibits almost the negligible dependence on the graphene
channel’s mobility. b Impact of interface engineering on the spin diffusion length (solid circles, left axis in the unit of µm) and lifetime (empty
triangles, right axis in the unit of nanoseconds). Both the spin diffusion length and lifetime values are signiﬁcantly enhanced upon the various
interface engineering techniques used, such as annealing of the graphene surface80, the use of a large h-BN ﬂake to prevent diffusion of
solvents during the graphene transfer process77, and angle evaporation of the tunnel barrier oxides on the graphene surface82.
E.C. Ahn
5
Published in partnership with FCT NOVA with the support of E-MRS
npj 2D Materials and Applications (2020)  17 
The active area of MTJ typically consists of two FM electrodes with
a thin insulating barrier sandwiched between them. The spacer
layer is extremely thin (e.g., MgO in the nanometer or sub-
nanometer range), leading electrons to tunnel through it. The MTJ
has enabled the development of STT-MRAM (spin-transfer-torque
magnetic random-access memory) for high-performance data
storage and computing applications118–120, where spin-polarized
currents exert a STT to change the magnetization direction of a
nanomagnet. With its close-to-market position towards commer-
cialization (e.g., in 2019, Everspin announced the sampling of 1 Gb
STT-MRAM chips), STT-MRAM now becomes the most promising
candidate to replace SRAM to bring the emerging paradigm of
non-volatile embedded memory. However, further improvement
of device performances and bit-cell scaling are still the great
challenges due to issues related to controlling the TB and
interfaces, the thermal stability, and the robustness118. In this
context, 2D materials possess the potential to address some or all
of these issues because they offer a precise control of the ultimate
thickness while still affording sharp interfaces with other classes of
materials. This will allow 2D materials to serve as an atomically-
thin spacer layer in MTJ.
Graphene as a tunnel barrier
An early theoretical study on the FM/graphene interface121
triggered research on harnessing graphene as an atomically-thin
spacer layer in MTJ. This was driven by the facts that (1) the
in-plane lattice constant of graphene (2.46 Å) matches almost
perfectly that of (111) Co or Ni (the lattice mismatch between
them is only less than 1.3%), and (2) their electronic band
structures in the reciprocal space overlap at the Fermi level only
for one spin direction (spin ﬁltering). Indeed, the theoretically
predicted TMR ratio of the FM/graphene/FM stack was as high as
about 100% owing to the perfect spin ﬁltering effect37 assumed
for the FM/graphene interface. Although Mohiuddin et al.
demonstrated the ﬁrst experimental work, adopting the exfoliated
monolayer graphene in a Permalloy (NiFe)-based MTJ structure122,
the reported TMR ratio was only 0.4%. Many other follow-up
studies on the similar device stack, either using monolayer, bilayer,
or few-layer graphene or other 2D materials (e.g., MoS2, WS2, h-
BN), also produced the TMR ratios of less than a few percent123,124.
For example, Fig. 4a shows the magnetic hysteresis with TMR of
about 2% measured with the Co/graphene/NiFe structure124. This
is mainly due to the integration difﬁculties in inserting 2D
materials between oxidation-prone FM metals; unlike the conven-
tional in situ physical vapor deposition (PVD) process that
fabricates the whole MTJ stack without breaking the vacuum,
most of these previous works on FM/2D material/FM made the
bottom FM electrode exposed to air during the exfoliation or
transfer of 2D materials.
The existing strategic effort to prevent oxidation during the
fabrication of a graphene-inserted MTJ structure falls into three
major categories: inserting a thin buffer layer, the ﬂip-transfer
Fig. 4
2D Materials for MTJ. a The graphene-inserted magnetic tunnel junction (MTJ) device (top), and measured TMR characteristics
(bottom) at temperature of 4 K and with low bias voltages (125 and 250 µV) applied124. The CVD-grown graphene is transferred onto the
20 nm NiFe FM electrode. The arrows in the TMR graph indicate the relative orientation of the NiFe (lower) and Co (higher) FM contacts. b The
Co/h-BN/Fe MTJ device structure is fabricated by annealing the Fe substrate, then directly growing h-BN on the Fe catalytic substrate via
the low-pressure CVD technique (top), and ﬁnally depositing the 15 nm Co top electrode by evaporation128. The conductive AFM (atomic
force microscope) measurement yields the resistance values of 105 Ω for the Fe substrate and 107 Ω for the monolayer h-BN/Fe stack. The
relatively high TMR ratio of about 6% is reported in this work (bottom), arising from suppression of the FM electrode oxidation due to direct
CVD growth of h-BN on top of the FM electrode. c Monolayer TMD is used as the spacer layer in the ferromagnetic sandwich structure to result
in the spin valve effect132,134. The NiFe/MoS2/NiFe device with monolayer MoS2 grown by CVD and transferred by the wet process (top)132 and
the Co/WS2/NiFe device with the exfoliated single-layer WS2 (bottom)134 exhibit the magnetoresistance ratios of up to 0.73% and 0.47% at low
temperatures, respectively. Image of a reprinted with permission from ref. 124. Copyright 2012 American Chemical Society. Image of b used
from AIP Publishing with permission under a CC-BY 3.0128. Image of c (top) reprinted with permission from ref. 132. Copyright 2015 American
Chemical Society. Image of c (bottom) used from Springer Nature with permission under a CC-BY 4.0134.
E.C. Ahn
6
npj 2D Materials and Applications (2020)  17 
Published in partnership with FCT NOVA with the support of E-MRS
method, and the use of FM oxides. An example of the ﬁrst
category was to insert a thin noble metallic layer (e.g., Au) at the
FM/graphene interface, as shown in the early work of fabricating
the NiFe/graphene/Au/NiFe stack (from top to bottom) with the
graphene ﬂakes exfoliated onto the Au-coated NiFe electrode122.
The ﬂip-transfer method employed more complicated process
steps of exfoliating graphene on the substrate coated by the LOR
(lift-off resist)/PSS (poly (4-styrenesulfonic acid)) bi-layer, deposit-
ing the patterned NiFe electrode, separating the NiFe/graphene/
LOR stack from the substrate by dissolving the PSS layer in water,
and ﬂipping it onto another SiO2/Si substrate125. However, in both
the ﬁrst and second approaches, the obtained TMR ratios were still
limited to only about 5%. This was attributed to reduced spin
polarization due to the inserted 2 nm-thick Au layer122 and the
antiferromagnetic coupling between FM electrodes125, respec-
tively. In 2014, Li et al. used a FM half-metal oxide layer of
LaSrMnO3 (LSMO) to replace one of the conventional FM metal
electrodes, leading to the MTJ stack of Co/graphene/LSMO126.
Although LSMO is known to exhibit a very high spin polarization
(about 95%), this third approach also produced negligibly small
enhancement in the TMR ratio, due to contamination of the LSMO
interface during the graphene transfer process.
Other 2D materials as a tunnel barrier
h-BN, a wide-bandgap 2D dielectric, can possibly better serve as a
TB in MTJ due to its intrinsic insulating nature (bandgap energy,
Eg ~ 6 eV). Several recent works studied the FM/h-BN/FM struc-
tures with h-BN thin ﬁlms prepared by wet-transfer127 or direct
CVD growth onto the FM electrode128, yielding the TMR ratios of
up to 6% (Fig. 4b). The MBE (molecular beam epitaxy) technique
also enabled the direct growth of h-BN onto the FM layer129, thus
providing an alternative pathway to better tailoring the FM/2D
material interface and ultimately creating the MTJ structure having
the atomically-thin, robust TB. Despite these promising early
results on the direct growth of h-BN on FM128,129, it is noted that
both CVD and MBE growth of monolayer or few-layer h-BN crystals
would require in-depth investigation of the parameter space for
the speciﬁc FM substrate. For example, whereas graphene has
already been routinely synthesized by CVD on FM catalysts such as
polycrystalline Nickel (Ni), the CVD parameter space has only
recently been carefully tuned (e.g., lowing the temperature down
to about 450 °C) to ensure the monolayer growth of graphene on
Ni130,131.
In 2015, Wang et al. introduced the CVD-grown monolayer TMD
(MoS2) in MTJ132 (Fig. 4c), by using the Au-coated NiFe electrode
to minimize the same oxidation issue already encountered with
graphene and h-BN. In this work, the insertion of Au still led to
degradation of spin polarization in MTJ, thus producing only a
marginal increase in the TMR ratio (from 0.4% to 0.7%). The
technique of using the FM oxides was also employed to integrate
MoS2 with Fe3O4 electrodes133, but the spin signal still remained
far from expectations
(TMR ~0.2%). A more recent study
demonstrating the MTJ device with exfoliated WS2 ﬂakes (Fig.
4c) also resulted in a poor TMR ratio of 0.47% due to the oxidation
of the bottom FM electrode134. Collectively, the use of TMD
materials in MTJ seems still at early stage as compared with
graphene and h-BN, requiring more advanced studies in optimiz-
ing the MTJ integration process with TMD materials.
Spin transistors
Most spintronic devices discussed so far are passive in the sense
that they are not capable of amplifying an electrical signal. An
active spintronic device, if successfully implemented, can ﬁnd it
useful in signal processing, logic circuits, etc. A transistor is the
three-terminal (neglecting the body effect) active device where
the electrical current ﬂow between two terminals is modulated by
a voltage (or a current) applied to the third terminal. Inspired by
the seminal proposal of the Datta and Das spin modulator135,
many studies have been devoted to electrical control of the spin
current, which is key to implementing an emerging device
concept of spin transistor136,137. In spin transistor, owing to the
Rashba spin-orbit interaction (i.e., generation of an effective
magnetic ﬁeld by an electric ﬁeld applied to the gate terminal),
the spin injected from the source FM contact travels towards the
drain FM contact via Larmor precession. Typically, spin transistor is
normally ON (i.e., depletion mode) because no precession at zero
gate voltage leads to the spin direction parallel to the drain FM.
Varying the gate voltage can then alter the spin precession angle
to result in a periodic modulation of the source-to-drain current.
Although spin transistor promises performances of higher speed
and energy-efﬁciency than conventional transistors138, ﬁnding the
optimal device structure employing the best-suited materials for
each element still requires extensive research efforts. This may
open up new opportunities for 2D materials and vdW hetero-
structures
due
to
their
versatile
crystal
structures
and
functionalities.
TMD/graphene heterostructures as a spin channel
Yan et al. investigated the vdW heterostructure of graphene/MoS2
as a novel spin transport channel139. This study aimed to
synergistically combine the unique spin-related properties of
graphene and TMD; graphene allows a long-distance spin
transport due to its low SOC66,67 while TMD’s strong SOC,
originating from the d-orbitals of the heavy metal (the spin-orbit
splitting is 148 meV in monolayer MoS2)140, holds the potential to
effectively manipulate spin. In this work, graphene ﬂakes were ﬁrst
exfoliated onto a highly doped silicon substrate coated with a 300
nm-thick SiO2. Then, a few-layer MoS2 ﬂake was transferred by all-
dry viscoelastic stamping141 to create a gate-tunable spin sink.
Finally, several FM (Co) electrodes with TiO2 as the TB were
patterned and deposited to complete the NLSV geometry. As
shown in Fig. 5a, the central result was the demonstration of
tuning the spin current (dictated by the nonlocal resistance
measured in the NLSV) by varying the back-gate voltage (Vg)
applied to the substrate. For a negative Vg of less than −10 V, the
MoS2’s low sheet conductance made the spin current ﬂow well in
the adjacent graphene channel. For a positive Vg of higher than
10 V, the MoS2 sheet conductance increased to absorb much of
the spin current from graphene. The authors supported this
argument by estimating and comparing the spin resistances of the
graphene channel and the MoS2 spin sink. Despite the lack of
direct evidence of a link between the strong SOC and the
proposed spin absorption mechanism in few-layer MoS2, this work
featured the electrical manipulation of spin current at relatively
high temperatures (up to 200 K) and the well-deﬁned ON and OFF
states. The room temperature demonstration of the electrical
control of spin current in the similar MoS2/graphene hetero-
structure quickly followed up, with a clearer understanding of the
spin transport mechanism in such a vdW heterostructure142. The
great tunability of spin current was rather attributed to the gate
tuning of the Schottky barrier at the MoS2/graphene interface,
leading to the modulation of MoS2’s conductivity. For example, at
high gate voltages applied, the reduced Schottky barrier and
MoS2’s conductivity allowed spin to tunnel into MoS2, making it
dephasing due to the high SOC of the MoS2 channel.
It is also important to note that graphene, when interfaced with
TMD, exhibits a unique spin lifetime anisotropy (SLA) effect. The
SLA, deﬁned as the ratio of lifetimes for spins pointing out of the
graphene plane to those pointing in the plane, was theoretically
predicted to reach values of tens to hundreds in the TMD/
graphene heterostructures143. This phenomenon was experimen-
tally demonstrated in MoSe2/graphene144 and WS2 (or MoS2)/
graphene145 heterostructures, showing an order of magnitude
longer lifetime for out-of-plane spins (i.e., SLA~10). The SLA effect,
E.C. Ahn
7
Published in partnership with FCT NOVA with the support of E-MRS
npj 2D Materials and Applications (2020)  17 
while serving as direct evidence of strong spin-valley coupling in
the TMD material (this topic will be revisited in a later section),
may provide an alternative route for manipulating spin relaxation
in 2D material-based spintronic devices.
2D magnets to realize a spin tunnel transistor
A very recent effort to enable spin transistor by 2D materials led to
the development of a novel form of spin transistor—namely, spin
tunnel ﬁeld-effect transistor (spin TFET)146. In contrast to the
originally proposed (Datta and Das) spin transistor concept,
relying on the electrical control of spin current in the high SOC
channel material, spin TFET is constructed by incorporating the
emerging 2D magnetic crystal as the magnetic TB (Fig. 5b).
Among many 2D magnetic materials recently discovered49,147–152,
the layered magnetic insulator, CrI3, exhibits an intriguing
thickness-dependent magnetic order; monolayer CrI3 is a perpen-
dicular FM, whereas bilayer CrI3 is an antiferromagnet consisting
of two FM monolayers with antiparallel magnetic moments.
Importantly, under a moderate magnetic ﬁeld applied (less than
1 T), the bilayer CrI3 can even be switched to FM through a spin-
ﬂip transition. Moreover, one study demonstrated that switching
of bilayer CrI3 between antiferromagnetic and ferromagnetic
states can be induced by an electric ﬁeld153. Therefore, in this
study, the vertical junction of graphene/CrI3/graphene was
fabricated to examine the electrical switching behavior of CrI3,
interfaced with graphene top (source) and bottom (drain) contacts
(Fig. 5b). Alongside the earlier demonstrations of the spin ﬁltering
effect in CrI3, giving rise to the large TMR signal in tunnel
junctions154–156,
this
work
signiﬁcantly
advanced
the
spin
transistor research by presenting an ambipolar transistor behavior
with a high ON/OFF ratio approaching 400%. This was achieved by
electrically controlling (gate tuning) the magnetization conﬁgura-
tion of the 2D magnetic insulator, instead of directly modulating
the spin current.
SPIN-ORBIT COUPLING IN 2D MATERIALS
Spin-orbit coupling (SOC) refers to the relativistic phenomenon of
exerting a torque on the elementary particle with spin, approach-
ing the nearby atom to “feel” the orbital motion. SOC is
responsible for many inspiring physical properties of 2D materials,
including the room temperature quantum Hall effect (quantization
of Hall resistance under a large magnetic ﬁeld) observed in
monolayer graphene157,158. From the technological point of view,
SOC is of great importance because it provides an effective means
of generating a pure spin current even in nonmagnetic materials
via the SHE (spin accumulation with no Hall voltage)159. Indeed,
the room temperature SHE was recently observed in the
graphene/MoS2 vdW heterostructure (Fig. 6a)160, which is best
attributed to the valley-Zeeman type of SOC imprinted from TMD
to graphene (i.e., the proximity-induced enhancement of SOC in
graphene due to a weak hybridization with the heavy atoms in
TMD)161. The charge-to-spin conversion can also occur in the
graphene/TMD heterostructure via the Rashba-Edelstein effect
(due to the broken out-of-plane symmetry)162, which was recently
demonstrated with graphene in conjunction with the monolayer
WS2
163. The SOC-induced pure spin current is currently being
widely researched in the ﬁeld, for the purpose of developing the
advanced spin-orbit torque (SOT) devices such as SOT-MRAM164
and SHO (spin Hall oscillator)165. Most early experimental studies
on these devices interfaced FM with a heavy metal of large SOC
(e.g., Ta, Pt) to effectively induce magnetization switching or
oscillation. However, the state-of-the-art SHA (spin Hall angle, θSH,
an important metric for charge current-to-spin current conversion
efﬁciency) of heavy metals is limited to θSH of less than 0.1, with
greatly varying values among different studies166. This imposes a
signiﬁcant
challenge
in
developing
energy-efﬁcient,
high-
performance spintronic devices because the large SHA value
means that a large amount of charge currents will still need to be
supplied. This may offset the beneﬁts of using spin for electronics.
With the giant SOC-induced spin splitting already reported for
Fig. 5
2D materials for spin transistor. a The device schematic of MoS2/graphene heterostructure-based spin transistor (left) and measured
nonlocal resistances (Rnl) with a wide range of gate voltage biases (Vg) applied (right)139. For the nonlocal measurement, a DC current of 10 µA
is injected into graphene from the Co/TiO2 tunnel contact electrode. The measured nonlocal voltage (VNL) (and thus, resistance RNL = VNL/I)
varies with Vg due to the spin current (ﬂowing in graphene) modulation by the MoS2 spin absorber (sink). b The spin tunnel FET (spin TFET)
concept is proposed as an alternative way to implement spin transistor (left)146. Instead of controlling the spin current in the spin transport
channel, the spin TFET harnesses electrical switching of the magnetization conﬁguration (in much the same way as MTJ) to create the
transistor output. The recently discovered 2D magnet, bilayer CrI3, is used as the active switching medium due to its spin-ﬂip transition
behavior. The fabricated device offers a large ON/OFF conductance (G) ratio approaching 400% (right). Image of a used from Springer Nature
with permission under a CC-BY 4.0139. Image of b reprinted by permission from Springer Nature: ref. 146, Copyright 2019.
E.C. Ahn
8
npj 2D Materials and Applications (2020)  17 
Published in partnership with FCT NOVA with the support of E-MRS
TMD (as shown in Fig. 6b, the maximal spin splitting of the
uppermost valence band at the K point is as high as 456 meV for
WSe2 monolayer)140 and the relatively high SHA measured for
TMD (θSH ~ 0.14 for MoS2)167 and topological insulator (TI) (θSH of
up to 425 for (Bi0.5Sb0.5)2Te3 at 1.9 K)168, further research like the
recent work on the FM/TI heterostructure (see Fig. 6c for the SOC-
induced magnetization switching observed in Bi2Se3 ﬁlms)169 can
be committed to design, fabricate, and understand the ultralow-
power SOT devices enabled by 2D materials. A very recent
experimental work on the SOC enhancement in graphene by the
proximity effect of WS2 also provided the great promise for
practical device applications due to the electric-ﬁeld tunability
demonstrated170.
It is highlighted that with semi-metallic TMD materials with
reduced crystalline symmetry (e.g., WTe2
171), an out-of-plane SOT
can be generated to possibly induce magnetization reversal for
adjacent magnetic thin ﬁlms with PMA. The out-of-plane SOT that
exists exclusively for currents applied along a low-symmetry axis
has already been demonstrated for the (mechanically exfoliated)
WTe2/ (sputtered) Permalloy bi-layer structure171. This could
provide great ﬂexibility to the SOT device design in terms of
directions of charge current injection and spin current detection
(unlike the conventional settings of the heavy-metal/FM or high-
symmetry TMD/FM structures where the component of spin
torque is required to lie within the device plane to induce most
effectively the anti-damping switching). Indeed, PMA devices
attract much attention recently for high-density magnetic storage
device applications due to the fact that they can be scaled to small
sizes while maintaining thermal stability38–40. This new charge-to-
spin conversion mechanism through the TMD’s unique crystal
symmetries may enable a new strategy for optimizing future
spintronic device technologies. The possibility to achieve multi-
directional charge-to-spin conversion has also been demonstrated
using the low-symmetry TMD material (e.g., MoTe2
172 that appears
in semi-metallic, distorted 1T octahedral phases), where both the
conventional (i.e., spin polarization is orthogonal to charge
current) and unconventional (i.e., spin polarization is parallel to
charge current) conversions were detected in the graphene-based
NLSV structure172.
Using the valleys in 2D materials
Fundamentally, the phenomenon of spin polarization in conven-
tional FM metals originates from their unique band structure. In
the presence of the 3d energy band splitting with respect to the
Fermi level (i.e., DOSmajority is mostly ﬁlled up being located under
the Fermi level while DOSminority is mostly empty being located
above the Fermi level), only charge carriers with the majority spin
direction can pass through the FM layer because minority spin
carriers ﬁnd enough empty states in FM to scatter into. This
separation of charge carriers by spin has been best studied by the
anomalous Hall effect (AHE)173, where the measured Hall voltage
Fig. 6
Spin-orbit coupling in 2D materials. a The room-temperature spin Hall effect observed in graphene, in the proximity of high spin-orbit
coupling 2D material (MoS2)160. A charge current applied along the graphene/MoS2 stripe (y axis) results in a spin current with out-of-plane (z
axis) spin polarization in the graphene channel along the x axis. b Spin splitting (Δ in the unit of meV) of the WSe2 monolayer system, shown
in the momentum space along the Γ-Κ line for the uppermost valence band (left) and the lowermost conduction band (right)140. The bottom
panels show contributions of orbitals for Se (pz, px + py) and W (d3z2r2, dx2y2 + dxy). c The AFM image of a 10-QL (quintuple layers) Bi2Se3 ﬁlm
with a roughness of ~0.5 nm, prepared by the MBE technique (top)169. The white scale bar is 100 nm. MOKE (Magneto-optic Kerr Effect) images
are used to investigate the current-driven (i.e., SOT-driven) magnetization switching in the Bi2Se3/NiFe heterostructure (bottom)169. The
direction of magnetization is indicated by the white arrow. d The schematic drawing of photoinduced AHE driven by a net valley polarization
of MoS2 (i.e., valley Hall effect) (top), and the source-to-drain bias (Vx) dependence of the Hall voltage (VH) measured for the monolayer MoS2
transistor device (bottom)174. R-L (L-R) indicates the quarter-wave modulation with θ = 45° (−45°) where the polarization is modulated from
right-handed to left-handed (from left-handed to right-handed). No net Hall voltage is measured for the linear (half-wave s-p) modulation. No
noticeable Hall voltage is observed under R-L modulation for the bilayer MoS2 case (bilayer, R-L) due to the restored inversion symmetry.
Image of a reprinted with permission from ref. 160. Copyright 2019 American Chemical Society. Image of b reprinted with permission from
ref. 140 Copyright 2011 by the American Physical Society. Image of c used from Springer Nature with permission under a CC-BY 4.0169. Image of
d used from ref. 174. Reprinted with permission from AAAS.
E.C. Ahn
9
Published in partnership with FCT NOVA with the support of E-MRS
npj 2D Materials and Applications (2020)  17 
is proportional to the FM’s magnetization (c.f., the Hall voltage is
proportional to the external magnetic ﬁeld in the ordinary Hall
effect).
Electrons in 2D atomic crystals with a honeycomb lattice
structure possess a valley degree of freedom in addition to charge
and spin. Like the AHE observed in the FM material, this unique 2D
system is predicted to exhibit a similar Hall effect, yet with its sign
depending on the valley index. In 2014, Mak et al. reported the
observation of so-called valley Hall effect (VHE) in monolayer MoS2
by illuminating the MoS2 transistor with circularly polarized light
to preferentially excite electrons into a speciﬁc valley (Fig. 6d)174.
In this experiment, electrons from different valleys moved in
opposite directions across the MoS2 sample, with one valley being
overrepresented with respect to the other. Valleytronics is a recent
research paradigm that makes use of the valley of electrons; the
energy bands of certain crystal lattices have two or more minima
(i.e., valleys) at equal energies but at different positions in the
momentum space. If the number of electrons in these valleys can
be precisely controlled, thus producing so-called, valley polariza-
tion, it would be possible to create a novel form of valleytronic
devices.
In
this
context,
monolayer
MoS2
is
a
promising
valleytronic material because its conduction and valence-band
edges have two energy-degenerate valleys at the corners (K
points) of the ﬁrst Brillouin zone175.
Valley polarization in MoS2
In much the same way that spintronic devices require spin
polarization, valley polarization (non-equilibrium charge carrier
imbalance between valleys) serves as the essential mechanism to
realize the future valleytronic devices. Valley polarization has
previously been demonstrated using strain176,177 or magnetic
ﬁelds178–180. However, none of these approaches allowed dynamic
control of charge carriers. More importantly, most of these studies
relied on a special device geometry such as quantum well (e.g.,
AlAs-based two-dimensional electron system). In 2012, Cao et al.
performed
ﬁrst-principles
calculations
on
monolayer
MoS2,
suggesting that valley polarization is achievable via valley-
selective circular dichroism (the two valleys absorb left- and
right-handed photons differently) arising from its unique symme-
try181. In monolayer MoS2, each Mo sits in the center of a trigonal
prismatic cage formed by six sulfur atoms, thus forming the stable
honeycomb lattice structure with the broken inversion symmetry.
This is the essential condition for valley-selective circular dichro-
ism (VSCD), which is further enhanced by the strong SOC
associated with the transition metal’s d orbitals. Experimental
demonstrations of valley polarization in monolayer MoS2 quickly
followed up using the optical pumping technique182,183.
More recently, valley polarization was generated in MoS2 by the
electrical method, either in a gated bilayer MoS2 transistor
structure (the perpendicular gate bias broke the inversion
symmetry in bilayer MoS2)184 or using a nonlocal Hall bar device
geometry with monolayer MoS2
185. It is important to note that the
inverse valley Hall effect also made it possible to detect valley
polarization
in
MoS2
electrically185.
These
studies
provide
researchers with rich insights on generating, controlling, and
detecting valley polarization in MoS2, which can ultimately form
the basis of developing the future valleytronic devices based on
2D materials.
Spin-valley coupling in TMD
The broken inversion symmetry together with strong SOC directly
leads to spin-valley coupled properties (spin and valley indices of
charge carriers are coupled) in monolayer MoS2 and other group-
VI dichalcogenides175. From the device perspective, this means
that monolayer TMD can provide a unique integrated platform to
use valley for better manipulating spin. The strong spin-valley
coupling in these 2D materials has two speciﬁc consequences for
device applications. First, spin and valley relaxation are suppressed
at the valence-band edges as ﬂipping each index alone is
prohibited by the valley-contrasting spin splitting (0.1–0.5 eV)
caused by inversion symmetry breaking. For spintronic devices
requiring a long-range spin transport, this large spin-valley
coupling may offer a solid mechanism to enhance the spin
propagation by controlling the polarization of valleys in 2D
materials. Secondly, the valley-dependent optical selection rule
(e.g., VSCD181) also becomes spin-dependent, thus possibly
resulting in photon-induced spin and valley Hall effects. This
may be used to produce long-lived spin and valley accumulations
on monolayer TMD’s boundaries, which is key to the operation of
spintronic and valleytronic devices.
CONCLUSIONS
The last few decades of nanomagnetism and spintronics research
featured remarkable advances in the development of information
storage devices based on multilayers of magnetic metals and
insulators. However, high-volume information processing and
communication devices, either enabled or assisted by spin, still
have a long way to go before commercialization, mainly due to
relatively slow progress in semiconductor spintronics (in particular,
searching for right materials in right places). Recently, researchers
have begun to realize the great potential of 2D materials for
advanced spintronic device applications. In this section, several
challenges and future perspectives are discussed in terms of
material development and device integration for 2D spintronics.
2D magnets
Ferromagnetic order in 2D materials is a coveted property that
would allow fundamental studies of spin-dependent properties in
low-dimensional nanostructures and further enable novel spin-
tronic device applications. Cr-based vdW crystals such as CrI3 and
Cr2Ge2Te6 were reported to be intrinsically ferromagnetic49,147,
showing the great promise to build practical spintronic devices
through the use of atomically-thin ferromagnetic materials. The
discovery of intrinsic ferromagnetism in these layered structures
attracted signiﬁcant attention in the ﬁeld because making 2D
materials magnetic by defect engineering109–112 may not be
practically applicable (i.e., the induced magnetism is quite weak
and lacks robustness). However, the low Curie temperature (Tc) of
these materials (Tc is about 45 K for monolayer CrI3. For a complete
list of Tc values reported for a variety of 2D magnetic materials,
readers ﬁnd a recent review article186 a useful resource) still
remained a great challenge in adopting them for practical room-
temperature operation of spintronic devices. More recently, room-
temperature ferromagnetism was observed in the VSe2/MoS2 vdW
heterostructure149, MnSex epitaxial ﬁlms150, Fe3GeTe2
151, and
transition metal dihydride (MH2) monolayers152, leading the
possible pathway to offer spin-polarized carriers through 2D
materials at room temperature. For the purpose of electrical spin
injection, 2D magnets with half-metallicity (i.e., acts as a metal in
one spin direction and an insulator in the other direction)152 may
be worth more research efforts because it offers nearly perfect
spin polarization, making it possible to achieve a very high spin
injection efﬁciency in spin transistors or logic switches. For
metallic spintronic devices such as MTJs, all-2D MTJ structures (the
FM electrodes and the TB are all made of 2D materials) may be
constructed by combining with the recent progress in integrating
2D materials as the atomically-thin TB123. The device functionality
based on 2D magnets already started to be reported, for example,
by demonstrating the SOT-induced magnetization switching in
Fe3GeTe2
187.
E.C. Ahn
10
npj 2D Materials and Applications (2020)  17 
Published in partnership with FCT NOVA with the support of E-MRS
Interfacing 2D materials with FM
Although, in principle, 2D materials are expected to be readily
interfaced with other classes of materials, including FMs, largely
due to its excellent ﬂexibility and other mechanical properties188,
one practical challenge is to prevent oxidation or any other
surface contamination of the substrate material during the
integration process. Recalling that many existing strategies
developed for addressing this issue suffered from degradation
of spin polarization in the MTJ structure122,125–127,132–134, other
new approaches may be implemented to better integrate 2D
materials with FM thin ﬁlms. Indeed, researchers have already
started growing graphene or h-BN directly on top of the FM
catalytic substrate using the carefully-controlled CVD or MBE
technique128–131 instead of relying on ex-situ processes such as
exfoliation or transfer. Direct growth of TMD materials onto FM
substrates has not been demonstrated yet. A recently developed
intercalation technique of inserting the FM layer (Co) into an
already formed graphene/substrate interface may provide another
path for creating an excellent FM/graphene interface189. However,
the impact of these new processes on the speciﬁc spintronic
device performance still remains unknown, requiring more
advanced studies of applying novel integration processes to
create and evaluate the 2D spintronic devices.
Implementation of spin logic
Using spin as a state variable in logic devices provides several
advantages over conventional charge-based information proces-
sing technologies; non-volatility, faster and more energy-efﬁcient
data processing, and increased integration densities. Especially,
theorists predict that in spin-based computing, if the rate of spin
relaxation is maintained much slower than the switching rate,
energy dissipation can be even less than the thermal limit
(« 10−21 J/bit)190. If properly implemented, spintronic computing
could better satisfy the rapidly increasing performance needs of
emerging abundant-data applications191. All-spin logic (ASL)51 has
been considered as one of the most effective ways to implement
spin logic with the highest energy-efﬁciency because both its
internal and terminal quantities are spin, requiring no spin-to-
charge conversion. To date, despite its great promise, the
experimental demonstration of ASL has not been made yet. As
already discussed in this article, 2D materials have the potential to
address some of the challenges of ASL, such as developing the
long-range,
high
injection-efﬁciency
spin
transport
channel
material.
The concept of ASL, however, continues to evolve towards
other device approaches that are more easily implementable or
can better represent the emerging computing paradigm. For
example, the charge-coupled spin logic (CSL)58,192 uses robust
charge currents for long-distance transport as terminal quantities.
In the original proposal of CSL, the SHE was suggested as the write
mechanism while MTJ served as the read unit. Recently, the CSL
device was experimentally implemented based on a vertically-
coupled pair of in-plane and PMA nanomagnets, clearly demon-
strating its functionality as a logic gate and a true random number
generator58. More recently, the newer concept of a probabilistic
bit (p-bit)193 was introduced as an intermediate computing
scheme between the conventional bits of digital electronics and
the emerging quantum bit (qubit). In the probabilistic spin logic
(PSL), low-barrier nanomagnets (i.e., engineered to be purposely
unstable) provide a natural physical representation for p-bit, which
is the classical entity that ﬂuctuates rapidly between 0 and 1. The
PSL may open up new application spaces in an emerging
computing hardware domain because of their similarity. For
example, the p-bit MTJ, involving the low-barrier nanomagnet as a
free layer, can be easily combined with the MOS transistor to
create the conventional 1T1R (one transistor-one resistor) circuitry.
This could offer an efﬁcient hardware platform to accelerate deep
learning computation like the binary stochastic neuron194. A new
spin logic device concept was also proposed by combining the
spin-orbit coupling (for reading) and the magnetoelectric effect
(for writing), showing that this magnetoelectric spin-orbit logic
exhibits superior energy efﬁciency than the CMOS technology (by
a factor of 10 to 30)195. This may beneﬁt greatly from the unique
spin properties (large spin Hall angles, long spin lifetime) of 2D
materials and their heterostructures196. Looking further into how
2D materials can better enable or advance these newer forms of
the spin logic device will potentially pave the way for the post-
silicon spintronics era.
DATA AVAILABILITY
The authors declare that data supporting the ﬁndings of this study are available
within the article.
Received: 17 November 2019; Accepted: 8 May 2020;
REFERENCES
1. Frank, D. J. et al. Device scaling limits of Si MOSFETs and their application
dependencies. Proc. IEEE 89, 259–288 (2001).
2. Dennard, R. H., Gaensslen, F. H., Rideout, V. L., Bassous, E. & LeBlanc, A. R. Design
of ion-implanted MOSFET’s with very small physical dimensions. IEEE J. Solid-
State Circuits 9, 256–268 (1974).
3. Chang, L. et al. Practical strategies for power-efﬁcient computing technologies.
Proc. IEEE 98, 215–236 (2010).
4. Cheung, K. P. In Proceedings of 2010 International Symposium on VLSI Technology,
System and Application. 72–73 (2010).
5. Lu, H. & Seabaugh, A. Tunnel ﬁeld-effect transistors: state-of-the-art. IEEE J.
Electron Devices Soc. 2, 44–49 (2014).
6. Ionescu, A. M. & Riel, H. Tunnel ﬁeld-effect transistors as energy-efﬁcient elec-
tronic switches. Nature 479, 329 (2011).
7. Choi, W. Y., Park, B.-G., Lee, J. D. & Liu, T.-J. K. Tunneling ﬁeld-effect transistors
(TFETs) with subthreshold swing (SS) less than 60 mV/dec. IEEE Electron Device
Lett. 28, 743–745 (2007).
8. Zhang, H. et al. 2D negative capacitance ﬁeld-effect transistor with organic
ferroelectrics. Nanotechnology 29, 244004 (2018).
9. Salahuddin, S. & Datta, S. Use of negative capacitance to provide voltage
ampliﬁcation for low power nanoscale devices. Nano Lett. 8, 405–410 (2008).
10. Alam, M. A., Si, M. & Ye, P. D. A critical review of recent progress on negative
capacitance ﬁeld-effect transistors. Appl. Phys. Lett. 114, 090401 (2019).
11. Das, S. Two dimensional electrostrictive ﬁeld effect transistor (2D-EFET): a sub-
60mV/decade steep slope device with high on current. Sci. Rep. 6, 34811 (2016).
12. van Hemert, T. & Hueting, R. J. Piezoelectric strain modulation in FETs. IEEE Trans.
Electron Devices 60, 3265–3270 (2013).
13. Barraud, S. et al. In 2017 IEEE International Electron Devices Meeting (IEDM).
29.22.21–29.22.24 (2017).
14. Thomas, S. Nanosheet FETs at 3 nm. Nat. Electron. 1, 613 (2018).
15. Brooks, D. & Martonosi, M. In Proceedings of the Seventh International Symposium
on High-Performance Computer Architecture. 171–182 (2001).
16. Attia, K. M., El-Hosseini, M. A. & Ali, H. A. Dynamic power management techni-
ques in multi-core architectures: A survey study. Ain Shams Eng. J. 8, 445–456
(2017).
17. Sengupta, A. & Roy, K. Encoding neural and synaptic functionalities in electron
spin: a pathway to efﬁcient neuromorphic computing. Appl. Phys. Rev. 4, 041105
(2017).
18. Grollier, J., Querlioz, D. & Stiles, M. D. Spintronic nanodevices for bioinspired
computing. Proc. IEEE 104, 2024–2039 (2016).
19. Awschalom, D. D., Bassett, L. C., Dzurak, A. S., Hu, E. L. & Petta, J. R. Quantum
spintronics: engineering and manipulating atom-like spins in semiconductors.
Science 339, 1174–1179 (2013).
20. Leuenberger, M. N. & Loss, D. Spintronics and quantum computing: switching
mechanisms for qubits. Phys. E: Low.-Dimen. Syst. Nanostruct. 10, 452–457
(2001).
21. Baibich, M. N. et al. Giant magnetoresistance of (001) Fe/(001) Cr magnetic
superlattices. Phys. Rev. Lett. 61, 2472 (1988).
22. Binasch, G., Grünberg, P., Saurenbach, F. & Zinn, W. Enhanced magnetoresis-
tance
in
layered
magnetic
structures
with
antiferromagnetic
interlayer
exchange. Phys. Rev. B 39, 4828 (1989).
E.C. Ahn
11
Published in partnership with FCT NOVA with the support of E-MRS
npj 2D Materials and Applications (2020)  17 
23. Bruno, P. & Chappert, C. Oscillatory coupling between ferromagnetic layers
separated by a nonmagnetic metal spacer. Phys. Rev. Lett. 67, 1602 (1991).
24. Bruno, P. Oscillations of interlayer exchange coupling vs. ferromagnetic-layers
thickness. EPL (Europhys. Lett.) 23, 615 (1993).
25. Young Lee, T. et al. Critical switching current and thermal stability of magnetic
tunnel junctions with uncompensated CoFeB/Ru/CoFeB synthetic free layers. J.
Appl. Phys. 113, 093906 (2013).
26. Hayakawa, J. et al. Current-induced magnetization switching in MgO barrier
based magnetic tunnel junctions with CoFeB/Ru/CoFeB synthetic ferrimagnetic
free layer. Jpn. J. Appl. Phys. 45, L1057 (2006).
27. Diény, B. Giant magnetoresistance in spin-valve multilayers. J. Magn. Magn.
Mater. 136, 335–359 (1994).
28. Dieny, B. et al. Spin-valve effect in soft ferromagnetic sandwiches. J. Magn.
Magn. Mater. 93, 101–104 (1991).
29. Moodera, J. S., Kinder, L. R., Wong, T. M. & Meservey, R. Large magnetoresistance
at room temperature in ferromagnetic thin ﬁlm tunnel junctions. Phys. Rev. Lett.
74, 3273 (1995).
30. Ikeda, S. et al. Tunnel magnetoresistance of 604% at 300 K by suppression of Ta
diffusion in CoFeB∕MgO∕CoFeB pseudo-spin-valves annealed at high tempera-
ture. Appl. Phys. Lett. 93, 082508 (2008).
31. Berger, L. Emission of spin waves by a magnetic multilayer traversed by a
current. Phys. Rev. B 54, 9353 (1996).
32. Slonczewski, J. C. Current-driven excitation of magnetic multilayers. J. Magn.
Magn. Mater. 159, L1–L7 (1996).
33. Katine, J., Albert, F., Buhrman, R., Myers, E. & Ralph, D. Current-driven magne-
tization reversal and spin-wave excitations in Co/Cu/Co pillars. Phys. Rev. Lett.
84, 3149 (2000).
34. Yamaguchi, A. et al. Real-space observation of current-driven domain wall
motion in submicron magnetic wires. Phys. Rev. Lett. 92, 077205 (2004).
35. Kiselev, S. I. et al. Microwave oscillations of a nanomagnet driven by a spin-
polarized current. Nature 425, 380 (2003).
36. Yuasa, S. & Djayaprawira, D. Giant tunnel magnetoresistance in magnetic tunnel
junctions with a crystalline MgO (001) barrier. J. Phys. D: Appl. Phys. 40, R337
(2007).
37. Butler, W. H. Tunneling magnetoresistance from a symmetry ﬁltering effect. Sci.
Technol. Adv. Mater. 9, 014106 (2008).
38. Dieny, B. & Chshiev, M. Perpendicular magnetic anisotropy at transition metal/
oxide interfaces and applications. Rev. Mod. Phys. 89, 025008 (2017).
39. Tudu, B. & Tiwari, A. Recent developments in perpendicular magnetic anisotropy
thin ﬁlms for data storage applications. Vacuum 146, 329–341 (2017).
40. Yu, J.-X. & Zang, J. Giant perpendicular magnetic anisotropy in Fe/III-V nitride
thin ﬁlms. Sci. Adv. 4, eaar7814 (2018).
41. Inoue, J. & Ohno, H. Taking the hall effect for a spin. Science 309, 2004–2005
(2005).
42. Brodie, B. C. XIII. On the atomic weight of graphite. Phil. Trans. R. Soc. Lond. 149,
249–259 (1859).
43. Novoselov, K. S. et al. Electric ﬁeld effect in atomically thin carbon ﬁlms. Science
306, 666–669 (2004).
44. Kong, W. et al. Path towards graphene commercialization from lab to market.
Nat. Nanotechnol. 14, 927–938 (2019).
45. Song, L. et al. Large scale growth and characterization of atomic hexagonal
boron nitride layers. Nano Lett. 10, 3209–3215 (2010).
46. Manzeli, S., Ovchinnikov, D., Pasquier, D., Yazyev, O. V. & Kis, A. 2D transition
metal dichalcogenides. Nat. Rev. Mater. 2, 17033 (2017).
47. Akinwande, D., Petrone, N. & Hone, J. Two-dimensional ﬂexible nanoelectronics.
Nat. Commun. 5, 5678 (2014).
48. Xi, X. et al. Ising pairing in superconducting NbSe2 atomic layers. Nat. Phys. 12,
139 (2016).
49. Huang, B. et al. Layer-dependent ferromagnetism in a van der Waals crystal
down to the monolayer limit. Nature 546, 270 (2017).
50. Bernstein, K., Cavin, R. K., Porod, W., Seabaugh, A. & Welser, J. Device and
architecture outlook for beyond CMOS switches. Proc. IEEE 98, 2169–2184
(2010).
51. Behin-Aein, B., Datta, D., Salahuddin, S. & Datta, S. Proposal for an all-spin logic
device with built-in memory. Nat. Nanotechnol. 5, 266 (2010).
52. Dery, H., Dalal, P. & Sham, L. Spin-based logic in semiconductors for reconﬁ-
gurable large-scale circuits. Nature 447, 573 (2007).
53. Cowburn, R. & Welland, M. Room temperature magnetic quantum cellular
automata. Science 287, 1466–1468 (2000).
54. Imre, A. et al. Majority logic gate for magnetic quantum-dot cellular automata.
Science 311, 205–208 (2006).
55. Carlton, D. B., Emley, N. C., Tuchfeld, E. & Bokor, J. Simulation studies of
nanomagnet-based logic architecture. Nano Lett. 8, 4173–4178 (2008).
56. Allwood, D. A. et al. Magnetic domain-wall logic. Science 309, 1688–1692 (2005).
57. Murapaka, C., Sethi, P., Goolaup, S. & Lew, W. S. Reconﬁgurable logic via gate
controlled domain wall trajectory in magnetic network structure. Sci. Rep. 6,
20130 (2016).
58. Debashis, P. & Chen, Z. Experimental Demonstration of a Spin Logic Device with
Deterministic and Stochastic Mode of Operation. Sci. Rep. 8, 11405 (2018).
59. Salahuddin, S. & Datta, S. Interacting systems for self-correcting low power
switching. Appl. Phys. Lett. 90, 093503 (2007).
60. Behin-Aein, B., Salahuddin, S. & Datta, S. Switching energy of ferromagnetic
logic bits. IEEE Trans. Nanotechnol. 8, 505–514 (2009).
61. Johnson, M. & Silsbee, R. H. Interfacial charge-spin coupling: Injection and
detection of spin magnetization in metals. Phys. Rev. Lett. 55, 1790 (1985).
62. Jedema, F. J., Filip, A. & Van Wees, B. Electrical spin injection and accumulation
at room temperature in an all-metal mesoscopic spin valve. Nature 410, 345
(2001).
63. Idzuchi, H., Fukuma, Y. & Otani, Y. Spin transport in non-magnetic nano-struc-
tures induced by non-local spin injection. Phys. E: Low.-dimensional Syst.
Nanostruct. 68, 239–263 (2015).
64. Han, W., Kawakami, R. K., Gmitra, M. & Fabian, J. Graphene spintronics. Nat.
Nanotechnol. 9, 794 (2014).
65. Roche, S. et al. Graphene spintronics: the European Flagship perspective. 2D
Mater. 2, 030202 (2015).
66. Gmitra, M., Konschuh, S., Ertler, C., Ambrosch-Draxl, C. & Fabian, J. Band-
structure topologies of graphene: Spin-orbit coupling effects from ﬁrst princi-
ples. Phys. Rev. B 80, 235431 (2009).
67. Boettger, J. & Trickey, S. First-principles calculation of the spin-orbit splitting in
graphene. Phys. Rev. B 75, 121402 (2007).
68. Bolotin, K. I. et al. Ultrahigh electron mobility in suspended graphene. Solid State
Commun. 146, 351–355 (2008).
69. Ji, Y., Hoffmann, A., Jiang, J., Pearson, J. & Bader, S. Non-local spin injection in
lateral spin valves. J. Phys. D: Appl. Phys. 40, 1280 (2007).
70. Yang, T., Kimura, T. & Otani, Y. Giant spin-accumulation signal and pure spin-
current-induced reversible magnetization switching. Nat. Phys. 4, 851 (2008).
71. Tombros, N., Jozsa, C., Popinciuc, M., Jonkman, H. T. & Van Wees, B. J. Electronic
spin transport and spin precession in single graphene layers at room tem-
perature. Nature 448, 571 (2007).
72. Žutić, I., Fabian, J. & Sarma, S. D. Spintronics: fundamentals and applications. Rev.
Mod. Phys. 76, 323 (2004).
73. Cubukcu, M. et al. Ferromagnetic tunnel contacts to graphene: contact resis-
tance and spin signal. J. Appl. Phys. 117, 083909 (2015).
74. Jedema, F., Heersche, H., Filip, A., Baselmans, J. & Van Wees, B. Electrical
detection of spin precession in a metallic mesoscopic spin valve. Nature 416,
713 (2002).
75. Huang, B., Monsma, D. J. & Appelbaum, I. Coherent spin transport through a 350
micron thick silicon wafer. Phys. Rev. Lett. 99, 177209 (2007).
76. Schmidt, G., Ferrand, D., Molenkamp, L., Filip, A. & Van Wees, B. Fundamental
obstacle for electrical spin injection from a ferromagnetic metal into a diffusive
semiconductor. Phys. Rev. B 62, R4790 (2000).
77. Drögeler, M. et al. Spin lifetimes exceeding 12 ns in graphene nonlocal spin
valve devices. Nano Lett. 16, 3533–3539 (2016).
78. Ingla-Aynés, J., Meijerink, R. J. & Wees, B. J. V. Eighty-eight percent directional
guiding of spin currents with 90 μm relaxation length in bilayer graphene using
carrier drift. Nano Lett. 16, 4825–4830 (2016).
79. Dankert, A., Kamalakar, M. V., Bergsten, J. & Dash, S. P. Spin transport and
precession in graphene measured by nonlocal and three-terminal methods.
Appl. Phys. Lett. 104, 192403 (2014).
80. Kamalakar, M. V., Groenveld, C., Dankert, A. & Dash, S. P. Long distance spin
communication in chemical vapour deposited graphene. Nat. Commun. 6, 6766
(2015).
81. Volmer, F. et al. Role of MgO barriers for spin and charge transport in Co/MgO/
graphene nonlocal spin-valve devices. Phys. Rev. B 88, 161405 (2013).
82. Han, W. et al. Tunneling spin injection into single layer graphene. Phys. Rev. Lett.
105, 167202 (2010).
83. Han, W. & Kawakami, R. K. Spin relaxation in single-layer and bilayer graphene.
Phys. Rev. Lett. 107, 047207 (2011).
84. Yamaguchi, T. et al. Electrical spin injection into graphene through monolayer
hexagonal boron nitride. Appl. Phys. Express 6, 073001 (2013).
85. Yamaguchi, T., Masubuchi, S., Iguchi, K., Moriya, R. & Machida, T. Tunnel spin
injection into graphene using Al2O3 barrier grown by atomic layer deposi-
tion on functionalized graphene surface. J. Magn. Magn. Mater. 324, 849–852
(2012).
86. Popinciuc, M. et al. Electronic spin transport in graphene ﬁeld-effect transistors.
Phys. Rev. B 80, 214427 (2009).
87. Guimarães, M. H. et al. Spin transport in high-quality suspended graphene
devices. Nano Lett. 12, 3512–3517 (2012).
E.C. Ahn
12
npj 2D Materials and Applications (2020)  17 
Published in partnership with FCT NOVA with the support of E-MRS
88. Friedman, A. L., van’t Erve, O. M., Li, C. H., Robinson, J. T. & Jonker, B. T.
Homoepitaxial tunnel barriers with functionalized graphene-on-graphene for
charge and spin transport. Nat. Commun. 5, 3161 (2014).
89. Kamalakar, M. V., Dankert, A., Kelly, P. J. & Dash, S. P. Inversion of spin signal and
spin ﬁltering in ferromagnet|hexagonal boron nitride-graphene van der Waals
heterostructures. Sci. Rep. 6, 1–9 (2016).
90. Gurram, M., Omar, S. & van Wees, B. J. Bias induced up to 100% spin-injection
and detection polarizations in ferromagnet/bilayer-hBN/graphene/hBN hetero-
structures. Nat. Commun. 8, 1–7 (2017).
91. Zhu, T. et al. Probing tunneling spin injection into graphene via bias depen-
dence. Phys. Rev. B 98, 054412 (2018).
92. Zomer, P., Guimaraes, M., Tombros, N. & Van Wees, B. Long-distance spin
transport in high-mobility graphene on hexagonal boron nitride. Phys. Rev. B 86,
161416 (2012).
93. Drögeler,
M.
et
al.
Nanosecond
spin
lifetimes
in
single-and
few-layer
graphene–hBN heterostructures at room temperature. Nano Lett. 14, 6050–6055
(2014).
94. Dean, C. R. et al. Boron nitride substrates for high-quality graphene electronics.
Nat. Nanotechnol. 5, 722 (2010).
95. Geim, A. K. & Grigorieva, I. V. Van der Waals heterostructures. Nature 499,
419–425 (2013).
96. Yankowitz, M., Ma, Q., Jarillo-Herrero, P. & LeRoy, B. J. van der Waals hetero-
structures combining graphene and hexagonal boron nitride. Nat. Rev. Phys 1,
112–125 (2019).
97. Gurram, M., Omar, S. & van Wees, B. J. Electrical spin injection, transport, and
detection in graphene-hexagonal boron nitride van der Waals heterostructures:
progress and perspectives. 2D Mater. 5, 032004 (2018).
98. Elliott, R. J. Theory of the effect of spin-orbit coupling on magnetic resonance in
some semiconductors. Phys. Rev. 96, 266 (1954).
99. Dyakonov, M. & Perel, V. Spin relaxation of conduction electrons in non-
centrosymmetric semiconductors. Sov. Phys. Solid State, Ussr 13, 3023–3026
(1972).
100. Yang, T.-Y. et al. Observation of long spin-relaxation times in bilayer graphene at
room temperature. Phys. Rev. Lett. 107, 047206 (2011).
101. Gebeyehu, Z. M. et al. Spin communication over 30 µm long channels of che-
mical vapor deposited graphene on SiO2. 2D Mater. 6, 034003 (2019).
102. Khokhriakov, D., Karpiak, B., Hoque, A. M. & Dash, S. P. Two-dimensional spin-
tronic circuit architectures on large scale graphene. Carbon 161, 892–899
(2020).
103. Dlubak, B. et al. Highly efﬁcient spin transport in epitaxial graphene on SiC. Nat.
Phys. 8, 557 (2012).
104. Huertas-Hernando, D., Guinea, F. & Brataas, A. Spin relaxation times in dis-
ordered graphene. Eur. Phys. J. Spec. Top. 148, 177–181 (2007).
105. Ertler, C., Konschuh, S., Gmitra, M. & Fabian, J. Electron spin relaxation in gra-
phene: the role of the substrate. Phys. Rev. B 80, 041405 (2009).
106. Park, C.-H., Yang, L., Son, Y.-W., Cohen, M. L. & Louie, S. G. Anisotropic behaviours
of massless Dirac fermions in graphene under periodic potentials. Nat. Phys. 4,
213 (2008).
107. Silva, E. et al. Thickness dependence of the magnetic anisotropy and dynamic
magnetic response of ferromagnetic NiFe ﬁlms. J. Phys. D: Appl. Phys. 50, 185001
(2017).
108. Jensen, P., Dreyssé, H. & Bennemann, K. Calculation of the ﬁlm-thickness-
dependence of the Curie temperature in thin transition metal ﬁlms. EPL (Euro-
phys. Lett.) 18, 463 (1992).
109. Yazyev, O. V. & Helm, L. Defect-induced magnetism in graphene. Phys. Rev. B 75,
125408 (2007).
110. McCreary, K. M., Swartz, A. G., Han, W., Fabian, J. & Kawakami, R. K. Magnetic
moment formation in graphene detected by scattering of pure spin currents.
Phys. Rev. Lett. 109, 186604 (2012).
111. Nair, R. et al. Spin-half paramagnetism in graphene induced by point defects.
Nat. Phys. 8, 199 (2012).
112. Hong, X., Zou, K., Wang, B., Cheng, S.-H. & Zhu, J. Evidence for spin-ﬂip scattering
and local moments in dilute ﬂuorinated graphene. Phys. Rev. Lett. 108, 226602
(2012).
113. Elias, D. C. et al. Control of graphene’s properties by reversible hydrogenation:
evidence for graphane. Science 323, 610–613 (2009).
114. Nair, R. R. et al. Fluorographene: a two‐dimensional counterpart of Teﬂon. Small
6, 2877–2884 (2010).
115. Lieb, E. H. Two theorems on the Hubbard model. Phys. Rev. Lett. 62, 1201 (1989).
116. Hu, W. et al. Room-temperature magnetism and tunable energy gaps in edge-
passivated zigzag graphene quantum dots. npj 2D Mater. Appl. 3, 17 (2019).
117. Ugeda, M. M., Brihuega, I., Guinea, F. & Gómez-Rodríguez, J. M. Missing atom as a
source of carbon magnetism. Phys. Rev. Lett. 104, 096804 (2010).
118. Chen, E. et al. Advances and future prospects of spin-transfer torque random
access memory. IEEE Trans. Magn. 46, 1873–1878 (2010).
119. Ahn, E. C., Wong, H.-S. P. & Pop, E. Carbon nanomaterials for non-volatile
memories. Nat. Rev. Mater. 3, 18009 (2018).
120. Yan, H., Cherian, H. R., Ahn, E. C., Qian, X. & Duan, L. iCELIA: a full-stack frame-
work for STT-MRAM-based deep learning acceleration. IEEE Trans. Parallel Distrib.
Syst. 31, 408–422 (2019).
121. Karpan, V. et al. Graphite and graphene as perfect spin ﬁlters. Phys. Rev. Lett. 99,
176602 (2007).
122. Mohiuddin, T. M. et al. Graphene in multilayered CPP spin valves. IEEE Trans.
Magn. 44, 2624–2627 (2008).
123. Piquemal-Banci, M. et al. 2D-MTJs: introducing 2D materials in magnetic tunnel
junctions. J. Phys. D: Appl. Phys. 50, 203002 (2017).
124. Cobas, E., Friedman, A. L., van’t Erve, O. M., Robinson, J. T. & Jonker, B. T.
Graphene as a tunnel barrier: graphene-based magnetic tunnel junctions. Nano
Lett. 12, 3000–3004 (2012).
125. Park, J.-H. & Lee, H.-J. Out-of-plane magnetoresistance in ferromagnet/gra-
phene/ferromagnet spin-valve junctions. Phys. Rev. B 89, 165417 (2014).
126. Li, F., Li, T. & Guo, X. Vertical graphene spin valves based on La2/3Sr1/3MnO3
electrodes. ACS Appl. Mater. Interfaces 6, 1187–1192 (2014).
127. Dankert, A., Kamalakar, M. V., Wajid, A., Patel, R. S. & Dash, S. P. Tunnel mag-
netoresistance with atomically thin two-dimensional hexagonal boron nitride
barriers. Nano Res. 8, 1357–1364 (2015).
128. Piquemal-Banci, M. et al. Magnetic tunnel junctions with monolayer hexagonal
boron nitride tunnel barriers. Appl. Phys. Lett. 108, 102404 (2016).
129. Tonkikh, A. et al. Structural and electronic properties of epitaxial multilayer h-BN
on Ni (111) for spintronics applications. Sci. Rep. 6, 23547 (2016).
130. Weatherup, R. S., Dlubak, B. & Hofmann, S. Kinetic control of catalytic CVD for
high-quality graphene at low temperatures. ACS Nano 6, 9996–10003 (2012).
131. Weatherup, R. S. et al. On the mechanisms of Ni‐catalysed graphene chemical
vapour deposition. ChemPhysChem 13, 2544–2549 (2012).
132. Wang, W. et al. Spin-valve effect in NiFe/MoS2/NiFe junctions. Nano Lett. 15,
5261–5267 (2015).
133. Wu, H.-C. et al. Spin-dependent transport properties of Fe3O4/MoS2/Fe3O4
junctions. Sci. Rep. 5, 15984 (2015).
134. Iqbal, M. Z., Iqbal, M. W., Siddique, S., Khan, M. F. & Ramay, S. M. Room tem-
perature spin valve effect in NiFe/WS2/Co junctions. Sci. Rep. 6, 21038 (2016).
135. Datta, S. & Das, B. Electronic analog of the electro‐optic modulator. Appl. Phys.
Lett. 56, 665–667 (1990).
136. Koo, H. C. et al. Control of spin precession in a spin-injected ﬁeld effect tran-
sistor. Science 325, 1515–1518 (2009).
137. Chuang, P. et al. All-electric all-semiconductor spin ﬁeld-effect transistors. Nat.
Nanotechnol. 10, 35 (2015).
138. Sugahara, S. & Nitta, J. Spin-transistor electronics: an overview and outlook. Proc.
IEEE 98, 2124–2154 (2010).
139. Yan, W. et al. A two-dimensional spin ﬁeld-effect switch. Nat. Commun. 7, 13372
(2016).
140. Zhu, Z., Cheng, Y. & Schwingenschlögl, U. Giant spin-orbit-induced spin splitting
in two-dimensional transition-metal dichalcogenide semiconductors. Phys. Rev.
B 84, 153402 (2011).
141. Castellanos-Gomez, A. et al. Deterministic transfer of two-dimensional materials
by all-dry viscoelastic stamping. 2D Mater. 1, 011002 (2014).
142. Dankert, A. & Dash, S. P. Electrical gate control of spin current in van der Waals
heterostructures at room temperature. Nat. Commun. 8, 16093 (2017).
143. Cummings, A. W., Garcia, J. H., Fabian, J. & Roche, S. Giant spin lifetime aniso-
tropy in graphene induced by proximity effects. Phys. Rev. Lett. 119, 206601
(2017).
144. Ghiasi, T. S., Ingla-Aynés, J., Kaverzin, A. A. & van Wees, B. J. Large proximity-
induced spin lifetime anisotropy in transition-metal dichalcogenide/graphene
heterostructures. Nano Lett. 17, 7528–7532 (2017).
145. Benítez, L. A. et al. Strongly anisotropic spin relaxation in graphene–transition
metal dichalcogenide heterostructures at room temperature. Nat. Phys. 14,
303–308 (2018).
146. Jiang, S., Li, L., Wang, Z., Shan, J. & Mak, K. F. Spin tunnel ﬁeld-effect transistors
based on two-dimensional van der Waals heterostructures. Nat. Electron. 2, 159
(2019).
147. Gong, C. et al. Discovery of intrinsic ferromagnetism in two-dimensional van der
Waals crystals. Nature 546, 265 (2017).
148. Lee, J.-U. et al. Ising-type magnetic ordering in atomically thin FePS3. Nano Lett.
16, 7433–7438 (2016).
149. Bonilla, M. et al. Strong room-temperature ferromagnetism in VSe2 monolayers
on van der Waals substrates. Nat. Nanotechnol. 13, 289 (2018).
150. O’Hara, D. J. et al. Room temperature intrinsic ferromagnetism in epitaxial
manganese selenide ﬁlms in the monolayer limit. Nano Lett. 18, 3125–3131
(2018).
151. Deng, Y. et al. Gate-tunable room-temperature ferromagnetism in two-
dimensional Fe 3 GeTe 2. Nature 563, 94 (2018).
E.C. Ahn
13
Published in partnership with FCT NOVA with the support of E-MRS
npj 2D Materials and Applications (2020)  17 
152. Wu, Q., Zhang, Y., Zhou, Q., Wang, J. & Zeng, X. C. Transition-metal dihydride
monolayers: a new family of two-dimensional ferromagnetic materials with intrinsic
room-temperature half-metallicity. J. Phys. Chem. Lett. 9, 4260–4266 (2018).
153. Jiang, S., Shan, J. & Mak, K. F. Electric-ﬁeld switching of two-dimensional van der
Waals magnets. Nat. Mater. 17, 406 (2018).
154. Song, T. et al. Giant tunneling magnetoresistance in spin-ﬁlter van der Waals
heterostructures. Science 360, 1214–1218 (2018).
155. Wang, Z. et al. Very large tunneling magnetoresistance in layered magnetic
semiconductor CrI3. Nat. Commun. 9, 2516 (2018).
156. Klein, D. R. et al. Probing magnetism in 2D van der Waals crystalline insulators
via electron tunneling. Science 360, 1218–1222 (2018).
157. Novoselov, K. S. et al. Two-dimensional gas of massless Dirac fermions in gra-
phene. Nature 438, 197 (2005).
158. Zhang, Y., Tan, Y.-W., Stormer, H. L. & Kim, P. Experimental observation of the
quantum Hall effect and Berry’s phase in graphene. Nature 438, 201 (2005).
159. Hirsch, J. Spin hall effect. Phys. Rev. Lett. 83, 1834 (1999).
160. Safeer, C. et al. Room-temperature spin Hall effect in graphene/MoS2 van der
Waals heterostructures. Nano Lett. 19, 1074–1082 (2019).
161. Garcia, J. H., Cummings, A. W. & Roche, S. Spin Hall effect and weak antilocali-
zation in graphene/transition metal dichalcogenide heterostructures. Nano Lett.
17, 5078–5083 (2017).
162. Ofﬁdani, M., Milletarì, M., Raimondi, R. & Ferreira, A. Optimal charge-to-spin
conversion in graphene on transition-metal dichalcogenides. Phys. Rev. Lett.
119, 196801 (2017).
163. Ghiasi, T. S., Kaverzin, A. A., Blah, P. J. & van Wees, B. J. Charge-to-spin conversion
by the rashba–edelstein effect in two-dimensional van der waals hetero-
structures up to room temperature. Nano Lett. 19, 5959–5966 (2019).
164. Liu, L. et al. Spin-torque switching with the giant spin Hall effect of tantalum.
Science 336, 555–558 (2012).
165. Liu, L., Pai, C.-F., Ralph, D. & Buhrman, R. Magnetic oscillations driven by the spin
Hall effect in 3-terminal magnetic tunnel junction devices. Phys. Rev. Lett. 109,
186602 (2012).
166. Deng, Y., Yang, M., Ji, Y. & Wang, K. Estimating spin Hall angle in heavy metal/
ferromagnet heterostructures. J. Magn. Magn. Mater. 496, 165920 (2019).
167. Shao, Q. et al. Strong Rashba-Edelstein effect-induced spin–orbit torques in
monolayer transition metal dichalcogenide/ferromagnet bilayers. Nano Lett. 16,
7514–7520 (2016).
168. Fan, Y. et al. Magnetization switching through giant spin–orbit torque in a
magnetically doped topological insulator heterostructure. Nat. Mater. 13, 699
(2014).
169. Wang, Y. et al. Room temperature magnetization switching in topological
insulator-ferromagnet heterostructures by spin-orbit torques. Nat. Commun. 8,
1–6 (2017).
170. Benítez, L. A. et al. Tunable room-temperature spin galvanic and spin Hall effects
in van der Waals heterostructures. Nat. Mater. 19, 170–175 (2020).
171. MacNeill, D. et al. Control of spin–orbit torques through crystal symmetry in WTe
2/ferromagnet bilayers. Nat. Phys. 13, 300–305 (2017).
172. Safeer, C. et al. Large multidirectional spin-to-charge conversion in low-
symmetry semimetal MoTe2 at room temperature. Nano Lett. 19, 8758–8766
(2019).
173. Nagaosa, N., Sinova, J., Onoda, S., MacDonald, A. H. & Ong, N. P. Anomalous hall
effect. Rev. Mod. Phys. 82, 1539 (2010).
174. Mak, K. F., McGill, K. L., Park, J. & McEuen, P. L. The valley Hall effect in MoS2
transistors. Science 344, 1489–1492 (2014).
175. Xiao, D., Liu, G.-B., Feng, W., Xu, X. & Yao, W. Coupled spin and valley physics in
monolayers of MoS2 and other group-VI dichalcogenides. Phys. Rev. Lett. 108,
196802 (2012).
176. Gunawan, O. et al. Valley susceptibility of an interacting two-dimensional
electron system. Phys. Rev. Lett. 97, 186404 (2006).
177. Takashina, K., Ono, Y., Fujiwara, A., Takahashi, Y. & Hirayama, Y. Valley polar-
ization in Si (100) at zero magnetic ﬁeld. Phys. Rev. Lett. 96, 236801 (2006).
178. Shkolnikov, Y., De Poortere, E., Tutuc, E. & Shayegan, M. Valley splitting of AlAs
two-dimensional electrons in a perpendicular magnetic ﬁeld. Phys. Rev. Lett. 89,
226805 (2002).
179. Bishop, N. et al. Valley polarization and susceptibility of composite fermions
around a ﬁlling factor ν=3/2. Phys. Rev. Lett. 98, 266404 (2007).
180. Zhu, Z., Collaudin, A., Fauqué, B., Kang, W. & Behnia, K. Field-induced polariza-
tion of Dirac valleys in bismuth. Nat. Phys. 8, 89 (2012).
181. Cao, T. et al. Valley-selective circular dichroism of monolayer molybdenum
disulphide. Nat. Commun. 3, 887 (2012).
182. Zeng, H., Dai, J., Yao, W., Xiao, D. & Cui, X. Valley polarization in MoS2 mono-
layers by optical pumping. Nat. Nanotechnol. 7, 490 (2012).
183. Mak, K. F., He, K., Shan, J. & Heinz, T. F. Control of valley polarization in
monolayer MoS2 by optical helicity. Nat. Nanotechnol. 7, 494 (2012).
184. Lee, J., Mak, K. F. & Shan, J. Electrical control of the valley Hall effect in bilayer
MoS2 transistors. Nat. Nanotechnol. 11, 421 (2016).
185. Hung, T. Y., Camsari, K. Y., Zhang, S., Upadhyaya, P. & Chen, Z. Direct observation
of valley-coupled topological current in MoS2. Sci. Adv. 5, eaau6478 (2019).
186. Lin, X., Yang, W., Wang, K. L. & Zhao, W. Two-dimensional spintronics for low-
power electronics. Nat. Electron. 2, 274–283 (2019).
187. Wang, X. et al. Current-driven magnetization switching in a van der Waals
ferromagnet Fe3GeTe2. arXiv preprint arXiv:1902.05794 (2019).
188. Kim, J. H., Jeong, J. H., Kim, N., Joshi, R. & Lee, G.-H. Mechanical properties of two-
dimensional materials and their applications. J. Phys. D: Appl. Phys. 52, 083001
(2018).
189. Rougemaille, N. et al. Perpendicular magnetic anisotropy of cobalt ﬁlms inter-
calated under graphene. Appl. Phys. Lett. 101, 142403 (2012).
190. Nikonov, D. E., Bourianoff, G. I. & Gargini, P. A. Power dissipation in spintronic
devices out of thermodynamic equilibrium. J. Superconductivity Nov. Magn. 19,
497–513 (2006).
191. Chen, M., Mao, S., Zhang, Y. & Leung, V. C. Big data: related technologies,
challenges and future prospects. (Springer, 2014).
192. Datta, S., Salahuddin, S. & Behin-Aein, B. Non-volatile spin switch for Boolean
and non-Boolean logic. Appl. Phys. Lett. 101, 252411 (2012).
193. Camsari, K. Y., Sutton, B. M. & Datta, S. p-bits for probabilistic spin logic. Appl.
Phys. Rev. 6, 011305 (2019).
194. Nedjah, N. & de Macedo Mourelle, L. Reconﬁgurable hardware for neural net-
works: binary versus stochastic. Neural Comput. Appl. 16, 249–255 (2007).
195. Manipatruni, S. et al. Scalable energy-efﬁcient magnetoelectric spin–orbit logic.
Nature 565, 35–42 (2019).
196. Pham, V. T. et al. Spin–orbit magnetic state readout in scaled ferromagnetic/
heavy metal nanostructures. Nat. Electron. https://doi.org/10.1038/s41928-020-
0395-y (2020).
ACKNOWLEDGEMENTS
This work was supported by the UT System Faculty Science and Technology
Acquisition and Retention (STARs), the National Science Foundation (NSF) grant
1929118, and the Air Force Ofﬁce of Scientiﬁc Research (AFOSR) grant FA9550-19-1-
0085.
AUTHOR CONTRIBUTIONS
E.C.A. conceived the idea for the review article and wrote the manuscript.
COMPETING INTERESTS
The author declares no competing interests.
ADDITIONAL INFORMATION
Correspondence and requests for materials should be addressed to E.C.A.
Reprints and permission information is available at http://www.nature.com/
reprints
Publisher’s note Springer Nature remains neutral with regard to jurisdictional claims
in published maps and institutional afﬁliations.
Open Access This article is licensed under a Creative Commons
Attribution 4.0 International License, which permits use, sharing,
adaptation, distribution and reproduction in any medium or format, as long as you give
appropriate credit to the original author(s) and the source, provide a link to the Creative
Commons license, and indicate if changes were made. The images or other third party
material in this article are included in the article’s Creative Commons license, unless
indicated otherwise in a credit line to the material. If material is not included in the
article’s Creative Commons license and your intended use is not permitted by statutory
regulation or exceeds the permitted use, you will need to obtain permission directly
from the copyright holder. To view a copy of this license, visit http://creativecommons.
org/licenses/by/4.0/.
© The Author(s) 2020
E.C. Ahn
14
npj 2D Materials and Applications (2020)  17 
Published in partnership with FCT NOVA with the support of E-MRS
