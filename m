Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C3F1853
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 04:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745125025; cv=none; b=SuafvZko7CIIP1KYD8z+CA8dPhFMFVimDcs8g8aZgfykskTvVKJuj4A/FqCKCCpfzpa2i+Gor81s9VxnwJzUdVKXOh0kHKdydeyxPlQn37zu+vK0a7lZffQgLQyTPjwCpWPN6pkeqeCVklKZf3rEbk1V8kqF7nQ0+Y4313R2h0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745125025; c=relaxed/simple;
	bh=DyTytamNBWoSWvE70HmV8jEmszxZjdnTGvfanETCGFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C8ey2cxiQa0GBRApl2ourCQeWfZcHFv8QGQbyuj7SM5rH9dRKswVIkZGIoZYHHoBhGDIbtyw5TtxkoflIp38/8U9fTAIibe3/9fBPt6mqr686ZLeo2kWFtSVg99OqwDPS15wkHpMc3u2C+RORhfC9A9w/oMjbrAHvVRoz3xX5jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6R+B5mP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6R+B5mP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745125023; x=1776661023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DyTytamNBWoSWvE70HmV8jEmszxZjdnTGvfanETCGFs=;
  b=V6R+B5mPW87EPZICV1r9qo+FAwNjTfjqzdEuTv/TITzRs/HXcHPnm/le
   TO6azPkGo0OhHky6hdrSTC4bsmWTDY7k5BDs38G+cBys51Ub2Ohk/PQYY
   UexloLMjucuzYfciY6C3JD+dNNJBuDC2BdfM+k7GySLx5m7EjYkLR9Jdh
   OmkCO42sNbk4/28Zo3nZ+IAWgn+IZR0hXT7eZ01rEwQQZzF8GzZXDBZAh
   PbR2TfrmRRVRMY6osrleKPHCevzt4+MLKlBEdUXkoHoZb9IujqVZtFedp
   0QYyL7tYCwN1WgyKRLI5qnSfgpgdi5JLkk5aJRdp+LRNWkivNEXcgUhlE
   Q==;
X-CSE-ConnectionGUID: 6aHHjWZHSGSWEhcjtFWUJQ==
X-CSE-MsgGUID: k9ugmg8oR1mCHnKehWNP6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46824848"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46824848"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 21:57:02 -0700
X-CSE-ConnectionGUID: rt5nIWrwS12P/ZLWqW6F7g==
X-CSE-MsgGUID: ANWn8SZST2e3UZ2tNvq0Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136540989"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Apr 2025 21:57:00 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6Mji-0004Qz-2j;
	Sun, 20 Apr 2025 04:56:58 +0000
Date: Sun, 20 Apr 2025 12:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:rdpmc_cleanup 1/6]
 arch/x86/include/asm/msr.h:199:20: warning: conflicting types for 'wrmsr';
 have 'void(u32,  u32,  u32)' {aka 'void(unsigned int,  unsigned int,
  unsigned int)'}
Message-ID: <202504201253.CZ7u1QED-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git rdpmc_cleanup
head:   4fb3efdd45e12d42840d5cef0d457f458d9178be
commit: 96c7cfe920e963b265da512025714ab5d0e0923b [1/6] x86/msr: Move rdtsc{,_ordered}() to <asm/tsc.h>
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20250420/202504201253.CZ7u1QED-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201253.CZ7u1QED-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201253.CZ7u1QED-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/stacktrace.h:14,
                    from arch/x86/include/asm/perf_event.h:604,
                    from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from init/main.c:21:
   arch/x86/include/asm/switch_to.h: In function 'refresh_sysenter_cs':
   arch/x86/include/asm/switch_to.h:62:9: error: implicit declaration of function 'wrmsr' [-Werror=implicit-function-declaration]
      62 |         wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
         |         ^~~~~
   In file included from arch/x86/include/asm/debugreg.h:10,
                    from arch/x86/include/asm/mmu_context.h:13,
                    from include/linux/mmu_context.h:5,
                    from include/linux/cpuset.h:18,
                    from init/main.c:52:
   arch/x86/include/asm/msr.h: At top level:
>> arch/x86/include/asm/msr.h:199:20: warning: conflicting types for 'wrmsr'; have 'void(u32,  u32,  u32)' {aka 'void(unsigned int,  unsigned int,  unsigned int)'}
     199 | static inline void wrmsr(u32 msr, u32 low, u32 high)
         |                    ^~~~~
   arch/x86/include/asm/msr.h:199:20: error: static declaration of 'wrmsr' follows non-static declaration
   arch/x86/include/asm/switch_to.h:62:9: note: previous implicit declaration of 'wrmsr' with type 'void(u32,  u32,  u32)' {aka 'void(unsigned int,  unsigned int,  unsigned int)'}
      62 |         wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
         |         ^~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/x86/include/asm/stacktrace.h:14,
                    from arch/x86/include/asm/perf_event.h:604,
                    from include/linux/perf_event.h:25,
                    from arch/x86/events/perf_event.h:15,
                    from arch/x86/events/utils.c:5:
   arch/x86/include/asm/switch_to.h: In function 'refresh_sysenter_cs':
   arch/x86/include/asm/switch_to.h:62:9: error: implicit declaration of function 'wrmsr' [-Werror=implicit-function-declaration]
      62 |         wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
         |         ^~~~~
   arch/x86/events/perf_event.h: In function '__x86_pmu_enable_event':
>> arch/x86/events/perf_event.h:1238:17: error: implicit declaration of function 'wrmsrq' [-Werror=implicit-function-declaration]
    1238 |                 wrmsrq(hwc->extra_reg.reg, hwc->extra_reg.config);
         |                 ^~~~~~
   arch/x86/events/perf_event.h: In function '__amd_pmu_lbr_disable':
>> arch/x86/events/perf_event.h:1434:9: error: implicit declaration of function 'rdmsrq' [-Werror=implicit-function-declaration]
    1434 |         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
         |         ^~~~~~
   cc1: some warnings being treated as errors
--
   arch/x86/kernel/cpu/feat_ctl.c: In function 'init_vmx_capabilities':
>> arch/x86/kernel/cpu/feat_ctl.c:41:9: error: implicit declaration of function 'rdmsr' [-Werror=implicit-function-declaration]
      41 |         rdmsr(MSR_IA32_VMX_PROCBASED_CTLS, ign, supported);
         |         ^~~~~
>> arch/x86/kernel/cpu/feat_ctl.c:44:9: error: implicit declaration of function 'rdmsr_safe' [-Werror=implicit-function-declaration]
      44 |         rdmsr_safe(MSR_IA32_VMX_PROCBASED_CTLS2, &ign, &supported);
         |         ^~~~~~~~~~
   arch/x86/kernel/cpu/feat_ctl.c: In function 'init_ia32_feat_ctl':
>> arch/x86/kernel/cpu/feat_ctl.c:121:13: error: implicit declaration of function 'rdmsrq_safe' [-Werror=implicit-function-declaration]
     121 |         if (rdmsrq_safe(MSR_IA32_FEAT_CTL, &msr)) {
         |             ^~~~~~~~~~~
>> arch/x86/kernel/cpu/feat_ctl.c:168:9: error: implicit declaration of function 'wrmsrq' [-Werror=implicit-function-declaration]
     168 |         wrmsrq(MSR_IA32_FEAT_CTL, msr);
         |         ^~~~~~
   arch/x86/kernel/cpu/feat_ctl.c: In function 'init_vmx_capabilities':
>> arch/x86/kernel/cpu/feat_ctl.c:41:9: warning: 'supported' is used uninitialized [-Wuninitialized]
      41 |         rdmsr(MSR_IA32_VMX_PROCBASED_CTLS, ign, supported);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/feat_ctl.c:27:13: note: 'supported' declared here
      27 |         u32 supported, funcs, ept, vpid, ign, low, high;
         |             ^~~~~~~~~
>> arch/x86/kernel/cpu/feat_ctl.c:41:9: warning: 'ign' is used uninitialized [-Wuninitialized]
      41 |         rdmsr(MSR_IA32_VMX_PROCBASED_CTLS, ign, supported);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/feat_ctl.c:27:42: note: 'ign' declared here
      27 |         u32 supported, funcs, ept, vpid, ign, low, high;
         |                                          ^~~
>> arch/x86/kernel/cpu/feat_ctl.c:41:9: warning: 'ign' is used uninitialized [-Wuninitialized]
      41 |         rdmsr(MSR_IA32_VMX_PROCBASED_CTLS, ign, supported);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/feat_ctl.c:27:42: note: 'ign' was declared here
      27 |         u32 supported, funcs, ept, vpid, ign, low, high;
         |                                          ^~~
>> arch/x86/kernel/cpu/feat_ctl.c:41:9: warning: 'supported' is used uninitialized [-Wuninitialized]
      41 |         rdmsr(MSR_IA32_VMX_PROCBASED_CTLS, ign, supported);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/feat_ctl.c:27:13: note: 'supported' was declared here
      27 |         u32 supported, funcs, ept, vpid, ign, low, high;
         |             ^~~~~~~~~
   cc1: some warnings being treated as errors
--
   arch/x86/kernel/cpu/tsx.c: In function 'tsx_disable':
>> arch/x86/kernel/cpu/tsx.c:27:9: error: implicit declaration of function 'rdmsrq' [-Werror=implicit-function-declaration]
      27 |         rdmsrq(MSR_IA32_TSX_CTRL, tsx);
         |         ^~~~~~
>> arch/x86/kernel/cpu/tsx.c:40:9: error: implicit declaration of function 'wrmsrq' [-Werror=implicit-function-declaration]
      40 |         wrmsrq(MSR_IA32_TSX_CTRL, tsx);
         |         ^~~~~~
>> arch/x86/kernel/cpu/tsx.c:27:9: warning: 'tsx' is used uninitialized [-Wuninitialized]
      27 |         rdmsrq(MSR_IA32_TSX_CTRL, tsx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/tsx.c:25:13: note: 'tsx' was declared here
      25 |         u64 tsx;
         |             ^~~
   arch/x86/kernel/cpu/tsx.c: In function 'tsx_enable':
   arch/x86/kernel/cpu/tsx.c:47:9: warning: 'tsx' is used uninitialized [-Wuninitialized]
      47 |         rdmsrq(MSR_IA32_TSX_CTRL, tsx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/tsx.c:45:13: note: 'tsx' was declared here
      45 |         u64 tsx;
         |             ^~~
   cc1: some warnings being treated as errors
--
   arch/x86/kernel/cpu/zhaoxin.c: In function 'init_zhaoxin_cap':
>> arch/x86/kernel/cpu/zhaoxin.c:30:25: error: implicit declaration of function 'rdmsr' [-Werror=implicit-function-declaration]
      30 |                         rdmsr(MSR_ZHAOXIN_FCR57, lo, hi);
         |                         ^~~~~
   arch/x86/kernel/cpu/zhaoxin.c:33:25: error: implicit declaration of function 'wrmsr' [-Werror=implicit-function-declaration]
      33 |                         wrmsr(MSR_ZHAOXIN_FCR57, lo, hi);
         |                         ^~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/x86/include/asm/stacktrace.h:14,
                    from arch/x86/include/asm/perf_event.h:604,
                    from include/linux/perf_event.h:25,
                    from arch/x86/events/amd/lbr.c:2:
   arch/x86/include/asm/switch_to.h: In function 'refresh_sysenter_cs':
   arch/x86/include/asm/switch_to.h:62:9: error: implicit declaration of function 'wrmsr' [-Werror=implicit-function-declaration]
      62 |         wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
         |         ^~~~~
   In file included from arch/x86/events/amd/lbr.c:5:
   arch/x86/events/amd/../perf_event.h: In function '__x86_pmu_enable_event':
>> arch/x86/events/amd/../perf_event.h:1238:17: error: implicit declaration of function 'wrmsrq' [-Werror=implicit-function-declaration]
    1238 |                 wrmsrq(hwc->extra_reg.reg, hwc->extra_reg.config);
         |                 ^~~~~~
   arch/x86/events/amd/../perf_event.h: In function '__amd_pmu_lbr_disable':
>> arch/x86/events/amd/../perf_event.h:1434:9: error: implicit declaration of function 'rdmsrq' [-Werror=implicit-function-declaration]
    1434 |         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
         |         ^~~~~~
>> arch/x86/events/amd/../perf_event.h:1434:9: warning: 'dbg_extn_cfg' is used uninitialized [-Wuninitialized]
    1434 |         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/amd/../perf_event.h:1432:22: note: 'dbg_extn_cfg' was declared here
    1432 |         u64 dbg_ctl, dbg_extn_cfg;
         |                      ^~~~~~~~~~~~
   arch/x86/events/amd/lbr.c: In function 'amd_pmu_lbr_get_from':
>> arch/x86/events/amd/lbr.c:76:9: warning: 'val' is used uninitialized [-Wuninitialized]
      76 |         rdmsrq(MSR_AMD_SAMP_BR_FROM + idx * 2, val);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/amd/lbr.c:74:13: note: 'val' was declared here
      74 |         u64 val;
         |             ^~~
   arch/x86/events/amd/lbr.c: In function 'amd_pmu_lbr_get_to':
   arch/x86/events/amd/lbr.c:85:9: warning: 'val' is used uninitialized [-Wuninitialized]
      85 |         rdmsrq(MSR_AMD_SAMP_BR_FROM + idx * 2 + 1, val);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/amd/lbr.c:83:13: note: 'val' was declared here
      83 |         u64 val;
         |             ^~~
   cc1: some warnings being treated as errors
--
   In file included from arch/x86/include/asm/stacktrace.h:14,
                    from arch/x86/include/asm/perf_event.h:604,
                    from arch/x86/events/intel/bts.c:19:
   arch/x86/include/asm/switch_to.h: In function 'refresh_sysenter_cs':
   arch/x86/include/asm/switch_to.h:62:9: error: implicit declaration of function 'wrmsr' [-Werror=implicit-function-declaration]
      62 |         wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
         |         ^~~~~
   In file included from arch/x86/events/intel/bts.c:21:
   arch/x86/events/intel/../perf_event.h: In function '__x86_pmu_enable_event':
>> arch/x86/events/intel/../perf_event.h:1238:17: error: implicit declaration of function 'wrmsrq' [-Werror=implicit-function-declaration]
    1238 |                 wrmsrq(hwc->extra_reg.reg, hwc->extra_reg.config);
         |                 ^~~~~~
   arch/x86/events/intel/../perf_event.h: In function '__amd_pmu_lbr_disable':
>> arch/x86/events/intel/../perf_event.h:1434:9: error: implicit declaration of function 'rdmsrq' [-Werror=implicit-function-declaration]
    1434 |         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
         |         ^~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/x86/include/asm/stacktrace.h:14,
                    from arch/x86/include/asm/perf_event.h:604,
                    from include/linux/perf_event.h:25,
                    from arch/x86/events/intel/knc.c:4:
   arch/x86/include/asm/switch_to.h: In function 'refresh_sysenter_cs':
   arch/x86/include/asm/switch_to.h:62:9: error: implicit declaration of function 'wrmsr' [-Werror=implicit-function-declaration]
      62 |         wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
         |         ^~~~~
   In file included from arch/x86/events/intel/knc.c:9:
   arch/x86/events/intel/../perf_event.h: In function '__x86_pmu_enable_event':
>> arch/x86/events/intel/../perf_event.h:1238:17: error: implicit declaration of function 'wrmsrq' [-Werror=implicit-function-declaration]
    1238 |                 wrmsrq(hwc->extra_reg.reg, hwc->extra_reg.config);
         |                 ^~~~~~
   arch/x86/events/intel/../perf_event.h: In function '__amd_pmu_lbr_disable':
>> arch/x86/events/intel/../perf_event.h:1434:9: error: implicit declaration of function 'rdmsrq' [-Werror=implicit-function-declaration]
    1434 |         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
         |         ^~~~~~
   arch/x86/events/intel/knc.c: In function 'knc_pmu_disable_event':
>> arch/x86/events/intel/knc.c:185:15: error: implicit declaration of function 'wrmsrq_safe' [-Werror=implicit-function-declaration]
     185 |         (void)wrmsrq_safe(hwc->config_base + hwc->idx, val);
         |               ^~~~~~~~~~~
   arch/x86/events/intel/knc.c: In function 'knc_pmu_get_status':
>> arch/x86/events/intel/knc.c:203:9: warning: 'status' is used uninitialized [-Wuninitialized]
     203 |         rdmsrq(MSR_KNC_IA32_PERF_GLOBAL_STATUS, status);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/intel/knc.c:201:13: note: 'status' was declared here
     201 |         u64 status;
         |             ^~~~~~
   arch/x86/events/intel/knc.c: In function 'knc_pmu_enable_all':
>> arch/x86/events/intel/knc.c:171:9: warning: 'val' is used uninitialized [-Wuninitialized]
     171 |         rdmsrq(MSR_KNC_IA32_PERF_GLOBAL_CTRL, val);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/intel/knc.c:169:13: note: 'val' was declared here
     169 |         u64 val;
         |             ^~~
   arch/x86/events/intel/knc.c: In function 'knc_pmu_disable_all':
   arch/x86/events/intel/knc.c:162:9: warning: 'val' is used uninitialized [-Wuninitialized]
     162 |         rdmsrq(MSR_KNC_IA32_PERF_GLOBAL_CTRL, val);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/intel/knc.c:160:13: note: 'val' was declared here
     160 |         u64 val;
         |             ^~~
   In function 'knc_pmu_get_status',
       inlined from 'knc_pmu_handle_irq' at arch/x86/events/intel/knc.c:225:11:
>> arch/x86/events/intel/knc.c:203:9: warning: 'status' is used uninitialized [-Wuninitialized]
     203 |         rdmsrq(MSR_KNC_IA32_PERF_GLOBAL_STATUS, status);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/intel/knc.c: In function 'knc_pmu_handle_irq':
   arch/x86/events/intel/knc.c:219:13: note: 'status' was declared here
     219 |         u64 status;
         |             ^~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/x86/include/asm/stacktrace.h:14,
                    from arch/x86/include/asm/perf_event.h:604,
                    from include/linux/perf_event.h:25,
                    from arch/x86/events/intel/p6.c:2:
   arch/x86/include/asm/switch_to.h: In function 'refresh_sysenter_cs':
   arch/x86/include/asm/switch_to.h:62:9: error: implicit declaration of function 'wrmsr' [-Werror=implicit-function-declaration]
      62 |         wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
         |         ^~~~~
   In file included from arch/x86/events/intel/p6.c:7:
   arch/x86/events/intel/../perf_event.h: In function '__x86_pmu_enable_event':
>> arch/x86/events/intel/../perf_event.h:1238:17: error: implicit declaration of function 'wrmsrq' [-Werror=implicit-function-declaration]
    1238 |                 wrmsrq(hwc->extra_reg.reg, hwc->extra_reg.config);
         |                 ^~~~~~
   arch/x86/events/intel/../perf_event.h: In function '__amd_pmu_lbr_disable':
>> arch/x86/events/intel/../perf_event.h:1434:9: error: implicit declaration of function 'rdmsrq' [-Werror=implicit-function-declaration]
    1434 |         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
         |         ^~~~~~
   arch/x86/events/intel/p6.c: In function 'p6_pmu_disable_event':
>> arch/x86/events/intel/p6.c:166:15: error: implicit declaration of function 'wrmsrq_safe' [-Werror=implicit-function-declaration]
     166 |         (void)wrmsrq_safe(hwc->config_base, val);
         |               ^~~~~~~~~~~
   arch/x86/events/intel/p6.c: In function 'p6_pmu_enable_all':
>> arch/x86/events/intel/p6.c:155:9: warning: 'val' is used uninitialized [-Wuninitialized]
     155 |         rdmsrq(MSR_P6_EVNTSEL0, val);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/intel/p6.c:152:23: note: 'val' was declared here
     152 |         unsigned long val;
         |                       ^~~
   arch/x86/events/intel/p6.c: In function 'p6_pmu_disable_all':
   arch/x86/events/intel/p6.c:145:9: warning: 'val' is used uninitialized [-Wuninitialized]
     145 |         rdmsrq(MSR_P6_EVNTSEL0, val);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/intel/p6.c:142:13: note: 'val' was declared here
     142 |         u64 val;
         |             ^~~
   cc1: some warnings being treated as errors
--
   In file included from arch/x86/include/asm/stacktrace.h:14,
                    from arch/x86/include/asm/perf_event.h:604,
                    from arch/x86/events/intel/pt.c:22:
   arch/x86/include/asm/switch_to.h: In function 'refresh_sysenter_cs':
   arch/x86/include/asm/switch_to.h:62:9: error: implicit declaration of function 'wrmsr' [-Werror=implicit-function-declaration]
      62 |         wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
         |         ^~~~~
   In file included from arch/x86/events/intel/pt.c:28:
   arch/x86/events/intel/../perf_event.h: In function '__x86_pmu_enable_event':
>> arch/x86/events/intel/../perf_event.h:1238:17: error: implicit declaration of function 'wrmsrq' [-Werror=implicit-function-declaration]
    1238 |                 wrmsrq(hwc->extra_reg.reg, hwc->extra_reg.config);
         |                 ^~~~~~
   arch/x86/events/intel/../perf_event.h: In function '__amd_pmu_lbr_disable':
>> arch/x86/events/intel/../perf_event.h:1434:9: error: implicit declaration of function 'rdmsrq' [-Werror=implicit-function-declaration]
    1434 |         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
         |         ^~~~~~
   arch/x86/events/intel/pt.c: In function 'pt_init':
>> arch/x86/events/intel/pt.c:1842:23: error: implicit declaration of function 'rdmsrq_safe_on_cpu' [-Werror=implicit-function-declaration]
    1842 |                 ret = rdmsrq_safe_on_cpu(cpu, MSR_IA32_RTIT_CTL, &ctl);
         |                       ^~~~~~~~~~~~~~~~~~
   arch/x86/events/intel/pt.c: In function 'pt_handle_status':
>> arch/x86/events/intel/pt.c:929:9: warning: 'status' is used uninitialized [-Wuninitialized]
     929 |         rdmsrq(MSR_IA32_RTIT_STATUS, status);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/intel/pt.c:927:13: note: 'status' was declared here
     927 |         u64 status;
         |             ^~~~~~
   arch/x86/events/intel/pt.c: In function 'pt_pmu_hw_init':
>> arch/x86/events/intel/pt.c:197:9: warning: 'reg' is used uninitialized [-Wuninitialized]
     197 |         rdmsrq(MSR_PLATFORM_INFO, reg);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/intel/pt.c:193:13: note: 'reg' was declared here
     193 |         u64 reg;
         |             ^~~
   cc1: some warnings being treated as errors


vim +199 arch/x86/include/asm/msr.h

be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner           2007-10-23  198  
d58c04cf1d702f arch/x86/include/asm/msr.h Ingo Molnar               2025-04-09 @199  static inline void wrmsr(u32 msr, u32 low, u32 high)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner           2007-10-23  200  {
c9dcda5ce46c39 include/asm-x86/msr.h      Glauber de Oliveira Costa 2008-01-30  201  	native_write_msr(msr, low, high);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner           2007-10-23  202  }
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner           2007-10-23  203  

:::::: The code at line 199 was first introduced by commit
:::::: d58c04cf1d702fd6e133e89130f11a2ccd9269fa x86/msr: Standardize on 'u32' MSR indices in <asm/msr.h>

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
