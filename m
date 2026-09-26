Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2ED261B9E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447495; cv=none; b=B/tMTzLlkywCv7hZnJ+s23qDD36ExHiJ9naouCCuckz/jx+TQBmdpObLXZCuOiPYYOG9yjRHO0hW0OON4PjXuzZXe2kd5OXQ8UhELGttnRzdjkMzwljKoy++oQ4uP41ARk6zzr58Tqo98RGskdcMRe+XVSVMhMWpvAT4eRYQjHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447495; c=relaxed/simple;
	bh=YhoPhH9eZ/OebksKCmZlQ29kPnAYvBb86I3w02YRknM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nR0QLhFVy9LordwA6NyTtRqnR0zNNAE+xiu1Mqdzq8UG0Cb4Askagjp20LyMcq5c+uFHKFQl26VJiCZ+LjNmkvrKG00FO4sqX7nAoT4Hr4ja5MmxgdfbWLeUejl32o5AnYNJOlv6cp9Pa8idD6fP14WAArzwkI9bcYlrtLQCDrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OfQwsjH9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OfQwsjH9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790447494; x=1821983494;
  h=date:from:to:cc:subject:message-id;
  bh=YhoPhH9eZ/OebksKCmZlQ29kPnAYvBb86I3w02YRknM=;
  b=OfQwsjH9xXse8B2E6KgAAtrd+TS5Ale4SN3DySsvn+h8il+KBHoZqmF1
   z3nukABD7bDVslf+N53UYN0ORu3lqNtG9FL8FYb8tVwFOx1xX37CVfqbn
   cmFLQBpc7yxY2tP2ovb7Q3xEWBLQg/r0M0GhQIVH0u+joZMdGfX+HTu7O
   IB4fQ88MrSNLg2yixdPnt4e+KCaq841aS2rgKtlDs+TByXfJumIfzE4kz
   fa3ACPbSFQx+ZtLKv70/1rkrdEP6Vhyh8XvycDPlLm5wQQlpODYf6gzuv
   UB2hlu3/rKL8EDkMctIEj7vqsXsnEFrPt09Now5XKz5MYkgCy950Y9g38
   Q==;
X-CSE-ConnectionGUID: WlUhzlfRQMWbmzXLywqApw==
X-CSE-MsgGUID: RnqaMoHbQm2boNEDcmXKog==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="116733228"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="116733228"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 11:31:33 -0700
X-CSE-ConnectionGUID: +CWZBnYSSkqN9g9NBvujVw==
X-CSE-MsgGUID: PFs+2ZvDTLyPDetV7Jzz3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="278008807"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Sep 2026 11:31:31 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAXBJ-00000000M73-1T0e;
	Sat, 26 Sep 2026 18:31:29 +0000
Date: Sun, 27 Sep 2026 02:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10221/10910]
 include/linux/mmzone.h:94:34: error: 'PUD_SHIFT' undeclared here (not in a
 function); did you mean 'NMI_SHIFT'?
Message-ID: <202609270240.3jTO1ZSC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 90506255be6d7481d4141e51dbbe11d7800e9e75 [10221/10910] mm-sparse-vmemmap-introduce-config_vmemmap_optimization-fix
config: riscv-randconfig-1001-20260927 (https://download.01.org/0day-ci/archive/20260927/202609270240.3jTO1ZSC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609270240.3jTO1ZSC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270240.3jTO1ZSC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from arch/riscv/kernel/asm-offsets.c:9:
>> include/linux/mmzone.h:94:34: error: 'PUD_SHIFT' undeclared here (not in a function); did you mean 'NMI_SHIFT'?
      94 | #define MAX_FOLIO_ORDER         (PUD_SHIFT - PAGE_SHIFT)
         |                                  ^~~~~~~~~
   include/linux/mmzone.h:117:10: note: in expansion of macro 'MAX_FOLIO_ORDER'
     117 |         (MAX_FOLIO_ORDER - VMEMMAP_OPTIMIZATION_MIN_ORDER + 1)
         |          ^~~~~~~~~~~~~~~
   include/linux/mmzone.h:119:11: note: in expansion of macro '__VMEMMAP_OPTIMIZATION_NR_ORDERS'
     119 |         ((__VMEMMAP_OPTIMIZATION_NR_ORDERS > 0 &&       \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:1160:36: note: in expansion of macro 'VMEMMAP_OPTIMIZATION_NR_ORDERS'
    1160 |         struct page *vmemmap_tails[VMEMMAP_OPTIMIZATION_NR_ORDERS];
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=3113152511
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2 shuffle=3113152511
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3113152511
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3113152511
   make: Target 'prepare' not remade because of errors.


vim +94 include/linux/mmzone.h

5ad333eb66ff1e Andy Whitcroft  2007-07-17  64  
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  65  #if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  66  /*
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  67   * We don't expect any folios that exceed buddy sizes (and consequently
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  68   * memory sections).
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  69   */
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  70  #define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  71  #elif defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  72  /*
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  73   * Only pages within a single memory section are guaranteed to be
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  74   * contiguous. By limiting folios to a single memory section, all folio
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  75   * pages are guaranteed to be contiguous.
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  76   */
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  77  #define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  78  #elif defined(CONFIG_HUGETLB_PAGE)
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  79  /*
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  80   * There is no real limit on the folio size. We limit them to the maximum we
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  81   * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  82   * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  83   */
622026e87c4019 Kiryl Shutsemau 2026-02-27  84  #ifdef CONFIG_64BIT
622026e87c4019 Kiryl Shutsemau 2026-02-27  85  #define MAX_FOLIO_ORDER		(ilog2(SZ_16G) - PAGE_SHIFT)
622026e87c4019 Kiryl Shutsemau 2026-02-27  86  #else
622026e87c4019 Kiryl Shutsemau 2026-02-27  87  #define MAX_FOLIO_ORDER		(ilog2(SZ_1G) - PAGE_SHIFT)
622026e87c4019 Kiryl Shutsemau 2026-02-27  88  #endif
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  89  #else
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  90  /*
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  91   * Without hugetlb, gigantic folios that are bigger than a single PUD are
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  92   * currently impossible.
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  93   */
622026e87c4019 Kiryl Shutsemau 2026-02-27 @94  #define MAX_FOLIO_ORDER		(PUD_SHIFT - PAGE_SHIFT)
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  95  #endif
a2c77ec320a995 Kiryl Shutsemau 2026-02-27  96  

:::::: The code at line 94 was first introduced by commit
:::::: 622026e87c4019e609010811757e31193cc23847 mm/hugetlb: remove fake head pages

:::::: TO: Kiryl Shutsemau <kas@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
