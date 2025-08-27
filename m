Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A1C2D0C80
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 17:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756315442; cv=none; b=smm4bEkymmTpbEQ1ZPl/A8FhxHyRuYfj9Fme/IIbqrNFIvnHr4vzSWdRaPZkq5nMGFgyP9j88yRELS7B86fYMh/KikIGMNfWkxWfu1CDtvt23BBFFMq5rQl08qdMqaDIVHbCX5WW9lpBO4UPVu8+Q+Vh2I2r8nDrIZXSgD/+5gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756315442; c=relaxed/simple;
	bh=LSPnap7njc8rXvn8fZtJCojtF8977G8MBtddqvJ+huU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hEOHRhDAD6gq6LQOJ/01x+WBSgC9TNUFtfKbZySwyzG1IE9dgGCDPUYuZSEKT0cEI5g3nBWfchB2jKPf7biloQVKaOzejWseruugotsoiFCHGS2VxVAM6bTD+7I8ivspwA5YPq/fv9pEpEP0CqNv6zpmQtGb2F6z/LJf5/ZI8mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwXqfoiA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwXqfoiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756315440; x=1787851440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LSPnap7njc8rXvn8fZtJCojtF8977G8MBtddqvJ+huU=;
  b=nwXqfoiAW8OLrsdEAOj+B5C10qQPzGIwJuzjtpwQR//Ibkqq3SYVM8Ai
   340+Jglz2EuXOzs8vtHbDeQljSX0pxkNbRtFUihlREie6DcFGYginXFzU
   Q73jO9MtL2IlMyJQnvNSFc1P4966dTudmW4+QdkMpvwQccXI0MkXGr3zl
   BxfjEc6Ac2SBc4qOnNKBFRA7kg2grOvYhG5ZtZVPm5JeXAV15xMXqEJBR
   jh1iqt2DEoRZyqWFPMA29Iu7/OBa14Xf+GQcThpKS4s4D5mLPke1JQR1G
   qX4mp9idPH8eCHGdKZ+0F8Lhp/WNSHBtt9j3bv6ijK1imPy9H/7WNMGJo
   w==;
X-CSE-ConnectionGUID: gitfttvBR5qsSnRWymIQXA==
X-CSE-MsgGUID: Di0MALpDT+GSY2FO+PEePw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58638949"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58638949"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:24:00 -0700
X-CSE-ConnectionGUID: KWEceChATCOTfQUct3v/iQ==
X-CSE-MsgGUID: lZVjSLvZTQuVwvpMqXkKfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="207058008"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Aug 2025 10:23:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urJs7-000T6l-0s;
	Wed, 27 Aug 2025 17:23:45 +0000
Date: Thu, 28 Aug 2025 01:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] mm/debug_vm_pgtable.c:450:15:
 sparse: sparse: cast to non-scalar
Message-ID: <202508280157.7BOvp8c8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   76e9166ae5af50e3172915f767d5d371af848eac
commit: 349fde599db65d4827820ef6553e3f9ee75b8c7c [1/1] arch: enable HAS_LTO_CLANG with KASAN and KCOV
config: arm64-randconfig-r112-20250827 (https://download.01.org/0day-ci/archive/20250828/202508280157.7BOvp8c8-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250828/202508280157.7BOvp8c8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280157.7BOvp8c8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/debug_vm_pgtable.c:450:15: sparse: sparse: cast to non-scalar
>> mm/debug_vm_pgtable.c:450:15: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c:470:15: sparse: sparse: cast to non-scalar
   mm/debug_vm_pgtable.c:470:15: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c:499:21: sparse: sparse: cast to non-scalar
   mm/debug_vm_pgtable.c:499:21: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c:508:15: sparse: sparse: cast to non-scalar
   mm/debug_vm_pgtable.c:508:15: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c:525:15: sparse: sparse: cast to non-scalar
   mm/debug_vm_pgtable.c:525:15: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c:641:21: sparse: sparse: cast to non-scalar
   mm/debug_vm_pgtable.c:641:21: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c:647:15: sparse: sparse: cast to non-scalar
   mm/debug_vm_pgtable.c:647:15: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c:661:15: sparse: sparse: cast to non-scalar
   mm/debug_vm_pgtable.c:661:15: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c:1266:28: sparse: sparse: cast to non-scalar
   mm/debug_vm_pgtable.c:1266:28: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c: note: in included file (through include/linux/pgtable.h, include/linux/kasan.h, include/linux/slab.h, include/linux/fs.h, ...):
   arch/arm64/include/asm/pgtable.h:341:33: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:341:33: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:304:19: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:304:19: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:968:15: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:968:15: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c: note: in included file (through include/linux/kasan.h, include/linux/slab.h, include/linux/fs.h, include/linux/highmem.h):
   include/linux/pgtable.h:218:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:218:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:218:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:218:16: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c: note: in included file (through include/linux/pgtable.h, include/linux/kasan.h, include/linux/slab.h, include/linux/fs.h, ...):
   arch/arm64/include/asm/pgtable.h:341:33: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:341:33: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:304:19: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:304:19: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c: note: in included file (through include/linux/kasan.h, include/linux/slab.h, include/linux/fs.h, include/linux/highmem.h):
   include/linux/pgtable.h:218:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:218:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:218:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:218:16: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c: note: in included file (through include/linux/pgtable.h, include/linux/kasan.h, include/linux/slab.h, include/linux/fs.h, ...):
   arch/arm64/include/asm/pgtable.h:341:33: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:341:33: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:304:19: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:304:19: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:886:15: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:886:15: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c: note: in included file (through include/linux/kasan.h, include/linux/slab.h, include/linux/fs.h, include/linux/highmem.h):
   include/linux/pgtable.h:218:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:218:16: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c: note: in included file (through include/linux/pgtable.h, include/linux/kasan.h, include/linux/slab.h, include/linux/fs.h, ...):
   arch/arm64/include/asm/pgtable.h:341:33: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:341:33: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:304:19: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:304:19: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c: note: in included file (through include/linux/kasan.h, include/linux/slab.h, include/linux/fs.h, include/linux/highmem.h):
   include/linux/pgtable.h:218:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:218:16: sparse: sparse: cast from non-scalar
   mm/debug_vm_pgtable.c:1389:23: sparse: sparse: context imbalance in 'debug_vm_pgtable' - different lock contexts for basic block

vim +450 mm/debug_vm_pgtable.c

5fe77be6bf14bf Shixin Liu           2021-06-30  432  
5fe77be6bf14bf Shixin Liu           2021-06-30  433  #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
c0fe07b0aa72b5 Gavin Shan           2021-09-02  434  static void __init pmd_huge_tests(struct pgtable_debug_args *args)
a5c3b9ffb0f404 Anshuman Khandual    2020-08-06  435  {
5fe77be6bf14bf Shixin Liu           2021-06-30  436  	pmd_t pmd;
5fe77be6bf14bf Shixin Liu           2021-06-30  437  
c4876ff68716e5 Frank van der Linden 2023-01-09  438  	if (!arch_vmap_pmd_supported(args->page_prot) ||
c4876ff68716e5 Frank van der Linden 2023-01-09  439  	    args->fixed_alignment < PMD_SIZE)
5fe77be6bf14bf Shixin Liu           2021-06-30  440  		return;
5fe77be6bf14bf Shixin Liu           2021-06-30  441  
5fe77be6bf14bf Shixin Liu           2021-06-30  442  	pr_debug("Validating PMD huge\n");
5fe77be6bf14bf Shixin Liu           2021-06-30  443  	/*
5fe77be6bf14bf Shixin Liu           2021-06-30  444  	 * X86 defined pmd_set_huge() verifies that the given
5fe77be6bf14bf Shixin Liu           2021-06-30  445  	 * PMD is not a populated non-leaf entry.
5fe77be6bf14bf Shixin Liu           2021-06-30  446  	 */
c0fe07b0aa72b5 Gavin Shan           2021-09-02  447  	WRITE_ONCE(*args->pmdp, __pmd(0));
c0fe07b0aa72b5 Gavin Shan           2021-09-02  448  	WARN_ON(!pmd_set_huge(args->pmdp, __pfn_to_phys(args->fixed_pmd_pfn), args->page_prot));
c0fe07b0aa72b5 Gavin Shan           2021-09-02  449  	WARN_ON(!pmd_clear_huge(args->pmdp));
c0fe07b0aa72b5 Gavin Shan           2021-09-02 @450  	pmd = READ_ONCE(*args->pmdp);
5fe77be6bf14bf Shixin Liu           2021-06-30  451  	WARN_ON(!pmd_none(pmd));
a5c3b9ffb0f404 Anshuman Khandual    2020-08-06  452  }
5fe77be6bf14bf Shixin Liu           2021-06-30  453  

:::::: The code at line 450 was first introduced by commit
:::::: c0fe07b0aa72b530d5da63a24eb10d503cae5a95 mm/debug_vm_pgtable: use struct pgtable_debug_args in PMD modifying tests

:::::: TO: Gavin Shan <gshan@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
