Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A38EAD29
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 23:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675208132; x=1706744132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H8s7Cy90Ys5eALQFCiwgz+qSIT3LLR6+se67arA2Pbg=;
  b=hI2yu1Qlw3fdYOYz8gtgIA/5th9Rnupy4ckVmSzI0IQbcsRUTqlBHDjD
   QFnOZ+srm9TQGvR75zTKvOv4V9+z6QGHGy7X6qS15Z8K8FjbgliG91pUx
   8nSEycJWRAxR8fmV5H7g7DByY5cKRo+o6RozQW/kPxfuE+bGag2mjlAYO
   xBWy8xV8EHtc4262IFkjoGIAjqc7KltW/W11fkyoX4LxLAjgv0Y8vVDdn
   2Q8ORwLrLKkMrsQa2qsOtDNYm4IQq0NE1OQDg2jvau2XGH4XUo387Btz8
   IDXAd4t4851GV+lb+PKu/Rtu8hzhY7MqRKUdAmjAmsajAu4oCWyJBM0vc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="392544871"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="392544871"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 15:35:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="658078413"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="658078413"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Jan 2023 15:35:30 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN09x-0004ne-2M;
	Tue, 31 Jan 2023 23:35:29 +0000
Date: Wed, 1 Feb 2023 07:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 371/371]
 include/linux/kvm_host.h:429:9: error: implicit declaration of function
 'perf_event_guest_enter_exit'
Message-ID: <202302010721.u5U0qGW8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   236af3da84d067f3af446ccf2211937cd9ddc42f
commit: 236af3da84d067f3af446ccf2211937cd9ddc42f [371/371] perf, KVM: introduce software event on enter/exit to/from guest
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302010721.u5U0qGW8-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/236af3da84d067f3af446ccf2211937cd9ddc42f
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 236af3da84d067f3af446ccf2211937cd9ddc42f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/mips/kernel/asm-offsets.c:24:
   include/linux/kvm_host.h: In function 'guest_context_enter_irqoff':
>> include/linux/kvm_host.h:429:9: error: implicit declaration of function 'perf_event_guest_enter_exit' [-Werror=implicit-function-declaration]
     429 |         perf_event_guest_enter_exit(true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:10,
                    from include/linux/kernel.h:29,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from arch/mips/kernel/asm-offsets.c:12:
   include/linux/kvm_host.h: In function 'mmu_invalidate_retry_gfn':
   include/linux/kvm_host.h:1987:69: error: 'INVALID_GPA' undeclared (first use in this function); did you mean 'INVALID_GID'?
    1987 |                 if (WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA ||
         |                                                                     ^~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/linux/kvm_host.h:1987:21: note: in expansion of macro 'WARN_ON_ONCE'
    1987 |                 if (WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA ||
         |                     ^~~~~~~~~~~~
   include/linux/kvm_host.h:1987:69: note: each undeclared identifier is reported only once for each function it appears in
    1987 |                 if (WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA ||
         |                                                                     ^~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/linux/kvm_host.h:1987:21: note: in expansion of macro 'WARN_ON_ONCE'
    1987 |                 if (WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA ||
         |                     ^~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c: At top level:
   arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      26 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      78 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:92:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      92 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:108:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
     108 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:136:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     136 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:179:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     179 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:213:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     213 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:248:6: warning: no previous prototype for 'output_signal_defined' [-Wmissing-prototypes]
     248 | void output_signal_defined(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:315:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
     315 | void output_pbe_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:327:6: warning: no previous prototype for 'output_pm_defines' [-Wmissing-prototypes]
     327 | void output_pm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:341:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
     341 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:385:6: warning: no previous prototype for 'output_cps_defines' [-Wmissing-prototypes]
     385 | void output_cps_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/mips/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1298: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/perf_event_guest_enter_exit +429 include/linux/kvm_host.h

   418	
   419	/*
   420	 * Enter guest context and enter an RCU extended quiescent state.
   421	 *
   422	 * Between guest_context_enter_irqoff() and guest_context_exit_irqoff() it is
   423	 * unsafe to use any code which may directly or indirectly use RCU, tracing
   424	 * (including IRQ flag tracing), or lockdep. All code in this period must be
   425	 * non-instrumentable.
   426	 */
   427	static __always_inline void guest_context_enter_irqoff(void)
   428	{
 > 429		perf_event_guest_enter_exit(true);
   430		/*
   431		 * KVM does not hold any references to rcu protected data when it
   432		 * switches CPU into a guest mode. In fact switching to a guest mode
   433		 * is very similar to exiting to userspace from rcu point of view. In
   434		 * addition CPU may stay in a guest mode for quite a long time (up to
   435		 * one time slice). Lets treat guest mode as quiescent state, just like
   436		 * we do with user-mode execution.
   437		 */
   438		if (!context_tracking_guest_enter()) {
   439			instrumentation_begin();
   440			rcu_virt_note_context_switch();
   441			instrumentation_end();
   442		}
   443	}
   444	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
