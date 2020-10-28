Content-Type: multipart/mixed; boundary="===============0428387903870706590=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 2094/2270] drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:96:6: warning: no previous prototype for function 'vg_update_clocks'
Date: Wed, 28 Oct 2020 18:26:05 +0800
Message-ID: <202010281859.wkSfAe1V-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0428387903870706590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alex,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   1c86f90a16d413621918ae1403842b43632f0b3d
commit: 5d7dd14d6bdc2d44f07cec98be65b6edbff2e51c [2094/2270] drm/amdgpu: fo=
ld CONFIG_DRM_AMD_DC_DCN3* into CONFIG_DRM_AMD_DC_DCN (v2)
config: x86_64-randconfig-a005-20201028 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 50dfa1=
9cc799ae7cddd39a95dbfce675a12672ad)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D5d7dd14d6bdc2d44f07cec98be65b6edbff2e51c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 5d7dd14d6bdc2d44f07cec98be65b6edbff2e51c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:96:=
6: warning: no previous prototype for function 'vg_update_clocks' [-Wmissin=
g-prototypes]
   void vg_update_clocks(struct clk_mgr *clk_mgr_base,
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:96:=
1: note: declare 'static' if the function is not intended to be used outsid=
e of this translation unit
   void vg_update_clocks(struct clk_mgr *clk_mgr_base,
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:375=
:6: warning: no previous prototype for function 'vg_get_clk_states' [-Wmiss=
ing-prototypes]
   void vg_get_clk_states(struct clk_mgr *clk_mgr_base, struct clk_states *=
s)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:375=
:1: note: declare 'static' if the function is not intended to be used outsi=
de of this translation unit
   void vg_get_clk_states(struct clk_mgr *clk_mgr_base, struct clk_states *=
s)
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:393=
:6: warning: no previous prototype for function 'vg_init_clocks' [-Wmissing=
-prototypes]
   void vg_init_clocks(struct clk_mgr *clk_mgr)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:393=
:1: note: declare 'static' if the function is not intended to be used outsi=
de of this translation unit
   void vg_init_clocks(struct clk_mgr *clk_mgr)
   ^
   static =

   3 warnings generated.
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/dcn301_smu.c:91:=
5: warning: no previous prototype for function 'dcn301_smu_send_msg_with_pa=
ram' [-Wmissing-prototypes]
   int dcn301_smu_send_msg_with_param(
       ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/dcn301_smu.c:91:=
1: note: declare 'static' if the function is not intended to be used outsid=
e of this translation unit
   int dcn301_smu_send_msg_with_param(
   ^
   static =

   1 warning generated.
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_init.c:140:6: war=
ning: no previous prototype for function 'dcn301_hw_sequencer_construct' [-=
Wmissing-prototypes]
   void dcn301_hw_sequencer_construct(struct dc *dc)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_init.c:140:1: not=
e: declare 'static' if the function is not intended to be used outside of t=
his translation unit
   void dcn301_hw_sequencer_construct(struct dc *dc)
   ^
   static =

   1 warning generated.
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:447:2:=
 warning: initializer overrides prior initialization of this subobject [-Wi=
nitializer-overrides]
           stream_enc_regs(0),
           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2:=
 note: expanded from macro 'stream_enc_regs'
           SE_DCN3_REG_LIST(id)\
           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.=
h:104:2: note: expanded from macro 'SE_DCN3_REG_LIST'
           SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14=
: note: expanded from macro 'SRI'
           .reg_name =3D BASE(mm ## block ## id ## _ ## reg_name ## _BASE_I=
DX) + \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25=
: note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:223:1: note: expanded from here
   DCN_BASE__INST0_SEG2
   ^
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: =
expanded from macro 'DCN_BASE__INST0_SEG2'
   #define DCN_BASE__INST0_SEG2                       0x000034C0
                                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:447:2:=
 note: previous initialization is here
           stream_enc_regs(0),
           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2:=
 note: expanded from macro 'stream_enc_regs'
           SE_DCN3_REG_LIST(id)\
           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.=
h:99:2: note: expanded from macro 'SE_DCN3_REG_LIST'
           SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14=
: note: expanded from macro 'SRI'
           .reg_name =3D BASE(mm ## block ## id ## _ ## reg_name ## _BASE_I=
DX) + \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25=
: note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:173:1: note: expanded from here
   DCN_BASE__INST0_SEG2
   ^
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: =
expanded from macro 'DCN_BASE__INST0_SEG2'
   #define DCN_BASE__INST0_SEG2                       0x000034C0
                                                      ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:447:2:=
 warning: initializer overrides prior initialization of this subobject [-Wi=
nitializer-overrides]
           stream_enc_regs(0),
           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2:=
 note: expanded from macro 'stream_enc_regs'
           SE_DCN3_REG_LIST(id)\
           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.=
h:105:2: note: expanded from macro 'SE_DCN3_REG_LIST'
           SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14=
: note: expanded from macro 'SRI'
           .reg_name =3D BASE(mm ## block ## id ## _ ## reg_name ## _BASE_I=
DX) + \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25=
: note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:233:1: note: expanded from here
   DCN_BASE__INST0_SEG2
   ^
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: =
expanded from macro 'DCN_BASE__INST0_SEG2'
   #define DCN_BASE__INST0_SEG2                       0x000034C0
                                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:447:2:=
 note: previous initialization is here
           stream_enc_regs(0),
           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2:=
 note: expanded from macro 'stream_enc_regs'
           SE_DCN3_REG_LIST(id)\
           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.=
h:100:2: note: expanded from macro 'SE_DCN3_REG_LIST'
           SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14=
: note: expanded from macro 'SRI'
           .reg_name =3D BASE(mm ## block ## id ## _ ## reg_name ## _BASE_I=
DX) + \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25=
: note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:183:1: note: expanded from here
   DCN_BASE__INST0_SEG2
   ^
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: =
expanded from macro 'DCN_BASE__INST0_SEG2'
   #define DCN_BASE__INST0_SEG2                       0x000034C0
                                                      ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:447:2:=
 warning: initializer overrides prior initialization of this subobject [-Wi=
nitializer-overrides]
           stream_enc_regs(0),
           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2:=
 note: expanded from macro 'stream_enc_regs'
           SE_DCN3_REG_LIST(id)\
           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.=
h:106:2: note: expanded from macro 'SE_DCN3_REG_LIST'
           SRI(DIG_FE_CNTL, DIG, id), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14=
: note: expanded from macro 'SRI'
           .reg_name =3D BASE(mm ## block ## id ## _ ## reg_name ## _BASE_I=
DX) + \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25=
: note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:243:1: note: expanded from here
   DCN_BASE__INST0_SEG2
   ^
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: =
expanded from macro 'DCN_BASE__INST0_SEG2'
   #define DCN_BASE__INST0_SEG2                       0x000034C0
                                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:447:2:=
 note: previous initialization is here
           stream_enc_regs(0),
           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2:=
 note: expanded from macro 'stream_enc_regs'
           SE_DCN3_REG_LIST(id)\
           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.=
h:50:2: note: expanded from macro 'SE_DCN3_REG_LIST'
           SRI(DIG_FE_CNTL, DIG, id), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14=
: note: expanded from macro 'SRI'
           .reg_name =3D BASE(mm ## block ## id ## _ ## reg_name ## _BASE_I=
DX) + \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25=
: note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:74:1: note: expanded from here
   DCN_BASE__INST0_SEG2
   ^
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: =
expanded from macro 'DCN_BASE__INST0_SEG2'
   #define DCN_BASE__INST0_SEG2                       0x000034C0
                                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:448:2:=
 warning: initializer overrides prior initialization of this subobject [-Wi=
nitializer-overrides]
           stream_enc_regs(1),
           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2:=
 note: expanded from macro 'stream_enc_regs'
           SE_DCN3_REG_LIST(id)\
           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.=
h:104:2: note: expanded from macro 'SE_DCN3_REG_LIST'
           SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14=
: note: expanded from macro 'SRI'
           .reg_name =3D BASE(mm ## block ## id ## _ ## reg_name ## _BASE_I=
DX) + \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25=
: note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:23:1: note: expanded from here
   DCN_BASE__INST0_SEG2
   ^
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: =
expanded from macro 'DCN_BASE__INST0_SEG2'
   #define DCN_BASE__INST0_SEG2                       0x000034C0
                                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:448:2:=
 note: previous initialization is here
           stream_enc_regs(1),
           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2:=
 note: expanded from macro 'stream_enc_regs'
           SE_DCN3_REG_LIST(id)\
           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.=
h:99:2: note: expanded from macro 'SE_DCN3_REG_LIST'
           SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14=
: note: expanded from macro 'SRI'
           .reg_name =3D BASE(mm ## block ## id ## _ ## reg_name ## _BASE_I=
DX) + \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25=
: note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:253:1: note: expanded from here
   DCN_BASE__INST0_SEG2
   ^
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: =
expanded from macro 'DCN_BASE__INST0_SEG2'
   #define DCN_BASE__INST0_SEG2                       0x000034C0
                                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:448:2:=
 warning: initializer overrides prior initialization of this subobject [-Wi=
nitializer-overrides]
           stream_enc_regs(1),
           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2:=
 note: expanded from macro 'stream_enc_regs'
           SE_DCN3_REG_LIST(id)\
           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.=
h:105:2: note: expanded from macro 'SE_DCN3_REG_LIST'
           SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14=
: note: expanded from macro 'SRI'
           .reg_name =3D BASE(mm ## block ## id ## _ ## reg_name ## _BASE_I=
DX) + \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
--
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:255:15=
: note: expanded from macro 'SR'
                   .reg_name =3D BASE(mm ## reg_name ## _BASE_IDX) +  \
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25=
: note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:91:1: note: expanded from here
   DCN_BASE__INST0_SEG2
   ^
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: =
expanded from macro 'DCN_BASE__INST0_SEG2'
   #define DCN_BASE__INST0_SEG2                       0x000034C0
                                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:704:3:=
 warning: initializer overrides prior initialization of this subobject [-Wi=
nitializer-overrides]
                   HUBBUB_REG_LIST_DCN301(0)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_hubbub.h:33:2: no=
te: expanded from macro 'HUBBUB_REG_LIST_DCN301'
           HUBBUB_HVM_REG_LIST()
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hubbub.h:42:2: note=
: expanded from macro 'HUBBUB_HVM_REG_LIST'
           SR(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_D),\
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:255:15=
: note: expanded from macro 'SR'
                   .reg_name =3D BASE(mm ## reg_name ## _BASE_IDX) +  \
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25=
: note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:27:1: note: expanded from here
   DCN_BASE__INST0_SEG2
   ^
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: =
expanded from macro 'DCN_BASE__INST0_SEG2'
   #define DCN_BASE__INST0_SEG2                       0x000034C0
                                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:704:3:=
 note: previous initialization is here
                   HUBBUB_REG_LIST_DCN301(0)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_hubbub.h:32:2: no=
te: expanded from macro 'HUBBUB_REG_LIST_DCN301'
           HUBBUB_REG_LIST_DCN30(id), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubbub.h:51:2: note=
: expanded from macro 'HUBBUB_REG_LIST_DCN30'
           SR(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_D)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:255:15=
: note: expanded from macro 'SR'
                   .reg_name =3D BASE(mm ## reg_name ## _BASE_IDX) +  \
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25=
: note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:95:1: note: expanded from here
   DCN_BASE__INST0_SEG2
   ^
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: =
expanded from macro 'DCN_BASE__INST0_SEG2'
   #define DCN_BASE__INST0_SEG2                       0x000034C0
                                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:728:3:=
 warning: initializer overrides prior initialization of this subobject [-Wi=
nitializer-overrides]
                   HWSEQ_DCN301_REG_LIST()
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:368:2: note: ex=
panded from macro 'HWSEQ_DCN301_REG_LIST'
           SR(DCFCLK_CNTL), \
           ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:255:15=
: note: expanded from macro 'SR'
                   .reg_name =3D BASE(mm ## reg_name ## _BASE_IDX) +  \
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19=
: note: expanded from macro 'BASE'
   #define BASE(seg) BASE_INNER(seg)
                     ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25=
: note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:52:1: note: expanded from here
   DCN_BASE__INST0_SEG2
   ^
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: =
expanded from macro 'DCN_BASE__INST0_SEG2'
   #define DCN_BASE__INST0_SEG2                       0x000034C0
                                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:728:3:=
 note: previous initialization is here
                   HWSEQ_DCN301_REG_LIST()
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_hwseq.h:367:2: note: ex=
panded from macro 'HWSEQ_DCN301_REG_LIST'
           SR(DCFCLK_CNTL),\
           ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:255:15=
: note: expanded from macro 'SR'
                   .reg_name =3D BASE(mm ## reg_name ## _BASE_IDX) +  \
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19=
: note: expanded from macro 'BASE'
   #define BASE(seg) BASE_INNER(seg)
                     ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25=
: note: expanded from macro 'BASE_INNER'
   #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
                           ^
   <scratch space>:48:1: note: expanded from here
   DCN_BASE__INST0_SEG2
   ^
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: =
expanded from macro 'DCN_BASE__INST0_SEG2'
   #define DCN_BASE__INST0_SEG2                       0x000034C0
                                                      ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:853:6:=
 warning: no previous prototype for function 'dcn301_dpp_destroy' [-Wmissin=
g-prototypes]
   void dcn301_dpp_destroy(struct dpp **dpp)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:853:1:=
 note: declare 'static' if the function is not intended to be used outside =
of this translation unit
   void dcn301_dpp_destroy(struct dpp **dpp)
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:859:13=
: warning: no previous prototype for function 'dcn301_dpp_create' [-Wmissin=
g-prototypes]
   struct dpp *dcn301_dpp_create(
               ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:859:1:=
 note: declare 'static' if the function is not intended to be used outside =
of this translation unit
   struct dpp *dcn301_dpp_create(
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:877:32=
: warning: no previous prototype for function 'dcn301_opp_create' [-Wmissin=
g-prototypes]
   struct output_pixel_processor *dcn301_opp_create(
                                  ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:877:1:=
 note: declare 'static' if the function is not intended to be used outside =
of this translation unit
   struct output_pixel_processor *dcn301_opp_create(
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:893:17=
: warning: no previous prototype for function 'dcn301_aux_engine_create' [-=
Wmissing-prototypes]
   struct dce_aux *dcn301_aux_engine_create(
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:893:1:=
 note: declare 'static' if the function is not intended to be used outside =
of this translation unit
   struct dce_aux *dcn301_aux_engine_create(
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:929:20=
: warning: no previous prototype for function 'dcn301_i2c_hw_create' [-Wmis=
sing-prototypes]
   struct dce_i2c_hw *dcn301_i2c_hw_create(
                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:929:1:=
 note: declare 'static' if the function is not intended to be used outside =
of this translation unit
   struct dce_i2c_hw *dcn301_i2c_hw_create(
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:965:16=
: warning: no previous prototype for function 'dcn301_hubbub_create' [-Wmis=
sing-prototypes]
   struct hubbub *dcn301_hubbub_create(struct dc_context *ctx)
                  ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:965:1:=
 note: declare 'static' if the function is not intended to be used outside =
of this translation unit
   struct hubbub *dcn301_hubbub_create(struct dc_context *ctx)
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:996:26=
: warning: no previous prototype for function 'dcn301_timing_generator_crea=
te' [-Wmissing-prototypes]
   struct timing_generator *dcn301_timing_generator_create(
                            ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:996:1:=
 note: declare 'static' if the function is not intended to be used outside =
of this translation unit
   struct timing_generator *dcn301_timing_generator_create(
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:1030:2=
2: warning: no previous prototype for function 'dcn301_link_encoder_create'=
 [-Wmissing-prototypes]
   struct link_encoder *dcn301_link_encoder_create(
                        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:1030:1=
: note: declare 'static' if the function is not intended to be used outside=
 of this translation unit
   struct link_encoder *dcn301_link_encoder_create(
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:1051:2=
0: warning: no previous prototype for function 'dcn301_panel_cntl_create' [=
-Wmissing-prototypes]
   struct panel_cntl *dcn301_panel_cntl_create(const struct panel_cntl_init=
_data *init_data)
                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:1051:1=
: note: declare 'static' if the function is not intended to be used outside=
 of this translation unit
   struct panel_cntl *dcn301_panel_cntl_create(const struct panel_cntl_init=
_data *init_data)
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:1133:2=
4: warning: no previous prototype for function 'dcn301_stream_encoder_creat=
e' [-Wmissing-prototypes]
   struct stream_encoder *dcn301_stream_encoder_create(
                          ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:1133:1=
: note: declare 'static' if the function is not intended to be used outside=
 of this translation unit
   struct stream_encoder *dcn301_stream_encoder_create(
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:1165:1=
9: warning: no previous prototype for function 'dcn301_hwseq_create' [-Wmis=
sing-prototypes]
   struct dce_hwseq *dcn301_hwseq_create(
                     ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:1165:1=
: note: declare 'static' if the function is not intended to be used outside=
 of this translation unit
   struct dce_hwseq *dcn301_hwseq_create(
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:1319:1=
4: warning: no previous prototype for function 'dcn301_hubp_create' [-Wmiss=
ing-prototypes]
   struct hubp *dcn301_hubp_create(
                ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:1319:1=
: note: declare 'static' if the function is not intended to be used outside=
 of this translation unit
   struct hubp *dcn301_hubp_create(
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:1338:6=
: warning: no previous prototype for function 'dcn301_dwbc_create' [-Wmissi=
ng-prototypes]
   bool dcn301_dwbc_create(struct dc_context *ctx, struct resource_pool *po=
ol)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:1338:1=
: note: declare 'static' if the function is not intended to be used outside=
 of this translation unit
   bool dcn301_dwbc_create(struct dc_context *ctx, struct resource_pool *po=
ol)
   ^
   static =

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:1363:6=
: warning: no previous prototype for function 'dcn301_mmhubbub_create' [-Wm=
issing-prototypes]
   bool dcn301_mmhubbub_create(struct dc_context *ctx, struct resource_pool=
 *pool)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:1363:1=
: note: declare 'static' if the function is not intended to be used outside=
 of this translation unit
   bool dcn301_mmhubbub_create(struct dc_context *ctx, struct resource_pool=
 *pool)
   ^
   static =

   80 warnings generated.
..

vim +/vg_update_clocks +96 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr=
/dcn301/vg_clk_mgr.c

3a83e4e64bb1522 Roman Li 2020-09-29   95  =

3a83e4e64bb1522 Roman Li 2020-09-29  @96  void vg_update_clocks(struct clk_=
mgr *clk_mgr_base,
3a83e4e64bb1522 Roman Li 2020-09-29   97  			struct dc_state *context,
3a83e4e64bb1522 Roman Li 2020-09-29   98  			bool safe_to_lower)
3a83e4e64bb1522 Roman Li 2020-09-29   99  {
3a83e4e64bb1522 Roman Li 2020-09-29  100  	struct clk_mgr_internal *clk_mgr=
 =3D TO_CLK_MGR_INTERNAL(clk_mgr_base);
3a83e4e64bb1522 Roman Li 2020-09-29  101  	struct dc_clocks *new_clocks =3D=
 &context->bw_ctx.bw.dcn.clk;
3a83e4e64bb1522 Roman Li 2020-09-29  102  	struct dc *dc =3D clk_mgr_base->=
ctx->dc;
3a83e4e64bb1522 Roman Li 2020-09-29  103  	int display_count;
3a83e4e64bb1522 Roman Li 2020-09-29  104  	bool update_dppclk =3D false;
3a83e4e64bb1522 Roman Li 2020-09-29  105  	bool update_dispclk =3D false;
3a83e4e64bb1522 Roman Li 2020-09-29  106  	bool dpp_clock_lowered =3D false;
3a83e4e64bb1522 Roman Li 2020-09-29  107  =

3a83e4e64bb1522 Roman Li 2020-09-29  108  	if (dc->work_arounds.skip_clock_=
update)
3a83e4e64bb1522 Roman Li 2020-09-29  109  		return;
3a83e4e64bb1522 Roman Li 2020-09-29  110  =

3a83e4e64bb1522 Roman Li 2020-09-29  111  	/*
3a83e4e64bb1522 Roman Li 2020-09-29  112  	 * if it is safe to lower, but w=
e are already in the lower state, we don't have to do anything
3a83e4e64bb1522 Roman Li 2020-09-29  113  	 * also if safe to lower is fals=
e, we just go in the higher state
3a83e4e64bb1522 Roman Li 2020-09-29  114  	 */
3a83e4e64bb1522 Roman Li 2020-09-29  115  	if (safe_to_lower) {
3a83e4e64bb1522 Roman Li 2020-09-29  116  		/* check that we're not already=
 in lower */
3a83e4e64bb1522 Roman Li 2020-09-29  117  		if (clk_mgr_base->clks.pwr_stat=
e !=3D DCN_PWR_STATE_LOW_POWER) {
3a83e4e64bb1522 Roman Li 2020-09-29  118  =

3a83e4e64bb1522 Roman Li 2020-09-29  119  			display_count =3D vg_get_activ=
e_display_cnt_wa(dc, context);
3a83e4e64bb1522 Roman Li 2020-09-29  120  			/* if we can go lower, go lowe=
r */
3a83e4e64bb1522 Roman Li 2020-09-29  121  			if (display_count =3D=3D 0) {
3a83e4e64bb1522 Roman Li 2020-09-29  122  				union display_idle_optimizati=
on_u idle_info =3D { 0 };
3a83e4e64bb1522 Roman Li 2020-09-29  123  =

3a83e4e64bb1522 Roman Li 2020-09-29  124  				idle_info.idle_info.df_reques=
t_disabled =3D 1;
3a83e4e64bb1522 Roman Li 2020-09-29  125  				idle_info.idle_info.phy_ref_c=
lk_off =3D 1;
3a83e4e64bb1522 Roman Li 2020-09-29  126  =

3a83e4e64bb1522 Roman Li 2020-09-29  127  				dcn301_smu_set_display_idle_o=
ptimization(clk_mgr, idle_info.data);
3a83e4e64bb1522 Roman Li 2020-09-29  128  				/* update power state */
3a83e4e64bb1522 Roman Li 2020-09-29  129  				clk_mgr_base->clks.pwr_state =
=3D DCN_PWR_STATE_LOW_POWER;
3a83e4e64bb1522 Roman Li 2020-09-29  130  			}
3a83e4e64bb1522 Roman Li 2020-09-29  131  		}
3a83e4e64bb1522 Roman Li 2020-09-29  132  	} else {
3a83e4e64bb1522 Roman Li 2020-09-29  133  		/* check that we're not already=
 in D0 */
3a83e4e64bb1522 Roman Li 2020-09-29  134  		if (clk_mgr_base->clks.pwr_stat=
e !=3D DCN_PWR_STATE_MISSION_MODE) {
3a83e4e64bb1522 Roman Li 2020-09-29  135  			union display_idle_optimizatio=
n_u idle_info =3D { 0 };
3a83e4e64bb1522 Roman Li 2020-09-29  136  =

3a83e4e64bb1522 Roman Li 2020-09-29  137  			dcn301_smu_set_display_idle_op=
timization(clk_mgr, idle_info.data);
3a83e4e64bb1522 Roman Li 2020-09-29  138  			/* update power state */
3a83e4e64bb1522 Roman Li 2020-09-29  139  			clk_mgr_base->clks.pwr_state =
=3D DCN_PWR_STATE_MISSION_MODE;
3a83e4e64bb1522 Roman Li 2020-09-29  140  		}
3a83e4e64bb1522 Roman Li 2020-09-29  141  	}
3a83e4e64bb1522 Roman Li 2020-09-29  142  =

3a83e4e64bb1522 Roman Li 2020-09-29  143  	if (should_set_clock(safe_to_low=
er, new_clocks->dcfclk_khz, clk_mgr_base->clks.dcfclk_khz)) {
3a83e4e64bb1522 Roman Li 2020-09-29  144  		clk_mgr_base->clks.dcfclk_khz =
=3D new_clocks->dcfclk_khz;
3a83e4e64bb1522 Roman Li 2020-09-29  145  		dcn301_smu_set_hard_min_dcfclk(=
clk_mgr, clk_mgr_base->clks.dcfclk_khz);
3a83e4e64bb1522 Roman Li 2020-09-29  146  	}
3a83e4e64bb1522 Roman Li 2020-09-29  147  =

3a83e4e64bb1522 Roman Li 2020-09-29  148  	if (should_set_clock(safe_to_low=
er,
3a83e4e64bb1522 Roman Li 2020-09-29  149  			new_clocks->dcfclk_deep_sleep_=
khz, clk_mgr_base->clks.dcfclk_deep_sleep_khz)) {
3a83e4e64bb1522 Roman Li 2020-09-29  150  		clk_mgr_base->clks.dcfclk_deep_=
sleep_khz =3D new_clocks->dcfclk_deep_sleep_khz;
3a83e4e64bb1522 Roman Li 2020-09-29  151  		dcn301_smu_set_min_deep_sleep_d=
cfclk(clk_mgr, clk_mgr_base->clks.dcfclk_deep_sleep_khz);
3a83e4e64bb1522 Roman Li 2020-09-29  152  	}
3a83e4e64bb1522 Roman Li 2020-09-29  153  =

3a83e4e64bb1522 Roman Li 2020-09-29  154  	// workaround: Limit dppclk to 1=
00Mhz to avoid lower eDP panel switch to plus 4K monitor underflow.
3a83e4e64bb1522 Roman Li 2020-09-29  155  	if (!IS_DIAG_DC(dc->ctx->dce_env=
ironment)) {
3a83e4e64bb1522 Roman Li 2020-09-29  156  		if (new_clocks->dppclk_khz < 10=
0000)
3a83e4e64bb1522 Roman Li 2020-09-29  157  			new_clocks->dppclk_khz =3D 100=
000;
3a83e4e64bb1522 Roman Li 2020-09-29  158  	}
3a83e4e64bb1522 Roman Li 2020-09-29  159  =

3a83e4e64bb1522 Roman Li 2020-09-29  160  	if (should_set_clock(safe_to_low=
er, new_clocks->dppclk_khz, clk_mgr->base.clks.dppclk_khz)) {
3a83e4e64bb1522 Roman Li 2020-09-29  161  		if (clk_mgr->base.clks.dppclk_k=
hz > new_clocks->dppclk_khz)
3a83e4e64bb1522 Roman Li 2020-09-29  162  			dpp_clock_lowered =3D true;
3a83e4e64bb1522 Roman Li 2020-09-29  163  		clk_mgr_base->clks.dppclk_khz =
=3D new_clocks->dppclk_khz;
3a83e4e64bb1522 Roman Li 2020-09-29  164  		update_dppclk =3D true;
3a83e4e64bb1522 Roman Li 2020-09-29  165  	}
3a83e4e64bb1522 Roman Li 2020-09-29  166  =

3a83e4e64bb1522 Roman Li 2020-09-29  167  	if (should_set_clock(safe_to_low=
er, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz)) {
3a83e4e64bb1522 Roman Li 2020-09-29  168  		clk_mgr_base->clks.dispclk_khz =
=3D new_clocks->dispclk_khz;
3a83e4e64bb1522 Roman Li 2020-09-29  169  		dcn301_smu_set_dispclk(clk_mgr,=
 clk_mgr_base->clks.dispclk_khz);
3a83e4e64bb1522 Roman Li 2020-09-29  170  =

3a83e4e64bb1522 Roman Li 2020-09-29  171  		update_dispclk =3D true;
3a83e4e64bb1522 Roman Li 2020-09-29  172  	}
3a83e4e64bb1522 Roman Li 2020-09-29  173  =

3a83e4e64bb1522 Roman Li 2020-09-29  174  	if (dpp_clock_lowered) {
3a83e4e64bb1522 Roman Li 2020-09-29  175  		// increase per DPP DTO before =
lowering global dppclk
3a83e4e64bb1522 Roman Li 2020-09-29  176  		dcn20_update_clocks_update_dpp_=
dto(clk_mgr, context, safe_to_lower);
3a83e4e64bb1522 Roman Li 2020-09-29  177  		dcn301_smu_set_dppclk(clk_mgr, =
clk_mgr_base->clks.dppclk_khz);
3a83e4e64bb1522 Roman Li 2020-09-29  178  	} else {
3a83e4e64bb1522 Roman Li 2020-09-29  179  		// increase global DPPCLK befor=
e lowering per DPP DTO
3a83e4e64bb1522 Roman Li 2020-09-29  180  		if (update_dppclk || update_dis=
pclk)
3a83e4e64bb1522 Roman Li 2020-09-29  181  			dcn301_smu_set_dppclk(clk_mgr,=
 clk_mgr_base->clks.dppclk_khz);
3a83e4e64bb1522 Roman Li 2020-09-29  182  		// always update dtos unless cl=
ock is lowered and not safe to lower
3a83e4e64bb1522 Roman Li 2020-09-29  183  		if (new_clocks->dppclk_khz >=3D=
 dc->current_state->bw_ctx.bw.dcn.clk.dppclk_khz)
3a83e4e64bb1522 Roman Li 2020-09-29  184  			dcn20_update_clocks_update_dpp=
_dto(clk_mgr, context, safe_to_lower);
3a83e4e64bb1522 Roman Li 2020-09-29  185  	}
3a83e4e64bb1522 Roman Li 2020-09-29  186  }
3a83e4e64bb1522 Roman Li 2020-09-29  187  =


:::::: The code at line 96 was first introduced by commit
:::::: 3a83e4e64bb1522ddac67ffc787d1c38291e1a65 drm/amd/display: Add dcn3.0=
1 support to DC (v2)

:::::: TO: Roman Li <Roman.Li@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0428387903870706590==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0428387903870706590==--

