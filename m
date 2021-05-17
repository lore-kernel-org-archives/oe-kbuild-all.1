Content-Type: multipart/mixed; boundary="===============8261358384574523650=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:214:2: error: implicit declaration of function 'enable_kernel_altivec'
Date: Tue, 18 May 2021 07:06:05 +0800
Message-ID: <202105180703.fgOdRlYs-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8261358384574523650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alex,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d07f6ca923ea0927a1024dfccafc5b53b61cfecc
commit: 582e2ce5b4ece37055c6ebe58ab48a4817d30b10 drm/amdgpu/display: FP fix=
es for DCN3.x (v4)
date:   6 months ago
config: powerpc-randconfig-r004-20210517 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 0a34ff=
8bcb1df16fe7d643ccbe4567b2162c5024)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D582e2ce5b4ece37055c6ebe58ab48a4817d30b10
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 582e2ce5b4ece37055c6ebe58ab48a4817d30b10
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:2=
14:2: error: implicit declaration of function 'enable_kernel_vsx' [-Werror,=
-Wimplicit-function-declaration]
           DC_FP_START();
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:68:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_vsx(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:2=
14:2: note: did you mean 'enable_kernel_fp'?
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:68:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_vsx(); \
                   ^
   arch/powerpc/include/asm/switch_to.h:40:13: note: 'enable_kernel_fp' dec=
lared here
   extern void enable_kernel_fp(void);
               ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:2=
14:2: error: implicit declaration of function 'enable_kernel_altivec' [-Wer=
ror,-Wimplicit-function-declaration]
           DC_FP_START();
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:71:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_altivec(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:2=
14:2: note: did you mean 'enable_kernel_fp'?
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:71:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_altivec(); \
                   ^
   arch/powerpc/include/asm/switch_to.h:40:13: note: 'enable_kernel_fp' dec=
lared here
   extern void enable_kernel_fp(void);
               ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:2=
16:2: error: implicit declaration of function 'disable_kernel_vsx' [-Werror=
,-Wimplicit-function-declaration]
           DC_FP_END();
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:79:3: note: expanded=
 from macro 'DC_FP_END'
                   disable_kernel_vsx(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:2=
16:2: note: did you mean 'disable_kernel_fp'?
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:79:3: note: expanded=
 from macro 'DC_FP_END'
                   disable_kernel_vsx(); \
                   ^
   arch/powerpc/include/asm/switch_to.h:44:20: note: 'disable_kernel_fp' de=
clared here
   static inline void disable_kernel_fp(void)
                      ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:2=
16:2: error: implicit declaration of function 'disable_kernel_altivec' [-We=
rror,-Wimplicit-function-declaration]
           DC_FP_END();
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:82:3: note: expanded=
 from macro 'DC_FP_END'
                   disable_kernel_altivec(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:2=
16:2: note: did you mean 'disable_kernel_fp'?
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:82:3: note: expanded=
 from macro 'DC_FP_END'
                   disable_kernel_altivec(); \
                   ^
   arch/powerpc/include/asm/switch_to.h:44:20: note: 'disable_kernel_fp' de=
clared here
   static inline void disable_kernel_fp(void)
                      ^
   4 errors generated.
--
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
   <scratch space>:57:1: note: expanded from here
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
   <scratch space>:51:1: note: expanded from here
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
   <scratch space>:61:1: note: expanded from here
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

   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:1576:2: =
error: implicit declaration of function 'enable_kernel_vsx' [-Werror,-Wimpl=
icit-function-declaration]
           DC_FP_START();
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:68:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_vsx(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:1576:2: =
note: did you mean 'enable_kernel_fp'?
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:68:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_vsx(); \
                   ^
   arch/powerpc/include/asm/switch_to.h:40:13: note: 'enable_kernel_fp' dec=
lared here
   extern void enable_kernel_fp(void);
               ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:1576:2: =
error: implicit declaration of function 'enable_kernel_altivec' [-Werror,-W=
implicit-function-declaration]
           DC_FP_START();
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:71:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_altivec(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:1576:2: =
note: did you mean 'enable_kernel_fp'?
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:71:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_altivec(); \
                   ^
   arch/powerpc/include/asm/switch_to.h:40:13: note: 'enable_kernel_fp' dec=
lared here
   extern void enable_kernel_fp(void);
               ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:1578:2: =
error: implicit declaration of function 'disable_kernel_vsx' [-Werror,-Wimp=
licit-function-declaration]
           DC_FP_END();
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:79:3: note: expanded=
 from macro 'DC_FP_END'
                   disable_kernel_vsx(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:1578:2: =
note: did you mean 'disable_kernel_fp'?
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:79:3: note: expanded=
 from macro 'DC_FP_END'
                   disable_kernel_vsx(); \
                   ^
   arch/powerpc/include/asm/switch_to.h:44:20: note: 'disable_kernel_fp' de=
clared here
   static inline void disable_kernel_fp(void)
                      ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:1578:2: =
error: implicit declaration of function 'disable_kernel_altivec' [-Werror,-=
Wimplicit-function-declaration]
           DC_FP_END();
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:82:3: note: expanded=
 from macro 'DC_FP_END'
                   disable_kernel_altivec(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:1578:2: =
note: did you mean 'disable_kernel_fp'?
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:82:3: note: expanded=
 from macro 'DC_FP_END'
                   disable_kernel_altivec(); \
                   ^
   arch/powerpc/include/asm/switch_to.h:44:20: note: 'disable_kernel_fp' de=
clared here
   static inline void disable_kernel_fp(void)
                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2401:2: =
error: implicit declaration of function 'enable_kernel_vsx' [-Werror,-Wimpl=
icit-function-declaration]
           DC_FP_START();
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:68:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_vsx(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2401:2: =
error: implicit declaration of function 'enable_kernel_altivec' [-Werror,-W=
implicit-function-declaration]
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:71:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_altivec(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2403:2: =
error: implicit declaration of function 'disable_kernel_vsx' [-Werror,-Wimp=
licit-function-declaration]
           DC_FP_END();
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:79:3: note: expanded=
 from macro 'DC_FP_END'
                   disable_kernel_vsx(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2403:2: =
error: implicit declaration of function 'disable_kernel_altivec' [-Werror,-=
Wimplicit-function-declaration]
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:82:3: note: expanded=
 from macro 'DC_FP_END'
                   disable_kernel_altivec(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2463:2: =
error: implicit declaration of function 'enable_kernel_vsx' [-Werror,-Wimpl=
icit-function-declaration]
           DC_FP_START();
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:68:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_vsx(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2463:2: =
error: implicit declaration of function 'enable_kernel_altivec' [-Werror,-W=
implicit-function-declaration]
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:71:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_altivec(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2465:2: =
error: implicit declaration of function 'disable_kernel_vsx' [-Werror,-Wimp=
licit-function-declaration]
           DC_FP_END();
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:79:3: note: expanded=
 from macro 'DC_FP_END'
                   disable_kernel_vsx(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2465:2: =
error: implicit declaration of function 'disable_kernel_altivec' [-Werror,-=
Wimplicit-function-declaration]
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:82:3: note: expanded=
 from macro 'DC_FP_END'
                   disable_kernel_altivec(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2537:4: =
error: implicit declaration of function 'enable_kernel_vsx' [-Werror,-Wimpl=
icit-function-declaration]
                           DC_FP_START();
                           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:68:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_vsx(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2537:4: =
error: implicit declaration of function 'enable_kernel_altivec' [-Werror,-W=
implicit-function-declaration]
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:71:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_altivec(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2540:4: =
error: implicit declaration of function 'disable_kernel_vsx' [-Werror,-Wimp=
licit-function-declaration]
                           DC_FP_END();
                           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:79:3: note: expanded=
 from macro 'DC_FP_END'
                   disable_kernel_vsx(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2540:4: =
error: implicit declaration of function 'disable_kernel_altivec' [-Werror,-=
Wimplicit-function-declaration]
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:82:3: note: expanded=
 from macro 'DC_FP_END'
                   disable_kernel_altivec(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2644:2: =
error: implicit declaration of function 'enable_kernel_vsx' [-Werror,-Wimpl=
icit-function-declaration]
           DC_FP_START();
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:68:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_vsx(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2644:2: =
error: implicit declaration of function 'enable_kernel_altivec' [-Werror,-W=
implicit-function-declaration]
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:71:3: note: expanded=
 from macro 'DC_FP_START'
                   enable_kernel_altivec(); \
                   ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:2923:2: =
error: implicit declaration of function 'disable_kernel_vsx' [-Werror,-Wimp=
licit-function-declaration]
           DC_FP_END();
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:79:3: note: expanded=
 from macro 'DC_FP_END'
                   disable_kernel_vsx(); \
                   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
   115 warnings and 20 errors generated.


vim +/enable_kernel_altivec +214 drivers/gpu/drm/amd/amdgpu/../display/dc/c=
lk_mgr/dcn30/dcn30_clk_mgr.c

   159	=

   160	void dcn3_init_clocks(struct clk_mgr *clk_mgr_base)
   161	{
   162		struct clk_mgr_internal *clk_mgr =3D TO_CLK_MGR_INTERNAL(clk_mgr_ba=
se);
   163		unsigned int num_levels;
   164	=

   165		memset(&(clk_mgr_base->clks), 0, sizeof(struct dc_clocks));
   166		clk_mgr_base->clks.p_state_change_support =3D true;
   167		clk_mgr_base->clks.prev_p_state_change_support =3D true;
   168		clk_mgr->smu_present =3D false;
   169	=

   170		if (!clk_mgr_base->bw_params)
   171			return;
   172	=

   173		if (!clk_mgr_base->force_smu_not_present && dcn30_smu_get_smu_versi=
on(clk_mgr, &clk_mgr->smu_ver))
   174			clk_mgr->smu_present =3D true;
   175	=

   176		if (!clk_mgr->smu_present)
   177			return;
   178	=

   179		// do we fail if these fail? if so, how? do we not care to check?
   180		dcn30_smu_check_driver_if_version(clk_mgr);
   181		dcn30_smu_check_msg_header_version(clk_mgr);
   182	=

   183		/* DCFCLK */
   184		dcn3_init_single_clock(clk_mgr, PPCLK_DCEFCLK,
   185				&clk_mgr_base->bw_params->clk_table.entries[0].dcfclk_mhz,
   186				&num_levels);
   187	=

   188		/* DTBCLK */
   189		dcn3_init_single_clock(clk_mgr, PPCLK_DTBCLK,
   190				&clk_mgr_base->bw_params->clk_table.entries[0].dtbclk_mhz,
   191				&num_levels);
   192	=

   193		// DPREFCLK ???
   194	=

   195		/* DISPCLK */
   196		dcn3_init_single_clock(clk_mgr, PPCLK_DISPCLK,
   197				&clk_mgr_base->bw_params->clk_table.entries[0].dispclk_mhz,
   198				&num_levels);
   199	=

   200		/* DPPCLK */
   201		dcn3_init_single_clock(clk_mgr, PPCLK_PIXCLK,
   202				&clk_mgr_base->bw_params->clk_table.entries[0].dppclk_mhz,
   203				&num_levels);
   204	=

   205		/* PHYCLK */
   206		dcn3_init_single_clock(clk_mgr, PPCLK_PHYCLK,
   207				&clk_mgr_base->bw_params->clk_table.entries[0].phyclk_mhz,
   208				&num_levels);
   209	=

   210		/* Get UCLK, update bounding box */
   211		clk_mgr_base->funcs->get_memclk_states_from_smu(clk_mgr_base);
   212	=

   213		/* WM range table */
 > 214		DC_FP_START();
   215		dcn3_build_wm_range_table(clk_mgr);
 > 216		DC_FP_END();
   217	}
   218	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8261358384574523650==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8261358384574523650==--

