Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED6D279915
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 17:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755021034; cv=none; b=ezHoaQWqNmZN+ziRXv/bL7DTRRLNEBGkbCgbJ7FwMr8Cb2RPoy7/F6n08pCQJIj3/DAaMVaxTZUTpJ8bbNiPhSy1UPflllm0te7HVubgKvIMJwdOFYU885w/VjymPaQju7AyJEivQHMz1FG1M1eqPV74B3fV1Hw0P5fgA+VFp3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755021034; c=relaxed/simple;
	bh=0uMa3KKItLsfxoH0GEwOYR0lxjuPO0dy/8Zmk4UX3jc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WI2tYILL2herHUavGS/0X24/y5DExkChjdMHgme75VxjlllKM78tU0X3ms4sjV3kTg9EwRg0gP4pRdYb+nFsJUdjpWiAfRpvmIZOf4efl/Rsc0bjD6feSXdZZRAJfmty2XG5s5E29aFrLF2x6ctsqVbx9gCq9+Y/f9tkYNWKHd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6sWPB2H; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6sWPB2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755021033; x=1786557033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0uMa3KKItLsfxoH0GEwOYR0lxjuPO0dy/8Zmk4UX3jc=;
  b=Y6sWPB2HgHxxznXDs7poKrlJYQ5DpavfFcf1wkAA5FjRqFRv5tpc3Y65
   yMbEmf3Sx8rkNhVA4B7pESHmfdaip3+PDOKvSEh4jU2D5FP09SFhdHl3H
   YkaBbALBWAH3itcIfmA5SD4BoDxWVkecAqMxgqkauFu6q4IcOc/jie0KX
   bI7TUVUtem+23ZVNjT8MIWmk8Sb0fHlFaTle+oOHO0HKrMsr7uW3DilF4
   Fu2YfT11ycBFGq3rk/UMDqmrS1KYauTec7/SnqHRHxwzS3PTAxOQPvhpb
   GgYRlS+xMOod0BQb+kPulfeph5X0DadyhqVJJmgkn5j8MIkohhv9Ibmye
   Q==;
X-CSE-ConnectionGUID: GmMZq9oASGK6NrVrp2SLPQ==
X-CSE-MsgGUID: QW8mrF+2Sr+EdtIn8cDO9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61148559"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="61148559"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 10:50:32 -0700
X-CSE-ConnectionGUID: F+i7UBK9TsyUYV+sW1+GbQ==
X-CSE-MsgGUID: NqWk1UERQXuJjGz+olCOUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="203441377"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Aug 2025 10:50:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ult8j-0007Bh-3D;
	Tue, 12 Aug 2025 17:50:27 +0000
Date: Wed, 13 Aug 2025 01:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_hybrid_automata 16/21]
 kernel/trace/rv/monitors/nomiss/nomiss.c:147:2: error: call to undeclared
 function 'check_trace_callback_type_sys_enter'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202508130126.1UHPvAE7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.com/glemco/linux staging_rv_hybrid_automata
head:   623e09375a6cff536c784032b69fda43074355dd
commit: 43ecf0f94d82b0905099a8b48ef926ede7635d25 [16/21] rv: Add deadline monitors
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250813/202508130126.1UHPvAE7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508130126.1UHPvAE7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508130126.1UHPvAE7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/rv/monitors/nomiss/nomiss.c:147:2: error: call to undeclared function 'check_trace_callback_type_sys_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     147 |         rv_attach_trace_probe("nomiss", sys_enter, handle_syscall);
         |         ^
   include/rv/instrumentation.h:18:3: note: expanded from macro 'rv_attach_trace_probe'
      18 |                 check_trace_callback_type_##tp(rv_handler);                             \
         |                 ^
   <scratch space>:30:1: note: expanded from here
      30 | check_trace_callback_type_sys_enter
         | ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:147:2: note: did you mean 'check_trace_callback_type_event_sor'?
   include/rv/instrumentation.h:18:3: note: expanded from macro 'rv_attach_trace_probe'
      18 |                 check_trace_callback_type_##tp(rv_handler);                             \
         |                 ^
   <scratch space>:30:1: note: expanded from here
      30 | check_trace_callback_type_sys_enter
         | ^
   kernel/trace/rv/monitors/sor/sor_trace.h:8:1: note: 'check_trace_callback_type_event_sor' declared here
       8 | DEFINE_EVENT(event_da_monitor_id, event_sor,
         | ^
   include/linux/tracepoint.h:608:2: note: expanded from macro 'DEFINE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:481:2: note: expanded from macro 'DECLARE_TRACE_EVENT'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:270:2: note: expanded from macro '__DECLARE_TRACE'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^
   include/linux/tracepoint.h:260:2: note: expanded from macro '__DECLARE_TRACE_COMMON'
     260 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |         ^
   <scratch space>:76:1: note: expanded from here
      76 | check_trace_callback_type_event_sor
         | ^
>> kernel/trace/rv/monitors/nomiss/nomiss.c:147:2: error: call to undeclared function 'register_trace_sys_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     147 |         rv_attach_trace_probe("nomiss", sys_enter, handle_syscall);
         |         ^
   include/rv/instrumentation.h:19:13: note: expanded from macro 'rv_attach_trace_probe'
      19 |                 WARN_ONCE(register_trace_##tp(rv_handler, NULL),                        \
         |                           ^
   <scratch space>:31:1: note: expanded from here
      31 | register_trace_sys_enter
         | ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:147:2: note: did you mean 'register_trace_event_sor'?
   include/rv/instrumentation.h:19:13: note: expanded from macro 'rv_attach_trace_probe'
      19 |                 WARN_ONCE(register_trace_##tp(rv_handler, NULL),                        \
         |                           ^
   <scratch space>:31:1: note: expanded from here
      31 | register_trace_sys_enter
         | ^
   kernel/trace/rv/monitors/sor/sor_trace.h:8:1: note: 'register_trace_event_sor' declared here
       8 | DEFINE_EVENT(event_da_monitor_id, event_sor,
         | ^
   include/linux/tracepoint.h:608:2: note: expanded from macro 'DEFINE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:481:2: note: expanded from macro 'DECLARE_TRACE_EVENT'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:270:2: note: expanded from macro '__DECLARE_TRACE'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^
   include/linux/tracepoint.h:241:2: note: expanded from macro '__DECLARE_TRACE_COMMON'
     241 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |         ^
   <scratch space>:70:1: note: expanded from here
      70 | register_trace_event_sor
         | ^
>> kernel/trace/rv/monitors/nomiss/nomiss.c:159:2: error: call to undeclared function 'unregister_trace_sys_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     159 |         rv_detach_trace_probe("nomiss", sys_enter, handle_syscall);
         |         ^
   include/rv/instrumentation.h:28:3: note: expanded from macro 'rv_detach_trace_probe'
      28 |                 unregister_trace_##tp(rv_handler, NULL);                                \
         |                 ^
   <scratch space>:42:1: note: expanded from here
      42 | unregister_trace_sys_enter
         | ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:159:2: note: did you mean 'unregister_trace_event_sor'?
   include/rv/instrumentation.h:28:3: note: expanded from macro 'rv_detach_trace_probe'
      28 |                 unregister_trace_##tp(rv_handler, NULL);                                \
         |                 ^
   <scratch space>:42:1: note: expanded from here
      42 | unregister_trace_sys_enter
         | ^
   kernel/trace/rv/monitors/sor/sor_trace.h:8:1: note: 'unregister_trace_event_sor' declared here
       8 | DEFINE_EVENT(event_da_monitor_id, event_sor,
         | ^
   include/linux/tracepoint.h:608:2: note: expanded from macro 'DEFINE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:481:2: note: expanded from macro 'DECLARE_TRACE_EVENT'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:270:2: note: expanded from macro '__DECLARE_TRACE'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^
   include/linux/tracepoint.h:254:2: note: expanded from macro '__DECLARE_TRACE_COMMON'
     254 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |         ^
   <scratch space>:74:1: note: expanded from here
      74 | unregister_trace_event_sor
         | ^
   3 errors generated.


vim +/check_trace_callback_type_sys_enter +147 kernel/trace/rv/monitors/nomiss/nomiss.c

   136	
   137	static int enable_nomiss(void)
   138	{
   139		int retval;
   140	
   141		retval = da_monitor_init();
   142		if (retval)
   143			return retval;
   144	
   145		rv_attach_trace_probe("nomiss", sched_dl_throttle, handle_dl_throttle);
   146		rv_attach_trace_probe("nomiss", sched_switch, handle_sched_switch);
 > 147		rv_attach_trace_probe("nomiss", sys_enter, handle_syscall);
   148		rv_attach_trace_probe("nomiss", sched_process_exit, handle_exit);
   149	
   150		return 0;
   151	}
   152	
   153	static void disable_nomiss(void)
   154	{
   155		rv_nomiss.enabled = 0;
   156	
   157		rv_detach_trace_probe("nomiss", sched_dl_throttle, handle_dl_throttle);
   158		rv_detach_trace_probe("nomiss", sched_switch, handle_sched_switch);
 > 159		rv_detach_trace_probe("nomiss", sys_enter, handle_syscall);
   160		rv_detach_trace_probe("nomiss", sched_process_exit, handle_exit);
   161	
   162		da_monitor_destroy();
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
