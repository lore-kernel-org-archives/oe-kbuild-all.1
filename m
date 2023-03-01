Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82C57F0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 01:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677635401; x=1709171401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2p86riLdL+Wxxi2QLIfdaMhKAyAtIQl7MyUA/aG0tOw=;
  b=a4QjgXVu8wyWjskRmszz2pu9aJqvucSZWpaFl1bX9OQfrJPHUWdxZecD
   hXN4WVaMiFrqJfYct9HW4Zi6OVdFsWC9nWBDKKGbzY6zBL9QlsHXwgXNi
   JoABucJVtc0hyRTEnuCdKTgZL62gCu6i+di9+dGsJKV7xIbfyxQfsEsr9
   4aPrQiwe9lqXWOwR2OoDxnXJbREsPgd5ERZa34aOZJ9S8ybJadmmu/qxg
   3tYVYKfh18xj2gCg7sy7sNaIG896+q8+5mngZJzh8tFmqv1BdEQYecHuI
   7yk5KlzUlpMz2usephXm2N58dvoseqfKToCPUVmlgifw4i9qSm5Wubxdc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="318096507"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="318096507"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 17:50:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="743214277"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="743214277"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Feb 2023 17:49:59 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXBbT-0005nD-0E;
	Wed, 01 Mar 2023 01:49:59 +0000
Date: Wed, 1 Mar 2023 09:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 435/440]
 include/linux/kvm_host.h:429:9: error: implicit declaration of function
 'perf_event_guest_enter_exit'
Message-ID: <202303010928.pHvmvPop-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   25e27d15be5f548279167332c188b71c12dcbc16
commit: 0ea2d2b6d40746cf86286944a3e2852c4b86a360 [435/440] perf, KVM: introduce software event on enter/exit to/from guest
config: mips-randconfig-r015-20230226 (https://download.01.org/0day-ci/archive/20230301/202303010928.pHvmvPop-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/0ea2d2b6d40746cf86286944a3e2852c4b86a360
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 0ea2d2b6d40746cf86286944a3e2852c4b86a360
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303010928.pHvmvPop-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/kernel/asm-offsets.c:24:
   include/linux/kvm_host.h: In function 'guest_context_enter_irqoff':
>> include/linux/kvm_host.h:429:9: error: implicit declaration of function 'perf_event_guest_enter_exit' [-Werror=implicit-function-declaration]
     429 |         perf_event_guest_enter_exit(true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   arch/mips/kernel/asm-offsets.c:179:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     179 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:235:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     235 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:248:6: warning: no previous prototype for 'output_signal_defined' [-Wmissing-prototypes]
     248 | void output_signal_defined(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
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
