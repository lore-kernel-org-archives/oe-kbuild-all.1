Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F0D313540
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777809711; cv=none; b=W9qqc64EvD+tAvKyvRKiAupY6iAYLsDIcAc7WnuJ6SlAes6AAnvv0VuG7g0LVcZEaSVwcdxYkdRERQxtPVBC60t3TfQEA8YvFdc9e4BglXGlmZ+cHvIWad+krPb3A8hAimT/SEcm7iKtUoC5fjShOkDP7PjYLi0vIcCzqAYGypo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777809711; c=relaxed/simple;
	bh=1aUIytnBytPoCPIReseaUXSaSc1GFhUG6sItvL6xXig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CTaHMlNXfvcGrap4F1/oxivrbc1L35foltSLe/d9La+KpKMpkDSIRuH1RLuIkJeK0Dg0RdOg9t7smFb9ZEZGgqGouZMZzNuK7UETwR7gPHD6mssFjzhn40xuEx7zMHjf8uMlPWmx4g1uYgd+/QSz7ILY/sbbpnNWg+8Z0Yuyq2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OzvshcDD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OzvshcDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777809709; x=1809345709;
  h=date:from:to:cc:subject:message-id;
  bh=1aUIytnBytPoCPIReseaUXSaSc1GFhUG6sItvL6xXig=;
  b=OzvshcDDin1ifVjVnTBNZ9hDN1jZzapomsM4NBLiI2WQQWt9reCcDVaG
   SFKIby2uD2WLEtGKOyvu/LcMT2ATWvhcL1NgHwqAEAXwHRNlHXv3pg7dQ
   3WESR0hk+ryA92RNepvI85Dnq15U7a+t1Wk7hIDWMPJu0oYppJBuLwQQy
   VAlX37Yp4DyIFF+gCoB2uOKF7tsxq8wYn43ftbRpuibFOd/N1LxncfFoV
   fOdPYNlv5sd5BYZhEL9AW/VWvCAu/GWJMAC404su900d6Wqk9qIfvIhoI
   0383YT7p8slQKAxGQUp8jihczYvg5egRja5RUHfhgVHICIibneR8wdCep
   w==;
X-CSE-ConnectionGUID: zZ1IKfYGRCqnesapV3wlxw==
X-CSE-MsgGUID: PuwZH4gkR3eQVs3KUhgpug==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="81266294"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="81266294"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 05:01:46 -0700
X-CSE-ConnectionGUID: erydQ148RLOiJw3vzsooJw==
X-CSE-MsgGUID: 4AlOGkLWTOe0Aiz4gYLXSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="240271730"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 May 2026 05:01:46 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJVW2-000000002Wp-3k10;
	Sun, 03 May 2026 12:01:42 +0000
Date: Sun, 03 May 2026 20:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 17/69]
 include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';',
 'asm' or '__attribute__' before '__ret'
Message-ID: <202605031918.0wNMXjfx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3453a5ad954365409373c2762ba237c7e31a623b
commit: 90b3fc43f64bb0fe61d4bf05471d4e73234f9885 [17/69] mm: Update memory model macros to support PTE_SIZE units
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605031918.0wNMXjfx-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031918.0wNMXjfx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031918.0wNMXjfx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sh/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from arch/sh/kernel/asm-offsets.c:15:
   arch/sh/include/asm/page.h:13:9: warning: 'PTE_MASK' redefined
      13 | #define PTE_MASK        PAGE_MASK
         |         ^~~~~~~~
   In file included from arch/sh/include/asm/page.h:11:
   include/vdso/page.h:26:9: note: this is the location of the previous definition
      26 | #define PTE_MASK        (~((1 << CONFIG_PTE_SHIFT) - 1))
         |         ^~~~~~~~
   In file included from arch/sh/include/asm/page.h:160:
   include/linux/mm.h: In function 'folio_pfn':
>> include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:2269:16: note: in expansion of macro 'page_to_pfn'
    2269 |         return page_to_pfn(&folio->page);
         |                ^~~~~~~~~~~
>> include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared (first use in this function)
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:2269:16: note: in expansion of macro 'page_to_pfn'
    2269 |         return page_to_pfn(&folio->page);
         |                ^~~~~~~~~~~
   include/asm-generic/memory_model.h:62:23: note: each undeclared identifier is reported only once for each function it appears in
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:2269:16: note: in expansion of macro 'page_to_pfn'
    2269 |         return page_to_pfn(&folio->page);
         |                ^~~~~~~~~~~
>> include/asm-generic/memory_model.h:66:1: error: expected ';' before '}' token
      66 | })
         | ^
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:2269:16: note: in expansion of macro 'page_to_pfn'
    2269 |         return page_to_pfn(&folio->page);
         |                ^~~~~~~~~~~
   include/linux/mm.h: In function 'is_zero_page':
>> include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:2433:28: note: in expansion of macro 'page_to_pfn'
    2433 |         return is_zero_pfn(page_to_pfn(page));
         |                            ^~~~~~~~~~~
>> include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared (first use in this function)
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:2433:28: note: in expansion of macro 'page_to_pfn'
    2433 |         return is_zero_pfn(page_to_pfn(page));
         |                            ^~~~~~~~~~~
>> include/asm-generic/memory_model.h:66:1: error: expected ';' before '}' token
      66 | })
         | ^
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:2433:28: note: in expansion of macro 'page_to_pfn'
    2433 |         return is_zero_pfn(page_to_pfn(page));
         |                            ^~~~~~~~~~~
   include/linux/mm.h: In function 'lowmem_page_address':
>> include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   arch/sh/include/asm/page.h:126:27: note: in definition of macro '___va'
     126 | #define ___va(x)        ((x)+PAGE_OFFSET)
         |                           ^
   include/linux/mm.h:121:25: note: in expansion of macro '__va'
     121 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                         ^~~~
   include/linux/mm.h:121:30: note: in expansion of macro 'PFN_PHYS'
     121 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:121:39: note: in expansion of macro 'page_to_pfn'
     121 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                                       ^~~~~~~~~~~
   include/linux/mm.h:2766:16: note: in expansion of macro 'page_to_virt'
    2766 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared (first use in this function)
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   arch/sh/include/asm/page.h:126:27: note: in definition of macro '___va'
     126 | #define ___va(x)        ((x)+PAGE_OFFSET)
         |                           ^
   include/linux/mm.h:121:25: note: in expansion of macro '__va'
     121 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                         ^~~~
   include/linux/mm.h:121:30: note: in expansion of macro 'PFN_PHYS'
     121 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:121:39: note: in expansion of macro 'page_to_pfn'
     121 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                                       ^~~~~~~~~~~
   include/linux/mm.h:2766:16: note: in expansion of macro 'page_to_virt'
    2766 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:66:1: error: expected ';' before '}' token
      66 | })
         | ^
   arch/sh/include/asm/page.h:126:27: note: in definition of macro '___va'
     126 | #define ___va(x)        ((x)+PAGE_OFFSET)
         |                           ^
   include/linux/mm.h:121:25: note: in expansion of macro '__va'
     121 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                         ^~~~
   include/linux/mm.h:121:30: note: in expansion of macro 'PFN_PHYS'
     121 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:121:39: note: in expansion of macro 'page_to_pfn'
     121 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                                       ^~~~~~~~~~~
   include/linux/mm.h:2766:16: note: in expansion of macro 'page_to_virt'
    2766 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
   In file included from include/asm-generic/memory_model.h:5:
   include/linux/bvec.h: In function 'bvec_phys':
>> include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/linux/pfn.h:12:40: note: in definition of macro 'PFN_PHYS'
      12 | #define PFN_PHYS(x)     ((phys_addr_t)(x) << PTE_SHIFT)
         |                                        ^
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/asm-generic/memory_model.h:93:42: note: in expansion of macro 'page_to_pfn'
      93 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                          ^~~~~~~~~~~
   include/linux/bvec.h:308:16: note: in expansion of macro 'page_to_phys'
     308 |         return page_to_phys(bvec->bv_page) + bvec->bv_offset;
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared (first use in this function)
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/linux/pfn.h:12:40: note: in definition of macro 'PFN_PHYS'
      12 | #define PFN_PHYS(x)     ((phys_addr_t)(x) << PTE_SHIFT)
         |                                        ^
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/asm-generic/memory_model.h:93:42: note: in expansion of macro 'page_to_pfn'
      93 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                          ^~~~~~~~~~~
   include/linux/bvec.h:308:16: note: in expansion of macro 'page_to_phys'
     308 |         return page_to_phys(bvec->bv_page) + bvec->bv_offset;
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:66:1: error: expected ';' before '}' token
      66 | })
         | ^
   include/linux/pfn.h:12:40: note: in definition of macro 'PFN_PHYS'
      12 | #define PFN_PHYS(x)     ((phys_addr_t)(x) << PTE_SHIFT)
         |                                        ^
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/asm-generic/memory_model.h:93:42: note: in expansion of macro 'page_to_pfn'
      93 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                          ^~~~~~~~~~~
   include/linux/bvec.h:308:16: note: in expansion of macro 'page_to_phys'
     308 |         return page_to_phys(bvec->bv_page) + bvec->bv_offset;
         |                ^~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/sh/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1337: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +62 include/asm-generic/memory_model.h

    53	
    54	#elif defined(CONFIG_SPARSEMEM)
    55	/*
    56	 * Note: section's mem_map is encoded to reflect its start_pfn.
    57	 * section[i].section_mem_map == mem_map's address - start_pfn;
    58	 */
    59	#define __page_to_pfn(pg)						\
    60	({	const struct page *__pg = (pg);					\
    61		int __sec = memdesc_section(__pg->flags);			\
  > 62		unsigned logn __ret;						\
    63		__ret = (unsigned long)(__pg -					\
    64			__section_mem_map_addr(__nr_to_section(__sec)));	\
    65		PAGES_TO_PTES(__ret)						\
  > 66	})
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
