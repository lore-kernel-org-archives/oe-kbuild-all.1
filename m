Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C655C2AE86
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 07:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745132477; cv=none; b=BEfjtxmZGy/FTZmkpR6ItYmOQwoVi2V/FIJ1b2iyqAbP53kdiuHrs/J58xxXLUnrGCAiHlekcee+F99G2WqGVpcipDC/oBEFJYbtizhOK9oZbkkCjKasNMTEetRaTLugku0AwHVa2T4CtVw1Ta/NcIhCeqBJ6C3iGNfCcyOQwaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745132477; c=relaxed/simple;
	bh=8AdDCKKzATCxqX3CQdiOBAmO9XTKXCUfykIZdGqgEc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h5qVIn1w7uShE1b1//0Qi4yiFJQQG7cGmcXhprQaXFTVihBUeQLf9KIhBp2OeWbcH5EbG7Iy8ymvL7ItgZwIO5WpDdRTXSZqM2XNunMeCehrx3T6/J32eYD8b0OZOodcKStgLuKul0JLwFITJ1H6oLTp3O32GyIZ2SglfqKgMXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfpPuCUb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfpPuCUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745132475; x=1776668475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8AdDCKKzATCxqX3CQdiOBAmO9XTKXCUfykIZdGqgEc4=;
  b=FfpPuCUbwBx9rApJFoUPhM1RACodfO9WgNIC6X2+MVsMDejLoShENRmX
   0p1cROcdXY75uF6FMAEJzBdLwyJeoqMDA+IfJAFYTV3iTZrg2ZeeNLY/V
   cq0l1tURFl42VdvBuXS3KRJNvgozut5u4wv7gNGuYXC+rVShfW5XwB8IV
   UWRd3raA5IgTK+/qR4x7Wnvkp4vrEjUSgRwzU/Phcbwr/o8yHa/KGi7da
   cazAkjvB8xFFq2o++KSF6HPzKEeLlQJXStXBMeyPpqKeXqHjBZkU8Q9vS
   q9Fl8+FgW4uxxg+bPj+hpjAWDs6b6eeZGYhfKozBB+bjFot5VQ//vi76g
   A==;
X-CSE-ConnectionGUID: ODkcTAbNQnqjmRAWQkWv4A==
X-CSE-MsgGUID: mUXAZ9QUTBGTM6L0NtkOlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46869373"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46869373"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 00:01:15 -0700
X-CSE-ConnectionGUID: x3MPrF69TbWseiIcrPZiww==
X-CSE-MsgGUID: ZEzm1VezTQSM2sAyi+k12A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136419766"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Apr 2025 00:01:13 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6Ofv-0004Uo-1K;
	Sun, 20 Apr 2025 07:01:11 +0000
Date: Sun, 20 Apr 2025 15:00:56 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 25/33]
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c:497:2: error: call to undeclared
 function 'native_wrmsr_no_trace'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202504201455.2EGxrZ8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   7847889af95a1a39c6e3e0ef6479df8b9505a17d
commit: 358a2ad2be426f7146d59083b1398d9cb1c2ebe7 [25/33] x86/msr: Rename native_wrmsr() to native_wrmsr_no_trace()
config: i386-buildonly-randconfig-002-20250420 (https://download.01.org/0day-ci/archive/20250420/202504201455.2EGxrZ8x-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201455.2EGxrZ8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201455.2EGxrZ8x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/resctrl/pseudo_lock.c:19:
   In file included from include/linux/perf_event.h:25:
   In file included from arch/x86/include/asm/perf_event.h:604:
   In file included from arch/x86/include/asm/stacktrace.h:14:
   arch/x86/include/asm/switch_to.h:62:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |         wrmsrq(MSR_IA32_SYSENTER_CS, thread->sysenter_cs);
         |         ^
   In file included from arch/x86/kernel/cpu/resctrl/pseudo_lock.c:26:
   arch/x86/include/asm/resctrl.h:140:3: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     140 |                 wrmsr(MSR_IA32_PQR_ASSOC, rmid, closid);
         |                 ^
   In file included from arch/x86/kernel/cpu/resctrl/pseudo_lock.c:29:
   arch/x86/include/uapi/../../events/perf_event.h:1238:3: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1238 |                 wrmsrq(hwc->extra_reg.reg, hwc->extra_reg.config);
         |                 ^
   arch/x86/include/uapi/../../events/perf_event.h:1263:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1263 |         wrmsrq(hwc->config_base, hwc->config & ~disable_mask);
         |         ^
   arch/x86/include/uapi/../../events/perf_event.h:1434:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1434 |         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
         |         ^
   arch/x86/include/uapi/../../events/perf_event.h:1435:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1435 |         wrmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg & ~DBG_EXTN_CFG_LBRV2EN);
         |         ^
   arch/x86/include/uapi/../../events/perf_event.h:1571:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1571 |         wrmsrq(MSR_IA32_PEBS_ENABLE, 0);
         |         ^
   arch/x86/include/uapi/../../events/perf_event.h:1576:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1576 |         wrmsrq(MSR_ARCH_LBR_CTL, 0);
         |         ^
   arch/x86/include/uapi/../../events/perf_event.h:1583:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1583 |         rdmsrq(MSR_IA32_DEBUGCTLMSR, debugctl);
         |         ^
   arch/x86/include/uapi/../../events/perf_event.h:1585:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1585 |         wrmsrq(MSR_IA32_DEBUGCTLMSR, debugctl);
         |         ^
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:484:14: error: call to undeclared function 'native_rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     484 |         saved_msr = native_rdmsrq(MSR_MISC_FEATURE_CONTROL);
         |                     ^
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:485:2: error: call to undeclared function 'native_wrmsrq_no_trace'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     485 |         native_wrmsrq_no_trace(MSR_MISC_FEATURE_CONTROL, prefetch_disable_bits);
         |         ^
>> arch/x86/kernel/cpu/resctrl/pseudo_lock.c:497:2: error: call to undeclared function 'native_wrmsr_no_trace'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     497 |         native_wrmsr_no_trace(MSR_IA32_PQR_ASSOC, rmid_p, plr->closid);
         |         ^
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:537:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     537 |         wrmsrq(MSR_MISC_FEATURE_CONTROL, saved_msr);
         |         ^
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:906:2: error: call to undeclared function 'rdmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     906 |         rdmsr(MSR_MISC_FEATURE_CONTROL, saved_low, saved_high);
         |         ^
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:907:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     907 |         wrmsrq(MSR_MISC_FEATURE_CONTROL, prefetch_disable_bits);
         |         ^
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:923:2: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     923 |         wrmsr(MSR_MISC_FEATURE_CONTROL, saved_low, saved_high);
         |         ^
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:1002:2: error: call to undeclared function 'rdmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1002 |         rdmsr(MSR_MISC_FEATURE_CONTROL, saved_low, saved_high);
         |         ^
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:1003:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1003 |         wrmsrq(MSR_MISC_FEATURE_CONTROL, prefetch_disable_bits);
         |         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/native_wrmsr_no_trace +497 arch/x86/kernel/cpu/resctrl/pseudo_lock.c

   458	
   459		/*
   460		 * Make sure none of the allocated memory is cached. If it is we
   461		 * will get a cache hit in below loop from outside of pseudo-locked
   462		 * region.
   463		 * wbinvd (as opposed to clflush/clflushopt) is required to
   464		 * increase likelihood that allocated cache portion will be filled
   465		 * with associated memory.
   466		 */
   467		wbinvd();
   468	
   469		/*
   470		 * Always called with interrupts enabled. By disabling interrupts
   471		 * ensure that we will not be preempted during this critical section.
   472		 */
   473		local_irq_disable();
   474	
   475		/*
   476		 * Call wrmsr and rdmsr as directly as possible to avoid tracing
   477		 * clobbering local register variables or affecting cache accesses.
   478		 *
   479		 * Disable the hardware prefetcher so that when the end of the memory
   480		 * being pseudo-locked is reached the hardware will not read beyond
   481		 * the buffer and evict pseudo-locked memory read earlier from the
   482		 * cache.
   483		 */
 > 484		saved_msr = native_rdmsrq(MSR_MISC_FEATURE_CONTROL);
   485		native_wrmsrq_no_trace(MSR_MISC_FEATURE_CONTROL, prefetch_disable_bits);
   486		closid_p = this_cpu_read(pqr_state.cur_closid);
   487		rmid_p = this_cpu_read(pqr_state.cur_rmid);
   488		mem_r = plr->kmem;
   489		size = plr->size;
   490		line_size = plr->line_size;
   491		/*
   492		 * Critical section begin: start by writing the closid associated
   493		 * with the capacity bitmask of the cache region being
   494		 * pseudo-locked followed by reading of kernel memory to load it
   495		 * into the cache.
   496		 */
 > 497		native_wrmsr_no_trace(MSR_IA32_PQR_ASSOC, rmid_p, plr->closid);
   498	
   499		/*
   500		 * Cache was flushed earlier. Now access kernel memory to read it
   501		 * into cache region associated with just activated plr->closid.
   502		 * Loop over data twice:
   503		 * - In first loop the cache region is shared with the page walker
   504		 *   as it populates the paging structure caches (including TLB).
   505		 * - In the second loop the paging structure caches are used and
   506		 *   cache region is populated with the memory being referenced.
   507		 */
   508		for (i = 0; i < size; i += PAGE_SIZE) {
   509			/*
   510			 * Add a barrier to prevent speculative execution of this
   511			 * loop reading beyond the end of the buffer.
   512			 */
   513			rmb();
   514			asm volatile("mov (%0,%1,1), %%eax\n\t"
   515				:
   516				: "r" (mem_r), "r" (i)
   517				: "%eax", "memory");
   518		}
   519		for (i = 0; i < size; i += line_size) {
   520			/*
   521			 * Add a barrier to prevent speculative execution of this
   522			 * loop reading beyond the end of the buffer.
   523			 */
   524			rmb();
   525			asm volatile("mov (%0,%1,1), %%eax\n\t"
   526				:
   527				: "r" (mem_r), "r" (i)
   528				: "%eax", "memory");
   529		}
   530		/*
   531		 * Critical section end: restore closid with capacity bitmask that
   532		 * does not overlap with pseudo-locked region.
   533		 */
   534		native_wrmsr_no_trace(MSR_IA32_PQR_ASSOC, rmid_p, closid_p);
   535	
   536		/* Re-enable the hardware prefetcher(s) */
   537		wrmsrq(MSR_MISC_FEATURE_CONTROL, saved_msr);
   538		local_irq_enable();
   539	
   540		plr->thread_done = 1;
   541		wake_up_interruptible(&plr->lock_thread_wq);
   542		return 0;
   543	}
   544	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
