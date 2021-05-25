Content-Type: multipart/mixed; boundary="===============8809829744287897828=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 3447/5003] drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_3_sh_mask.h:7607:111: warning: initialized field overwritten
Date: Tue, 25 May 2021 18:20:06 +0800
Message-ID: <202105251858.kfs7ONgY-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8809829744287897828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5d765451c2409e63563fa6a3e8005bd03ab9e82f
commit: cd6d421e3d1ad5926b74091254e345db730e7706 [3447/5003] drm/amd/displa=
y: Initial DC support for Beige Goby
config: i386-randconfig-r036-20210525 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dcd6d421e3d1ad5926b74091254e345db730e7706
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout cd6d421e3d1ad5926b74091254e345db730e7706
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:306:19=
: note: in expansion of macro 'BASE_INNER'
     306 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:321:19=
: note: in expansion of macro 'BASE'
     321 |   .reg_name[id] =3D BASE(mm ## block ## id ## _ ## reg_name ## _=
BASE_IDX) + \
         |                   ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:528:2: note: in=
 expansion of macro 'SRII'
     528 |  SRII(PIXEL_RATE_CNTL, blk, 1)
         |  ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:506:2: note: in=
 expansion of macro 'HWSEQ_PIXEL_RATE_REG_LIST_303'
     506 |  HWSEQ_PIXEL_RATE_REG_LIST_303(OTG), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:573:3:=
 note: in expansion of macro 'HWSEQ_DCN303_REG_LIST'
     573 |   HWSEQ_DCN303_REG_LIST()
         |   ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/sienna_cichlid_ip_offset.h:371:52:=
 warning: initialized field overwritten [-Woverride-init]
     371 | #define DCN_BASE__INST0_SEG1                       0x000000C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:304:25=
: note: in expansion of macro 'DCN_BASE__INST0_SEG1'
     304 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:306:19=
: note: in expansion of macro 'BASE_INNER'
     306 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:321:19=
: note: in expansion of macro 'BASE'
     321 |   .reg_name[id] =3D BASE(mm ## block ## id ## _ ## reg_name ## _=
BASE_IDX) + \
         |                   ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:531:2: note: in=
 expansion of macro 'SRII'
     531 |  SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 0), \
         |  ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:507:2: note: in=
 expansion of macro 'HWSEQ_PHYPLL_REG_LIST_303'
     507 |  HWSEQ_PHYPLL_REG_LIST_303(OTG), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:573:3:=
 note: in expansion of macro 'HWSEQ_DCN303_REG_LIST'
     573 |   HWSEQ_DCN303_REG_LIST()
         |   ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/sienna_cichlid_ip_offset.h:371:52:=
 note: (near initialization for 'hwseq_reg.PHYPLL_PIXEL_RATE_CNTL[0]')
     371 | #define DCN_BASE__INST0_SEG1                       0x000000C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:304:25=
: note: in expansion of macro 'DCN_BASE__INST0_SEG1'
     304 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:306:19=
: note: in expansion of macro 'BASE_INNER'
     306 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:321:19=
: note: in expansion of macro 'BASE'
     321 |   .reg_name[id] =3D BASE(mm ## block ## id ## _ ## reg_name ## _=
BASE_IDX) + \
         |                   ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:531:2: note: in=
 expansion of macro 'SRII'
     531 |  SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 0), \
         |  ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:507:2: note: in=
 expansion of macro 'HWSEQ_PHYPLL_REG_LIST_303'
     507 |  HWSEQ_PHYPLL_REG_LIST_303(OTG), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:573:3:=
 note: in expansion of macro 'HWSEQ_DCN303_REG_LIST'
     573 |   HWSEQ_DCN303_REG_LIST()
         |   ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/sienna_cichlid_ip_offset.h:371:52:=
 warning: initialized field overwritten [-Woverride-init]
     371 | #define DCN_BASE__INST0_SEG1                       0x000000C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:304:25=
: note: in expansion of macro 'DCN_BASE__INST0_SEG1'
     304 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:306:19=
: note: in expansion of macro 'BASE_INNER'
     306 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:321:19=
: note: in expansion of macro 'BASE'
     321 |   .reg_name[id] =3D BASE(mm ## block ## id ## _ ## reg_name ## _=
BASE_IDX) + \
         |                   ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:532:2: note: in=
 expansion of macro 'SRII'
     532 |  SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 1)
         |  ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:507:2: note: in=
 expansion of macro 'HWSEQ_PHYPLL_REG_LIST_303'
     507 |  HWSEQ_PHYPLL_REG_LIST_303(OTG), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:573:3:=
 note: in expansion of macro 'HWSEQ_DCN303_REG_LIST'
     573 |   HWSEQ_DCN303_REG_LIST()
         |   ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/sienna_cichlid_ip_offset.h:371:52:=
 note: (near initialization for 'hwseq_reg.PHYPLL_PIXEL_RATE_CNTL[1]')
     371 | #define DCN_BASE__INST0_SEG1                       0x000000C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:304:25=
: note: in expansion of macro 'DCN_BASE__INST0_SEG1'
     304 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:306:19=
: note: in expansion of macro 'BASE_INNER'
     306 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:321:19=
: note: in expansion of macro 'BASE'
     321 |   .reg_name[id] =3D BASE(mm ## block ## id ## _ ## reg_name ## _=
BASE_IDX) + \
         |                   ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:532:2: note: in=
 expansion of macro 'SRII'
     532 |  SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 1)
         |  ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:507:2: note: in=
 expansion of macro 'HWSEQ_PHYPLL_REG_LIST_303'
     507 |  HWSEQ_PHYPLL_REG_LIST_303(OTG), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:573:3:=
 note: in expansion of macro 'HWSEQ_DCN303_REG_LIST'
     573 |   HWSEQ_DCN303_REG_LIST()
         |   ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dc=
n303_resource.c:68:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_3_sh_mask.h:7=
607:111: warning: initialized field overwritten [-Woverride-init]
    7607 | #define HUBPREQ0_DCN_CUR0_TTU_CNTL0__REFCYC_PER_REQ_DELIVERY__SH=
IFT                                           0x0
         |                                                                 =
                                              ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_hubp.h:253=
:16: note: in expansion of macro 'HUBPREQ0_DCN_CUR0_TTU_CNTL0__REFCYC_PER_R=
EQ_DELIVERY__SHIFT'
     253 |  .field_name =3D reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_hubp.h:408=
:2: note: in expansion of macro 'HUBP_SF'
     408 |  HUBP_SF(HUBPREQ0_DCN_CUR0_TTU_CNTL0, REFCYC_PER_REQ_DELIVERY, m=
ask_sh),\
         |  ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubp.h:193:2: note:=
 in expansion of macro 'HUBP_MASK_SH_LIST_DCN_VM'
     193 |  HUBP_MASK_SH_LIST_DCN_VM(mask_sh),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:606:3:=
 note: in expansion of macro 'HUBP_MASK_SH_LIST_DCN30'
     606 |   HUBP_MASK_SH_LIST_DCN30(__SHIFT)
         |   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_3_sh_mask.h:7=
607:111: note: (near initialization for 'hubp_shift.REFCYC_PER_REQ_DELIVERY=
')
    7607 | #define HUBPREQ0_DCN_CUR0_TTU_CNTL0__REFCYC_PER_REQ_DELIVERY__SH=
IFT                                           0x0
         |                                                                 =
                                              ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_hubp.h:253=
:16: note: in expansion of macro 'HUBPREQ0_DCN_CUR0_TTU_CNTL0__REFCYC_PER_R=
EQ_DELIVERY__SHIFT'
     253 |  .field_name =3D reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_hubp.h:408=
:2: note: in expansion of macro 'HUBP_SF'
     408 |  HUBP_SF(HUBPREQ0_DCN_CUR0_TTU_CNTL0, REFCYC_PER_REQ_DELIVERY, m=
ask_sh),\
         |  ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubp.h:193:2: note:=
 in expansion of macro 'HUBP_MASK_SH_LIST_DCN_VM'
     193 |  HUBP_MASK_SH_LIST_DCN_VM(mask_sh),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:606:3:=
 note: in expansion of macro 'HUBP_MASK_SH_LIST_DCN30'
     606 |   HUBP_MASK_SH_LIST_DCN30(__SHIFT)
         |   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_3_sh_mask.h:7=
608:111: warning: initialized field overwritten [-Woverride-init]
    7608 | #define HUBPREQ0_DCN_CUR0_TTU_CNTL0__QoS_LEVEL_FIXED__SHIFT     =
                                              0x18
         |                                                                 =
                                              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_hubp.h:253=
:16: note: in expansion of macro 'HUBPREQ0_DCN_CUR0_TTU_CNTL0__QoS_LEVEL_FI=
XED__SHIFT'
     253 |  .field_name =3D reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_hubp.h:409=
:2: note: in expansion of macro 'HUBP_SF'
     409 |  HUBP_SF(HUBPREQ0_DCN_CUR0_TTU_CNTL0, QoS_LEVEL_FIXED, mask_sh),\
         |  ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubp.h:193:2: note:=
 in expansion of macro 'HUBP_MASK_SH_LIST_DCN_VM'
     193 |  HUBP_MASK_SH_LIST_DCN_VM(mask_sh),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:606:3:=
 note: in expansion of macro 'HUBP_MASK_SH_LIST_DCN30'
     606 |   HUBP_MASK_SH_LIST_DCN30(__SHIFT)
         |   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_3_sh_mask.h:7=
608:111: note: (near initialization for 'hubp_shift.QoS_LEVEL_FIXED')
    7608 | #define HUBPREQ0_DCN_CUR0_TTU_CNTL0__QoS_LEVEL_FIXED__SHIFT     =
                                              0x18
         |                                                                 =
                                              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_hubp.h:253=
:16: note: in expansion of macro 'HUBPREQ0_DCN_CUR0_TTU_CNTL0__QoS_LEVEL_FI=
XED__SHIFT'
     253 |  .field_name =3D reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_hubp.h:409=
:2: note: in expansion of macro 'HUBP_SF'
     409 |  HUBP_SF(HUBPREQ0_DCN_CUR0_TTU_CNTL0, QoS_LEVEL_FIXED, mask_sh),\
         |  ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubp.h:193:2: note:=
 in expansion of macro 'HUBP_MASK_SH_LIST_DCN_VM'
     193 |  HUBP_MASK_SH_LIST_DCN_VM(mask_sh),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:606:3:=
 note: in expansion of macro 'HUBP_MASK_SH_LIST_DCN30'
     606 |   HUBP_MASK_SH_LIST_DCN30(__SHIFT)
         |   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_3_sh_mask.h:7=
609:111: warning: initialized field overwritten [-Woverride-init]
    7609 | #define HUBPREQ0_DCN_CUR0_TTU_CNTL0__QoS_RAMP_DISABLE__SHIFT    =
                                              0x1c
         |                                                                 =
                                              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_hubp.h:253=
:16: note: in expansion of macro 'HUBPREQ0_DCN_CUR0_TTU_CNTL0__QoS_RAMP_DIS=
ABLE__SHIFT'
     253 |  .field_name =3D reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_hubp.h:410=
:2: note: in expansion of macro 'HUBP_SF'
     410 |  HUBP_SF(HUBPREQ0_DCN_CUR0_TTU_CNTL0, QoS_RAMP_DISABLE, mask_sh)=
,\
         |  ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubp.h:193:2: note:=
 in expansion of macro 'HUBP_MASK_SH_LIST_DCN_VM'
     193 |  HUBP_MASK_SH_LIST_DCN_VM(mask_sh),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:606:3:=
 note: in expansion of macro 'HUBP_MASK_SH_LIST_DCN30'
     606 |   HUBP_MASK_SH_LIST_DCN30(__SHIFT)
         |   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_3_sh_mask.h:7=
609:111: note: (near initialization for 'hubp_shift.QoS_RAMP_DISABLE')
    7609 | #define HUBPREQ0_DCN_CUR0_TTU_CNTL0__QoS_RAMP_DISABLE__SHIFT    =
                                              0x1c
         |                                                                 =
                                              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_hubp.h:253=
:16: note: in expansion of macro 'HUBPREQ0_DCN_CUR0_TTU_CNTL0__QoS_RAMP_DIS=
ABLE__SHIFT'
     253 |  .field_name =3D reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_hubp.h:410=
:2: note: in expansion of macro 'HUBP_SF'
     410 |  HUBP_SF(HUBPREQ0_DCN_CUR0_TTU_CNTL0, QoS_RAMP_DISABLE, mask_sh)=
,\
         |  ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubp.h:193:2: note:=
 in expansion of macro 'HUBP_MASK_SH_LIST_DCN_VM'
     193 |  HUBP_MASK_SH_LIST_DCN_VM(mask_sh),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:606:3:=
 note: in expansion of macro 'HUBP_MASK_SH_LIST_DCN30'
     606 |   HUBP_MASK_SH_LIST_DCN30(__SHIFT)
         |   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_3_sh_mask.h:7=
614:111: warning: initialized field overwritten [-Woverride-init]
    7614 | #define HUBPREQ0_DCN_CUR0_TTU_CNTL1__REFCYC_PER_REQ_DELIVERY_PRE=
__SHIFT                                       0x0
         |                                                                 =
                                              ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_hubp.h:253=
:16: note: in expansion of macro 'HUBPREQ0_DCN_CUR0_TTU_CNTL1__REFCYC_PER_R=
EQ_DELIVERY_PRE__SHIFT'
     253 |  .field_name =3D reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_hubp.h:411=
:2: note: in expansion of macro 'HUBP_SF'
     411 |  HUBP_SF(HUBPREQ0_DCN_CUR0_TTU_CNTL1, REFCYC_PER_REQ_DELIVERY_PR=
E, mask_sh)
         |  ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubp.h:193:2: note:=
 in expansion of macro 'HUBP_MASK_SH_LIST_DCN_VM'
     193 |  HUBP_MASK_SH_LIST_DCN_VM(mask_sh),\
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_init.c:30:6: warn=
ing: no previous prototype for 'dcn303_hw_sequencer_construct' [-Wmissing-p=
rototypes]
      30 | void dcn303_hw_sequencer_construct(struct dc *dc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +7607 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_3_sh_m=
ask.h

8198ace7a074de Aurabindo Pillai 2021-03-15  7387  =

8198ace7a074de Aurabindo Pillai 2021-03-15  7388  =

8198ace7a074de Aurabindo Pillai 2021-03-15  7389  // addressBlock: dce_dc_d=
cbubp0_dispdec_hubpreq_dispdec
8198ace7a074de Aurabindo Pillai 2021-03-15  7390  //HUBPREQ0_DCSURF_SURFACE=
_PITCH
8198ace7a074de Aurabindo Pillai 2021-03-15  7391  #define HUBPREQ0_DCSURF_S=
URFACE_PITCH__PITCH__SHIFT                                                 =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7392  #define HUBPREQ0_DCSURF_S=
URFACE_PITCH__META_PITCH__SHIFT                                            =
          0x10
8198ace7a074de Aurabindo Pillai 2021-03-15  7393  #define HUBPREQ0_DCSURF_S=
URFACE_PITCH__PITCH_MASK                                                   =
          0x00003FFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7394  #define HUBPREQ0_DCSURF_S=
URFACE_PITCH__META_PITCH_MASK                                              =
          0x3FFF0000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7395  //HUBPREQ0_DCSURF_SURFACE=
_PITCH_C
8198ace7a074de Aurabindo Pillai 2021-03-15  7396  #define HUBPREQ0_DCSURF_S=
URFACE_PITCH_C__PITCH_C__SHIFT                                             =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7397  #define HUBPREQ0_DCSURF_S=
URFACE_PITCH_C__META_PITCH_C__SHIFT                                        =
          0x10
8198ace7a074de Aurabindo Pillai 2021-03-15  7398  #define HUBPREQ0_DCSURF_S=
URFACE_PITCH_C__PITCH_C_MASK                                               =
          0x00003FFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7399  #define HUBPREQ0_DCSURF_S=
URFACE_PITCH_C__META_PITCH_C_MASK                                          =
          0x3FFF0000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7400  //HUBPREQ0_VMID_SETTINGS_0
8198ace7a074de Aurabindo Pillai 2021-03-15  7401  #define HUBPREQ0_VMID_SET=
TINGS_0__VMID__SHIFT                                                       =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7402  #define HUBPREQ0_VMID_SET=
TINGS_0__VMID_MASK                                                         =
          0x0000000FL
8198ace7a074de Aurabindo Pillai 2021-03-15  7403  //HUBPREQ0_DCSURF_PRIMARY=
_SURFACE_ADDRESS
8198ace7a074de Aurabindo Pillai 2021-03-15  7404  #define HUBPREQ0_DCSURF_P=
RIMARY_SURFACE_ADDRESS__PRIMARY_SURFACE_ADDRESS__SHIFT                     =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7405  #define HUBPREQ0_DCSURF_P=
RIMARY_SURFACE_ADDRESS__PRIMARY_SURFACE_ADDRESS_MASK                       =
          0xFFFFFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7406  //HUBPREQ0_DCSURF_PRIMARY=
_SURFACE_ADDRESS_HIGH
8198ace7a074de Aurabindo Pillai 2021-03-15  7407  #define HUBPREQ0_DCSURF_P=
RIMARY_SURFACE_ADDRESS_HIGH__PRIMARY_SURFACE_ADDRESS_HIGH__SHIFT           =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7408  #define HUBPREQ0_DCSURF_P=
RIMARY_SURFACE_ADDRESS_HIGH__PRIMARY_SURFACE_ADDRESS_HIGH_MASK             =
          0x0000FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7409  //HUBPREQ0_DCSURF_PRIMARY=
_SURFACE_ADDRESS_C
8198ace7a074de Aurabindo Pillai 2021-03-15  7410  #define HUBPREQ0_DCSURF_P=
RIMARY_SURFACE_ADDRESS_C__PRIMARY_SURFACE_ADDRESS_C__SHIFT                 =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7411  #define HUBPREQ0_DCSURF_P=
RIMARY_SURFACE_ADDRESS_C__PRIMARY_SURFACE_ADDRESS_C_MASK                   =
          0xFFFFFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7412  //HUBPREQ0_DCSURF_PRIMARY=
_SURFACE_ADDRESS_HIGH_C
8198ace7a074de Aurabindo Pillai 2021-03-15  7413  #define HUBPREQ0_DCSURF_P=
RIMARY_SURFACE_ADDRESS_HIGH_C__PRIMARY_SURFACE_ADDRESS_HIGH_C__SHIFT       =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7414  #define HUBPREQ0_DCSURF_P=
RIMARY_SURFACE_ADDRESS_HIGH_C__PRIMARY_SURFACE_ADDRESS_HIGH_C_MASK         =
          0x0000FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7415  //HUBPREQ0_DCSURF_SECONDA=
RY_SURFACE_ADDRESS
8198ace7a074de Aurabindo Pillai 2021-03-15  7416  #define HUBPREQ0_DCSURF_S=
ECONDARY_SURFACE_ADDRESS__SECONDARY_SURFACE_ADDRESS__SHIFT                 =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7417  #define HUBPREQ0_DCSURF_S=
ECONDARY_SURFACE_ADDRESS__SECONDARY_SURFACE_ADDRESS_MASK                   =
          0xFFFFFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7418  //HUBPREQ0_DCSURF_SECONDA=
RY_SURFACE_ADDRESS_HIGH
8198ace7a074de Aurabindo Pillai 2021-03-15  7419  #define HUBPREQ0_DCSURF_S=
ECONDARY_SURFACE_ADDRESS_HIGH__SECONDARY_SURFACE_ADDRESS_HIGH__SHIFT       =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7420  #define HUBPREQ0_DCSURF_S=
ECONDARY_SURFACE_ADDRESS_HIGH__SECONDARY_SURFACE_ADDRESS_HIGH_MASK         =
          0x0000FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7421  //HUBPREQ0_DCSURF_SECONDA=
RY_SURFACE_ADDRESS_C
8198ace7a074de Aurabindo Pillai 2021-03-15  7422  #define HUBPREQ0_DCSURF_S=
ECONDARY_SURFACE_ADDRESS_C__SECONDARY_SURFACE_ADDRESS_C__SHIFT             =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7423  #define HUBPREQ0_DCSURF_S=
ECONDARY_SURFACE_ADDRESS_C__SECONDARY_SURFACE_ADDRESS_C_MASK               =
          0xFFFFFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7424  //HUBPREQ0_DCSURF_SECONDA=
RY_SURFACE_ADDRESS_HIGH_C
8198ace7a074de Aurabindo Pillai 2021-03-15  7425  #define HUBPREQ0_DCSURF_S=
ECONDARY_SURFACE_ADDRESS_HIGH_C__SECONDARY_SURFACE_ADDRESS_HIGH_C__SHIFT   =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7426  #define HUBPREQ0_DCSURF_S=
ECONDARY_SURFACE_ADDRESS_HIGH_C__SECONDARY_SURFACE_ADDRESS_HIGH_C_MASK     =
          0x0000FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7427  //HUBPREQ0_DCSURF_PRIMARY=
_META_SURFACE_ADDRESS
8198ace7a074de Aurabindo Pillai 2021-03-15  7428  #define HUBPREQ0_DCSURF_P=
RIMARY_META_SURFACE_ADDRESS__PRIMARY_META_SURFACE_ADDRESS__SHIFT           =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7429  #define HUBPREQ0_DCSURF_P=
RIMARY_META_SURFACE_ADDRESS__PRIMARY_META_SURFACE_ADDRESS_MASK             =
          0xFFFFFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7430  //HUBPREQ0_DCSURF_PRIMARY=
_META_SURFACE_ADDRESS_HIGH
8198ace7a074de Aurabindo Pillai 2021-03-15  7431  #define HUBPREQ0_DCSURF_P=
RIMARY_META_SURFACE_ADDRESS_HIGH__PRIMARY_META_SURFACE_ADDRESS_HIGH__SHIFT =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7432  #define HUBPREQ0_DCSURF_P=
RIMARY_META_SURFACE_ADDRESS_HIGH__PRIMARY_META_SURFACE_ADDRESS_HIGH_MASK   =
          0x0000FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7433  //HUBPREQ0_DCSURF_PRIMARY=
_META_SURFACE_ADDRESS_C
8198ace7a074de Aurabindo Pillai 2021-03-15  7434  #define HUBPREQ0_DCSURF_P=
RIMARY_META_SURFACE_ADDRESS_C__PRIMARY_META_SURFACE_ADDRESS_C__SHIFT       =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7435  #define HUBPREQ0_DCSURF_P=
RIMARY_META_SURFACE_ADDRESS_C__PRIMARY_META_SURFACE_ADDRESS_C_MASK         =
          0xFFFFFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7436  //HUBPREQ0_DCSURF_PRIMARY=
_META_SURFACE_ADDRESS_HIGH_C
8198ace7a074de Aurabindo Pillai 2021-03-15  7437  #define HUBPREQ0_DCSURF_P=
RIMARY_META_SURFACE_ADDRESS_HIGH_C__PRIMARY_META_SURFACE_ADDRESS_HIGH_C__SH=
IFT       0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7438  #define HUBPREQ0_DCSURF_P=
RIMARY_META_SURFACE_ADDRESS_HIGH_C__PRIMARY_META_SURFACE_ADDRESS_HIGH_C_MAS=
K         0x0000FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7439  //HUBPREQ0_DCSURF_SECONDA=
RY_META_SURFACE_ADDRESS
8198ace7a074de Aurabindo Pillai 2021-03-15  7440  #define HUBPREQ0_DCSURF_S=
ECONDARY_META_SURFACE_ADDRESS__SECONDARY_META_SURFACE_ADDRESS__SHIFT       =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7441  #define HUBPREQ0_DCSURF_S=
ECONDARY_META_SURFACE_ADDRESS__SECONDARY_META_SURFACE_ADDRESS_MASK         =
          0xFFFFFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7442  //HUBPREQ0_DCSURF_SECONDA=
RY_META_SURFACE_ADDRESS_HIGH
8198ace7a074de Aurabindo Pillai 2021-03-15  7443  #define HUBPREQ0_DCSURF_S=
ECONDARY_META_SURFACE_ADDRESS_HIGH__SECONDARY_META_SURFACE_ADDRESS_HIGH__SH=
IFT       0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7444  #define HUBPREQ0_DCSURF_S=
ECONDARY_META_SURFACE_ADDRESS_HIGH__SECONDARY_META_SURFACE_ADDRESS_HIGH_MAS=
K         0x0000FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7445  //HUBPREQ0_DCSURF_SECONDA=
RY_META_SURFACE_ADDRESS_C
8198ace7a074de Aurabindo Pillai 2021-03-15  7446  #define HUBPREQ0_DCSURF_S=
ECONDARY_META_SURFACE_ADDRESS_C__SECONDARY_META_SURFACE_ADDRESS_C__SHIFT   =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7447  #define HUBPREQ0_DCSURF_S=
ECONDARY_META_SURFACE_ADDRESS_C__SECONDARY_META_SURFACE_ADDRESS_C_MASK     =
          0xFFFFFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7448  //HUBPREQ0_DCSURF_SECONDA=
RY_META_SURFACE_ADDRESS_HIGH_C
8198ace7a074de Aurabindo Pillai 2021-03-15  7449  #define HUBPREQ0_DCSURF_S=
ECONDARY_META_SURFACE_ADDRESS_HIGH_C__SECONDARY_META_SURFACE_ADDRESS_HIGH_C=
__SHIFT   0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7450  #define HUBPREQ0_DCSURF_S=
ECONDARY_META_SURFACE_ADDRESS_HIGH_C__SECONDARY_META_SURFACE_ADDRESS_HIGH_C=
_MASK     0x0000FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7451  //HUBPREQ0_DCSURF_SURFACE=
_CONTROL
8198ace7a074de Aurabindo Pillai 2021-03-15  7452  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__PRIMARY_SURFACE_TMZ__SHIFT                                 =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7453  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__PRIMARY_SURFACE_DCC_EN__SHIFT                              =
          0x1
8198ace7a074de Aurabindo Pillai 2021-03-15  7454  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__PRIMARY_SURFACE_DCC_IND_BLK__SHIFT                         =
          0x2
8198ace7a074de Aurabindo Pillai 2021-03-15  7455  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__PRIMARY_SURFACE_TMZ_C__SHIFT                               =
          0x4
8198ace7a074de Aurabindo Pillai 2021-03-15  7456  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__PRIMARY_SURFACE_DCC_IND_BLK_C__SHIFT                       =
          0x5
8198ace7a074de Aurabindo Pillai 2021-03-15  7457  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__SECONDARY_SURFACE_TMZ__SHIFT                               =
          0x8
8198ace7a074de Aurabindo Pillai 2021-03-15  7458  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__SECONDARY_SURFACE_DCC_EN__SHIFT                            =
          0x9
8198ace7a074de Aurabindo Pillai 2021-03-15  7459  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__SECONDARY_SURFACE_DCC_IND_BLK__SHIFT                       =
          0xa
8198ace7a074de Aurabindo Pillai 2021-03-15  7460  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__SECONDARY_SURFACE_TMZ_C__SHIFT                             =
          0xc
8198ace7a074de Aurabindo Pillai 2021-03-15  7461  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__SECONDARY_SURFACE_DCC_IND_BLK_C__SHIFT                     =
          0xd
8198ace7a074de Aurabindo Pillai 2021-03-15  7462  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__PRIMARY_META_SURFACE_TMZ__SHIFT                            =
          0x10
8198ace7a074de Aurabindo Pillai 2021-03-15  7463  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__PRIMARY_META_SURFACE_TMZ_C__SHIFT                          =
          0x11
8198ace7a074de Aurabindo Pillai 2021-03-15  7464  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__SECONDARY_META_SURFACE_TMZ__SHIFT                          =
          0x12
8198ace7a074de Aurabindo Pillai 2021-03-15  7465  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__SECONDARY_META_SURFACE_TMZ_C__SHIFT                        =
          0x13
8198ace7a074de Aurabindo Pillai 2021-03-15  7466  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__PRIMARY_SURFACE_TMZ_MASK                                   =
          0x00000001L
8198ace7a074de Aurabindo Pillai 2021-03-15  7467  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__PRIMARY_SURFACE_DCC_EN_MASK                                =
          0x00000002L
8198ace7a074de Aurabindo Pillai 2021-03-15  7468  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__PRIMARY_SURFACE_DCC_IND_BLK_MASK                           =
          0x0000000CL
8198ace7a074de Aurabindo Pillai 2021-03-15  7469  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__PRIMARY_SURFACE_TMZ_C_MASK                                 =
          0x00000010L
8198ace7a074de Aurabindo Pillai 2021-03-15  7470  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__PRIMARY_SURFACE_DCC_IND_BLK_C_MASK                         =
          0x00000060L
8198ace7a074de Aurabindo Pillai 2021-03-15  7471  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__SECONDARY_SURFACE_TMZ_MASK                                 =
          0x00000100L
8198ace7a074de Aurabindo Pillai 2021-03-15  7472  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__SECONDARY_SURFACE_DCC_EN_MASK                              =
          0x00000200L
8198ace7a074de Aurabindo Pillai 2021-03-15  7473  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__SECONDARY_SURFACE_DCC_IND_BLK_MASK                         =
          0x00000C00L
8198ace7a074de Aurabindo Pillai 2021-03-15  7474  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__SECONDARY_SURFACE_TMZ_C_MASK                               =
          0x00001000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7475  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__SECONDARY_SURFACE_DCC_IND_BLK_C_MASK                       =
          0x00006000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7476  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__PRIMARY_META_SURFACE_TMZ_MASK                              =
          0x00010000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7477  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__PRIMARY_META_SURFACE_TMZ_C_MASK                            =
          0x00020000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7478  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__SECONDARY_META_SURFACE_TMZ_MASK                            =
          0x00040000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7479  #define HUBPREQ0_DCSURF_S=
URFACE_CONTROL__SECONDARY_META_SURFACE_TMZ_C_MASK                          =
          0x00080000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7480  //HUBPREQ0_DCSURF_FLIP_CO=
NTROL
8198ace7a074de Aurabindo Pillai 2021-03-15  7481  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_UPDATE_LOCK__SHIFT                                    =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7482  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_TYPE__SHIFT                                      =
          0x1
8198ace7a074de Aurabindo Pillai 2021-03-15  7483  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_VUPDATE_SKIP_NUM__SHIFT                          =
          0x4
8198ace7a074de Aurabindo Pillai 2021-03-15  7484  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_PENDING__SHIFT                                   =
          0x8
8198ace7a074de Aurabindo Pillai 2021-03-15  7485  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__HUBPREQ_MASTER_UPDATE_LOCK_STATUS__SHIFT                      =
          0x9
8198ace7a074de Aurabindo Pillai 2021-03-15  7486  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_MODE_FOR_STEREOSYNC__SHIFT                       =
          0xc
8198ace7a074de Aurabindo Pillai 2021-03-15  7487  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_IN_STEREOSYNC__SHIFT                             =
          0x10
8198ace7a074de Aurabindo Pillai 2021-03-15  7488  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_STEREO_SELECT_DISABLE__SHIFT                     =
          0x11
8198ace7a074de Aurabindo Pillai 2021-03-15  7489  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_STEREO_SELECT_POLARITY__SHIFT                    =
          0x12
8198ace7a074de Aurabindo Pillai 2021-03-15  7490  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_PENDING_DELAY__SHIFT                             =
          0x14
8198ace7a074de Aurabindo Pillai 2021-03-15  7491  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_UPDATE_LOCK_MASK                                      =
          0x00000001L
8198ace7a074de Aurabindo Pillai 2021-03-15  7492  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_TYPE_MASK                                        =
          0x00000002L
8198ace7a074de Aurabindo Pillai 2021-03-15  7493  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_VUPDATE_SKIP_NUM_MASK                            =
          0x000000F0L
8198ace7a074de Aurabindo Pillai 2021-03-15  7494  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_PENDING_MASK                                     =
          0x00000100L
8198ace7a074de Aurabindo Pillai 2021-03-15  7495  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__HUBPREQ_MASTER_UPDATE_LOCK_STATUS_MASK                        =
          0x00000200L
8198ace7a074de Aurabindo Pillai 2021-03-15  7496  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_MODE_FOR_STEREOSYNC_MASK                         =
          0x00003000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7497  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_IN_STEREOSYNC_MASK                               =
          0x00010000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7498  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_STEREO_SELECT_DISABLE_MASK                       =
          0x00020000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7499  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_STEREO_SELECT_POLARITY_MASK                      =
          0x00040000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7500  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL__SURFACE_FLIP_PENDING_DELAY_MASK                               =
          0x3FF00000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7501  //HUBPREQ0_DCSURF_FLIP_CO=
NTROL2
8198ace7a074de Aurabindo Pillai 2021-03-15  7502  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL2__SURFACE_FLIP_PENDING_MIN_TIME__SHIFT                         =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7503  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL2__SURFACE_GSL_ENABLE__SHIFT                                    =
          0x8
8198ace7a074de Aurabindo Pillai 2021-03-15  7504  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL2__SURFACE_GSL_MASK__SHIFT                                      =
          0x9
8198ace7a074de Aurabindo Pillai 2021-03-15  7505  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL2__SURFACE_TRIPLE_BUFFER_ENABLE__SHIFT                          =
          0xa
8198ace7a074de Aurabindo Pillai 2021-03-15  7506  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL2__SURFACE_INUSE_RAED_NO_LATCH__SHIFT                           =
          0xc
8198ace7a074de Aurabindo Pillai 2021-03-15  7507  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL2__SURFACE_FLIP_PENDING_MIN_TIME_MASK                           =
          0x000000FFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7508  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL2__SURFACE_GSL_ENABLE_MASK                                      =
          0x00000100L
8198ace7a074de Aurabindo Pillai 2021-03-15  7509  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL2__SURFACE_GSL_MASK_MASK                                        =
          0x00000200L
8198ace7a074de Aurabindo Pillai 2021-03-15  7510  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL2__SURFACE_TRIPLE_BUFFER_ENABLE_MASK                            =
          0x00000400L
8198ace7a074de Aurabindo Pillai 2021-03-15  7511  #define HUBPREQ0_DCSURF_F=
LIP_CONTROL2__SURFACE_INUSE_RAED_NO_LATCH_MASK                             =
          0x00001000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7512  //HUBPREQ0_DCSURF_SURFACE=
_FLIP_INTERRUPT
8198ace7a074de Aurabindo Pillai 2021-03-15  7513  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_INT_MASK__SHIFT                        =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7514  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_INT_TYPE__SHIFT                        =
          0x1
8198ace7a074de Aurabindo Pillai 2021-03-15  7515  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_AWAY_INT_MASK__SHIFT                   =
          0x2
8198ace7a074de Aurabindo Pillai 2021-03-15  7516  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_AWAY_INT_TYPE__SHIFT                   =
          0x3
8198ace7a074de Aurabindo Pillai 2021-03-15  7517  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_CLEAR__SHIFT                           =
          0x8
8198ace7a074de Aurabindo Pillai 2021-03-15  7518  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_AWAY_CLEAR__SHIFT                      =
          0x9
8198ace7a074de Aurabindo Pillai 2021-03-15  7519  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_OCCURRED__SHIFT                        =
          0x10
8198ace7a074de Aurabindo Pillai 2021-03-15  7520  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_INT_STATUS__SHIFT                      =
          0x11
8198ace7a074de Aurabindo Pillai 2021-03-15  7521  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_AWAY_OCCURRED__SHIFT                   =
          0x12
8198ace7a074de Aurabindo Pillai 2021-03-15  7522  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_AWAY_INT_STATUS__SHIFT                 =
          0x13
8198ace7a074de Aurabindo Pillai 2021-03-15  7523  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_INT_MASK_MASK                          =
          0x00000001L
8198ace7a074de Aurabindo Pillai 2021-03-15  7524  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_INT_TYPE_MASK                          =
          0x00000002L
8198ace7a074de Aurabindo Pillai 2021-03-15  7525  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_AWAY_INT_MASK_MASK                     =
          0x00000004L
8198ace7a074de Aurabindo Pillai 2021-03-15  7526  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_AWAY_INT_TYPE_MASK                     =
          0x00000008L
8198ace7a074de Aurabindo Pillai 2021-03-15  7527  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_CLEAR_MASK                             =
          0x00000100L
8198ace7a074de Aurabindo Pillai 2021-03-15  7528  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_AWAY_CLEAR_MASK                        =
          0x00000200L
8198ace7a074de Aurabindo Pillai 2021-03-15  7529  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_OCCURRED_MASK                          =
          0x00010000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7530  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_INT_STATUS_MASK                        =
          0x00020000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7531  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_AWAY_OCCURRED_MASK                     =
          0x00040000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7532  #define HUBPREQ0_DCSURF_S=
URFACE_FLIP_INTERRUPT__SURFACE_FLIP_AWAY_INT_STATUS_MASK                   =
          0x00080000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7533  //HUBPREQ0_DCSURF_SURFACE=
_INUSE
8198ace7a074de Aurabindo Pillai 2021-03-15  7534  #define HUBPREQ0_DCSURF_S=
URFACE_INUSE__SURFACE_INUSE_ADDRESS__SHIFT                                 =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7535  #define HUBPREQ0_DCSURF_S=
URFACE_INUSE__SURFACE_INUSE_ADDRESS_MASK                                   =
          0xFFFFFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7536  //HUBPREQ0_DCSURF_SURFACE=
_INUSE_HIGH
8198ace7a074de Aurabindo Pillai 2021-03-15  7537  #define HUBPREQ0_DCSURF_S=
URFACE_INUSE_HIGH__SURFACE_INUSE_ADDRESS_HIGH__SHIFT                       =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7538  #define HUBPREQ0_DCSURF_S=
URFACE_INUSE_HIGH__SURFACE_INUSE_VMID__SHIFT                               =
          0x1c
8198ace7a074de Aurabindo Pillai 2021-03-15  7539  #define HUBPREQ0_DCSURF_S=
URFACE_INUSE_HIGH__SURFACE_INUSE_ADDRESS_HIGH_MASK                         =
          0x0000FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7540  #define HUBPREQ0_DCSURF_S=
URFACE_INUSE_HIGH__SURFACE_INUSE_VMID_MASK                                 =
          0xF0000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7541  //HUBPREQ0_DCSURF_SURFACE=
_INUSE_C
8198ace7a074de Aurabindo Pillai 2021-03-15  7542  #define HUBPREQ0_DCSURF_S=
URFACE_INUSE_C__SURFACE_INUSE_ADDRESS_C__SHIFT                             =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7543  #define HUBPREQ0_DCSURF_S=
URFACE_INUSE_C__SURFACE_INUSE_ADDRESS_C_MASK                               =
          0xFFFFFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7544  //HUBPREQ0_DCSURF_SURFACE=
_INUSE_HIGH_C
8198ace7a074de Aurabindo Pillai 2021-03-15  7545  #define HUBPREQ0_DCSURF_S=
URFACE_INUSE_HIGH_C__SURFACE_INUSE_ADDRESS_HIGH_C__SHIFT                   =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7546  #define HUBPREQ0_DCSURF_S=
URFACE_INUSE_HIGH_C__SURFACE_INUSE_VMID_C__SHIFT                           =
          0x1c
8198ace7a074de Aurabindo Pillai 2021-03-15  7547  #define HUBPREQ0_DCSURF_S=
URFACE_INUSE_HIGH_C__SURFACE_INUSE_ADDRESS_HIGH_C_MASK                     =
          0x0000FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7548  #define HUBPREQ0_DCSURF_S=
URFACE_INUSE_HIGH_C__SURFACE_INUSE_VMID_C_MASK                             =
          0xF0000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7549  //HUBPREQ0_DCSURF_SURFACE=
_EARLIEST_INUSE
8198ace7a074de Aurabindo Pillai 2021-03-15  7550  #define HUBPREQ0_DCSURF_S=
URFACE_EARLIEST_INUSE__SURFACE_EARLIEST_INUSE_ADDRESS__SHIFT               =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7551  #define HUBPREQ0_DCSURF_S=
URFACE_EARLIEST_INUSE__SURFACE_EARLIEST_INUSE_ADDRESS_MASK                 =
          0xFFFFFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7552  //HUBPREQ0_DCSURF_SURFACE=
_EARLIEST_INUSE_HIGH
8198ace7a074de Aurabindo Pillai 2021-03-15  7553  #define HUBPREQ0_DCSURF_S=
URFACE_EARLIEST_INUSE_HIGH__SURFACE_EARLIEST_INUSE_ADDRESS_HIGH__SHIFT     =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7554  #define HUBPREQ0_DCSURF_S=
URFACE_EARLIEST_INUSE_HIGH__SURFACE_EARLIEST_INUSE_VMID__SHIFT             =
          0x1c
8198ace7a074de Aurabindo Pillai 2021-03-15  7555  #define HUBPREQ0_DCSURF_S=
URFACE_EARLIEST_INUSE_HIGH__SURFACE_EARLIEST_INUSE_ADDRESS_HIGH_MASK       =
          0x0000FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7556  #define HUBPREQ0_DCSURF_S=
URFACE_EARLIEST_INUSE_HIGH__SURFACE_EARLIEST_INUSE_VMID_MASK               =
          0xF0000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7557  //HUBPREQ0_DCSURF_SURFACE=
_EARLIEST_INUSE_C
8198ace7a074de Aurabindo Pillai 2021-03-15  7558  #define HUBPREQ0_DCSURF_S=
URFACE_EARLIEST_INUSE_C__SURFACE_EARLIEST_INUSE_ADDRESS_C__SHIFT           =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7559  #define HUBPREQ0_DCSURF_S=
URFACE_EARLIEST_INUSE_C__SURFACE_EARLIEST_INUSE_ADDRESS_C_MASK             =
          0xFFFFFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7560  //HUBPREQ0_DCSURF_SURFACE=
_EARLIEST_INUSE_HIGH_C
8198ace7a074de Aurabindo Pillai 2021-03-15  7561  #define HUBPREQ0_DCSURF_S=
URFACE_EARLIEST_INUSE_HIGH_C__SURFACE_EARLIEST_INUSE_ADDRESS_HIGH_C__SHIFT =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7562  #define HUBPREQ0_DCSURF_S=
URFACE_EARLIEST_INUSE_HIGH_C__SURFACE_EARLIEST_INUSE_VMID_C__SHIFT         =
          0x1c
8198ace7a074de Aurabindo Pillai 2021-03-15  7563  #define HUBPREQ0_DCSURF_S=
URFACE_EARLIEST_INUSE_HIGH_C__SURFACE_EARLIEST_INUSE_ADDRESS_HIGH_C_MASK   =
          0x0000FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7564  #define HUBPREQ0_DCSURF_S=
URFACE_EARLIEST_INUSE_HIGH_C__SURFACE_EARLIEST_INUSE_VMID_C_MASK           =
          0xF0000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7565  //HUBPREQ0_DCN_EXPANSION_=
MODE
8198ace7a074de Aurabindo Pillai 2021-03-15  7566  #define HUBPREQ0_DCN_EXPA=
NSION_MODE__DRQ_EXPANSION_MODE__SHIFT                                      =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7567  #define HUBPREQ0_DCN_EXPA=
NSION_MODE__CRQ_EXPANSION_MODE__SHIFT                                      =
          0x2
8198ace7a074de Aurabindo Pillai 2021-03-15  7568  #define HUBPREQ0_DCN_EXPA=
NSION_MODE__MRQ_EXPANSION_MODE__SHIFT                                      =
          0x4
8198ace7a074de Aurabindo Pillai 2021-03-15  7569  #define HUBPREQ0_DCN_EXPA=
NSION_MODE__PRQ_EXPANSION_MODE__SHIFT                                      =
          0x6
8198ace7a074de Aurabindo Pillai 2021-03-15  7570  #define HUBPREQ0_DCN_EXPA=
NSION_MODE__DRQ_EXPANSION_MODE_MASK                                        =
          0x00000003L
8198ace7a074de Aurabindo Pillai 2021-03-15  7571  #define HUBPREQ0_DCN_EXPA=
NSION_MODE__CRQ_EXPANSION_MODE_MASK                                        =
          0x0000000CL
8198ace7a074de Aurabindo Pillai 2021-03-15  7572  #define HUBPREQ0_DCN_EXPA=
NSION_MODE__MRQ_EXPANSION_MODE_MASK                                        =
          0x00000030L
8198ace7a074de Aurabindo Pillai 2021-03-15  7573  #define HUBPREQ0_DCN_EXPA=
NSION_MODE__PRQ_EXPANSION_MODE_MASK                                        =
          0x000000C0L
8198ace7a074de Aurabindo Pillai 2021-03-15  7574  //HUBPREQ0_DCN_TTU_QOS_WM
8198ace7a074de Aurabindo Pillai 2021-03-15  7575  #define HUBPREQ0_DCN_TTU_=
QOS_WM__QoS_LEVEL_LOW_WM__SHIFT                                            =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7576  #define HUBPREQ0_DCN_TTU_=
QOS_WM__QoS_LEVEL_HIGH_WM__SHIFT                                           =
          0x10
8198ace7a074de Aurabindo Pillai 2021-03-15  7577  #define HUBPREQ0_DCN_TTU_=
QOS_WM__QoS_LEVEL_LOW_WM_MASK                                              =
          0x00003FFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7578  #define HUBPREQ0_DCN_TTU_=
QOS_WM__QoS_LEVEL_HIGH_WM_MASK                                             =
          0x3FFF0000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7579  //HUBPREQ0_DCN_GLOBAL_TTU=
_CNTL
8198ace7a074de Aurabindo Pillai 2021-03-15  7580  #define HUBPREQ0_DCN_GLOB=
AL_TTU_CNTL__MIN_TTU_VBLANK__SHIFT                                         =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7581  #define HUBPREQ0_DCN_GLOB=
AL_TTU_CNTL__ROW_TTU_MODE__SHIFT                                           =
          0x1b
8198ace7a074de Aurabindo Pillai 2021-03-15  7582  #define HUBPREQ0_DCN_GLOB=
AL_TTU_CNTL__QoS_LEVEL_FLIP__SHIFT                                         =
          0x1c
8198ace7a074de Aurabindo Pillai 2021-03-15  7583  #define HUBPREQ0_DCN_GLOB=
AL_TTU_CNTL__MIN_TTU_VBLANK_MASK                                           =
          0x00FFFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7584  #define HUBPREQ0_DCN_GLOB=
AL_TTU_CNTL__ROW_TTU_MODE_MASK                                             =
          0x08000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7585  #define HUBPREQ0_DCN_GLOB=
AL_TTU_CNTL__QoS_LEVEL_FLIP_MASK                                           =
          0xF0000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7586  //HUBPREQ0_DCN_SURF0_TTU_=
CNTL0
8198ace7a074de Aurabindo Pillai 2021-03-15  7587  #define HUBPREQ0_DCN_SURF=
0_TTU_CNTL0__REFCYC_PER_REQ_DELIVERY__SHIFT                                =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7588  #define HUBPREQ0_DCN_SURF=
0_TTU_CNTL0__QoS_LEVEL_FIXED__SHIFT                                        =
          0x18
8198ace7a074de Aurabindo Pillai 2021-03-15  7589  #define HUBPREQ0_DCN_SURF=
0_TTU_CNTL0__QoS_RAMP_DISABLE__SHIFT                                       =
          0x1c
8198ace7a074de Aurabindo Pillai 2021-03-15  7590  #define HUBPREQ0_DCN_SURF=
0_TTU_CNTL0__REFCYC_PER_REQ_DELIVERY_MASK                                  =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7591  #define HUBPREQ0_DCN_SURF=
0_TTU_CNTL0__QoS_LEVEL_FIXED_MASK                                          =
          0x0F000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7592  #define HUBPREQ0_DCN_SURF=
0_TTU_CNTL0__QoS_RAMP_DISABLE_MASK                                         =
          0x10000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7593  //HUBPREQ0_DCN_SURF0_TTU_=
CNTL1
8198ace7a074de Aurabindo Pillai 2021-03-15  7594  #define HUBPREQ0_DCN_SURF=
0_TTU_CNTL1__REFCYC_PER_REQ_DELIVERY_PRE__SHIFT                            =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7595  #define HUBPREQ0_DCN_SURF=
0_TTU_CNTL1__REFCYC_PER_REQ_DELIVERY_PRE_MASK                              =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7596  //HUBPREQ0_DCN_SURF1_TTU_=
CNTL0
8198ace7a074de Aurabindo Pillai 2021-03-15  7597  #define HUBPREQ0_DCN_SURF=
1_TTU_CNTL0__REFCYC_PER_REQ_DELIVERY__SHIFT                                =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7598  #define HUBPREQ0_DCN_SURF=
1_TTU_CNTL0__QoS_LEVEL_FIXED__SHIFT                                        =
          0x18
8198ace7a074de Aurabindo Pillai 2021-03-15  7599  #define HUBPREQ0_DCN_SURF=
1_TTU_CNTL0__QoS_RAMP_DISABLE__SHIFT                                       =
          0x1c
8198ace7a074de Aurabindo Pillai 2021-03-15  7600  #define HUBPREQ0_DCN_SURF=
1_TTU_CNTL0__REFCYC_PER_REQ_DELIVERY_MASK                                  =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7601  #define HUBPREQ0_DCN_SURF=
1_TTU_CNTL0__QoS_LEVEL_FIXED_MASK                                          =
          0x0F000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7602  #define HUBPREQ0_DCN_SURF=
1_TTU_CNTL0__QoS_RAMP_DISABLE_MASK                                         =
          0x10000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7603  //HUBPREQ0_DCN_SURF1_TTU_=
CNTL1
8198ace7a074de Aurabindo Pillai 2021-03-15  7604  #define HUBPREQ0_DCN_SURF=
1_TTU_CNTL1__REFCYC_PER_REQ_DELIVERY_PRE__SHIFT                            =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7605  #define HUBPREQ0_DCN_SURF=
1_TTU_CNTL1__REFCYC_PER_REQ_DELIVERY_PRE_MASK                              =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7606  //HUBPREQ0_DCN_CUR0_TTU_C=
NTL0
8198ace7a074de Aurabindo Pillai 2021-03-15 @7607  #define HUBPREQ0_DCN_CUR0=
_TTU_CNTL0__REFCYC_PER_REQ_DELIVERY__SHIFT                                 =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7608  #define HUBPREQ0_DCN_CUR0=
_TTU_CNTL0__QoS_LEVEL_FIXED__SHIFT                                         =
          0x18
8198ace7a074de Aurabindo Pillai 2021-03-15  7609  #define HUBPREQ0_DCN_CUR0=
_TTU_CNTL0__QoS_RAMP_DISABLE__SHIFT                                        =
          0x1c
8198ace7a074de Aurabindo Pillai 2021-03-15  7610  #define HUBPREQ0_DCN_CUR0=
_TTU_CNTL0__REFCYC_PER_REQ_DELIVERY_MASK                                   =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7611  #define HUBPREQ0_DCN_CUR0=
_TTU_CNTL0__QoS_LEVEL_FIXED_MASK                                           =
          0x0F000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7612  #define HUBPREQ0_DCN_CUR0=
_TTU_CNTL0__QoS_RAMP_DISABLE_MASK                                          =
          0x10000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7613  //HUBPREQ0_DCN_CUR0_TTU_C=
NTL1
8198ace7a074de Aurabindo Pillai 2021-03-15  7614  #define HUBPREQ0_DCN_CUR0=
_TTU_CNTL1__REFCYC_PER_REQ_DELIVERY_PRE__SHIFT                             =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7615  #define HUBPREQ0_DCN_CUR0=
_TTU_CNTL1__REFCYC_PER_REQ_DELIVERY_PRE_MASK                               =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7616  //HUBPREQ0_DCN_CUR1_TTU_C=
NTL0
8198ace7a074de Aurabindo Pillai 2021-03-15  7617  #define HUBPREQ0_DCN_CUR1=
_TTU_CNTL0__REFCYC_PER_REQ_DELIVERY__SHIFT                                 =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7618  #define HUBPREQ0_DCN_CUR1=
_TTU_CNTL0__QoS_LEVEL_FIXED__SHIFT                                         =
          0x18
8198ace7a074de Aurabindo Pillai 2021-03-15  7619  #define HUBPREQ0_DCN_CUR1=
_TTU_CNTL0__QoS_RAMP_DISABLE__SHIFT                                        =
          0x1c
8198ace7a074de Aurabindo Pillai 2021-03-15  7620  #define HUBPREQ0_DCN_CUR1=
_TTU_CNTL0__REFCYC_PER_REQ_DELIVERY_MASK                                   =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7621  #define HUBPREQ0_DCN_CUR1=
_TTU_CNTL0__QoS_LEVEL_FIXED_MASK                                           =
          0x0F000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7622  #define HUBPREQ0_DCN_CUR1=
_TTU_CNTL0__QoS_RAMP_DISABLE_MASK                                          =
          0x10000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7623  //HUBPREQ0_DCN_CUR1_TTU_C=
NTL1
8198ace7a074de Aurabindo Pillai 2021-03-15  7624  #define HUBPREQ0_DCN_CUR1=
_TTU_CNTL1__REFCYC_PER_REQ_DELIVERY_PRE__SHIFT                             =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7625  #define HUBPREQ0_DCN_CUR1=
_TTU_CNTL1__REFCYC_PER_REQ_DELIVERY_PRE_MASK                               =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7626  //HUBPREQ0_DCN_DMDATA_VM_=
CNTL
8198ace7a074de Aurabindo Pillai 2021-03-15  7627  #define HUBPREQ0_DCN_DMDA=
TA_VM_CNTL__REFCYC_PER_VM_DMDATA__SHIFT                                    =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7628  #define HUBPREQ0_DCN_DMDA=
TA_VM_CNTL__DMDATA_VM_FAULT_STATUS__SHIFT                                  =
          0x10
8198ace7a074de Aurabindo Pillai 2021-03-15  7629  #define HUBPREQ0_DCN_DMDA=
TA_VM_CNTL__DMDATA_VM_FAULT_STATUS_CLEAR__SHIFT                            =
          0x14
8198ace7a074de Aurabindo Pillai 2021-03-15  7630  #define HUBPREQ0_DCN_DMDA=
TA_VM_CNTL__DMDATA_VM_UNDERFLOW_STATUS__SHIFT                              =
          0x18
8198ace7a074de Aurabindo Pillai 2021-03-15  7631  #define HUBPREQ0_DCN_DMDA=
TA_VM_CNTL__DMDATA_VM_LATE_STATUS__SHIFT                                   =
          0x19
8198ace7a074de Aurabindo Pillai 2021-03-15  7632  #define HUBPREQ0_DCN_DMDA=
TA_VM_CNTL__DMDATA_VM_UNDERFLOW_STATUS_CLEAR__SHIFT                        =
          0x1a
8198ace7a074de Aurabindo Pillai 2021-03-15  7633  #define HUBPREQ0_DCN_DMDA=
TA_VM_CNTL__DMDATA_VM_DONE__SHIFT                                          =
          0x1f
8198ace7a074de Aurabindo Pillai 2021-03-15  7634  #define HUBPREQ0_DCN_DMDA=
TA_VM_CNTL__REFCYC_PER_VM_DMDATA_MASK                                      =
          0x0000FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7635  #define HUBPREQ0_DCN_DMDA=
TA_VM_CNTL__DMDATA_VM_FAULT_STATUS_MASK                                    =
          0x000F0000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7636  #define HUBPREQ0_DCN_DMDA=
TA_VM_CNTL__DMDATA_VM_FAULT_STATUS_CLEAR_MASK                              =
          0x00100000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7637  #define HUBPREQ0_DCN_DMDA=
TA_VM_CNTL__DMDATA_VM_UNDERFLOW_STATUS_MASK                                =
          0x01000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7638  #define HUBPREQ0_DCN_DMDA=
TA_VM_CNTL__DMDATA_VM_LATE_STATUS_MASK                                     =
          0x02000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7639  #define HUBPREQ0_DCN_DMDA=
TA_VM_CNTL__DMDATA_VM_UNDERFLOW_STATUS_CLEAR_MASK                          =
          0x04000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7640  #define HUBPREQ0_DCN_DMDA=
TA_VM_CNTL__DMDATA_VM_DONE_MASK                                            =
          0x80000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7641  //HUBPREQ0_DCN_VM_SYSTEM_=
APERTURE_LOW_ADDR
8198ace7a074de Aurabindo Pillai 2021-03-15  7642  #define HUBPREQ0_DCN_VM_S=
YSTEM_APERTURE_LOW_ADDR__MC_VM_SYSTEM_APERTURE_LOW_ADDR__SHIFT             =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7643  #define HUBPREQ0_DCN_VM_S=
YSTEM_APERTURE_LOW_ADDR__MC_VM_SYSTEM_APERTURE_LOW_ADDR_MASK               =
          0x3FFFFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7644  //HUBPREQ0_DCN_VM_SYSTEM_=
APERTURE_HIGH_ADDR
8198ace7a074de Aurabindo Pillai 2021-03-15  7645  #define HUBPREQ0_DCN_VM_S=
YSTEM_APERTURE_HIGH_ADDR__MC_VM_SYSTEM_APERTURE_HIGH_ADDR__SHIFT           =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7646  #define HUBPREQ0_DCN_VM_S=
YSTEM_APERTURE_HIGH_ADDR__MC_VM_SYSTEM_APERTURE_HIGH_ADDR_MASK             =
          0x3FFFFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7647  //HUBPREQ0_DCN_VM_MX_L1_T=
LB_CNTL
8198ace7a074de Aurabindo Pillai 2021-03-15  7648  #define HUBPREQ0_DCN_VM_M=
X_L1_TLB_CNTL__ENABLE_L1_TLB__SHIFT                                        =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7649  #define HUBPREQ0_DCN_VM_M=
X_L1_TLB_CNTL__SYSTEM_ACCESS_MODE__SHIFT                                   =
          0x3
8198ace7a074de Aurabindo Pillai 2021-03-15  7650  #define HUBPREQ0_DCN_VM_M=
X_L1_TLB_CNTL__SYSTEM_APERTURE_UNMAPPED_ACCESS__SHIFT                      =
          0x5
8198ace7a074de Aurabindo Pillai 2021-03-15  7651  #define HUBPREQ0_DCN_VM_M=
X_L1_TLB_CNTL__ENABLE_ADVANCED_DRIVER_MODEL__SHIFT                         =
          0x6
8198ace7a074de Aurabindo Pillai 2021-03-15  7652  #define HUBPREQ0_DCN_VM_M=
X_L1_TLB_CNTL__ENABLE_L1_TLB_MASK                                          =
          0x00000001L
8198ace7a074de Aurabindo Pillai 2021-03-15  7653  #define HUBPREQ0_DCN_VM_M=
X_L1_TLB_CNTL__SYSTEM_ACCESS_MODE_MASK                                     =
          0x00000018L
8198ace7a074de Aurabindo Pillai 2021-03-15  7654  #define HUBPREQ0_DCN_VM_M=
X_L1_TLB_CNTL__SYSTEM_APERTURE_UNMAPPED_ACCESS_MASK                        =
          0x00000020L
8198ace7a074de Aurabindo Pillai 2021-03-15  7655  #define HUBPREQ0_DCN_VM_M=
X_L1_TLB_CNTL__ENABLE_ADVANCED_DRIVER_MODEL_MASK                           =
          0x00000040L
8198ace7a074de Aurabindo Pillai 2021-03-15  7656  //HUBPREQ0_BLANK_OFFSET_0
8198ace7a074de Aurabindo Pillai 2021-03-15  7657  #define HUBPREQ0_BLANK_OF=
FSET_0__REFCYC_H_BLANK_END__SHIFT                                          =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7658  #define HUBPREQ0_BLANK_OF=
FSET_0__DLG_V_BLANK_END__SHIFT                                             =
          0x10
8198ace7a074de Aurabindo Pillai 2021-03-15  7659  #define HUBPREQ0_BLANK_OF=
FSET_0__REFCYC_H_BLANK_END_MASK                                            =
          0x00001FFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7660  #define HUBPREQ0_BLANK_OF=
FSET_0__DLG_V_BLANK_END_MASK                                               =
          0x7FFF0000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7661  //HUBPREQ0_BLANK_OFFSET_1
8198ace7a074de Aurabindo Pillai 2021-03-15  7662  #define HUBPREQ0_BLANK_OF=
FSET_1__MIN_DST_Y_NEXT_START__SHIFT                                        =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7663  #define HUBPREQ0_BLANK_OF=
FSET_1__MIN_DST_Y_NEXT_START_MASK                                          =
          0x0003FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7664  //HUBPREQ0_DST_DIMENSIONS
8198ace7a074de Aurabindo Pillai 2021-03-15  7665  #define HUBPREQ0_DST_DIME=
NSIONS__REFCYC_PER_HTOTAL__SHIFT                                           =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7666  #define HUBPREQ0_DST_DIME=
NSIONS__REFCYC_PER_HTOTAL_MASK                                             =
          0x001FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7667  //HUBPREQ0_DST_AFTER_SCAL=
ER
8198ace7a074de Aurabindo Pillai 2021-03-15  7668  #define HUBPREQ0_DST_AFTE=
R_SCALER__REFCYC_X_AFTER_SCALER__SHIFT                                     =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7669  #define HUBPREQ0_DST_AFTE=
R_SCALER__DST_Y_AFTER_SCALER__SHIFT                                        =
          0x10
8198ace7a074de Aurabindo Pillai 2021-03-15  7670  #define HUBPREQ0_DST_AFTE=
R_SCALER__REFCYC_X_AFTER_SCALER_MASK                                       =
          0x00001FFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7671  #define HUBPREQ0_DST_AFTE=
R_SCALER__DST_Y_AFTER_SCALER_MASK                                          =
          0x00070000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7672  //HUBPREQ0_PREFETCH_SETTI=
NGS
8198ace7a074de Aurabindo Pillai 2021-03-15  7673  #define HUBPREQ0_PREFETCH=
_SETTINGS__VRATIO_PREFETCH__SHIFT                                          =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7674  #define HUBPREQ0_PREFETCH=
_SETTINGS__DST_Y_PREFETCH__SHIFT                                           =
          0x18
8198ace7a074de Aurabindo Pillai 2021-03-15  7675  #define HUBPREQ0_PREFETCH=
_SETTINGS__VRATIO_PREFETCH_MASK                                            =
          0x003FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7676  #define HUBPREQ0_PREFETCH=
_SETTINGS__DST_Y_PREFETCH_MASK                                             =
          0xFF000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7677  //HUBPREQ0_PREFETCH_SETTI=
NGS_C
8198ace7a074de Aurabindo Pillai 2021-03-15  7678  #define HUBPREQ0_PREFETCH=
_SETTINGS_C__VRATIO_PREFETCH_C__SHIFT                                      =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7679  #define HUBPREQ0_PREFETCH=
_SETTINGS_C__VRATIO_PREFETCH_C_MASK                                        =
          0x003FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7680  //HUBPREQ0_VBLANK_PARAMET=
ERS_0
8198ace7a074de Aurabindo Pillai 2021-03-15  7681  #define HUBPREQ0_VBLANK_P=
ARAMETERS_0__DST_Y_PER_VM_VBLANK__SHIFT                                    =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7682  #define HUBPREQ0_VBLANK_P=
ARAMETERS_0__DST_Y_PER_ROW_VBLANK__SHIFT                                   =
          0x8
8198ace7a074de Aurabindo Pillai 2021-03-15  7683  #define HUBPREQ0_VBLANK_P=
ARAMETERS_0__DST_Y_PER_VM_VBLANK_MASK                                      =
          0x0000007FL
8198ace7a074de Aurabindo Pillai 2021-03-15  7684  #define HUBPREQ0_VBLANK_P=
ARAMETERS_0__DST_Y_PER_ROW_VBLANK_MASK                                     =
          0x00003F00L
8198ace7a074de Aurabindo Pillai 2021-03-15  7685  //HUBPREQ0_VBLANK_PARAMET=
ERS_1
8198ace7a074de Aurabindo Pillai 2021-03-15  7686  #define HUBPREQ0_VBLANK_P=
ARAMETERS_1__REFCYC_PER_PTE_GROUP_VBLANK_L__SHIFT                          =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7687  #define HUBPREQ0_VBLANK_P=
ARAMETERS_1__REFCYC_PER_PTE_GROUP_VBLANK_L_MASK                            =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7688  //HUBPREQ0_VBLANK_PARAMET=
ERS_2
8198ace7a074de Aurabindo Pillai 2021-03-15  7689  #define HUBPREQ0_VBLANK_P=
ARAMETERS_2__REFCYC_PER_PTE_GROUP_VBLANK_C__SHIFT                          =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7690  #define HUBPREQ0_VBLANK_P=
ARAMETERS_2__REFCYC_PER_PTE_GROUP_VBLANK_C_MASK                            =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7691  //HUBPREQ0_VBLANK_PARAMET=
ERS_3
8198ace7a074de Aurabindo Pillai 2021-03-15  7692  #define HUBPREQ0_VBLANK_P=
ARAMETERS_3__REFCYC_PER_META_CHUNK_VBLANK_L__SHIFT                         =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7693  #define HUBPREQ0_VBLANK_P=
ARAMETERS_3__REFCYC_PER_META_CHUNK_VBLANK_L_MASK                           =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7694  //HUBPREQ0_VBLANK_PARAMET=
ERS_4
8198ace7a074de Aurabindo Pillai 2021-03-15  7695  #define HUBPREQ0_VBLANK_P=
ARAMETERS_4__REFCYC_PER_META_CHUNK_VBLANK_C__SHIFT                         =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7696  #define HUBPREQ0_VBLANK_P=
ARAMETERS_4__REFCYC_PER_META_CHUNK_VBLANK_C_MASK                           =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7697  //HUBPREQ0_FLIP_PARAMETER=
S_0
8198ace7a074de Aurabindo Pillai 2021-03-15  7698  #define HUBPREQ0_FLIP_PAR=
AMETERS_0__DST_Y_PER_VM_FLIP__SHIFT                                        =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7699  #define HUBPREQ0_FLIP_PAR=
AMETERS_0__DST_Y_PER_ROW_FLIP__SHIFT                                       =
          0x8
8198ace7a074de Aurabindo Pillai 2021-03-15  7700  #define HUBPREQ0_FLIP_PAR=
AMETERS_0__DST_Y_PER_VM_FLIP_MASK                                          =
          0x0000007FL
8198ace7a074de Aurabindo Pillai 2021-03-15  7701  #define HUBPREQ0_FLIP_PAR=
AMETERS_0__DST_Y_PER_ROW_FLIP_MASK                                         =
          0x00003F00L
8198ace7a074de Aurabindo Pillai 2021-03-15  7702  //HUBPREQ0_FLIP_PARAMETER=
S_1
8198ace7a074de Aurabindo Pillai 2021-03-15  7703  #define HUBPREQ0_FLIP_PAR=
AMETERS_1__REFCYC_PER_PTE_GROUP_FLIP_L__SHIFT                              =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7704  #define HUBPREQ0_FLIP_PAR=
AMETERS_1__REFCYC_PER_PTE_GROUP_FLIP_L_MASK                                =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7705  //HUBPREQ0_FLIP_PARAMETER=
S_2
8198ace7a074de Aurabindo Pillai 2021-03-15  7706  #define HUBPREQ0_FLIP_PAR=
AMETERS_2__REFCYC_PER_META_CHUNK_FLIP_L__SHIFT                             =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7707  #define HUBPREQ0_FLIP_PAR=
AMETERS_2__REFCYC_PER_META_CHUNK_FLIP_L_MASK                               =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7708  //HUBPREQ0_NOM_PARAMETERS=
_0
8198ace7a074de Aurabindo Pillai 2021-03-15  7709  #define HUBPREQ0_NOM_PARA=
METERS_0__DST_Y_PER_PTE_ROW_NOM_L__SHIFT                                   =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7710  #define HUBPREQ0_NOM_PARA=
METERS_0__DST_Y_PER_PTE_ROW_NOM_L_MASK                                     =
          0x0001FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7711  //HUBPREQ0_NOM_PARAMETERS=
_1
8198ace7a074de Aurabindo Pillai 2021-03-15  7712  #define HUBPREQ0_NOM_PARA=
METERS_1__REFCYC_PER_PTE_GROUP_NOM_L__SHIFT                                =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7713  #define HUBPREQ0_NOM_PARA=
METERS_1__REFCYC_PER_PTE_GROUP_NOM_L_MASK                                  =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7714  //HUBPREQ0_NOM_PARAMETERS=
_2
8198ace7a074de Aurabindo Pillai 2021-03-15  7715  #define HUBPREQ0_NOM_PARA=
METERS_2__DST_Y_PER_PTE_ROW_NOM_C__SHIFT                                   =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7716  #define HUBPREQ0_NOM_PARA=
METERS_2__DST_Y_PER_PTE_ROW_NOM_C_MASK                                     =
          0x0001FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7717  //HUBPREQ0_NOM_PARAMETERS=
_3
8198ace7a074de Aurabindo Pillai 2021-03-15  7718  #define HUBPREQ0_NOM_PARA=
METERS_3__REFCYC_PER_PTE_GROUP_NOM_C__SHIFT                                =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7719  #define HUBPREQ0_NOM_PARA=
METERS_3__REFCYC_PER_PTE_GROUP_NOM_C_MASK                                  =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7720  //HUBPREQ0_NOM_PARAMETERS=
_4
8198ace7a074de Aurabindo Pillai 2021-03-15  7721  #define HUBPREQ0_NOM_PARA=
METERS_4__DST_Y_PER_META_ROW_NOM_L__SHIFT                                  =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7722  #define HUBPREQ0_NOM_PARA=
METERS_4__DST_Y_PER_META_ROW_NOM_L_MASK                                    =
          0x0001FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7723  //HUBPREQ0_NOM_PARAMETERS=
_5
8198ace7a074de Aurabindo Pillai 2021-03-15  7724  #define HUBPREQ0_NOM_PARA=
METERS_5__REFCYC_PER_META_CHUNK_NOM_L__SHIFT                               =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7725  #define HUBPREQ0_NOM_PARA=
METERS_5__REFCYC_PER_META_CHUNK_NOM_L_MASK                                 =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7726  //HUBPREQ0_NOM_PARAMETERS=
_6
8198ace7a074de Aurabindo Pillai 2021-03-15  7727  #define HUBPREQ0_NOM_PARA=
METERS_6__DST_Y_PER_META_ROW_NOM_C__SHIFT                                  =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7728  #define HUBPREQ0_NOM_PARA=
METERS_6__DST_Y_PER_META_ROW_NOM_C_MASK                                    =
          0x0001FFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7729  //HUBPREQ0_NOM_PARAMETERS=
_7
8198ace7a074de Aurabindo Pillai 2021-03-15  7730  #define HUBPREQ0_NOM_PARA=
METERS_7__REFCYC_PER_META_CHUNK_NOM_C__SHIFT                               =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7731  #define HUBPREQ0_NOM_PARA=
METERS_7__REFCYC_PER_META_CHUNK_NOM_C_MASK                                 =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7732  //HUBPREQ0_PER_LINE_DELIV=
ERY_PRE
8198ace7a074de Aurabindo Pillai 2021-03-15  7733  #define HUBPREQ0_PER_LINE=
_DELIVERY_PRE__REFCYC_PER_LINE_DELIVERY_PRE_L__SHIFT                       =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7734  #define HUBPREQ0_PER_LINE=
_DELIVERY_PRE__REFCYC_PER_LINE_DELIVERY_PRE_C__SHIFT                       =
          0x10
8198ace7a074de Aurabindo Pillai 2021-03-15  7735  #define HUBPREQ0_PER_LINE=
_DELIVERY_PRE__REFCYC_PER_LINE_DELIVERY_PRE_L_MASK                         =
          0x00001FFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7736  #define HUBPREQ0_PER_LINE=
_DELIVERY_PRE__REFCYC_PER_LINE_DELIVERY_PRE_C_MASK                         =
          0x1FFF0000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7737  //HUBPREQ0_PER_LINE_DELIV=
ERY
8198ace7a074de Aurabindo Pillai 2021-03-15  7738  #define HUBPREQ0_PER_LINE=
_DELIVERY__REFCYC_PER_LINE_DELIVERY_L__SHIFT                               =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7739  #define HUBPREQ0_PER_LINE=
_DELIVERY__REFCYC_PER_LINE_DELIVERY_C__SHIFT                               =
          0x10
8198ace7a074de Aurabindo Pillai 2021-03-15  7740  #define HUBPREQ0_PER_LINE=
_DELIVERY__REFCYC_PER_LINE_DELIVERY_L_MASK                                 =
          0x00001FFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7741  #define HUBPREQ0_PER_LINE=
_DELIVERY__REFCYC_PER_LINE_DELIVERY_C_MASK                                 =
          0x1FFF0000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7742  //HUBPREQ0_CURSOR_SETTINGS
8198ace7a074de Aurabindo Pillai 2021-03-15  7743  #define HUBPREQ0_CURSOR_S=
ETTINGS__CURSOR0_DST_Y_OFFSET__SHIFT                                       =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7744  #define HUBPREQ0_CURSOR_S=
ETTINGS__CURSOR0_CHUNK_HDL_ADJUST__SHIFT                                   =
          0x8
8198ace7a074de Aurabindo Pillai 2021-03-15  7745  #define HUBPREQ0_CURSOR_S=
ETTINGS__CURSOR1_DST_Y_OFFSET__SHIFT                                       =
          0x10
8198ace7a074de Aurabindo Pillai 2021-03-15  7746  #define HUBPREQ0_CURSOR_S=
ETTINGS__CURSOR1_CHUNK_HDL_ADJUST__SHIFT                                   =
          0x18
8198ace7a074de Aurabindo Pillai 2021-03-15  7747  #define HUBPREQ0_CURSOR_S=
ETTINGS__CURSOR0_DST_Y_OFFSET_MASK                                         =
          0x000000FFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7748  #define HUBPREQ0_CURSOR_S=
ETTINGS__CURSOR0_CHUNK_HDL_ADJUST_MASK                                     =
          0x00000300L
8198ace7a074de Aurabindo Pillai 2021-03-15  7749  #define HUBPREQ0_CURSOR_S=
ETTINGS__CURSOR1_DST_Y_OFFSET_MASK                                         =
          0x00FF0000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7750  #define HUBPREQ0_CURSOR_S=
ETTINGS__CURSOR1_CHUNK_HDL_ADJUST_MASK                                     =
          0x03000000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7751  //HUBPREQ0_REF_FREQ_TO_PI=
X_FREQ
8198ace7a074de Aurabindo Pillai 2021-03-15  7752  #define HUBPREQ0_REF_FREQ=
_TO_PIX_FREQ__REF_FREQ_TO_PIX_FREQ__SHIFT                                  =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7753  #define HUBPREQ0_REF_FREQ=
_TO_PIX_FREQ__REF_FREQ_TO_PIX_FREQ_MASK                                    =
          0x001FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7754  //HUBPREQ0_DST_Y_DELTA_DR=
Q_LIMIT
8198ace7a074de Aurabindo Pillai 2021-03-15  7755  #define HUBPREQ0_DST_Y_DE=
LTA_DRQ_LIMIT__DST_Y_DELTA_DRQ_LIMIT__SHIFT                                =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7756  #define HUBPREQ0_DST_Y_DE=
LTA_DRQ_LIMIT__DST_Y_DELTA_DRQ_LIMIT_MASK                                  =
          0x00007FFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7757  //HUBPREQ0_HUBPREQ_MEM_PW=
R_CTRL
8198ace7a074de Aurabindo Pillai 2021-03-15  7758  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_DPTE_MEM_PWR_FORCE__SHIFT                                =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7759  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_DPTE_MEM_PWR_DIS__SHIFT                                  =
          0x2
8198ace7a074de Aurabindo Pillai 2021-03-15  7760  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_MPTE_MEM_PWR_FORCE__SHIFT                                =
          0x4
8198ace7a074de Aurabindo Pillai 2021-03-15  7761  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_MPTE_MEM_PWR_DIS__SHIFT                                  =
          0x6
8198ace7a074de Aurabindo Pillai 2021-03-15  7762  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_META_MEM_PWR_FORCE__SHIFT                                =
          0x8
8198ace7a074de Aurabindo Pillai 2021-03-15  7763  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_META_MEM_PWR_DIS__SHIFT                                  =
          0xa
8198ace7a074de Aurabindo Pillai 2021-03-15  7764  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_PDE_MEM_PWR_FORCE__SHIFT                                 =
          0xc
8198ace7a074de Aurabindo Pillai 2021-03-15  7765  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_PDE_MEM_PWR_DIS__SHIFT                                   =
          0xe
8198ace7a074de Aurabindo Pillai 2021-03-15  7766  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_DPTE_MEM_PWR_FORCE_MASK                                  =
          0x00000003L
8198ace7a074de Aurabindo Pillai 2021-03-15  7767  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_DPTE_MEM_PWR_DIS_MASK                                    =
          0x00000004L
8198ace7a074de Aurabindo Pillai 2021-03-15  7768  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_MPTE_MEM_PWR_FORCE_MASK                                  =
          0x00000030L
8198ace7a074de Aurabindo Pillai 2021-03-15  7769  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_MPTE_MEM_PWR_DIS_MASK                                    =
          0x00000040L
8198ace7a074de Aurabindo Pillai 2021-03-15  7770  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_META_MEM_PWR_FORCE_MASK                                  =
          0x00000300L
8198ace7a074de Aurabindo Pillai 2021-03-15  7771  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_META_MEM_PWR_DIS_MASK                                    =
          0x00000400L
8198ace7a074de Aurabindo Pillai 2021-03-15  7772  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_PDE_MEM_PWR_FORCE_MASK                                   =
          0x00003000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7773  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_CTRL__REQ_PDE_MEM_PWR_DIS_MASK                                     =
          0x00004000L
8198ace7a074de Aurabindo Pillai 2021-03-15  7774  //HUBPREQ0_HUBPREQ_MEM_PW=
R_STATUS
8198ace7a074de Aurabindo Pillai 2021-03-15  7775  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_STATUS__REQ_DPTE_MEM_PWR_STATE__SHIFT                              =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7776  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_STATUS__REQ_MPTE_MEM_PWR_STATE__SHIFT                              =
          0x2
8198ace7a074de Aurabindo Pillai 2021-03-15  7777  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_STATUS__REQ_META_MEM_PWR_STATE__SHIFT                              =
          0x4
8198ace7a074de Aurabindo Pillai 2021-03-15  7778  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_STATUS__REQ_PDE_MEM_PWR_STATE__SHIFT                               =
          0x6
8198ace7a074de Aurabindo Pillai 2021-03-15  7779  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_STATUS__REQ_DPTE_MEM_PWR_STATE_MASK                                =
          0x00000003L
8198ace7a074de Aurabindo Pillai 2021-03-15  7780  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_STATUS__REQ_MPTE_MEM_PWR_STATE_MASK                                =
          0x0000000CL
8198ace7a074de Aurabindo Pillai 2021-03-15  7781  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_STATUS__REQ_META_MEM_PWR_STATE_MASK                                =
          0x00000030L
8198ace7a074de Aurabindo Pillai 2021-03-15  7782  #define HUBPREQ0_HUBPREQ_=
MEM_PWR_STATUS__REQ_PDE_MEM_PWR_STATE_MASK                                 =
          0x000000C0L
8198ace7a074de Aurabindo Pillai 2021-03-15  7783  //HUBPREQ0_VBLANK_PARAMET=
ERS_5
8198ace7a074de Aurabindo Pillai 2021-03-15  7784  #define HUBPREQ0_VBLANK_P=
ARAMETERS_5__REFCYC_PER_VM_GROUP_VBLANK__SHIFT                             =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7785  #define HUBPREQ0_VBLANK_P=
ARAMETERS_5__REFCYC_PER_VM_GROUP_VBLANK_MASK                               =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7786  //HUBPREQ0_VBLANK_PARAMET=
ERS_6
8198ace7a074de Aurabindo Pillai 2021-03-15  7787  #define HUBPREQ0_VBLANK_P=
ARAMETERS_6__REFCYC_PER_VM_REQ_VBLANK__SHIFT                               =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7788  #define HUBPREQ0_VBLANK_P=
ARAMETERS_6__REFCYC_PER_VM_REQ_VBLANK_MASK                                 =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7789  //HUBPREQ0_FLIP_PARAMETER=
S_3
8198ace7a074de Aurabindo Pillai 2021-03-15  7790  #define HUBPREQ0_FLIP_PAR=
AMETERS_3__REFCYC_PER_VM_GROUP_FLIP__SHIFT                                 =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7791  #define HUBPREQ0_FLIP_PAR=
AMETERS_3__REFCYC_PER_VM_GROUP_FLIP_MASK                                   =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7792  //HUBPREQ0_FLIP_PARAMETER=
S_4
8198ace7a074de Aurabindo Pillai 2021-03-15  7793  #define HUBPREQ0_FLIP_PAR=
AMETERS_4__REFCYC_PER_VM_REQ_FLIP__SHIFT                                   =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7794  #define HUBPREQ0_FLIP_PAR=
AMETERS_4__REFCYC_PER_VM_REQ_FLIP_MASK                                     =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7795  //HUBPREQ0_FLIP_PARAMETER=
S_5
8198ace7a074de Aurabindo Pillai 2021-03-15  7796  #define HUBPREQ0_FLIP_PAR=
AMETERS_5__REFCYC_PER_PTE_GROUP_FLIP_C__SHIFT                              =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7797  #define HUBPREQ0_FLIP_PAR=
AMETERS_5__REFCYC_PER_PTE_GROUP_FLIP_C_MASK                                =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7798  //HUBPREQ0_FLIP_PARAMETER=
S_6
8198ace7a074de Aurabindo Pillai 2021-03-15  7799  #define HUBPREQ0_FLIP_PAR=
AMETERS_6__REFCYC_PER_META_CHUNK_FLIP_C__SHIFT                             =
          0x0
8198ace7a074de Aurabindo Pillai 2021-03-15  7800  #define HUBPREQ0_FLIP_PAR=
AMETERS_6__REFCYC_PER_META_CHUNK_FLIP_C_MASK                               =
          0x007FFFFFL
8198ace7a074de Aurabindo Pillai 2021-03-15  7801  =

8198ace7a074de Aurabindo Pillai 2021-03-15  7802  =


:::::: The code at line 7607 was first introduced by commit
:::::: 8198ace7a074de4dfdc10885ccf081476b50d41b drm/amd/display: Add regist=
er definitions for Beige Goby

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8809829744287897828==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
ymvq/wEglNDmh5ICAA==
--===============8809829744287897828==--

