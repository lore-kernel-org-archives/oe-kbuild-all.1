Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79F3189F5C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 05:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745128750; cv=none; b=FhtwH8+kMwclMjy8ykPLDGou5+2VC3QWwJwRYHUOgkZDlbrk6s19yy4Hd5wfzs3VYzy9Sld12EoyYFuKbg7gG4hsA5H8QrTmum8LDYvaghrWhOMHvkLAmXkBnbMqEvdJ19puA+Ez2wSNiGA/Rddq20C0RBDIcfI5H+L0GZGHRVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745128750; c=relaxed/simple;
	bh=U2QKSD8M1ulAedbKZlrAybc8tdCBeq3wWEza2dmJmJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iNKh+gt9AtiiTeUq4+hgqvfPlyOdUOASqWdyyJ2/7VLTalURm7N2EkoM1/dygc95Mldl21aguyOIMN8oAndYmk9vXTjiAYaT9piQ4+7vIh+rLuUvywd7ABPMebsf7FfeTD71ozaH878xPUS031sVTKUC97LqfHEXreB7WCNOwhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhJPjYFV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhJPjYFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745128748; x=1776664748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U2QKSD8M1ulAedbKZlrAybc8tdCBeq3wWEza2dmJmJ8=;
  b=BhJPjYFVH0ZPw7C/M04DdCeFTJ3RUNcmPC1YC+nxUbmnC6z7ACD5oYQv
   +QX/S0pox3lcW0FTB2atEaHpkQpMpMk65x8GvTgoZOGh+Z3/6naQUdqWK
   wztQGQ4yojCXbjEShQYKSiHpSFICSHD2Ocqy0dl9g5cOhooY03tJv6GTk
   QXG6kOR55K4T5NtP51DThzkY2piwldfEnBjOO7nIfdcUGUWBk3BHEWnhP
   zJQ8HSERr+fy0pY2qG8CycEjOgA6DgcG5+tw2wvTBihFupCmi+/WsmLL+
   62TunF+jP6JoUw5J7BtWCOjOkl6wtWcVkEdaCEtJqyMlnFOzleh89GTq6
   w==;
X-CSE-ConnectionGUID: GwhIhByuRg+swaDsSaQgZA==
X-CSE-MsgGUID: ZFtOoodCTHe3nmLzBF5rxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46818140"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46818140"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 22:59:07 -0700
X-CSE-ConnectionGUID: yRnmzj9/TkWaTRn3HUCCyw==
X-CSE-MsgGUID: Z028ozVbRvi3CvsQ/wM8sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136411537"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Apr 2025 22:59:05 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6Nhn-0004Sv-1o;
	Sun, 20 Apr 2025 05:59:03 +0000
Date: Sun, 20 Apr 2025 13:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 15/33]
 arch/x86/include/asm/switch_to.h:62:2: error: call to undeclared function
 'wrmsrq'; ISO C99 and later do not support implicit function declarations
Message-ID: <202504201355.fMXoauHg-lkp@intel.com>
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
commit: 71cec8892fd5046d08b9784f9cd364d442d76dcd [15/33] x86/msr: Replace wrmsr(msr, low, 0) with wrmsrq(msr, low)
config: i386-buildonly-randconfig-002-20250420 (https://download.01.org/0day-ci/archive/20250420/202504201355.fMXoauHg-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201355.fMXoauHg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201355.fMXoauHg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/common.c:33:
   In file included from arch/x86/include/asm/perf_event.h:604:
   In file included from arch/x86/include/asm/stacktrace.h:14:
>> arch/x86/include/asm/switch_to.h:62:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |         wrmsrq(MSR_IA32_SYSENTER_CS, thread->sysenter_cs);
         |         ^
   In file included from arch/x86/kernel/cpu/common.c:34:
   In file included from arch/x86/include/asm/mmu_context.h:13:
   In file included from arch/x86/include/asm/debugreg.h:10:
>> arch/x86/include/asm/msr.h:226:20: error: static declaration of 'wrmsrq' follows non-static declaration
     226 | static inline void wrmsrq(u32 msr, u64 val)
         |                    ^
   arch/x86/include/asm/switch_to.h:62:2: note: previous implicit declaration is here
      62 |         wrmsrq(MSR_IA32_SYSENTER_CS, thread->sysenter_cs);
         |         ^
   2 errors generated.
--
   In file included from arch/x86/kernel/cpu/mshyperv.c:23:
   arch/x86/include/asm/mshyperv.h:307:9: error: call to undeclared function 'native_rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     307 |         return native_rdmsrq(reg);
         |                ^
   In file included from arch/x86/kernel/cpu/mshyperv.c:25:
   In file included from arch/x86/include/asm/idtentry.h:11:
   In file included from include/linux/entry-common.h:7:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:25:
   In file included from arch/x86/include/asm/perf_event.h:604:
   In file included from arch/x86/include/asm/stacktrace.h:14:
>> arch/x86/include/asm/switch_to.h:62:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |         wrmsrq(MSR_IA32_SYSENTER_CS, thread->sysenter_cs);
         |         ^
   In file included from arch/x86/kernel/cpu/mshyperv.c:25:
   In file included from arch/x86/include/asm/idtentry.h:11:
   In file included from include/linux/entry-common.h:16:
   In file included from arch/x86/include/asm/entry-common.h:11:
   In file included from arch/x86/include/asm/fred.h:12:
   arch/x86/include/asm/msr.h:114:28: error: static declaration of 'native_rdmsrq' follows non-static declaration
     114 | static __always_inline u64 native_rdmsrq(u32 msr)
         |                            ^
   arch/x86/include/asm/mshyperv.h:307:9: note: previous implicit declaration is here
     307 |         return native_rdmsrq(reg);
         |                ^
   In file included from arch/x86/kernel/cpu/mshyperv.c:25:
   In file included from arch/x86/include/asm/idtentry.h:11:
   In file included from include/linux/entry-common.h:16:
   In file included from arch/x86/include/asm/entry-common.h:11:
   In file included from arch/x86/include/asm/fred.h:12:
>> arch/x86/include/asm/msr.h:226:20: error: static declaration of 'wrmsrq' follows non-static declaration
     226 | static inline void wrmsrq(u32 msr, u64 val)
         |                    ^
   arch/x86/include/asm/switch_to.h:62:2: note: previous implicit declaration is here
      62 |         wrmsrq(MSR_IA32_SYSENTER_CS, thread->sysenter_cs);
         |         ^
   4 errors generated.
--
   In file included from arch/x86/kernel/cpu/resctrl/pseudo_lock.c:19:
   In file included from include/linux/perf_event.h:25:
   In file included from arch/x86/include/asm/perf_event.h:604:
   In file included from arch/x86/include/asm/stacktrace.h:14:
>> arch/x86/include/asm/switch_to.h:62:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:485:2: error: call to undeclared function 'native_wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     485 |         native_wrmsrq(MSR_MISC_FEATURE_CONTROL, prefetch_disable_bits);
         |         ^
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:497:2: error: call to undeclared function 'native_wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     497 |         native_wrmsr(MSR_IA32_PQR_ASSOC, rmid_p, plr->closid);
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


vim +/wrmsrq +62 arch/x86/include/asm/switch_to.h

    53	
    54	#ifdef CONFIG_X86_32
    55	static inline void refresh_sysenter_cs(struct thread_struct *thread)
    56	{
    57		/* Only happens when SEP is enabled, no need to test "SEP"arately: */
    58		if (unlikely(this_cpu_read(cpu_tss_rw.x86_tss.ss1) == thread->sysenter_cs))
    59			return;
    60	
    61		this_cpu_write(cpu_tss_rw.x86_tss.ss1, thread->sysenter_cs);
  > 62		wrmsrq(MSR_IA32_SYSENTER_CS, thread->sysenter_cs);
    63	}
    64	#endif
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
