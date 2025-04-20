Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58F5B644
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 05:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745125685; cv=none; b=FjuwWcp1B2h0z5la5Z3tX2ttQozh6TmH2l/n6wrKnRi9UI/exzdaH6gvqm8YscmttWF81+b3ISxZ58qC/ZkCPbeiwAMe/ZMioeYkSnWVjKGTjo6AurB3uv9cZPij1ScTGbJX1+5PPqkyAVq7L4mIIxPjSYelkjCc14GRfLoBZlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745125685; c=relaxed/simple;
	bh=o2ffhJxFn7OxSwVPCFlZR1sCtQ96g5SWhoLZUpGCYXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ImQxhZeMF0JprCH1GSNnlUnWzS1Au5mV+ODehjpe7DzUmucZmAFUS0u8jixEdpXHhJJr4G5QIe76+U7nRm76xAHvxNiHHT3thTixXFsBM9vJssulBidgdQEBP40Wr7r5lrridZpA19K0Ko16bXcyGrZVOnqOky+APadlL2eYWtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExaHsI9o; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExaHsI9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745125684; x=1776661684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o2ffhJxFn7OxSwVPCFlZR1sCtQ96g5SWhoLZUpGCYXE=;
  b=ExaHsI9oLjh8oEmkbWXPnIrr4QHnzIPhoNCYv7dlKEJSA8Qx0ViqopNO
   9UiRdKRCcHOE9GnFbL+p1Cqix2GN1rtSYQ4vDKBMvgsYDRhSRT1T1i3sl
   6+TS9+6oven0W2Hn5Z0wLmbBdfn6RGrWYpF8l0uetz4V3OLTk/btVjAir
   jhvfbdIvTUdcUeRBV6tEZeY08RxPHAowIxc9zy6xyuTZRKjzdPOMpho5g
   jTZMkv08M/vFM5dNlQL7xJjyM7MEplt+ZH90RUHBFw/P2FZIrFXjAfick
   6Lw6Bi2rURlMLyrVhvH0C9jt6aXfEIbJdX+rCcfQjyTcnXvV4T8cyefA6
   A==;
X-CSE-ConnectionGUID: E01yi7AgQ96IjqG0aHrLhQ==
X-CSE-MsgGUID: 4Vqcb6AbT5OTCHUIHaUB1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="72085300"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="72085300"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 22:08:03 -0700
X-CSE-ConnectionGUID: i1JE9hTwQI+8xnYhhmWNuQ==
X-CSE-MsgGUID: 7uFclcysSYSvtY6AE6Q4Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136255946"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Apr 2025 22:08:01 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6MuN-0004RD-23;
	Sun, 20 Apr 2025 05:07:59 +0000
Date: Sun, 20 Apr 2025 13:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:rdpmc_cleanup 1/6]
 drivers/cpufreq/amd-pstate-ut.c:93:8: error: call to undeclared function
 'rdmsrq_safe'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202504201336.FQwZ8XQ0-lkp@intel.com>
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
config: i386-buildonly-randconfig-001-20250420 (https://download.01.org/0day-ci/archive/20250420/202504201336.FQwZ8XQ0-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201336.FQwZ8XQ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201336.FQwZ8XQ0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpufreq/amd-pstate-ut.c:93:8: error: call to undeclared function 'rdmsrq_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      93 |         ret = rdmsrq_safe(MSR_AMD_CPPC_ENABLE, &cppc_enable);
         |               ^
>> drivers/cpufreq/amd-pstate-ut.c:140:10: error: call to undeclared function 'rdmsrq_safe_on_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     140 |                         ret = rdmsrq_safe_on_cpu(cpu, MSR_AMD_CPPC_CAP1, &cap1);
         |                               ^
   2 errors generated.
--
>> drivers/acpi/processor_throttling.c:710:3: error: call to undeclared function 'rdmsr_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     710 |                 rdmsr_safe(MSR_IA32_THERM_CONTROL,
         |                 ^
   drivers/acpi/processor_throttling.c:729:3: error: call to undeclared function 'wrmsr_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     729 |                 wrmsr_safe(MSR_IA32_THERM_CONTROL,
         |                 ^
   2 errors generated.
--
>> drivers/acpi/processor_perflib.c:286:3: error: call to undeclared function 'rdmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     286 |                 rdmsr(MSR_AMD_PSTATE_DEF_BASE + index, lo, hi);
         |                 ^
   1 error generated.
--
   In file included from arch/x86/events/amd/power.c:12:
   In file included from include/linux/perf_event.h:25:
   In file included from arch/x86/include/asm/perf_event.h:604:
   In file included from arch/x86/include/asm/stacktrace.h:14:
   arch/x86/include/asm/switch_to.h:62:2: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |         wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
         |         ^
   In file included from arch/x86/events/amd/power.c:14:
   arch/x86/events/amd/../perf_event.h:1238:3: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1238 |                 wrmsrq(hwc->extra_reg.reg, hwc->extra_reg.config);
         |                 ^
   arch/x86/events/amd/../perf_event.h:1263:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1263 |         wrmsrq(hwc->config_base, hwc->config & ~disable_mask);
         |         ^
   arch/x86/events/amd/../perf_event.h:1434:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1434 |         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
         |         ^
   arch/x86/events/amd/../perf_event.h:1435:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1435 |         wrmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg & ~DBG_EXTN_CFG_LBRV2EN);
         |         ^
   arch/x86/events/amd/../perf_event.h:1571:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1571 |         wrmsrq(MSR_IA32_PEBS_ENABLE, 0);
         |         ^
   arch/x86/events/amd/../perf_event.h:1576:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1576 |         wrmsrq(MSR_ARCH_LBR_CTL, 0);
         |         ^
   arch/x86/events/amd/../perf_event.h:1583:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1583 |         rdmsrq(MSR_IA32_DEBUGCTLMSR, debugctl);
         |         ^
   arch/x86/events/amd/../perf_event.h:1585:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1585 |         wrmsrq(MSR_IA32_DEBUGCTLMSR, debugctl);
         |         ^
>> arch/x86/events/amd/power.c:51:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      51 |         rdmsrq(MSR_F15H_CU_PWR_ACCUMULATOR, new_pwr_acc);
         |         ^
   arch/x86/events/amd/power.c:78:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      78 |         rdmsrq(MSR_F15H_PTSC, event->hw.ptsc);
         |         ^
>> arch/x86/events/amd/power.c:275:6: error: call to undeclared function 'rdmsrq_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     275 |         if (rdmsrq_safe(MSR_F15H_CU_MAX_PWR_ACCUMULATOR, &max_cu_acc_power)) {
         |             ^
   12 errors generated.


vim +/rdmsrq_safe +93 drivers/cpufreq/amd-pstate-ut.c

14eb1c96e3a3fd Meng Li           2022-08-17   81  
a7875346c68910 Mario Limonciello 2025-02-14   82  /*
a7875346c68910 Mario Limonciello 2025-02-14   83   * check if amd pstate is enabled
a7875346c68910 Mario Limonciello 2025-02-14   84   */
a7875346c68910 Mario Limonciello 2025-02-14   85  static int amd_pstate_ut_check_enabled(u32 index)
14eb1c96e3a3fd Meng Li           2022-08-17   86  {
14eb1c96e3a3fd Meng Li           2022-08-17   87  	u64 cppc_enable = 0;
a7875346c68910 Mario Limonciello 2025-02-14   88  	int ret;
a7875346c68910 Mario Limonciello 2025-02-14   89  
a7875346c68910 Mario Limonciello 2025-02-14   90  	if (get_shared_mem())
a7875346c68910 Mario Limonciello 2025-02-14   91  		return 0;
14eb1c96e3a3fd Meng Li           2022-08-17   92  
6fe22abacd40e2 Ingo Molnar       2025-04-09  @93  	ret = rdmsrq_safe(MSR_AMD_CPPC_ENABLE, &cppc_enable);
14eb1c96e3a3fd Meng Li           2022-08-17   94  	if (ret) {
6fe22abacd40e2 Ingo Molnar       2025-04-09   95  		pr_err("%s rdmsrq_safe MSR_AMD_CPPC_ENABLE ret=%d error!\n", __func__, ret);
a7875346c68910 Mario Limonciello 2025-02-14   96  		return ret;
14eb1c96e3a3fd Meng Li           2022-08-17   97  	}
a7875346c68910 Mario Limonciello 2025-02-14   98  
a7875346c68910 Mario Limonciello 2025-02-14   99  	if (!cppc_enable) {
14eb1c96e3a3fd Meng Li           2022-08-17  100  		pr_err("%s amd pstate must be enabled!\n", __func__);
a7875346c68910 Mario Limonciello 2025-02-14  101  		return -EINVAL;
14eb1c96e3a3fd Meng Li           2022-08-17  102  	}
14eb1c96e3a3fd Meng Li           2022-08-17  103  
a7875346c68910 Mario Limonciello 2025-02-14  104  	return 0;
14eb1c96e3a3fd Meng Li           2022-08-17  105  }
14eb1c96e3a3fd Meng Li           2022-08-17  106  
14eb1c96e3a3fd Meng Li           2022-08-17  107  /*
14eb1c96e3a3fd Meng Li           2022-08-17  108   * check if performance values are reasonable.
14eb1c96e3a3fd Meng Li           2022-08-17  109   * highest_perf >= nominal_perf > lowest_nonlinear_perf > lowest_perf > 0
14eb1c96e3a3fd Meng Li           2022-08-17  110   */
a7875346c68910 Mario Limonciello 2025-02-14  111  static int amd_pstate_ut_check_perf(u32 index)
14eb1c96e3a3fd Meng Li           2022-08-17  112  {
14eb1c96e3a3fd Meng Li           2022-08-17  113  	int cpu = 0, ret = 0;
14eb1c96e3a3fd Meng Li           2022-08-17  114  	u32 highest_perf = 0, nominal_perf = 0, lowest_nonlinear_perf = 0, lowest_perf = 0;
14eb1c96e3a3fd Meng Li           2022-08-17  115  	u64 cap1 = 0;
14eb1c96e3a3fd Meng Li           2022-08-17  116  	struct cppc_perf_caps cppc_perf;
009d1c29a45194 Mario Limonciello 2025-01-17  117  	union perf_cached cur_perf;
14eb1c96e3a3fd Meng Li           2022-08-17  118  
2aac38ac06cb75 Mario Limonciello 2025-02-14  119  	for_each_online_cpu(cpu) {
93984d3cea8ab5 Mario Limonciello 2024-12-07  120  		struct cpufreq_policy *policy __free(put_cpufreq_policy) = NULL;
c630458c7a4b99 Mario Limonciello 2025-02-14  121  		struct amd_cpudata *cpudata;
93984d3cea8ab5 Mario Limonciello 2024-12-07  122  
14eb1c96e3a3fd Meng Li           2022-08-17  123  		policy = cpufreq_cpu_get(cpu);
14eb1c96e3a3fd Meng Li           2022-08-17  124  		if (!policy)
2aac38ac06cb75 Mario Limonciello 2025-02-14  125  			continue;
14eb1c96e3a3fd Meng Li           2022-08-17  126  		cpudata = policy->driver_data;
14eb1c96e3a3fd Meng Li           2022-08-17  127  
14eb1c96e3a3fd Meng Li           2022-08-17  128  		if (get_shared_mem()) {
14eb1c96e3a3fd Meng Li           2022-08-17  129  			ret = cppc_get_perf_caps(cpu, &cppc_perf);
14eb1c96e3a3fd Meng Li           2022-08-17  130  			if (ret) {
14eb1c96e3a3fd Meng Li           2022-08-17  131  				pr_err("%s cppc_get_perf_caps ret=%d error!\n", __func__, ret);
a7875346c68910 Mario Limonciello 2025-02-14  132  				return ret;
14eb1c96e3a3fd Meng Li           2022-08-17  133  			}
14eb1c96e3a3fd Meng Li           2022-08-17  134  
d3dec5bb61ce11 Meng Li           2023-08-03  135  			highest_perf = cppc_perf.highest_perf;
14eb1c96e3a3fd Meng Li           2022-08-17  136  			nominal_perf = cppc_perf.nominal_perf;
14eb1c96e3a3fd Meng Li           2022-08-17  137  			lowest_nonlinear_perf = cppc_perf.lowest_nonlinear_perf;
14eb1c96e3a3fd Meng Li           2022-08-17  138  			lowest_perf = cppc_perf.lowest_perf;
14eb1c96e3a3fd Meng Li           2022-08-17  139  		} else {
5e404cb7ac4c09 Ingo Molnar       2025-04-09 @140  			ret = rdmsrq_safe_on_cpu(cpu, MSR_AMD_CPPC_CAP1, &cap1);
14eb1c96e3a3fd Meng Li           2022-08-17  141  			if (ret) {
14eb1c96e3a3fd Meng Li           2022-08-17  142  				pr_err("%s read CPPC_CAP1 ret=%d error!\n", __func__, ret);
a7875346c68910 Mario Limonciello 2025-02-14  143  				return ret;
14eb1c96e3a3fd Meng Li           2022-08-17  144  			}
14eb1c96e3a3fd Meng Li           2022-08-17  145  
b4cc466b973590 Mario Limonciello 2024-12-07  146  			highest_perf = FIELD_GET(AMD_CPPC_HIGHEST_PERF_MASK, cap1);
b4cc466b973590 Mario Limonciello 2024-12-07  147  			nominal_perf = FIELD_GET(AMD_CPPC_NOMINAL_PERF_MASK, cap1);
b4cc466b973590 Mario Limonciello 2024-12-07  148  			lowest_nonlinear_perf = FIELD_GET(AMD_CPPC_LOWNONLIN_PERF_MASK, cap1);
b4cc466b973590 Mario Limonciello 2024-12-07  149  			lowest_perf = FIELD_GET(AMD_CPPC_LOWEST_PERF_MASK, cap1);
14eb1c96e3a3fd Meng Li           2022-08-17  150  		}
14eb1c96e3a3fd Meng Li           2022-08-17  151  
009d1c29a45194 Mario Limonciello 2025-01-17  152  		cur_perf = READ_ONCE(cpudata->perf);
009d1c29a45194 Mario Limonciello 2025-01-17  153  		if (highest_perf != cur_perf.highest_perf && !cpudata->hw_prefcore) {
9983a9cd4d429d Mario Limonciello 2024-07-02  154  			pr_err("%s cpu%d highest=%d %d highest perf doesn't match\n",
009d1c29a45194 Mario Limonciello 2025-01-17  155  				__func__, cpu, highest_perf, cur_perf.highest_perf);
a7875346c68910 Mario Limonciello 2025-02-14  156  			return -EINVAL;
9983a9cd4d429d Mario Limonciello 2024-07-02  157  		}
009d1c29a45194 Mario Limonciello 2025-01-17  158  		if (nominal_perf != cur_perf.nominal_perf ||
009d1c29a45194 Mario Limonciello 2025-01-17  159  		   (lowest_nonlinear_perf != cur_perf.lowest_nonlinear_perf) ||
009d1c29a45194 Mario Limonciello 2025-01-17  160  		   (lowest_perf != cur_perf.lowest_perf)) {
9983a9cd4d429d Mario Limonciello 2024-07-02  161  			pr_err("%s cpu%d nominal=%d %d lowest_nonlinear=%d %d lowest=%d %d, they should be equal!\n",
009d1c29a45194 Mario Limonciello 2025-01-17  162  				__func__, cpu, nominal_perf, cur_perf.nominal_perf,
009d1c29a45194 Mario Limonciello 2025-01-17  163  				lowest_nonlinear_perf, cur_perf.lowest_nonlinear_perf,
009d1c29a45194 Mario Limonciello 2025-01-17  164  				lowest_perf, cur_perf.lowest_perf);
a7875346c68910 Mario Limonciello 2025-02-14  165  			return -EINVAL;
14eb1c96e3a3fd Meng Li           2022-08-17  166  		}
14eb1c96e3a3fd Meng Li           2022-08-17  167  
14eb1c96e3a3fd Meng Li           2022-08-17  168  		if (!((highest_perf >= nominal_perf) &&
14eb1c96e3a3fd Meng Li           2022-08-17  169  			(nominal_perf > lowest_nonlinear_perf) &&
66030cc1c533e2 Mario Limonciello 2025-02-14  170  			(lowest_nonlinear_perf >= lowest_perf) &&
14eb1c96e3a3fd Meng Li           2022-08-17  171  			(lowest_perf > 0))) {
14eb1c96e3a3fd Meng Li           2022-08-17  172  			pr_err("%s cpu%d highest=%d >= nominal=%d > lowest_nonlinear=%d > lowest=%d > 0, the formula is incorrect!\n",
14eb1c96e3a3fd Meng Li           2022-08-17  173  				__func__, cpu, highest_perf, nominal_perf,
14eb1c96e3a3fd Meng Li           2022-08-17  174  				lowest_nonlinear_perf, lowest_perf);
a7875346c68910 Mario Limonciello 2025-02-14  175  			return -EINVAL;
14eb1c96e3a3fd Meng Li           2022-08-17  176  		}
14eb1c96e3a3fd Meng Li           2022-08-17  177  	}
14eb1c96e3a3fd Meng Li           2022-08-17  178  
a7875346c68910 Mario Limonciello 2025-02-14  179  	return 0;
14eb1c96e3a3fd Meng Li           2022-08-17  180  }
14eb1c96e3a3fd Meng Li           2022-08-17  181  

:::::: The code at line 93 was first introduced by commit
:::::: 6fe22abacd40e259fffec744a02d5ca3febccd68 x86/msr: Rename 'rdmsrl_safe()' to 'rdmsrq_safe()'

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
