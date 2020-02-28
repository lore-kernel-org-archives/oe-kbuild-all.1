Content-Type: multipart/mixed; boundary="===============2641609077320133841=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [peterz-queue:locking/task_work 18/38] include/linux/rcupdate.h:197:3: error: implicit declaration of function 'rcu_irq_enter_irqsave'; did you mean 'rcu_irq_enter_irqsafe'?
Date: Sat, 29 Feb 2020 01:01:59 +0800
Message-ID: <202002290140.U0IcInyD%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2641609077320133841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git lo=
cking/task_work
head:   b9a78907dfb92b903d4d52402fc69a051cafa716
commit: a6377699039712759e256b989ffee5da7a50f791 [18/38] rcu,tracing: Creat=
e trace_rcu_{enter,exit}()
config: powerpc-mpc885_ads_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout a6377699039712759e256b989ffee5da7a50f791
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/workqueue.h:16:0,
                    from include/linux/rhashtable-types.h:15,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:14:
   include/linux/rcupdate.h: In function 'trace_rcu_enter':
>> include/linux/rcupdate.h:197:3: error: implicit declaration of function =
'rcu_irq_enter_irqsave'; did you mean 'rcu_irq_enter_irqsafe'? [-Werror=3Di=
mplicit-function-declaration]
      rcu_irq_enter_irqsave();
      ^~~~~~~~~~~~~~~~~~~~~
      rcu_irq_enter_irqsafe
   include/linux/rcupdate.h: In function 'trace_rcu_exit':
>> include/linux/rcupdate.h:204:3: error: implicit declaration of function =
'rcu_irq_exit_irqsave'; did you mean 'rcu_irq_exit_irqsafe'? [-Werror=3Dimp=
licit-function-declaration]
      rcu_irq_exit_irqsave();
      ^~~~~~~~~~~~~~~~~~~~
      rcu_irq_exit_irqsafe
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:101: arch/powerpc/kernel/asm-offset=
s.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1112: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:179: sub-make] Error 2
   43 real  7 user  10 sys  41.64% cpu 	make prepare

vim +197 include/linux/rcupdate.h

   177	=

   178	/**
   179	 * trace_rcu_enter - Force RCU to be active, for code that needs RCU=
 readers
   180	 *
   181	 * Very similar to RCU_NONIDLE() above.
   182	 *
   183	 * Tracing can happen while RCU isn't active yet, for instance in th=
e idle loop
   184	 * between rcu_idle_enter() and rcu_idle_exit(), or early in excepti=
on entry.
   185	 * RCU will happily ignore any read-side critical sections in this c=
ase.
   186	 *
   187	 * This function ensures that RCU is aware hereafter and the code ca=
n readily
   188	 * rely on RCU read-side critical sections working as expected.
   189	 *
   190	 * This function is NMI safe -- provided in_nmi() is correct and wil=
l nest up-to
   191	 * INT_MAX/2 times.
   192	 */
   193	static inline int trace_rcu_enter(void)
   194	{
   195		int state =3D !rcu_is_watching();
   196		if (state)
 > 197			rcu_irq_enter_irqsave();
   198		return state;
   199	}
   200	=

   201	static inline void trace_rcu_exit(int state)
   202	{
   203		if (state)
 > 204			rcu_irq_exit_irqsave();
   205	}
   206	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2641609077320133841==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2641609077320133841==--

