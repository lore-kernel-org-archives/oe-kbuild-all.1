Content-Type: multipart/mixed; boundary="===============5855202162964429477=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:6679:13: warning: stack frame size of 2656 bytes in function 'UseMinimumDCFCLK'
Date: Thu, 06 May 2021 06:02:25 +0800
Message-ID: <202105060620.OLely0RZ-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5855202162964429477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alex,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d665ea6ea86c785760ee4bad4543dab3267ad074
commit: 20f2ffe504728612d7b0c34e4f8280e34251e704 drm/amdgpu: fold CONFIG_DR=
M_AMD_DC_DCN3* into CONFIG_DRM_AMD_DC_DCN (v3)
date:   6 months ago
config: powerpc-randconfig-r016-20210505 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f5a2a=
5836cc8e4c1def2bdeb022e7b496623439)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D20f2ffe504728612d7b0c34e4f8280e34251e704
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 20f2ffe504728612d7b0c34e4f8280e34251e704
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c=
:1917:13: warning: stack frame size of 9072 bytes in function 'DISPCLKDPPCL=
KDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wf=
rame-larger-than=3D]
   static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndP=
erformanceCalculation(
               ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c=
:3641:6: warning: stack frame size of 9104 bytes in function 'dml30_ModeSup=
portAndSystemConfigurationFull' [-Wframe-larger-than=3D]
   void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib=
 *mode_lib)
        ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c=
:6679:13: warning: stack frame size of 2656 bytes in function 'UseMinimumDC=
FCLK' [-Wframe-larger-than=3D]
   static void UseMinimumDCFCLK(
               ^
   3 warnings generated.
--
                           ^
   <scratch space>:155:1: note: expanded from here
   DCN_BASE__INST0_SEG3
   ^
   drivers/gpu/drm/amd/amdgpu/../include/sienna_cichlid_ip_offset.h:373:52:=
 note: expanded from macro 'DCN_BASE__INST0_SEG3'
   #define DCN_BASE__INST0_SEG3                       0x00009000
                                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:753:3: n=
ote: previous initialization is here
                   HWSEQ_DCN30_REG_LIST()
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:341:2: note: ex=
panded from macro 'HWSEQ_DCN30_REG_LIST'
           HWSEQ_DCN2_REG_LIST(),\
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:244:2: note: ex=
panded from macro 'HWSEQ_DCN2_REG_LIST'
           SR(MPC_CRC_RESULT_C), \
           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:247:15: =
note: expanded from macro 'SR'
                   .reg_name =3D BASE(mm ## reg_name ## _BASE_IDX) +  \
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:242:25: =
note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:170:1: note: expanded from here
   DCN_BASE__INST0_SEG3
   ^
   drivers/gpu/drm/amd/amdgpu/../include/sienna_cichlid_ip_offset.h:373:52:=
 note: expanded from macro 'DCN_BASE__INST0_SEG3'
   #define DCN_BASE__INST0_SEG3                       0x00009000
                                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:753:3: w=
arning: initializer overrides prior initialization of this subobject [-Wini=
tializer-overrides]
                   HWSEQ_DCN30_REG_LIST()
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:357:2: note: ex=
panded from macro 'HWSEQ_DCN30_REG_LIST'
           SR(MPC_CRC_RESULT_AR), \
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:247:15: =
note: expanded from macro 'SR'
                   .reg_name =3D BASE(mm ## reg_name ## _BASE_IDX) +  \
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:244:19: =
note: expanded from macro 'BASE'
   #define BASE(seg) BASE_INNER(seg)
                     ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:242:25: =
note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:159:1: note: expanded from here
   DCN_BASE__INST0_SEG3
   ^
   drivers/gpu/drm/amd/amdgpu/../include/sienna_cichlid_ip_offset.h:373:52:=
 note: expanded from macro 'DCN_BASE__INST0_SEG3'
   #define DCN_BASE__INST0_SEG3                       0x00009000
                                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:753:3: n=
ote: previous initialization is here
                   HWSEQ_DCN30_REG_LIST()
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:341:2: note: ex=
panded from macro 'HWSEQ_DCN30_REG_LIST'
           HWSEQ_DCN2_REG_LIST(),\
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:245:2: note: ex=
panded from macro 'HWSEQ_DCN2_REG_LIST'
           SR(MPC_CRC_RESULT_AR), \
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:247:15: =
note: expanded from macro 'SR'
                   .reg_name =3D BASE(mm ## reg_name ## _BASE_IDX) +  \
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:242:25: =
note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:174:1: note: expanded from here
   DCN_BASE__INST0_SEG3
   ^
   drivers/gpu/drm/amd/amdgpu/../include/sienna_cichlid_ip_offset.h:373:52:=
 note: expanded from macro 'DCN_BASE__INST0_SEG3'
   #define DCN_BASE__INST0_SEG3                       0x00009000
                                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:875:6: w=
arning: no previous prototype for function 'dcn30_dpp_destroy' [-Wmissing-p=
rototypes]
   void dcn30_dpp_destroy(struct dpp **dpp)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:875:1: n=
ote: declare 'static' if the function is not intended to be used outside of=
 this translation unit
   void dcn30_dpp_destroy(struct dpp **dpp)
   ^
   static =

   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:992:16: =
warning: no previous prototype for function 'dcn30_hubbub_create' [-Wmissin=
g-prototypes]
   struct hubbub *dcn30_hubbub_create(struct dc_context *ctx)
                  ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:992:1: n=
ote: declare 'static' if the function is not intended to be used outside of=
 this translation unit
   struct hubbub *dcn30_hubbub_create(struct dc_context *ctx)
   ^
   static =

   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:1143:24:=
 warning: no previous prototype for function 'dcn30_stream_encoder_create' =
[-Wmissing-prototypes]
   struct stream_encoder *dcn30_stream_encoder_create(
                          ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:1143:1: =
note: declare 'static' if the function is not intended to be used outside o=
f this translation unit
   struct stream_encoder *dcn30_stream_encoder_create(
   ^
   static =

   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:1175:19:=
 warning: no previous prototype for function 'dcn30_hwseq_create' [-Wmissin=
g-prototypes]
   struct dce_hwseq *dcn30_hwseq_create(
                     ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:1175:1: =
note: declare 'static' if the function is not intended to be used outside o=
f this translation unit
   struct dce_hwseq *dcn30_hwseq_create(
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:1959:13:=
 warning: stack frame size of 3216 bytes in function 'dcn30_internal_valida=
te_bw' [-Wframe-larger-than=3D]
   static bool dcn30_internal_validate_bw(
               ^
   116 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_PCI_POWERNV
   Depends on PCI && HOTPLUG_PCI && PPC_POWERNV && EEH
   Selected by
   - OCXL && PPC_POWERNV && PCI && EEH


vim +/UseMinimumDCFCLK +6679 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/d=
cn30/display_mode_vba_30.c

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6677  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6678  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21 @6679  static void UseMinimumDC=
FCLK(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6680  		struct display_mode_li=
b *mode_lib,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6681  		int MaxInterDCNTileRep=
eaters,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6682  		int MaxPrefetchMode,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6683  		double FinalDRAMClockC=
hangeLatency,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6684  		double SREnterPlusExit=
Time,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6685  		int ReturnBusWidth,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6686  		int RoundTripPingLaten=
cyCycles,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6687  		int ReorderingBytes,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6688  		int PixelChunkSizeInKB=
yte,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6689  		int MetaChunkSize,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6690  		bool GPUVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6691  		int GPUVMMaxPageTableL=
evels,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6692  		bool HostVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6693  		int NumberOfActivePlan=
es,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6694  		double HostVMMinPageSi=
ze,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6695  		int HostVMMaxNonCached=
PageTableLevels,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6696  		bool DynamicMetadataVM=
Enabled,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6697  		enum immediate_flip_re=
quirement ImmediateFlipRequirement,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6698  		bool ProgressiveToInte=
rlaceUnitInOPP,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6699  		double MaxAveragePerce=
ntOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6700  		double PercentOfIdealD=
RAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6701  		double PercentOfIdealD=
RAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6702  		double PercentOfIdealD=
RAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6703  		int VTotal[],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6704  		int VActive[],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6705  		int DynamicMetadataTra=
nsmittedBytes[],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6706  		int DynamicMetadataLin=
esBeforeActiveRequired[],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6707  		bool Interlace[],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6708  		double RequiredDPPCLK[=
][2][DC__NUM_DPP__MAX],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6709  		double RequiredDISPCLK=
[][2],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6710  		double UrgLatency[],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6711  		unsigned int NoOfDPP[]=
[2][DC__NUM_DPP__MAX],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6712  		double ProjectedDCFCLK=
DeepSleep[][2],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6713  		double MaximumVStartup=
[][2][DC__NUM_DPP__MAX],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6714  		double TotalVActivePix=
elBandwidth[][2],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6715  		double TotalVActiveCur=
sorBandwidth[][2],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6716  		double TotalMetaRowBan=
dwidth[][2],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6717  		double TotalDPTERowBan=
dwidth[][2],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6718  		unsigned int TotalNumb=
erOfActiveDPP[][2],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6719  		unsigned int TotalNumb=
erOfDCCActiveDPP[][2],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6720  		int dpte_group_bytes[],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6721  		double PrefetchLinesY[=
][2][DC__NUM_DPP__MAX],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6722  		double PrefetchLinesC[=
][2][DC__NUM_DPP__MAX],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6723  		int swath_width_luma_u=
b_all_states[][2][DC__NUM_DPP__MAX],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6724  		int swath_width_chroma=
_ub_all_states[][2][DC__NUM_DPP__MAX],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6725  		int BytePerPixelY[],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6726  		int BytePerPixelC[],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6727  		int HTotal[],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6728  		double PixelClock[],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6729  		double PDEAndMetaPTEBy=
tesPerFrame[][2][DC__NUM_DPP__MAX],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6730  		double DPTEBytesPerRow=
[][2][DC__NUM_DPP__MAX],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6731  		double MetaRowBytes[][=
2][DC__NUM_DPP__MAX],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6732  		bool DynamicMetadataEn=
able[],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6733  		double VActivePixelBan=
dwidth[][2][DC__NUM_DPP__MAX],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6734  		double VActiveCursorBa=
ndwidth[][2][DC__NUM_DPP__MAX],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6735  		double ReadBandwidthLu=
ma[],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6736  		double ReadBandwidthCh=
roma[],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6737  		double DCFCLKPerState[=
],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6738  		double DCFCLKState[][2=
])
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6739  {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6740  	double   NormalEfficien=
cy =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6741  	double   PTEEfficiency =
=3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6742  	double   TotalMaxPrefet=
chFlipDPTERowBandwidth[DC__VOLTAGE_STATES][2] =3D { { 0 } };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6743  	unsigned int i, j, k;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6744  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6745  	NormalEfficiency =3D  (=
HostVMEnable =3D=3D true ? PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfte=
rUrgLatencyPixelMixedWithVMData
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6746  			: PercentOfIdealDRAMF=
abricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly) / 100.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6747  	PTEEfficiency =3D  (Hos=
tVMEnable =3D=3D true ? PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUr=
gLatencyVMDataOnly
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6748  			/ PercentOfIdealDRAMF=
abricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData : 1.0);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6749  	for (i =3D 0; i < mode_=
lib->soc.num_states; ++i) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6750  		for (j =3D 0; j <=3D 1=
; ++j) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6751  			double PixelDCFCLKCyc=
lesRequiredInPrefetch[DC__NUM_DPP__MAX] =3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6752  			double PrefetchPixelL=
inesTime[DC__NUM_DPP__MAX] =3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6753  			double DCFCLKRequired=
ForPeakBandwidthPerPlane[DC__NUM_DPP__MAX] =3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6754  			double DynamicMetadat=
aVMExtraLatency[DC__NUM_DPP__MAX] =3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6755  			double MinimumTWait =
=3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6756  			double NonDPTEBandwid=
th =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6757  			double DPTEBandwidth =
=3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6758  			double DCFCLKRequired=
ForAverageBandwidth =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6759  			double ExtraLatencyBy=
tes =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6760  			double ExtraLatencyCy=
cles =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6761  			double DCFCLKRequired=
ForPeakBandwidth =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6762  			int NoOfDPPState[DC__=
NUM_DPP__MAX] =3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6763  			double MinimumTvmPlus=
2Tr0 =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6764  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6765  			TotalMaxPrefetchFlipD=
PTERowBandwidth[i][j] =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6766  			for (k =3D 0; k < Num=
berOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6767  				TotalMaxPrefetchFlip=
DPTERowBandwidth[i][j] =3D TotalMaxPrefetchFlipDPTERowBandwidth[i][j]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6768  					+ NoOfDPP[i][j][k] =
* DPTEBytesPerRow[i][j][k] / (15.75 * HTotal[k] / PixelClock[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6769  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6770  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6771  			for (k =3D 0; k <=3D =
NumberOfActivePlanes - 1; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6772  				NoOfDPPState[k] =3D =
NoOfDPP[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6773  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6774  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6775  			MinimumTWait =3D Calc=
ulateTWait(MaxPrefetchMode, FinalDRAMClockChangeLatency, UrgLatency[i], SRE=
nterPlusExitTime);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6776  			NonDPTEBandwidth =3D =
TotalVActivePixelBandwidth[i][j] + TotalVActiveCursorBandwidth[i][j] + Tota=
lMetaRowBandwidth[i][j];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6777  			DPTEBandwidth =3D  (H=
ostVMEnable =3D=3D true || ImmediateFlipRequirement =3D=3D dm_immediate_fli=
p_required) ?
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6778  					TotalMaxPrefetchFli=
pDPTERowBandwidth[i][j] : TotalDPTERowBandwidth[i][j];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6779  			DCFCLKRequiredForAver=
ageBandwidth =3D dml_max3(ProjectedDCFCLKDeepSleep[i][j],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6780  					(NonDPTEBandwidth +=
 TotalDPTERowBandwidth[i][j]) / ReturnBusWidth / (MaxAveragePercentOfIdealS=
DPPortBWDisplayCanUseInNormalSystemOperation / 100),
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6781  					(NonDPTEBandwidth +=
 DPTEBandwidth / PTEEfficiency) / NormalEfficiency / ReturnBusWidth);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6782  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6783  			ExtraLatencyBytes =3D=
 CalculateExtraLatencyBytes(ReorderingBytes, TotalNumberOfActiveDPP[i][j], =
PixelChunkSizeInKByte, TotalNumberOfDCCActiveDPP[i][j],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6784  					MetaChunkSize, GPUV=
MEnable, HostVMEnable, NumberOfActivePlanes, NoOfDPPState, dpte_group_bytes,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6785  					PercentOfIdealDRAMF=
abricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData, PercentOfIdea=
lDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6786  					HostVMMinPageSize, =
HostVMMaxNonCachedPageTableLevels);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6787  			ExtraLatencyCycles =
=3D RoundTripPingLatencyCycles + 32 + ExtraLatencyBytes / NormalEfficiency =
/ ReturnBusWidth;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6788  			for (k =3D 0; k < Num=
berOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6789  				double DCFCLKCyclesR=
equiredInPrefetch =3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6790  				double ExpectedPrefe=
tchBWAcceleration =3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6791  				double PrefetchTime =
=3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6792  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6793  				PixelDCFCLKCyclesReq=
uiredInPrefetch[k] =3D (PrefetchLinesY[i][j][k] * swath_width_luma_ub_all_s=
tates[i][j][k] * BytePerPixelY[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6794  					+ PrefetchLinesC[i]=
[j][k] * swath_width_chroma_ub_all_states[i][j][k] * BytePerPixelC[k]) / No=
rmalEfficiency / ReturnBusWidth;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6795  				DCFCLKCyclesRequired=
InPrefetch =3D 2 * ExtraLatencyCycles / NoOfDPPState[k] + PDEAndMetaPTEByte=
sPerFrame[i][j][k] / PTEEfficiency
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6796  					/ NormalEfficiency =
/ ReturnBusWidth *  (GPUVMMaxPageTableLevels > 2 ? 1 : 0) + 2 * DPTEBytesPe=
rRow[i][j][k] / PTEEfficiency
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6797  					/ NormalEfficiency =
/ ReturnBusWidth + 2 * MetaRowBytes[i][j][k] / NormalEfficiency / ReturnBus=
Width + PixelDCFCLKCyclesRequiredInPrefetch[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6798  				PrefetchPixelLinesTi=
me[k] =3D dml_max(PrefetchLinesY[i][j][k], PrefetchLinesC[i][j][k]) * HTota=
l[k] / PixelClock[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6799  				ExpectedPrefetchBWAc=
celeration =3D (VActivePixelBandwidth[i][j][k] + VActiveCursorBandwidth[i][=
j][k]) / (ReadBandwidthLuma[k] + ReadBandwidthChroma[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6800  				DynamicMetadataVMExt=
raLatency[k] =3D (GPUVMEnable =3D=3D true && DynamicMetadataEnable[k] =3D=
=3D true && DynamicMetadataVMEnabled =3D=3D true) ?
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6801  						UrgLatency[i] * GP=
UVMMaxPageTableLevels *  (HostVMEnable =3D=3D true ? HostVMMaxNonCachedPage=
TableLevels + 1 : 1) : 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6802  				PrefetchTime =3D (Ma=
ximumVStartup[i][j][k] - 1) * HTotal[k] / PixelClock[k] - MinimumTWait - Ur=
gLatency[i] * ((GPUVMMaxPageTableLevels <=3D 2 ? GPUVMMaxPageTableLevels
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6803  						: GPUVMMaxPageTabl=
eLevels - 2) * (HostVMEnable =3D=3D true ? HostVMMaxNonCachedPageTableLevel=
s + 1 : 1) - 1) - DynamicMetadataVMExtraLatency[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6804  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6805  				if (PrefetchTime > 0=
) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6806  					double ExpectedVRat=
ioPrefetch =3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6807  					ExpectedVRatioPrefe=
tch =3D PrefetchPixelLinesTime[k] / (PrefetchTime * PixelDCFCLKCyclesRequir=
edInPrefetch[k] / DCFCLKCyclesRequiredInPrefetch);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6808  					DCFCLKRequiredForPe=
akBandwidthPerPlane[k] =3D NoOfDPPState[k] * PixelDCFCLKCyclesRequiredInPre=
fetch[k] / PrefetchPixelLinesTime[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6809  						* dml_max(1.0, Exp=
ectedVRatioPrefetch) * dml_max(1.0, ExpectedVRatioPrefetch / 4) * ExpectedP=
refetchBWAcceleration;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6810  					if (HostVMEnable =
=3D=3D true || ImmediateFlipRequirement =3D=3D dm_immediate_flip_required) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6811  						DCFCLKRequiredForP=
eakBandwidthPerPlane[k] =3D DCFCLKRequiredForPeakBandwidthPerPlane[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6812  							+ NoOfDPPState[k]=
 * DPTEBandwidth / PTEEfficiency / NormalEfficiency / ReturnBusWidth;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6813  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6814  				} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6815  					DCFCLKRequiredForPe=
akBandwidthPerPlane[k] =3D DCFCLKPerState[i];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6816  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6817  				if (DynamicMetadataE=
nable[k] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6818  					double TsetupPipe =
=3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6819  					double TdmbfPipe =
=3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6820  					double TdmsksPipe =
=3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6821  					double TdmecPipe =
=3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6822  					double AllowedTimeF=
orUrgentExtraLatency =3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6823  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6824  					CalculateDynamicMet=
adataParameters(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6825  							MaxInterDCNTileRe=
peaters,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6826  							RequiredDPPCLK[i]=
[j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6827  							RequiredDISPCLK[i=
][j],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6828  							ProjectedDCFCLKDe=
epSleep[i][j],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6829  							PixelClock[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6830  							HTotal[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6831  							VTotal[k] - VActi=
ve[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6832  							DynamicMetadataTr=
ansmittedBytes[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6833  							DynamicMetadataLi=
nesBeforeActiveRequired[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6834  							Interlace[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6835  							ProgressiveToInte=
rlaceUnitInOPP,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6836  							&TsetupPipe,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6837  							&TdmbfPipe,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6838  							&TdmecPipe,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6839  							&TdmsksPipe);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6840  					AllowedTimeForUrgen=
tExtraLatency =3D MaximumVStartup[i][j][k] * HTotal[k] / PixelClock[k] - Mi=
nimumTWait - TsetupPipe
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6841  							- TdmbfPipe - Tdm=
ecPipe - TdmsksPipe - DynamicMetadataVMExtraLatency[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6842  					if (AllowedTimeForU=
rgentExtraLatency > 0) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6843  						DCFCLKRequiredForP=
eakBandwidthPerPlane[k] =3D dml_max(DCFCLKRequiredForPeakBandwidthPerPlane[=
k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6844  								ExtraLatencyCycl=
es / AllowedTimeForUrgentExtraLatency);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6845  					} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6846  						DCFCLKRequiredForP=
eakBandwidthPerPlane[k] =3D DCFCLKPerState[i];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6847  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6848  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6849  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6850  			DCFCLKRequiredForPeak=
Bandwidth =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6851  			for (k =3D 0; k <=3D =
NumberOfActivePlanes - 1; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6852  				DCFCLKRequiredForPea=
kBandwidth =3D DCFCLKRequiredForPeakBandwidth + DCFCLKRequiredForPeakBandwi=
dthPerPlane[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6853  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6854  			MinimumTvmPlus2Tr0 =
=3D UrgLatency[i] * (GPUVMEnable =3D=3D true ? (HostVMEnable =3D=3D true ?
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6855  					(GPUVMMaxPageTableL=
evels + 2) * (HostVMMaxNonCachedPageTableLevels + 1) - 1 : GPUVMMaxPageTabl=
eLevels + 1) : 0);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6856  			for (k =3D 0; k < Num=
berOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6857  				double MaximumTvmPlu=
s2Tr0PlusTsw =3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6858  				MaximumTvmPlus2Tr0Pl=
usTsw =3D (MaximumVStartup[i][j][k] - 2) * HTotal[k] / PixelClock[k] - Mini=
mumTWait - DynamicMetadataVMExtraLatency[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6859  				if (MaximumTvmPlus2T=
r0PlusTsw <=3D MinimumTvmPlus2Tr0 + PrefetchPixelLinesTime[k] / 4) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6860  					DCFCLKRequiredForPe=
akBandwidth =3D DCFCLKPerState[i];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6861  				} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6862  					DCFCLKRequiredForPe=
akBandwidth =3D dml_max3(DCFCLKRequiredForPeakBandwidth, 2 * ExtraLatencyCy=
cles
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6863  							/ (MaximumTvmPlus=
2Tr0PlusTsw - MinimumTvmPlus2Tr0 - PrefetchPixelLinesTime[k] / 4),
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6864  						(2 * ExtraLatencyC=
ycles + PixelDCFCLKCyclesRequiredInPrefetch[k]) / (MaximumTvmPlus2Tr0PlusTs=
w - MinimumTvmPlus2Tr0));
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6865  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6866  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6867  			DCFCLKState[i][j] =3D=
 dml_min(DCFCLKPerState[i], 1.05 * (1 + mode_lib->vba.PercentMarginOverMini=
mumRequiredDCFCLK / 100)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6868  					* dml_max(DCFCLKReq=
uiredForAverageBandwidth, DCFCLKRequiredForPeakBandwidth));
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6869  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6870  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6871  }
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  6872  =


:::::: The code at line 6679 was first introduced by commit
:::::: 6725a88f88a7e922e91c45bf83d320487810c192 drm/amd/display: Add DCN3 D=
ML

:::::: TO: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5855202162964429477==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
OMeFf1V19CAIYkHZL+J/KHo6E1g9AQA=
--===============5855202162964429477==--

