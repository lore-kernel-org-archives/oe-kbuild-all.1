Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127A3125DC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 10:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689761523; x=1721297523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pOCYVhTVu60u1RINRB96i61o6R/QSo97Q9E0EnJYbgc=;
  b=IDVSlFJS0KqjYheWldpaZaGlEeSct1WVOqnTkupSJBLrHNHtSxMRs9I/
   /xTH3UuNNM0IyzWYXGa8OiI9DEHxTUNevCE80p9eJWyLPce/uiRN3kpoP
   10ZNFn0WqxNvOWYb7xCxlVYgDBRJkgnC7i7Kd1AGoXKb5Tl7DdPTh61cZ
   ezn3WnHLFxTT9jQh/mkz6cJRkxJOWIo24bfJrLCfxEZZUcFGxyZpCP9f4
   pafHPPbZ1qlCNvehUVGVrxRBDpN2/RYgtWkLrlCWairjKj1FSrq2VZFoR
   JPy4yLBGkbInEHAqedIiAybkpPc6uWfCg3GWJz+DlmCBDx5lyCpFREiBT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="366465426"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="366465426"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 03:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="789365345"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="789365345"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2023 03:11:45 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM49o-0004fN-2s;
	Wed, 19 Jul 2023 10:11:44 +0000
Date: Wed, 19 Jul 2023 18:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 3179/3438]
 arch/arm64/include/asm/tlbflush.h:268:53: error: 'vma' undeclared
Message-ID: <202307191848.Bd4gXW0j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   352ce39a8bbaec0405793682be59fae120fc6b05
commit: 8c2be11e06f44391db3fc426528d8f17aa570992 [3179/3438] mmu_notifiers: call arch_invalidate_secondary_tlbs() when invalidating TLBs
config: arm64-randconfig-r002-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191848.Bd4gXW0j-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191848.Bd4gXW0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191848.Bd4gXW0j-lkp@intel.com/

Note: the linux-next/master HEAD 352ce39a8bbaec0405793682be59fae120fc6b05 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/pgtable.h:15,
                    from include/linux/pgtable.h:6,
                    from arch/arm64/include/asm/io.h:12,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm64/include/asm/hardirq.h:17,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from arch/arm64/kernel/asm-offsets.c:12:
   arch/arm64/include/asm/tlbflush.h: In function '__flush_tlb_page_nosync':
>> arch/arm64/include/asm/tlbflush.h:268:53: error: 'vma' undeclared (first use in this function)
     268 |         mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, uaddr & PAGE_MASK,
         |                                                     ^~~
   arch/arm64/include/asm/tlbflush.h:268:53: note: each undeclared identifier is reported only once for each function it appears in
   make[3]: *** [scripts/Makefile.build:116: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=251802209
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=251802209
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=251802209
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=251802209
   make: Target 'prepare' not remade because of errors.


vim +/vma +268 arch/arm64/include/asm/tlbflush.h

   258	
   259	static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
   260						   unsigned long uaddr)
   261	{
   262		unsigned long addr;
   263	
   264		dsb(ishst);
   265		addr = __TLBI_VADDR(uaddr, ASID(mm));
   266		__tlbi(vale1is, addr);
   267		__tlbi_user(vale1is, addr);
 > 268		mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, uaddr & PAGE_MASK,
   269							(uaddr & PAGE_MASK) + PAGE_SIZE);
   270	}
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
