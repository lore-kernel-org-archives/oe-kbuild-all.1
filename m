Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1B0A4E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 20:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688763193; x=1720299193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EZKorzmsJQaAcsuY+ZqNVY2dqyf8jNLlA4Jql4wPP3A=;
  b=KLuz5e3CRzsaKH+np58Uyf9IXKYj8VrdINpXi0g44lBcbruh3MM5mnxy
   OMLtZN0tmNgROYgTPbEvl/Jben87Mv3uj+fPIdAf1+n9haD81d32FQ68x
   0Dkh6FtKHDLSzvaoAwsAyvwIgT2JH9PRocgjO8lM0IWEpUOi+QHXcbdOV
   PRzpgUUCVJ8UoifLNUlhAk0H2ouLzqFdZd6v4EWeIk0W0TS6uVwk2l4nh
   zEbXwyQU3GXBaoMhzTTi/nRJQUM257EPJsGWcgkH7glINQQSViEH3QO93
   XDZqylGdg/OCiSRktEbYaLuldKSHFtbgXUf2xfMJHKimu1ldqE6+9yZYD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="394750046"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="394750046"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 13:53:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="790103834"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="790103834"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Jul 2023 13:53:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHsRx-0002Hq-1t;
	Fri, 07 Jul 2023 20:53:09 +0000
Date: Sat, 8 Jul 2023 04:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 17/37] arch/nios2/mm/cacheflush.c:194:48:
 error: passing argument 2 of 'flush_aliases' from incompatible pointer type
Message-ID: <202307080417.UdjRvCfq-lkp@intel.com>
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
commit: 125fcada3cb2a5fa5f9d8b48f95d730935552948 [17/37] nios2: Implement the new page table range API
config: nios2-randconfig-r021-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080417.UdjRvCfq-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080417.UdjRvCfq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080417.UdjRvCfq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/nios2/mm/cacheflush.c:162:6: warning: no previous prototype for '__flush_dcache_folio' [-Wmissing-prototypes]
     162 | void __flush_dcache_folio(struct address_space *mapping, struct folio *folio)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/nios2/mm/cacheflush.c: In function 'flush_dcache_folio':
>> arch/nios2/mm/cacheflush.c:194:48: error: passing argument 2 of 'flush_aliases' from incompatible pointer type [-Werror=incompatible-pointer-types]
     194 |                         flush_aliases(mapping, folio);
         |                                                ^~~~~
         |                                                |
         |                                                struct folio *
   arch/nios2/mm/cacheflush.c:74:71: note: expected 'struct page *' but argument is of type 'struct folio *'
      74 | static void flush_aliases(struct address_space *mapping, struct page *page)
         |                                                          ~~~~~~~~~~~~~^~~~
   arch/nios2/mm/cacheflush.c: In function 'update_mmu_cache_range':
   arch/nios2/mm/cacheflush.c:234:40: error: passing argument 2 of 'flush_aliases' from incompatible pointer type [-Werror=incompatible-pointer-types]
     234 |                 flush_aliases(mapping, folio);
         |                                        ^~~~~
         |                                        |
         |                                        struct folio *
   arch/nios2/mm/cacheflush.c:74:71: note: expected 'struct page *' but argument is of type 'struct folio *'
      74 | static void flush_aliases(struct address_space *mapping, struct page *page)
         |                                                          ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/flush_aliases +194 arch/nios2/mm/cacheflush.c

   161	
 > 162	void __flush_dcache_folio(struct address_space *mapping, struct folio *folio)
   163	{
   164		/*
   165		 * Writeback any data associated with the kernel mapping of this
   166		 * page.  This ensures that data in the physical page is mutually
   167		 * coherent with the kernels mapping.
   168		 */
   169		unsigned long start = (unsigned long)folio_address(folio);
   170	
   171		__flush_dcache(start, start + folio_size(folio));
   172	}
   173	
   174	void flush_dcache_folio(struct folio *folio)
   175	{
   176		struct address_space *mapping;
   177	
   178		/*
   179		 * The zero page is never written to, so never has any dirty
   180		 * cache lines, and therefore never needs to be flushed.
   181		 */
   182		if (is_zero_pfn(folio_pfn(folio)))
   183			return;
   184	
   185		mapping = folio_flush_mapping(folio);
   186	
   187		/* Flush this page if there are aliases. */
   188		if (mapping && !mapping_mapped(mapping)) {
   189			clear_bit(PG_dcache_clean, &folio->flags);
   190		} else {
   191			__flush_dcache_folio(mapping, folio);
   192			if (mapping) {
   193				unsigned long start = (unsigned long)folio_address(folio);
 > 194				flush_aliases(mapping, folio);
   195				flush_icache_range(start, start + folio_size(folio));
   196			}
   197			set_bit(PG_dcache_clean, &folio->flags);
   198		}
   199	}
   200	EXPORT_SYMBOL(flush_dcache_folio);
   201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
