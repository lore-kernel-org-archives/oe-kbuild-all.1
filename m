Content-Type: multipart/mixed; boundary="===============5614002852604603137=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-rt-devel:linux-5.9.y-rt-rebase 60/234] kernel/printk/printk.c:2581:6: error: implicit declaration of function 'kernel_sync_mode'
Date: Thu, 22 Oct 2020 00:23:26 +0800
Message-ID: <202010220023.Ww0uDiBG-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5614002852604603137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.9.y-rt-rebase
head:   fccd942429797174ebfca28a778701a9df9c1277
commit: 1029cb12f2704d89fabdc62b7581e17be7662245 [60/234] printk: introduce=
 kernel sync mode
config: riscv-allnoconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
.git/commit/?id=3D1029cb12f2704d89fabdc62b7581e17be7662245
        git remote add linux-rt-devel https://git.kernel.org/pub/scm/linux/=
kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags linux-rt-devel linux-5.9.y-rt-rebase
        git checkout 1029cb12f2704d89fabdc62b7581e17be7662245
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:62:
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

--===============5614002852604603137==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Rt1QnM66EQAuTqt2VkyDZJkJgf8XiN7B89xMAAA=
--===============5614002852604603137==--

