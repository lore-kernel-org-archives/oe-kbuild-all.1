Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1175654769
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 05:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745125689; cv=none; b=pEVMCdSj+lukLXMKceBF4wrvIGxWwIvqOyN6Y2BZp+mzOzqvWp1zrAc6Z65SeB35uMhDl4dzD0fWEKk+W6SZveoO/ROEVWf/iE2l9jIUyHp1SU8uPwPPf0/b8A+CeCF2usoGY6Ml/XOnEFJCQAsEbhrsruwgS4OmpSXy39dwN5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745125689; c=relaxed/simple;
	bh=TGy8k4gul77MTocmOei5qIlbgPtSsphj032qZv1+NXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TuOy9NpPyMlbfJVOUuAWETJBR5jhez3DtacDntqKuCf//AUzyQQfm1ZozF0JnUFutGzNY8FWw2xR9dfUHL5N/n2ygvW4MQ0w6J5gx7WMmS3ztlfdKhjgGE3RYGZyz85QbjqhX3l3qgErkAz51dEXh3jrHHAZyJGvAjMoUaZL1Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aAARM5iW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aAARM5iW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745125686; x=1776661686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TGy8k4gul77MTocmOei5qIlbgPtSsphj032qZv1+NXE=;
  b=aAARM5iWld/p8HTYk2/wD+nXG4hM6QTiylR7/geJnoAMO1oGxeidXlL3
   DHPdSBUe3jhsbyRDcj/0aePphN675dLruTBrF8qbJDEtl4aF3xL3hmVP0
   R5+xlzCCooAUvWxiK6T5JV7THR/inmjHiE003XrpOeUXFbyPMjsg5rSk/
   6wuXm7gfWo8bbbyfp6q1iRYFc8/HzrLYdgOnLl6BsryWFbYVG47IviKdz
   O6+nIUk82f7ATblToT5T/bJl+GplhOGkFXkPCTJaAD1/oyprILodRJq6l
   0okwxsk3ZTCdZyVHELjZsDoNhi8/rSwmZwuk6y9lerZFUin3y9Eu6oaHF
   w==;
X-CSE-ConnectionGUID: NcdO6ITnRoOoomGsMJlNoQ==
X-CSE-MsgGUID: z3tGU10cS+OXpDCnGmUccg==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="72085301"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="72085301"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 22:08:03 -0700
X-CSE-ConnectionGUID: Q28H1p3wRP6KrLPMwJqWwg==
X-CSE-MsgGUID: EGJ4RG+nRKWoxh6kNYgT0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136255949"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Apr 2025 22:08:01 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6MuN-0004RF-26;
	Sun, 20 Apr 2025 05:07:59 +0000
Date: Sun, 20 Apr 2025 13:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:rdpmc_cleanup 1/6]
 arch/x86/kernel/hpet.c:973:2: error: call to undeclared function 'rdmsrq';
 ISO C99 and later do not support implicit function declarations
Message-ID: <202504201324.BUmTKAgm-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20250420 (https://download.01.org/0day-ci/archive/20250420/202504201324.BUmTKAgm-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201324.BUmTKAgm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201324.BUmTKAgm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/hpet.c:973:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     973 |         rdmsrq(MSR_PKG_CST_CONFIG_CONTROL, pcfg);
         |         ^
   1 error generated.
--
   In file included from arch/x86/events/msr.c:2:
   In file included from include/linux/perf_event.h:25:
   In file included from arch/x86/include/asm/perf_event.h:604:
   In file included from arch/x86/include/asm/stacktrace.h:14:
   arch/x86/include/asm/switch_to.h:62:2: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |         wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
         |         ^
>> arch/x86/events/msr.c:234:3: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     234 |                 rdmsrq(event->hw.event_base, now);
         |                 ^
   2 errors generated.
--
   In file included from arch/x86/events/utils.c:5:
   In file included from arch/x86/events/perf_event.h:15:
   In file included from include/linux/perf_event.h:25:
   In file included from arch/x86/include/asm/perf_event.h:604:
   In file included from arch/x86/include/asm/stacktrace.h:14:
   arch/x86/include/asm/switch_to.h:62:2: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |         wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
         |         ^
   In file included from arch/x86/events/utils.c:5:
>> arch/x86/events/perf_event.h:1238:3: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1238 |                 wrmsrq(hwc->extra_reg.reg, hwc->extra_reg.config);
         |                 ^
   arch/x86/events/perf_event.h:1263:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1263 |         wrmsrq(hwc->config_base, hwc->config & ~disable_mask);
         |         ^
>> arch/x86/events/perf_event.h:1434:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1434 |         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
         |         ^
   arch/x86/events/perf_event.h:1435:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1435 |         wrmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg & ~DBG_EXTN_CFG_LBRV2EN);
         |         ^
   arch/x86/events/perf_event.h:1571:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1571 |         wrmsrq(MSR_IA32_PEBS_ENABLE, 0);
         |         ^
   arch/x86/events/perf_event.h:1576:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1576 |         wrmsrq(MSR_ARCH_LBR_CTL, 0);
         |         ^
   arch/x86/events/perf_event.h:1583:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1583 |         rdmsrq(MSR_IA32_DEBUGCTLMSR, debugctl);
         |         ^
   arch/x86/events/perf_event.h:1585:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1585 |         wrmsrq(MSR_IA32_DEBUGCTLMSR, debugctl);
         |         ^
   9 errors generated.
--
>> drivers/hwmon/hwmon-vid.c:241:2: error: call to undeclared function 'rdmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     241 |         rdmsr(0x198, dummy, vid);
         |         ^
   1 error generated.
--
   In file included from arch/x86/events/intel/knc.c:4:
   In file included from include/linux/perf_event.h:25:
   In file included from arch/x86/include/asm/perf_event.h:604:
   In file included from arch/x86/include/asm/stacktrace.h:14:
   arch/x86/include/asm/switch_to.h:62:2: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |         wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
         |         ^
   In file included from arch/x86/events/intel/knc.c:9:
>> arch/x86/events/intel/../perf_event.h:1238:3: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1238 |                 wrmsrq(hwc->extra_reg.reg, hwc->extra_reg.config);
         |                 ^
   arch/x86/events/intel/../perf_event.h:1263:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1263 |         wrmsrq(hwc->config_base, hwc->config & ~disable_mask);
         |         ^
>> arch/x86/events/intel/../perf_event.h:1434:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1434 |         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
         |         ^
   arch/x86/events/intel/../perf_event.h:1435:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1435 |         wrmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg & ~DBG_EXTN_CFG_LBRV2EN);
         |         ^
   arch/x86/events/intel/../perf_event.h:1571:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1571 |         wrmsrq(MSR_IA32_PEBS_ENABLE, 0);
         |         ^
   arch/x86/events/intel/../perf_event.h:1576:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1576 |         wrmsrq(MSR_ARCH_LBR_CTL, 0);
         |         ^
   arch/x86/events/intel/../perf_event.h:1583:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1583 |         rdmsrq(MSR_IA32_DEBUGCTLMSR, debugctl);
         |         ^
   arch/x86/events/intel/../perf_event.h:1585:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1585 |         wrmsrq(MSR_IA32_DEBUGCTLMSR, debugctl);
         |         ^
>> arch/x86/events/intel/knc.c:162:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     162 |         rdmsrq(MSR_KNC_IA32_PERF_GLOBAL_CTRL, val);
         |         ^
>> arch/x86/events/intel/knc.c:164:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     164 |         wrmsrq(MSR_KNC_IA32_PERF_GLOBAL_CTRL, val);
         |         ^
   arch/x86/events/intel/knc.c:171:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     171 |         rdmsrq(MSR_KNC_IA32_PERF_GLOBAL_CTRL, val);
         |         ^
   arch/x86/events/intel/knc.c:173:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |         wrmsrq(MSR_KNC_IA32_PERF_GLOBAL_CTRL, val);
         |         ^
>> arch/x86/events/intel/knc.c:185:8: error: call to undeclared function 'wrmsrq_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     185 |         (void)wrmsrq_safe(hwc->config_base + hwc->idx, val);
         |               ^
   arch/x86/events/intel/knc.c:196:8: error: call to undeclared function 'wrmsrq_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     196 |         (void)wrmsrq_safe(hwc->config_base + hwc->idx, val);
         |               ^
   arch/x86/events/intel/knc.c:203:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     203 |         rdmsrq(MSR_KNC_IA32_PERF_GLOBAL_STATUS, status);
         |         ^
   arch/x86/events/intel/knc.c:210:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     210 |         wrmsrq(MSR_KNC_IA32_PERF_GLOBAL_OVF_CONTROL, ack);
         |         ^
   17 errors generated.
--
   In file included from arch/x86/events/intel/p6.c:2:
   In file included from include/linux/perf_event.h:25:
   In file included from arch/x86/include/asm/perf_event.h:604:
   In file included from arch/x86/include/asm/stacktrace.h:14:
   arch/x86/include/asm/switch_to.h:62:2: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |         wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
         |         ^
   In file included from arch/x86/events/intel/p6.c:7:
>> arch/x86/events/intel/../perf_event.h:1238:3: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1238 |                 wrmsrq(hwc->extra_reg.reg, hwc->extra_reg.config);
         |                 ^
   arch/x86/events/intel/../perf_event.h:1263:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1263 |         wrmsrq(hwc->config_base, hwc->config & ~disable_mask);
         |         ^
>> arch/x86/events/intel/../perf_event.h:1434:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1434 |         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
         |         ^
   arch/x86/events/intel/../perf_event.h:1435:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1435 |         wrmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg & ~DBG_EXTN_CFG_LBRV2EN);
         |         ^
   arch/x86/events/intel/../perf_event.h:1571:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1571 |         wrmsrq(MSR_IA32_PEBS_ENABLE, 0);
         |         ^
   arch/x86/events/intel/../perf_event.h:1576:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1576 |         wrmsrq(MSR_ARCH_LBR_CTL, 0);
         |         ^
   arch/x86/events/intel/../perf_event.h:1583:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1583 |         rdmsrq(MSR_IA32_DEBUGCTLMSR, debugctl);
         |         ^
   arch/x86/events/intel/../perf_event.h:1585:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1585 |         wrmsrq(MSR_IA32_DEBUGCTLMSR, debugctl);
         |         ^
>> arch/x86/events/intel/p6.c:145:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     145 |         rdmsrq(MSR_P6_EVNTSEL0, val);
         |         ^
>> arch/x86/events/intel/p6.c:147:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     147 |         wrmsrq(MSR_P6_EVNTSEL0, val);
         |         ^
   arch/x86/events/intel/p6.c:155:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     155 |         rdmsrq(MSR_P6_EVNTSEL0, val);
         |         ^
   arch/x86/events/intel/p6.c:157:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     157 |         wrmsrq(MSR_P6_EVNTSEL0, val);
         |         ^
>> arch/x86/events/intel/p6.c:166:8: error: call to undeclared function 'wrmsrq_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     166 |         (void)wrmsrq_safe(hwc->config_base, val);
         |               ^
   arch/x86/events/intel/p6.c:183:8: error: call to undeclared function 'wrmsrq_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     183 |         (void)wrmsrq_safe(hwc->config_base, val);
         |               ^
   15 errors generated.
--
   In file included from arch/x86/events/intel/bts.c:19:
   In file included from arch/x86/include/asm/perf_event.h:604:
   In file included from arch/x86/include/asm/stacktrace.h:14:
   arch/x86/include/asm/switch_to.h:62:2: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |         wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
         |         ^
   In file included from arch/x86/events/intel/bts.c:21:
>> arch/x86/events/intel/../perf_event.h:1238:3: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1238 |                 wrmsrq(hwc->extra_reg.reg, hwc->extra_reg.config);
         |                 ^
   arch/x86/events/intel/../perf_event.h:1263:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1263 |         wrmsrq(hwc->config_base, hwc->config & ~disable_mask);
         |         ^
>> arch/x86/events/intel/../perf_event.h:1434:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1434 |         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
         |         ^
   arch/x86/events/intel/../perf_event.h:1435:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1435 |         wrmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg & ~DBG_EXTN_CFG_LBRV2EN);
         |         ^
   arch/x86/events/intel/../perf_event.h:1571:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1571 |         wrmsrq(MSR_IA32_PEBS_ENABLE, 0);
         |         ^
   arch/x86/events/intel/../perf_event.h:1576:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1576 |         wrmsrq(MSR_ARCH_LBR_CTL, 0);
         |         ^
   arch/x86/events/intel/../perf_event.h:1583:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1583 |         rdmsrq(MSR_IA32_DEBUGCTLMSR, debugctl);
         |         ^
   arch/x86/events/intel/../perf_event.h:1585:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1585 |         wrmsrq(MSR_IA32_DEBUGCTLMSR, debugctl);
         |         ^
   9 errors generated.
--
   In file included from arch/x86/events/intel/pt.c:22:
   In file included from arch/x86/include/asm/perf_event.h:604:
   In file included from arch/x86/include/asm/stacktrace.h:14:
   arch/x86/include/asm/switch_to.h:62:2: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |         wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
         |         ^
   In file included from arch/x86/events/intel/pt.c:28:
>> arch/x86/events/intel/../perf_event.h:1238:3: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1238 |                 wrmsrq(hwc->extra_reg.reg, hwc->extra_reg.config);
         |                 ^
   arch/x86/events/intel/../perf_event.h:1263:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1263 |         wrmsrq(hwc->config_base, hwc->config & ~disable_mask);
         |         ^
>> arch/x86/events/intel/../perf_event.h:1434:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1434 |         rdmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg);
         |         ^
   arch/x86/events/intel/../perf_event.h:1435:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1435 |         wrmsrq(MSR_AMD_DBG_EXTN_CFG, dbg_extn_cfg & ~DBG_EXTN_CFG_LBRV2EN);
         |         ^
   arch/x86/events/intel/../perf_event.h:1571:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1571 |         wrmsrq(MSR_IA32_PEBS_ENABLE, 0);
         |         ^
   arch/x86/events/intel/../perf_event.h:1576:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1576 |         wrmsrq(MSR_ARCH_LBR_CTL, 0);
         |         ^
   arch/x86/events/intel/../perf_event.h:1583:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1583 |         rdmsrq(MSR_IA32_DEBUGCTLMSR, debugctl);
         |         ^
   arch/x86/events/intel/../perf_event.h:1585:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1585 |         wrmsrq(MSR_IA32_DEBUGCTLMSR, debugctl);
         |         ^
>> arch/x86/events/intel/pt.c:197:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     197 |         rdmsrq(MSR_PLATFORM_INFO, reg);
         |         ^
>> arch/x86/events/intel/pt.c:429:3: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     429 |                 wrmsrq(MSR_IA32_RTIT_CTL, ctl);
         |                 ^
   arch/x86/events/intel/pt.c:488:4: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     488 |                         wrmsrq(pt_address_ranges[range].msr_a, filter->msr_a);
         |                         ^
   arch/x86/events/intel/pt.c:493:4: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     493 |                         wrmsrq(pt_address_ranges[range].msr_b, filter->msr_b);
         |                         ^
   arch/x86/events/intel/pt.c:512:3: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     512 |                 wrmsrq(MSR_IA32_RTIT_STATUS, 0);
         |                 ^
   arch/x86/events/intel/pt.c:572:3: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     572 |                 wrmsrq(MSR_IA32_RTIT_CTL, ctl);
         |                 ^
   arch/x86/events/intel/pt.c:661:3: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     661 |                 wrmsrq(MSR_IA32_RTIT_OUTPUT_BASE, reg);
         |                 ^
   arch/x86/events/intel/pt.c:667:3: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     667 |                 wrmsrq(MSR_IA32_RTIT_OUTPUT_MASK, reg);
         |                 ^
   arch/x86/events/intel/pt.c:740:2: warning: array index -1 is before the beginning of the array [-Warray-bounds]
     740 |         TOPA_ENTRY(last, -1)->base = topa_pfn(topa);
         |         ^                ~~
   arch/x86/events/intel/pt.c:640:6: note: expanded from macro 'TOPA_ENTRY'
     640 |                 : &topa_to_page(t)->table[(i)])
         |                    ^                       ~
   arch/x86/events/intel/pt.c:617:2: note: array 'table' declared here
     617 |         struct topa_entry       table[TENTS_PER_PAGE];
         |         ^
   arch/x86/events/intel/pt.c:741:2: warning: array index -1 is before the beginning of the array [-Warray-bounds]
     741 |         TOPA_ENTRY(last, -1)->end = 1;
         |         ^                ~~
   arch/x86/events/intel/pt.c:640:6: note: expanded from macro 'TOPA_ENTRY'
     640 |                 : &topa_to_page(t)->table[(i)])
         |                    ^                       ~
   arch/x86/events/intel/pt.c:617:2: note: array 'table' declared here
     617 |         struct topa_entry       table[TENTS_PER_PAGE];
         |         ^
   arch/x86/events/intel/pt.c:791:2: warning: array index -1 is before the beginning of the array [-Warray-bounds]
     791 |         TOPA_ENTRY(topa, -1)->base = page_to_phys(p) >> TOPA_SHIFT;
         |         ^                ~~
   arch/x86/events/intel/pt.c:640:6: note: expanded from macro 'TOPA_ENTRY'
     640 |                 : &topa_to_page(t)->table[(i)])
         |                    ^                       ~
   arch/x86/events/intel/pt.c:617:2: note: array 'table' declared here
     617 |         struct topa_entry       table[TENTS_PER_PAGE];
         |         ^
   arch/x86/events/intel/pt.c:792:2: warning: array index -1 is before the beginning of the array [-Warray-bounds]
     792 |         TOPA_ENTRY(topa, -1)->size = order;
         |         ^                ~~
   arch/x86/events/intel/pt.c:640:6: note: expanded from macro 'TOPA_ENTRY'
     640 |                 : &topa_to_page(t)->table[(i)])
         |                    ^                       ~
   arch/x86/events/intel/pt.c:617:2: note: array 'table' declared here
     617 |         struct topa_entry       table[TENTS_PER_PAGE];
         |         ^
   arch/x86/events/intel/pt.c:795:3: warning: array index -1 is before the beginning of the array [-Warray-bounds]
     795 |                 TOPA_ENTRY(topa, -1)->intr = 1;
         |                 ^                ~~
   arch/x86/events/intel/pt.c:640:6: note: expanded from macro 'TOPA_ENTRY'
     640 |                 : &topa_to_page(t)->table[(i)])
         |                    ^                       ~
   arch/x86/events/intel/pt.c:617:2: note: array 'table' declared here
     617 |         struct topa_entry       table[TENTS_PER_PAGE];
         |         ^
   arch/x86/events/intel/pt.c:796:3: warning: array index -1 is before the beginning of the array [-Warray-bounds]
     796 |                 TOPA_ENTRY(topa, -1)->stop = 1;
         |                 ^                ~~
   arch/x86/events/intel/pt.c:640:6: note: expanded from macro 'TOPA_ENTRY'
     640 |                 : &topa_to_page(t)->table[(i)])
         |                    ^                       ~
   arch/x86/events/intel/pt.c:617:2: note: array 'table' declared here
     617 |         struct topa_entry       table[TENTS_PER_PAGE];
         |         ^
   arch/x86/events/intel/pt.c:929:2: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     929 |         rdmsrq(MSR_IA32_RTIT_STATUS, status);
         |         ^
   arch/x86/events/intel/pt.c:973:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     973 |         wrmsrq(MSR_IA32_RTIT_STATUS, status);
         |         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   6 warnings and 20 errors generated.
..


vim +/rdmsrq +973 arch/x86/kernel/hpet.c

6e3cd95234dc1e Thomas Gleixner 2021-09-30  929  
6e3cd95234dc1e Thomas Gleixner 2021-09-30  930  /*
6e3cd95234dc1e Thomas Gleixner 2021-09-30  931   * Check whether the system supports PC10. If so force disable HPET as that
6e3cd95234dc1e Thomas Gleixner 2021-09-30  932   * stops counting in PC10. This check is overbroad as it does not take any
6e3cd95234dc1e Thomas Gleixner 2021-09-30  933   * of the following into account:
6e3cd95234dc1e Thomas Gleixner 2021-09-30  934   *
6e3cd95234dc1e Thomas Gleixner 2021-09-30  935   *	- ACPI tables
6e3cd95234dc1e Thomas Gleixner 2021-09-30  936   *	- Enablement of intel_idle
6e3cd95234dc1e Thomas Gleixner 2021-09-30  937   *	- Command line arguments which limit intel_idle C-state support
6e3cd95234dc1e Thomas Gleixner 2021-09-30  938   *
6e3cd95234dc1e Thomas Gleixner 2021-09-30  939   * That's perfectly fine. HPET is a piece of hardware designed by committee
6e3cd95234dc1e Thomas Gleixner 2021-09-30  940   * and the only reasons why it is still in use on modern systems is the
6e3cd95234dc1e Thomas Gleixner 2021-09-30  941   * fact that it is impossible to reliably query TSC and CPU frequency via
6e3cd95234dc1e Thomas Gleixner 2021-09-30  942   * CPUID or firmware.
6e3cd95234dc1e Thomas Gleixner 2021-09-30  943   *
6e3cd95234dc1e Thomas Gleixner 2021-09-30  944   * If HPET is functional it is useful for calibrating TSC, but this can be
6e3cd95234dc1e Thomas Gleixner 2021-09-30  945   * done via PMTIMER as well which seems to be the last remaining timer on
6e3cd95234dc1e Thomas Gleixner 2021-09-30  946   * X86/INTEL platforms that has not been completely wreckaged by feature
6e3cd95234dc1e Thomas Gleixner 2021-09-30  947   * creep.
6e3cd95234dc1e Thomas Gleixner 2021-09-30  948   *
6e3cd95234dc1e Thomas Gleixner 2021-09-30  949   * In theory HPET support should be removed altogether, but there are older
6e3cd95234dc1e Thomas Gleixner 2021-09-30  950   * systems out there which depend on it because TSC and APIC timer are
6e3cd95234dc1e Thomas Gleixner 2021-09-30  951   * dysfunctional in deeper C-states.
6e3cd95234dc1e Thomas Gleixner 2021-09-30  952   *
6e3cd95234dc1e Thomas Gleixner 2021-09-30  953   * It's only 20 years now that hardware people have been asked to provide
6e3cd95234dc1e Thomas Gleixner 2021-09-30  954   * reliable and discoverable facilities which can be used for timekeeping
6e3cd95234dc1e Thomas Gleixner 2021-09-30  955   * and per CPU timer interrupts.
6e3cd95234dc1e Thomas Gleixner 2021-09-30  956   *
6e3cd95234dc1e Thomas Gleixner 2021-09-30  957   * The probability that this problem is going to be solved in the
54aa699e8094ef Bjorn Helgaas   2024-01-02  958   * foreseeable future is close to zero, so the kernel has to be cluttered
6e3cd95234dc1e Thomas Gleixner 2021-09-30  959   * with heuristics to keep up with the ever growing amount of hardware and
6e3cd95234dc1e Thomas Gleixner 2021-09-30  960   * firmware trainwrecks. Hopefully some day hardware people will understand
6e3cd95234dc1e Thomas Gleixner 2021-09-30  961   * that the approach of "This can be fixed in software" is not sustainable.
6e3cd95234dc1e Thomas Gleixner 2021-09-30  962   * Hope dies last...
6e3cd95234dc1e Thomas Gleixner 2021-09-30  963   */
6e3cd95234dc1e Thomas Gleixner 2021-09-30  964  static bool __init hpet_is_pc10_damaged(void)
6e3cd95234dc1e Thomas Gleixner 2021-09-30  965  {
6e3cd95234dc1e Thomas Gleixner 2021-09-30  966  	unsigned long long pcfg;
6e3cd95234dc1e Thomas Gleixner 2021-09-30  967  
6e3cd95234dc1e Thomas Gleixner 2021-09-30  968  	/* Check whether PC10 substates are supported */
6e3cd95234dc1e Thomas Gleixner 2021-09-30  969  	if (!mwait_pc10_supported())
6e3cd95234dc1e Thomas Gleixner 2021-09-30  970  		return false;
6e3cd95234dc1e Thomas Gleixner 2021-09-30  971  
6e3cd95234dc1e Thomas Gleixner 2021-09-30  972  	/* Check whether PC10 is enabled in PKG C-state limit */
c435e608cf59ff Ingo Molnar     2025-04-09 @973  	rdmsrq(MSR_PKG_CST_CONFIG_CONTROL, pcfg);
6e3cd95234dc1e Thomas Gleixner 2021-09-30  974  	if ((pcfg & 0xF) < 8)
6e3cd95234dc1e Thomas Gleixner 2021-09-30  975  		return false;
6e3cd95234dc1e Thomas Gleixner 2021-09-30  976  
6e3cd95234dc1e Thomas Gleixner 2021-09-30  977  	if (hpet_force_user) {
6e3cd95234dc1e Thomas Gleixner 2021-09-30  978  		pr_warn("HPET force enabled via command line, but dysfunctional in PC10.\n");
6e3cd95234dc1e Thomas Gleixner 2021-09-30  979  		return false;
6e3cd95234dc1e Thomas Gleixner 2021-09-30  980  	}
6e3cd95234dc1e Thomas Gleixner 2021-09-30  981  
6e3cd95234dc1e Thomas Gleixner 2021-09-30  982  	pr_info("HPET dysfunctional in PC10. Force disabled.\n");
6e3cd95234dc1e Thomas Gleixner 2021-09-30  983  	boot_hpet_disable = true;
6e3cd95234dc1e Thomas Gleixner 2021-09-30  984  	return true;
6e3cd95234dc1e Thomas Gleixner 2021-09-30  985  }
6e3cd95234dc1e Thomas Gleixner 2021-09-30  986  

:::::: The code at line 973 was first introduced by commit
:::::: c435e608cf59ffab815aa2571182dc8c50fe4112 x86/msr: Rename 'rdmsrl()' to 'rdmsrq()'

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
