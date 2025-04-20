Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A980F50F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 00:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745108259; cv=none; b=Hm/CnOrLZakRNJ0+wdNc4tdzlF6x55d2Ky25KluBr18FrohgvaTNCBu35yc2AZG+clvADPzqgkK/3cU2pQVLoy73XAEs/RTC6FUd2IXTJ38m1e0FIxXBuXnHklE5T3GW1VVK6dGM2se8dmzo3YzYMVeYl4DdZseVc9gjJArRwyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745108259; c=relaxed/simple;
	bh=kHwSccE3p3g5Hoh2XvbIUbIhgszkhQVLPoyfkQe6C6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D2wAsHsSHMae3UbFbCBgzGJ7VxS8HDD85cH8RRwx9ZLdHaxpMBFzobBZNviiJS2CzmN/xfMjzwh+sBktG4EFY5rrSsXsNrZmy24tjT46SzuFZEweXXqsbsxVKTXRGle4/uCaajSxNEUHjZM8p1IPPRF/YooocVUrfGw6cIZEQPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixrgEVJc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixrgEVJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745108258; x=1776644258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kHwSccE3p3g5Hoh2XvbIUbIhgszkhQVLPoyfkQe6C6g=;
  b=ixrgEVJcHlU2fnupUrk61yXaspgdNv+m0zX98XKjF4zvdSihhCSmqSA2
   j/hjFwjQnlEymRt0EsZ10FfvrU94InM/am1OFL/eR9FzeRK81JDDlWpCg
   TR421IfM0kJF736txR+oMfy8njTUk43R2rcdMOrGzT6Uc0pnLbcj8cOxO
   OX+VWhqwDTJzBm420SFCZsXDOz7skVEGKYl0XrhSxEIPzpWIRvDsrdC8i
   h8plH/z+C+ya0GaRSBbn0MuzBuCkVYGSNOfsbgK90I3eWImACumY3v641
   7sCnfKSFJT+/3cnl3X1gECttVBVX2DOdoy2+q1jpxycNaBEOogKVQUB7L
   g==;
X-CSE-ConnectionGUID: 9SnFOKAhQR6JeWl2HYaweg==
X-CSE-MsgGUID: JygoAWFdTF+47tquaYS65g==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="72078046"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="72078046"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 17:17:37 -0700
X-CSE-ConnectionGUID: Pw0bER0MTRWFXSSj2nT0jw==
X-CSE-MsgGUID: wriqIYcqQaK6+I5D0FlOTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136374076"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Apr 2025 17:17:36 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6INJ-0004Hr-1l;
	Sun, 20 Apr 2025 00:17:33 +0000
Date: Sun, 20 Apr 2025 08:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 21/33]
 arch/x86/include/asm/msr.h:357:37: error: call to undeclared function
 'get_pv_msr_action'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202504200859.ZE5Ds4hS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   168ed74cc0471e1a72488e1e6f484a25c5304202
commit: cde95b7425fd6ff3b1e84f45bd07171485b55503 [21/33] x86/msr: Use the alternatives mechanism to write MSR
config: x86_64-buildonly-randconfig-001-20250420 (https://download.01.org/0day-ci/archive/20250420/202504200859.ZE5Ds4hS-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200859.ZE5Ds4hS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504200859.ZE5Ds4hS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:14:
   In file included from arch/x86/include/asm/fsgsbase.h:9:
>> arch/x86/include/asm/msr.h:357:37: error: call to undeclared function 'get_pv_msr_action'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     357 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                                                   ^
>> arch/x86/include/asm/msr.h:357:28: error: variable has incomplete type 'const enum pv_msr_action'
     357 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                                          ^
   arch/x86/include/asm/msr.h:357:14: note: forward declaration of 'enum pv_msr_action'
     357 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                            ^
>> arch/x86/include/asm/msr.h:359:17: error: use of undeclared identifier 'PV_MSR_IGNORE'
     359 |                 if (action == PV_MSR_IGNORE)
         |                               ^
>> arch/x86/include/asm/msr.h:362:11: error: call to undeclared function '__xenpv_wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     362 |                         return __xenpv_wrmsr(msr, val, type);
         |                                ^
   arch/x86/include/asm/msr.h:406:10: error: call to undeclared function 'xen_read_pmc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     406 |                 return xen_read_pmc(counter);
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


vim +/get_pv_msr_action +357 arch/x86/include/asm/msr.h

   352	
   353	static __always_inline bool __wrmsr(u32 msr, u64 val, int type)
   354	{
   355		/* When built with CONFIG_XEN_PV and running on Xen hypervisor. */
   356		if (cpu_feature_enabled(X86_FEATURE_XENPV)) {
 > 357			const enum pv_msr_action action = get_pv_msr_action(msr);
   358	
 > 359			if (action == PV_MSR_IGNORE)
   360				return false;
   361			else
 > 362				return __xenpv_wrmsr(msr, val, type);
   363		} else {
   364			/*
   365			 * 1) When built with !CONFIG_XEN_PV.
   366			 * 2) When built with CONFIG_XEN_PV but not running on Xen hypervisor.
   367			 */
   368			bool ret = __native_wrmsr(msr, val, type);
   369	
   370			if (tracepoint_enabled(write_msr))
   371				do_trace_write_msr(msr, val, ret ? -EIO : 0);
   372	
   373			return ret;
   374		}
   375	}
   376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
