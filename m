Content-Type: multipart/mixed; boundary="===============5061413558399089761=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-stable-rc:linux-4.4.y 7217/9999] kernel/locking/spinlock_debug.c:85:30: warning: comparison of integer expressions of different signedness: 'unsigned int' and 'int'
Date: Tue, 12 Jan 2021 14:04:29 +0800
Message-ID: <202101121414.7hGrPzU8-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5061413558399089761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-4.4.y
head:   95a3867e897abd7811196123f81a119a75aba863
commit: e3484129eb0f7c67c85868d1584f1e6335e86efa [7217/9999] MIPS: VDSO: Pr=
event use of smp_processor_id()
config: mips-randconfig-r014-20210111 (attached as .config)
compiler: mipsel-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git/commit/?id=3De3484129eb0f7c67c85868d1584f1e6335e86efa
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux=
/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-4.4.y
        git checkout e3484129eb0f7c67c85868d1584f1e6335e86efa
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/mips/include/asm/bug.h:41,
                    from include/linux/bug.h:4,
                    from include/linux/thread_info.h:11,
                    from include/asm-generic/preempt.h:4,
                    from arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:59,
                    from include/linux/spinlock.h:50,
                    from kernel/locking/spinlock_debug.c:9:
   include/linux/cpumask.h: In function 'cpumask_check':
   include/linux/cpumask.h:117:19: warning: comparison of integer expressio=
ns of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
     117 |  WARN_ON_ONCE(cpu >=3D nr_cpumask_bits);
         |                   ^~
   include/asm-generic/bug.h:112:27: note: in definition of macro 'WARN_ON_=
ONCE'
     112 |  int __ret_warn_once =3D !!(condition);   \
         |                           ^~~~~~~~~
   In file included from include/linux/linkage.h:4,
                    from include/linux/preempt.h:9,
                    from include/linux/spinlock.h:50,
                    from kernel/locking/spinlock_debug.c:9:
   kernel/locking/spinlock_debug.c: In function 'debug_spin_lock_before':
>> kernel/locking/spinlock_debug.c:85:30: warning: comparison of integer ex=
pressions of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
      85 |  SPIN_BUG_ON(lock->owner_cpu =3D=3D raw_smp_processor_id(),
         |                              ^~
   include/linux/compiler.h:182:42: note: in definition of macro 'unlikely'
     182 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   kernel/locking/spinlock_debug.c:85:2: note: in expansion of macro 'SPIN_=
BUG_ON'
      85 |  SPIN_BUG_ON(lock->owner_cpu =3D=3D raw_smp_processor_id(),
         |  ^~~~~~~~~~~
   kernel/locking/spinlock_debug.c: In function 'debug_spin_unlock':
   kernel/locking/spinlock_debug.c:100:30: warning: comparison of integer e=
xpressions of different signedness: 'unsigned int' and 'int' [-Wsign-compar=
e]
     100 |  SPIN_BUG_ON(lock->owner_cpu !=3D raw_smp_processor_id(),
         |                              ^~
   include/linux/compiler.h:182:42: note: in definition of macro 'unlikely'
     182 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   kernel/locking/spinlock_debug.c:100:2: note: in expansion of macro 'SPIN=
_BUG_ON'
     100 |  SPIN_BUG_ON(lock->owner_cpu !=3D raw_smp_processor_id(),
         |  ^~~~~~~~~~~
   kernel/locking/spinlock_debug.c: In function 'debug_write_lock_before':
   kernel/locking/spinlock_debug.c:230:32: warning: comparison of integer e=
xpressions of different signedness: 'unsigned int' and 'int' [-Wsign-compar=
e]
     230 |  RWLOCK_BUG_ON(lock->owner_cpu =3D=3D raw_smp_processor_id(),
         |                                ^~
   include/linux/compiler.h:182:42: note: in definition of macro 'unlikely'
     182 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   kernel/locking/spinlock_debug.c:230:2: note: in expansion of macro 'RWLO=
CK_BUG_ON'
     230 |  RWLOCK_BUG_ON(lock->owner_cpu =3D=3D raw_smp_processor_id(),
         |  ^~~~~~~~~~~~~
   kernel/locking/spinlock_debug.c: In function 'debug_write_unlock':
   kernel/locking/spinlock_debug.c:244:32: warning: comparison of integer e=
xpressions of different signedness: 'unsigned int' and 'int' [-Wsign-compar=
e]
     244 |  RWLOCK_BUG_ON(lock->owner_cpu !=3D raw_smp_processor_id(),
         |                                ^~
   include/linux/compiler.h:182:42: note: in definition of macro 'unlikely'
     182 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   kernel/locking/spinlock_debug.c:244:2: note: in expansion of macro 'RWLO=
CK_BUG_ON'
     244 |  RWLOCK_BUG_ON(lock->owner_cpu !=3D raw_smp_processor_id(),
         |  ^~~~~~~~~~~~~


vim +85 kernel/locking/spinlock_debug.c

fb1c8f93d869b34c lib/spinlock_debug.c Ingo Molnar     2005-09-10  79  =

9a11b49a805665e1 lib/spinlock_debug.c Ingo Molnar     2006-07-03  80  stati=
c inline void
c2f21ce2e31286a0 lib/spinlock_debug.c Thomas Gleixner 2009-12-02  81  debug=
_spin_lock_before(raw_spinlock_t *lock)
fb1c8f93d869b34c lib/spinlock_debug.c Ingo Molnar     2005-09-10  82  {
fb1c8f93d869b34c lib/spinlock_debug.c Ingo Molnar     2005-09-10  83  	SPIN=
_BUG_ON(lock->magic !=3D SPINLOCK_MAGIC, lock, "bad magic");
fb1c8f93d869b34c lib/spinlock_debug.c Ingo Molnar     2005-09-10  84  	SPIN=
_BUG_ON(lock->owner =3D=3D current, lock, "recursion");
fb1c8f93d869b34c lib/spinlock_debug.c Ingo Molnar     2005-09-10 @85  	SPIN=
_BUG_ON(lock->owner_cpu =3D=3D raw_smp_processor_id(),
fb1c8f93d869b34c lib/spinlock_debug.c Ingo Molnar     2005-09-10  86  					=
		lock, "cpu recursion");
fb1c8f93d869b34c lib/spinlock_debug.c Ingo Molnar     2005-09-10  87  }
fb1c8f93d869b34c lib/spinlock_debug.c Ingo Molnar     2005-09-10  88  =


:::::: The code at line 85 was first introduced by commit
:::::: fb1c8f93d869b34cacb8b8932e2b83d96a19d720 [PATCH] spinlock consolidat=
ion

:::::: TO: Ingo Molnar <mingo@elte.hu>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5061413558399089761==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5061413558399089761==--

