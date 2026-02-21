Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CC841754
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 17:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771694662; cv=none; b=AdaDX3Surmbl0MOdgauHfSBD6T8V/IyjVYpfX0yCBF8J4IY4FPimf06JhlYSsW3r3ARPUBQOEb/jgWTT79DTrL0O0ceeC2jNMVm44ZOmJu9iJxeOWrdCJfYQMd5Q9FBn3ur551EzL5WnsYr3h54rY1B8lErFGicOBIsfPCOyt8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771694662; c=relaxed/simple;
	bh=hNHCofPosny8T8AE1RtE7VUVXrU4jCY2nEixIQ9MI2c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bMFuPD2XH5AUmlvyOoUxbBFhJjgbm8rf8l/6cgC43yqyBfESWk9AAcB3IYTUmDfDdM+oyMsl5o9vQ1PbGwHVcNAqvVB7guKrH4v0QG+Xd3DAd5tZuU65Pu5WxESvBArQnNHzdvd0rYh/oUqq4/d65Nqr3QTBX2UoPdcSBIAIs0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvUQEFl4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvUQEFl4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771694659; x=1803230659;
  h=date:from:to:cc:subject:message-id;
  bh=hNHCofPosny8T8AE1RtE7VUVXrU4jCY2nEixIQ9MI2c=;
  b=MvUQEFl4koQQ1xaQ+sBRuTH7rFA9ZUAtWs8B+WHjU6VNLGf7LcsBHMR8
   UZkYcISc+KFgyknXOafJV8Fr5tj8dAUEZqi7//g5P9BbIhy4wVM31rsFy
   zFD67kfo/8nSA3aHftGzV0odawuKtTpltIPP78pH6X7unISSs6Bk03/mu
   x2BKgsSUIp4/Ubp5yA47JCNPhsLkunzM61DM3HEF6cOvkELoFN5+R/5lD
   n4oyFtXvP+uTfG32I4Sh9brO+2K7DUEKRItoc6Lp6grf0ZSHS0+8WZBpB
   8pNiaefQV2F56mF6CjAo9JfX+m6hk2qU+2Ly2z60QGznn+1v830ORJQVe
   Q==;
X-CSE-ConnectionGUID: 2LLBfsHURAGRCdplQEOIXA==
X-CSE-MsgGUID: 33oYVu1RRBG+DQvwiK4WdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="75364125"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="75364125"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 09:24:19 -0800
X-CSE-ConnectionGUID: Ei4LItnqQiO+FxsB/rwvxQ==
X-CSE-MsgGUID: Uo6wAhYhRO250jGim+NJyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="213185693"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2026 09:24:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtqiF-0000000156E-11hz;
	Sat, 21 Feb 2026 17:24:15 +0000
Date: Sun, 22 Feb 2026 01:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bjackman:lkp/page_alloc-unmapped 3/20]
 arch/x86/include/asm/mmu_context.h:234:39: error: 'MM_LOCAL_BASE_ADDR'
 undeclared
Message-ID: <202602220124.OCqiv5FA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bjackman/linux lkp/page_alloc-unmapped
head:   bde871371ec16d6d1168f9ed687e60ba2e49acd0
commit: d81d7b7fa3c340e936cc7bc29e46fa8d01ac7c82 [3/20] x86/mm: Generalize LDT remap into "mm-local region"
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260222/202602220124.OCqiv5FA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602220124.OCqiv5FA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602220124.OCqiv5FA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmu_context.h:5,
                    from include/linux/cpuset.h:18,
                    from kernel/sched/sched.h:33,
                    from kernel/sched/rq-offsets.c:5:
   arch/x86/include/asm/mmu_context.h: In function 'mm_local_region_free':
>> arch/x86/include/asm/mmu_context.h:234:39: error: 'MM_LOCAL_BASE_ADDR' undeclared (first use in this function)
     234 |                 unsigned long start = MM_LOCAL_BASE_ADDR;
         |                                       ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mmu_context.h:234:39: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/include/asm/mmu_context.h:235:37: error: 'MM_LOCAL_END_ADDR' undeclared (first use in this function)
     235 |                 unsigned long end = MM_LOCAL_END_ADDR;
         |                                     ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mmu_context.h: In function 'mm_local_region_init':
>> arch/x86/include/asm/mmu_context.h:256:15: error: implicit declaration of function 'preallocate_sub_pgd' [-Wimplicit-function-declaration]
     256 |         err = preallocate_sub_pgd(mm, MM_LOCAL_BASE_ADDR);
         |               ^~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mmu_context.h:256:39: error: 'MM_LOCAL_BASE_ADDR' undeclared (first use in this function)
     256 |         err = preallocate_sub_pgd(mm, MM_LOCAL_BASE_ADDR);
         |                                       ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mmu_context.h: In function 'is_mm_local_addr':
   arch/x86/include/asm/mmu_context.h:283:24: error: 'MM_LOCAL_BASE_ADDR' undeclared (first use in this function)
     283 |         return addr >= MM_LOCAL_BASE_ADDR && addr < MM_LOCAL_END_ADDR;
         |                        ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mmu_context.h:283:53: error: 'MM_LOCAL_END_ADDR' undeclared (first use in this function)
     283 |         return addr >= MM_LOCAL_BASE_ADDR && addr < MM_LOCAL_END_ADDR;
         |                                                     ^~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MM_LOCAL_REGION
   Depends on [n]: ARCH_SUPPORTS_MM_LOCAL_REGION [=n]
   Selected by [y]:
   - MODIFY_LDT_SYSCALL [=y] && MITIGATION_PAGE_TABLE_ISOLATION [=y]


vim +/MM_LOCAL_BASE_ADDR +234 arch/x86/include/asm/mmu_context.h

   228	
   229	#ifdef CONFIG_MM_LOCAL_REGION
   230	static inline void mm_local_region_free(struct mm_struct *mm)
   231	{
   232		if (mm_local_region_used(mm)) {
   233			struct mmu_gather tlb;
 > 234			unsigned long start = MM_LOCAL_BASE_ADDR;
 > 235			unsigned long end = MM_LOCAL_END_ADDR;
   236	
   237			/*
   238			 * Although free_pgd_range() is intended for freeing user
   239			 * page-tables, it also works out for kernel mappings on x86.
   240			 * We use tlb_gather_mmu_fullmm() to avoid confusing the
   241			 * range-tracking logic in __tlb_adjust_range().
   242			 */
   243			tlb_gather_mmu_fullmm(&tlb, mm);
   244			free_pgd_range(&tlb, start, end, start, end);
   245			tlb_finish_mmu(&tlb);
   246	
   247			mm_flags_clear(MMF_LOCAL_REGION_USED, mm);
   248		}
   249	}
   250	
   251	/* Do initial setup of the user-local region. Call from process context. */
   252	static inline int mm_local_region_init(struct mm_struct *mm)
   253	{
   254		int err;
   255	
 > 256		err = preallocate_sub_pgd(mm, MM_LOCAL_BASE_ADDR);
   257		if (err)
   258			return err;
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
