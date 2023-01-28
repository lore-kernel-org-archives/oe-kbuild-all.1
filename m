Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BFF23CB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 05:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674883164; x=1706419164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=imUqG8sbhmker0SioIaovpU5QLtTcEPs1fEifLvcDgI=;
  b=LgQvMYaGIuH4BzTYrDkP454WIyH4i6PdjLlNSqotflWFogu3rZgT8/QG
   hPHDUwlBADj0EIE3CuiGV/ZjIMM4bRYQHx3Rk34ZAgrcjv5H4lONCaMMB
   iCFoRAnyu/aONFvtwfoyWDv4z1VLoVkMctFOFjbFZWBFsJSJ9fiI0trMS
   2MbUJHx7c+WxFZbZdugx4Mntpu+JqyG1c6qJYBtV8fHBT71RAYNd0y+yt
   xgwjXeNEVysIjPn5lbmw8A/vzs0YOP893Jk0q80ARKziuUSVFwdpyHgLM
   jOQdDV9pjo9q5JBvV2jUp5hnbrTxAFmTGXfvIEuYUNyazbMaCsWEHcbY9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="391818199"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="391818199"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 21:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="992311960"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="992311960"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Jan 2023 21:19:18 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLdcT-0000Pn-1x;
	Sat, 28 Jan 2023 05:19:17 +0000
Date: Sat, 28 Jan 2023 13:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [atishp04:dev/atishp/kvm_aptee_guest_rfc 97/109]
 include/linux/io.h:89:24: error: implicit declaration of function
 'ioremap_driver_hardened_np'; did you mean 'ioremap_driver_hardened_uc'?
Message-ID: <202301281300.upMfqnl2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux dev/atishp/kvm_aptee_guest_rfc
head:   adf357593cff6780e32553a751d6cb7bb88dd6a6
commit: 0a94986ec599af4753ae09044918266401a266c3 [97/109] pci: iomap: Mark ioremap shared when the device is authorized.
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230128/202301281300.upMfqnl2-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/0a94986ec599af4753ae09044918266401a266c3
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 dev/atishp/kvm_aptee_guest_rfc
        git checkout 0a94986ec599af4753ae09044918266401a266c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

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
   include/linux/seqlock.h: In function '__seqprop_assert':
>> include/asm-generic/percpu.h:31:40: error: implicit declaration of function 'raw_smp_processor_id' [-Werror=implicit-function-declaration]
      31 | #define __my_cpu_offset per_cpu_offset(raw_smp_processor_id())
         |                                        ^~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/linux/lockdep.h:611:9: note: in expansion of macro 'WARN_ON_ONCE'
     611 |         WARN_ON_ONCE(IS_ENABLED(CONFIG_PREEMPT_COUNT)   &&              \
         |         ^~~~~~~~~~~~
   include/linux/compiler_types.h:346:9: note: in expansion of macro '__compiletime_assert'
     346 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:358:9: note: in expansion of macro '_compiletime_assert'
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:119:18: note: in expansion of macro 'READ_ONCE'
     119 |         ___ret = READ_ONCE(*raw_cpu_ptr(&(pcp)));                       \
         |                  ^~~~~~~~~
   include/linux/percpu-defs.h:231:9: note: in expansion of macro 'RELOC_HIDE'
     231 |         RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
         |         ^~~~~~~~~~
   include/asm-generic/percpu.h:44:31: note: in expansion of macro 'SHIFT_PERCPU_PTR'
      44 | #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
         |                               ^~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:31:25: note: in expansion of macro 'per_cpu_offset'
      31 | #define __my_cpu_offset per_cpu_offset(raw_smp_processor_id())
         |                         ^~~~~~~~~~~~~~
   include/asm-generic/percpu.h:44:53: note: in expansion of macro '__my_cpu_offset'
      44 | #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
         |                                                     ^~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:242:9: note: in expansion of macro 'arch_raw_cpu_ptr'
     242 |         arch_raw_cpu_ptr(ptr);                                          \
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:119:29: note: in expansion of macro 'raw_cpu_ptr'
     119 |         ___ret = READ_ONCE(*raw_cpu_ptr(&(pcp)));                       \
         |                             ^~~~~~~~~~~
   include/asm-generic/percpu.h:138:25: note: in expansion of macro '__this_cpu_generic_read_nopreempt'
     138 |                 __ret = __this_cpu_generic_read_nopreempt(pcp);         \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:320:41: note: in expansion of macro 'this_cpu_generic_read'
     320 | #define this_cpu_read_1(pcp)            this_cpu_generic_read(pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:321:30: note: in expansion of macro 'this_cpu_read_1'
     321 |         case 1: pscr_ret__ = stem##1(variable); break;                  \
         |                              ^~~~
   include/linux/percpu-defs.h:507:41: note: in expansion of macro '__pcpu_size_call_return'
     507 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:584:50: note: in expansion of macro 'this_cpu_read'
     584 | #define __lockdep_enabled       (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                                  ^~~~~~~~~~~~~
   include/linux/lockdep.h:612:22: note: in expansion of macro '__lockdep_enabled'
     612 |                      __lockdep_enabled                  &&              \
         |                      ^~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:269:9: note: in expansion of macro 'lockdep_assert_preemption_disabled'
     269 |         lockdep_assert_preemption_disabled();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/topology.h:36,
                    from include/linux/gfp.h:8,
                    from include/linux/xarray.h:15,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/io.h:13,
                    from arch/mips/include/asm/mips-cps.h:11,
                    from arch/mips/include/asm/smp-ops.h:16,
                    from arch/mips/include/asm/smp.h:21,
                    from include/linux/smp.h:113:
   include/linux/topology.h: In function 'cpu_smt_mask':
>> arch/mips/include/asm/topology.h:18:51: error: 'cpu_sibling_map' undeclared (first use in this function)
      18 | #define topology_sibling_cpumask(cpu)           (&cpu_sibling_map[cpu])
         |                                                   ^~~~~~~~~~~~~~~
   include/linux/topology.h:239:16: note: in expansion of macro 'topology_sibling_cpumask'
     239 |         return topology_sibling_cpumask(cpu);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/topology.h:18:51: note: each undeclared identifier is reported only once for each function it appears in
      18 | #define topology_sibling_cpumask(cpu)           (&cpu_sibling_map[cpu])
         |                                                   ^~~~~~~~~~~~~~~
   include/linux/topology.h:239:16: note: in expansion of macro 'topology_sibling_cpumask'
     239 |         return topology_sibling_cpumask(cpu);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/topology.h:237:54: warning: parameter 'cpu' set but not used [-Wunused-but-set-parameter]
     237 | static inline const struct cpumask *cpu_smt_mask(int cpu)
         |                                                  ~~~~^~~
   include/linux/io.h: In function 'pci_remap_cfgspace':
>> include/linux/io.h:89:24: error: implicit declaration of function 'ioremap_driver_hardened_np'; did you mean 'ioremap_driver_hardened_uc'? [-Werror=implicit-function-declaration]
      89 |                 return ioremap_driver_hardened_np(offset, size) ?:
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        ioremap_driver_hardened_uc
>> include/linux/io.h:89:66: warning: pointer/integer type mismatch in conditional expression
      89 |                 return ioremap_driver_hardened_np(offset, size) ?:
         |                                                                  ^
   arch/mips/include/asm/smp.h: At top level:
>> arch/mips/include/asm/smp.h:28:19: error: static declaration of 'raw_smp_processor_id' follows non-static declaration
      28 | static inline int raw_smp_processor_id(void)
         |                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:31:40: note: previous implicit declaration of 'raw_smp_processor_id' with type 'int()'
      31 | #define __my_cpu_offset per_cpu_offset(raw_smp_processor_id())
         |                                        ^~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/linux/lockdep.h:611:9: note: in expansion of macro 'WARN_ON_ONCE'
     611 |         WARN_ON_ONCE(IS_ENABLED(CONFIG_PREEMPT_COUNT)   &&              \
         |         ^~~~~~~~~~~~
   include/linux/compiler_types.h:346:9: note: in expansion of macro '__compiletime_assert'
     346 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:358:9: note: in expansion of macro '_compiletime_assert'
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:119:18: note: in expansion of macro 'READ_ONCE'
     119 |         ___ret = READ_ONCE(*raw_cpu_ptr(&(pcp)));                       \
         |                  ^~~~~~~~~
   include/linux/percpu-defs.h:231:9: note: in expansion of macro 'RELOC_HIDE'
     231 |         RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
         |         ^~~~~~~~~~
   include/asm-generic/percpu.h:44:31: note: in expansion of macro 'SHIFT_PERCPU_PTR'
      44 | #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
         |                               ^~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:31:25: note: in expansion of macro 'per_cpu_offset'
      31 | #define __my_cpu_offset per_cpu_offset(raw_smp_processor_id())
         |                         ^~~~~~~~~~~~~~
   include/asm-generic/percpu.h:44:53: note: in expansion of macro '__my_cpu_offset'
      44 | #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
         |                                                     ^~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:242:9: note: in expansion of macro 'arch_raw_cpu_ptr'
     242 |         arch_raw_cpu_ptr(ptr);                                          \
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:119:29: note: in expansion of macro 'raw_cpu_ptr'
     119 |         ___ret = READ_ONCE(*raw_cpu_ptr(&(pcp)));                       \
         |                             ^~~~~~~~~~~
   include/asm-generic/percpu.h:138:25: note: in expansion of macro '__this_cpu_generic_read_nopreempt'
     138 |                 __ret = __this_cpu_generic_read_nopreempt(pcp);         \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:320:41: note: in expansion of macro 'this_cpu_generic_read'
     320 | #define this_cpu_read_1(pcp)            this_cpu_generic_read(pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:321:30: note: in expansion of macro 'this_cpu_read_1'
     321 |         case 1: pscr_ret__ = stem##1(variable); break;                  \
         |                              ^~~~
   include/linux/percpu-defs.h:507:41: note: in expansion of macro '__pcpu_size_call_return'
     507 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:584:50: note: in expansion of macro 'this_cpu_read'
     584 | #define __lockdep_enabled       (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                                  ^~~~~~~~~~~~~
   include/linux/lockdep.h:612:22: note: in expansion of macro '__lockdep_enabled'
     612 |                      __lockdep_enabled                  &&              \
         |                      ^~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:269:9: note: in expansion of macro 'lockdep_assert_preemption_disabled'
     269 |         lockdep_assert_preemption_disabled();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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


vim +89 include/linux/io.h

    71	
    72	#ifdef CONFIG_PCI
    73	/*
    74	 * The PCI specifications (Rev 3.0, 3.2.5 "Transaction Ordering and
    75	 * Posting") mandate non-posted configuration transactions. This default
    76	 * implementation attempts to use the ioremap_np() API to provide this
    77	 * on arches that support it, and falls back to ioremap() on those that
    78	 * don't. Overriding this function is deprecated; arches that properly
    79	 * support non-posted accesses should implement ioremap_np() instead, which
    80	 * this default implementation can then use to return mappings compliant with
    81	 * the PCI specification.
    82	 */
    83	#ifndef pci_remap_cfgspace
    84	#define pci_remap_cfgspace pci_remap_cfgspace
    85	static inline void __iomem *pci_remap_cfgspace(struct device *dev,
    86						       phys_addr_t offset, size_t size)
    87	{
    88		if (dev_is_authorized(dev)) {
  > 89			return ioremap_driver_hardened_np(offset, size) ?:
    90				       ioremap_driver_hardened(offset, size);
    91		}
    92	
    93		return ioremap_np(offset, size) ?: ioremap(offset, size);
    94	}
    95	#endif
    96	#endif
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
