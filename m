Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2346D77111
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 20:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754079408; cv=none; b=cQF07+/7D7a3oqq2JyQvJ8qSnR0zn0HTJm49veUFPITaH37zKHWQfsOO1QNNmVq1vpZvEhWB5L3IDPXz/fl4jQzE1+5aRgNUDxrDhGGwMbeAvUieEICo36jsir9Z+pZUnpv3lniIfQP2CK+p+ZqQD/nmsNlsAMB8y8kxkdxXAjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754079408; c=relaxed/simple;
	bh=CKZHeWRoZVvUjmWsaLvjSTO84hz6HONoyBGeQDN30Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V/0fSSEPd/GogVxoyxodpc9xlYFfDtqHoKDpc0tHiqh+6Cw8Pm0S5pX7Acaobshxw2xC8ZGV0aUAlrGO5a7Rio/TS6P7ZJcwAE5owkl3Dto1arq8d0iPDUDQlIJ+C69A8Mp0219SJiuKHSfn1VPdJtgcyVWhSX5e7Lh2qIWifcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDWxnGxV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDWxnGxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754079406; x=1785615406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CKZHeWRoZVvUjmWsaLvjSTO84hz6HONoyBGeQDN30Uo=;
  b=dDWxnGxV80rIf8iUGzTv0tdM7/qkFK2AewamBTV+bCRUgGBXuLmSgBhu
   RNUcTXkLUlY8z02vIUOQhGcxQ9fFTvQtMx1vQQhIGD3srZOWaGlHzwJ13
   UxUxlcdBIierTiEvTn2XT/pOPmZ0RLpEsy5hIj7mbikp4Dh77sZuAA0Rf
   lS4yxndaW4ggsMYNA1RtyAbtRn5Z6ZcsmwHyx7OE7LQYtBy9JBpkx5/K8
   mfoI4COUBIB10tiv57AuBEZVWwxGJW7NVhKifvT6YGiZ3547E+7/X7FWC
   /jrL2ZuuOABEZlvR1tdYqlxWR/OMWp12RDiFEEZdFegsG54Dpap5i8HiS
   Q==;
X-CSE-ConnectionGUID: FoXM5BtbSP2FUn0uwvUBWw==
X-CSE-MsgGUID: tD4ttRhoSrO3pTfPYAu8LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67128471"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="67128471"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 13:16:45 -0700
X-CSE-ConnectionGUID: uJPgcm2IS8idL+TBraJ+nA==
X-CSE-MsgGUID: ba8XYiaGTBmoJBRo8NVWIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163662621"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Aug 2025 13:16:44 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhwBF-0004ti-2s;
	Fri, 01 Aug 2025 20:16:41 +0000
Date: Sat, 2 Aug 2025 04:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_hybrid_automata 15/15]
 kernel/trace/rv/monitors/deadline/deadline.h:13:13: warning: variable
 'new_policy' set but not used
Message-ID: <202508020448.bBnlycQW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.com/glemco/linux staging_rv_hybrid_automata
head:   156c507ccabc31d6a60918a00fef988aa348ff4c
commit: 156c507ccabc31d6a60918a00fef988aa348ff4c [15/15] rv: Add deadline monitors
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250802/202508020448.bBnlycQW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020448.bBnlycQW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020448.bBnlycQW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/rv/monitors/deadline/deadline.c:9:
   kernel/trace/rv/monitors/deadline/deadline.h: In function 'extract_params':
   kernel/trace/rv/monitors/deadline/deadline.h:30:31: error: implicit declaration of function 'copy_struct_from_user' [-Werror=implicit-function-declaration]
      30 |                         ret = copy_struct_from_user(&attr, size, uattr, size);
         |                               ^~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/rv/monitors/deadline/deadline.h:13:13: warning: variable 'new_policy' set but not used [-Wunused-but-set-variable]
      13 |         int new_policy = -1, ret;
         |             ^~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from kernel/trace/rv/monitors/nomiss/nomiss.c:16:
   kernel/trace/rv/monitors/deadline/deadline.h: In function 'extract_params':
>> kernel/trace/rv/monitors/deadline/deadline.h:13:13: warning: variable 'new_policy' set but not used [-Wunused-but-set-variable]
      13 |         int new_policy = -1, ret;
         |             ^~~~~~~~~~
   In file included from arch/x86/include/asm/atomic.h:8,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:14,
                    from include/linux/alloc_tag.h:13,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from kernel/trace/rv/monitors/nomiss/nomiss.c:2:
   In function 'ha_reset_clk_ns',
       inlined from 'ha_reset_env' at kernel/trace/rv/monitors/nomiss/nomiss.c:69:3,
       inlined from 'ha_verify_constraint' at kernel/trace/rv/monitors/nomiss/nomiss.c:88:3,
       inlined from 'ha_monitor_handle_constraint' at include/rv/ha_monitor.h:262:6:
   arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size' declared with attribute error: Bad argument size for xchg
      67 |                         __ ## op ## _wrong_size();                      \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   arch/x86/include/asm/barrier.h:57:47: note: in expansion of macro 'xchg'
      57 | #define __smp_store_mb(var, value) do { (void)xchg(&var, value); } while (0)
         |                                               ^~~~
   include/asm-generic/barrier.h:160:52: note: in expansion of macro '__smp_store_mb'
     160 | #define smp_store_mb(var, value)  do { kcsan_mb(); __smp_store_mb(var, value); } while (0)
         |                                                    ^~~~~~~~~~~~~~
   include/rv/ha_monitor.h:314:9: note: in expansion of macro 'smp_store_mb'
     314 |         smp_store_mb(ha_mon->env_store[env], ktime_get_ns());
         |         ^~~~~~~~~~~~
   In function 'ha_reset_clk_ns',
       inlined from 'ha_reset_env' at kernel/trace/rv/monitors/nomiss/nomiss.c:69:3,
       inlined from 'ha_verify_constraint' at kernel/trace/rv/monitors/nomiss/nomiss.c:90:3,
       inlined from 'ha_monitor_handle_constraint' at include/rv/ha_monitor.h:262:6:
   arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size' declared with attribute error: Bad argument size for xchg
      67 |                         __ ## op ## _wrong_size();                      \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   arch/x86/include/asm/barrier.h:57:47: note: in expansion of macro 'xchg'
      57 | #define __smp_store_mb(var, value) do { (void)xchg(&var, value); } while (0)
         |                                               ^~~~
   include/asm-generic/barrier.h:160:52: note: in expansion of macro '__smp_store_mb'
     160 | #define smp_store_mb(var, value)  do { kcsan_mb(); __smp_store_mb(var, value); } while (0)
         |                                                    ^~~~~~~~~~~~~~
   include/rv/ha_monitor.h:314:9: note: in expansion of macro 'smp_store_mb'
     314 |         smp_store_mb(ha_mon->env_store[env], ktime_get_ns());
         |         ^~~~~~~~~~~~
   In function 'ha_monitor_reset_all_stored',
       inlined from 'ha_monitor_reset_env' at include/rv/ha_monitor.h:129:2,
       inlined from 'da_monitor_reset' at include/rv/da_monitor.h:81:2,
       inlined from 'ha_monitor_timer_callback' at include/rv/ha_monitor.h:298:2:
   arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size' declared with attribute error: Bad argument size for xchg
      67 |                         __ ## op ## _wrong_size();                      \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   arch/x86/include/asm/barrier.h:57:47: note: in expansion of macro 'xchg'
      57 | #define __smp_store_mb(var, value) do { (void)xchg(&var, value); } while (0)
         |                                               ^~~~
   include/asm-generic/barrier.h:160:52: note: in expansion of macro '__smp_store_mb'
     160 | #define smp_store_mb(var, value)  do { kcsan_mb(); __smp_store_mb(var, value); } while (0)
         |                                                    ^~~~~~~~~~~~~~
   include/rv/ha_monitor.h:98:17: note: in expansion of macro 'smp_store_mb'
      98 |                 smp_store_mb(ha_mon->env_store[i], ENV_INVALID_VALUE);
         |                 ^~~~~~~~~~~~
   In function 'ha_monitor_reset_all_stored',
       inlined from 'ha_monitor_reset_env' at include/rv/ha_monitor.h:129:2,
       inlined from 'da_monitor_reset' at include/rv/da_monitor.h:81:2,
       inlined from 'da_monitor_reset_all' at include/rv/da_monitor.h:343:3:
   arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size' declared with attribute error: Bad argument size for xchg
      67 |                         __ ## op ## _wrong_size();                      \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
--
   In file included from kernel/trace/rv/monitors/throttle/throttle.c:16:
   kernel/trace/rv/monitors/deadline/deadline.h: In function 'extract_params':
>> kernel/trace/rv/monitors/deadline/deadline.h:13:13: warning: variable 'new_policy' set but not used [-Wunused-but-set-variable]
      13 |         int new_policy = -1, ret;
         |             ^~~~~~~~~~
   In file included from arch/x86/include/asm/atomic.h:8,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:14,
                    from include/linux/alloc_tag.h:13,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from kernel/trace/rv/monitors/throttle/throttle.c:2:
   In function 'ha_reset_clk_ns',
       inlined from 'ha_reset_env' at kernel/trace/rv/monitors/throttle/throttle.c:75:3,
       inlined from 'ha_verify_constraint' at kernel/trace/rv/monitors/throttle/throttle.c:94:3,
       inlined from 'ha_monitor_handle_constraint' at include/rv/ha_monitor.h:262:6:
   arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size' declared with attribute error: Bad argument size for xchg
      67 |                         __ ## op ## _wrong_size();                      \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   arch/x86/include/asm/barrier.h:57:47: note: in expansion of macro 'xchg'
      57 | #define __smp_store_mb(var, value) do { (void)xchg(&var, value); } while (0)
         |                                               ^~~~
   include/asm-generic/barrier.h:160:52: note: in expansion of macro '__smp_store_mb'
     160 | #define smp_store_mb(var, value)  do { kcsan_mb(); __smp_store_mb(var, value); } while (0)
         |                                                    ^~~~~~~~~~~~~~
   include/rv/ha_monitor.h:314:9: note: in expansion of macro 'smp_store_mb'
     314 |         smp_store_mb(ha_mon->env_store[env], ktime_get_ns());
         |         ^~~~~~~~~~~~
   In function 'ha_reset_clk_ns',
       inlined from 'ha_reset_env' at kernel/trace/rv/monitors/throttle/throttle.c:75:3,
       inlined from 'ha_verify_constraint' at kernel/trace/rv/monitors/throttle/throttle.c:96:3,
       inlined from 'ha_monitor_handle_constraint' at include/rv/ha_monitor.h:262:6:
   arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size' declared with attribute error: Bad argument size for xchg
      67 |                         __ ## op ## _wrong_size();                      \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   arch/x86/include/asm/barrier.h:57:47: note: in expansion of macro 'xchg'
      57 | #define __smp_store_mb(var, value) do { (void)xchg(&var, value); } while (0)
         |                                               ^~~~
   include/asm-generic/barrier.h:160:52: note: in expansion of macro '__smp_store_mb'
     160 | #define smp_store_mb(var, value)  do { kcsan_mb(); __smp_store_mb(var, value); } while (0)
         |                                                    ^~~~~~~~~~~~~~
   include/rv/ha_monitor.h:314:9: note: in expansion of macro 'smp_store_mb'
     314 |         smp_store_mb(ha_mon->env_store[env], ktime_get_ns());
         |         ^~~~~~~~~~~~
   In function 'ha_reset_clk_ns',
       inlined from 'ha_reset_env' at kernel/trace/rv/monitors/throttle/throttle.c:75:3,
       inlined from 'ha_verify_constraint' at kernel/trace/rv/monitors/throttle/throttle.c:98:3,
       inlined from 'ha_monitor_handle_constraint' at include/rv/ha_monitor.h:262:6:
   arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size' declared with attribute error: Bad argument size for xchg
      67 |                         __ ## op ## _wrong_size();                      \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   arch/x86/include/asm/barrier.h:57:47: note: in expansion of macro 'xchg'
      57 | #define __smp_store_mb(var, value) do { (void)xchg(&var, value); } while (0)
         |                                               ^~~~
   include/asm-generic/barrier.h:160:52: note: in expansion of macro '__smp_store_mb'
     160 | #define smp_store_mb(var, value)  do { kcsan_mb(); __smp_store_mb(var, value); } while (0)
         |                                                    ^~~~~~~~~~~~~~
   include/rv/ha_monitor.h:314:9: note: in expansion of macro 'smp_store_mb'
     314 |         smp_store_mb(ha_mon->env_store[env], ktime_get_ns());
         |         ^~~~~~~~~~~~
   In function 'ha_monitor_reset_all_stored',
       inlined from 'ha_monitor_init_env' at include/rv/ha_monitor.h:112:2,
       inlined from 'da_monitor_start' at include/rv/da_monitor.h:94:2,
       inlined from 'da_handle_start_event.constprop.isra' at include/rv/da_monitor.h:518:3:
   arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size' declared with attribute error: Bad argument size for xchg
      67 |                         __ ## op ## _wrong_size();                      \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg


vim +/new_policy +13 kernel/trace/rv/monitors/deadline/deadline.h

     8	
     9	static inline int extract_params(struct pt_regs *regs, long id, struct task_struct **p)
    10	{
    11		size_t size = offsetof(struct sched_attr, sched_nice);
    12		struct sched_attr __user *uattr, attr;
  > 13		int new_policy = -1, ret;
    14		unsigned long args[6];
    15		pid_t pid;
    16	
    17		switch (id) {
    18			case __NR_sched_setscheduler:
    19				syscall_get_arguments(current, regs, args);
    20				pid = args[0];
    21				new_policy = args[1];
    22				break;
    23			case __NR_sched_setattr:
    24				syscall_get_arguments(current, regs, args);
    25				pid = args[0];
    26				uattr = (void *)args[1];
    27				/*
    28				 * Just copy up to sched_flags, we are not interested after that
    29				 */
  > 30				ret = copy_struct_from_user(&attr, size, uattr, size);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
