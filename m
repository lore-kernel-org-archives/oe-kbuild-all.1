Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC93A42056
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 12:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735389805; cv=none; b=eh+OvqB08arfca/PSDZNoeU1XOh38/Q7TxF5D0UI/2PRo1RadAnjDagZLfimT0L23xEwzab9C4zSjoB7M37c1j/vwwJrA+l/vzf6ChiM8705lYude7KVkn6TNt1djzYL4ymoaWrdr/f2g/KO867mvFZTybjA11IY0biSsNGGNIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735389805; c=relaxed/simple;
	bh=VDV7ND44faVi7rvyzGSRP1q1LfZnOKdYpJc25wy50ro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NrizDNqXwm1I2o5MjrJ+DpM0oeo4WDBO8NwbxhefcCf0GXywiThO/HwPhhFU7iaBxLfyEBduwK5XLSb0ZrmqlDQt5627WErLmoR1PrmmW9BXfcaclE7hNOTHb/Y4ns314Urs5Z+D9pNxFIV0ctIyLaGSGJ4kfFPKAzK0T+IbbOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKPSPWbO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKPSPWbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735389803; x=1766925803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VDV7ND44faVi7rvyzGSRP1q1LfZnOKdYpJc25wy50ro=;
  b=EKPSPWbOVEAfXzQiZx5e2qQOrD4EnRSXD0KBfh1qRjWEQrYWX4XVvrG/
   LbYNu0PM6ubPVaDcdj3/3VrVWUds2ZBtMsERfmqQjm4EUEjU/Z+BOeIas
   swbPi6HJMiDS0+NLXTSiiTpnV9unzbcwwLSvXAUdgICmhQnJDpNkTvM0H
   Eom2onWbZjV2rtZNKyf97iVqzW/AgsWqQaS4Frpqmzrmtgz6yafBK3hZA
   ws0eAOEKBpf/iE1Q2xDFaHeWM8Dk3Cos2friLvmoTZZBzVEFPmTGiEnVs
   8hwk/Q3W1pdi03j5+HaVdJUl8WukThoy2BDqD1j8FsE4z+CXnPfhHUmi9
   Q==;
X-CSE-ConnectionGUID: 2rMX86q/RqeUcltU2KLgfQ==
X-CSE-MsgGUID: ilvfgrf5QmSnWin3R8fKkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="47121587"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="47121587"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 04:43:23 -0800
X-CSE-ConnectionGUID: 4Wnzn2FVQ12HIrccrP/SsQ==
X-CSE-MsgGUID: +NescSN4RpiKD0XJlUphvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="105213039"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Dec 2024 04:43:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRWA3-00044S-0C;
	Sat, 28 Dec 2024 12:43:19 +0000
Date: Sat, 28 Dec 2024 20:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 13/13]
 arch/x86/include/asm/msr.h:554:2: error: call to '__compiletime_assert_114'
 declared with 'error' attribute: BUILD_BUG_ON failed:
 __builtin_constant_p(msr)
Message-ID: <202412282055.8BlSrizi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   831a3852bafc8cabcce4c27132e763d6c88e3e25
commit: d306be716e5af1adafb2353116f5a5aec9f5fa15 [13/13] x86/msr: Use the alternatives mechanism to call Xen MSR APIs
config: i386-buildonly-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241228/202412282055.8BlSrizi-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412282055.8BlSrizi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412282055.8BlSrizi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/acpi/sleep.c:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     568 |         __attribute__((cold, unused));
         |                        ^
   In file included from arch/x86/kernel/acpi/sleep.c:10:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/acpi/sleep.c:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
>> arch/x86/include/asm/msr.h:554:2: error: call to '__compiletime_assert_114' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_constant_p(msr)
     554 |         BUILD_BUG_ON(__builtin_constant_p(msr));
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:542:2: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:90:1: note: expanded from here
      90 | __compiletime_assert_114
         | ^
   In file included from arch/x86/kernel/acpi/sleep.c:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
>> arch/x86/include/asm/msr.h:554:2: error: call to '__compiletime_assert_114' declared with 'error' attribute: BUILD_BUG_ON failed: __builtin_constant_p(msr)
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:542:2: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:90:1: note: expanded from here
      90 | __compiletime_assert_114
         | ^
   4 warnings and 2 errors generated.


vim +554 arch/x86/include/asm/msr.h

   551	
   552	static __always_inline int __native_wrmsr_variable_safe(const u32 msr, const u64 val)
   553	{
 > 554		BUILD_BUG_ON(__builtin_constant_p(msr));
   555	
   556		asm_inline volatile goto(
   557			"1:\n"
   558			ALTERNATIVE("ds wrmsr",
   559				    INSN_WRMSRNS,
   560				    X86_FEATURE_WRMSRNS)
   561			EX_WRMSR_SAFE(1b, %l[badmsr])
   562			: : "a" ((u32)val), "d" ((u32)(val >> 32)), "c" (msr)
   563			: "memory"
   564			: badmsr);
   565		return 0;
   566	
   567	badmsr:
   568		__attribute__((cold, unused));
   569		return -EIO;
   570	}
   571	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
