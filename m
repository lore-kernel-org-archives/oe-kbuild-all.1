Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798E61855
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 08:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688806528; x=1720342528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N4AoDeUeqe4adc086+Fy5jh4RmxARfI23SvgIuuTylo=;
  b=XHfEjzmlyg2v/R00FpWHYjKcGtHoqB4Bwhlf2IgC+fqkEfl/pf5GkW29
   1aeVumXAd8pe6lPnFYUafEHOi0Jdm8mlPuEnyTFPN6r1DRAbBuY3UILbe
   i3biK2zdJ0JHAyySGlYd3t2nnck0g4aUsz4mCh5ZS79j1YvOm246rgFG3
   RJ1pbDdYgNa6UarwjuZXmVuL/iiM2fPqBId/vC81tN/lTyPeGHLmixgQk
   +SxnkG6pQlkTjADEegJ6JPp32r5QuCCK50w+uOZr6UjOgiPAVEU1iHENY
   i6lxjk7aiZLMvsHH3iDQbLLDZ0SD4f+8ASzJUV5dwgRF2nZFI81BvGSMA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="394820461"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="394820461"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 01:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="810290331"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="810290331"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2023 01:55:24 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qI3it-0002dw-2w;
	Sat, 08 Jul 2023 08:55:23 +0000
Date: Sat, 8 Jul 2023 16:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 22/38] arch/riscv/mm/cacheflush.c:89:43:
 error: 'page' undeclared
Message-ID: <202307081635.WjzcLZTk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   22fbf134ccc05ced10ef4638c97474c2cdd64ff8
commit: 1e39f11814e143e354fbecf6be24fe5663bd28a2 [22/38] riscv: Implement the new page table range API
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230708/202307081635.WjzcLZTk-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307081635.WjzcLZTk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307081635.WjzcLZTk-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/mm/cacheflush.c: In function 'flush_icache_pte':
>> arch/riscv/mm/cacheflush.c:89:43: error: 'page' undeclared (first use in this function)
      89 |                 set_bit(PG_dcache_clean, &page->flags);
         |                                           ^~~~
   arch/riscv/mm/cacheflush.c:89:43: note: each undeclared identifier is reported only once for each function it appears in


vim +/page +89 arch/riscv/mm/cacheflush.c

58de77545e53b9 Gary Guo                2019-03-27  81  
6bd33e1ece528f Christoph Hellwig       2019-10-28  82  #ifdef CONFIG_MMU
08f051eda33b51 Andrew Waterman         2017-10-25  83  void flush_icache_pte(pte_t pte)
08f051eda33b51 Andrew Waterman         2017-10-25  84  {
1e39f11814e143 Matthew Wilcox (Oracle  2023-02-13  85) 	struct folio *folio = page_folio(pte_page(pte));
08f051eda33b51 Andrew Waterman         2017-10-25  86  
1e39f11814e143 Matthew Wilcox (Oracle  2023-02-13  87) 	if (!test_bit(PG_dcache_clean, &folio->flags)) {
08f051eda33b51 Andrew Waterman         2017-10-25  88  		flush_icache_all();
950b879b7f0251 Guo Ren                 2023-01-26 @89  		set_bit(PG_dcache_clean, &page->flags);
950b879b7f0251 Guo Ren                 2023-01-26  90  	}
08f051eda33b51 Andrew Waterman         2017-10-25  91  }
6bd33e1ece528f Christoph Hellwig       2019-10-28  92  #endif /* CONFIG_MMU */
5c20a3a9df1981 Andrew Jones            2022-10-21  93  

:::::: The code at line 89 was first introduced by commit
:::::: 950b879b7f0251317d26bae0687e72592d607532 riscv: Fixup race condition on PG_dcache_clean in flush_icache_pte

:::::: TO: Guo Ren <guoren@linux.alibaba.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
