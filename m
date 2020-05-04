Content-Type: multipart/mixed; boundary="===============0625290157970944443=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 1/2] timer: make deferrable cpu unbound timers really not bound to a cpu
Date: Tue, 05 May 2020 02:11:10 +0800
Message-ID: <202005050240.43QyO4uy%lkp@intel.com>
In-Reply-To: <1588444137-18651-2-git-send-email-psodagud@codeaurora.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0625290157970944443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Prasad,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tip/timers/core]
[also build test ERROR on tip/auto-latest tip/timers/nohz v5.7-rc4 next-202=
00501]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Prasad-Sodagudi/timer-make=
-deferrable-cpu-unbound-timers-really-not-bound-to-a-cpu/20200503-025049
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 4479730=
e9263befbb9ce9563a09563db2acb8f7c
config: riscv-nommu_virt_defconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/time/timer.c: In function 'get_timer_cpu_base':
>> kernel/time/timer.c:847:11: error: 'timer_base_deferrable' undeclared (f=
irst use in this function)
     847 |   base =3D &timer_base_deferrable;
         |           ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/timer.c:847:11: note: each undeclared identifier is reported=
 only once for each function it appears in
   kernel/time/timer.c: In function 'get_timer_this_cpu_base':
   kernel/time/timer.c:866:11: error: 'timer_base_deferrable' undeclared (f=
irst use in this function)
     866 |   base =3D &timer_base_deferrable;
         |           ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/timer.c: In function 'run_timer_softirq':
   kernel/time/timer.c:1805:18: error: 'timer_base_deferrable' undeclared (=
first use in this function)
    1805 |    __run_timers(&timer_base_deferrable);
         |                  ^~~~~~~~~~~~~~~~~~~~~

vim +/timer_base_deferrable +847 kernel/time/timer.c

   836	=

   837	static inline struct timer_base *get_timer_cpu_base(u32 tflags, u32 =
cpu)
   838	{
   839		struct timer_base *base =3D per_cpu_ptr(&timer_bases[BASE_STD], cpu=
);
   840	=

   841		/*
   842		 * If the timer is deferrable and NO_HZ_COMMON is set then we need
   843		 * to use the deferrable base.
   844		 */
   845		if (IS_ENABLED(CONFIG_NO_HZ_COMMON) && (tflags & TIMER_DEFERRABLE))=
 {
   846	#ifdef CONFIG_SMP
 > 847			base =3D &timer_base_deferrable;
   848	#endif
   849			if (tflags & TIMER_PINNED)
   850				base =3D per_cpu_ptr(&timer_bases[BASE_DEF], cpu);
   851		}
   852	=

   853		return base;
   854	}
   855	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0625290157970944443==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
OIuhXwAA
--===============0625290157970944443==--

