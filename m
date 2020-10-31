Content-Type: multipart/mixed; boundary="===============7894116272955607424=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-rt-devel:linux-5.10.y-rt-rebase 56/209] kernel/printk/printk.c:2581:6: error: implicit declaration of function 'kernel_sync_mode'
Date: Sat, 31 Oct 2020 20:07:14 +0800
Message-ID: <202010312012.FUiFbu22-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7894116272955607424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.10.y-rt-rebase
head:   87b7b3d2cb296950a0e3005406899ccfbbc9da7c
commit: e0b53ac1c94c7f836f3143f0257b06ce65eb1e3f [56/209] printk: introduce=
 kernel sync mode
config: ia64-allnoconfig (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
.git/commit/?id=3De0b53ac1c94c7f836f3143f0257b06ce65eb1e3f
        git remote add linux-rt-devel https://git.kernel.org/pub/scm/linux/=
kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags linux-rt-devel linux-5.10.y-rt-rebase
        git checkout e0b53ac1c94c7f836f3143f0257b06ce65eb1e3f
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dia64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/ia64/include/asm/pgtable.h:154,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:33,
                    from kernel/printk/printk.c:23:
   arch/ia64/include/asm/mmu_context.h: In function 'reload_context':
   arch/ia64/include/asm/mmu_context.h:137:41: warning: variable 'old_rr4' =
set but not used [-Wunused-but-set-variable]
     137 |  unsigned long rr0, rr1, rr2, rr3, rr4, old_rr4;
         |                                         ^~~~~~~
   In file included from kernel/printk/printk.c:62:
   kernel/printk/internal.h: At top level:
   kernel/printk/internal.h:56:20: warning: no previous prototype for 'vpri=
ntk_func' [-Wmissing-prototypes]
      56 | __printf(1, 0) int vprintk_func(const char *fmt, va_list args) {=
 return 0; }
         |                    ^~~~~~~~~~~~
   kernel/printk/printk.c:179:5: warning: no previous prototype for 'devkms=
g_sysctl_set_loglvl' [-Wmissing-prototypes]
     179 | int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2297:33: error: implicit declaration of function =
'ATOMI64_INIT'; did you mean 'ATOMIC64_INIT'? [-Werror=3Dimplicit-function-=
declaration]
    2297 | static atomic64_t console_seq =3D ATOMI64_INIT(0);
         |                                 ^~~~~~~~~~~~
         |                                 ATOMIC64_INIT
   kernel/printk/printk.c:2297:33: error: invalid initializer
   kernel/printk/printk.c: In function 'can_use_console':
>> kernel/printk/printk.c:2581:6: error: implicit declaration of function '=
kernel_sync_mode' [-Werror=3Dimplicit-function-declaration]
    2581 |  if (kernel_sync_mode())
         |      ^~~~~~~~~~~~~~~~
   kernel/printk/printk.c: At top level:
   kernel/printk/printk.c:3693:6: warning: no previous prototype for 'prb_l=
ock' [-Wmissing-prototypes]
    3693 | void prb_lock(struct prb_cpulock *cpu_lock, unsigned int *cpu_st=
ore)
         |      ^~~~~~~~
   kernel/printk/printk.c:3711:6: warning: no previous prototype for 'prb_u=
nlock' [-Wmissing-prototypes]
    3711 | void prb_unlock(struct prb_cpulock *cpu_lock, unsigned int cpu_s=
tore)
         |      ^~~~~~~~~~
   kernel/printk/printk.c:83:13: warning: 'sync_mode' defined but not used =
[-Wunused-variable]
      83 | static bool sync_mode;
         |             ^~~~~~~~~
   cc1: some warnings being treated as errors

vim +/kernel_sync_mode +2581 kernel/printk/printk.c

  2571	=

  2572	/*
  2573	 * Can we actually use the console at this time on this cpu?
  2574	 *
  2575	 * Console drivers may assume that per-cpu resources have been alloc=
ated. So
  2576	 * unless they're explicitly marked as being able to cope (CON_ANYTI=
ME) don't
  2577	 * call them until this CPU is officially up.
  2578	 */
  2579	static inline int can_use_console(void)
  2580	{
> 2581		if (kernel_sync_mode())
  2582			return false;
  2583		return cpu_online(raw_smp_processor_id()) || have_callable_console(=
);
  2584	}
  2585	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7894116272955607424==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
xIQrKnbvCoXzr79fu3WY+l8AAA==
--===============7894116272955607424==--

