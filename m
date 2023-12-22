Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E44223760
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Dec 2023 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWddZfDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703261459; x=1734797459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NR21h5sqh68j/E9i1lULwz4+MDN4puon7mAaq7T9M4M=;
  b=HWddZfDs0WISLIGlMXDPsyK5J5BYBacZ7PV6wvcG6ebVIArphl+aMYho
   3BONy7kmFaneArynrq5T84hyg1sVhE213F1czq+XKrCZfeYNqTID+4AHR
   NfORvhAWztPXDovPy0UUSNOMfE6SORrkJqO2JaLsTGJYfIOuj3wOjcWve
   6aI94r9FOezXtJ+kn3Mv5Y0aqPp6/6JfUru4doptemLXjdwSC36BWIdxY
   6Lq7vpSmRVUFMH4OsGuZah3QLD2YTlfDI1TuQxMMVx4bCtWGFB6par4Ds
   h6hwqUAFcO88I6EusedQp7C5uv/AAUQ2kD66dOWKCJ9eLFyOU3BnT6Yq+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="376273064"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="376273064"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 08:10:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="780580161"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="780580161"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 22 Dec 2023 08:10:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGi6x-0009cz-1j;
	Fri, 22 Dec 2023 16:10:55 +0000
Date: Sat, 23 Dec 2023 00:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:zap-batching 43/50]
 include/linux/pgtable.h:631:20: warning: conflicting types for
 'ptep_set_wrprotect'; have 'void(struct mm_struct *, long unsigned int,
  pte_t *)' {aka 'void(struct mm_struct *, long unsigned int,  unsigned int
 *)'}
Message-ID: <202312230038.le8PXhDc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux zap-batching
head:   a87ca0519e9108ec48b13a88d4a30a7756923d83
commit: 7ddc8bfc39055b1ed487d6639b4125e1c77a9e4b [43/50] mm/memory: optimize fork() with PTE-mapped THP
config: arm-randconfig-001-20231222 (https://download.01.org/0day-ci/archive/20231223/202312230038.le8PXhDc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230038.le8PXhDc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312230038.le8PXhDc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm/include/asm/page.h:171,
                    from arch/arm/include/asm/thread_info.h:14,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/arm/kernel/asm-offsets.c:11:
   include/linux/pgtable.h: In function 'pte_next_pfn':
   include/linux/pgtable.h:211:45: error: 'PFN_PTE_SHIFT' undeclared (first use in this function); did you mean 'PAGE_SHIFT'?
     211 |         return __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
         |                                             ^~~~~~~~~~~~~
   arch/arm/include/asm/pgtable-2level-types.h:49:26: note: in definition of macro '__pte'
      49 | #define __pte(x)        (x)
         |                          ^
   include/linux/pgtable.h:211:45: note: each undeclared identifier is reported only once for each function it appears in
     211 |         return __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
         |                                             ^~~~~~~~~~~~~
   arch/arm/include/asm/pgtable-2level-types.h:49:26: note: in definition of macro '__pte'
      49 | #define __pte(x)        (x)
         |                          ^
   In file included from include/linux/mm.h:29,
                    from arch/arm/kernel/asm-offsets.c:12:
   include/linux/pgtable.h: In function 'wrprotect_ptes':
   include/linux/pgtable.h:220:17: error: implicit declaration of function 'ptep_set_wrprotect'; did you mean 'pte_wrprotect'? [-Werror=implicit-function-declaration]
     220 |                 ptep_set_wrprotect(mm, addr, ptep);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 pte_wrprotect
   include/linux/pgtable.h: At top level:
>> include/linux/pgtable.h:631:20: warning: conflicting types for 'ptep_set_wrprotect'; have 'void(struct mm_struct *, long unsigned int,  pte_t *)' {aka 'void(struct mm_struct *, long unsigned int,  unsigned int *)'}
     631 | static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long address, pte_t *ptep)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:631:20: error: static declaration of 'ptep_set_wrprotect' follows non-static declaration
   include/linux/pgtable.h:220:17: note: previous implicit declaration of 'ptep_set_wrprotect' with type 'void(struct mm_struct *, long unsigned int,  pte_t *)' {aka 'void(struct mm_struct *, long unsigned int,  unsigned int *)'}
     220 |                 ptep_set_wrprotect(mm, addr, ptep);
         |                 ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=2834597893
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2 shuffle=2834597893
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2834597893
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2834597893
   make: Target 'prepare' not remade because of errors.


vim +631 include/linux/pgtable.h

2f0584f3f4bd60 include/linux/pgtable.h       Rick Edgecombe 2023-06-12  628  
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds 2005-04-16  629  #ifndef __HAVE_ARCH_PTEP_SET_WRPROTECT
8c65b4a6045059 include/asm-generic/pgtable.h Tim Schmielau  2005-11-07  630  struct mm_struct;
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds 2005-04-16 @631  static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long address, pte_t *ptep)
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds 2005-04-16  632  {
c33c794828f212 include/linux/pgtable.h       Ryan Roberts   2023-06-12  633  	pte_t old_pte = ptep_get(ptep);
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds 2005-04-16  634  	set_pte_at(mm, address, ptep, pte_wrprotect(old_pte));
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds 2005-04-16  635  }
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds 2005-04-16  636  #endif
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds 2005-04-16  637  

:::::: The code at line 631 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
