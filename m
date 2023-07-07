Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEECA4E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 20:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688763195; x=1720299195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KFBjoMvZs40IlA7gkN5nfOk1ml4U0DbeQdDEeJX4HU0=;
  b=FntXg3XtKiW9VTbQIQZNVsC4nE1DaY9hovHW9NDR2dIJjClFgvGrFejP
   id2OfEShfdD0U1YpTGbUftxKtImp0+Z6gJUi1i0oQ/hoCJ7LSQT1ktmtt
   PENqZi08DuYKXVFnucxyosKvow5XKTvHva4drxtO7t0e1uq4CKrYCA540
   EA3fcgXJOIvX/f+patLisJFWCPAk2Cfybr1N3ASwaySI7vQicyM1W5aV0
   ihivSediEZU4RFLZsDCWU7gzEe5M5npNDFHKlH1xsNPKTHkgkUtroeHGD
   8QkZu5NQxAUUxG2ZrrBRveyKJG2TYejNKDvuxERCtZVVGkqtBQoMOJ9VE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="394750048"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="394750048"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 13:53:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="790103836"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="790103836"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Jul 2023 13:53:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHsRx-0002I1-2K;
	Fri, 07 Jul 2023 20:53:09 +0000
Date: Sat, 8 Jul 2023 04:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 21/37]
 arch/riscv/include/asm/pgtable.h:531:17: error: implicit declaration of
 function 'set_pte_at'; did you mean 'set_ptes'?
Message-ID: <202307080431.sVfXNxWS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   a357c8502e070a8a7aa2fa94492fd040ae053b78
commit: 5f76d31b1de3753e2899c3a0698fef037340d8ee [21/37] riscv: Implement the new page table range API
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230708/202307080431.sVfXNxWS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080431.sVfXNxWS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080431.sVfXNxWS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from arch/riscv/kernel/asm-offsets.c:10:
   arch/riscv/include/asm/pgtable.h: In function 'ptep_set_access_flags':
>> arch/riscv/include/asm/pgtable.h:531:17: error: implicit declaration of function 'set_pte_at'; did you mean 'set_ptes'? [-Werror=implicit-function-declaration]
     531 |                 set_pte_at(vma->vm_mm, address, ptep, entry);
         |                 ^~~~~~~~~~
         |                 set_ptes
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +531 arch/riscv/include/asm/pgtable.h

08f051eda33b51 Andrew Waterman 2017-10-25  524  
07037db5d479f9 Palmer Dabbelt  2017-07-10  525  #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
07037db5d479f9 Palmer Dabbelt  2017-07-10  526  static inline int ptep_set_access_flags(struct vm_area_struct *vma,
07037db5d479f9 Palmer Dabbelt  2017-07-10  527  					unsigned long address, pte_t *ptep,
07037db5d479f9 Palmer Dabbelt  2017-07-10  528  					pte_t entry, int dirty)
07037db5d479f9 Palmer Dabbelt  2017-07-10  529  {
07037db5d479f9 Palmer Dabbelt  2017-07-10  530  	if (!pte_same(*ptep, entry))
07037db5d479f9 Palmer Dabbelt  2017-07-10 @531  		set_pte_at(vma->vm_mm, address, ptep, entry);
07037db5d479f9 Palmer Dabbelt  2017-07-10  532  	/*
07037db5d479f9 Palmer Dabbelt  2017-07-10  533  	 * update_mmu_cache will unconditionally execute, handling both
07037db5d479f9 Palmer Dabbelt  2017-07-10  534  	 * the case that the PTE changed and the spurious fault case.
07037db5d479f9 Palmer Dabbelt  2017-07-10  535  	 */
07037db5d479f9 Palmer Dabbelt  2017-07-10  536  	return true;
07037db5d479f9 Palmer Dabbelt  2017-07-10  537  }
07037db5d479f9 Palmer Dabbelt  2017-07-10  538  

:::::: The code at line 531 was first introduced by commit
:::::: 07037db5d479f90377c998259a4f9a469c404edf RISC-V: Paging and MMU

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
