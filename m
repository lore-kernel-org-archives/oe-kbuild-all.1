Content-Type: multipart/mixed; boundary="===============3666049478882241901=="
MIME-Version: 1.0
From: Like Xu <like.xu@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] x86/perf: Use static_call for x86_pmu.guest_get_msrs
Date: Mon, 18 Jan 2021 21:05:06 +0800
Message-ID: <a82754e7-9a2d-7ab4-466d-fc0d51a3b7f2@linux.intel.com>
In-Reply-To: <202101182008.jQybUDa0-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3666049478882241901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I guess this fix will silence the compiler error,
and v2 will be sent after the local 0day test passes.

diff --git a/arch/x86/include/asm/perf_event.h =

b/arch/x86/include/asm/perf_event.h
index b9a7fd0a27e2..517f546b6b45 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -479,15 +479,11 @@ static inline void perf_events_lapic_init(void)   { }
  static inline void perf_check_microcode(void) { }
  #endif

-#if defined(CONFIG_PERF_EVENTS) && defined(CONFIG_CPU_SUP_INTEL)
  extern struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr);
+
+#if defined(CONFIG_PERF_EVENTS) && defined(CONFIG_CPU_SUP_INTEL)
  extern int x86_perf_get_lbr(struct x86_pmu_lbr *lbr);
  #else
-static inline struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr)
-{
-       *nr =3D 0;
-       return NULL;
-}
  static inline int x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
  {
         return -1;

On 2021/1/18 20:12, kernel test robot wrote:
> Hi Like,
> =

> Thank you for the patch! Yet something to improve:
> =

> [auto build test ERROR on tip/perf/core]
> [also build test ERROR on v5.11-rc4 next-20210118]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Like-Xu/x86-perf-Use-sta=
tic_call-for-x86_pmu-guest_get_msrs/20210118-153219
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 9a783=
2ce3d920426a36cdd78eda4b3568d4d09e3
> config: x86_64-randconfig-a002-20210118 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 95d1=
46182fdf2315e74943b93fb3bb0cbafc5d89)
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install x86_64 cross compiling tool for clang build
>          # apt-get install binutils-x86-64-linux-gnu
>          # https://github.com/0day-ci/linux/commit/0cd2262fad043a5edef91f=
ca07d16759703658b8
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Like-Xu/x86-perf-Use-static_cal=
l-for-x86_pmu-guest_get_msrs/20210118-153219
>          git checkout 0cd2262fad043a5edef91fca07d16759703658b8
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross A=
RCH=3Dx86_64
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>>> arch/x86/events/core.c:670:31: error: redefinition of 'perf_guest_get_m=
srs'
>     struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr)
>                                   ^
>     arch/x86/include/asm/perf_event.h:486:45: note: previous definition i=
s here
>     static inline struct perf_guest_switch_msr *perf_guest_get_msrs(int *=
nr)
>                                                 ^
>     1 error generated.
> =

> =

> vim +/perf_guest_get_msrs +670 arch/x86/events/core.c
> =

>     669	=

>   > 670	struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr)
>     671	{
>     672		struct perf_guest_switch_msr *ret =3D NULL;
>     673	=

>     674		ret =3D static_call(x86_pmu_guest_get_msrs)(nr);
>     675		if (!ret)
>     676			*nr =3D 0;
>     677	=

>     678		return ret;
>     679	}
>     680	EXPORT_SYMBOL_GPL(perf_guest_get_msrs);
>     681	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20

--===============3666049478882241901==--

