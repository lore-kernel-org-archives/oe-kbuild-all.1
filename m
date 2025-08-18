Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64AF18A6DB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755507806; cv=none; b=neBLT9HeEho2OSnhB1p6RCxOkXbC+qUa1J+IDzOvByXsJgcYOrZEb+E8gnGCwIEigKYrkE4tY+yvWr+HLuW0fwRgfmp28cnJSyFzvJJOrsJppmBK5oS3Y3zNvii1QpnnnpWKdKP9WPrUNCvkFhezthgLocEZZ2TScRhvtKsuh2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755507806; c=relaxed/simple;
	bh=sL2QkLIfymufCOOH/8KYfvMopBGrSrl4xSgsFtLRbiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfGXO/hVDxuc+8aO5idf5fXMCyLQ4HbLAocfpKZoxfco1POrAgtsrgXIjnes2QEgsUoTB1b+pk2b2pt1hWpJZm+77FDfIdwYRNnH0DrNBEUk1LHjNQozUSeIuTIm3n3rVDz0GS4h9XqzAyVsakAc0IjUxiy7d2qScqIFp+Up5+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMevPZlj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMevPZlj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755507805; x=1787043805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sL2QkLIfymufCOOH/8KYfvMopBGrSrl4xSgsFtLRbiY=;
  b=JMevPZljTi5qupmykO375J5UVIRCOOsgS984dNYdZGfkKNEB0udk6DAG
   6JZ6sfAnacD3K1JYi8+KLKPVVqhbH96mJOgXN2wtjdxO0I4uEkSZkMZNj
   JUyOy4h0fJtcYjqsBFFq8w3aMtgIlaQd5y9rYhw/4N+q29TKYcSDUUik2
   6Niwr1ggWXaOazJYvKdg8BH9uiwWPosZsDhtwXYcldepAr/zNzYNmHLNR
   rjtnJV68DtXsWHDOBV8B3pg7bX/F4GkJK2IBP/oqOIcsZ+h4MLP24ZfgM
   Rhopif20FtG9u+pV5Ax6F/f4abLfd5bBpSHKaJUJ322MQjwCiPH2YB2RU
   g==;
X-CSE-ConnectionGUID: dbqU2nu/Q+CYyGfMrOqrow==
X-CSE-MsgGUID: hTwFneHhSMeck4Imiq85Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57583806"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57583806"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 02:03:24 -0700
X-CSE-ConnectionGUID: JJlwps+1SwmuaxerRWOmLA==
X-CSE-MsgGUID: kl/LhaB7SiK1hf+wJJcwww==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Aug 2025 02:03:21 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unvlL-000E5D-2c;
	Mon, 18 Aug 2025 09:03:00 +0000
Date: Mon, 18 Aug 2025 17:02:01 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V5 mm-hotfixes 2/3] mm: introduce and use
 {pgd,p4d}_populate_kernel()
Message-ID: <202508181636.0Rtk0T7x-lkp@intel.com>
References: <20250818020206.4517-3-harry.yoo@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818020206.4517-3-harry.yoo@oracle.com>

Hi Harry,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on linus/master v6.17-rc2 next-20250818]
[cannot apply to akpm-mm/mm-everything tip/x86/core tip/x86/mm tip/auto-latest dennis-percpu/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo/mm-move-page-table-sync-declarations-to-linux-pgtable-h/20250818-101531
base:   tip/master
patch link:    https://lore.kernel.org/r/20250818020206.4517-3-harry.yoo%40oracle.com
patch subject: [PATCH V5 mm-hotfixes 2/3] mm: introduce and use {pgd,p4d}_populate_kernel()
config: arm64-randconfig-001-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181636.0Rtk0T7x-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181636.0Rtk0T7x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181636.0Rtk0T7x-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: mm/kasan/init.o: in function `zero_p4d_populate':
>> mm/kasan/init.c:195:(.ref.text+0x374): undefined reference to `kasan_early_shadow_pud'
>> mm/kasan/init.c:195:(.ref.text+0x374): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `kasan_early_shadow_pud'
>> aarch64-linux-ld: mm/kasan/init.c:195:(.ref.text+0x378): undefined reference to `kasan_early_shadow_pud'
   aarch64-linux-ld: mm/kasan/init.o: in function `kasan_populate_early_shadow':
   mm/kasan/init.c:258:(.ref.text+0x41c): undefined reference to `kasan_early_shadow_pud'
   mm/kasan/init.c:258:(.ref.text+0x41c): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `kasan_early_shadow_pud'
   aarch64-linux-ld: mm/kasan/init.c:258:(.ref.text+0x420): undefined reference to `kasan_early_shadow_pud'
>> aarch64-linux-ld: mm/kasan/init.c:255:(.ref.text+0x42c): undefined reference to `kasan_early_shadow_p4d'
>> mm/kasan/init.c:255:(.ref.text+0x42c): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `kasan_early_shadow_p4d'
   aarch64-linux-ld: mm/kasan/init.c:255:(.ref.text+0x430): undefined reference to `kasan_early_shadow_p4d'


vim +195 mm/kasan/init.c

69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  181  
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  182  static int __ref zero_p4d_populate(pgd_t *pgd, unsigned long addr,
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  183  				unsigned long end)
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  184  {
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  185  	p4d_t *p4d = p4d_offset(pgd, addr);
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  186  	unsigned long next;
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  187  
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  188  	do {
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  189  		next = p4d_addr_end(addr, end);
458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  190  		if (IS_ALIGNED(addr, P4D_SIZE) && end - addr >= P4D_SIZE) {
458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  191  			pud_t *pud;
458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  192  			pmd_t *pmd;
458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  193  
a86b0f4e94542c mm/kasan/init.c       Harry Yoo          2025-08-18  194  			p4d_populate_kernel(addr, p4d,
9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28 @195  					lm_alias(kasan_early_shadow_pud));
458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  196  			pud = pud_offset(p4d, addr);
9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  197  			pud_populate(&init_mm, pud,
9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  198  					lm_alias(kasan_early_shadow_pmd));
458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  199  			pmd = pmd_offset(pud, addr);
458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  200  			pmd_populate_kernel(&init_mm, pmd,
9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  201  					lm_alias(kasan_early_shadow_pte));
458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  202  			continue;
458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  203  		}
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  204  
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  205  		if (p4d_none(*p4d)) {
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  206  			pud_t *p;
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  207  
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  208  			if (slab_is_available()) {
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  209  				p = pud_alloc(&init_mm, p4d, addr);
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  210  				if (!p)
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  211  					return -ENOMEM;
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  212  			} else {
fb6d5c1d99ab69 mm/kasan/init.c       Qing Zhang         2023-09-06  213  				p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
fb6d5c1d99ab69 mm/kasan/init.c       Qing Zhang         2023-09-06  214  				pud_init(p);
a86b0f4e94542c mm/kasan/init.c       Harry Yoo          2025-08-18  215  				p4d_populate_kernel(addr, p4d, p);
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  216  			}
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  217  		}
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  218  		zero_pud_populate(p4d, addr, next);
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  219  	} while (p4d++, addr = next, addr != end);
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  220  
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  221  	return 0;
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  222  }
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  223  
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  224  /**
9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  225   * kasan_populate_early_shadow - populate shadow memory region with
9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  226   *                               kasan_early_shadow_page
7b6889f54a3c8c mm/kasan/init.c       Yu Kuai            2021-06-04  227   * @shadow_start: start of the memory range to populate
7b6889f54a3c8c mm/kasan/init.c       Yu Kuai            2021-06-04  228   * @shadow_end: end of the memory range to populate
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  229   */
9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  230  int __ref kasan_populate_early_shadow(const void *shadow_start,
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  231  					const void *shadow_end)
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  232  {
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  233  	unsigned long addr = (unsigned long)shadow_start;
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  234  	unsigned long end = (unsigned long)shadow_end;
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  235  	pgd_t *pgd = pgd_offset_k(addr);
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  236  	unsigned long next;
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  237  
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  238  	do {
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  239  		next = pgd_addr_end(addr, end);
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  240  
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  241  		if (IS_ALIGNED(addr, PGDIR_SIZE) && end - addr >= PGDIR_SIZE) {
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  242  			p4d_t *p4d;
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  243  			pud_t *pud;
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  244  			pmd_t *pmd;
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  245  
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  246  			/*
9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  247  			 * kasan_early_shadow_pud should be populated with pmds
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  248  			 * at this moment.
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  249  			 * [pud,pmd]_populate*() below needed only for
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  250  			 * 3,2 - level page tables where we don't have
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  251  			 * puds,pmds, so pgd_populate(), pud_populate()
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  252  			 * is noops.
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  253  			 */
a86b0f4e94542c mm/kasan/init.c       Harry Yoo          2025-08-18  254  			pgd_populate_kernel(addr, pgd,
9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28 @255  					lm_alias(kasan_early_shadow_p4d));
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  256  			p4d = p4d_offset(pgd, addr);
a86b0f4e94542c mm/kasan/init.c       Harry Yoo          2025-08-18  257  			p4d_populate_kernel(addr, p4d,
9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  258  					lm_alias(kasan_early_shadow_pud));
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  259  			pud = pud_offset(p4d, addr);
9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  260  			pud_populate(&init_mm, pud,
9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  261  					lm_alias(kasan_early_shadow_pmd));
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  262  			pmd = pmd_offset(pud, addr);
9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  263  			pmd_populate_kernel(&init_mm, pmd,
9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  264  					lm_alias(kasan_early_shadow_pte));
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  265  			continue;
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  266  		}
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  267  
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  268  		if (pgd_none(*pgd)) {
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  269  			p4d_t *p;
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  270  
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  271  			if (slab_is_available()) {
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  272  				p = p4d_alloc(&init_mm, pgd, addr);
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  273  				if (!p)
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  274  					return -ENOMEM;
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  275  			} else {
a86b0f4e94542c mm/kasan/init.c       Harry Yoo          2025-08-18  276  				pgd_populate_kernel(addr, pgd,
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  277  					early_alloc(PAGE_SIZE, NUMA_NO_NODE));
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  278  			}
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  279  		}
c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  280  		zero_p4d_populate(pgd, addr, next);
69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  281  	} while (pgd++, addr = next, addr != end);
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  282  
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  283  	return 0;
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  284  }
0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  285  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
