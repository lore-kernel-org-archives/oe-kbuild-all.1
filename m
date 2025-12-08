Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AFC2BE657
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 08:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765183807; cv=none; b=g+g9SkuJc7wFz1hvT5vzo8O7BiCPqZ2QCGJjBFE96Hq4S0B96NjWpPq//9opLn+zISKBn/+xB+3A6ci3QSeIvxwN9Md9L5mhCbi/MMjwn3OKK2fG4sGgX44VaHnG++NVkynr3EeS4LQAYpU7xjiaiuHVx9WoVNoJl3eDcg8hdLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765183807; c=relaxed/simple;
	bh=+93XGelh+Hv6ROQ2UnVcaqODBpQb41rrSVyU3W8u+FY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uQooOxPMJIj82/Urn3bF4v7brxLeNC9HDm31y6g7COqxwBGNf7TapKK2zN4dWukjiY5WcEByZ7BayikO6rHgUejvKzfFPKZk78WFEG4VjjqoHskkPZE4ZWiEbeEQ/pOwlIm07o5+aBS22c2c9/mKuCDIqmU9XKuzXGN+38GSrb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIWDI/XA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIWDI/XA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765183803; x=1796719803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+93XGelh+Hv6ROQ2UnVcaqODBpQb41rrSVyU3W8u+FY=;
  b=dIWDI/XAaEJje2ZIWUXagH80SV1zXc6NQdadXYAUexPssmRBLYBtlmeq
   INxjiHIOfCVPndlZH5q/2P6G1Qb+g7fYCqlvyAtmAP3pVkA+SnXKnEJ6m
   K98yARtdlNmW5NbiG8g622OFHnmHO6mByO9q6CHhNkMl/+JYn5KKk78/N
   75+OsPerAg3GGKgx+ZNZlvmNo4j9GXtu9efpfTnR3tNkv6Azp0xhpnyDI
   t6N5amFCGWlxDyCRov7WkCiN0+r0Y62DxUzqZJzJOQIq8FuB0DRn94FEc
   EqU5eJgJnWYrHOGFV+XQJBwyR/ncJI9RIx9ujwm6W787/BIuCx/Wriw39
   w==;
X-CSE-ConnectionGUID: ZbTXQINHTmes/MkVeX+hSg==
X-CSE-MsgGUID: 8FLA6AezRI+ujr1Nl3sZfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67285514"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="67285514"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 00:50:03 -0800
X-CSE-ConnectionGUID: 517D4rNyTdqu7pwB2/jU/w==
X-CSE-MsgGUID: XRokE3A2QJ26lXajr0xO7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="196344315"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Dec 2025 00:50:00 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSWwQ-0000000001e-21vp;
	Mon, 08 Dec 2025 08:49:58 +0000
Date: Mon, 8 Dec 2025 16:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3485/3485] mm/internal.h:1522:55: warning:
 diagnostic behavior may be improved by adding the 'format(printf, 2, 0)'
 attribute to the declaration of 'shrinker_debugfs_name_alloc'
Message-ID: <202512081644.0Feaab8s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b3214ddbe58a44bd3829617668a8d301c8f1994e
commit: 5d638f251ef64f68766caaeaf41fbe159807b392 [3485/3485] mm: shrinker: add infrastructure for dynamically allocating shrinker
config: arm64-randconfig-004-20251208 (https://download.01.org/0day-ci/archive/20251208/202512081644.0Feaab8s-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 000e46219ba1ee53fc42d35e00c314c2807e8b14)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081644.0Feaab8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512081644.0Feaab8s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/secretmem.c:26:
>> mm/internal.h:1522:55: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'shrinker_debugfs_name_alloc' [-Wmissing-format-attribute]
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         | __attribute__((format(printf, 2, 0))) 
    1520 |                                               const char *fmt, va_list ap)
    1521 | {
    1522 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |                                                              ^
   mm/internal.h:1519:19: note: 'shrinker_debugfs_name_alloc' declared here
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         |                   ^
   1 warning generated.
--
   In file included from mm/page_alloc.c:59:
>> mm/internal.h:1522:55: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'shrinker_debugfs_name_alloc' [-Wmissing-format-attribute]
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         | __attribute__((format(printf, 2, 0))) 
    1520 |                                               const char *fmt, va_list ap)
    1521 | {
    1522 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |                                                              ^
   mm/internal.h:1519:19: note: 'shrinker_debugfs_name_alloc' declared here
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         |                   ^
   mm/page_alloc.c:7210:20: warning: unused function 'has_unaccepted_memory' [-Wunused-function]
    7210 | static inline bool has_unaccepted_memory(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from mm/shrinker.c:7:
>> mm/internal.h:1522:55: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'shrinker_debugfs_name_alloc' [-Wmissing-format-attribute]
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         | __attribute__((format(printf, 2, 0))) 
    1520 |                                               const char *fmt, va_list ap)
    1521 | {
    1522 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |                                                              ^
   mm/internal.h:1519:19: note: 'shrinker_debugfs_name_alloc' declared here
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         |                   ^
>> mm/shrinker.c:565:53: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of 'shrinker_alloc' [-Wmissing-format-attribute]
     565 |         err = shrinker_debugfs_name_alloc(shrinker, fmt, ap);
         |                                                            ^
   include/linux/shrinker.h:111:18: note: 'shrinker_alloc' declared here
     111 | struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
         |                  ^
   2 warnings generated.
--
   In file included from mm/list_lru.c:16:
>> mm/internal.h:1522:55: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'shrinker_debugfs_name_alloc' [-Wmissing-format-attribute]
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         | __attribute__((format(printf, 2, 0))) 
    1520 |                                               const char *fmt, va_list ap)
    1521 | {
    1522 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |                                                              ^
   mm/internal.h:1519:19: note: 'shrinker_debugfs_name_alloc' declared here
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         |                   ^
   mm/list_lru.c:98:20: warning: unused function 'list_lru_memcg_aware' [-Wunused-function]
      98 | static inline bool list_lru_memcg_aware(struct list_lru *lru)
         |                    ^~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from mm/madvise.c:37:
>> mm/internal.h:1522:55: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'shrinker_debugfs_name_alloc' [-Wmissing-format-attribute]
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         | __attribute__((format(printf, 2, 0))) 
    1520 |                                               const char *fmt, va_list ap)
    1521 | {
    1522 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |                                                              ^
   mm/internal.h:1519:19: note: 'shrinker_debugfs_name_alloc' declared here
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         |                   ^
   mm/madvise.c:285:6: warning: no previous prototype for function 'force_swapin_vma' [-Wmissing-prototypes]
     285 | void force_swapin_vma(struct vm_area_struct *vma)
         |      ^
   mm/madvise.c:285:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     285 | void force_swapin_vma(struct vm_area_struct *vma)
         | ^
         | static 
   2 warnings generated.
--
   In file included from mm/memblock.c:23:
>> mm/internal.h:1522:55: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'shrinker_debugfs_name_alloc' [-Wmissing-format-attribute]
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         | __attribute__((format(printf, 2, 0))) 
    1520 |                                               const char *fmt, va_list ap)
    1521 | {
    1522 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |                                                              ^
   mm/internal.h:1519:19: note: 'shrinker_debugfs_name_alloc' declared here
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         |                   ^
   mm/memblock.c:1444:20: warning: no previous prototype for function 'memblock_alloc_range_nid_flags' [-Wmissing-prototypes]
    1444 | phys_addr_t __init memblock_alloc_range_nid_flags(phys_addr_t size,
         |                    ^
   mm/memblock.c:1444:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1444 | phys_addr_t __init memblock_alloc_range_nid_flags(phys_addr_t size,
         | ^
         | static 
   2 warnings generated.
--
   In file included from mm/mempolicy.c:111:
>> mm/internal.h:1522:55: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'shrinker_debugfs_name_alloc' [-Wmissing-format-attribute]
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         | __attribute__((format(printf, 2, 0))) 
    1520 |                                               const char *fmt, va_list ap)
    1521 | {
    1522 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |                                                              ^
   mm/internal.h:1519:19: note: 'shrinker_debugfs_name_alloc' declared here
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         |                   ^
   mm/mempolicy.c:1123:25: warning: variable 'vma' set but not used [-Wunused-but-set-variable]
    1123 |         struct vm_area_struct *vma;
         |                                ^
   mm/mempolicy.c:2959:25: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
    2959 |                 struct vm_area_struct pvma;
         |                                       ^
   include/linux/mm_types.h:659:20: note: member 'vm_flags' declared 'const' here
     659 |                 const vm_flags_t vm_flags;
         |                                  ^
   3 warnings generated.
--
   In file included from mm/memory.c:93:
>> mm/internal.h:1522:55: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'shrinker_debugfs_name_alloc' [-Wmissing-format-attribute]
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         | __attribute__((format(printf, 2, 0))) 
    1520 |                                               const char *fmt, va_list ap)
    1521 | {
    1522 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |                                                              ^
   mm/internal.h:1519:19: note: 'shrinker_debugfs_name_alloc' declared here
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         |                   ^
   mm/memory.c:5512:17: warning: variable 'nr_pages' set but not used [-Wunused-but-set-variable]
    5512 |         int flags = 0, nr_pages;
         |                        ^
   2 warnings generated.
--
   In file included from mm/shmem.c:43:
   mm/swap.h:66:19: error: call to undeclared function 'swp_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      66 |         pgoff_t offset = swp_offset(entry);
         |                          ^
   In file included from mm/shmem.c:58:
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
     158 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   In file included from mm/shmem.c:68:
   include/linux/swapops.h:107:23: error: static declaration of 'swp_offset' follows non-static declaration
     107 | static inline pgoff_t swp_offset(swp_entry_t entry)
         |                       ^
   mm/swap.h:66:19: note: previous implicit declaration is here
      66 |         pgoff_t offset = swp_offset(entry);
         |                          ^
   In file included from mm/shmem.c:86:
>> mm/internal.h:1522:55: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'shrinker_debugfs_name_alloc' [-Wmissing-format-attribute]
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         | __attribute__((format(printf, 2, 0))) 
    1520 |                                               const char *fmt, va_list ap)
    1521 | {
    1522 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |                                                              ^
   mm/internal.h:1519:19: note: 'shrinker_debugfs_name_alloc' declared here
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         |                   ^
   mm/shmem.c:1747:24: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
    1747 |         struct vm_area_struct pvma;
         |                               ^
   include/linux/mm_types.h:659:20: note: member 'vm_flags' declared 'const' here
     659 |                 const vm_flags_t vm_flags;
         |                                  ^
   mm/shmem.c:1877:24: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
    1877 |         struct vm_area_struct pvma;
         |                               ^
   include/linux/mm_types.h:659:20: note: member 'vm_flags' declared 'const' here
     659 |                 const vm_flags_t vm_flags;
         |                                  ^
   5 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA
   Depends on [n]: CGROUPS [=n]
   Selected by [y]:
   - ARM64 [=y]


vim +1522 mm/internal.h

  1513	
  1514	/* shrinker related functions */
  1515	unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
  1516				  int priority);
  1517	
  1518	#ifdef CONFIG_SHRINKER_DEBUG
  1519	static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
  1520						      const char *fmt, va_list ap)
  1521	{
> 1522		shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
  1523	
  1524		return shrinker->name ? 0 : -ENOMEM;
  1525	}
  1526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
