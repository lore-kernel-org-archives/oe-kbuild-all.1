Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2E814A62B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Apr 2025 23:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745106397; cv=none; b=b2QqDHKYm/N1B4yWPpvpJ6k9+67tmT/x2brncRt1zgwFtt7s99ugKltfTNCrEr9efvR7cWpdxHY0+nx/besudoUBkyyqDiXgndLF1FMhHCMpKXg//ie2m5tSZ8w+2NyLBLO0+WvuWLSBuGOGyApajeuF6yHkJbbir8lck5tuL94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745106397; c=relaxed/simple;
	bh=UsMxMKqWMJTlP6FqS+Z/d1D0o+jg1WsPMi1eqziTMKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CTvSg0I6DaeT0eYoTZT1UO4R6PcXgi4DYYPdW86OuzjyIK/wIttLBS8sZobygeBn/Vs/YoyV/tD/2MtgZQgv5cco1se2AP2c9EWQp9feXAZv1k/p+3AVf/vMFNkd3k5pdVMqM+AfFuvSorytG83Rb3ZxO7Lz4iLr7xLrB/lTTlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceu4usOQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceu4usOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745106395; x=1776642395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UsMxMKqWMJTlP6FqS+Z/d1D0o+jg1WsPMi1eqziTMKg=;
  b=ceu4usOQ2nsS/0egJS6F+dmLrciRvh8afeBx9IzI0o7Rd6cFC9Sbcuv3
   IIsThft+5GEij5Oa/5L3HtUYUYizyyUDEtY6e1bUG9Qz7Ds+gSZft4Ra6
   cYp6KtvHlDgjrANaHJgmxnbw3OpGXeQeFKIhGxL8FRhDJJDXZTkbEwuZb
   9+Srr8XlWPAjAFA7y/sRFaCsnyNyIC7OZmmYhAoYVBoOLWDqFMmPPFY/M
   YSqkwR+EfbLno0NmCCx8jvhGvHnHh/jykeemLa8qDU1MZ7kWE6i+ESJ0b
   WaTxz0yoh+PSPJaekP/OCjt+qMAXmcGlA5A1mfs/NZzW6xWFFxNwdLumJ
   g==;
X-CSE-ConnectionGUID: sPIiVFsER22LRwSLwZQZTw==
X-CSE-MsgGUID: OFJxF5KITi6QAfBbh2T6jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="56866317"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="56866317"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 16:46:34 -0700
X-CSE-ConnectionGUID: t06OyDtQQTKX11MmTxxEIw==
X-CSE-MsgGUID: obJa0VKgSxiMEcplyFtR7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="168603848"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Apr 2025 16:46:34 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6HtH-0004GP-0i;
	Sat, 19 Apr 2025 23:46:31 +0000
Date: Sun, 20 Apr 2025 07:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:rdpmc_cleanup 6/6]
 arch/x86/include/asm/msr.h:183:10: error: call to undeclared function
 'xen_read_pmc'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202504200736.Qluy5SS6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git rdpmc_cleanup
head:   3eeb4c90020080bbe299d3b6d9a86ea5485fabee
commit: 3eeb4c90020080bbe299d3b6d9a86ea5485fabee [6/6] x86/msr: Use the alternatives mechanism to read PMC
config: x86_64-buildonly-randconfig-001-20250420 (https://download.01.org/0day-ci/archive/20250420/202504200736.Qluy5SS6-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200736.Qluy5SS6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504200736.Qluy5SS6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:14:
   In file included from arch/x86/include/asm/fsgsbase.h:9:
>> arch/x86/include/asm/msr.h:183:10: error: call to undeclared function 'xen_read_pmc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     183 |                 return xen_read_pmc(counter);
         |                        ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:


vim +/xen_read_pmc +183 arch/x86/include/asm/msr.h

   176	
   177	static __always_inline u64 rdpmcq(int counter)
   178	{
   179		DECLARE_ARGS(val, low, high);
   180	
   181		/* When built with CONFIG_XEN_PV and running on Xen hypervisor. */
   182		if (cpu_feature_enabled(X86_FEATURE_XENPV))
 > 183			return xen_read_pmc(counter);
   184	
   185		/*
   186		 * 1) When built with !CONFIG_XEN_PV.
   187		 * 2) When built with CONFIG_XEN_PV but not running on Xen hypervisor.
   188		 */
   189		asm_inline volatile("rdpmc" : EAX_EDX_RET(val, low, high) : "c" (counter));
   190	
   191		if (tracepoint_enabled(rdpmc))
   192			do_trace_rdpmc(counter, EAX_EDX_VAL(val, low, high), 0);
   193	
   194		return EAX_EDX_VAL(val, low, high);
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
