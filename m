Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0107282F0E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 05:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774157983; cv=none; b=ZShTvIhMyX1UpK53MqOOa057n4Z8V24DHfI8OvF80ccjW3SBfVWECuaK619hiumlBpPFC+e0o5BIytYFm3h+38lQO1anz2d01yjjUfBZy1TmQH1BuYYsLMRGDBUvwctuKevZYoWoy19RWaMolEJsYhWib2GbKiWIhpiI4krKKfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774157983; c=relaxed/simple;
	bh=SW8ewo7pzKknLsIDyibreGqtdxuPOeuHsUO7wXfGxyE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lzyOkIRu/WnrFcS9+4NqQstydF85V6OuRkHW7cYA28cnTZAUZKCV1+Z34eVWhS88rv7crkvY7XUiGfgzVPMJuWAhEECfkYAVAl0ouRqHZjrBgxv1LcvZ4OMA7/1TiCywX1td+1u++PgJRQBjXcRiOtZG2eO5c6Ce1eds/6nMkcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUP7b56Y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUP7b56Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774157981; x=1805693981;
  h=date:from:to:cc:subject:message-id;
  bh=SW8ewo7pzKknLsIDyibreGqtdxuPOeuHsUO7wXfGxyE=;
  b=VUP7b56YKKeJckgmobp5CCbHkhLkbI6hhVDpbP4KSluLiXz4TvivUvT6
   69jBUW0vsAvKUMJD29ayTTvs4CUMh7RvnUudep7th1hC09zHzHpWh52ld
   Akl58gjp4PPQJsPHlZMd7XDUqkywj6IwLpqMCFEM3tWTHLmJtiAkklFCH
   vfqJoDGUKSVaFgles9bTXaPYsc8Mo5EFOI4pfsVFLmsBWm8eNAmNhhvjY
   IaWvX/Bhu8x/ssoDuqwNFqPYm7eljgFoQMdZdqKSa/73A+JVoQaBtMIdX
   1tAOPyeKsx6DAtHazXCnHPlD5RD/zWvs+T24T0XcgJcN0oyon6avvo59o
   w==;
X-CSE-ConnectionGUID: ELxkNl4kSNWD3Yn+bph2+Q==
X-CSE-MsgGUID: FB8yI1p8Tsq+l8eoF/BQjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="92574395"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="92574395"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 22:39:41 -0700
X-CSE-ConnectionGUID: 27r/sfy+Tp+k/l1TwGjNUw==
X-CSE-MsgGUID: U/mPPSleRWC7RsIc5H1yXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="261603368"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 Mar 2026 22:39:39 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4BWb-000000001kT-3WlZ;
	Sun, 22 Mar 2026 05:39:11 +0000
Date: Sun, 22 Mar 2026 13:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 17/30]
 include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared
Message-ID: <202603221339.2UXgyMXN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3ecd2bc82d7d0382233099de8d07616df26745c4
commit: 28dbc88fd3353ba1e303dbfbd351218964beef77 [17/30] mm: Update memory model macros to support PTE_SIZE units
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260322/202603221339.2UXgyMXN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221339.2UXgyMXN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221339.2UXgyMXN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/alpha/include/asm/page.h:84,
                    from include/linux/shm.h:6,
                    from include/linux/sched.h:23,
                    from arch/alpha/kernel/asm-offsets.c:11:
   include/linux/mm.h: In function 'folio_pfn':
   include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
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
   include/linux/mm.h: In function 'mkpte':
   include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:2290:24: note: in expansion of macro 'page_to_pfn'
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                        ^~~~~~~~~~~
>> include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared (first use in this function)
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:2290:24: note: in expansion of macro 'page_to_pfn'
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                        ^~~~~~~~~~~
>> include/asm-generic/memory_model.h:66:1: error: expected ';' before '}' token
      66 | })
         | ^
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:2290:24: note: in expansion of macro 'page_to_pfn'
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                        ^~~~~~~~~~~
   include/linux/mm.h: In function 'is_zero_page':
   include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
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
   include/linux/mm.h: In function 'folio_is_longterm_pinnable':
   include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mmzone.h:133:40: note: in expansion of macro 'page_to_pfn'
     133 |         get_pfnblock_migratetype(page, page_to_pfn(page))
         |                                        ^~~~~~~~~~~
   include/linux/mmzone.h:136:9: note: in expansion of macro 'get_pageblock_migratetype'
     136 |         get_pageblock_migratetype(&folio->page)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:2452:18: note: in expansion of macro 'folio_migratetype'
    2452 |         int mt = folio_migratetype(folio);
         |                  ^~~~~~~~~~~~~~~~~
>> include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared (first use in this function)
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mmzone.h:133:40: note: in expansion of macro 'page_to_pfn'
     133 |         get_pfnblock_migratetype(page, page_to_pfn(page))
         |                                        ^~~~~~~~~~~
   include/linux/mmzone.h:136:9: note: in expansion of macro 'get_pageblock_migratetype'
     136 |         get_pageblock_migratetype(&folio->page)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:2452:18: note: in expansion of macro 'folio_migratetype'
    2452 |         int mt = folio_migratetype(folio);
         |                  ^~~~~~~~~~~~~~~~~
>> include/asm-generic/memory_model.h:66:1: error: expected ';' before '}' token
      66 | })
         | ^
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mmzone.h:133:40: note: in expansion of macro 'page_to_pfn'
     133 |         get_pfnblock_migratetype(page, page_to_pfn(page))
         |                                        ^~~~~~~~~~~
   include/linux/mmzone.h:136:9: note: in expansion of macro 'get_pageblock_migratetype'
     136 |         get_pageblock_migratetype(&folio->page)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:2452:18: note: in expansion of macro 'folio_migratetype'
    2452 |         int mt = folio_migratetype(folio);
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/mm.h: In function 'lowmem_page_address':
   include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   arch/alpha/include/asm/page.h:79:60: note: in definition of macro '__va'
      79 | #define __va(x)                 ((void *)((unsigned long) (x) + PAGE_OFFSET))
         |                                                            ^
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
   arch/alpha/include/asm/page.h:79:60: note: in definition of macro '__va'
      79 | #define __va(x)                 ((void *)((unsigned long) (x) + PAGE_OFFSET))
         |                                                            ^
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
   arch/alpha/include/asm/page.h:79:60: note: in definition of macro '__va'
      79 | #define __va(x)                 ((void *)((unsigned long) (x) + PAGE_OFFSET))
         |                                                            ^
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
   make[3]: *** [scripts/Makefile.build:184: arch/alpha/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/__ret +62 include/asm-generic/memory_model.h

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
