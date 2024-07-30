Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145E519E83C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722345702; cv=none; b=rNx+4nrUix2rvLyNYTCyVB8WmLDQB3Mu8QCc2FBjf01W9AeikEpE+4ndZi+Bod7K/rodxG77FrwX1LeqS9XxS3+Tjpt4ybE2EoTa53wTOcbpK+UH/QivkVV99tWihsGL/LTfra6x3jHf2ZnViFmNjqLOiR92J72jof8dXcFIaY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722345702; c=relaxed/simple;
	bh=SA6xaliBzeyztj4PUic+fVD6Ctcc+BvWsoibDrf3dr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+78mEdksfj8Ty63sxlTrZov5kb4W12+wbs7Xr9vMkja3AD0v3CdWzIQ6xZ6lU8bd6ohYJlRVpEt5Ar/N2vFsFWpI1dex9zwvE7VC8vN5cUCE56InleLDlO4iSQ6ulAq9vMx1aBXxBMP2vFrpREJBMUS8VEUlBlKQdfryNWHRT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUBbcwzx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUBbcwzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722345700; x=1753881700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SA6xaliBzeyztj4PUic+fVD6Ctcc+BvWsoibDrf3dr0=;
  b=nUBbcwzxY4Ui/cS7Y33wFyoh80lUk358YFopGH2uVofKscJAHUoYvzud
   Dh3VzAR6DAq2PEk32REoBMh20u+Zavh7BscNxfIWUOwTNpqfTQ+wCY6GQ
   3YeIfRINPzicQ66DJKd9MwlwF4TV8aowu+/DxEcIRrNx/AvlYghvH5rfa
   E1mhYgMD0mEwC0n8hu3ZZoWt/6wv6j3DgtgXJZCJh8yKGSQgvnd02FezH
   oDWokzppxGpfTbclun/u+6I4rXTsLqbggbCuD0OcI45pJ+Uj6oQ6J6GMt
   ejgwLOPouU6QtjIsLc1k53lU0mEsiw8PXz3vOza+EdthUSWPOgdomeDlT
   g==;
X-CSE-ConnectionGUID: 34+Ojl44R4akdCZG9+mbEQ==
X-CSE-MsgGUID: hrDwI+fKTkGHNkQW2V15bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30826160"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="30826160"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 06:21:39 -0700
X-CSE-ConnectionGUID: JHNJgB/5RmagMONjNHRq4A==
X-CSE-MsgGUID: kIxtinKgRbmCyGGLD8bWJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54922070"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Jul 2024 06:21:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYmnH-000ssy-1X;
	Tue, 30 Jul 2024 13:21:35 +0000
Date: Tue, 30 Jul 2024 21:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folio_walk 1/11] include/linux/mm.h:1982:16:
 error: implicit declaration of function 'is_zero_pfn'; did you mean
 'is_zero_page'?
Message-ID: <202407302101.OsGi8tEJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux folio_walk
head:   96def1bb1fa490ec700ce6838ca58f4321a39af4
commit: 8219151a9ee46accd87b59292ae9f0c9b638dbd7 [1/11] mm/pagewalk: introduce folio_walk_start() + folio_walk_end()
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240730/202407302101.OsGi8tEJ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407302101.OsGi8tEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407302101.OsGi8tEJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/cacheflush.h:7,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/pgtable.h:17,
                    from arch/powerpc/include/asm/kup.h:43,
                    from arch/powerpc/include/asm/uaccess.h:8,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/compat.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:12:
   include/linux/mm.h: In function 'maybe_mkwrite':
>> include/linux/mm.h:1348:23: error: implicit declaration of function 'pte_mkwrite'; did you mean 'pte_write'? [-Wimplicit-function-declaration]
    1348 |                 pte = pte_mkwrite(pte, vma);
         |                       ^~~~~~~~~~~
         |                       pte_write
   include/linux/mm.h: In function 'is_zero_page':
>> include/linux/mm.h:1982:16: error: implicit declaration of function 'is_zero_pfn'; did you mean 'is_zero_page'? [-Wimplicit-function-declaration]
    1982 |         return is_zero_pfn(page_to_pfn(page));
         |                ^~~~~~~~~~~
         |                is_zero_page
   include/linux/mm.h: In function 'io_remap_pfn_range':
>> include/linux/mm.h:3613:54: error: implicit declaration of function 'pgprot_decrypted'; did you mean 'pgprot_cached'? [-Wimplicit-function-declaration]
    3613 |         return remap_pfn_range(vma, addr, pfn, size, pgprot_decrypted(prot));
         |                                                      ^~~~~~~~~~~~~~~~
         |                                                      pgprot_cached
>> include/linux/mm.h:3613:54: error: incompatible type for argument 5 of 'remap_pfn_range'
    3613 |         return remap_pfn_range(vma, addr, pfn, size, pgprot_decrypted(prot));
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
         |                                                      |
         |                                                      int
   include/linux/mm.h:3575:64: note: expected 'pgprot_t' but argument is of type 'int'
    3575 |                         unsigned long pfn, unsigned long size, pgprot_t);
         |                                                                ^~~~~~~~
   In file included from include/linux/highmem.h:14:
   include/linux/highmem-internal.h: In function 'kmap_atomic':
>> include/linux/highmem-internal.h:211:9: error: implicit declaration of function 'pagefault_disable'; did you mean 'preempt_disable'? [-Wimplicit-function-declaration]
     211 |         pagefault_disable();
         |         ^~~~~~~~~~~~~~~~~
         |         preempt_disable
   include/linux/highmem-internal.h: In function '__kunmap_atomic':
>> include/linux/highmem-internal.h:230:9: error: implicit declaration of function 'pagefault_enable'; did you mean 'preempt_enable'? [-Wimplicit-function-declaration]
     230 |         pagefault_enable();
         |         ^~~~~~~~~~~~~~~~
         |         preempt_enable
   include/linux/pgtable.h: At top level:
>> include/linux/pgtable.h:806:21: error: conflicting types for 'pte_mkwrite'; have 'pte_t(pte_t,  struct vm_area_struct *)' {aka 'long unsigned int(long unsigned int,  struct vm_area_struct *)'}
     806 | static inline pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
         |                     ^~~~~~~~~~~
   include/linux/mm.h:1348:23: note: previous implicit declaration of 'pte_mkwrite' with type 'int()'
    1348 |                 pte = pte_mkwrite(pte, vma);
         |                       ^~~~~~~~~~~
>> include/linux/pgtable.h:1566:19: error: static declaration of 'is_zero_pfn' follows non-static declaration
    1566 | static inline int is_zero_pfn(unsigned long pfn)
         |                   ^~~~~~~~~~~
   include/linux/mm.h:1982:16: note: previous implicit declaration of 'is_zero_pfn' with type 'int()'
    1982 |         return is_zero_pfn(page_to_pfn(page));
         |                ^~~~~~~~~~~
>> include/linux/uaccess.h:243:20: warning: conflicting types for 'pagefault_disable'; have 'void(void)'
     243 | static inline void pagefault_disable(void)
         |                    ^~~~~~~~~~~~~~~~~
>> include/linux/uaccess.h:243:20: error: static declaration of 'pagefault_disable' follows non-static declaration
   include/linux/highmem-internal.h:211:9: note: previous implicit declaration of 'pagefault_disable' with type 'void(void)'
     211 |         pagefault_disable();
         |         ^~~~~~~~~~~~~~~~~
>> include/linux/uaccess.h:253:20: warning: conflicting types for 'pagefault_enable'; have 'void(void)'
     253 | static inline void pagefault_enable(void)
         |                    ^~~~~~~~~~~~~~~~
>> include/linux/uaccess.h:253:20: error: static declaration of 'pagefault_enable' follows non-static declaration
   include/linux/highmem-internal.h:230:9: note: previous implicit declaration of 'pagefault_enable' with type 'void(void)'
     230 |         pagefault_enable();
         |         ^~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1193: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1982 include/linux/mm.h

ebe2e35ec0f256 David Hildenbrand 2023-12-20  1973  
c8070b78751955 David Howells     2023-05-26  1974  /**
c8070b78751955 David Howells     2023-05-26  1975   * is_zero_page - Query if a page is a zero page
c8070b78751955 David Howells     2023-05-26  1976   * @page: The page to query
c8070b78751955 David Howells     2023-05-26  1977   *
c8070b78751955 David Howells     2023-05-26  1978   * This returns true if @page is one of the permanent zero pages.
c8070b78751955 David Howells     2023-05-26  1979   */
c8070b78751955 David Howells     2023-05-26  1980  static inline bool is_zero_page(const struct page *page)
c8070b78751955 David Howells     2023-05-26  1981  {
c8070b78751955 David Howells     2023-05-26 @1982  	return is_zero_pfn(page_to_pfn(page));
c8070b78751955 David Howells     2023-05-26  1983  }
c8070b78751955 David Howells     2023-05-26  1984  

:::::: The code at line 1982 was first introduced by commit
:::::: c8070b78751955e59b42457b974bea4a4fe00187 mm: Don't pin ZERO_PAGE in pin_user_pages()

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
