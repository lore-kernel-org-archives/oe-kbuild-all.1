Content-Type: multipart/mixed; boundary="===============1760101373017417167=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3640:6: warning: stack frame size of 2104 bytes in function 'dml30_ModeSupportAndSystemConfigurationFull'
Date: Mon, 26 Oct 2020 12:07:53 +0800
Message-ID: <202010261250.hwc1OKsw-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1760101373017417167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Bhawanpreet,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3650b228f83adda7e5ee532e2b90429c03f7b9ec
commit: 96134346bb6ae3f212617dd66a1105250f31a7ef drm/amd/display: Add DCN3 =
to Kconfig
date:   4 months ago
config: x86_64-randconfig-r003-20201026 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 1c8371=
692dfe8245bc6690ff1262dcced4649d21)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D96134346bb6ae3f212617dd66a1105250f31a7ef
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 96134346bb6ae3f212617dd66a1105250f31a7ef
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c=
:3640:6: warning: stack frame size of 2104 bytes in function 'dml30_ModeSup=
portAndSystemConfigurationFull' [-Wframe-larger-than=3D]
   void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib=
 *mode_lib)
        ^
   1 warning generated.

vim +/dml30_ModeSupportAndSystemConfigurationFull +3640 drivers/gpu/drm/amd=
/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3639  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21 @3640  void dml30_ModeSupportAn=
dSystemConfigurationFull(struct display_mode_lib *mode_lib)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3641  {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3642  	struct vba_vars_st *v =
=3D &mode_lib->vba;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3643  	int MinPrefetchMode =3D=
 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3644  	int MaxPrefetchMode =3D=
 2;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3645  	int i;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3646  	unsigned int j, k, m;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3647  	bool   EnoughWritebackU=
nits =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3648  	bool   WritebackModeSup=
port =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3649  	bool   ViewportExceedsS=
urface =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3650  	double MaxTotalVActiveR=
DBandwidth =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3651  	long ReorderingBytes =
=3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3652  	bool NotUrgentLatencyHi=
ding[DC__NUM_DPP__MAX] =3D { 0 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3653  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3654  	/*MODE SUPPORT, VOLTAGE=
 STATE AND SOC CONFIGURATION*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3655  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3656  	/*Scale Ratio, taps Sup=
port Check*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3657  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3658  	v->ScaleRatioAndTapsSup=
port =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3659  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3660  		if (v->ScalerEnabled[k=
] =3D=3D false
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3661  				&& ((v->SourcePixelF=
ormat[k] !=3D dm_444_64
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3662  						&& v->SourcePixelF=
ormat[k] !=3D dm_444_32
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3663  						&& v->SourcePixelF=
ormat[k] !=3D dm_444_16
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3664  						&& v->SourcePixelF=
ormat[k] !=3D dm_mono_16
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3665  						&& v->SourcePixelF=
ormat[k] !=3D dm_mono_8
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3666  						&& v->SourcePixelF=
ormat[k] !=3D dm_rgbe
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3667  						&& v->SourcePixelF=
ormat[k] !=3D dm_rgbe_alpha)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3668  						|| v->HRatio[k] !=
=3D 1.0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3669  						|| v->htaps[k] !=
=3D 1.0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3670  						|| v->VRatio[k] !=
=3D 1.0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3671  						|| v->vtaps[k] !=
=3D 1.0)) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3672  			v->ScaleRatioAndTapsS=
upport =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3673  		} else if (v->vtaps[k]=
 < 1.0 || v->vtaps[k] > 8.0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3674  				|| v->htaps[k] < 1.0=
 || v->htaps[k] > 8.0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3675  				|| (v->htaps[k] > 1.0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3676  						&& (v->htaps[k] % =
2) =3D=3D 1)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3677  				|| v->HRatio[k] > v-=
>MaxHSCLRatio
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3678  				|| v->VRatio[k] > v-=
>MaxVSCLRatio
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3679  				|| v->HRatio[k] > v-=
>htaps[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3680  				|| v->VRatio[k] > v-=
>vtaps[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3681  				|| (v->SourcePixelFo=
rmat[k] !=3D dm_444_64
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3682  						&& v->SourcePixelF=
ormat[k] !=3D dm_444_32
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3683  						&& v->SourcePixelF=
ormat[k] !=3D dm_444_16
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3684  						&& v->SourcePixelF=
ormat[k] !=3D dm_mono_16
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3685  						&& v->SourcePixelF=
ormat[k] !=3D dm_mono_8
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3686  						&& v->SourcePixelF=
ormat[k] !=3D dm_rgbe
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3687  						&& (v->VTAPsChroma=
[k] < 1
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3688  							|| v->VTAPsChroma=
[k] > 8
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3689  							|| v->HTAPsChroma=
[k] < 1
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3690  							|| v->HTAPsChroma=
[k] > 8
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3691  							|| (v->HTAPsChrom=
a[k] > 1 && v->HTAPsChroma[k] % 2 =3D=3D 1)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3692  							|| v->HRatioChrom=
a[k] > v->MaxHSCLRatio
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3693  							|| v->VRatioChrom=
a[k] > v->MaxVSCLRatio
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3694  							|| v->HRatioChrom=
a[k] > v->HTAPsChroma[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3695  							|| v->VRatioChrom=
a[k] > v->VTAPsChroma[k]))) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3696  			v->ScaleRatioAndTapsS=
upport =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3697  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3698  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3699  	/*Source Format, Pixel =
Format and Scan Support Check*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3700  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3701  	v->SourceFormatPixelAnd=
ScanSupport =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3702  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3703  		if ((v->SurfaceTiling[=
k] =3D=3D dm_sw_linear && (!(v->SourceScan[k] !=3D dm_vert) || v->DCCEnable=
[k] =3D=3D true))
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3704  				|| ((v->SurfaceTilin=
g[k] =3D=3D dm_sw_64kb_d || v->SurfaceTiling[k] =3D=3D dm_sw_64kb_d_t || v-=
>SurfaceTiling[k] =3D=3D dm_sw_64kb_d_x)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3705  						&& !(v->SourcePixe=
lFormat[k] =3D=3D dm_444_64))) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3706  			v->SourceFormatPixelA=
ndScanSupport =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3707  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3708  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3709  	/*Bandwidth Support Che=
ck*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3710  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3711  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3712  		CalculateBytePerPixelA=
nd256BBlockSizes(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3713  				v->SourcePixelFormat=
[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3714  				v->SurfaceTiling[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3715  				&v->BytePerPixelY[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3716  				&v->BytePerPixelC[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3717  				&v->BytePerPixelInDE=
TY[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3718  				&v->BytePerPixelInDE=
TC[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3719  				&v->Read256BlockHeig=
htY[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3720  				&v->Read256BlockHeig=
htC[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3721  				&v->Read256BlockWidt=
hY[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3722  				&v->Read256BlockWidt=
hC[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3723  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3724  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3725  		if (v->SourceScan[k] !=
=3D dm_vert) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3726  			v->SwathWidthYSingleD=
PP[k] =3D v->ViewportWidth[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3727  			v->SwathWidthCSingleD=
PP[k] =3D v->ViewportWidthChroma[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3728  		} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3729  			v->SwathWidthYSingleD=
PP[k] =3D v->ViewportHeight[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3730  			v->SwathWidthCSingleD=
PP[k] =3D v->ViewportHeightChroma[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3731  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3732  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3733  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3734  		v->ReadBandwidthLuma[k=
] =3D v->SwathWidthYSingleDPP[k] * dml_ceil(v->BytePerPixelInDETY[k], 1.0) =
/ (v->HTotal[k] / v->PixelClock[k]) * v->VRatio[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3735  		v->ReadBandwidthChroma=
[k] =3D v->SwathWidthYSingleDPP[k] / 2 * dml_ceil(v->BytePerPixelInDETC[k],=
 2.0) / (v->HTotal[k] / v->PixelClock[k]) * v->VRatio[k] / 2.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3736  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3737  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3738  		if (v->WritebackEnable=
[k] =3D=3D true
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3739  				&& v->WritebackPixel=
Format[k] =3D=3D dm_444_64) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3740  			v->WriteBandwidth[k] =
=3D v->WritebackDestinationWidth[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3741  					* v->WritebackDesti=
nationHeight[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3742  					/ (v->WritebackSour=
ceHeight[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3743  							* v->HTotal[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3744  							/ v->PixelClock[k=
]) * 8.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3745  		} else if (v->Writebac=
kEnable[k] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3746  			v->WriteBandwidth[k] =
=3D v->WritebackDestinationWidth[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3747  					* v->WritebackDesti=
nationHeight[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3748  					/ (v->WritebackSour=
ceHeight[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3749  							* v->HTotal[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3750  							/ v->PixelClock[k=
]) * 4.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3751  		} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3752  			v->WriteBandwidth[k] =
=3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3753  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3754  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3755  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3756  	/*Writeback Latency sup=
port check*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3757  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3758  	v->WritebackLatencySupp=
ort =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3759  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3760  		if (v->WritebackEnable=
[k] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3761  			if (v->WritebackConfi=
guration =3D=3D dm_whole_buffer_for_single_stream_no_interleave ||
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3762  			    v->WritebackConfi=
guration =3D=3D dm_whole_buffer_for_single_stream_interleave) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3763  				if (v->WriteBandwidt=
h[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3764  						> 2.0 * v->Writeba=
ckInterfaceBufferSize * 1024
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3765  								/ v->WritebackLa=
tency) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3766  					v->WritebackLatency=
Support =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3767  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3768  			} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3769  				if (v->WriteBandwidt=
h[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3770  						> v->WritebackInte=
rfaceBufferSize * 1024
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3771  								/ v->WritebackLa=
tency) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3772  					v->WritebackLatency=
Support =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3773  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3774  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3775  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3776  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3777  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3778  	/*Writeback Mode Suppor=
t Check*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3779  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3780  	v->TotalNumberOfActiveW=
riteback =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3781  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3782  		if (v->WritebackEnable=
[k] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3783  			v->TotalNumberOfActiv=
eWriteback =3D
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3784  					v->TotalNumberOfAct=
iveWriteback + 1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3785  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3786  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3787  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3788  	if (v->TotalNumberOfAct=
iveWriteback > v->MaxNumWriteback) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3789  		EnoughWritebackUnits =
=3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3790  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3791  	if (!v->WritebackSuppor=
tInterleaveAndUsingWholeBufferForASingleStream
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3792  			&& (v->WritebackConfi=
guration =3D=3D dm_whole_buffer_for_single_stream_no_interleave
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3793  					|| v->WritebackConf=
iguration =3D=3D dm_whole_buffer_for_single_stream_interleave)) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3794  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3795  		WritebackModeSupport =
=3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3796  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3797  	if (v->WritebackConfigu=
ration =3D=3D dm_whole_buffer_for_single_stream_no_interleave && v->TotalNu=
mberOfActiveWriteback > 1) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3798  		WritebackModeSupport =
=3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3799  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3800  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3801  	/*Writeback Scale Ratio=
 and Taps Support Check*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3802  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3803  	v->WritebackScaleRatioA=
ndTapsSupport =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3804  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3805  		if (v->WritebackEnable=
[k] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3806  			if (v->WritebackHRati=
o[k] > v->WritebackMaxHSCLRatio
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3807  					|| v->WritebackVRat=
io[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3808  							> v->WritebackMax=
VSCLRatio
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3809  					|| v->WritebackHRat=
io[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3810  							< v->WritebackMin=
HSCLRatio
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3811  					|| v->WritebackVRat=
io[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3812  							< v->WritebackMin=
VSCLRatio
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3813  					|| v->WritebackHTap=
s[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3814  							> v->WritebackMax=
HSCLTaps
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3815  					|| v->WritebackVTap=
s[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3816  							> v->WritebackMax=
VSCLTaps
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3817  					|| v->WritebackHRat=
io[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3818  							> v->WritebackHTa=
ps[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3819  					|| v->WritebackVRat=
io[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3820  							> v->WritebackVTa=
ps[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3821  					|| (v->WritebackHTa=
ps[k] > 2.0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3822  							&& ((v->Writeback=
HTaps[k] % 2)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3823  									=3D=3D 1))) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3824  				v->WritebackScaleRat=
ioAndTapsSupport =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3825  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3826  			if (2.0 * v->Writebac=
kDestinationWidth[k] * (v->WritebackVTaps[k] - 1) * 57 > v->WritebackLineBu=
fferSize) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3827  				v->WritebackScaleRat=
ioAndTapsSupport =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3828  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3829  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3830  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3831  	/*Maximum DISPCLK/DPPCL=
K Support check*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3832  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3833  	v->WritebackRequiredDIS=
PCLK =3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3834  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3835  		if (v->WritebackEnable=
[k] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3836  			v->WritebackRequiredD=
ISPCLK =3D dml_max(v->WritebackRequiredDISPCLK,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3837  					dml30_CalculateWrit=
eBackDISPCLK(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3838  							v->WritebackPixel=
Format[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3839  							v->PixelClock[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3840  							v->WritebackHRati=
o[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3841  							v->WritebackVRati=
o[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3842  							v->WritebackHTaps=
[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3843  							v->WritebackVTaps=
[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3844  							v->WritebackSourc=
eWidth[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3845  							v->WritebackDesti=
nationWidth[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3846  							v->HTotal[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3847  							v->WritebackLineB=
ufferSize));
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3848  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3849  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3850  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3851  		if (v->HRatio[k] > 1.0=
) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3852  			v->PSCL_FACTOR[k] =3D=
 dml_min(v->MaxDCHUBToPSCLThroughput, v->MaxPSCLToLBThroughput * v->HRatio[=
k] / dml_ceil(v->htaps[k] / 6.0, 1.0));
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3853  		} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3854  			v->PSCL_FACTOR[k] =3D=
 dml_min(v->MaxDCHUBToPSCLThroughput, v->MaxPSCLToLBThroughput);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3855  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3856  		if (v->BytePerPixelC[k=
] =3D=3D 0.0) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3857  			v->PSCL_FACTOR_CHROMA=
[k] =3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3858  			v->MinDPPCLKUsingSing=
leDPP[k] =3D v->PixelClock[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3859  					* dml_max3(v->vtaps=
[k] / 6.0 * dml_min(1.0, v->HRatio[k]), v->HRatio[k] * v->VRatio[k] / v->PS=
CL_FACTOR[k], 1.0);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3860  			if ((v->htaps[k] > 6.=
0 || v->vtaps[k] > 6.0) && v->MinDPPCLKUsingSingleDPP[k] < 2.0 * v->PixelCl=
ock[k]) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3861  				v->MinDPPCLKUsingSin=
gleDPP[k] =3D 2.0 * v->PixelClock[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3862  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3863  		} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3864  			if (v->HRatioChroma[k=
] > 1.0) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3865  				v->PSCL_FACTOR_CHROM=
A[k] =3D dml_min(v->MaxDCHUBToPSCLThroughput,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3866  						v->MaxPSCLToLBThro=
ughput * v->HRatioChroma[k] / dml_ceil(v->HTAPsChroma[k] / 6.0, 1.0));
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3867  			} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3868  				v->PSCL_FACTOR_CHROM=
A[k] =3D dml_min(v->MaxDCHUBToPSCLThroughput, v->MaxPSCLToLBThroughput);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3869  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3870  			v->MinDPPCLKUsingSing=
leDPP[k] =3D v->PixelClock[k] * dml_max5(v->vtaps[k] / 6.0 * dml_min(1.0, v=
->HRatio[k]),
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3871  							v->HRatio[k] * v-=
>VRatio[k] / v->PSCL_FACTOR[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3872  							v->VTAPsChroma[k]=
 / 6.0 * dml_min(1.0, v->HRatioChroma[k]),
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3873  							v->HRatioChroma[k=
] * v->VRatioChroma[k] / v->PSCL_FACTOR_CHROMA[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3874  							1.0);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3875  			if ((v->htaps[k] > 6.=
0 || v->vtaps[k] > 6.0 || v->HTAPsChroma[k] > 6.0 || v->VTAPsChroma[k] > 6.=
0)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3876  					&& v->MinDPPCLKUsin=
gSingleDPP[k] < 2.0 * v->PixelClock[k]) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3877  				v->MinDPPCLKUsingSin=
gleDPP[k] =3D 2.0 * v->PixelClock[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3878  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3879  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3880  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3881  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3882  		int MaximumSwathWidthS=
upportLuma =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3883  		int MaximumSwathWidthS=
upportChroma =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3884  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3885  		if (v->SurfaceTiling[k=
] =3D=3D dm_sw_linear) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3886  			MaximumSwathWidthSupp=
ortLuma =3D 8192.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3887  		} else if (v->SourceSc=
an[k] =3D=3D dm_vert && v->BytePerPixelC[k] > 0) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3888  			MaximumSwathWidthSupp=
ortLuma =3D 2880.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3889  		} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3890  			MaximumSwathWidthSupp=
ortLuma =3D 5760.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3891  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3892  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3893  		if (v->SourcePixelForm=
at[k] =3D=3D dm_420_8 || v->SourcePixelFormat[k] =3D=3D dm_420_10 || v->Sou=
rcePixelFormat[k] =3D=3D dm_420_12) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3894  			MaximumSwathWidthSupp=
ortChroma =3D MaximumSwathWidthSupportLuma / 2.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3895  		} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3896  			MaximumSwathWidthSupp=
ortChroma =3D MaximumSwathWidthSupportLuma;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3897  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3898  		v->MaximumSwathWidthIn=
LineBufferLuma =3D v->LineBufferSize * dml_max(v->HRatio[k], 1.0) / v->LBBi=
tPerPixel[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3899  				/ (v->vtaps[k] + dml=
_max(dml_ceil(v->VRatio[k], 1.0) - 2, 0.0));
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3900  		if (v->BytePerPixelC[k=
] =3D=3D 0.0) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3901  			v->MaximumSwathWidthI=
nLineBufferChroma =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3902  		} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3903  			v->MaximumSwathWidthI=
nLineBufferChroma =3D v->LineBufferSize * dml_max(v->HRatioChroma[k], 1.0) =
/ v->LBBitPerPixel[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3904  					/ (v->VTAPsChroma[k=
] + dml_max(dml_ceil(v->VRatioChroma[k], 1.0) - 2, 0.0));
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3905  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3906  		v->MaximumSwathWidthLu=
ma[k] =3D dml_min(MaximumSwathWidthSupportLuma, v->MaximumSwathWidthInLineB=
ufferLuma);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3907  		v->MaximumSwathWidthCh=
roma[k] =3D dml_min(MaximumSwathWidthSupportChroma, v->MaximumSwathWidthInL=
ineBufferChroma);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3908  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3909  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3910  	CalculateSwathAndDETCon=
figuration(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3911  			true,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3912  			v->NumberOfActivePlan=
es,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3913  			v->DETBufferSizeInKBy=
te,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3914  			v->MaximumSwathWidthL=
uma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3915  			v->MaximumSwathWidthC=
hroma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3916  			v->SourceScan,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3917  			v->SourcePixelFormat,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3918  			v->SurfaceTiling,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3919  			v->ViewportWidth,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3920  			v->ViewportHeight,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3921  			v->SurfaceWidthY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3922  			v->SurfaceWidthC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3923  			v->SurfaceHeightY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3924  			v->SurfaceHeightC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3925  			v->Read256BlockHeight=
Y,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3926  			v->Read256BlockHeight=
C,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3927  			v->Read256BlockWidthY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3928  			v->Read256BlockWidthC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3929  			v->odm_combine_dummy,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3930  			v->BlendingAndTiming,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3931  			v->BytePerPixelY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3932  			v->BytePerPixelC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3933  			v->BytePerPixelInDETY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3934  			v->BytePerPixelInDETC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3935  			v->HActive,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3936  			v->HRatio,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3937  			v->HRatioChroma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3938  			v->DPPPerPlane,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3939  			v->swath_width_luma_u=
b,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3940  			v->swath_width_chroma=
_ub,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3941  			v->SwathWidthY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3942  			v->SwathWidthC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3943  			v->SwathHeightY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3944  			v->SwathHeightC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3945  			v->DETBufferSizeY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3946  			v->DETBufferSizeC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3947  			v->SingleDPPViewportS=
izeSupportPerPlane,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3948  			&v->ViewportSizeSuppo=
rt[0][0]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3949  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3950  	for (i =3D 0; i < v->so=
c.num_states; i++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3951  		for (j =3D 0; j < 2; j=
++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3952  			v->MaxDispclkRoundedD=
ownToDFSGranularity =3D RoundToDFSGranularityDown(v->MaxDispclk[i], v->DISP=
CLKDPPCLKVCOSpeed);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3953  			v->MaxDppclkRoundedDo=
wnToDFSGranularity =3D RoundToDFSGranularityDown(v->MaxDppclk[i], v->DISPCL=
KDPPCLKVCOSpeed);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3954  			v->RequiredDISPCLK[i]=
[j] =3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3955  			v->DISPCLK_DPPCLK_Sup=
port[i][j] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3956  			for (k =3D 0; k <=3D =
v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3957  				v->PlaneRequiredDISP=
CLKWithoutODMCombine =3D v->PixelClock[k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDo=
wnSpreading / 100.0)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3958  						* (1.0 + v->DISPCL=
KRampingMargin / 100.0);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3959  				if ((v->PlaneRequire=
dDISPCLKWithoutODMCombine >=3D v->MaxDispclk[i] && v->MaxDispclk[i] =3D=3D =
v->MaxDispclk[mode_lib->soc.num_states]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3960  						&& v->MaxDppclk[i]=
 =3D=3D v->MaxDppclk[mode_lib->soc.num_states])) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3961  					v->PlaneRequiredDIS=
PCLKWithoutODMCombine =3D v->PixelClock[k] * (1 + v->DISPCLKDPPCLKDSCCLKDow=
nSpreading / 100.0);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3962  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3963  				v->PlaneRequiredDISP=
CLKWithODMCombine2To1 =3D v->PixelClock[k] / 2 * (1 + v->DISPCLKDPPCLKDSCCL=
KDownSpreading / 100.0)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3964  						* (1 + v->DISPCLKR=
ampingMargin / 100.0);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3965  				if ((v->PlaneRequire=
dDISPCLKWithODMCombine2To1 >=3D v->MaxDispclk[i] && v->MaxDispclk[i] =3D=3D=
 v->MaxDispclk[mode_lib->soc.num_states]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3966  						&& v->MaxDppclk[i]=
 =3D=3D v->MaxDppclk[mode_lib->soc.num_states])) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3967  					v->PlaneRequiredDIS=
PCLKWithODMCombine2To1 =3D v->PixelClock[k] / 2 * (1 + v->DISPCLKDPPCLKDSCC=
LKDownSpreading / 100.0);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3968  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3969  				v->PlaneRequiredDISP=
CLKWithODMCombine4To1 =3D v->PixelClock[k] / 4 * (1 + v->DISPCLKDPPCLKDSCCL=
KDownSpreading / 100.0)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3970  						* (1 + v->DISPCLKR=
ampingMargin / 100.0);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3971  				if ((v->PlaneRequire=
dDISPCLKWithODMCombine4To1 >=3D v->MaxDispclk[i] && v->MaxDispclk[i] =3D=3D=
 v->MaxDispclk[mode_lib->soc.num_states]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3972  						&& v->MaxDppclk[i]=
 =3D=3D v->MaxDppclk[mode_lib->soc.num_states])) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3973  					v->PlaneRequiredDIS=
PCLKWithODMCombine4To1 =3D v->PixelClock[k] / 4 * (1 + v->DISPCLKDPPCLKDSCC=
LKDownSpreading / 100.0);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3974  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3975  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3976  				if (v->ODMCombinePol=
icy =3D=3D dm_odm_combine_policy_none) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3977  					v->ODMCombineEnable=
PerState[i][k] =3D dm_odm_combine_mode_disabled;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3978  					v->PlaneRequiredDIS=
PCLK =3D v->PlaneRequiredDISPCLKWithoutODMCombine;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3979  				} else if (v->ODMCom=
binePolicy =3D=3D dm_odm_combine_policy_2to1) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3980  					v->ODMCombineEnable=
PerState[i][k] =3D dm_odm_combine_mode_2to1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3981  					v->PlaneRequiredDIS=
PCLK =3D v->PlaneRequiredDISPCLKWithODMCombine2To1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3982  				} else if (v->ODMCom=
binePolicy =3D=3D dm_odm_combine_policy_4to1
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3983  						|| v->PlaneRequire=
dDISPCLKWithODMCombine2To1 > v->MaxDispclkRoundedDownToDFSGranularity) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3984  					v->ODMCombineEnable=
PerState[i][k] =3D dm_odm_combine_mode_4to1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3985  					v->PlaneRequiredDIS=
PCLK =3D v->PlaneRequiredDISPCLKWithODMCombine4To1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3986  				} else if (v->PlaneR=
equiredDISPCLKWithoutODMCombine > v->MaxDispclkRoundedDownToDFSGranularity)=
 {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3987  					v->ODMCombineEnable=
PerState[i][k] =3D dm_odm_combine_mode_2to1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3988  					v->PlaneRequiredDIS=
PCLK =3D v->PlaneRequiredDISPCLKWithODMCombine2To1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3989  				} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3990  					v->ODMCombineEnable=
PerState[i][k] =3D dm_odm_combine_mode_disabled;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3991  					v->PlaneRequiredDIS=
PCLK =3D v->PlaneRequiredDISPCLKWithoutODMCombine;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3992  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3993  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3994  				if (v->ODMCombineEna=
blePerState[i][k] =3D=3D dm_odm_combine_mode_4to1) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3995  					v->MPCCombine[i][j]=
[k] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3996  					v->NoOfDPP[i][j][k]=
 =3D 4;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3997  					v->RequiredDPPCLK[i=
][j][k] =3D v->MinDPPCLKUsingSingleDPP[k] * (1 + v->DISPCLKDPPCLKDSCCLKDown=
Spreading / 100.0) / 4;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3998  				} else if (v->ODMCom=
bineEnablePerState[i][k] =3D=3D dm_odm_combine_mode_2to1) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  3999  					v->MPCCombine[i][j]=
[k] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4000  					v->NoOfDPP[i][j][k]=
 =3D 2;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4001  					v->RequiredDPPCLK[i=
][j][k] =3D v->MinDPPCLKUsingSingleDPP[k] * (1 + v->DISPCLKDPPCLKDSCCLKDown=
Spreading / 100.0) / 2;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4002  				} else if ((v->WhenT=
oDoMPCCombine =3D=3D dm_mpc_never
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4003  						|| (v->MinDPPCLKUs=
ingSingleDPP[k] * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) <=3D v-=
>MaxDppclkRoundedDownToDFSGranularity
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4004  								&& v->SingleDPPV=
iewportSizeSupportPerPlane[k] =3D=3D true))) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4005  					v->MPCCombine[i][j]=
[k] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4006  					v->NoOfDPP[i][j][k]=
 =3D 1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4007  					v->RequiredDPPCLK[i=
][j][k] =3D v->MinDPPCLKUsingSingleDPP[k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDo=
wnSpreading / 100.0);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4008  				} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4009  					v->MPCCombine[i][j]=
[k] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4010  					v->NoOfDPP[i][j][k]=
 =3D 2;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4011  					v->RequiredDPPCLK[i=
][j][k] =3D v->MinDPPCLKUsingSingleDPP[k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDo=
wnSpreading / 100.0) / 2.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4012  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4013  				v->RequiredDISPCLK[i=
][j] =3D dml_max(v->RequiredDISPCLK[i][j], v->PlaneRequiredDISPCLK);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4014  				if ((v->MinDPPCLKUsi=
ngSingleDPP[k] / v->NoOfDPP[i][j][k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDownSpr=
eading / 100.0)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4015  						> v->MaxDppclkRoun=
dedDownToDFSGranularity) || (v->PlaneRequiredDISPCLK > v->MaxDispclkRounded=
DownToDFSGranularity)) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4016  					v->DISPCLK_DPPCLK_S=
upport[i][j] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4017  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4018  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4019  			v->TotalNumberOfActiv=
eDPP[i][j] =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4020  			v->TotalNumberOfSingl=
eDPPPlanes[i][j] =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4021  			for (k =3D 0; k <=3D =
v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4022  				v->TotalNumberOfActi=
veDPP[i][j] =3D v->TotalNumberOfActiveDPP[i][j] + v->NoOfDPP[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4023  				if (v->NoOfDPP[i][j]=
[k] =3D=3D 1)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4024  					v->TotalNumberOfSin=
gleDPPPlanes[i][j] =3D v->TotalNumberOfSingleDPPPlanes[i][j] + 1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4025  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4026  			if (j =3D=3D 1 && v->=
WhenToDoMPCCombine !=3D dm_mpc_never) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4027  				while (!(v->TotalNum=
berOfActiveDPP[i][j] >=3D v->MaxNumDPP || v->TotalNumberOfSingleDPPPlanes[i=
][j] =3D=3D 0)) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4028  					double BWOfNonSplit=
PlaneOfMaximumBandwidth =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4029  					unsigned int Number=
OfNonSplitPlaneOfMaximumBandwidth =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4030  					BWOfNonSplitPlaneOf=
MaximumBandwidth =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4031  					NumberOfNonSplitPla=
neOfMaximumBandwidth =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4032  					for (k =3D 0; k < v=
->NumberOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4033  						if (v->ReadBandwid=
thLuma[k] + v->ReadBandwidthChroma[k] > BWOfNonSplitPlaneOfMaximumBandwidth
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4034  								&& v->ODMCombine=
EnablePerState[i][k] =3D=3D dm_odm_combine_mode_disabled && v->MPCCombine[i=
][j][k] =3D=3D false) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4035  							BWOfNonSplitPlane=
OfMaximumBandwidth =3D v->ReadBandwidthLuma[k] + v->ReadBandwidthChroma[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4036  							NumberOfNonSplitP=
laneOfMaximumBandwidth =3D k;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4037  						}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4038  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4039  					v->MPCCombine[i][j]=
[NumberOfNonSplitPlaneOfMaximumBandwidth] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4040  					v->NoOfDPP[i][j][Nu=
mberOfNonSplitPlaneOfMaximumBandwidth] =3D 2;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4041  					v->RequiredDPPCLK[i=
][j][NumberOfNonSplitPlaneOfMaximumBandwidth] =3D v->MinDPPCLKUsingSingleDP=
P[NumberOfNonSplitPlaneOfMaximumBandwidth]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4042  							* (1 + v->DISPCLK=
DPPCLKDSCCLKDownSpreading / 100) / 2;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4043  					v->TotalNumberOfAct=
iveDPP[i][j] =3D v->TotalNumberOfActiveDPP[i][j] + 1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4044  					v->TotalNumberOfSin=
gleDPPPlanes[i][j] =3D v->TotalNumberOfSingleDPPPlanes[i][j] + 1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4045  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4046  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4047  			if (v->TotalNumberOfA=
ctiveDPP[i][j] > v->MaxNumDPP) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4048  				v->RequiredDISPCLK[i=
][j] =3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4049  				v->DISPCLK_DPPCLK_Su=
pport[i][j] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4050  				for (k =3D 0; k <=3D=
 v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4051  					v->ODMCombineEnable=
PerState[i][k] =3D dm_odm_combine_mode_disabled;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4052  					if (v->SingleDPPVie=
wportSizeSupportPerPlane[k] =3D=3D false && v->WhenToDoMPCCombine !=3D dm_m=
pc_never) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4053  						v->MPCCombine[i][j=
][k] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4054  						v->NoOfDPP[i][j][k=
] =3D 2;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4055  						v->RequiredDPPCLK[=
i][j][k] =3D v->MinDPPCLKUsingSingleDPP[k] * (1.0 + v->DISPCLKDPPCLKDSCCLKD=
ownSpreading / 100.0) / 2.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4056  					} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4057  						v->MPCCombine[i][j=
][k] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4058  						v->NoOfDPP[i][j][k=
] =3D 1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4059  						v->RequiredDPPCLK[=
i][j][k] =3D v->MinDPPCLKUsingSingleDPP[k] * (1.0 + v->DISPCLKDPPCLKDSCCLKD=
ownSpreading / 100.0);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4060  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4061  					if (!(v->MaxDispclk=
[i] =3D=3D v->MaxDispclk[v->soc.num_states - 1] && v->MaxDppclk[i] =3D=3D v=
->MaxDppclk[v->soc.num_states - 1])) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4062  						v->PlaneRequiredDI=
SPCLK =3D v->PixelClock[k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 1=
00.0)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4063  								* (1.0 + v->DISP=
CLKRampingMargin / 100.0);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4064  					} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4065  						v->PlaneRequiredDI=
SPCLK =3D v->PixelClock[k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 1=
00.0);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4066  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4067  					v->RequiredDISPCLK[=
i][j] =3D dml_max(v->RequiredDISPCLK[i][j], v->PlaneRequiredDISPCLK);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4068  					if ((v->MinDPPCLKUs=
ingSingleDPP[k] / v->NoOfDPP[i][j][k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDownSp=
reading / 100.0)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4069  							> v->MaxDppclkRou=
ndedDownToDFSGranularity) || (v->PlaneRequiredDISPCLK > v->MaxDispclkRounde=
dDownToDFSGranularity)) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4070  						v->DISPCLK_DPPCLK_=
Support[i][j] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4071  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4072  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4073  				v->TotalNumberOfActi=
veDPP[i][j] =3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4074  				for (k =3D 0; k <=3D=
 v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4075  					v->TotalNumberOfAct=
iveDPP[i][j] =3D v->TotalNumberOfActiveDPP[i][j] + v->NoOfDPP[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4076  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4077  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4078  			v->RequiredDISPCLK[i]=
[j] =3D dml_max(v->RequiredDISPCLK[i][j], v->WritebackRequiredDISPCLK);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4079  			if (v->MaxDispclkRoun=
dedDownToDFSGranularity < v->WritebackRequiredDISPCLK) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4080  				v->DISPCLK_DPPCLK_Su=
pport[i][j] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4081  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4082  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4083  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4084  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4085  	/*Total Available Pipes=
 Support Check*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4086  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4087  	for (i =3D 0; i < v->so=
c.num_states; i++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4088  		for (j =3D 0; j < 2; j=
++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4089  			if (v->TotalNumberOfA=
ctiveDPP[i][j] <=3D v->MaxNumDPP) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4090  				v->TotalAvailablePip=
esSupport[i][j] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4091  			} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4092  				v->TotalAvailablePip=
esSupport[i][j] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4093  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4094  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4095  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4096  	/*Display IO and DSC Su=
pport Check*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4097  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4098  	v->NonsupportedDSCInput=
BPC =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4099  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4100  		if (!(v->DSCInputBitPe=
rComponent[k] =3D=3D 12.0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4101  				|| v->DSCInputBitPer=
Component[k] =3D=3D 10.0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4102  				|| v->DSCInputBitPer=
Component[k] =3D=3D 8.0)) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4103  			v->NonsupportedDSCInp=
utBPC =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4104  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4105  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4106  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4107  	/*Number Of DSC Slices*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4108  	for (k =3D 0; k < v->Nu=
mberOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4109  		if (v->BlendingAndTimi=
ng[k] =3D=3D k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4110  			if (v->PixelClockBack=
End[k] > 3200) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4111  				v->NumberOfDSCSlices=
[k] =3D dml_ceil(v->PixelClockBackEnd[k] / 400.0, 4.0);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4112  			} else if (v->PixelCl=
ockBackEnd[k] > 1360) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4113  				v->NumberOfDSCSlices=
[k] =3D 8;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4114  			} else if (v->PixelCl=
ockBackEnd[k] > 680) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4115  				v->NumberOfDSCSlices=
[k] =3D 4;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4116  			} else if (v->PixelCl=
ockBackEnd[k] > 340) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4117  				v->NumberOfDSCSlices=
[k] =3D 2;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4118  			} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4119  				v->NumberOfDSCSlices=
[k] =3D 1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4120  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4121  		} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4122  			v->NumberOfDSCSlices[=
k] =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4123  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4124  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4125  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4126  	for (i =3D 0; i < v->so=
c.num_states; i++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4127  		for (k =3D 0; k <=3D v=
->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4128  			v->RequiresDSC[i][k] =
=3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4129  			v->RequiresFEC[i][k] =
=3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4130  			if (v->BlendingAndTim=
ing[k] =3D=3D k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4131  				if (v->Output[k] =3D=
=3D dm_hdmi) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4132  					v->RequiresDSC[i][k=
] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4133  					v->RequiresFEC[i][k=
] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4134  					v->OutputBppPerStat=
e[i][k] =3D TruncToValidBPP(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4135  							dml_min(600.0, v-=
>PHYCLKPerState[i]) * 10,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4136  							3,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4137  							v->HTotal[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4138  							v->HActive[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4139  							v->PixelClockBack=
End[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4140  							v->ForcedOutputLi=
nkBPP[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4141  							false,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4142  							v->Output[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4143  							v->OutputFormat[k=
],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4144  							v->DSCInputBitPer=
Component[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4145  							v->NumberOfDSCSli=
ces[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4146  							v->AudioSampleRat=
e[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4147  							v->AudioSampleLay=
out[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4148  							v->ODMCombineEnab=
lePerState[i][k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4149  				} else if (v->Output=
[k] =3D=3D dm_dp || v->Output[k] =3D=3D dm_edp) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4150  					if (v->DSCEnable[k]=
 =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4151  						v->RequiresDSC[i][=
k] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4152  						v->LinkDSCEnable =
=3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4153  						if (v->Output[k] =
=3D=3D dm_dp) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4154  							v->RequiresFEC[i]=
[k] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4155  						} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4156  							v->RequiresFEC[i]=
[k] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4157  						}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4158  					} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4159  						v->RequiresDSC[i][=
k] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4160  						v->LinkDSCEnable =
=3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4161  						v->RequiresFEC[i][=
k] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4162  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4163  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4164  					v->Outbpp =3D BPP_I=
NVALID;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4165  					if (v->PHYCLKPerSta=
te[i] >=3D 270.0) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4166  						v->Outbpp =3D Trun=
cToValidBPP(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4167  								(1.0 - v->Downsp=
reading / 100.0) * 2700,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4168  								v->OutputLinkDPL=
anes[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4169  								v->HTotal[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4170  								v->HActive[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4171  								v->PixelClockBac=
kEnd[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4172  								v->ForcedOutputL=
inkBPP[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4173  								v->LinkDSCEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4174  								v->Output[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4175  								v->OutputFormat[=
k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4176  								v->DSCInputBitPe=
rComponent[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4177  								v->NumberOfDSCSl=
ices[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4178  								v->AudioSampleRa=
te[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4179  								v->AudioSampleLa=
yout[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4180  								v->ODMCombineEna=
blePerState[i][k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4181  						v->OutputBppPerSta=
te[i][k] =3D v->Outbpp;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4182  						// TODO: Need some=
 other way to handle this nonsense
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4183  						// v->OutputTypeAn=
dRatePerState[i][k] =3D v->Output[k] & " HBR"
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4184  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4185  					if (v->Outbpp =3D=
=3D BPP_INVALID && v->PHYCLKPerState[i] >=3D 540.0) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4186  						v->Outbpp =3D Trun=
cToValidBPP(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4187  								(1.0 - v->Downsp=
reading / 100.0) * 5400,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4188  								v->OutputLinkDPL=
anes[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4189  								v->HTotal[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4190  								v->HActive[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4191  								v->PixelClockBac=
kEnd[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4192  								v->ForcedOutputL=
inkBPP[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4193  								v->LinkDSCEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4194  								v->Output[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4195  								v->OutputFormat[=
k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4196  								v->DSCInputBitPe=
rComponent[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4197  								v->NumberOfDSCSl=
ices[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4198  								v->AudioSampleRa=
te[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4199  								v->AudioSampleLa=
yout[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4200  								v->ODMCombineEna=
blePerState[i][k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4201  						v->OutputBppPerSta=
te[i][k] =3D v->Outbpp;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4202  						// TODO: Need some=
 other way to handle this nonsense
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4203  						// v->OutputTypeAn=
dRatePerState[i][k] =3D v->Output[k] & " HBR2"
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4204  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4205  					if (v->Outbpp =3D=
=3D BPP_INVALID && v->PHYCLKPerState[i] >=3D 810.0) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4206  						v->Outbpp =3D Trun=
cToValidBPP(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4207  								(1.0 - v->Downsp=
reading / 100.0) * 8100,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4208  								v->OutputLinkDPL=
anes[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4209  								v->HTotal[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4210  								v->HActive[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4211  								v->PixelClockBac=
kEnd[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4212  								v->ForcedOutputL=
inkBPP[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4213  								v->LinkDSCEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4214  								v->Output[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4215  								v->OutputFormat[=
k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4216  								v->DSCInputBitPe=
rComponent[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4217  								v->NumberOfDSCSl=
ices[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4218  								v->AudioSampleRa=
te[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4219  								v->AudioSampleLa=
yout[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4220  								v->ODMCombineEna=
blePerState[i][k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4221  						if (v->Outbpp =3D=
=3D BPP_INVALID && v->ForcedOutputLinkBPP[k] =3D=3D 0) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4222  							//if (v->Outbpp =
=3D=3D BPP_INVALID && v->DSCEnabled[k] =3D=3D dm_dsc_enable_only_if_necessa=
ry && v->ForcedOutputLinkBPP[k] =3D=3D 0) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4223  							v->RequiresDSC[i]=
[k] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4224  							v->LinkDSCEnable =
=3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4225  							if (v->Output[k] =
=3D=3D dm_dp) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4226  								v->RequiresFEC[i=
][k] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4227  							}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4228  							v->Outbpp =3D Tru=
ncToValidBPP(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4229  									(1.0 - v->Downs=
preading / 100.0) * 8100,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4230  									v->OutputLinkDP=
Lanes[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4231  									v->HTotal[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4232  									v->HActive[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4233  									v->PixelClockBa=
ckEnd[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4234  									v->ForcedOutput=
LinkBPP[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4235  									v->LinkDSCEnabl=
e,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4236  									v->Output[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4237  									v->OutputFormat=
[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4238  									v->DSCInputBitP=
erComponent[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4239  									v->NumberOfDSCS=
lices[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4240  									v->AudioSampleR=
ate[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4241  									v->AudioSampleL=
ayout[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4242  									v->ODMCombineEn=
ablePerState[i][k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4243  						}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4244  						v->OutputBppPerSta=
te[i][k] =3D v->Outbpp;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4245  						// TODO: Need some=
 other way to handle this nonsense
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4246  						// v->OutputTypeAn=
dRatePerState[i][k] =3D v->Output[k] & " HBR3"
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4247  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4248  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4249  			} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4250  				v->OutputBppPerState=
[i][k] =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4251  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4252  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4253  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4254  	for (i =3D 0; i < v->so=
c.num_states; i++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4255  		v->DIOSupport[i] =3D t=
rue;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4256  		for (k =3D 0; k <=3D v=
->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4257  			if (v->BlendingAndTim=
ing[k] =3D=3D k && (v->Output[k] =3D=3D dm_dp || v->Output[k] =3D=3D dm_edp=
 || v->Output[k] =3D=3D dm_hdmi)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4258  					&& (v->OutputBppPer=
State[i][k] =3D=3D 0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4259  							|| (v->OutputForm=
at[k] =3D=3D dm_420 && v->Interlace[k] =3D=3D true && v->ProgressiveToInter=
laceUnitInOPP =3D=3D true))) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4260  				v->DIOSupport[i] =3D=
 false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4261  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4262  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4263  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4264  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4265  	for (i =3D 0; i < v->so=
c.num_states; ++i) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4266  		v->ODMCombine4To1Suppo=
rtCheckOK[i] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4267  		for (k =3D 0; k < v->N=
umberOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4268  			if (v->BlendingAndTim=
ing[k] =3D=3D k && v->ODMCombineEnablePerState[i][k] =3D=3D dm_odm_combine_=
mode_4to1
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4269  					&& (v->ODMCombine4T=
o1Supported =3D=3D false || v->Output[k] =3D=3D dm_dp || v->Output[k] =3D=
=3D dm_edp || v->Output[k] =3D=3D dm_hdmi)) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4270  				v->ODMCombine4To1Sup=
portCheckOK[i] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4271  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4272  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4273  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4274  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4275  	for (i =3D 0; i < v->so=
c.num_states; i++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4276  		v->DSCCLKRequiredMoreT=
hanSupported[i] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4277  		for (k =3D 0; k <=3D v=
->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4278  			if (v->BlendingAndTim=
ing[k] =3D=3D k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4279  				if (v->Output[k] =3D=
=3D dm_dp || v->Output[k] =3D=3D dm_edp) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4280  					if (v->OutputFormat=
[k] =3D=3D dm_420) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4281  						v->DSCFormatFactor=
 =3D 2;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4282  					} else if (v->Outpu=
tFormat[k] =3D=3D dm_444) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4283  						v->DSCFormatFactor=
 =3D 1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4284  					} else if (v->Outpu=
tFormat[k] =3D=3D dm_n422) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4285  						v->DSCFormatFactor=
 =3D 2;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4286  					} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4287  						v->DSCFormatFactor=
 =3D 1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4288  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4289  					if (v->RequiresDSC[=
i][k] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4290  						if (v->ODMCombineE=
nablePerState[i][k] =3D=3D dm_odm_combine_mode_4to1) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4291  							if (v->PixelClock=
BackEnd[k] / 12.0 / v->DSCFormatFactor
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4292  									> (1.0 - v->DIS=
PCLKDPPCLKDSCCLKDownSpreading / 100.0) * v->MaxDSCCLK[i]) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4293  								v->DSCCLKRequire=
dMoreThanSupported[i] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4294  							}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4295  						} else if (v->ODMC=
ombineEnablePerState[i][k] =3D=3D dm_odm_combine_mode_2to1) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4296  							if (v->PixelClock=
BackEnd[k] / 6.0 / v->DSCFormatFactor
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4297  									> (1.0 - v->DIS=
PCLKDPPCLKDSCCLKDownSpreading / 100.0) * v->MaxDSCCLK[i]) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4298  								v->DSCCLKRequire=
dMoreThanSupported[i] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4299  							}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4300  						} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4301  							if (v->PixelClock=
BackEnd[k] / 3.0 / v->DSCFormatFactor
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4302  									> (1.0 - v->DIS=
PCLKDPPCLKDSCCLKDownSpreading / 100.0) * v->MaxDSCCLK[i]) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4303  								v->DSCCLKRequire=
dMoreThanSupported[i] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4304  							}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4305  						}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4306  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4307  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4308  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4309  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4310  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4311  	for (i =3D 0; i < v->so=
c.num_states; i++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4312  		v->NotEnoughDSCUnits[i=
] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4313  		v->TotalDSCUnitsRequir=
ed =3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4314  		for (k =3D 0; k <=3D v=
->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4315  			if (v->RequiresDSC[i]=
[k] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4316  				if (v->ODMCombineEna=
blePerState[i][k] =3D=3D dm_odm_combine_mode_4to1) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4317  					v->TotalDSCUnitsReq=
uired =3D v->TotalDSCUnitsRequired + 4.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4318  				} else if (v->ODMCom=
bineEnablePerState[i][k] =3D=3D dm_odm_combine_mode_2to1) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4319  					v->TotalDSCUnitsReq=
uired =3D v->TotalDSCUnitsRequired + 2.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4320  				} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4321  					v->TotalDSCUnitsReq=
uired =3D v->TotalDSCUnitsRequired + 1.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4322  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4323  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4324  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4325  		if (v->TotalDSCUnitsRe=
quired > v->NumberOfDSC) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4326  			v->NotEnoughDSCUnits[=
i] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4327  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4328  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4329  	/*DSC Delay per state*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4330  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4331  	for (i =3D 0; i < v->so=
c.num_states; i++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4332  		for (k =3D 0; k <=3D v=
->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4333  			if (v->OutputBppPerSt=
ate[i][k] =3D=3D BPP_INVALID) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4334  				v->BPP =3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4335  			} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4336  				v->BPP =3D v->Output=
BppPerState[i][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4337  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4338  			if (v->RequiresDSC[i]=
[k] =3D=3D true && v->BPP !=3D 0.0) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4339  				if (v->ODMCombineEna=
blePerState[i][k] =3D=3D dm_odm_combine_mode_disabled) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4340  					v->DSCDelayPerState=
[i][k] =3D dscceComputeDelay(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4341  							v->DSCInputBitPer=
Component[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4342  							v->BPP,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4343  							dml_ceil(1.0 * v-=
>HActive[k] / v->NumberOfDSCSlices[k], 1.0),
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4344  							v->NumberOfDSCSli=
ces[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4345  							v->OutputFormat[k=
],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4346  							v->Output[k]) + d=
scComputeDelay(v->OutputFormat[k], v->Output[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4347  				} else if (v->ODMCom=
bineEnablePerState[i][k] =3D=3D dm_odm_combine_mode_2to1) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4348  					v->DSCDelayPerState=
[i][k] =3D 2.0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4349  							* dscceComputeDel=
ay(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4350  									v->DSCInputBitP=
erComponent[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4351  									v->BPP,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4352  									dml_ceil(1.0 * =
v->HActive[k] / v->NumberOfDSCSlices[k], 1.0),
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4353  									v->NumberOfDSCS=
lices[k] / 2,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4354  									v->OutputFormat=
[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4355  									v->Output[k]) +=
 dscComputeDelay(v->OutputFormat[k], v->Output[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4356  				} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4357  					v->DSCDelayPerState=
[i][k] =3D 4.0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4358  							* (dscceComputeDe=
lay(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4359  									v->DSCInputBitP=
erComponent[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4360  									v->BPP,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4361  									dml_ceil(1.0 * =
v->HActive[k] / v->NumberOfDSCSlices[k], 1.0),
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4362  									v->NumberOfDSCS=
lices[k] / 4,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4363  									v->OutputFormat=
[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4364  									v->Output[k]) +=
 dscComputeDelay(v->OutputFormat[k], v->Output[k]));
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4365  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4366  				v->DSCDelayPerState[=
i][k] =3D v->DSCDelayPerState[i][k] * v->PixelClock[k] / v->PixelClockBackE=
nd[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4367  			} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4368  				v->DSCDelayPerState[=
i][k] =3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4369  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4370  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4371  		for (k =3D 0; k <=3D v=
->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4372  			for (m =3D 0; m <=3D =
v->NumberOfActivePlanes - 1; m++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4373  				if (v->BlendingAndTi=
ming[k] =3D=3D m && v->RequiresDSC[i][m] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4374  					v->DSCDelayPerState=
[i][k] =3D v->DSCDelayPerState[i][m];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4375  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4376  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4377  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4378  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4379  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4380  	//Calculate Swath, DET =
Configuration, DCFCLKDeepSleep
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4381  	//
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4382  	for (i =3D 0; i < mode_=
lib->soc.num_states; ++i) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4383  		for (j =3D 0; j <=3D 1=
; ++j) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4384  			for (k =3D 0; k < v->=
NumberOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4385  				v->RequiredDPPCLKThi=
sState[k] =3D v->RequiredDPPCLK[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4386  				v->NoOfDPPThisState[=
k] =3D v->NoOfDPP[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4387  				v->ODMCombineEnableT=
hisState[k] =3D v->ODMCombineEnablePerState[i][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4388  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4389  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4390  			CalculateSwathAndDETC=
onfiguration(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4391  					false,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4392  					v->NumberOfActivePl=
anes,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4393  					v->DETBufferSizeInK=
Byte,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4394  					v->MaximumSwathWidt=
hLuma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4395  					v->MaximumSwathWidt=
hChroma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4396  					v->SourceScan,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4397  					v->SourcePixelForma=
t,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4398  					v->SurfaceTiling,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4399  					v->ViewportWidth,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4400  					v->ViewportHeight,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4401  					v->SurfaceWidthY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4402  					v->SurfaceWidthC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4403  					v->SurfaceHeightY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4404  					v->SurfaceHeightC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4405  					v->Read256BlockHeig=
htY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4406  					v->Read256BlockHeig=
htC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4407  					v->Read256BlockWidt=
hY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4408  					v->Read256BlockWidt=
hC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4409  					v->ODMCombineEnable=
ThisState,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4410  					v->BlendingAndTimin=
g,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4411  					v->BytePerPixelY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4412  					v->BytePerPixelC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4413  					v->BytePerPixelInDE=
TY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4414  					v->BytePerPixelInDE=
TC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4415  					v->HActive,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4416  					v->HRatio,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4417  					v->HRatioChroma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4418  					v->NoOfDPPThisState,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4419  					v->swath_width_luma=
_ub_this_state,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4420  					v->swath_width_chro=
ma_ub_this_state,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4421  					v->SwathWidthYThisS=
tate,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4422  					v->SwathWidthCThisS=
tate,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4423  					v->SwathHeightYThis=
State,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4424  					v->SwathHeightCThis=
State,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4425  					v->DETBufferSizeYTh=
isState,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4426  					v->DETBufferSizeCTh=
isState,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4427  					v->dummystring,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4428  					&v->ViewportSizeSup=
port[i][j]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4429  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4430  			for (k =3D 0; k < v->=
NumberOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4431  				v->swath_width_luma_=
ub_all_states[i][j][k] =3D v->swath_width_luma_ub_this_state[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4432  				v->swath_width_chrom=
a_ub_all_states[i][j][k] =3D v->swath_width_chroma_ub_this_state[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4433  				v->SwathWidthYAllSta=
tes[i][j][k] =3D v->SwathWidthYThisState[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4434  				v->SwathWidthCAllSta=
tes[i][j][k] =3D v->SwathWidthCThisState[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4435  				v->SwathHeightYAllSt=
ates[i][j][k] =3D v->SwathHeightYThisState[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4436  				v->SwathHeightCAllSt=
ates[i][j][k] =3D v->SwathHeightCThisState[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4437  				v->DETBufferSizeYAll=
States[i][j][k] =3D v->DETBufferSizeYThisState[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4438  				v->DETBufferSizeCAll=
States[i][j][k] =3D v->DETBufferSizeCThisState[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4439  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4440  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4441  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4442  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4443  	for (k =3D 0; k < v->Nu=
mberOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4444  		v->cursor_bw[k] =3D v-=
>NumberOfCursors[k] * v->CursorWidth[k][0] * v->CursorBPP[k][0] / 8.0 / (v-=
>HTotal[k] / v->PixelClock[k]) * v->VRatio[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4445  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4446  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4447  	for (i =3D 0; i < v->so=
c.num_states; i++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4448  		for (j =3D 0; j < 2; j=
++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4449  			for (k =3D 0; k <=3D =
v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4450  				v->swath_width_luma_=
ub_this_state[k] =3D v->swath_width_luma_ub_all_states[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4451  				v->swath_width_chrom=
a_ub_this_state[k] =3D v->swath_width_chroma_ub_all_states[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4452  				v->SwathWidthYThisSt=
ate[k] =3D v->SwathWidthYAllStates[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4453  				v->SwathWidthCThisSt=
ate[k] =3D v->SwathWidthCAllStates[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4454  				v->SwathHeightYThisS=
tate[k] =3D v->SwathHeightYAllStates[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4455  				v->SwathHeightCThisS=
tate[k] =3D v->SwathHeightCAllStates[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4456  				v->DETBufferSizeYThi=
sState[k] =3D v->DETBufferSizeYAllStates[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4457  				v->DETBufferSizeCThi=
sState[k] =3D v->DETBufferSizeCAllStates[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4458  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4459  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4460  			v->TotalNumberOfDCCAc=
tiveDPP[i][j] =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4461  			for (k =3D 0; k < v->=
NumberOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4462  				if (v->DCCEnable[k] =
=3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4463  					v->TotalNumberOfDCC=
ActiveDPP[i][j] =3D v->TotalNumberOfDCCActiveDPP[i][j] + v->NoOfDPP[i][j][k=
];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4464  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4465  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4466  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4467  			for (k =3D 0; k <=3D =
v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4468  				if (v->SourcePixelFo=
rmat[k] =3D=3D dm_420_8 || v->SourcePixelFormat[k] =3D=3D dm_420_10 || v->S=
ourcePixelFormat[k] =3D=3D dm_420_12
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4469  						|| v->SourcePixelF=
ormat[k] =3D=3D dm_rgbe_alpha) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4470  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4471  					if ((v->SourcePixel=
Format[k] =3D=3D dm_420_10 || v->SourcePixelFormat[k] =3D=3D dm_420_12) && =
v->SourceScan[k] !=3D dm_vert) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4472  						v->PTEBufferSizeIn=
RequestsForLuma =3D (v->PTEBufferSizeInRequestsLuma + v->PTEBufferSizeInReq=
uestsChroma) / 2;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4473  						v->PTEBufferSizeIn=
RequestsForChroma =3D v->PTEBufferSizeInRequestsForLuma;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4474  					} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4475  						v->PTEBufferSizeIn=
RequestsForLuma =3D v->PTEBufferSizeInRequestsLuma;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4476  						v->PTEBufferSizeIn=
RequestsForChroma =3D v->PTEBufferSizeInRequestsChroma;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4477  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4478  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4479  					v->PDEAndMetaPTEByt=
esPerFrameC =3D CalculateVMAndRowBytes(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4480  							mode_lib,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4481  							v->DCCEnable[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4482  							v->Read256BlockHe=
ightC[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4483  							v->Read256BlockWi=
dthY[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4484  							v->SourcePixelFor=
mat[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4485  							v->SurfaceTiling[=
k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4486  							v->BytePerPixelC[=
k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4487  							v->SourceScan[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4488  							v->SwathWidthCThi=
sState[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4489  							v->ViewportHeight=
Chroma[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4490  							v->GPUVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4491  							v->HostVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4492  							v->HostVMMaxNonCa=
chedPageTableLevels,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4493  							v->GPUVMMinPageSi=
ze,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4494  							v->HostVMMinPageS=
ize,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4495  							v->PTEBufferSizeI=
nRequestsForChroma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4496  							v->PitchC[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4497  							0.0,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4498  							&v->MacroTileWidt=
hC[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4499  							&v->MetaRowBytesC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4500  							&v->DPTEBytesPerR=
owC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4501  							&v->PTEBufferSize=
NotExceededC[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4502  							&v->dummyinteger7,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4503  							&v->dpte_row_heig=
ht_chroma[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4504  							&v->dummyinteger2=
8,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4505  							&v->dummyinteger2=
6,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4506  							&v->dummyinteger2=
3,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4507  							&v->meta_row_heig=
ht_chroma[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4508  							&v->dummyinteger8,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4509  							&v->dummyinteger9,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4510  							&v->dummyinteger1=
9,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4511  							&v->dummyinteger2=
0,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4512  							&v->dummyinteger1=
7,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4513  							&v->dummyinteger1=
0,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4514  							&v->dummyinteger1=
1);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4515  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4516  					v->PrefetchLinesC[i=
][j][k] =3D CalculatePrefetchSourceLines(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4517  							mode_lib,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4518  							v->VRatioChroma[k=
],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4519  							v->VTAPsChroma[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4520  							v->Interlace[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4521  							v->ProgressiveToI=
nterlaceUnitInOPP,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4522  							v->SwathHeightCTh=
isState[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4523  							v->ViewportYStart=
C[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4524  							&v->PrefillC[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4525  							&v->MaxNumSwC[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4526  				} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4527  					v->PTEBufferSizeInR=
equestsForLuma =3D v->PTEBufferSizeInRequestsLuma + v->PTEBufferSizeInReque=
stsChroma;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4528  					v->PTEBufferSizeInR=
equestsForChroma =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4529  					v->PDEAndMetaPTEByt=
esPerFrameC =3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4530  					v->MetaRowBytesC =
=3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4531  					v->DPTEBytesPerRowC=
 =3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4532  					v->PrefetchLinesC[i=
][j][k] =3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4533  					v->PTEBufferSizeNot=
ExceededC[i][j][k] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4534  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4535  				v->PDEAndMetaPTEByte=
sPerFrameY =3D CalculateVMAndRowBytes(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4536  						mode_lib,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4537  						v->DCCEnable[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4538  						v->Read256BlockHei=
ghtY[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4539  						v->Read256BlockWid=
thY[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4540  						v->SourcePixelForm=
at[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4541  						v->SurfaceTiling[k=
],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4542  						v->BytePerPixelY[k=
],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4543  						v->SourceScan[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4544  						v->SwathWidthYThis=
State[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4545  						v->ViewportHeight[=
k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4546  						v->GPUVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4547  						v->HostVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4548  						v->HostVMMaxNonCac=
hedPageTableLevels,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4549  						v->GPUVMMinPageSiz=
e,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4550  						v->HostVMMinPageSi=
ze,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4551  						v->PTEBufferSizeIn=
RequestsForLuma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4552  						v->PitchY[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4553  						v->DCCMetaPitchY[k=
],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4554  						&v->MacroTileWidth=
Y[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4555  						&v->MetaRowBytesY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4556  						&v->DPTEBytesPerRo=
wY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4557  						&v->PTEBufferSizeN=
otExceededY[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4558  						v->dummyinteger4,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4559  						&v->dpte_row_heigh=
t[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4560  						&v->dummyinteger29,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4561  						&v->dummyinteger27,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4562  						&v->dummyinteger24,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4563  						&v->meta_row_heigh=
t[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4564  						&v->dummyinteger25,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4565  						&v->dpte_group_byt=
es[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4566  						&v->dummyinteger21,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4567  						&v->dummyinteger22,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4568  						&v->dummyinteger18,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4569  						&v->dummyinteger5,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4570  						&v->dummyinteger6);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4571  				v->PrefetchLinesY[i]=
[j][k] =3D CalculatePrefetchSourceLines(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4572  						mode_lib,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4573  						v->VRatio[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4574  						v->vtaps[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4575  						v->Interlace[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4576  						v->ProgressiveToIn=
terlaceUnitInOPP,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4577  						v->SwathHeightYThi=
sState[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4578  						v->ViewportYStartY=
[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4579  						&v->PrefillY[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4580  						&v->MaxNumSwY[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4581  				v->PDEAndMetaPTEByte=
sPerFrame[i][j][k] =3D v->PDEAndMetaPTEBytesPerFrameY + v->PDEAndMetaPTEByt=
esPerFrameC;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4582  				v->MetaRowBytes[i][j=
][k] =3D v->MetaRowBytesY + v->MetaRowBytesC;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4583  				v->DPTEBytesPerRow[i=
][j][k] =3D v->DPTEBytesPerRowY + v->DPTEBytesPerRowC;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4584  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4585  				CalculateRowBandwidt=
h(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4586  						v->GPUVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4587  						v->SourcePixelForm=
at[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4588  						v->VRatio[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4589  						v->VRatioChroma[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4590  						v->DCCEnable[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4591  						v->HTotal[k] / v->=
PixelClock[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4592  						v->MetaRowBytesY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4593  						v->MetaRowBytesC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4594  						v->meta_row_height=
[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4595  						v->meta_row_height=
_chroma[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4596  						v->DPTEBytesPerRow=
Y,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4597  						v->DPTEBytesPerRow=
C,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4598  						v->dpte_row_height=
[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4599  						v->dpte_row_height=
_chroma[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4600  						&v->meta_row_bandw=
idth[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4601  						&v->dpte_row_bandw=
idth[i][j][k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4602  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4603  			v->UrgLatency[i] =3D =
CalculateUrgentLatency(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4604  					v->UrgentLatencyPix=
elDataOnly,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4605  					v->UrgentLatencyPix=
elMixedWithVMData,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4606  					v->UrgentLatencyVMD=
ataOnly,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4607  					v->DoUrgentLatencyA=
djustment,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4608  					v->UrgentLatencyAdj=
ustmentFabricClockComponent,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4609  					v->UrgentLatencyAdj=
ustmentFabricClockReference,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4610  					v->FabricClockPerSt=
ate[i]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4611  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4612  			for (k =3D 0; k < v->=
NumberOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4613  				CalculateUrgentBurst=
Factor(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4614  						v->swath_width_lum=
a_ub_this_state[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4615  						v->swath_width_chr=
oma_ub_this_state[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4616  						v->DETBufferSizeIn=
KByte,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4617  						v->SwathHeightYThi=
sState[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4618  						v->SwathHeightCThi=
sState[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4619  						v->HTotal[k] / v->=
PixelClock[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4620  						v->UrgLatency[i],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4621  						v->CursorBufferSiz=
e,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4622  						v->CursorWidth[k][=
0],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4623  						v->CursorBPP[k][0],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4624  						v->VRatio[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4625  						v->VRatioChroma[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4626  						v->BytePerPixelInD=
ETY[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4627  						v->BytePerPixelInD=
ETC[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4628  						v->DETBufferSizeYT=
hisState[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4629  						v->DETBufferSizeCT=
hisState[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4630  						&v->UrgentBurstFac=
torCursor[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4631  						&v->UrgentBurstFac=
torLuma[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4632  						&v->UrgentBurstFac=
torChroma[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4633  						&NotUrgentLatencyH=
iding[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4634  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4635  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4636  			v->NotUrgentLatencyHi=
ding[i][j] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4637  			for (k =3D 0; k < v->=
NumberOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4638  				if (NotUrgentLatency=
Hiding[k]) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4639  					v->NotUrgentLatency=
Hiding[i][j] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4640  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4641  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4642  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4643  			for (k =3D 0; k < v->=
NumberOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4644  				v->VActivePixelBandw=
idth[i][j][k] =3D v->ReadBandwidthLuma[k] * v->UrgentBurstFactorLuma[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4645  						+ v->ReadBandwidth=
Chroma[k] * v->UrgentBurstFactorChroma[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4646  				v->VActiveCursorBand=
width[i][j][k] =3D v->cursor_bw[k] * v->UrgentBurstFactorCursor[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4647  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4648  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4649  			v->TotalVActivePixelB=
andwidth[i][j] =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4650  			v->TotalVActiveCursor=
Bandwidth[i][j] =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4651  			v->TotalMetaRowBandwi=
dth[i][j] =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4652  			v->TotalDPTERowBandwi=
dth[i][j] =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4653  			for (k =3D 0; k < v->=
NumberOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4654  				v->TotalVActivePixel=
Bandwidth[i][j] =3D v->TotalVActivePixelBandwidth[i][j] + v->VActivePixelBa=
ndwidth[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4655  				v->TotalVActiveCurso=
rBandwidth[i][j] =3D v->TotalVActiveCursorBandwidth[i][j] + v->VActiveCurso=
rBandwidth[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4656  				v->TotalMetaRowBandw=
idth[i][j] =3D v->TotalMetaRowBandwidth[i][j] + v->NoOfDPP[i][j][k] * v->me=
ta_row_bandwidth[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4657  				v->TotalDPTERowBandw=
idth[i][j] =3D v->TotalDPTERowBandwidth[i][j] + v->NoOfDPP[i][j][k] * v->dp=
te_row_bandwidth[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4658  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4659  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4660  			CalculateDCFCLKDeepSl=
eep(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4661  					mode_lib,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4662  					v->NumberOfActivePl=
anes,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4663  					v->BytePerPixelY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4664  					v->BytePerPixelC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4665  					v->VRatio,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4666  					v->VRatioChroma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4667  					v->SwathWidthYThisS=
tate,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4668  					v->SwathWidthCThisS=
tate,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4669  					v->NoOfDPPThisState,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4670  					v->HRatio,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4671  					v->HRatioChroma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4672  					v->PixelClock,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4673  					v->PSCL_FACTOR,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4674  					v->PSCL_FACTOR_CHRO=
MA,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4675  					v->RequiredDPPCLKTh=
isState,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4676  					v->ReadBandwidthLum=
a,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4677  					v->ReadBandwidthChr=
oma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4678  					v->ReturnBusWidth,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4679  					&v->ProjectedDCFCLK=
DeepSleep[i][j]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4680  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4681  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4682  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4683  	//Calculate Return BW
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4684  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4685  	for (i =3D 0; i < mode_=
lib->soc.num_states; ++i) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4686  		for (j =3D 0; j <=3D 1=
; ++j) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4687  			for (k =3D 0; k <=3D =
v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4688  				if (v->BlendingAndTi=
ming[k] =3D=3D k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4689  					if (v->WritebackEna=
ble[k] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4690  						v->WritebackDelayT=
ime[k] =3D v->WritebackLatency
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4691  								+ CalculateWrite=
BackDelay(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4692  										v->WritebackPi=
xelFormat[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4693  										v->WritebackHR=
atio[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4694  										v->WritebackVR=
atio[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4695  										v->WritebackVT=
aps[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4696  										v->WritebackDe=
stinationWidth[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4697  										v->WritebackDe=
stinationHeight[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4698  										v->WritebackSo=
urceHeight[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4699  										v->HTotal[k]) =
/ v->RequiredDISPCLK[i][j];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4700  					} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4701  						v->WritebackDelayT=
ime[k] =3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4702  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4703  					for (m =3D 0; m <=
=3D v->NumberOfActivePlanes - 1; m++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4704  						if (v->BlendingAnd=
Timing[m] =3D=3D k && v->WritebackEnable[m] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4705  							v->WritebackDelay=
Time[k] =3D dml_max(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4706  									v->WritebackDel=
ayTime[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4707  									v->WritebackLat=
ency
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4708  											+ CalculateWr=
iteBackDelay(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4709  													v->Writebac=
kPixelFormat[m],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4710  													v->Writebac=
kHRatio[m],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4711  													v->Writebac=
kVRatio[m],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4712  													v->Writebac=
kVTaps[m],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4713  													v->Writebac=
kDestinationWidth[m],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4714  													v->Writebac=
kDestinationHeight[m],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4715  													v->Writebac=
kSourceHeight[m],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4716  													v->HTotal[m=
]) / v->RequiredDISPCLK[i][j]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4717  						}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4718  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4719  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4720  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4721  			for (k =3D 0; k <=3D =
v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4722  				for (m =3D 0; m <=3D=
 v->NumberOfActivePlanes - 1; m++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4723  					if (v->BlendingAndT=
iming[k] =3D=3D m) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4724  						v->WritebackDelayT=
ime[k] =3D v->WritebackDelayTime[m];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4725  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4726  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4727  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4728  			v->MaxMaxVStartup[i][=
j] =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4729  			for (k =3D 0; k <=3D =
v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4730  				v->MaximumVStartup[i=
][j][k] =3D v->VTotal[k] - v->VActive[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4731  						- dml_max(1.0, dml=
_ceil(1.0 * v->WritebackDelayTime[k] / (v->HTotal[k] / v->PixelClock[k]), 1=
.0));
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4732  				v->MaxMaxVStartup[i]=
[j] =3D dml_max(v->MaxMaxVStartup[i][j], v->MaximumVStartup[i][j][k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4733  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4734  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4735  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4736  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4737  	ReorderingBytes =3D v->=
NumberOfChannels
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4738  			* dml_max3(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4739  					v->UrgentOutOfOrder=
ReturnPerChannelPixelDataOnly,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4740  					v->UrgentOutOfOrder=
ReturnPerChannelPixelMixedWithVMData,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4741  					v->UrgentOutOfOrder=
ReturnPerChannelVMDataOnly);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4742  	v->FinalDRAMClockChange=
Latency =3D (v->DRAMClockChangeLatencyOverride > 0 ? v->DRAMClockChangeLate=
ncyOverride : v->DRAMClockChangeLatency);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4743  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4744  	for (i =3D 0; i < mode_=
lib->soc.num_states; ++i) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4745  		for (j =3D 0; j <=3D 1=
; ++j) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4746  			v->DCFCLKState[i][j] =
=3D v->DCFCLKPerState[i];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4747  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4748  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4749  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4750  	if (v->UseMinimumRequir=
edDCFCLK =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4751  		UseMinimumDCFCLK(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4752  				mode_lib,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4753  				v->MaxInterDCNTileRe=
peaters,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4754  				MaxPrefetchMode,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4755  				v->FinalDRAMClockCha=
ngeLatency,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4756  				v->SREnterPlusExitTi=
me,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4757  				v->ReturnBusWidth,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4758  				v->RoundTripPingLate=
ncyCycles,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4759  				ReorderingBytes,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4760  				v->PixelChunkSizeInK=
Byte,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4761  				v->MetaChunkSize,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4762  				v->GPUVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4763  				v->GPUVMMaxPageTable=
Levels,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4764  				v->HostVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4765  				v->NumberOfActivePla=
nes,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4766  				v->HostVMMinPageSize,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4767  				v->HostVMMaxNonCache=
dPageTableLevels,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4768  				v->DynamicMetadataVM=
Enabled,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4769  				v->ImmediateFlipRequ=
irement,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4770  				v->ProgressiveToInte=
rlaceUnitInOPP,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4771  				v->MaxAveragePercent=
OfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4772  				v->PercentOfIdealDRA=
MFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4773  				v->PercentOfIdealDRA=
MFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4774  				v->PercentOfIdealDRA=
MFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4775  				v->VTotal,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4776  				v->VActive,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4777  				v->DynamicMetadataTr=
ansmittedBytes,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4778  				v->DynamicMetadataLi=
nesBeforeActiveRequired,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4779  				v->Interlace,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4780  				v->RequiredDPPCLK,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4781  				v->RequiredDISPCLK,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4782  				v->UrgLatency,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4783  				v->NoOfDPP,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4784  				v->ProjectedDCFCLKDe=
epSleep,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4785  				v->MaximumVStartup,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4786  				v->TotalVActivePixel=
Bandwidth,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4787  				v->TotalVActiveCurso=
rBandwidth,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4788  				v->TotalMetaRowBandw=
idth,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4789  				v->TotalDPTERowBandw=
idth,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4790  				v->TotalNumberOfActi=
veDPP,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4791  				v->TotalNumberOfDCCA=
ctiveDPP,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4792  				v->dpte_group_bytes,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4793  				v->PrefetchLinesY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4794  				v->PrefetchLinesC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4795  				v->swath_width_luma_=
ub_all_states,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4796  				v->swath_width_chrom=
a_ub_all_states,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4797  				v->BytePerPixelY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4798  				v->BytePerPixelC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4799  				v->HTotal,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4800  				v->PixelClock,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4801  				v->PDEAndMetaPTEByte=
sPerFrame,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4802  				v->DPTEBytesPerRow,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4803  				v->MetaRowBytes,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4804  				v->DynamicMetadataEn=
able,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4805  				v->VActivePixelBandw=
idth,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4806  				v->VActiveCursorBand=
width,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4807  				v->ReadBandwidthLuma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4808  				v->ReadBandwidthChro=
ma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4809  				v->DCFCLKPerState,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4810  				v->DCFCLKState);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4811  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4812  		if (v->ClampMinDCFCLK)=
 {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4813  			/* Clamp calculated v=
alues to actual minimum */
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4814  			for (i =3D 0; i < mod=
e_lib->soc.num_states; ++i) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4815  				for (j =3D 0; j <=3D=
 1; ++j) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4816  					if (v->DCFCLKState[=
i][j] < mode_lib->soc.min_dcfclk) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4817  						v->DCFCLKState[i][=
j] =3D mode_lib->soc.min_dcfclk;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4818  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4819  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4820  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4821  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4822  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4823  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4824  	for (i =3D 0; i < mode_=
lib->soc.num_states; ++i) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4825  		for (j =3D 0; j <=3D 1=
; ++j) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4826  			v->IdealSDPPortBandwi=
dthPerState[i][j] =3D dml_min3(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4827  					v->ReturnBusWidth *=
 v->DCFCLKState[i][j],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4828  					v->DRAMSpeedPerStat=
e[i] * v->NumberOfChannels * v->DRAMChannelWidth,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4829  					v->FabricClockPerSt=
ate[i] * v->FabricDatapathToDCNDataReturn);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4830  			if (v->HostVMEnable !=
=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4831  				v->ReturnBWPerState[=
i][j] =3D v->IdealSDPPortBandwidthPerState[i][j] * v->PercentOfIdealDRAMFab=
ricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4832  						/ 100;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4833  			} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4834  				v->ReturnBWPerState[=
i][j] =3D v->IdealSDPPortBandwidthPerState[i][j]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4835  						* v->PercentOfIdea=
lDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData / 100;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4836  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4837  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4838  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4839  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4840  	//Re-ordering Buffer Su=
pport Check
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4841  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4842  	for (i =3D 0; i < mode_=
lib->soc.num_states; ++i) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4843  		for (j =3D 0; j <=3D 1=
; ++j) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4844  			if ((v->ROBBufferSize=
InKByte - v->PixelChunkSizeInKByte) * 1024 / v->ReturnBWPerState[i][j]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4845  					> (v->RoundTripPing=
LatencyCycles + 32) / v->DCFCLKState[i][j] + ReorderingBytes / v->ReturnBWP=
erState[i][j]) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4846  				v->ROBSupport[i][j] =
=3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4847  			} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4848  				v->ROBSupport[i][j] =
=3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4849  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4850  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4851  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4852  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4853  	//Vertical Active BW su=
pport check
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4854  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4855  	MaxTotalVActiveRDBandwi=
dth =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4856  	for (k =3D 0; k < v->Nu=
mberOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4857  		MaxTotalVActiveRDBandw=
idth =3D MaxTotalVActiveRDBandwidth + v->ReadBandwidthLuma[k] + v->ReadBand=
widthChroma[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4858  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4859  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4860  	for (i =3D 0; i < mode_=
lib->soc.num_states; ++i) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4861  		for (j =3D 0; j <=3D 1=
; ++j) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4862  			v->MaxTotalVerticalAc=
tiveAvailableBandwidth[i][j] =3D dml_min(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4863  					v->IdealSDPPortBand=
widthPerState[i][j] * v->MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNo=
rmalSystemOperation / 100,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4864  					v->DRAMSpeedPerStat=
e[i] * v->NumberOfChannels * v->DRAMChannelWidth * v->MaxAveragePercentOfId=
ealDRAMBWDisplayCanUseInNormalSystemOperation
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4865  							/ 100);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4866  			if (MaxTotalVActiveRD=
Bandwidth <=3D v->MaxTotalVerticalActiveAvailableBandwidth[i][j]) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4867  				v->TotalVerticalActi=
veBandwidthSupport[i][j] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4868  			} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4869  				v->TotalVerticalActi=
veBandwidthSupport[i][j] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4870  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4871  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4872  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4873  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4874  	//Prefetch Check
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4875  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4876  	for (i =3D 0; i < mode_=
lib->soc.num_states; ++i) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4877  		for (j =3D 0; j <=3D 1=
; ++j) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4878  			int NextPrefetchModeS=
tate =3D MinPrefetchMode;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4879  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4880  			v->TimeCalc =3D 24 / =
v->ProjectedDCFCLKDeepSleep[i][j];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4881  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4882  			v->BandwidthWithoutPr=
efetchSupported[i][j] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4883  			if (v->TotalVActivePi=
xelBandwidth[i][j] + v->TotalVActiveCursorBandwidth[i][j] + v->TotalMetaRow=
Bandwidth[i][j] + v->TotalDPTERowBandwidth[i][j]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4884  					> v->ReturnBWPerSta=
te[i][j] || v->NotUrgentLatencyHiding[i][j]) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4885  				v->BandwidthWithoutP=
refetchSupported[i][j] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4886  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4887  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4888  			for (k =3D 0; k < v->=
NumberOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4889  				v->NoOfDPPThisState[=
k] =3D v->NoOfDPP[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4890  				v->swath_width_luma_=
ub_this_state[k] =3D v->swath_width_luma_ub_all_states[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4891  				v->swath_width_chrom=
a_ub_this_state[k] =3D v->swath_width_chroma_ub_all_states[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4892  				v->SwathWidthYThisSt=
ate[k] =3D v->SwathWidthYAllStates[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4893  				v->SwathWidthCThisSt=
ate[k] =3D v->SwathWidthCAllStates[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4894  				v->SwathHeightYThisS=
tate[k] =3D v->SwathHeightYAllStates[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4895  				v->SwathHeightCThisS=
tate[k] =3D v->SwathHeightCAllStates[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4896  				v->DETBufferSizeYThi=
sState[k] =3D v->DETBufferSizeYAllStates[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4897  				v->DETBufferSizeCThi=
sState[k] =3D v->DETBufferSizeCAllStates[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4898  				v->ODMCombineEnabled=
[k] =3D v->ODMCombineEnablePerState[i][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4899  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4900  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4901  			v->ExtraLatency =3D C=
alculateExtraLatency(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4902  					v->RoundTripPingLat=
encyCycles,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4903  					ReorderingBytes,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4904  					v->DCFCLKState[i][j=
],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4905  					v->TotalNumberOfAct=
iveDPP[i][j],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4906  					v->PixelChunkSizeIn=
KByte,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4907  					v->TotalNumberOfDCC=
ActiveDPP[i][j],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4908  					v->MetaChunkSize,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4909  					v->ReturnBWPerState=
[i][j],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4910  					v->GPUVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4911  					v->HostVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4912  					v->NumberOfActivePl=
anes,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4913  					v->NoOfDPPThisState,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4914  					v->dpte_group_bytes,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4915  					v->PercentOfIdealDR=
AMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4916  					v->PercentOfIdealDR=
AMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4917  					v->HostVMMinPageSiz=
e,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4918  					v->HostVMMaxNonCach=
edPageTableLevels);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4919  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4920  			v->NextMaxVStartup =
=3D v->MaxMaxVStartup[i][j];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4921  			do {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4922  				v->PrefetchModePerSt=
ate[i][j] =3D NextPrefetchModeState;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4923  				v->MaxVStartup =3D v=
->NextMaxVStartup;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4924  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4925  				v->TWait =3D Calcula=
teTWait(v->PrefetchModePerState[i][j], v->FinalDRAMClockChangeLatency, v->U=
rgLatency[i], v->SREnterPlusExitTime);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4926  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4927  				for (k =3D 0; k <=3D=
 v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4928  					Pipe myPipe =3D { 0=
 };
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4929  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4930  					myPipe.DPPCLK =3D v=
->RequiredDPPCLK[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4931  					myPipe.DISPCLK =3D =
v->RequiredDISPCLK[i][j];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4932  					myPipe.PixelClock =
=3D v->PixelClock[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4933  					myPipe.DCFCLKDeepSl=
eep =3D v->ProjectedDCFCLKDeepSleep[i][j];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4934  					myPipe.DPPPerPlane =
=3D v->NoOfDPP[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4935  					myPipe.ScalerEnable=
d =3D v->ScalerEnabled[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4936  					myPipe.SourceScan =
=3D v->SourceScan[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4937  					myPipe.BlockWidth25=
6BytesY =3D v->Read256BlockWidthY[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4938  					myPipe.BlockHeight2=
56BytesY =3D v->Read256BlockHeightY[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4939  					myPipe.BlockWidth25=
6BytesC =3D v->Read256BlockWidthC[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4940  					myPipe.BlockHeight2=
56BytesC =3D v->Read256BlockHeightC[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4941  					myPipe.InterlaceEna=
ble =3D v->Interlace[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4942  					myPipe.NumberOfCurs=
ors =3D v->NumberOfCursors[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4943  					myPipe.VBlank =3D v=
->VTotal[k] - v->VActive[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4944  					myPipe.HTotal =3D v=
->HTotal[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4945  					myPipe.DCCEnable =
=3D v->DCCEnable[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4946  					myPipe.ODMCombineEn=
abled =3D !!v->ODMCombineEnabled[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4947  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4948  					v->NoTimeForPrefetc=
h[i][j][k] =3D CalculatePrefetchSchedule(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4949  							mode_lib,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4950  							v->PercentOfIdeal=
DRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4951  							v->PercentOfIdeal=
DRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4952  							&myPipe,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4953  							v->DSCDelayPerSta=
te[i][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4954  							v->DPPCLKDelaySub=
total + v->DPPCLKDelayCNVCFormater,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4955  							v->DPPCLKDelaySCL,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4956  							v->DPPCLKDelaySCL=
LBOnly,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4957  							v->DPPCLKDelayCNV=
CCursor,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4958  							v->DISPCLKDelaySu=
btotal,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4959  							v->SwathWidthYThi=
sState[k] / v->HRatio[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4960  							v->OutputFormat[k=
],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4961  							v->MaxInterDCNTil=
eRepeaters,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4962  							dml_min(v->MaxVSt=
artup, v->MaximumVStartup[i][j][k]),
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4963  							v->MaximumVStartu=
p[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4964  							v->GPUVMMaxPageTa=
bleLevels,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4965  							v->GPUVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4966  							v->HostVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4967  							v->HostVMMaxNonCa=
chedPageTableLevels,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4968  							v->HostVMMinPageS=
ize,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4969  							v->DynamicMetadat=
aEnable[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4970  							v->DynamicMetadat=
aVMEnabled,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4971  							v->DynamicMetadat=
aLinesBeforeActiveRequired[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4972  							v->DynamicMetadat=
aTransmittedBytes[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4973  							v->UrgLatency[i],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4974  							v->ExtraLatency,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4975  							v->TimeCalc,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4976  							v->PDEAndMetaPTEB=
ytesPerFrame[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4977  							v->MetaRowBytes[i=
][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4978  							v->DPTEBytesPerRo=
w[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4979  							v->PrefetchLinesY=
[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4980  							v->SwathWidthYThi=
sState[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4981  							v->BytePerPixelY[=
k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4982  							v->PrefillY[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4983  							v->MaxNumSwY[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4984  							v->PrefetchLinesC=
[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4985  							v->SwathWidthCThi=
sState[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4986  							v->BytePerPixelC[=
k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4987  							v->PrefillC[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4988  							v->MaxNumSwC[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4989  							v->swath_width_lu=
ma_ub_this_state[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4990  							v->swath_width_ch=
roma_ub_this_state[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4991  							v->SwathHeightYTh=
isState[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4992  							v->SwathHeightCTh=
isState[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4993  							v->TWait,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4994  							v->ProgressiveToI=
nterlaceUnitInOPP,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4995  							&v->DSTXAfterScal=
er[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4996  							&v->DSTYAfterScal=
er[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4997  							&v->LineTimesForP=
refetch[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4998  							&v->PrefetchBW[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  4999  							&v->LinesForMetaP=
TE[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5000  							&v->LinesForMetaA=
ndDPTERow[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5001  							&v->VRatioPreY[i]=
[j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5002  							&v->VRatioPreC[i]=
[j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5003  							&v->RequiredPrefe=
tchPixelDataBWLuma[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5004  							&v->RequiredPrefe=
tchPixelDataBWChroma[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5005  							&v->NoTimeForDyna=
micMetadata[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5006  							&v->Tno_bw[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5007  							&v->prefetch_vmro=
w_bw[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5008  							&v->Tdmdl_vm[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5009  							&v->Tdmdl[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5010  							&v->VUpdateOffset=
Pix[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5011  							&v->VUpdateWidthP=
ix[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5012  							&v->VReadyOffsetP=
ix[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5013  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5014  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5015  				for (k =3D 0; k <=3D=
 v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5016  					CalculateUrgentBurs=
tFactor(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5017  							v->swath_width_lu=
ma_ub_this_state[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5018  							v->swath_width_ch=
roma_ub_this_state[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5019  							v->DETBufferSizeI=
nKByte,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5020  							v->SwathHeightYTh=
isState[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5021  							v->SwathHeightCTh=
isState[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5022  							v->HTotal[k] / v-=
>PixelClock[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5023  							v->UrgentLatency,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5024  							v->CursorBufferSi=
ze,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5025  							v->CursorWidth[k]=
[0],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5026  							v->CursorBPP[k][0=
],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5027  							v->VRatioPreY[i][=
j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5028  							v->VRatioPreC[i][=
j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5029  							v->BytePerPixelIn=
DETY[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5030  							v->BytePerPixelIn=
DETC[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5031  							v->DETBufferSizeY=
ThisState[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5032  							v->DETBufferSizeC=
ThisState[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5033  							&v->UrgentBurstFa=
ctorCursorPre[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5034  							&v->UrgentBurstFa=
ctorLumaPre[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5035  							&v->UrgentBurstFa=
ctorChroma[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5036  							&v->NoUrgentLaten=
cyHidingPre[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5037  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5038  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5039  				v->MaximumReadBandwi=
dthWithPrefetch =3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5040  				for (k =3D 0; k <=3D=
 v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5041  					v->cursor_bw_pre[k]=
 =3D v->NumberOfCursors[k] * v->CursorWidth[k][0] * v->CursorBPP[k][0] / 8.=
0 / (v->HTotal[k] / v->PixelClock[k])
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5042  							* v->VRatioPreY[i=
][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5043  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5044  					v->MaximumReadBandw=
idthWithPrefetch =3D v->MaximumReadBandwidthWithPrefetch
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5045  							+ dml_max4(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5046  									v->VActivePixel=
Bandwidth[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5047  									v->VActiveCurso=
rBandwidth[i][j][k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5048  											+ v->NoOfDPP[=
i][j][k] * (v->meta_row_bandwidth[i][j][k] + v->dpte_row_bandwidth[i][j][k]=
),
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5049  									v->NoOfDPP[i][j=
][k] * v->prefetch_vmrow_bw[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5050  									v->NoOfDPP[i][j=
][k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5051  											* (v->Require=
dPrefetchPixelDataBWLuma[i][j][k] * v->UrgentBurstFactorLumaPre[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5052  													+ v->Requir=
edPrefetchPixelDataBWChroma[i][j][k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5053  															* v->Urge=
ntBurstFactorChromaPre[k])
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5054  											+ v->cursor_b=
w_pre[k] * v->UrgentBurstFactorCursorPre[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5055  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5056  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5057  				v->NotEnoughUrgentLa=
tencyHidingPre =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5058  				for (k =3D 0; k <=3D=
 v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5059  					if (v->NoUrgentLate=
ncyHidingPre[k] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5060  						v->NotEnoughUrgent=
LatencyHidingPre =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5061  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5062  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5063  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5064  				v->PrefetchSupported=
[i][j] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5065  				if (v->BandwidthWith=
outPrefetchSupported[i][j] =3D=3D false || v->MaximumReadBandwidthWithPrefe=
tch > v->ReturnBWPerState[i][j]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5066  						|| v->NotEnoughUrg=
entLatencyHidingPre =3D=3D 1) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5067  					v->PrefetchSupporte=
d[i][j] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5068  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5069  				for (k =3D 0; k <=3D=
 v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5070  					if (v->LineTimesFor=
Prefetch[k] < 2.0 || v->LinesForMetaPTE[k] >=3D 32.0 || v->LinesForMetaAndD=
PTERow[k] >=3D 16.0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5071  							|| v->NoTimeForPr=
efetch[i][j][k] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5072  						v->PrefetchSupport=
ed[i][j] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5073  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5074  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5075  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5076  				v->DynamicMetadataSu=
pported[i][j] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5077  				for (k =3D 0; k < v-=
>NumberOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5078  					if (v->NoTimeForDyn=
amicMetadata[i][j][k] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5079  						v->DynamicMetadata=
Supported[i][j] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5080  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5081  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5082  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5083  				v->VRatioInPrefetchS=
upported[i][j] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5084  				for (k =3D 0; k <=3D=
 v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5085  					if (v->VRatioPreY[i=
][j][k] > 4.0 || v->VRatioPreC[i][j][k] > 4.0 || v->NoTimeForPrefetch[i][j]=
[k] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5086  						v->VRatioInPrefetc=
hSupported[i][j] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5087  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5088  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5089  				v->AnyLinesForVMOrRo=
wTooLarge =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5090  				for (k =3D 0; k < v-=
>NumberOfActivePlanes; ++k) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5091  					if (v->LinesForMeta=
AndDPTERow[k] >=3D 16 || v->LinesForMetaPTE[k] >=3D 32) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5092  						v->AnyLinesForVMOr=
RowTooLarge =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5093  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5094  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5095  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5096  				if (v->PrefetchSuppo=
rted[i][j] =3D=3D true && v->VRatioInPrefetchSupported[i][j] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5097  					v->BandwidthAvailab=
leForImmediateFlip =3D v->ReturnBWPerState[i][j];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5098  					for (k =3D 0; k <=
=3D v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5099  						v->BandwidthAvaila=
bleForImmediateFlip =3D v->BandwidthAvailableForImmediateFlip
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5100  								- dml_max(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5101  										v->VActivePixe=
lBandwidth[i][j][k] + v->VActiveCursorBandwidth[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5102  										v->NoOfDPP[i][=
j][k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5103  												* (v->Requir=
edPrefetchPixelDataBWLuma[i][j][k] * v->UrgentBurstFactorLumaPre[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5104  														+ v->Requi=
redPrefetchPixelDataBWChroma[i][j][k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5105  																* v->Urg=
entBurstFactorChromaPre[k])
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5106  												+ v->cursor_=
bw_pre[k] * v->UrgentBurstFactorCursorPre[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5107  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5108  					v->TotImmediateFlip=
Bytes =3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5109  					for (k =3D 0; k <=
=3D v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5110  						v->TotImmediateFli=
pBytes =3D v->TotImmediateFlipBytes + v->NoOfDPP[i][j][k] * v->PDEAndMetaPT=
EBytesPerFrame[i][j][k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5111  								+ v->MetaRowByte=
s[i][j][k] + v->DPTEBytesPerRow[i][j][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5112  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5113  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5114  					for (k =3D 0; k <=
=3D v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5115  						CalculateFlipSched=
ule(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5116  								mode_lib,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5117  								v->PercentOfIdea=
lDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5118  								v->PercentOfIdea=
lDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5119  								v->ExtraLatency,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5120  								v->UrgLatency[i],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5121  								v->GPUVMMaxPageT=
ableLevels,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5122  								v->HostVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5123  								v->HostVMMaxNonC=
achedPageTableLevels,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5124  								v->GPUVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5125  								v->HostVMMinPage=
Size,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5126  								v->PDEAndMetaPTE=
BytesPerFrame[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5127  								v->MetaRowBytes[=
i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5128  								v->DPTEBytesPerR=
ow[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5129  								v->BandwidthAvai=
lableForImmediateFlip,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5130  								v->TotImmediateF=
lipBytes,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5131  								v->SourcePixelFo=
rmat[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5132  								v->HTotal[k] / v=
->PixelClock[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5133  								v->VRatio[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5134  								v->VRatioChroma[=
k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5135  								v->Tno_bw[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5136  								v->DCCEnable[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5137  								v->dpte_row_heig=
ht[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5138  								v->meta_row_heig=
ht[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5139  								v->dpte_row_heig=
ht_chroma[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5140  								v->meta_row_heig=
ht_chroma[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5141  								&v->DestinationL=
inesToRequestVMInImmediateFlip[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5142  								&v->DestinationL=
inesToRequestRowInImmediateFlip[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5143  								&v->final_flip_b=
w[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5144  								&v->ImmediateFli=
pSupportedForPipe[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5145  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5146  					v->total_dcn_read_b=
w_with_flip =3D 0.0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5147  					for (k =3D 0; k <=
=3D v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5148  						v->total_dcn_read_=
bw_with_flip =3D v->total_dcn_read_bw_with_flip
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5149  								+ dml_max3(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5150  										v->NoOfDPP[i][=
j][k] * v->prefetch_vmrow_bw[k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5151  										v->NoOfDPP[i][=
j][k] * v->final_flip_bw[k] + v->VActivePixelBandwidth[i][j][k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5152  												+ v->VActive=
CursorBandwidth[i][j][k],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5153  										v->NoOfDPP[i][=
j][k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5154  												* (v->final_=
flip_bw[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5155  														+ v->Requi=
redPrefetchPixelDataBWLuma[i][j][k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5156  																* v->Urg=
entBurstFactorLumaPre[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5157  														+ v->Requi=
redPrefetchPixelDataBWChroma[i][j][k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5158  																* v->Urg=
entBurstFactorChromaPre[k])
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5159  												+ v->cursor_=
bw_pre[k] * v->UrgentBurstFactorCursorPre[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5160  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5161  					v->ImmediateFlipSup=
portedForState[i][j] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5162  					if (v->total_dcn_re=
ad_bw_with_flip > v->ReturnBWPerState[i][j]) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5163  						v->ImmediateFlipSu=
pportedForState[i][j] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5164  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5165  					for (k =3D 0; k <=
=3D v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5166  						if (v->ImmediateFl=
ipSupportedForPipe[k] =3D=3D false) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5167  							v->ImmediateFlipS=
upportedForState[i][j] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5168  						}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5169  					}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5170  				} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5171  					v->ImmediateFlipSup=
portedForState[i][j] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5172  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5173  				if (v->MaxVStartup <=
=3D 13 || v->AnyLinesForVMOrRowTooLarge =3D=3D false) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5174  					v->NextMaxVStartup =
=3D v->MaxMaxVStartup[i][j];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5175  					NextPrefetchModeSta=
te =3D NextPrefetchModeState + 1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5176  				} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5177  					v->NextMaxVStartup =
=3D v->NextMaxVStartup - 1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5178  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5179  			} while (!((v->Prefet=
chSupported[i][j] =3D=3D true && v->DynamicMetadataSupported[i][j] =3D=3D t=
rue && v->VRatioInPrefetchSupported[i][j] =3D=3D true
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5180  					&& ((v->HostVMEnabl=
e =3D=3D false && v->ImmediateFlipRequirement !=3D dm_immediate_flip_requir=
ed)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5181  							|| v->ImmediateFl=
ipSupportedForState[i][j] =3D=3D true))
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5182  					|| (v->NextMaxVStar=
tup =3D=3D v->MaxMaxVStartup[i][j] && NextPrefetchModeState > MaxPrefetchMo=
de)));
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5183  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5184  			CalculateWatermarksAn=
dDRAMSpeedChangeSupport(
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5185  					mode_lib,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5186  					v->PrefetchModePerS=
tate[i][j],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5187  					v->NumberOfActivePl=
anes,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5188  					v->MaxLineBufferLin=
es,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5189  					v->LineBufferSize,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5190  					v->DPPOutputBufferP=
ixels,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5191  					v->DETBufferSizeInK=
Byte,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5192  					v->WritebackInterfa=
ceBufferSize,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5193  					v->DCFCLKState[i][j=
],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5194  					v->ReturnBWPerState=
[i][j],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5195  					v->GPUVMEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5196  					v->dpte_group_bytes,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5197  					v->MetaChunkSize,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5198  					v->UrgLatency[i],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5199  					v->ExtraLatency,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5200  					v->WritebackLatency,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5201  					v->WritebackChunkSi=
ze,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5202  					v->SOCCLKPerState[i=
],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5203  					v->FinalDRAMClockCh=
angeLatency,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5204  					v->SRExitTime,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5205  					v->SREnterPlusExitT=
ime,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5206  					v->ProjectedDCFCLKD=
eepSleep[i][j],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5207  					v->NoOfDPPThisState,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5208  					v->DCCEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5209  					v->RequiredDPPCLKTh=
isState,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5210  					v->DETBufferSizeYTh=
isState,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5211  					v->DETBufferSizeCTh=
isState,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5212  					v->SwathHeightYThis=
State,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5213  					v->SwathHeightCThis=
State,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5214  					v->LBBitPerPixel,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5215  					v->SwathWidthYThisS=
tate,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5216  					v->SwathWidthCThisS=
tate,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5217  					v->HRatio,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5218  					v->HRatioChroma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5219  					v->vtaps,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5220  					v->VTAPsChroma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5221  					v->VRatio,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5222  					v->VRatioChroma,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5223  					v->HTotal,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5224  					v->PixelClock,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5225  					v->BlendingAndTimin=
g,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5226  					v->BytePerPixelInDE=
TY,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5227  					v->BytePerPixelInDE=
TC,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5228  					v->DSTXAfterScaler,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5229  					v->DSTYAfterScaler,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5230  					v->WritebackEnable,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5231  					v->WritebackPixelFo=
rmat,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5232  					v->WritebackDestina=
tionWidth,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5233  					v->WritebackDestina=
tionHeight,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5234  					v->WritebackSourceH=
eight,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5235  					&v->DRAMClockChange=
Support[i][j],
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5236  					&v->UrgentWatermark,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5237  					&v->WritebackUrgent=
Watermark,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5238  					&v->DRAMClockChange=
Watermark,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5239  					&v->WritebackDRAMCl=
ockChangeWatermark,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5240  					&v->StutterExitWate=
rmark,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5241  					&v->StutterEnterPlu=
sExitWatermark,
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5242  					&v->MinActiveDRAMCl=
ockChangeLatencySupported);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5243  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5244  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5245  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5246  	/*PTE Buffer Size Check=
*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5247  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5248  	for (i =3D 0; i < v->so=
c.num_states; i++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5249  		for (j =3D 0; j < 2; j=
++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5250  			v->PTEBufferSizeNotEx=
ceeded[i][j] =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5251  			for (k =3D 0; k <=3D =
v->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5252  				if (v->PTEBufferSize=
NotExceededY[i][j][k] =3D=3D false || v->PTEBufferSizeNotExceededC[i][j][k]=
 =3D=3D false) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5253  					v->PTEBufferSizeNot=
Exceeded[i][j] =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5254  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5255  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5256  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5257  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5258  	/*Cursor Support Check*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5259  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5260  	v->CursorSupport =3D tr=
ue;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5261  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5262  		if (v->CursorWidth[k][=
0] > 0.0) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5263  			if (v->CursorBPP[k][0=
] =3D=3D 64 && v->Cursor64BppSupport =3D=3D false) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5264  				v->CursorSupport =3D=
 false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5265  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5266  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5267  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5268  	/*Valid Pitch Check*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5269  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5270  	v->PitchSupport =3D tru=
e;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5271  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5272  		v->AlignedYPitch[k] =
=3D dml_ceil(dml_max(v->PitchY[k], v->SurfaceWidthY[k]), v->MacroTileWidthY=
[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5273  		if (v->DCCEnable[k] =
=3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5274  			v->AlignedDCCMetaPitc=
hY[k] =3D dml_ceil(dml_max(v->DCCMetaPitchY[k], v->SurfaceWidthY[k]), 64.0 =
* v->Read256BlockWidthY[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5275  		} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5276  			v->AlignedDCCMetaPitc=
hY[k] =3D v->DCCMetaPitchY[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5277  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5278  		if (v->SourcePixelForm=
at[k] !=3D dm_444_64 && v->SourcePixelFormat[k] !=3D dm_444_32 && v->Source=
PixelFormat[k] !=3D dm_444_16 && v->SourcePixelFormat[k] !=3D dm_mono_16
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5279  				&& v->SourcePixelFor=
mat[k] !=3D dm_rgbe && v->SourcePixelFormat[k] !=3D dm_mono_8) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5280  			v->AlignedCPitch[k] =
=3D dml_ceil(dml_max(v->PitchC[k], v->SurfaceWidthC[k]), v->MacroTileWidthC=
[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5281  			if (v->DCCEnable[k] =
=3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5282  				v->AlignedDCCMetaPit=
chC[k] =3D dml_ceil(dml_max(v->DCCMetaPitchC[k], v->SurfaceWidthC[k]), 64.0=
 * v->Read256BlockWidthC[k]);
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5283  			} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5284  				v->AlignedDCCMetaPit=
chC[k] =3D v->DCCMetaPitchC[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5285  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5286  		} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5287  			v->AlignedCPitch[k] =
=3D v->PitchC[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5288  			v->AlignedDCCMetaPitc=
hC[k] =3D v->DCCMetaPitchC[k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5289  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5290  		if (v->AlignedYPitch[k=
] > v->PitchY[k] || v->AlignedCPitch[k] > v->PitchC[k] || v->AlignedDCCMeta=
PitchY[k] > v->DCCMetaPitchY[k]
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5291  				|| v->AlignedDCCMeta=
PitchC[k] > v->DCCMetaPitchC[k]) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5292  			v->PitchSupport =3D f=
alse;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5293  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5294  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5295  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5296  	for (k =3D 0; k <=3D v-=
>NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5297  		if (v->ViewportWidth[k=
] > v->SurfaceWidthY[k] || v->ViewportHeight[k] > v->SurfaceHeightY[k])
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5298  			ViewportExceedsSurfac=
e =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5299  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5300  		if (v->SourcePixelForm=
at[k] !=3D dm_444_64 && v->SourcePixelFormat[k] !=3D dm_444_32 && v->Source=
PixelFormat[k] !=3D dm_444_16
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5301  				&& v->SourcePixelFor=
mat[k] !=3D dm_444_16 && v->SourcePixelFormat[k] !=3D dm_444_8 && v->Source=
PixelFormat[k] !=3D dm_rgbe) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5302  			if (v->ViewportWidthC=
hroma[k] > v->SurfaceWidthC[k] || v->ViewportHeightChroma[k] > v->SurfaceHe=
ightC[k]) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5303  				ViewportExceedsSurfa=
ce =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5304  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5305  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5306  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5307  	/*Mode Support, Voltage=
 State and SOC Configuration*/
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5308  =

6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5309  	for (i =3D v->soc.num_s=
tates - 1; i >=3D 0; i--) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5310  		for (j =3D 0; j < 2; j=
++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5311  			if (v->ScaleRatioAndT=
apsSupport =3D=3D 1 && v->SourceFormatPixelAndScanSupport =3D=3D 1 && v->Vi=
ewportSizeSupport[i][j] =3D=3D 1
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5312  					&& v->DIOSupport[i]=
 =3D=3D 1 && v->ODMCombine4To1SupportCheckOK[i] =3D=3D 1
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5313  					&& v->NotEnoughDSCU=
nits[i] =3D=3D 0 && v->DSCCLKRequiredMoreThanSupported[i] =3D=3D 0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5314  					&& v->DTBCLKRequire=
dMoreThanSupported[i] =3D=3D 0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5315  					&& v->ROBSupport[i]=
[j] =3D=3D 1 && v->DISPCLK_DPPCLK_Support[i][j] =3D=3D 1 && v->TotalAvailab=
lePipesSupport[i][j] =3D=3D 1
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5316  					&& EnoughWritebackU=
nits =3D=3D 1 && WritebackModeSupport =3D=3D 1
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5317  					&& v->WritebackLate=
ncySupport =3D=3D 1 && v->WritebackScaleRatioAndTapsSupport =3D=3D 1 && v->=
CursorSupport =3D=3D 1 && v->PitchSupport =3D=3D 1
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5318  					&& ViewportExceedsS=
urface =3D=3D 0 && v->PrefetchSupported[i][j] =3D=3D 1 && v->DynamicMetadat=
aSupported[i][j] =3D=3D 1
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5319  					&& v->TotalVertical=
ActiveBandwidthSupport[i][j] =3D=3D 1 && v->VRatioInPrefetchSupported[i][j]=
 =3D=3D 1
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5320  					&& v->PTEBufferSize=
NotExceeded[i][j] =3D=3D 1 && v->NonsupportedDSCInputBPC =3D=3D 0
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5321  					&& ((v->HostVMEnabl=
e =3D=3D 0 && v->ImmediateFlipRequirement !=3D dm_immediate_flip_required)
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5322  							|| v->ImmediateFl=
ipSupportedForState[i][j] =3D=3D true)) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5323  				v->ModeSupport[i][j]=
 =3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5324  			} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5325  				v->ModeSupport[i][j]=
 =3D false;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5326  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5327  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5328  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5329  	{
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5330  		unsigned int MaximumMP=
CCombine =3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5331  		for (i =3D v->soc.num_=
states; i >=3D 0; i--) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5332  			if (i =3D=3D v->soc.n=
um_states || v->ModeSupport[i][0] =3D=3D true || v->ModeSupport[i][1] =3D=
=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5333  				v->VoltageLevel =3D =
i;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5334  				v->ModeIsSupported =
=3D v->ModeSupport[i][0] =3D=3D true || v->ModeSupport[i][1] =3D=3D true;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5335  				if (v->ModeSupport[i=
][1] =3D=3D true) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5336  					MaximumMPCCombine =
=3D 1;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5337  				} else {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5338  					MaximumMPCCombine =
=3D 0;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5339  				}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5340  			}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5341  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5342  		v->ImmediateFlipSuppor=
t =3D v->ImmediateFlipSupportedForState[v->VoltageLevel][MaximumMPCCombine];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5343  		for (k =3D 0; k <=3D v=
->NumberOfActivePlanes - 1; k++) {
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5344  			v->MPCCombineEnable[k=
] =3D v->MPCCombine[v->VoltageLevel][MaximumMPCCombine][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5345  			v->DPPPerPlane[k] =3D=
 v->NoOfDPP[v->VoltageLevel][MaximumMPCCombine][k];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5346  		}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5347  		v->DCFCLK =3D v->DCFCL=
KState[v->VoltageLevel][MaximumMPCCombine];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5348  		v->DRAMSpeed =3D v->DR=
AMSpeedPerState[v->VoltageLevel];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5349  		v->FabricClock =3D v->=
FabricClockPerState[v->VoltageLevel];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5350  		v->SOCCLK =3D v->SOCCL=
KPerState[v->VoltageLevel];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5351  		v->ReturnBW =3D v->Ret=
urnBWPerState[v->VoltageLevel][MaximumMPCCombine];
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5352  		v->maxMpcComb =3D Maxi=
mumMPCCombine;
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5353  	}
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5354  }
6725a88f88a7e9 Bhawanpreet Lakha 2020-05-21  5355  =


:::::: The code at line 3640 was first introduced by commit
:::::: 6725a88f88a7e922e91c45bf83d320487810c192 drm/amd/display: Add DCN3 D=
ML

:::::: TO: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1760101373017417167==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICGA5ll8AAy5jb25maWcAlDxbd9s20u/9FTrtS/vQ1HYcN93v+AEkQQkVSTAAKEt+wVFlOetd
X7Ky3E3+/TcD8AKAoNrN6UlDzOA+9xnoh+9+mJG348vT9viw2z4+fpt93j/vD9vj/m52//C4/79Z
xmcVVzOaMfUOkIuH57evv3z9eKWvLmcf3v367uznw+5ittwfnvePs/Tl+f7h8xv0f3h5/u6H7+C/
H6Dx6QsMdfjHbPe4ff48+3N/eAXw7Pzi3dm7s9mPnx+O//jlF/j76eFweDn88vj455P+cnj51353
nN1f7C4+7H49+/W387v9bx/uLi6vrvZnv/3x4Y8PH+9373+9v9rt7n7dXv4EU6W8ytlcz9NUr6iQ
jFfXZ11jkY3bAI9JnRakml9/6xvxs8c9vziDP06HlFS6YNXS6ZDqBZGayFLPueJRAKugD3VAvJJK
NKniQg6tTHzSN1w4YycNKzLFSqoVSQqqJRdqgKqFoCSDwXMOfwGKxK7mzOfmFh9nr/vj25fhaFjF
lKbVShMBR8JKpq7fX+AVdcsqawbTKCrV7OF19vxyxBH6M+QpKbqT+f77WLMmjXsEZv1akkI5+Auy
onpJRUULPb9l9YDuQhKAXMRBxW1J4pD17VQPPgW4BEB/AM6q3P2HcLO2Uwi4wlPw9e3p3jxy+t6K
27aM5qQplF5wqSpS0uvvf3x+ed7/9P0wprwh8b3IjVyxOo3Cai7ZWpefGtrQKEIquJS6pCUXG02U
IukisuRG0oIl7gGTBuRIBNPcCRHpwmLA2oCmio6agTFmr29/vH57Pe6fHEanFRUsNXxTC544DOaC
5ILfxCE0z2mqGE6d57q0/BPg1bTKWGWYMz5IyeaCKGQJh8JEBiAJh68FlTBCvGu6cKkfWzJeElb5
bZKVMSS9YFTgkW3Gg5eSxRfcAqLzGBgvy2Zin0QJIAq4FuB3EFxxLNyuWJnz0CXPqD9FzkVKs1Zw
MVfsypoISdtF9+TijpzRpJnn0ifH/fPd7OU+IJBBlPN0KXkDc+obotJFxp0ZDbW5KCgcXT0wQFak
YBlRVBdEKp1u0iJCakZMrwbKDcBmPLqilZIngToRnGQpTHQarQQKINnvTRSv5FI3NS65YyH18ARq
N8ZFiqVLzSsKbOIMVXG9uEWFUBrC7m8EGmuYg2csjbCx7cUycz59H9uaN0UR6QL/U3SttBIkXVqS
cPSRD7P0MzWvw39svkBKNHdiNGxPKaNzcISeoLSsFQxWxYVeh7DiRVMpIjaRlbQ4w1q6TimHPqNm
KzasmVQ3v6jt679nR1jibAvLfT1uj6+z7W738vZ8fHj+PNzZigkYsW40Sc24wbmZK/XBkaVGBkEK
8jnWULU3iyuxZboAdiareci4FqAWVJSkwM1K2Yj4qSYyQ+mdAgpOpKJIaNtIRZSMX4xkUbHwN47U
ITY4CSZ5YWSXO5y5HZE2MxlhHrhGDbDxfXuN8KHpGhjHoQDpYZiBgibc83gcOIaiGDjTgVQUzlzS
eZoUzBULCMtJxRt1fXU5btQFJfm1YwZakFSWrSKUgwgJ5+EcpgnkdEE21x8Gq9ksjacJnrDLiv6R
9kS3tP9wyHDZHy1PXSJjywWoEWDwqK2K1mcOyp/l6vrizG3Hmy7J2oGfXwzXxyq1BJM1p8EY5+89
0m/Agrc2uSF1I5o7Vpa7f+7v3sDlmd3vt8e3w/7VNLf7jkA9nSSbugY7X+qqKYlOCDgkqcd6BuuG
VAqAyszeVCWptSoSnReNXIx8ENjT+cXHYIR+nhCazgVvaukeNVh66TzOvsWy7RAT7gZgj2gYPydM
aB8ycGEOGpBU2Q3LVMykBJE11dO21yyL0UMLFZlxHcJOOXDfLRVxU7cGM1adGDOjK5bSyKjQc1Kg
daulIj8FN0ZPFAHNfTCaQGzG+y9ouqw5XC0qQjDXYmqzFd/gspnZPAG+kXATGQVxBtYezWJXYRh9
8PWAEOAojBklnNs236SE0aw15XiCIgscQGgI/D5oad29QTxlgf/kovIAE9ylCCpIKtTIvpwBXuGg
kUt2S9HQMHfDQX9VweUGaBL+ETtbMASVYwfab9ACKTVq3xg1jhlphEqdynoJM4MSwqmdw63z4SPU
JCW4gAyI1DHJ5Zwq9Gf0yB61FztqzhfAdL7ZZp1Aa0JFLR2UlK7iM5KzKpnr/3t2CS1yOPUJOyDY
e+zWCHgIaEY6y27AQAw+QQQ4Z1Vzb/dsXpEid8jT7C/3JImxsPMYycsFCEJHjDKP3BjXjYjbWiRb
MVh8e+wyuHYjjvECjTefZ/rG4QmYMSFCMPd6lzjIppTjFu3d6tCagGUDh4NEbdVwiGEOF1ka/WF3
V0B63bpjG+t1UReLQPzfXU/K2ViggVA1DduDWarU0IfD/pI6XqyRhkEbdKdZ5qoXy0kwpw7dLdMI
y9Gr0rixDiQ9P7vs1HcbzKz3h/uXw9P2ebef0T/3z2A4EtDgKZqO4EMMRmB0LrvWyIy9HfA3p+nN
9dLOYT0J6gYOZdEkdkI3xFjWBG7DhBMHsV6QJEbXMICPxuNoJIELE3Pa3XY4ttGkaH1qAfKEl1FO
9xExWAJ+axZHXTR5DkZWTWDOPvQwsQNj2NVEKEZ8gadoqcEZJhjWZTlLg3AN2JU5KzwTywhnoz49
79EPq3bIV5eJS+9rExz3vl1taAO/qAEymvLMZWswxmuwx43WUdff7x/vry5//vrx6uerSzfaugS1
3Flvzj4VOMlm3WOYF9QxrFeiwSgq0LfMBhOuLz6eQiBrjBRHETpK6waaGMdDg+HOr0bxI0l05oZ2
O4BH2E5jL6+0uSqPJ+zkZNMpVp1n6XgQkGosERjayXxrppdPSFM4zToGI2BAYTqAGisgggF0BcvS
9RxoTAUiCqxKawFaJ1xQZ+fGletARsTBUAKDT4vGTT54eIZJomh2PSyhorKhOdDtkiVFuGTZSIx3
ToGNnDdHB079ogEbo0gGlFsO5wD3994x30w013Secj5aOQlLD0TykkhSgQAgGb/RPM/huK7Pvt7d
w5/dWf/HO1GkgUKr9YgZtSzrqQU0JnTsUE4OVg8lotikGMN09X22AasbY8KLjQQpUgQh43puPcIC
5DTo+N7Vbp0w2A61XIrEQFMbQzUapz687Pavry+H2fHbFxup8DzH4IRj8s/dIG46p0Q1glo/wQet
L0jNUr+trE0A1uEQXmQ5M77kYE9TBeYUmwiP4TCWW8DSFcUkDl0roDGk24ip52Ha+yxqGbM/EYGU
wyiDH9abYzLXZcJ8E822jR0rZ9SeNNr8BvirRSM8o8h6TrwE4s7BuekFUCy1sQH+BOsPXIV5Q92Y
CZw4wSDcuCVU5n27rFllAtP+7S1WKMmKBGgLdFxLWcNR0iqyriUYFMGCbEi8bjCACyRbKN94rlce
NeAAlnvDqHy46iCIGHMmOtQujtIP8jsc/oKjCWUWGzNBU1H1OxkiFsuP0UWVtYznvEq0PONZPdDG
POaQ9FrEtag7whUVKPdWRdgI0pWLUpxPw5QMuDMt63W6mAdWBcb5VwEbg7ddNqXhwxxkVbFxQn6I
YC4MHNFSOnYHA5ltBIb2XFbEX5XrKVHSBm3RBaYFEJ3nJMP8wEaWg2OhkxYODBzrttjMeYxmO3gK
djBpnB10gNsF4Ws3sbWoqaU/jyOyksWuE0zHMAMGloonWiujaiWat6BsEzpHg+f8t4s4HDN/MWhn
PUdgXpsVM7J0zTzTVAYEYnLweizWwSUdNwoqOPqCGL1IBF/SygZEMGUZkJMf+mibMC5a0DlJYwmQ
FsfefKQzXvmJbpgalAvQPbGurPqdpjERYJimTTasfM3qeFdPL88Px5eDl0lxfDerTfgNkMrTYPJP
DODxSOseg6HWFJ1v4SsyXhf4F43GNdjHpZmxIzmWAmeB8JjUi8C8E4dghHc4+wdjkEz0yJiAA9Pz
BE2w4PrTmqDBosBNY6lrW8NBgW4E8k7Fxk12BQAQzcY6TzYxfxHD21MRBZsOtkORiJ3ag4dxPbgR
SJ3+xjy0I9ZYgcRbdCobs7sNRdNyv707c/74h1jjbCep3oRcwb/hEoMYoqljlICMhsqu7BY3oNoB
Jga3eXXMSdw4Er1UwpNr+I12JlPsNmqMmJ2Q8LhAu0qwXnVTGZXkEZBBGDvzrrkEHp5PN03pBnVp
zrwPIKkm8VtKtvZnlTRFfzFmTt3q87MzFxdaLj6cRZkFQO/PJkEwzll0huvzwbGw8nYhMKfqWT90
TeOGhIGg5zdVOkPkQmdNdHe9ZwFsJ9DfOffdHPBEMQTis4S9HYxHYxDPvwrjIJperubuZgHvd17B
LBcBwQ8jWiqNnRLQcdHM+6Re2zzQt4MQvwFrO06htUiW40IR62mlEGXNq2ITnTHEnMz0p2VmvHrY
TdyPAZHC8o0uMnUiNmp80gIEYI1pOjeOdMrfG8UQSJbpQDgbmJWMnRxpzzGOI+sCPJUa9ZtqDewI
llrUXjWTVaAv/90fZqD/tp/3T/vno1ksSWs2e/mCVZ6eg9rGD+LeQEx++K44DussbfTVXaChfwmy
kC+b0K+HDSxUG1bHLrUb9jEtbUDQaHqj3mCoIWI2CD7ENTQ6n8gM2tHqVNgFRV0TXHTNxgOj8ZxL
u4ipjoKuNF9RIVhGYyEZxAFJ0xZGBQASbjshCrTdJmxtlHJjoaZxBRPyoC0n1fh0eFRfGZjxQAT9
pMF7D4YaHIfUHP8kuC0kigLBYnLbWV2yoMmXUPEZyHwugKbUaLzWmgxa00aCJ6gzCXyPAt7JZQ7s
arobhmpqYKYs3MIpWOD329WmDAPyKmiGfysCQkoE7d22Gfctf0utiRzd4mIi9u7uuKRqwU+gJXMR
z3O3hJw1WPeHof4bAp5kKKFdZPiXGo4dv9AaaARTm/B4Bi4nNWVT7X5K0kX3V2lw54uJhPqAQsEN
mVq8RRCyi+D0+8hqlbfOhb8UpzDREZUMk8xAmUEpUnA35t/5VHCsLseOr8w9x7crPJvlh/1/3vbP
u2+z19320XpInleOrDxVYxXp3Q/M7h73g7dlaqw8pu5a9JyvdAGqjooJYEmrZgKkqJeH9WBdGCtu
BLbALug1uUO7jV59/6VONPtP3l67htmPwMWz/XH3znmogIxt3S/v8qG1LO1HzEIEcFolF2ewv08N
c18LYP4kaaTfkJUEQwC+j1Z52T5jxG9knkS3P7ELu8OH5+3h24w+vT1uR8aAiSr1LvEEka7dbIFN
EYXfJk7RXF1aaxXIQLmm1HgJZg35w+Hpv9vDfpYdHv70srU0c3LF8IG5Bfc0ciZKI6TAsConaueZ
TLFYOsljwYj8Rqd5W2jh+vVue2dhxqJQnM8L2i/DjcgbAIYpTbjGegFPARgrtXgluQENhdTtoBir
Tpo8x4xRO870EoaheuTRdKs6u36yRw6O3OxH+vW4f359+ONxP1wBw0T2/Xa3/2km3758eTkcXTJB
/29FoiUmCKLSDZBjS06W3eUEXiRZ98AhC4kQgYHnkuobQeraSxMiNCW1bDBvw7Ga0D02hE48hoGB
MC8tMKijGPXUKjrryj6LWIJBqth8igXM4lJ2oTuXzps6AwZGW8EIivBFSUv//8upd7M2Zte1K2r7
Jj9dbVYBZiiw4UKboIvwgV2irHMX1P7zYTu77xZxZ7jPrX6cQOjAI771dPpy5WTjMF/QgEy4HYXc
AC3uma9KDRpYRCsI0HRbrT+cu9lLifnHc12xsO3iw5Vt9V5bbQ+7fz4c9zt05H6+23+BPaF2GByl
wHe2gd1+edwWIsSEgtl9Bx8W07WgidMr+26zYV7z96asQcUmbizMRPdSvaQbiUGzXHn5IF6rcBCz
EJrnLGVYi9JURihjFWGKJvU4sGTegClW6QRfIjnLw2RibHAGogZrBiIZ89GWbOvUSFPLb4cBK1Tn
sSq8vKlsgYYhlTbqHDzwWVHfrBzquMyIC3BNAyAqYrTZ2bzhTeQNiITbMVaLfR0TnKQpJgAPFaMO
bR3lGAGljg0HTADbYK8nOZ2V2/eEtkBF3yyYon4heV8EIPtUuDJFhqZHOKQsMUzSPgwM7wBsW+C3
KrMJ8ZZ6fEPF4nnFXv714CPGyY5pEV7A4kYnsEFbFRvATADSAUuzwAAJC9kwB96ISlccrsKryQvL
ziL0gf4Phl9MYa+tADA9YoNE5u+KyUR7aBhDjN1jjNFjULfcr0Ury0aDsgLnt3VTsUwrCsaq/hhK
S2+WP2wdfZu9DBfTCo6W3DDCFV6h7WeTWxOwjDdeUGTYZxtCbktwohh4igVceQAc1Wh05mhbx+GB
TRDRE6jRvkEn2DQfvaax7MXUAqSlvWFjr4VkkI5fTLngv3zWY6XsX77tKTmSXBkWVnYyrsIcDKoA
rAOKXN4knq6b6JgIxzLJMKBnio4MEOOXoHtF/Lp5buSb2oz2kXVJI5pi9Z9DzjxrMJCIagprk5Ef
IudE10yhsjCPMfFeItLVdO+i5rH1efV0oT7FCaJi3+81lOhFxnXq66YGcVEiQ7Vgg46ZhDHh1ZtO
SahREbOl2Pap5FhbwtkyG4vu6xRHnqsvxtvlvL9ImE3hx44VCSa8lFjboAYVKFvVvaYWN2uXRydB
YXdLOdHuMdCw3hrOAdziNo/jK8beZAId7tlAQwIDlIdbBRxzmtzKaidDaw3VlK9+/mP7ur+b/dtW
H385vNw/hAEfRGuP4dQEBq2zQG3d+VApe2Im71Tw1xrQGGZVtNL2L0zqbigQeSXW/rs0ayraJdZd
Dz/50HK8e6btfZmnpcYFjGy5xWkqhE92tuCpfFFnCE3BcRwp0v6HFCZCVh0miz8LasHIO/jocnov
WG15A3aPlKgg+tdEmpUmF+N4hhWQJAjeTZlwl+k74WleLoapmMTPMuHbIBMyEfSTX3LWvRpK5Dza
aH8/IGjHvP0cA8InQFqdnw3Rig6MFZSZ36vL9YXeLcJuEo/92iZdfoqcq53ClsOF67Kt/ezegHi4
vCbFKC5bbw/HByTzmfr2Ze++N8ASd2sBZyt8nuRqjZSDddpjTAJ02pSk8t5VhRiUSr6OBrp9PL80
JACSLD8BNQFxMImmMQSTKXMFMVvHdodlnbFNl2xOogBFBPMATrFfOgBi/CMzLmNj4kPmjMllZ3k7
BT0VrFo2yalh8eUxbLat0BgN3sAQJirpztBphayMbwUBU4Wucj6x/6Ywv/Nwcq1NlMSWRJQkPiiG
ik6OuJGrq4/xvg6DjvsPMfmAWzxJNIosI+OVnzCwNmpD+9m867I/PcKH97oOCwIe47Y0JANzyP91
Hwe43CTUSS12zUn+yVV2/iQ9jcrq3COAyr40qME9aKpIGn/IoyuOvrkond89MerRdga24jde4lDc
SDAWJoDmACdgvclifiomi9UnT0PCzuIm3nXUPlhj3YsxndAc/4fesf+zIw6uLfpoY8DdBdOv+93b
cYuhU/zBq5kp9js6V52wKi8VGvjDoPDhv1NrkWQqmFsP1zaDlk0HIsCeres+RHEnVmGWWO6fXg7f
ZuWQbxpFFE8WvA3VciDyGxKDhD6THac2P16jYiOBAwomKo2BVjY2P6rcG2GMJ7XMagqnx3DzkwRz
/5myX/wSEyy28kVZKYD1tUPxnO2boCXkS5y2yUqNdEJkDcBhnca/FRS50HOoI78RhDVYWNojtAof
kNmaee7n8jD0Mg46LaX7PKV9gWlO3/4+TCauL89+u/KY4W88b/Ahkc1PBAD6AaKOPyluyCZmkkax
S/tmNhINkKZSqQ0nD2qioMTWL06UdMWKTW9rzp0ij9ukyZyv9zkWIjv5oFtpn3GeeAtgEiJdENtd
H9wOFcIPeP0/Z8+23Lit5Pt+hSoPW+dUndnobukhDyBIShjzZoKS6LywPGMlccVjT9nOSc7fbzfA
CwA2pOw+TGJ1AyCujb5DBcdTHsFhF/M4VvL0BK1QUWu2xkQHoxwd5ZMO+lXKfkv0gcMEhDPj+5SV
t+SsKVkfvTXUlKMhlnQ3sPqk9CwmlYEeFihkKO1Ms4+SwknK4ydwXRNZ1Muw2fnjz9e330GQpDzQ
4EjeRtSUIgNls1NArVOL8UFYKBgtWFUJLbnVcZmqa4fO0hChPoHydRF6SINJudBx/Jj5ibY5Fz27
3yj/fcqIBYWKzMwppn434Z4XzscQrJw1fR/DAiUraTyOSxSeLHkauUNmNUoPlAihSzTVIctsVhku
dCCs+a3weOHoisdKeLFxfriEGz5LfwCXpWF7Pw7EZD9SFB6vZYXth2sCccM5oIoXHdhu/hAW/g2q
SpTsdKUEYmFdUAFNO8ni1+HPXb/bKILdleGHwFSodjdQh//ph69/fHn6+oPdehquJOnbAiu7trfp
cd3udeRF6EwpqpDOyIFhCk3oUcHg6NeXlnZ9cW3XxOLafUhFsfZjnT1roqSoRqMGWLMuqblX6AzE
QK4Ypeq+iEa19U670FWkNOi/oD1pLxRUs+/Hy2i3bpLTte+pYnDL0A7zepmL5HJDaQF7x3e0MW0q
Wny8F1lXBtgupUuGuzAtnFhEs7C2GpHYoLiABPISck8/BWYt8hDcMqRXofKl6GQV7eOQzD1fCEoR
7ry+BYo0SEsf1ILIxo4Jy5rNdD67I9FhxLOIvsaShNNBlqxiCb129XxFN8WKgEQU+9z3+XWSnwpG
O1WKKIpwTKulb1foaBB6yJzKmBFmaEmWOebHNRnJAJaPKf0d2VheRNlRnkTFaXJ1lJgI0pMND/qJ
GYr990BaeC4/HGEm6U/upZ/D0T0FXtRbIllgrDzS8UulMi4pIlkWhhxUxipNoHmP1nausjZ1FjZY
lCInv2aU4QmTUlCUVl2omCZOgihsRUIHdxbX0qa88TQRo6JdJ1u2WdjJx/n9wzG9qF7fVruI3qLq
TJY53KE5SA65syQtOz1q3kGYrLOxwCwtWeibL8+RCTxe3zFMXOmjXHFzy6lgkJMoo0Q7EQ0fjnd4
JGdjr+UO8XI+P75PPl4nX84wTlShPKL6ZAK3jSpgKO1aCApCKK3slcegytxhxD6dBEBpGh3fCjLQ
B1dlawYJq9+DJtFavu2lrG6cCU8+uKjYwyai6V0We9I4S7jkPGFoil2NaRx1D3cEDZOLoJA9jBaO
EnRPZ7UanF2ZSDB2hfJ5rPYVSN0dnXK0PNGQP0qtc3j+99NXwo1XFxb2lYW/fTecpet1f7QJka0h
AFhpcuD8E20ilskitZpRECrWtccpi4eE/tALZhVDTc3fKjwkqvMWBMmcOnLK2Vw6c+FLEo045XLu
TtOFDY3YUqd26cLMMN+gpysqMvSbCcHkYyMgs5J6cYyCYvZCKKU10pJRlj9ECjNtgvpK6UxBwaQI
nRZdsw4CdXIP+sJsnTzRZX5k2gPY19eXj7fXZ8wD+uhubmw6ruC/OtTV/CCmWHWTv/aIVgll78mm
xuRWtdn1IxmDPwxIJ7CI0UfjW3cM359+fTmhZy52nr/CH4Mzt/m18OR8Pjypzo2hmLmFhlIVdDKY
3cldAuDlPSahS33WivXXLzDxT8+IPrtjGrRT/lL6Jnp4PGN2AIUeVhWTTI+c3dVIOAsjOKvDSMne
X2+2N33Ru6nfadHL4/fXpxe3I5idQjk70vY0s2Lf1PufTx9ff7u6d+Wp5QnRtvvNbtTfxNACZ2Vo
HvmUC2ayzxqivDUaLsjcrNCC1p+3ff/09eHtcfLl7enxV9OWfo+ZRIZPqZ9NbviAawgcqnzvAivh
QuD4oewdjUrmci8Cw7esCNc38605JLGZT7dz8lTiWNDNUDtrm/u/ZIVwWLbBIf3pa3trTnLXXHTQ
PkRaFWtoRU2w8vk3AhyBca/SIrZofwcDdvTg7qO2CHQ6C1mSk7EuRam/2MfcqAdDukXrYwGeX+Es
vA3dj09drMZgkaurkg1BMz8YKqe+tPad1aMj+zqUpPxnxjEKbb8M1lY51aCjSWfk84jH6BASloJm
kFp0dCwjZ7YRji76bV24WdFLk1YcYDGmDKRtYeX1fsFyoXxG4W72PKWB6OMhweRvAVwobcxLtxGj
nWWH0L8bMecjmARRCE/mNweepiIfN2A+YoEe9Mr/M2x0DJONihVR7TwLbU+y8VnoI/QeFYNp2vb3
otEdtGLgunIGT54Dk8zpfJS7TBpDxF8NbD5hRhQrYIrJximEFGVMYw5BPUKklcGtwA+1/LK7vAff
iO8Pb++2I0OF3rE3yrlC2k2YfhcOKo8pKCyMCky7gNIBCMrsqhwYPs0MtYTbhIouUX6SHp3LuAba
q8bpH0YuIt00qNk5wJ9wyaP3hU69Wr09vLzraMJJ8vCf0XwFyS0cTtuJUIGdcPgxtilp8TquaJ1n
5iC6uwLhpkokbCyAlJjs0rhcZOp+wlzMvHBWq/e0wUxTSm3TkeSSpT+Wefpj/PzwDnf4b0/fDQbA
Gi+PKVUOYj5HYcQdIoNwIDTuMz5tQ6gnUyr+PBvNOqKz3H3lyCkQYA4iNE06NuMOnxj4C83sojyN
KhVdYzWhHaaz20ZlrW9m3k3gFKSue6LY8sr3Nn+vmdnanlgHbQbidgMWM2q2hK/fCrkkmtk45KMi
V0Fx+HCRX2idpaF0SR1XKYUYs6ihgh4qkTh0iKXul0tPlmJFGQP0fyGJyYWToGWLh+/fUdHWApVK
SpV6+IqpX2yKguwGjLyzlLvHcX9v51gygCPPNhPXJRHa2EmEzCJJZDyIZyJwZ6iNYb4MYhbIaUWV
WWRXYP65MKQuSDW9aXizrmEWrfRngBB8X19al0gG85JMSKVm83YzXapmrVmRPJg3ccLk3v1cFlUf
52dPa8lyOd3VbhVHqrcwrbQygjUMmPj71Ir+U6NVku0RQ4lKZyFBQuy2bCeNXtlX+gGS8/Mvn1DC
enh6OT9OoKmWffFR6yLlq9XMMyKZlCx1dxiCrDHCP7cYpoGq8grTWaGS1fREarHATMo2efJsiG7p
78s58jWdBuLp/fdP+csnjoP1aQWxZpjz3cLQ1avIFhCemvSn2XIMrX5aDrN7feLML2VMBdU4vlNI
4LIIcZ75VNUizlFM3jPge+3XmzxF4BKn/I40VTupGpdaCWxTkr7NH/78EVihB5DCnyeqw79oajZo
G+ypVQ2GEQb92otvIJRu1YsMq9HhU5PIYko06fFpLTjRKBIYAty/n0F/SmlfRpORPr1/tUcLXNP4
AbS+HfyPFD4apIo4WoNhLoS8zbP29b9xywNa80OXPDEuVQpRgrWpu1s0CKpTKYZn4pICqfV/6//P
J0C3Jt+0c5aHcOgK1AV5vSmzY4fA2TQAaE6JkQ/UoR6qQBAFrWVtPnVx6C46ujURsUsOEfW1wE09
jAilD6UtAGFlCLe5lUME5KNDJipP6gjAwjVUVVbcLABv8+CzBWiDrC1Yt6wmzJKS4bd2LRt+txZo
C4bGmXHGeyN7WqHCIOx3BDrANwcAhS31XAvVUiptF+grNrGIaanIKKMsIYI0GwyF3Ju3Q7F6s7nZ
rscIuHKWo8Ghly2OZ4Bn1jFV/nRKE5PCOmBevrF6/+314/Xr67OpFc0KO59dG5FkmZHbIKXskCT4
g7a4toXI92l4qLkecwqFJ5Fs1xCqpKXE+1sUi3lNuet1RQ/oKT6KqUpAgByNS0GVE7J++HAz/rCK
TMyx3MX+hWVAS//9dAXUVHRYeTuKuFLgmpKaOqzFyBjAdjDD0xUmbuBxBg0Rrgfa83l49GRPQ3Uz
aueiyuPqoYzIV7dDeXESSlnXHR+VHdNobLpBqGZlvhEzjFUIszfW0a5kqCr+jwXfnywTlYLFLCgx
WuybDeUOAKSWnUnBDKDebEYXTZzHCm4WGbmQdZ4R5qT07IChGxwWLFzNV3UTFmTmpPCQpveKHg8x
P0GKuTAs+rhnGZ1RvhJxOuIoFfCmrin+HKZzu5jL5dQIFQL2JsnxvU0kwEfBI2PG90UjEjO3YxHK
7WY6Z4lRSMhkvp1OFy5kPrWUSlEm81I2FeBWKyp5a1ci2M9uboxozA6uPr6d1kb3Ur5erAxNRChn
683cnA0JZ81jvOwMWk3lPAagLaCNDOOI4qGLY8Ey27LC53gXjCh7FBUod767x0fD4TTPl8NgWqBO
Wmq5KWhEyur15mZFdKgtsF3wej1qD4TyZrPdF5GsR7gomk2nS1N17fS4vymCm9m0O/AWzH1HagDC
NpaHtFfDtfme/np4n4iX94+3P76px6vef3t4A9HpA5Wo+MnJM4hSk0c4Tk/f8U/zMFWouSEP5P+j
3fHOTIRcoA2CmGGGHpwqu3lheWSjJJ6auSR7UJPafrY9vKrpC/aoTVrHlHAAwORczxPg7YBBfjs/
P3zAyEabqv2EeuvIOJ2Si9iGHOGq1cZOt3tQ1zUwjwrYxlZs3eCNEZ/b1OvoXthdFOOFMXXt7aLs
dGcmrVO/hzdcdMalMuJ4J96bblkR31PsH4bWwWJyzKTDrZyeClNWsvboavYsYBlrmCEJ4HOdkXl4
rEtgqIh5QaynzcNegCqezw/vZ/jOeRK+flVbVxkSfnx6POO//3l7/1A6m9/Oz99/fHr55XXy+jJB
Hk1JRQbHiEl/a0zU5zyjDmD0dbe0hAgEToLgLxVKAs7aHADbXWaqoAinhJ6eK4uSW5GNmUGsRzJc
CoEPsAU5ZlvBdb7UPhSH8ZDcCKBUrk2q+2p2MCWVyLnHpqKSKZc5dyKZ9LGEdUBlGgC6rfvjlz9+
/eXpL5sJUBOo7aIXxkA849mxvmm4Xk6pwWkM3GR7n8RvTIMV6mPAlaFUZbXsHTeMkb2PKY3ZpukZ
p3/jAcLsLHkZugkSsFIex0HOSnLVr08SmnXW8xnBbv+Mue/JHYbjG4VuI45FfA0iDNUTlojZql5c
6Alqo5eeypUQNWUZspatHneoKkWcRARiX1SL9Xo8us/q9Q/iYBXQA2Iyqs3sZk5sgmozny08cHKI
mdzcLGcUM9L3IOTzKcxuo19n8WGz6DTGyuPpVo67L4VIMXKUQMjVihqATPh2Gq3X1FSnwKKO4UfB
NnNe1zV13Cq+WfPplOKs7f3WnSXMYtKphEfHSKU4AXJt+DYwEWIi0NK6v6WwfzXOq9QK5qNRqgft
p/XzAf8AJuj3f00+Hr6f/zXh4Sfg9/45PtvS6BbflxpWUZPi8fTvK1GhWz2S752x9dKIJTsghiuX
pswTxqCKJPluR78YptCSYxAFOrlY61N1POK7szYSU3S3q2F/KOYa4e+Kzvk7KmQ1jzlEx4ut4IkI
4H+j7+oqdJBNX0D5dkoysFCXKQtjWJ0pw5mJ/7Ln9aQeBbK4AoVxJGQLpxwtRnmN9VrWu2Chi/nH
goWW1woFWT2/UCaI5heQ7Q5enBo48LU6fr5J2xeSOesE1baaUDhQvXImkLlcM8IYxw+6UMFvrEZb
AN4ZUr3d2T5caLyv2pbQeYTVy6RNKn9aWW+0dIW0aKZ9qylBxyqmHqycjr+jXPGq6l6/4m14knQj
2Loj2F4dwdYzAqeI2X9DL2Fhx93e/q1ub5c22W9B/qQ4ioAfx8utYK5obGCQ50witwfp8aBepbA3
eFhUIJRSwozuNhp74JC526jk+GafQ1vh23MrsCyNdkxdOnAN78h3H/sSrV7i2whBDB+4FRI6x8Gr
KJqdZcE1a13Cz8etypSVVXE3nrdDLPf8wnGuhFINWrTkIOEGEXxM7tENgHB+trp3X5KPYLc4iwa2
sn5xdElTJzNqt3pZ5aXF7+gRZ6ZxswcR2cRaZqFezLYzl87EbbgGCbWNsgqzQ98Od14w25ZvzKJw
lwqzV5gG2A7IZibjrrmZwiW2Ik3Hn/9ZFE1UFDM6kHooI9HPllfkS+Bq/qqoHrUu79PVgm/g/NMR
qO0oae5HIe/UbkK7Ef2kVVuIXbvjQr7Yrv7y4xl2dHuz9A3vFN7Mtu491b044rCRKb90CxbpBtjf
US1tdfBV6riHzuJmRWRoT5c9m63mlC2pLTDarS38rjuvNlgv3Wo6HVNTx2xicj8On97fH6bHP+pG
3HATppz7Ox2LZauxFBhei47KB0ldxoBrzYDDKBBY2Myd1jUYMR9/Pn38BtiXTyDWT14ePp7+fZ48
dQn+DSZXfWBvnXUEpXmAOToTFVmWCG5p1vpK5IPMXc8Rz6OjMXMKdJeX4s75GlAAPgM53AErlqnr
nf11KZI5HXStsLHH1YxMTaENPXZ6roqnjdD2fePTCMXcpeRGR2TRimpWDQwioOkH2qbUE8y6D7T2
STPZ/gIyKAh0i4wP0koipX+jWDPMdQczL9YWRlzELQbf/XVLt7JXJ1lhdPxkttguJ/+In97OJ/j3
z7EIHIsywjhec9Y6WJPvydulx8PY52TFjJ6NHp3Le9NH7mJXe3aHcbj+c3yLUcVH2J7FjOPTNeir
FwUVxUZBlzTXa1zP2bDxBpEkz0JfngllLSQxOKzdgZW0kja6U+9eXMg55DOFogk0Yh7HSsYxrQO9
bQsv6lj7MKj880SnBMAtHULa8L/zJLCA/knPk5swLq5fqqHRVdCuF4muDnT/Ad4c1ZqWuQQJ3mPm
uWK592WiyJLU97hX6WbP6BwgP96evvyBdhWpg+iYkR3Z8tDqIiD/ZpVuA0eY2t/yHsLhH6MszMtm
wR3fEn01w7V8Q9PuocBmS89QXgKfRs/9fbHPybx7Ro9YyAqdPdYwzyuQcn1G+nClgV1kn9aomi1m
voxVXaUE5HwBH9lb1zhcqzmZcNmqWkW5845ilAlPngRtoqzktUGk7Gcn22rG+qW8Vtd+7DcNN7PZ
zOuMUuDGXNC3X7vaWcp99ABfHqt3ZAya2SUgblllc5XszpOE0axXcnLbqucqcoeRS3w5aBI6eAMR
9PFHjG/9rm2kA/CQ9jgVpMmCzYZ8mtioHJQ5C50TGSzpgxjwFGkxTYdQ30bre30bsxK7PFt4G6MP
tH511XWqMCte2aowYK4fzDQqUdkejDqtr69zs1NSvVXpKA7WvFb7Q4ZRoSiUFzQvahY5Xi8S7Dxk
zyhTesro/jWF55pMxN3BDQoeIZ0+EpOwjxJpJy9pQU1FH5EeTe+MHk1v0QF9tWfAQuc2tROUgdGs
ovKxWidtF2FWbpJKDn2qMbEEjQuvktbQvph0AsBEUNp1s1abEmX4UDKnPf8k7BQ35ce4PXx/MbIN
ftH8at+jn13ndA1psgLVeRncm/gOY+MSlXFL8eGzqOSB4Bvi9Ph5trlCIvUrg9bCHa+MeH9gJ/t1
1724ukPEZr6qa/L+UI4y1lTMSNocKXO1U27qyZ23oxP5ANxDPETtq+LeqDbG19zS1zNA+Op40svE
6WxKb1Gxoy+Qz7Q76TDnKSuPUWIn0T+mPqImb3d0z+TtPRWqaH4IvsKy3DogaVIvG0/+LcCtlIjn
w8rTRXR8utIfwUt7t93KzWZJX9CIWs2gWdrR5Vb+DFV97k/OR3P3wMO03CwXV46nqikj86EzE3tf
2h5Z8Hs29axVHLEku/K5jFXtxwayqkG0hCU3i838Ch8Ff2JkgcU/y7lnpx1rMoOi3VyZZ7ntK5jF
V6h+Zo9JAJsc/d/o7GaxnRJEltVe8TOa37pbw61duHIo0fMjsBPWzap0n6EjQYwr5rfWmPF98Ss0
Wqd2hrnYicxOjLEHEQj2LzmU+whzcsTiivRQRJnE57ssg3h+9d5o1dVGpbuELeqa5tzuEi9PDW3W
Udb40HekK5jZkQM6QaYW23rH2Q1cQc2BeZjuO44uw760rGV6dfXL0E5Hs54urxw3zAVWRRaHwzyM
7Ga22HoyqSKqyukzWm5m6+21TmRoOSWJVomZNUsSJVkKTJcVqynxjnXFZaJmZL5iaSLw1ZcY/ln0
QnrUdwBvYlznK5tZCqDetkPRdj5dUF5OVi3rUMHP7dRj5hJytr2y0DKVnCBIMuXbGd/SF1pUCD7z
fRPa285mHuESkctrpF7mHHNa1LR6S1bqNrOmoEqVIvjq8h4ymxwVxX0aeSLfcAtFtAaWYybSzHOZ
icOVTtxneYF+A6bwcOJNneycEz6uW0X7Q2XRYw25Usuuge9HA/uDGZalJ4dz5aiGxm0e7csEfjbl
3nko3cIe8SU9UVEp9o1mT+LnzM63ryHNaeXbcH2BxTVVzDi/XhtvwmrhJ69tmSSBub66QLUoae0r
IuYF7bYWhyG9l4DV8/hPq2y+AQouNAeLqgNt9qD5hv29L0dpkXheCygKGi6dCkqvvX99//j0/vR4
nhxk0HtBYqnz+bFN/IqYLgUue3z4/nF+G9upTg6F7HLPNqeQ0uFi8UHrnOobjMJVe/tq21/IjQnY
1YgHIxtNzXTHJsrQAhLYTlVCoDqp1oMqpbCkEDSQM8/6lUKmK8pVwWz0fxm7kia5bWT9V3ScOXjM
nayDDyyQVUU1N5GspXWpaEs9z4qnlhySHGH9+8kEQBJLgu2DlsovsRJLAshlPdFRYAkypLNPh1x3
E6thizhBgapjUxVQH/tV+uTgf/9YqNKCCvHL6rJtKSWIIX9ktv5uyX0Uv7l+QjfD/7JdMv8bfRmj
/ciPP2Yuwvb+6nqNa1Dip6/g5F3M3eHwH+ZN5HytkgpM7tMEvq4Z7hC0VYVyCLxK2mNB7gsXbcmD
n/feMISV1lR//vXDqZVdtf1Z+eD8570uC9XgkdMOBwx8VGvW9QJB79/CWFsji4hWD5qXAYE0OQbR
k8jiZezz05ePq9rGd6OKd/7abNiE6wh6dCYDqhhsIxtKOE3cfvO9INrmefwtTTKd5W33SDS2vCDx
xaxaeTGWN+WLuLy0iJQP5aNlNzLTYJHt45gU6HSWLFOrZGDUMWBlmR72dNnvJt8j7Vk1DtWgVQEC
P6GAQrrkH5IsXnt2gesHrAzVEnRxslUV7mMJx6caBXRBJ5YnkZ+QzQQsi3zKDH5hEcOYaE7dZGEQ
OoAwJGoC61gaxjsKUeOHrtR+8AOf7JK2vE7kEWjhwPgJeA03EjUkTnFrZ3Z1cajGk4ixTC+Ta0ZT
d82vOSV5rjzn1jXK4HDR01LUwlK9GxNSiW5tKKwwEdHIiYUw/KkvNzXBferO7AQUsndvOC+2ymR5
D+ewG/HN9qyhvuQEQk6jKvUpK9HKz3/CAhcQpHteaz4KF/r+saDIeCsD//Y9BcJBKe8nLWotAcKZ
0jCpXZnYI+Ec1uLiodssHWOLraxRgtCVCWxUVGczI3RVV9Z6fPulLvyL63GGVvTQMRSjGHXMXbku
jeuLLX2lAYuPUqNEOB3XJa/QRgfCUIp3Dr0SwcEe8556/hUo9pvuflanb2KOT38Zb7dbTtvqCA7H
Yi37Yxlaomwj7QrjAYaUkubdGeNcOV5cOAuP6uTQPxQM2PtCAHALE9XITBkgy/omS7zbvWtx+aDQ
BTRme16kvmohqVLNDpHYUL3vWozUwbvFWVF+PMJVibfKllD2Te6T27kUYMKbd9+fp0l/A5CdMDb3
S7UfcivWiiHu3dI0iT3RdHeXcrZdKJtkVxUYst0ulbg7H+aHaRbe++sgK24urQ1s7bFnFwBTxhmo
izMc+4Ae4DOMvmjKsqejD648Rck6YS1M5cC7dOOD1vl430/tSDRgqrjX66mkrxAX0RJk81ZyOgt6
uE1vd3YZPPgGiD6OF1LO81jyU+kGB2t8j1Z7EzgqeNY4rl772kM5nd2feurHJA78TOGwZ9KtD2Be
9uWDs5DzfEoy+4IdYi8JYaw1dFzFhS2LSXsFiV8bOWzM+iPCh4O5NPCBMnRTPjyiDWmn2Z4LliLf
eXFML0aIJeGyFhn1vYKY6uNKtdGmvLjVYURfOM+fOA898nZQ4OipoM/RgSb8b59bbS+GS4Cr6cmU
RxQ4ibfhdIGVRg5NFVnv0OIC7enbR+67vvq1e2OayOJD6FoK4RDO4OA/71XmRYFJhL+l67j1Qo8D
bMoClvq0uyBkgDO1OAvpVFZpoqGg1tWeoA751SRJXUrBbNQIiOjEylkh6Aee8MVMmPdYOpFOXpYs
B1yjLeLIptb7LDp2dYuSN6XueW+m3NsRDraaQsyM1NT0W9CyOfveg3agWrADbNuGUpdUIKaGy+rv
hbh1EXdUfzx9e/qA966Wc/1p0jwhXVyhenewoE2PypgX1opOovTMFsSLa7aah8jEgAYY02G+hhmf
v316+mxHLRHCqojezFQTCwlkQeyRRNjp4DDAfdQrLsoJPsONoAr5SRx7+f0CEo/bHF7hP+AVLbWW
q0xMKMQ7Kt3kjlqqbjVUoLzlg6v+7PUqN2ULYgtpT6lwtQN/rFaCtKvoAF+4asqFhSyovE1lWzgC
BqiM+diX8M0u5us41VtXWGhcjS+urxY1TEFGarqpTHDCdYycpiqIwjEGA2GvJXz8ff3yCyYFCh/u
/JWECEcks8IuqCtSUJIcujmVQlSGmZnr25G+DZbwWB0qh3XIzMFYe3M8Ds0cflKNqUPdQjLJtf/t
lB+dmhA662ts8umuH1/lhL1jCx56hyWqgA9jDcPitTI4V9Win5nXWBk+f8MScy+qY8VgYXTYugpu
nLPv/ZAOvjp/gd60UVo8aWsLrTF0GjYNtXDfbA8cEeqoLVzmT8st3TTR1lPt/egYe233vnNpi6HX
VVeOPKoMDNl2Y9XFS3XtGkSh8+ZC5qZMtPguoPLlgB43tu7nCUfx98YNvbRAcqeo+qYC4a4tak0w
RyoPTlYIx2EaHT0livtR7bSwYuM0uAzeOJd4P15DzLnqpXrJEYRRdU3HSdccA892R7PyeILrDgdN
8O+b/T8p+3QFAbIt1DfVhcRDR4OkJvzgro9jC86fVekHtIUnJ+1WV1yoQBBkGU10Fs/7Hk2Omt8W
L1/46PjmAyF7rRPssWX8IcKxY6OFLsYljuhTzQpHmn3/EEQ3vavn53RyaXDWVLkSu+aknjd8P+x7
VcWlvDw0JWWy3F40N77oJF9Yeir3fvlN0DGcD8qOaramrcr8RXrVPg5/4XWLJtstxDkUKJVN3h7Z
qURrYRxTupUx/OlJ97BlzUwv5bAZ1Y/G3fAaRHCjj+chPZzHibv2EbHP7Le8gBGPqvqNHRq186vT
DoThI22rhTA/D8FepetZBkyGMaEXDYRPkE4331TQ5nybZ0Hz1+cfn/78/Pw3NBkrzqNFULWHrXkv
TmKQd12X7bE06wTZWje6BENzdtwRSI56YlHo0R4tZp6e5bs4Ih38ahx/U3Xsqxb3l80C4Ks4Mi9K
JQ9lsZcJm/rG+rrQvGJu9bGaXgYSxDOYnrHxXsA/R33s9mvYX8x3OXxi+LX1G8rV7g1kAvQ/vn7/
sRmPUmRe+XEYa2vUTE5oZYkFJ30GcrQp0jix8uTU+xhlmeOGUjChneUWfm966mqBP11k3GOHShmN
i29Oa9zzCb0Jkrd1fK5N9yszs2u5Xre7SUIRHKaD45oQvzo69dvR4qTEk5C8TRPgLrnpY8ZQFpSk
frADYnKHoYQaDc+ZNYSDXlz0fn7/8fzy5ncM/iej7fzrBYbb559vnl9+f/6ICme/Sq5f4MSF/jX/
rQ88hn4zpZirzbmxOrbcZZB+sjJA24OowTDW+cVat9QMSOUyg2mfP4J8WxmTv2zKS2Bm7XjgQuih
bHrVMSTfDeZHeH3wsZw8umpMwwNpfCKGQiOsvhWa1MGUPu7Lv2HL+wLHD4B+FevEk9QEdAwCGfzB
WZ0p70aQeu2jdvfjD7EMynKU0aIPBXUhVcgH00/QfLvmWgC1ntBCY3MKNSA4UboId7ZQeJtyGi+t
LLhSv8LiEkdUUUJJFzoOyT3pi6rXfaqdHI6W+p4IzDH1bz58/vrh/83tRCrlSf1VVNNqy+naDQ9c
nRklNDiRNhibTdXOe/r4kceThIHGc/3+H9X5gl3YclAzN9s5xqoE7sehO6sKD0AXMo7Nj3v04QzJ
9JtHzAn+RxehAeKLWVWaq8LfjnaKQ6aZrnsOmMn82cXhIECyNKwPwtHLNpngqH10ONxYWG5+7JEu
pmaGqTnc7BZ1rKy7yabby+CMgJw+DI+XqryqA29G68f25lLzmHkMddulyKG7TVok97nEvG27ts4f
SrvnWVnkA6ydD1RlirKFE87keNhaxhe3fsbst+oM/YQVsCpXl9dq3J+How2N53aoxpJ3h13zqTpi
0CEqz/LdGVbw/YCW9+szCOw24uZVJ/DYThhzRAZ/iv3F8WR3MLZbEYNQC70z51IN70yrRzEZHLsc
z0q4P9Wzl3NrOYOIMFcvT3/+CRICz8zaEXg6dDct4h6rrzL98l7lqgPMvV67fRHnGDuwmQoX17zf
WwXhtT59yYboYcJ/PPK1Tm05IagIeNAjtHHiqb4WBl/FTgaF29VdmNXIZp8lY0rNegGX7Xs/SK1k
Y97kcRHAcOv2lB2NYOI30nbaqnOWB6OB6S/uQr/hlsWUK20OLuYixie9H6QQPx+z3MNIbGawpfwi
UXye2xhovhfd0XQjyuzmIcZdQuhOFwkWSG7U+pD6WWY2RXwIYxqj5/HUII3WVwdK6Ps3g+9atehF
y6SOfsIi8RQ677hbPbKI9Zz6/PefsMvbPbUqFetU1dO+aOX1LsRdY3yimit5ebbCgdlAfrYPb1Zm
ko4LlXuOCtUL5wid+ooFme+pI4voBbFwHQq7d4yFyamXLWChs2X01b7YxanfXC9Gu9nwOE78WYKY
dkK5w91ucd5wVaTuw10UGuXVfQZn89io3ay8ZTAPLJ7iLLSXA6feruhvoXm7wYAKO17mnGyzQo9R
HU7OEnuQcGDnXqIlHpj5vWtuWWIQz2zvR57ZE0JZxug1IO52WqQhYvQs4SdeG1X2fYg2fqZM9+Ms
vhuIKB2lsiqnRTUva8S8qkoBOrxOigFQsDBwGJyKkdAV+aWqTTF1ueW2mq0Pu449nDXh40pfCPHH
jHt+oTQgBca9bCsy1Uo0hCETwf/yGNE/zeIETz2xYBdT91AqVzMlaAxAlvJKAWL/fCV/wbQ+6qxX
+iX3SK8HyJHcKqaFl2voZKLA8dz39SNNXdx/Gy2RKA94R7WkyAWj9qmF/hl6Cz1TviEkLtKpTwPQ
nYJKJNrnE0iNj4uW7toMvD4/4iCC1dtLNCWgOVHOpmwXxbTy58xUjEHqcH2ssZDxNFSGgKrCuKeG
+Fx3QNWHG/SNMROtnPbvgvRGh7KUHLDo+6n2jGUg2tXXXIe5ZzeqOStMUsm5eq9H3SfPHLhD6eLr
jDgfItbMeZds8tRTmMQu912CpSinkk3cYvPmR0lMv1soLeJ75z9g2m21Wyo+r19DBzIbgE8c+bG2
K2jQbrtOyBPE6UaVkCPlbwY2ADu8R32ksdmH0VamcnNP7WF3zM/HUiy4kRoNaYalzoONDFPshaFd
zWGC6UxU/8xG3/MU5UMjUif/eb/oOkeCKK8IT4Rhdit8UhN6dTLUY5FGvmKppNE1G74VaXwvoAer
zuNSUFF5HA7lNR7KXFDjCH1dW2WF/JT66grHLoioAJjFlN58TbFwBSI34NNZRUngAFJXVmlMpBhD
kn9kaRJQRd8w2jZG+m2noavtlA8Zun4k6L7HASvHQ9748WnZ/szy0IBobBhV873vkUFKhbbf9iCY
bv32cOPqA1jjba4xIQ9IK+6T3ViUdQ0rSEMg/Chk06v4AUTnvd2xeC734gPRsXhgDw5Hahwf0jhM
YzK4keSY7U7yglF9fIDjO6nbsjBM41Sep3zS3TfN8LGO/cypNLjwBN5I6UYsHGni5XaXAJmYHOIW
I29t5FSdEj8k5my1b/KS+EhA78sb9ZFij5hN+NBCD35+U2Lxv2VRQHU6zJHBDzYHXF21ZX4sqS4X
+w11VaVzpHY1JcA1QWhQ3yMVCDZuSkJUOQKfGO8cCAK7czgQuVIkxFcUgE/1KAo+iZdsdQpn8Xd2
thxIMruGCOyIXgR66KchuWZhfODklR2Q84S0nZHG4/AhqPFsBnHmHLwJVGJoBOkRal06+tBTwzwu
0aNZEhNyQVO2h8DfN0yKJ0SpdZNQIuUKpyExUpo0JqnUCG/SjKJm9LiGI9tmdTJqfDYZ2aN1s9mb
AFOzoNmFjsziICSDyagcEfF1BEBUvGdZGibEuoZAFBC92U7sjt52mwqjIFH1bNkEc4dWx1F5UjJm
tsIBZ9SA+kQI7bytjmh71qSqbfvarEMW75Rdu2/0oMwzH01GGTGgZK09RtE5lOR2cmeHQ09kVrVj
fx4wHhOJDmEcUPIFAJmXRFTPV0M/xhEZBnNhGeskg+2fGsMBnHgTxyaQksK9hFYjyO3tIMyo7UAu
1GSLAAu8lNQm0llioqfEekbNV0SiiBLl8aCaZMR60d9K2CvIBR5Og5EHO9pGJYElDpOU2GrOrNh5
tLCLUEA+Qswct6IvQWqwc31fJ3rwrrkV14aWk8bT5BMrKpADcncFIPx7o2aAM/KYtaU9tgjKTQmb
abrJU4IUG5GXMApHAIc9u1EAJNfAI0YMOiCM0mYD2RGdLbB9uCPkPZCl4wRjLHZN01H9jnhAbh4c
CqkHhoVjmkYc+VQ3N02SvHaiZn6QFZlPq3CsbGOaBa/wQI9mr4g4VZsH3tbZHBmoNRvoIbkSTiwl
RI7p1LCYGPpT0/se8fU4PXTQyVUPkMg0tCRYgq11GBi0wMgzHX0hsv5MH7QBTLIkt+t6mfzAJ8fB
ZcqCcLuu1yxM05C29FB5Mn/rUIgcGM2QqAOHglcTk0IPR7bkBGCoYY2fRkdqABM68vDKAxPwdLC7
WyAlCYm3tBdSLdWcHKhUbz0dLOj04Pnksx+XsnLlHkYSMCjOVI26LfmMlU05HMsWrWnlO8sattUz
mY0rw5ncHWzadai4OxIMhd4T5UoLifuxw/CYZX+/VqN2VKUYD3k1wE6RO3QVqSRoYo0O20gFmTmB
nrddWbOSBLzP2yP/i4bXaiivM/1Z+WbrpTKQqwJ7TmD0fTaag1AcEi/Ky2Eo31H5r18eRTDaZmPm
4UpKqmtpDPu3VSxXA1xKfZm9wv14/oyak99eNBvsJVsQoe79Az5zNf1G7lybDt353osJlvluPJhq
1BrD2vZ10gFHGHk3ojJrFshgTyY+K+d+GVStPpEksZPwUO5qV96HvK9VzZXNOumt6tlJ+5qLNT7V
t3PSxU7up0mxAtYtQNtd88fuTKk1LjzCdlAEBhchnAuiCHTHxpVoITc18uTCwJXqrDeF69OPD398
/Pp/b/pvzz8+vTx//evHm+NXaNeXr+qXWnLBWNCiEJxqRD10BlhJNe9ULra268gnWgd7n2vhfCk2
dV0S7D+NFrs8J47dYVKNHtddQQWUshxzM46JISFdptg2lXI2U+UKXRAJkCvUepPzGtt7L9mRTHNX
Fjm0sVAUS+UzudKUdSkRNtob2b2vqgH14qlmSV3K7SoX163shzaeEj8juhNv0sLbjfgC3NWPnSBn
784Y51JrO48Tzl3DIXldnuqqQVsngxmoqe/5Om+5Z3c4W0c6lT8eZEZpY4+OskFyVsM9Q/JDNfWM
Hhrleejm+lGL+D6FDLVC8Gp9HNSJe4DdUlRuybZKQs8rx70r2xJPTWYaqLeLf8pSPzjYKbLUkeLU
kwPu1AP7veUGzqxzxvwUamuOrEc4WMlO0dwJZ2nkh4407UX/Kom3tH8VJGIzTzx6zuqWrsoAS5ju
U9ERawFCc0zSlgzx/EHnM8vJZgqgZ2l6MFOp+I7Al0nETu+NMQrjsezhyBySH0hsn01ZOUtsq50X
uroDlunUw/mstwKdJOSBbyaaNd9++f3p+/PHdWFnT98+aiIPOjZim8sM5EybcY0wCfpuHKu95uZl
3Gs/0EWDaszOU7EKPXrTqWfUyKWouo00M6xThb01Zsh9hdBJdSYS07XY9qzJibyQrOhVIJOoMEa2
JrkXnCKD9GiQ14pqOkcIjYc6HyldRDUhxmG4s6a1UiutdGYhdc9WI+f//vXlAxofzR6YLAm2ORSG
WIyUWc9LG8NIH8PUYZE6w+RFJXp2nbWCjZLyKchSzxIwOcZ9NqLLEtZRj7krz6lm+mszQtw7qEcq
eHHY1jfmGXI3eBRNPmJqZTRoDE+rw/E2o1AU0tqhmJxLWQFm7KikfNT/adLUZ+qFFpq1Ayrt1JJX
nfkYg0jPRxKppp6qJIIlDJtF7XcTmkeOFdMqgVTIilbBxkzFcvvunA8Pi+no2tq6Z7rVBxI0g4D1
DMedBzvoaK183UQLpvn1X6vGHS690HRhMWR0kwLTCzJn4j6bzfH+Nm/fw9TvCto/LHCY5rNIEw5V
PbMegkzdbS2o0P40xvPNj+KUvhyXDGlKq66ssHpBulJVRfKVugv15nBqFoVEzbKdt1mxbBe42jur
DppFcbVBnTglofoGz2nz6URnRUFcpyh6ncvOLV1j5gUjqPp4l5r1YjE0viehaK6ihn4fp9m2CZz8
kHmUP3eOieOI3qixZHONVGoVpcmN2DvGJvZ8gmQ5cuLIw2MGA45WOxBJR0fg5P0tll3laAy3wZh3
Q/jx6cO3r8+fnz/8+Pb1y6cP398IG41qjrRAnKORYXFiMrus+ucZaZWxbMCQOlX3vAnD+HafRjhN
unYBaafyU6dlaWZ8Kciubs7myOnzGk5M9B1oPya+FzvCDHMbFPrymEPpzSheGq1YreR0UldhgYW6
q5Usi1JHkCHZXOgF0gWAgmvGPEqBZuettjMmded7JNXYhGeqru0kEViidc3Q6VpHXmiPYJUBQ+Vt
hAqFnK+1H6Th1jSomzA2l4bZ87/eqNnYRyvAslLU0LpjpzY/5tTTPJecTFMvhUgJGWyM0v8x9mRL
jttI/ko9bew+bAwP8dBG+AEiQQldvJqgJKpfGL09Zbtjul2Oajti/PeTCZIiACZUjvBRykziRiIT
yKN0+Nuo7laR71ES5oL0PXv1KR8kyvD2jkyJT3bky/iMNBydVtgmZPuMibwHEt7sImUz6eZUgYSa
+KkjbKFOBCIk/YBqlvSASPYoCFEvijMjLTaSwjXL967Ax+rGTLbEytWDA7l0k/Weazb70K++lnDY
i6qzQRRiwICdTdlb1owrCQZJO0+BDuW5Ir1kVmJ8i1FPMXdyqlaQp44G7zBQtnxmIWOPWp4rEWpj
qWJiRAmUS86WKI9CXdDRMJP+5Sh73qhl3tBK35YUlhG6Oj1ujaVirRhCJ9Om3NKFTIyuEVmYkB57
wAXk6WaR+OQyY3UURrq99Yqb3dmJKoUs96FHs1ODKg4S//GUAluPQ3IQUVpIyEYrTEBj0iQgl686
QcluLmcr2dNJPHmno+V0Dj3uJ9DESUw1AJWVKHWhLD3EwKXxbu9ExY7doNQFh6hqUSWU5ZBFoysZ
NorcqlstysbtQycu9cj9sej7pnxv4pPUsYEQmTqytOpUrQ8zQR3aGlEbTRmoCEya6hmhTAzNcqv2
Y7LXb5o0FKh39I6eHVSpQVhUQqJ3iyb3ziC0xfkT90mZQiO6pKkXk81WqNRxiCikw5VNo7rSThMr
hcr0jJGTHrZyUSvJpswK5OMCFl2V+F4GVcsc1k8mlSQ9wTWaqEqTmNxjsjziOxXJHCToo55uBGWg
0mA30MwBTTB9WEDvtBxVhCCM35urSWMKHnORuxJGjuSDCAIWkR+SR8LWC3GDS51joTSp96s2FKsN
LnD2TClTD4u/mIGqVoQtvhuYKVjBjMk29x4IqZteFMKQArPN7TWAKkcm1FI4on132ZIPh9bVFR4D
EztSimF6VOVmbkWoU9cfx7fPv/+KdxWbKKfsqJkCwg8Ms2BaSyPQHbIYsVJQDmGIweCL+vvfkWFI
VbIgxMmr6DGOVkNdgOZ65CD4AbJmK8ZcGg8tCM+hE+fhQThYRaTcVCuryAkqeVmgE71m3AC450rO
wUrNbxBeHEjUVBy0p5KYT6ttyuZ4gyWnB4dCuuKA8b/vNlYUEtOishL07Z+AdW3RJWcqDB3a5lqx
j4EGg/aOsEByUI+66uoyiZsHD5a5Y9D63hovAGCaiLEFZWtsG92vE9EYXJkcGPyOgh95NarHNcc4
u3D4nTxh3AYKe7FaLWGN3ZN9oGr+8tuX13++vD29vj39+vLtd/gLw3RqV4H41RT2NPG82FwXU7TJ
0o939rCrkKdDO/agR+zJ3A4bqmgTg8fVtslMrauoEN5quBpgCdbT1GJIpn2lt6RjOTfdqFaoUoTb
nlKWkQi4xrE92wMwQUdH8EWNIhN0liyN5O/UPx5Z10+7Tm2xxZTv6b/Zn//8+vqUvbZvr9DrH69v
/wM/fvv56y9/vn3GSwhzqjHQFnym3/v+vVJUhfnXH79/+/zXE//tl6+/vbxXj/4usMLgn9oFD0eP
RJ3yTOPlE+955l3Ny6mSe18eNlB7vZPMjkNvTEzdnC+c0aF81cLe+7Sqq/bkkYzHrlCw080tdqmu
R/MKaoUCA8xIs1TFFypmONbOsJiAhRsgk71dZXVkx8CR917tlYx1aPJ1yh0JJO5E5YXMIY/4j0Np
dv/QZCd7RKasDbjnDHiLqfuWlb/Mc/v5t5dvFjdThHAYQ1EgccCxo9s9aATyLMdPngfHVxW10Vj3
YRTtY3tcJuJDw8eTQBU2SPbUk69J2l98z7+eYSGVMVU3DpHNjCaMFFXrCPy5EvFS5Gx8zsOo9x0K
2kpccDGIGoMN+KOoggMjFVaD/oZG3MXNS7xgl4sgZqGXE5MxCsya84z/26epn1E9FXXdlBhg3Uv2
nzJGd/pDLsayh+oq7kXeg0U4kT+L+pgL2aJ5/nPu7ZOcdGrUhpuzHBta9s9Q/in0d/GV6o9GB804
5X4a7KlO1c2FIZ1aMr5HkTSlqPgwllmOf9ZnmIKGXloNRgxVhoJNj9epe+p2TCOXOf4Ls9kHUZqM
UdhLqgHwXyYbTEhyuQy+V3jhrrbZwETZMdkeMMIrGnavmVHp1nbslgtY2F0VJ/6eVmdJ6vQRc5mp
m+xZDcSHkxcl0Nr93/ikPjRjd4C1k4fvEc+pr0cZ536cUzcWFC0PTyygVotGEocfvEF3mSOp0pR5
cOzIXRTwQnejo6kZ8+g5kFw8N+MuvF4K32Gau9KCqtCO5UdYL50vB9LHdUMtvTC5JPnV0caFaBf2
fskdRKKHuRHDKPskcZA0NcbdGnbBjj23NGfou3N5m1lzMl4/DkfaJGn94iIk6BnNgGtuH+zp0AAr
OezLlsOAD23rRVEWJAEpV1rnjXGEdSI/kifMHWMcWetr+uHt6z9/2Yq3WV5jlBTqrkqhTzCwaImD
Erv+/Kl0nJktAqhWcaw2+hKcPCPq4i5FqMKcgifRopdk3g54hQoK0CGNvEs4Flezn/W1dOqqKPi3
fR3uHHdC0zihCD62Mo0D+oLJotq5ywJFBf4VKW3CM1GIvae/BSzAINzZy286h+cpdNbZn0SNDkpZ
HMLA+l7gOof6Rp7EgU3P08lWn7Lw1KsZQZaak98D/y7ane9twLKOI5iiNN5+0OZ+ID3dh1kJiDXD
EMQD/DHEoR4BwcYm6TA4vs1bu5squUd+SSLb1NLaZts9YpbD+5pdhOsChHVZe7Skx2qwTkkAFAeT
JhNdBzLhR15ZH18OzXARoCua4Cn9pqX+54U1HJ0fpFbVR2YWJIXVOOtySdGwCzuSOaFwPIYpkSne
IXJJCwQgZ/C6V7cwI/pTPFtUGBL8nvlL8aTi7fP3l6f///Pnn0E1z+1UpsVhzKocg+us5QBM3SLe
dJD293xFoy5sjK9yXVeE38qj6sLl/d7PwGbwbyHKsgMWt0FkTXuDOtgGAeL7kR9KYX4ib5IuCxFk
WYjQy7pPE7aq6bg41iOvc8Eo1W2psdGdQXEAeAEiGM9H3WoOiS9HZsSAx8Fh2XOJiYkNKMbznO+I
zKJRAcKm9qI+klP765JnY2NDjSOnNoVRYFsFVrcBAoNYNHj+zEcPyTOxvBvImgGdYA3QsHeNuhiw
dcwKa1UoKtk7q4AhI4N5IwqWlFUUL2h9FtfyjnyKwSvRo10MOvmpdC+uwqSfqxdJusApf9DKFu4g
2/RmRahrEGfTJ5r7UnHRdeJC6Rs4xMnOM6ai5CmI5anRRtD3Ye+gQ2dtpmDCBclABKTNaLBidffm
wrL+5gfUY9uEM5cIpj/uN6AlNj+oYNb4KaxjHhBH7y8ZWj9npmXMsYtJI06Yuwh+j6HnbWF+ZJUK
p4Fj0fAG+JAwd8zzrWusAkI4lBz7oWnypvGNOb30IEOZne1BDOJ1b00w66i0nYodmJ/DKqnwnPi+
hcHRw+D8uli+3zoyO8ue9JLAAVMmuXq5GDjoOPS76XJMb+4SQ9TJNibjKbqiiqM+01TmYYfpGALd
02CFKb+b42aFLFjabA45i0qebpQ4yaLmQpHATLzEJKuS+WFxlqbI81ux/8PnL//69vWXX/94+q8n
2B92FvM7/8fri6xkUs4PdHpnEEelsZrR901kF7DBr+lD7mWvyMnGk5wyrQadCz1sS3s1MpeuCBVU
8+Gnyobgih7e37dIyUApZnTR07vsw7I3DkQGKk1jz9FqRDrsiFcqKmwzQUYZfGxrnK3qyOYoyy2P
YlYWzZ7qadmmUTQ4MIkeW2rFUAGF7+vKyL2ilXaBoU7Klu7DIY990mpRG4MuG7K6doyBHWZ13ozv
bLmlFpBdMEyJtlGU4kELd3gXb2zJxk5NNle+eSRfSpDNudYkcamnGYEf9+SsGqjNqg1g5KVZigIK
nu2j1ITnFeP1EXn7ppzTNeetCerYtQI5xgR+YCoDrAUZRd2q2AIXfUQQ20iJ78/ElC4NnXppFHnq
iK7nt5qhWxWcTY0+D4jDXLqYIFj+FAY6fNZfRjh8gMkIu3EqNkZBC42Iv/Du0EjuzpKt2mWaDN9B
y9d2pVlfjnDiitwV90TVXMFKtIcFX8Tl8XAu7CIl/3jGkAFkJDscnva883yVMN4c06YtQ9Q9Tehl
2MJYtk+mqyt956lWKQdSMnQvNu2wjSKmJl6YfWO5n6Z7q85S7gx7KgWU4tRaixJGUgwtBVOKmbXU
2TlNrZh4MzSgmfmCdtxxK/SVDKQHmEOfJoPZAAVSlhdLQmV9eTDP100BFKwSOGDm1A03OLu3EzXB
re/lLkj9DSweBgoGku11zGW7XbhDQbqC4yJgXcmCzaAeVfw0xzclu83fbArakQWRwTPvBW2+gUVH
nYYKZV7xIIhnp8YVT6xG/8tcHCnzoRWpH3grNP9g17RQU1KJ/p01ObyWfphshngCO4KlAb6oUjq2
JvJZnOXvNqTaNDjjfuLwnpka3PMyHVzzvKA35T433dEPfNfOKZuSma0rh3gX77g0oZUYJsZmFF5X
QUSGIVTcZzh19gedaHs47R2fdBUPg80nFd+76lC4aPMJqJNpQN5DaNg717I+BRWpka5FeBkCI6gm
gG5VMfENpXec8v9VhiaaJ6KacWYvATanjLTqR4QSE5yriY0dnwA275gKRRnhwB8W0GI0inHKBm8J
BYBVBxBUgikKn6n2TQTTJbhzva6EUhwr5jJBNEnpewCTRomEm8GccPNVnrPNAOQDq8lgKCYhw9B7
zmoAu12oNh7Z+/sVKdtPd1FShF7k4slItuiWmlZ8X4PbKnWL2BVatTAudb9dCi2uAjg+oRmf+E+B
t0s3PGesT6X15QTPlROZWqdGlYXo+FUYcUA06PaszVGptsanGYqrm1NK+zrQrqfBpwGryAM/NLRx
q9E8ODWER+YHMsh6JjNW0R0HxtOft6iCZdbkgOCeCWaO02VoQZrhG07c5uyciyYrXCJik5mFYwQF
JW8ezpacj5jlatFUZjZki63dtmRAZJ9A0EgCf18N+zSMEhXRx0na9VG8ix7QQD3hvzcCpQohAiTO
mTtklYrFJQI5Xk9C9qVTgtcypgP1RgTXk65v04TL1+xpMjH8+fXtqXh7efnx5fO3l6esPf9YklBn
r9+/v/6mkb7+jmZ7P4hP/s88QKTSodCkqyPmETGSCRpRfZQ0AhYMnOqO0qSjNNnmoqBRfGqCqTQt
jRBZIVwKKhKJalANOg86J3s4qNauDzClRxz46LDr1janutzHlsJPIUYms++SX/ijhlf9M+ga2UXm
VN9lU5CFPIhrEAZPuJ4/q26v95XvBDEgv7LbOofMmxY3jVNcBB/5KpV9yknnWAdDX7RHZm+fT8PY
52RKl2XE8dUc/27vgtRkwbENnauzrkVVtnHAC8dzL0qim4jzDXMdEzM4MfEDjJUjRcMmnhc4ML6V
FsvCgRj4YMTuVJYj/h3/vPNJXy6NYBelRNOed1G0UfNmTOw7kjdoJK48JHeSKEwdybpWkihyhBVf
SMosikkfq4XikAfqkWfTwUM/yqzZwjMZRuVWqltRj2qbKHauUiMXIqYQu6DcEYtGISJiFc4I11KY
0C4FcKVwtSUhBhERMdmrXZB4Drij6cnDlg9Daj8lUXShT6eC0Ch2dP3hbk/Bo7AMqY5gSolgoFqr
hJ1Hi2SShrZl5pUguAfqOS4Ox2XiU6sN4MHOpxrHZRqSJgM6QUDwgwlOM7hjX8UUK0WT6LF7Dj1q
fVcMxEEvJapSGBAUmQMVeUSXFSZOqD4r1D4gE/cZVSah8/P40aqqZJXu/RjjaczqMNE+jQaVh56V
WyIQKP3YvjxcEIl9ZashXDtHofeuR1idCt2wydIBQc86IEMvJvbGjHB/BX0k5nbBPOhL5Af/fqcv
sNzI9duVcAoQI4v6hh9T9SGG9FDVCXYE85PHvow2d+kKg1cgm3tAHUMP2h3bcfijpVo7m3Ey+K/y
bX3IKKXoilnEc1nI3klpAU/KKgi9iGwJoGJvExGRottFpAHonaJnIc1jEUMnMbsTCFCFCMEPNPIg
iohjVSFi8txHVOJ4fNZoHK7aOkXik91RKOfd/UwBEhXB93o4TXbUadIXbJ8mFKK8hIHHREZJRRrS
tQ/vJKHvvFs16YKBariOfr+uv1FTng3+jth1vQxZECSb26MJNwkXj0pHEloUPufMD+mEazOFCrFE
yX3XKo22D2MLJngsXyuSh9UCQUoMBcATn+CCCKe4JsJDUpBQGEcCJo1k94iBIkHkaGVELE6EJ4Qo
gfCU2NIATylZYYLTrBYjCHikHKAw7oeZheShpKAI6JbuE7ql+4Sel31KrKpPSnPfx639OrEIMklE
cAQMjhKRs6wwj1UwIIkdjg8LSc3OabR7NC71/Z2YQlCdmRDkruxbhhldGe3gYl4oGMVORyjaNpDX
Bit6c/2ojtJjx9qTwjtHYyBPiPv96/J4JPKthdrJStQt8ntmcNl3vD72lEEYkHVM82U5n3R7dCxk
NUqbLqN+f/ny9fM31QYicQt+wXbou0ZXBn3pzoNZgwKNRWE3f2OJZmLlmbJzUKgzvkfok6BGg5fP
grLxQCRGpOhu64ROMAG/bmZjs+Z8ZJ0Jq1jGytIibLsmF8/8Ju12TE85zn5lt7bj0tU1mK1jU3dW
aqQVCsPoLJljEAvq4l8hS541lTkA/BO03wQdeXUQnb1Eis768lg2nWj0FwOEQmnKrdKkfb5xk+zK
yr5pTdhF8Kty4rTquXVWNA2ECszaYRKK3gJ8YIeOmZ/1V1Gf9NSGU5trKWDz2HWU2ZKQSwfy3J7t
ktfNpXHOCfoHPdgtyqi5goHk9oor0QrXbGrFbir6vN2Ejk/rw1WHyLoG08bY31VNDeyD35yNr85l
L9SMOoque2Fv6qbrOWW9pbYMqzGhEawdYxg1sHv9thw05ls9mEPSwg6ezN63wMkhx2jcgnnsLKBT
ogHjuzQ8px8adKJMUM9NiqKE/qMLaSY37e3QE9/xnWTok25/MvvVur5pOUdPpmdzxGTPWbUB8VLC
ycCtTQ6lt+V5w/U6MuSY2sPoY82k+bp9B7pnfLIPH6fdYcy6rFjXf2huczuW81WDTqeNvvfFpTEL
ARYkuW7jrIAn4AWVDevOsrdtBHXoprYzHrpjK0OzpKsQVdNze8oGUVeUoQniPvGusYd7gbmH7tMt
h0PX5h9TQsHxdD5YMzrBJ++D+Zc9vaxsJSlOUfLCPSYPKcjgIw9KIVaMHJ1WSyKHbgx0Mep1DtBz
YRvw3Qcvb671bOSi10kXfzee0JuzCE/yMDanTIzoYwai4OT7pglXmB/l7sV3Hz8EA49A3xL6wREJ
zmUrUAZ0EsCftStzCOJZl8FQMDmeTDcgwDm+mOxC1VgjEXZVE/nu8PbXv358/QJTXH7+6+WNEgrr
plUFDhk3XVWNDqgMYhdXF3t2ujR2Y++z8aAdViUsP3KarffAT+gbKfywa2BCp9hlxHBVet6A9tpJ
/hHELQI4e7B81z4cD8rwdAtarKtTTUdAPQJNh+k2jHNEsyk5TJX9Q+b/wE+eTq8//sAYQH+8vX77
hj4w20nCzzeOdBpO5ifd7PUOGqFFLMtAZDUswVd8a38G2kRzmofMqH6iVykQH7QBDsS+qKiWNAWs
ciZ1Ec5EquNNZ10muneE8TCo8mtWyRO9UFbCOW/cw34U+P/Qo9tTifLAGZm3D4muB5mbg83KTA+j
rVaDKIBfW3SL85c9RtOsZNKEZ4dEV7sRhAm+ZI7TZ4DP0G4RwzaxyLOPm3Vzkh9NwOLNb2VUQlRF
2vqv4zSAfF07ptQVn1Fba1VMWs1VoCv1IjPMGhfYdpdM2+3l++vbX/KPr1/+RaRgWr4915IVHERy
DDOuTQzm5rozgrVKOcEeVvZ39vZSvVoRlSu65Ez0QWkE9Rimjrj0C2EX7annYjRZR5l37R7+mrzf
KNi40VoU7tChBF4DYxlPV4z0WB9NjyLVQ/QyIo4cVQLl7qXjGev9/1T2JM1tIzv/FdWc5lXNYsmW
Ix/mQJGUxJibuUiyLyzH0TiqeCtbrpe8X/8BvZDobrSc7zDjCECv7AVAY5lckPUqofnpyWR6ETgd
CurTcz4Ku+wvWpBRJekAndpQ4cx34rQgwNyUDthTt6ZzagXQAy9ofI8eejLeWrR9TGSzK2UYXBzp
ix3/XDaAOUy47dRjp4a/vAJPp57E7wOeV3f3+HPelkThZ1PW6F5jjRQrGjg7t5eFmJDp1um/gvtY
r54GI7mbzaiMEujlRuUUWWKTWZAhVYK1wKIJBv62RtCcTmnWJbl+lW+l9f378N8U2oQBBh52PnGT
htML/l1H1uYEZSfgC7sVJ2VTv86nP2zSPj+TCb9sogmsdQua1KfjRXo6vrBXu0JMRKgW6wARxoNf
HvZP338f/0ewlNVyPlJujO9PGKCTkWZGvw+C4X+Iw7D4NihKZ9bw3DRBcoDpFj6xb14xMqZVD+ah
nM3tRSXzAzl+XsOx4H5TBE8+nbFHa/O6v783rjLZCpzNS8MDk4JtN0IDV8CJvioad2UpfJTU3I1v
0GRN5Myfxq1iYI+BdeKZfIP0uJrHIA3L9qNOBWGTrJPm2juyYydEP3qVEVp8O/EV9i+H2y8Pu7fR
QX6KYTHmu8O/+4cDRosV0T1Hv+MXO9y+3u8O9krsv0wV5HUiIxiw4wzgy7lXn0aXmKT649nK48aK
yuyrDh8oOMWkObP4fEL7JOWNZI5hF3n1ZAL/z4GlzLkQlXEUAL/cFOjBWocV1XcIlBNpp2rCzog9
gwA4OM/OZ+OZwvRNI07wNUzLESaTFAG+DfV9D/XwlkDghh1CD1RpdD/0C2F96hvgmPI4rU2syGdo
QArj4QW9eaoAeMQlNsqMYNMF2wQLkpNYmHUDaKhYqVkAJkJ8WdCtq5ApgibKjIWn0vTCN9pixmm+
O2W67SKa7lUEJ1hhw122zIxjZkDx44pEWlYj2Z2C0lo0IZ/5EbCx0R8FQHKqpazbzpivetGVslz/
wcOH/e7pQD54UF/nICttVUm6fFDu55ebWiJdFSR9OGwAz9uF9iogRtNY/0JGiR1UDhsB5xUjqia2
ZUB0WbGOh0BYtMeI1THYeXlEEcF57lEtWsPomw7J9AftVkUCpMECzs4+zYygKJf1yZjNmJhkOO9h
knTmM0IzPr80ckAGlXBuL0Vs3scBLCOQCuQ/Jxa4KsRkT42njjhVsg6wPHXNB9HBsPfinSKF3Wts
X4rhYwoRCl+uYmsQqgTRY1Lv2haNxKgJGALKqFrjy3FSXZmICOO3c4iA2q8iABiesKAaclEvhpLp
PdkIAm6crUVatTStK4KyxblpEYDA1VrXyE7XesFe2njIam97EqFiXmyXbUyzX8sgzvZvZGdbB2g4
4g8wJ7yeQq2jkqx0TZ9RF3sFnKN3Hn3BVHDhBepQZ5l52xKwDnTHpanQ1LJXQ2n4LYbLT69IsW2j
pY4D3Vfenv89jFY/X3avf65H9++7twNj+WAFClIPQxYTqqB6Koim/6OGdA3LKr6eW26jTQCnK8e1
b2fnfVCgbrjzewamTED+I3ox+NHNs4LsoyAFPk08UBiEqzbYxLqwdVliJc2qzSOMdpGyusNtZhct
4+AKYez32SYBsEk2uh9FXK2iBR0WcGvou5jGtcHhSARfCVp5dMuMWoWIiORpUKIZwKMB7CunN3IY
zQOW24rTtKuzeVLQyOoDUMwEvZYQVc05Tl+VKmYzI3Q0QnHSoxj4yKQ0pPMeGdDjsoca8ZMW7eek
AZ5AjZlGylKYJpinnoeLZRl10tsTU9bxL82l4Jk5BzVAkUklQLroMJZY1ZDMH/IVsEbv35KUQzH4
sgwiJ222gcBgImweG5ZYpnoIQmT2jddmhsyHVGpXpZX09ErEF/qwOyC7XsbXMOFpajO2wmZmbQhX
irvNm5OTk0m3NnNBKw43ztNiYxdZzxsaOKSt0O+3O+2E1UlXlFW8NOxeNAUwFafdvG0aKxNx7dvE
ZSg5xBp2YksN6VQA7n5JWvArGu5dK/DnTVctLpPUML7SyJXFyFloY8GJqQ6zkrygpcvhSKAMkwru
LnG8Zd113cTZp3PnaYl0sYSjvGIq0R9lEkpzF/g8QJk3SUAtijIQQ/Rp7x7LCTtuiatqZ7UIQ4VQ
Bg/VLLt8ja5fdruvo1r4dI6a3d23p+eH5/ufo30fJZg6gpqV4tMXctxQqQCJ5cLy1f/ftszetyL4
Z7eo4it8k26qwghomKiI3U2E71P4LAoL3SPCI2WZhf7syANJUvLsm6Jo86SxafQKyqQugHZSv5F1
ZVL68zKj2VTHOkdgZPIs7lcEObMkBsrBerMSivWoZp7xgznSIGIu58LWyIjaSR5t0jTAaPBHIhWG
6aXIM1UUly21v8NUv4DDMA8gyhDxWGoZEafXqXJdDx+e777LsIv/fX79PvBqQwmdpY3sFoSu6ohP
E0RK6iyZ3BAMqoszagRNcHUyNfz8LNR0zI0RUeMzH+bMizHjBBFcGIXxp5MPhoFEF5MpW3lYY/zg
jkZWoE3LFIqexn25IgnJOpwe75tMxCzkBZJ6yLMGCDeyqcskZx82ZaH6+f31jonCDG3Ga9jIs8mU
yN4AnadRDx2WPD5jYgR/2MbN+RlvOcI22B/rQZKCSEfEfM3RZ6vWuIZCfsdqbdqcDTClqpdWGwNX
APPbwv/XVJ1WBDU1zJY0AVXlSdCgupQ5AXdPu9f93UggR+Xt/U4ok0e1Gy/gI1JypoqWVAYu/tRV
FFKXXQZ13cDh1i45ZUOxkOT2SAz1GAb2sKh6ULemSUng7pS8sqN1tBoZgF1Nk8dRBNHGs/hFWpTl
dbcJ3BtO1RwGKXZGxiQfquNnrbrqqthntKDkV/l57G1T7R6fD7uX1+c77jEcKi2aGAMssluAKSwr
fXl8u3c3YVVm9ZIufgEQWiK24xItlK9LfA9DALMOJJlSlxDp3OwFYeowYCdKLs5k1DDO3+ufb4fd
46iAc+jb/uU/ozd8ufsX1ndkWrAFj8DVABhDiNCp0ynhGLQs9yb5I08xFyvDDb8+3369e370lWPx
giDfln8PgU2unl+TK18lH5HKZ6W/sq2vAgcnkFfvtw/QNW/fWXwvNaDfTW9OuN0/7J9+WBX1GgcR
OGQdtnQVcCV6E9Nf+t4Dv4fqGGRPe3W4/DlaPgPh0zPtjEIBQ7jW/j1FHsEepbFiKRHsUREUJTeD
URkkKMHVwFOxaoaBDp9869KI9mRUA6dqso77FwM1iMiez2G8SjYd3rq2KGXoWYh/HO7g1pbPTG41
krgLquSmyA0Fn8Zsy8mMU6Er/KIOgB0jhgEKbgYnVsBebD49uzj3YEOMKB3aw0G27/R0akSOHzDC
CIE9pSjN7IwLzzBQmDYLCl42+XQ8PXHgVYO54gMHXmfT6cmEmUhtC8ubpRWV8ZKSsHR5Y7xIwk9U
APCEeJEOnUNAEjV2aSc3MMFJo9jGDEaLCODxlmXBakcR3RipZEUB2DzDxxY0+FxtvsWuQbCSscjE
soWfKjWOu2aRNAwuxphZy6ygqZPxGTHKQtgiuOx3k6j1+fb1K2dNt84SpP80O5k6dw8W9G0htOkh
9sAZ6iUWhj4Kgf5kFoiVgcxWKUgFNgdPqMIqNFvCB9pFk9ltCYMtfj9IdF3b75wMgV+gRBph+zSb
WiNvsrLPBwZ8j8h3y9jwV1fIv5vv0yB18HyMUw/ZJiUGxp6zHoNVXMeNVlWkRtZvgZlXYVbDWoRf
oZmcQeLlabTkojBJAgw1oG1+xIDL1TWw1V/exJU1jFYH0wP00AcCVAnGDPQ8xCzAeYCnxsQsiSWU
GTLstaqKzdwxFI11cp+PkNRJXFGHOcThqkqy7Sy7wuYNeUj0dhunQ5/5RQR05TboJrM8A9E/YRU0
lAaH6TQUlOWqyIHJjrLzczafDpIVYZwWDb4rRqb5BSLlR0STfXZpmV+srxVv8jAgqhKl0wvK1MkX
P6A4XWAEnEWSfzZSL2Xh3Phhvg8iIC1DfWKVu9d/n18fb5/g5AHpe394fuWiwh0jIwubfU6BuT/T
zQVPX1+f91+JcUIeVYXpgqxA3TzBBylXRad5ZVVVr+dN5vk6SjIzP0WKdtdr8bzJ3Sf4nk18KHKR
rSMh5y1SNETVij96JMig5rtpFNDcZdAuAoba1zL/Ov3pHuYKXGaw/aPAjQS52owOr7d3+6d79+CD
89F8ZsxQsd/gSy6/SQYKTKpFI8tj9vY2y65NEEhPFexqgNRFGtttKSxrSmcs54a4EWiI6fDRQ+0X
oR7BO6b36LpZscWymnunGzrRcJ3Qj0SDG5f7EXQhjFBoGJ1JXU6JK9lRSZMyXbasNHG4Jqo5gVSp
MMkrryAE/jy+iR2sEoZKNAwMi7ZMaahFUZ96ByL9hMVMML5ORovUqgkg3SKLeSgOyoOx+2wg++7Z
yGDRMlBj6SzMVJrwU0bDh+2YF2xwcCRRLpfmSxtBoHvjo1mrwkj3IE+1tfSON8rV8xhzvXFvWnHP
SsI/OWmZgvsjHR+Y4BtvBRMijSDeHw77l4fdD8OzrqffdkG0/HQxMRRQCPYJEICy1bVcE0R4LEpy
v7V5gufLOqmLygwInBQ0Phj8Qm7LEu7qNMnMUgCQmqGwqazn1CrsX8CIbrpFDP8iU9QNe79Y7LjM
+rd/2I3kbU6l/TAIV3G3QUdzaWJKG1d5QkBQqNGiq2bjAwMuQb8jQ9ybdObNoEDdNmgarhLAn2IR
UzY8FQ0XNWYbDTkmQtPUcdhWCc0NB5gzt8KzX6jw7EiF1ov753lksGb42+tRCLVmczHdw/Ko4gQm
FTCLmgECaWh4s/cYkTkmydmNSOqU0025+wHVzwLbAJkCponPVo8/++r7/HE9w/1Ey2CuUvS44piy
rdU6/r5qi8Y4Eba+D21QVLx5CaKKXFh9CWNpTyes1YCgoIb5Q6OUJiCbe7moJ9ZiLEIJY9ufN/Ib
cGxfkqrKhpN+Yk2IAOAUcmT2mtBg9vtpJPcNTSKxVn3jkdWIhwDJ8XtuadUaht3HgDCGtYdGpjcF
BzxzgTd1Q9Q8NyAu2fNUm1yvNQv9xkdtDJ1JDVE+y2Y61wTEGgTLhKv6pAbBAB2Zrm08uVw7EDqr
69I3NzUmdDJOpB7k7qEBNW8TuGFzjJeYB01bsQaMi5oxWJYgluEUGO2gMzQaeIs421MA0IRVPI+w
xhn6PsbkV4p+E1S5Ma8SbO1DCWyAvSSwRdZ067ENmFilQmrwpSFiPQZEdgrapljUZ8bukjBzw7UY
nMjY9SGAPKa1GFucrE1Mz4TJ3HkYBrhJMGtxB3+IUMcQBOkmEEmHUzS54khRVjWc/AhuCx9bjI17
xhzIshhmqiive5uI27tvRr7o2rr4FECcUnTKFBizERTLKsjMRS2RR3LfKopijocMiNWsi4CgwX1I
pnaA2auJYMxe6dd0OVQ57OjPqsj+jtaRYLccbgt4yIvz8xNrUXwu0sRj53gDJdhroI0WuhbdD75t
+VJS1H/DlfR3vMX/543VO2IyB5S+Q3y9EBeK5ynBReoLq7FOXQGwJlnAqg2d16N9lvqft9371+fR
v9xMq9R6hs4LQZceKVYgUWXZpE6ZMkDPhCJP4AD3FQ1XSRpVMbmvZFGME4NRSJTHa4+9jKucnhVa
laKFqaw0Oy8AHzA0ksbhsIfn9HYJ5+2c/UpZLM27YiP9ZB9AZZks0QBQzgXZG+KPPvaG1bBI1kHl
rBWtj3M/W9+LpJbeONJ8kUxIUaF/iHXABpG1tBRAriQNW1ilYnHL2l3WQOWCwlu4r3R7w5wuahl3
yMPIxQ4fN+B8LJ49zM+Lnn20IGobnVDmWWE2cPsDcrFgZTZJVrdZFpiPa315/zKSJIRHAwYImRZu
KJL2xnAklDCRYpNI2fPEmVsNg8+6xtflSDbKnYaa0mAOe6jZ/gA2+EMJDrBbbMQiXconwQ69bZtV
jJvFCtMXwsVBP6v8LXlImbnURFgev/VVG9Qr39m89a+zLMnh0PAgi8y3CleltQyv8u2Zs9UBeO6r
oVKVE8lWQNBYE202r1X0Dyp/WgQwB7yBjV1RwWpUJRms0LmZ6LK3RDV+o7FSitoOvbYdAlhex5Bn
A/LRRa5CWna4YiTB7GzYU/y7kaTDRcsSmmRHWrJHqW20jrVKB87R+2dCUzMdMefk42qdKn97+N/Z
b061oVTwHxsO2l0dw1cBm5Lnul4bO6K1doj8LY9e4+xYMF7Ow9VTFb4dhM519cLknuIGk7Txt2Ru
dQh/UxlH/DYMRiXEowwTSMN7UEI6PnZJVRQNUrBILInykHTsA+mS5RUVEXJHmCcvt8YSJbUwLWyj
kjujgYTTZQPHjl4iIA8X5LwXx671E0drNKhiShCXk7yiDhryd7c0vbMU1P/Jw7hc8V88TCyBMVGq
nJqLSyOw6N23QR8N1NHEg+ekWccmDtAAGrm5Fd8npGpLDOvrx/suP4F0tBADlA9WM+Dxva7EYLn8
4pGEv9A/JQDyBEUU+K7BwH99XpQeuYaGGYAfw6m0f3uezaYXf45/o2gMsi0kibNTkrHewHw6/WQs
ZwP3iTNMN0hm1BTLwkw8Tc6mRsIKC8dlojBJaMwgCzP2Yia+bp6fesuceTFHBnDOZ9OyiC4+GuXF
6bn3u1ywOTes4r4BX9AES2avPp2ZZZK6wEXVzbw9GU8+7grQWJ9FePqbIN3UmAdP7B5oBGdBSPGe
EU158DkP/sR36sJeBP0gPurV2NOt8dRs6bJIZl1lj11AeT9vRGPUDGBCA06jq/FhnDbUt3+A503c
VgWDqQqQLWjMxx5zXSVpmoR2NxG3DOKUNaToCao4vnTrTKCDhvFvj8jbpHHBYrxs75q2usQwjEaR
tlkYazpKeSedNk9C6wm8VykYb5vSIH539/66P/x0I36I+PQ0Dgb87qr4CmMYdP7bA9iHOgF2K2+w
RJXkS49Ur6rkWT2p4Y8jh2ToTBetQKCOZZB3o6f6EQYjStTC0q6pkpDn2488ummUpR3D40F4keAO
SAPPM4QyK9mS7y585VZBFcU5DKwVQSzKa8GWhCJ4G43tbJNxjxHA1eHzgrTIIbwWvgmGoiS6lqzi
tDRydHNoDLe0+ue3v9++7J/+fn/bvT4+f939+W338LJ7JZJDkgWdYp8w12aBQaPaGr/THHhapo/a
rWX4JAF1260zkE2e775/ff7v0x8/bx9v/3h4vv36sn/64+323x3Us//6BzqV3uMS/ePLy7+/yVV7
uXt92j2Mvt2+ft09oYHOsHpJDMzR/ml/2N8+7P93i1jiKxYKZR2q6ztUwIHgT52s0CEUZim87PIi
twz1epSPvRIkaPMukl7zbj0WKRr4mP5EgwEGPxCN9s9D7wBh7+9BeQIbrOjfIV5/vhyeR3fPr7vR
8+tIfngyYYIYxrQ0/MoM8MSFx0HEAl3S+jJMyhVdphbCLYIMOgt0SSv6FDbAWEIih1sd9/Yk8HX+
sixd6ktqNKNrQJHdJYX7AU4bt14FNxgMhWp52xOzYC8fighLTvXLxXgyy9rUQeRtygO5npTir78v
4g+zPoRWMGQq9ASy0gslydzKlmmLporihNvOzh18HyNNvpO8f3nY3/35ffdzdCf2w/3r7cu3n842
qOrAqSly12IcEmalh0UrBlhFtWFPqKeordbxZDodX/CCmk1l5wiS5rjvh2+7p8P+7vaw+zqKn8TQ
4CgY/Xd/+DYK3t6e7/YCFd0ebp2xhjRnu57VMHPGEK6AIwgmJ2WRXo9ldj973y+TejyZMcPUKPhH
nSddXcesDK++c3yVrJnVEUPzcKCunfHPhRcv3mdv7ujmoTO6cDF3R9e4mzBsauZLzh26VD3XmdBi
wRnL9FuH6deW2anABm2qwD1P8lX/HfwoMdHH8MF6O+E+F2YuaFo2SoCaBnQ/00aOq9u3b77pzwJ3
nCsOuJUzYndlDbTOB4/297u3g9tYFZ5OmM8twJJf45HcxkQ4fKYUTkn/NGy3q6B2t/s8DS7jibtQ
JLxmhqkwnhRgQ5+a8Qlm3GRGITGqx06Pluxd6t3K/QLBQFY0hqO+ZaIzp0wWuUsxS2DPyjiOzKCr
LIIzwT9exJ+f8AUn0yMTBfhTGupYHyyrYMzUhmDYKXXMyccDDbQoqbh6p+OJQjrsjSjJgaEMB2bq
z5hq0ahnXrhcT7OsxjQisgJvStmcPXixMDqxaLo8cV39JO+4f/lmhmLQx7p7YAGso9b3BKzr506c
vJ0nHo2noqhCPr1iv4OKDUZt8X9DTeGosm18v+idQyHAQCoJF0HUotB1ONeMxsuLEM7fX6ec+ElR
XucHhTh3Xwro8dbr5pydAYCTgv6ZiJi1AbDTLo5i/wwvHJbSprhcBTcB/xSqtwYGGGPz5VqcjJfF
8fev5n0EemxVGk7WJlxcx74jVdOQj8I13xNNPvwCdcZV0cRHlm+zKczsICbct8g02jM0E92dbmg8
VovGGL4OKvTyunt7M+V7vaDEA67Lkd0UzNBnZ0e4TrSbtYctnmWdyoWxhGJ9qtunr8+Po/z98cvu
VUZR0ZoI94irky4sK9acRo+nmi+t6KAUwzJOEiOvd7tNgQv5d6qBwqnyc4KRuWP0iS2vmWpRBMX4
M0ee0CxCLeT/ErE1RV46VDT4RyYuNnQMsDQgD/svr7evP0evz++H/RPDs6bJnL3ZBBxuIXeZAEIz
cEPCVLvbhMrfaWVmto4FuTyP2I5IFGnOR8KjBoHyaA09GYvmjniE99xjVSc38T/j8dFBeuUYo6pj
3TxagyO2ckQeJm21cXcbuqEGkW2t42JxCR27HQdCaNxZUoiX3v5W7nMHH4d8SDiLDEd4csapIJAm
DLmwh4TgKnBvNQXvotXsYvqDUYVogvB0u936sec0V42n7vXCM9t9/WsuEDnT1HrB9iRP4LDjOylR
XZjn06lnHCRwkYvE4KNbK/wq/xGApf/gW2aYMjbsltvUMx+Ewut+FdTXWRbji4l4ZcHUd8MHIMiy
naeKpm7nJtl2enLRhTG+T6B5X6yc4gaC8jKsZ+iysEasCJoqKR4pxScd55wt/0loBLGw8fiTLPHd
pIylBwl6dyyUiaEruexeDxgI6PawexMZXt7290+3h/fX3eju2+7u+/7pnkbARyOi/sFDPW6RdxUH
X//z228WNt426Po7zIxT3qHoxDF5dnJx3lPG8I8oqK6ZzgzzIKuDOwUjPtb9axz7LvgrE6Fbnyc5
Ni3cTRb69ky91yZG1zDmaQ4bJsbY6GTsOpIFyK15WF53i6rIrLw2lCSNcw82jxuVf91BLZI8wsSe
MBXzxHIdrSL2wRdz6MZd3mZzDOU+WGeK1WT4relIHCLnoeHjqVEWWNxyaMIVZuU2XEm7qipeWBT4
TLVAAU75/ybma0AIx0LSGIdvOD43KVylEHSmaTuz1Kkl/qN+S+dgYE8dQQAHQDy/njFFJcYnkwuS
oNrA8j5CAZ/Jh/VINqEl04ScYQ5c6UoXSA7rkCT6Uno7am4b5FGRHZ8SNJ5GjtIUOW4kK2RBeftY
hKIvvws/Y6ktS1lCzdViGMRaYI5+e4NgemtJiEcLqZAi7klpcLgKkwTn/HJQ+IANEzQgmxXsQ7t7
XQ03Q+hA5+Fnpge+TCj94LvlTUL2KEHMATFhMekNDUZpIAr3FKCP/XptieDLRVoYsjOFYq10V8/D
lfFDWPJiLM0qoEauwllwHaSWh982qKrgWh4o9GKvizCBgw34bkEwoPAMgtOLhjWRIJHVxDjVEG4E
58zFMGS2GTi1l83KwolkPEEprBJshxqRkyiKqq4BgX9On+iHs7HAYCRI2Oa90Qi5UzdJ0aRGwDNR
qY4Jz1l9LFP5lchEinidth2FdOTt3UUJomyzoL7E9CvCVMDAdJUxYdEVvUXSYm7+6s8baiNkuiWH
6Q2ao5DeVldWBPqsTAzHDvixiGiIG8zBjm9wTUU+exui50tjMjlCLtOLeR3VzBJfxg36hhSLKGBi
VWEZkX6jozbLiwL1X3ZqLQGd/aBLX4DQbkNGKydfGkMu0aBx/RLB6D1mOFwA2CHye+pWBnfoFmlb
r6Qvpp8oC5F7twjEN98EKfnuAhTFZUE7DAvaWApyqukX79kzh7syjWA0oyqgL6/7p8P30S2U/Pq4
e7t3DbsE53bZKb+iwbBJgtFumDchkO4CwKgsU+Df0t5Q4pOX4qpN4uafs2HeJTPv1HBGzMLQNl51
JYrTgPekj67zALN/eTfxdTYvUDqJqwooadYuYUUN/60xD0otZ0BNs3fqek3j/mH352H/qLjiN0F6
J+Gv7kTLtpSSyYGh53EbxobvEsHWwOzx7A8hijZBteBv1WU072TiEZ+JnQw+3OLrAB5lnIUZXCix
cCb/Zza+mNCVWsKNgYGtMuO9soqDSFQLSLbVFRAALy0zJaTc26kcXS1jH6CjYxY09L6zMaJ7GISC
OvyLfpeFuAGtbahjtRjbXzYqLxPpACDzOtLV8cvf34iurTZptPvyfn+PFlrJ09vh9f3RTN+WBSiV
g8hWXZFjagD21mHyq/1z8mPMUYFIlFCxxMWh+USLQfuIaKoGX1unvDjMLmEZ0Q+MvzmdQX8yzusg
B9Y+TxqQWvEipaUFlhVAf2m6zA5L3xd396BvrCPpKzu6vl4qn8KJBEJ3nKswGlZ1iBf8ACcfYtli
kxuaCaGuKBLMPGJK5Camyws5T2x0RZP0Jq4Kvmew49gUe4KgKmCdB1YI+V5UbdCVhPRb/HZCEyow
E9HdaEoGEqjdTioEKzh5SBe8osskEhm8ansHayx6fvn7UoWtOIg+bAROAWTZVGgpX2PqJNWXWb8z
67Sda1JjYQmE8FVieiD2nlrhwKikcBq5I9GYI7MpD7vWkyWwhiM/UjQxRkRUEZSMKtaZ2/I6E0Y3
tvm3TVPN2aLlEgThJTfs/gRRtDJRqdOjHmxvehH9WFjUerulznQUN/izLoD96EXgsE2xQFkRS6z7
AkGx9QZ49CUNa2C2ZdcxnLcCUbQY/oWbcIlPRAgmt5z+vrg+vYWljHJiAofB9lVKZWvgO8GdE9a6
0FdJNURVR6JR8fzy9scofb77/v4ir9LV7dO9EWejxJzCaCJdFGyeJAOPN3sbG5k0k1AcFDB/AxgV
bS2eaA3sXiqI18WicZEGZypEbEpY2kmPPyS2e4mW/larMtj1T4ZCypw4JPhqWcnSuAMbOkPIRGd+
hUZ1eEy3HLbQrTDVVxPU/Cm0uQLODPizqOCfa8Vyku2w6+n4GpG+K8CFfX1H1ou51+UJZ4VPkUCT
IxcwHV5nsJtn6jZXNH6FyzguDflYnTRwg2Vln2kFu09Ymt/fXvZPaJQKI3t8P+x+7OAfu8PdX3/9
RVNz4+OfqG4pxEJbOC4rzJ/LBMiSiCrYyCpymGdH7U/bwKH7WQjUPDfxNnauWp2mx4Z7yDcbiYHL
r9gIZxOLoNrUhou2hMq3UvPclXEgSvcSUAjvYHRa7zSOS64hnGdhjqBzD5ttYqRs1PR0pkJmGJmW
3Mky+v98el1hI9yw4bgUd6UlvgjkABPCD8wPZjGM4wgWt1RVMyyDZFeOcAyKosOEj0Ht5k6RO/K7
5NC/3h5uR8ia3+ErkSP04osTw7F6Ak2pFbV0S4hAaQlwetwZKxirTvC4wLZWbdkkpvfM0R6bjYcg
jWMwkiDt0wcAm8gKDHJ/ha29F5GtVOPWX9JcMIOYDJR4xvs00ojnFxtikIcR0nN/t03GZt1ikXjq
ja+oA7pOpGMM1dq5V0owrgaR2CCQwf1AhMInZvaxCDq8gusllWypCKmhk//p/QXQPLw2skkKS55h
0btHYF6Ucqg0lS9ybYs2l0qC49hlFZQrnkYrmBbWfmOQ3SZpVqg/tZlKjkzFmkMlm02uyDIhbUB9
+CppkWDcLfHdkVKoN5xK0Czr2gKGqjZZNVmeosHQPMWFElLGQxqAIjuMoDduO/yM+N1lmg9nJtU1
iApptsdOfQrAhaxY+NY07r0kAjF8FSbj04szoeBXDn2DxBVgfp4P5A4Rkz1RcSJMvZx0IFU0zsH4
Y3bOHRTmOe4u3zio0mut68QkCcMTzey8U/pJwZjRjIu0lKeuaL70FBAJZLaR6UsRLxIQzBoRWsJ7
OG9o0PuiBYHC8pJTTFE6F5pzWj/JCeeTdzHutL3Jh9c7mA18V8NEAUfVCJhDHlXG3cl2dvIRBWup
2+Nb8ccchUKhT6h3mqT6Wj/EDS/RZeCdAFlQ71v7/suSY2/OcmqE+q6k95HIaYrsjjrqabCwfCNz
LsCZztTYo20dan9XmKudvkQ0u7cDcjnIpoeYMOv2fkelucuWF8/1JY/a+qIaIt8OAyoW4gjzUxtR
DeJGxoFn6Dglt74OvK1bAXkpIknrlD6+IUQq5hz5WaCy4DLWTvTsChVUSaGvdq6/SLFAjtOs3ehj
r9Q9duRdhgWNpiYVFiDfA1gdXjSEj0mNv7TmS4R9rVBZaQYMQBJU9FdtJszSWX1/BVcSPgc2Uk7R
9s2DjHIZNfxbgpQg0bSpLjzxqQVJluSo7uNTJwoKb/lLuF3mca0UtQ67NugGBiYFNqufrprjW/wR
PH31959z9GHfT6a0l56jQwpD52fmgyOdlVW8ta8Ea9rki6V8GGfTdyuqOjQNxaUqCRANm/tUoJV9
2aMBVG+mdk8BDDs95f0+BEXbJkew0iTCj8cAvgtgCvwUFVoMNbaezZpPnzm8wCYR53kh1/hl5gxZ
KeiOjBi5ZztyhDVt5eIIEg0HV4VQbK/5owoN6mDquzmw7qssqLgnRFHXIqkykFRjZxQykOyRQfif
gNXaErEsvHFE5ELLiiPf3lAsHzlE4iwMYFX6V7mwc0zcbQQlbbV0TwA47/ZVSV0bTn9jhn/g710n
RoQ0E/g/VaI5ys4RAgA=
--===============1760101373017417167==--

