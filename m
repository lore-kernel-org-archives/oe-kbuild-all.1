Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7774528504D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 09:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775899822; cv=none; b=fM+aHPPgPVTnrnp5NA1P/0qlSZO/p1ZX0sv26C2BPEfsLALm9VpSEf9dckPVGSKZho4gZDlotLlqPKomVt1RUvWlG711ZP5S+EIdSx34QtZEjbDS1wdcHHdXayiwFhZelPwEfK7O6GtJAQnv30zlDi0ExwEPIGp8i6+Hfx+otc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775899822; c=relaxed/simple;
	bh=Zf+Rp9MUDfUIQvRkmL13sDWI2/dzi/C2WWvy0fESDj4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NrYSVlpYVA+Tf4tXvaDPlOB0MDmAV8GYQ0h1ruT0+wxQnbH3lW0+Y5yWJ8y21Oe4O5ChHs96TVmrydVtM34KM2U6UxfI2WjV+Bo+QY9D1uDl0/b6MXIebeb7UvKKqFRAZt/BY8g+E0gdgf7L8YOCpjgWHpW3y3nw7LznFof67h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8AZIqhC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8AZIqhC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775899821; x=1807435821;
  h=date:from:to:cc:subject:message-id;
  bh=Zf+Rp9MUDfUIQvRkmL13sDWI2/dzi/C2WWvy0fESDj4=;
  b=Z8AZIqhCRdTFVhig9JdCgEtbPbduVL2Nd7NAEf0gg401cf4xLkgMl7v+
   aUwFOaIhnQYU73+5pIRbRsQnAVBTiat7niqqQFfjd5ayctjqnqrqQm3vu
   qHttGkWiHd+pXhsRlR1ol9DdMMu8E7qKZ+ANUXdPQ1Sk7EeLGP10auX6D
   in2rJ5zHhxnO7g/dHFjJL6k5J/1DULC8ocL4XVMitUaujj7w9UmKlUSZR
   t/VTxQG7XLHNQCQVgVnFO42nqtsJvZ8WCjgPxBj5/I9pO1o1BV7Vn52b+
   kJCZKwAgWLGO0C5HCmoqFyiBZumTehuWAoAmXoq9b/SBc1Q+EUXm8CsZV
   Q==;
X-CSE-ConnectionGUID: 55TvUuCQTIez9xX5qNh7tQ==
X-CSE-MsgGUID: YjcFFNY4Q7WsaImUfNpAVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87200475"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="87200475"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 02:30:20 -0700
X-CSE-ConnectionGUID: 53Tr7OYKSFKqgWpcM0hagw==
X-CSE-MsgGUID: yoY0202aQMa51O5niR27dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="229231245"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Apr 2026 02:30:18 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBUfQ-0000000012D-0jW3;
	Sat, 11 Apr 2026 09:30:16 +0000
Date: Sat, 11 Apr 2026 17:29:51 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:b4/mapcount 13/13]
 include/linux/pgtable.h:8:26: error: 'PMD_SHIFT' undeclared; did you mean
 'PUD_SHIFT'?
Message-ID: <202604111716.fy30Kozh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux b4/mapcount
head:   3a4632859e00ee6195ae655d0937c8afdf20096c
commit: 3a4632859e00ee6195ae655d0937c8afdf20096c [13/13] mm: support arbitrary folio mappings
config: arm-randconfig-001-20260411 (https://download.01.org/0day-ci/archive/20260411/202604111716.fy30Kozh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111716.fy30Kozh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111716.fy30Kozh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:31,
                    from arch/arm/kernel/asm-offsets.c:14:
   include/linux/pgtable.h: In function 'pgtable_level_to_order':
>> include/linux/pgtable.h:8:26: error: 'PMD_SHIFT' undeclared (first use in this function); did you mean 'PUD_SHIFT'?
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   include/linux/pgtable.h:2254:24: note: in expansion of macro 'PMD_ORDER'
    2254 |                 return PMD_ORDER;
         |                        ^~~~~~~~~
   include/linux/pgtable.h:8:26: note: each undeclared identifier is reported only once for each function it appears in
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   include/linux/pgtable.h:2254:24: note: in expansion of macro 'PMD_ORDER'
    2254 |                 return PMD_ORDER;
         |                        ^~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=367483873
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1337: prepare0] Error 2 shuffle=367483873
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=367483873
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=367483873
   make: Target 'prepare' not remade because of errors.


vim +8 include/linux/pgtable.h

f25748e3c34eb8 include/asm-generic/pgtable.h Dan Williams            2016-01-15   7  
051ddcfeb1bdba include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-18  @8) #define PMD_ORDER	(PMD_SHIFT - PAGE_SHIFT)
051ddcfeb1bdba include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-18   9) #define PUD_ORDER	(PUD_SHIFT - PAGE_SHIFT)
3a4632859e00ee include/linux/pgtable.h       David Hildenbrand (Arm  2026-04-07  10) #define P4D_ORDER	(P4D_SHIFT - PAGE_SHIFT)
3a4632859e00ee include/linux/pgtable.h       David Hildenbrand (Arm  2026-04-07  11) #define PGDIR_ORDER	(PGDIR_SHIFT - PAGE_SHIFT)
051ddcfeb1bdba include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-18  12) 

:::::: The code at line 8 was first introduced by commit
:::::: 051ddcfeb1bdbae45e660c0db2468d29ca15c6c2 mm: move PMD_ORDER to pgtable.h

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
