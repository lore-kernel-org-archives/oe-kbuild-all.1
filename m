Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6504428682
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708121; cv=none; b=sKVefSBjmvEn2uC1/D0zv86Td93QuVlSeNvJpaPGgosUWPQV4AMg21Th4mQCeMjnRmqMi0ftxu4bWMnuwaAQSowE4MXCYElQLBVS0kB5TvAQB6uI5cBC6NFUQU3qb+aaU1ztx+QvOu7JVahT50tOiNwtQuAmtf3LnWq5vPkrr2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708121; c=relaxed/simple;
	bh=A435YOSYUO+hpFXRaDDYTjlu6Fg3WQHlg4Qi6/Ik3t8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W0X11uqryF+wf77aoqr41hPSvF9u0BR98HUPFmw828Uc/qmNPAajM+RYboDDwrw5CqiLS0NIH7eecpkAsrMqYNaeXwQaXUZMmcNLcNkEF9rS5wAsEUDJFZMP/Ftwgv/CHfsXDZwe6NRoXbFlDpHcJLXSjspqscAEYov2eq5n+6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPuap66R; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPuap66R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746708120; x=1778244120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A435YOSYUO+hpFXRaDDYTjlu6Fg3WQHlg4Qi6/Ik3t8=;
  b=JPuap66Ri7zcWbuzh/Q8YP8iy0dM61+G37vsNKWfgoWYrs/f3YcKhwgc
   hoCwRif6cW9OWCTqi2ntmJoGRtNbAEQVSzA0Ecoj2yGxypG930OiDL52K
   Q5dm+GE9jzcWlOGTObJe7NKj7d6l9deAbQY69EFxRZ49e4MsZP6mZ8TGf
   YUwR+LOIYN8BGNYO0wPC6bxOEeA4aq8N1q1kpmyJ1OHDkDx/FG0NClGWR
   TAROuBIwHoQTsKfoW5rbw8vI/gMx4NcT6dru/IgV0EBEKLw0NN+alkF7R
   nBZIdjq0e94EBHAbTzGfAT3YWx1tg0t45uORvGOLdPYlZTOSSHNdSWIec
   g==;
X-CSE-ConnectionGUID: bn5pChVTRDu46Wrfmxlv1Q==
X-CSE-MsgGUID: fiqeeFlvT4e58RqS6REowg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59886777"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="59886777"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 05:41:59 -0700
X-CSE-ConnectionGUID: J3zREMkATKyZteM523BQWg==
X-CSE-MsgGUID: 0APaH6QFSnmSs+ArOaDOfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136296260"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 May 2025 05:41:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD0ZX-000Axn-1g;
	Thu, 08 May 2025 12:41:55 +0000
Date: Thu, 8 May 2025 20:41:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:la57-cpucap 2/6] include/linux/compiler_types.h:557:45: error:
 call to '__compiletime_assert_678' declared with attribute error:
 BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
Message-ID: <202505082032.Zzq8Sbla-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git la57-cpucap
head:   b69e81879863086ffd10017a2153273363272478
commit: cb90175592e75552aabc4d2fe3f83bc4be63d819 [2/6] x86/cpu: Use a new feature flag for 5 level paging
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250508/202505082032.Zzq8Sbla-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505082032.Zzq8Sbla-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505082032.Zzq8Sbla-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'reverse_cpuid_check',
       inlined from '__feature_leaf' at arch/x86/kvm/reverse_cpuid.h:133:2,
       inlined from 'kvm_cpu_cap_get' at arch/x86/kvm/cpuid.h:178:26,
       inlined from 'kvm_cpu_cap_has' at arch/x86/kvm/cpuid.h:185:11,
       inlined from 'max_host_virt_addr_bits' at arch/x86/kvm/x86.h:246:9,
       inlined from 'is_noncanonical_address' at arch/x86/kvm/x86.h:272:38,
       inlined from 'is_noncanonical_msr_address' at arch/x86/kvm/x86.h:279:9,
       inlined from '__kvm_set_msr' at arch/x86/kvm/x86.c:1810:7,
       inlined from '_kvm_set_msr' at arch/x86/kvm/x86.c:1864:9,
       inlined from 'kvm_do_msr_access' at arch/x86/kvm/x86.c:512:8,
       inlined from 'kvm_set_msr_ignored_check' at arch/x86/kvm/x86.c:1870:9:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_678' declared with attribute error: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/reverse_cpuid.h:102:9: note: in expansion of macro 'BUILD_BUG_ON'
     102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
         |         ^~~~~~~~~~~~
   In function 'reverse_cpuid_check',
       inlined from '__feature_leaf' at arch/x86/kvm/reverse_cpuid.h:133:2,
       inlined from 'kvm_cpu_cap_get' at arch/x86/kvm/cpuid.h:178:26,
       inlined from 'kvm_cpu_cap_has' at arch/x86/kvm/cpuid.h:185:11,
       inlined from 'max_host_virt_addr_bits' at arch/x86/kvm/x86.h:246:9,
       inlined from 'is_noncanonical_address' at arch/x86/kvm/x86.h:272:38,
       inlined from 'emulator_is_canonical_addr' at arch/x86/kvm/x86.c:8608:10:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_678' declared with attribute error: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/reverse_cpuid.h:102:9: note: in expansion of macro 'BUILD_BUG_ON'
     102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
         |         ^~~~~~~~~~~~
   In function 'reverse_cpuid_check',
       inlined from '__feature_leaf' at arch/x86/kvm/reverse_cpuid.h:133:2,
       inlined from 'kvm_cpu_cap_get' at arch/x86/kvm/cpuid.h:178:26,
       inlined from 'kvm_cpu_cap_has' at arch/x86/kvm/cpuid.h:185:11,
       inlined from 'max_host_virt_addr_bits' at arch/x86/kvm/x86.h:246:9,
       inlined from 'is_noncanonical_address' at arch/x86/kvm/x86.h:272:38,
       inlined from 'is_noncanonical_invlpg_address' at arch/x86/kvm/x86.h:289:9,
       inlined from 'kvm_handle_invpcid' at arch/x86/kvm/x86.c:13764:7:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_678' declared with attribute error: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/reverse_cpuid.h:102:9: note: in expansion of macro 'BUILD_BUG_ON'
     102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
         |         ^~~~~~~~~~~~
--
   In file included from <command-line>:
   In function 'reverse_cpuid_check',
       inlined from '__feature_leaf' at arch/x86/kvm/reverse_cpuid.h:133:2,
       inlined from 'kvm_cpu_cap_get' at arch/x86/kvm/cpuid.h:178:26,
       inlined from 'kvm_cpu_cap_has' at arch/x86/kvm/cpuid.h:185:11,
       inlined from 'max_host_virt_addr_bits' at arch/x86/kvm/x86.h:246:9,
       inlined from 'is_noncanonical_address' at arch/x86/kvm/x86.h:272:38,
       inlined from 'is_noncanonical_invlpg_address' at arch/x86/kvm/x86.h:289:9,
       inlined from 'kvm_mmu_invalidate_addr' at arch/x86/kvm/mmu/mmu.c:6367:7:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_678' declared with attribute error: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/reverse_cpuid.h:102:9: note: in expansion of macro 'BUILD_BUG_ON'
     102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
         |         ^~~~~~~~~~~~
   In function 'reverse_cpuid_check',
       inlined from '__feature_leaf' at arch/x86/kvm/reverse_cpuid.h:133:2,
       inlined from 'kvm_cpu_cap_get' at arch/x86/kvm/cpuid.h:178:26,
       inlined from 'kvm_cpu_cap_has' at arch/x86/kvm/cpuid.h:185:11,
       inlined from 'max_host_virt_addr_bits' at arch/x86/kvm/x86.h:246:9,
       inlined from 'is_noncanonical_address' at arch/x86/kvm/x86.h:272:38,
       inlined from 'is_noncanonical_invlpg_address' at arch/x86/kvm/x86.h:289:9,
       inlined from 'kvm_mmu_invalidate_addr' at arch/x86/kvm/mmu/mmu.c:6367:7,
       inlined from 'kvm_mmu_invlpg' at arch/x86/kvm/mmu/mmu.c:6398:2:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_678' declared with attribute error: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/reverse_cpuid.h:102:9: note: in expansion of macro 'BUILD_BUG_ON'
     102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
         |         ^~~~~~~~~~~~
--
   In file included from <command-line>:
   In function 'reverse_cpuid_check',
       inlined from '__feature_leaf' at arch/x86/kvm/reverse_cpuid.h:133:2,
       inlined from 'kvm_cpu_cap_get' at arch/x86/kvm/cpuid.h:178:26,
       inlined from 'kvm_cpu_cap_has' at arch/x86/kvm/cpuid.h:185:11,
       inlined from 'max_host_virt_addr_bits' at arch/x86/kvm/x86.h:246:9,
       inlined from 'is_noncanonical_address' at arch/x86/kvm/x86.h:272:38,
       inlined from 'is_noncanonical_msr_address' at arch/x86/kvm/x86.h:279:9,
       inlined from 'intel_pmu_set_msr' at arch/x86/kvm/vmx/pmu_intel.c:368:7:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_678' declared with attribute error: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/reverse_cpuid.h:102:9: note: in expansion of macro 'BUILD_BUG_ON'
     102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
         |         ^~~~~~~~~~~~
--
   In file included from <command-line>:
   In function 'reverse_cpuid_check',
       inlined from '__feature_leaf' at reverse_cpuid.h:133:2,
       inlined from 'kvm_cpu_cap_get' at cpuid.h:178:26,
       inlined from 'kvm_cpu_cap_has' at cpuid.h:185:11,
       inlined from 'max_host_virt_addr_bits' at x86.h:246:9,
       inlined from 'is_noncanonical_address' at x86.h:272:38,
       inlined from 'is_noncanonical_msr_address' at x86.h:279:9,
       inlined from '__kvm_set_msr' at x86.c:1810:7,
       inlined from '_kvm_set_msr' at x86.c:1864:9,
       inlined from 'kvm_do_msr_access' at x86.c:512:8,
       inlined from 'kvm_set_msr_ignored_check' at x86.c:1870:9:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_678' declared with attribute error: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   reverse_cpuid.h:102:9: note: in expansion of macro 'BUILD_BUG_ON'
     102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
         |         ^~~~~~~~~~~~
   In function 'reverse_cpuid_check',
       inlined from '__feature_leaf' at reverse_cpuid.h:133:2,
       inlined from 'kvm_cpu_cap_get' at cpuid.h:178:26,
       inlined from 'kvm_cpu_cap_has' at cpuid.h:185:11,
       inlined from 'max_host_virt_addr_bits' at x86.h:246:9,
       inlined from 'is_noncanonical_address' at x86.h:272:38,
       inlined from 'emulator_is_canonical_addr' at x86.c:8608:10:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_678' declared with attribute error: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   reverse_cpuid.h:102:9: note: in expansion of macro 'BUILD_BUG_ON'
     102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
         |         ^~~~~~~~~~~~
   In function 'reverse_cpuid_check',
       inlined from '__feature_leaf' at reverse_cpuid.h:133:2,
       inlined from 'kvm_cpu_cap_get' at cpuid.h:178:26,
       inlined from 'kvm_cpu_cap_has' at cpuid.h:185:11,
       inlined from 'max_host_virt_addr_bits' at x86.h:246:9,
       inlined from 'is_noncanonical_address' at x86.h:272:38,
       inlined from 'is_noncanonical_invlpg_address' at x86.h:289:9,
       inlined from 'kvm_handle_invpcid' at x86.c:13764:7:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_678' declared with attribute error: BUILD_BUG_ON failed: x86_leaf == CPUID_LNX_5
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   reverse_cpuid.h:102:9: note: in expansion of macro 'BUILD_BUG_ON'
     102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_678 +557 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  543  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  544  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  545  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  546  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  547  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  548   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  549   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  550   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  551   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  552   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  553   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  554   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  555   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  556  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @557  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  558  

:::::: The code at line 557 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
