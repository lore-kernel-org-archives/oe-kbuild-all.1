Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49BA19E826
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 07:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745134401; cv=none; b=kxtpCC9Oy3r10QfWEXJ2sI0j1R/NIEIoouKHbB6S4F0Lc4APjedOjOROwNSWsIRtVskmhrAAbHP7VAqpof4zy96QUwVs7eAcvPXYzPE8Vox3MRRCYgAqqGG6oAjv6GFJ/jzgl2lqNFocY8PoKgbvNQyAC7jopSjrZ4MvY3LTKCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745134401; c=relaxed/simple;
	bh=eL8Avc6KqwXe8bTSTNLGIPRtpDCxDEhYtRhXdzlreXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h2czHf+tPJe7u4E8xPkpys0ATofiHIstZlfTw6Amrs5NBodBeB5kM5zEYPIhGe/bb/h2VWNoNcLlTdNHQphk4wD6mWLtoe0kUsBZllih1o3RFsV05YEm8jnQ6P5oB3HHL8vGN6v42IQ7B4lztDYZ7l0BU+kE/XOPWjIX50Uwdg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLwk6Cgy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLwk6Cgy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745134398; x=1776670398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eL8Avc6KqwXe8bTSTNLGIPRtpDCxDEhYtRhXdzlreXc=;
  b=kLwk6CgyQSPy1MxZEPaAmk5sTBB+kbxRWYVXeix8+IDPregjQj4oypgP
   70MtuZ5dMYz2eAxvCUzo6NhtLCvwRmon7DsUBPZlHvN9fv9sLSHn7AL5k
   vbS/BOLzcKpok+l058mt56HuyyiTmwCbelAAUeS4xyHp5WkZwRZBUnOMo
   kOGDF5RUKd/EDpv8IFv9p2eH/R8vh9YdkzRSJXelFsKPKzmg5XRXGKXnP
   u0UmDhr3TB/oKTAq9r+52pAwleXLDJkVPzxZDolzoKx2nuIH+B8NbuWv6
   zep4xQi2VHEkTthlOuw8rhTMrZ/r+cnXu2THF7Eou1hWl+uK8dFTcpsx6
   Q==;
X-CSE-ConnectionGUID: xJg4fEbAS9uxcbhgz4VF8w==
X-CSE-MsgGUID: yAsqwlBTSDS1RgscvpPuDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="64234326"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="64234326"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 00:33:18 -0700
X-CSE-ConnectionGUID: +4u8PMVqQeyMRFbGRlKyPA==
X-CSE-MsgGUID: D6Uh7ZQQRt+0OaGNoIXQEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136274087"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Apr 2025 00:33:17 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6PAw-0004Vh-2o;
	Sun, 20 Apr 2025 07:33:14 +0000
Date: Sun, 20 Apr 2025 15:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 28/33]
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c:484:14: error: call to undeclared
 function 'native_rdmsrq_no_trace'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202504201524.Al7l03SP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   7847889af95a1a39c6e3e0ef6479df8b9505a17d
commit: 58bf67d4ea90dad258ed448cd35ac9c28890719b [28/33] x86/msr: Rename native_rdmsrq() to native_rdmsrq_no_trace()
config: i386-buildonly-randconfig-002-20250420 (https://download.01.org/0day-ci/archive/20250420/202504201524.Al7l03SP-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201524.Al7l03SP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201524.Al7l03SP-lkp@intel.com/

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
>> arch/x86/kernel/cpu/resctrl/pseudo_lock.c:484:14: error: call to undeclared function 'native_rdmsrq_no_trace'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     484 |         saved_msr = native_rdmsrq_no_trace(MSR_MISC_FEATURE_CONTROL);
         |                     ^
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:485:2: error: call to undeclared function 'native_wrmsrq_no_trace'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     485 |         native_wrmsrq_no_trace(MSR_MISC_FEATURE_CONTROL, prefetch_disable_bits);
         |         ^
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:497:2: error: call to undeclared function 'native_wrmsr_no_trace'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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


vim +/native_rdmsrq_no_trace +484 arch/x86/kernel/cpu/resctrl/pseudo_lock.c

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
 > 484		saved_msr = native_rdmsrq_no_trace(MSR_MISC_FEATURE_CONTROL);
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
   497		native_wrmsr_no_trace(MSR_IA32_PQR_ASSOC, rmid_p, plr->closid);
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
