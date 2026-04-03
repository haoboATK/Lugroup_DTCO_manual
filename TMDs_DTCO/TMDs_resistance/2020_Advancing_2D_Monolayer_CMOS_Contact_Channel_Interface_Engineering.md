# 2020_Advancing_2D_Monolayer_CMOS_Contact_Channel_Interface_Engineering.pdf

 
 
  Advancing 2D Monolayer CMOS Through Contact, 
Channel and Interface Engineering
K. P. O’Brien*1, C. J. Dorow*1, A. Penumatcha1, K. Maxey1, S. Lee1, C. H. Naylor1, A. Hsiao1, B. Holybee1, C. Rogan1,  
D. Adams1, T. Tronic1, S. Ma2, A. Oni3, A. Sen Gupta1, R. Bristol1, S. Clendenning1, M. Metz1, U. Avci1 
Components Research1, Global Supply Chain2, Quality and Reliablity3, Intel Corporation, Hillsboro, OR 97214, USA.  
                                                    *Both authors contributed equally. Email: kevin.p.obrien@intel.com, chelsey.dorow@intel.com 
Abstract—2D CMOS transistors fabricated with transition 
metal dichalcogenide (TMD) materials are a potential 
replacement for silicon transistors at sub-12 nm channel length 
[LG].  We demonstrate record NMOS contacts using a high 
melting point metal, down to 146 -m contact resistance (RC).  
We present the best PMOS performance on a grown monolayer 
WSe2 film with 50 A/m Ion and 141 mV/dec sub-threshold swing 
(SS) using a Ru contact metal, showing record PMOS contact 
resistance, RC = 2.7 k-m. For the first time, we present 300 mm 
wafer growth options of 4 different 2D TMD films: MoS2, WS2, 
WSe2, 
MoSe2 
that 
were 
grown 
at 
BEOL 
compatible 
temperatures. On unpassivated channel devices we show two 
methods of channel curing. First, N2 desiccation can improve ION 
(~2×) and SS (~0.6×) simultaneously.  Secondly, FGA annealing 
can improve bare channel devices by increasing their median Ion 
by 10× and lowering their SS by almost 50%. Finally, we 
benchmark our results against leading grown TMD devices, 
demonstrating record drive-currents among devices with good 
SS.  
I. 
INTRODUCTION 
2D TMD transistors have a promising future as a CMOS 
replacement technology because TMDs do not suffer from 
channel scaling issues that limit Si transistors [1-2]. In sub 12-
15 nm LG Si CMOS, the Si channel needs to be aggressively 
scaled, which degrades the on-state mobility. 2D FETs do not 
suffer these intrinsic effects since their body thickness is 
already sub 1 nm without mobility loss relative to their bulk 
values.  
However, 2D materials pose their own set of unique 
challenges – (1) the mobility of these materials is expected to 
be lower than Si and (2) Metallic contacts to 2D materials tend 
to be more resistive than metallic contacts to Si. To understand 
if these challenges impact the performance and power 
consumption of a transistor we performed a TCAD simulation 
of an NMOS stacked nanoribbon transistor. The results and the 
parameters chosen for the simulation are presented in Fig (1).  
For the 2D transistor, (1) the number of ribbons is increased 
to six, (2) the LG is scaled to 5nm and (3) the metallic contact 
replaces the epitaxial source/drain contact in a silicon transistor. 
Note that the increase in number of ribbons still results in the 
same overall gate height thereby avoiding extra parasitic 
capacitance. Our results show that even with assumptions of 
lower mobility (100 cm2/V-s) and 2× higher contact resistance 
than Si, 2D transistor can achieve significant scaling, power and 
performance improvements. As the growth quality and 
integration of 2D materials improves one needs to take 
advantage of its unique scaling capability to offset any 
challenges that may arise. 
In this paper we review the three key parts of the transistor 
in their own sections: section II channel material quality, 
section III contact resistance and section IV gate stack quality. 
In section II we outline two different growth techniques that are 
currently scalable, single crystal growth from a pre-patterned 
seed and MOCVD TMD growth on a 300 mm platform. In 
general, we find experimentally that MoS2 NMOS FETs 
outperform WS2 even though the theoretical mobilities are 
higher for WS2. We also find that WSe2 is the leading candidate 
for PMOS stacked nanosheets. In section III we will present a 
first of a kind PMOS contact that outperforms standard Pd 
contacts and the first experimental comparison between Au, Bi 
and Sb NMOS contacts which highlights promising new 
directions in understanding contacts to TMD materials. In 
section IV we show a technique for curing 2D transistor 
channels after processing and air exposure of unpassivated 
channels leading to improved performance.  
The devices presented in this paper follow the integration 
process flow shown in Fig. (2) and are mostly fabricated from 
MBE then transferred Fig. (3) [3] [4]. The channel width and 
current normalization is done by the SEM measurement of 
channel width after etching. All process layers use standard e-
beam processing.  Metal was evaporated at 3e-6 Torr with a 15-
minute prebake (125 °C in air) to drive off water. We believe 
this improvement is solely due to water removal since our 
unpassivated channel device performance improves by placing 
wafers in a 20 °C N2 desiccator for 16 days, Fig (4). In this paper 
all measurements were performed in air. Using the above 
process, we fabricated an 18 nm 2D transistor, as seen in the 
TEM cross section Fig. (5)-(6).    
II. CHANNEL MATERIAL 
The best data in literature, including our own data, for 
grown 2D FETs are devices fabricated from either solid source 
CVD or MBE, neither of which have been demonstrated at the 
300 mm level to date. However, two methods of TMD synthesis 
do promise manufacturability at 300 mm scale: traditional 
heteroepitaxy on Si wafers by MOCVD and a novel nucleated 
CVD growth from pre-patterned seeds. 
MOCVD has been used to synthesize compound 
semiconductors because it allows for precise control of 
precursor molar flow into a deposition chamber and is therefore 
a manufacturable process. A grand challenge for the MOCVD 
growth is the development of uniform 2D films with monolayer 
control and electrical quality comparable to silicon for relevant 
technologies [5] [6]. Here we share our first growths of MX2 at 
the 300mm scale; M = Mo, W; X = S, Se), and note that our 
7.1.1
978-1-6654-2572-8/21/$31.00 ©2021 IEEE
IEDM21-146
2021 IEEE International Electron Devices Meeting (IEDM) | 978-1-6654-2572-8/21/$31.00 ©2021 IEEE | DOI: 10.1109/IEDM19574.2021.9720651
Authorized licensed use limited to: FUDAN UNIVERSITY. Downloaded on April 02,2026 at 10:59:37 UTC from IEEE Xplore.  Restrictions apply. 
 
 
selection of organometallic precursors allows for a wide range 
of processing conditions, including temperatures as high as 
1000 °C or down to 300 °C. This result opens the exciting 
option of BEOL 2D transistors. Fig (7a) includes identifiable 
Raman spectra for the four principal TMDs, and are taken from 
300 mm wafers. The three images Fig. (7b, 7c, 7d) are taken 
from 300 mm wafers of different MoS2 thicknesses, which 
explains the color differences and demonstrates thickness 
control. The Raman spectra offset vertically on each wafer are 
from center, middle and edge locations of the wafer showing 
excellent within wafer thickness control for all four TMD 
materials.  
An alternative TMD growth approach which enables grain 
boundary free devices is a controlled nucleation approach or 
nucleated CVD growth from pre-patterned seeds. By pre-
defining the metal oxide seed locations, we can restrict the 
TMD crystal location. This moves the metal source directly 
onto the wafer, skirting around the use of solid source metal 
oxides. By utilizing this nucleation approach and improving the 
process from our previous results [4] Fig. 8. We demonstrate 
high quality growth of monolayer WS2 with an ION of 22 
A/m, the best published result using nucleated seed CVD 
growth Fig. 9.   
III. CONTACT RESISTANCE 
Low contact resistance to PMOS and NMOS remains a 
challenge for 2D FET, primarily due to Fermi level pinning of 
the contact and material interactions between the TMD and 
metal contacts [14].  Here we present two advances on 
electrically contacting TMD materials.  First, we share our new 
NMOS contact material Sb with a relative comparison between 
Au, Bi and Sb contacts Fig. 10.   Using the top 10 percentile of 
devices at each channel length (LCH) we find Sb (RC = 146 
−m) outperforms Bi (RC = 2.5 k−m) on MoS2, although 
Bi with an equally low RC on MoS2 has been shown [7].  
Because of its higher melting point, Sb has an intrinsic 
advantage over either Bi or Sn: (Sb = 631 °C, Bi = 271 °C, Sn 
= 231 °C). Therefore, it will survive BEOL temperatures, 
whereas Bi and Sn contacts will melt during BEOL processing.  
PMOS contact advancement is far behind NMOS contact 
particularly with deposited 2D TMD films.  Recent PMOS 
contact advances rely on exfoliated flakes [15]. In our 
experiments, we find Ru contacts are superior to both 
traditional Pd contacts and novel Cu contacts [8]. Figure 11 
shows a grown monolayer WSe2 FET with Ru contacts, it has a 
record drive current of 50 A/m ION for devices with good SS 
and ION/IOFF ~ 7.5 orders of magnitude. The Rtotal vs LG plot 
demonstrates a Ru RC of 2.7 k−m. This is a significant step 
forward in making 2D PMOS devices on manufacturable 2D 
transistors. Additional challenge remains to successfully dope 
the contacts to TMD materials. 
IV. GATE STACK QUALITY 
2D van der Waals materials are well known to collect 
organic processing residues as well as adventitious carbon.  
Carbon-based surface contaminants can inhibit ALD 
nucleation and prevent high quality gate oxide growth, an 
already challenging process as 2D materials lack dangling 
bonds required for standard ALD growth.  In Fig. 12, we 
compare 2D channel surface treatments, including a 400 °C 
1hr vacuum anneal and a 300 °C 1hr forming gas anneal 
(FGA), for MoS2 films directly grown and transferred onto an 
oxide substrate.  XPS shows both anneals effectively reduce 
carbon contaminants.  The additional carbon peaks detected for 
the transferred film from transfer process residues are also 
fully eliminated with the anneal treatments. The FGA 
treatment gives narrower FWHM Raman peaks corresponding 
to improved MoS2 quality and enables gate oxide growth with 
oxide coverage reaching 100%.   
In Fig. 13(a) a MOSCAP device with ML MoS2 and 
AlOx/HfO2 bilayer shows large frequency dispersion in CV 
measurements before annealing. After the FGA the frequency 
dispersion is eliminated, indicating improved gate oxide 
quality and contact to MoS2. In Figs. 13(b)-(d), IDVG curves 
for devices with transferred ML MoS2 show 10× increase to 
ION and about 50% reduction in SS after FGA curing, 
demonstrating the importance of contaminant-free TMD 
channels. 
V. 
  CONCLUSION 
By comparing data presented with the best published data, 
a clear picture of the state of 2D FET emerges.  We present the 
data in both table (Table 1) and graphical (Fig 14) formats to 
give a clear view of the 2D landscape relative to Si target.  For 
the benchmark we include only TMD FETs that meet the 
following criteria: FETs made from grown 1-3 monolayer films 
which can be transferred, Ion/Ioff > 106 and SS < 1000 mV/dec. 
[9-13].  We included a very thick PMOS exception to the rule 
because of the lack of high current 2D PMOS on grown films 
[13].  The results show two key points. First the NMOS data is 
approaching silicon but still ~3× lower at target SS.  Secondly, 
the PMOS data is half an order of magnitude behind NMOS, 
mostly due to contact resistance, and requires more research if 
TMDs are to replace Si CMOS.   
In summary, we have shown new directions in both NMOS 
contacts [Sb contacts: RC = 146 −m, melting point 631 °C] 
and PMOS contacts [Ru contacts: RC = 2.7 k−m].  The new 
Ru contacts allowed us to achieve record PMOS FET 
performance on grown 2D TMD monolayer films with 50 
A/m Ion and 141 mV/dec SS. We achieved BEOL 
compatible 300 mm MOCVD deposition of 4 different types of 
2D TMD materials and a new record drive current for seeded 
nucleated growth of WS2 with 22 A/m.   
REFERENCES  
[1] R. Chau, IEDM, 2019, pp. 1.1.1-1.1.6. [2] M. Luisier, IEDM, 2016, pp. 
5.4.1-5.4.4.  [3] K. Liu, Nano Lett., 14, 9, 2014.  [4] Dorow et al VLSI 2021  
[5] I Asselberghs et al IEDM 2020 [6] S Eichfeld et al ACS Nano 2015 9 (2), 
2080-2087 [7] PC Shen et al Nature 593, 211–217 (2021) [8] CM Smyth et al, 
ACS Appl. Nano Mater. 2019, 2, 1, 75–88 [9] Lin et al VLSI 2021 [10] CD 
English et al (IEDM), 2016, pp. 5.6.1-5.6.4 [11] Zhu et al Nano Lett. 2018, 18, 
3807-3813 [12] C. Cheng, VLSI, 2019, pp. T244-T245 [13] K. Li, VLSI, 2016, 
pp. 1-2.  [14] K Sotthewes et al J. Phys. Chem. C 2019, 123, 9, 5411–5420 [15] 
HJ Chuang et al Nano Lett. 2016, 16, 1896-1902 
 
7.1.2
IEDM21-147
Authorized licensed use limited to: FUDAN UNIVERSITY. Downloaded on April 02,2026 at 10:59:37 UTC from IEEE Xplore.  Restrictions apply. 
 
 
     
   
 
Fig. 5. (a) top down SEM of short channel device (b) cross section 
TEM of the same short channel device (c) IDVG of the same short 
channel device. High- dielectrics need to continue to scale to 
achieve target SS. 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
 
Fig. 2. Lab based wafer 
process flow. 
 
Fig 3. HAADF image of MoS2 
taken 
by 
ACSTEM. 
The 
brighter atoms correspond to a 
Molybdenum atom whereas the 
dimmer 
colored 
atoms 
correspond to two S atoms, as 
described in the ball-stick 
model inserted in the image.   
Acknowledgement JEOL Ltd.   
2 nm
       
 
Fig. 4. Impact of a device 
sitting at room temperature 
in N2 for 2 weeks, ION 
improves (64 mA/mm to 
159 mA/mm), SS improves 
(210 to 140 mV/dec) and the 
Vt shifts +0.2 V.    
 
 
Fig. 7: (a) Raman spectra of the four TMDs grown on 300 mm wafers on 100 nm SiO2/Si, detailing the 
characteristic E and A1 modes among others for each material. All four materials are deposited at BEOL 
compatible temperatures in under one hour. (b, c, d) Optical images with inset Raman data demonstrating 
superb within-wafer uniformity and color change as a function of film thickness. MoS2 is used as the 
example as the E-A1 peak separation Δf directly correlates with film thickness. The three spectra shown 
in each inset are taken at the wafer center, mid-radius, and 1 cm from the edge.  
 
  
 
Fig. 9. Best WS2 device made by the nucleated pre-
patterned seed growth method.  WS2 grows from an on 
wafer WOX seed achieving 22 A/m ION and ION/IOFF 
ratio > 106. Device SS limited by the 100 nm SiO2 back-
gate.  To the right we show an optical top down image 
of device.  
 
 
Fig. 8. Process flow for nucleated seed CVD growth.  
 
Fig 1. (a) Structure used to simulate IV and CV characteristics of Si and MoS2 stacked nanoribbon NMOS transistor. The sub-nm channel in the MoS2 case 
allows one to scale LG down to 5nm and aggressively shrink poly-pitch. It also enables more ribbons to be stacked in the same vertical space. (b) MoS2 
parameters used in the Sentaurus device simulation. A 2D DOS with constant mobility was assumed. No changes were made in the gate stack relative to 
silicon case.  (c) Assuming a mobility of 100 cm2/Vs and 2× higher contact resistance for 2D TMD we still observed a 5% increase in ISEFF at Vcc=0.65V 
(d) Scaling the LG down to 5 nm results in significant gate capacitance reduction of approximately 30%.   
7.1.3
IEDM21-148
Authorized licensed use limited to: FUDAN UNIVERSITY. Downloaded on April 02,2026 at 10:59:37 UTC from IEEE Xplore.  Restrictions apply. 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
Fig. 12. (a)-(b) XPS shows removal of carbon residues through anneals. (c) Reduced 
FWHM from Raman spectroscopy shows improved MoS2 quality post-FGA. (d)-(i) 
Al2O3 growth coverage on MoS2 film increases to 100% with FGA. 
 
Table 1. Comparison table of device performance at 1V VD for both NMOS and 
PMOS TMD FETs. Criteria for selection was grown or transferred TMD films of 
1-3ML in all but one PMOS case. Further we only included FETs with ION/IOFF 
ratios > 106 and SS less than 1000 mV/dec.  In general, the PMOS devices lag the 
progress of NMOS devices.   
  
 
Fig. 11. (a) IDVG curves at -1V VD for 4 different wafers with WSe2 and Pd, 
Cu or Ru contacts, Ru has the highest ION in the group and the lowest RC.  (b) 
RTOTAL vs LCH plot of Ru contacts, RC = 2.7 k−m, via fitting the top 25 
percentile data at each LCH where VD = -50 mV and VG = VOFF - 2.5V    (c) 
IDVG for best device with Ru contacts, 50 A/m ION and 141mV/dec SS.  
 
 
Fig. 10. NMOS contact comparison between Au, Bi and Sb. (a) Each point is the RC of 
an individual wafer with MoS2 film and different contact metal. RTOTAL vs LCH plots to 
solve for RC (b) Au w/ RC = 4.7 k−m, (c) Bi /w RC = 2.5 k−m, (d) three wafers 
with Sb contacts with best wafer RC = 146 −m,  The plots are fits of the top 10 
percentile data at each LCH per wafer where VD = 50 mV and VG = VOFF + 2.5V    
Fig. 13. (a) CV frequency dispersion reduced post-FGA for MOSCAP device 
with ML MoS2 and AlOx/HfO2 bilayer. (b)-(d) IDVG curves for transferred ML 
MoS2 show 10× increase to ION and ~50% reduction in SS after FGA cleaning.  
 
  
  
Fig. 14. Graphic of 2D benchmarking of devices from the Fig. 14. table using the 
same XY scales for ease of comparison.  2D TMD FETs must approach the Si 
state of the art to be competitive as a FEOL replacement. 
7.1.4
IEDM21-149
Authorized licensed use limited to: FUDAN UNIVERSITY. Downloaded on April 02,2026 at 10:59:37 UTC from IEEE Xplore.  Restrictions apply. 
