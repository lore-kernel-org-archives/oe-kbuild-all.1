Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D03E19BD5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 19:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690832940; x=1722368940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yqp0yYDHCZk3jcMAZuSfHZex1swA/M82gIKYxM6XKtM=;
  b=iFCLZeiSg9vEJ3MGuSoF+aNVaikEp5Hgodmvpx9KfxD74xLTIh29m0Q1
   u4Xrk8LhGAVsQra4jFnEoAV1Lja0rwQcXle30CCjpWwHqeIikdyEwSchD
   cxvVTb0sAP+iKP8V2V2UXyyqKWfmA6877UuWY9oeY3paL49t6ansqD+/d
   bqxCIEegPUe7+ZxRUrshHE/fAKjX1yk9yZIzGe7GEvkm61N4cjcT3k/WL
   xxUriecDVlMkYKtMk/+1QBdVZcvf9t+EnI6fPA1w2O+gKDoZH8nwTM9gl
   xfdtPyJyEhX5f1K37G48bCIX0XLh+CHR8mH83uSvOwCcX2DhX4NQBqlNX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="359150683"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="359150683"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 12:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="842418749"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="842418749"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2023 12:48:58 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQYsz-0005KF-1Z;
	Mon, 31 Jul 2023 19:48:57 +0000
Date: Tue, 1 Aug 2023 03:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 31/38] include/linux/cacheflush.h:22:45:
 warning: 'struct page' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202308010357.4gZHdLiN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   ff0989edbd50c98f920d5ab686a71274298fdd76
commit: d31e5c728bc9b8fcc76e2ad862c04a876e0d4a94 [31/38] mm: Rationalise flush_icache_pages() and flush_icache_page()
config: sparc-randconfig-r023-20230731 (https://download.01.org/0day-ci/archive/20230801/202308010357.4gZHdLiN-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010357.4gZHdLiN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010357.4gZHdLiN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/cacheflush.h:11,
                    from include/linux/cacheflush.h:5,
                    from drivers/crypto/xilinx/zynqmp-sha.c:6:
   arch/sparc/include/asm/cacheflush_32.h:37:37: warning: 'struct page' declared inside parameter list will not be visible outside of this definition or declaration
      37 | void sparc_flush_page_to_ram(struct page *page);
         |                                     ^~~~
   arch/sparc/include/asm/cacheflush_32.h:38:38: warning: 'struct folio' declared inside parameter list will not be visible outside of this definition or declaration
      38 | void sparc_flush_folio_to_ram(struct folio *folio);
         |                                      ^~~~~
   arch/sparc/include/asm/cacheflush_32.h:42:45: warning: 'struct page' declared inside parameter list will not be visible outside of this definition or declaration
      42 | static inline void flush_dcache_page(struct page *page)
         |                                             ^~~~
   arch/sparc/include/asm/cacheflush_32.h: In function 'flush_dcache_page':
   arch/sparc/include/asm/cacheflush_32.h:44:28: error: implicit declaration of function 'page_folio' [-Werror=implicit-function-declaration]
      44 |         flush_dcache_folio(page_folio(page));
         |                            ^~~~~~~~~~
   arch/sparc/include/asm/cacheflush_32.h:41:74: note: in definition of macro 'flush_dcache_folio'
      41 | #define flush_dcache_folio(folio)               sparc_flush_folio_to_ram(folio)
         |                                                                          ^~~~~
   arch/sparc/include/asm/cacheflush_32.h:44:28: warning: passing argument 1 of 'sparc_flush_folio_to_ram' makes pointer from integer without a cast [-Wint-conversion]
      44 |         flush_dcache_folio(page_folio(page));
         |                            ^~~~~~~~~~~~~~~~
         |                            |
         |                            int
   arch/sparc/include/asm/cacheflush_32.h:41:74: note: in definition of macro 'flush_dcache_folio'
      41 | #define flush_dcache_folio(folio)               sparc_flush_folio_to_ram(folio)
         |                                                                          ^~~~~
   arch/sparc/include/asm/cacheflush_32.h:38:45: note: expected 'struct folio *' but argument is of type 'int'
      38 | void sparc_flush_folio_to_ram(struct folio *folio);
         |                               ~~~~~~~~~~~~~~^~~~~
   include/linux/cacheflush.h: At top level:
>> include/linux/cacheflush.h:22:45: warning: 'struct page' declared inside parameter list will not be visible outside of this definition or declaration
      22 |                                      struct page *page, unsigned int nr)
         |                                             ^~~~
   cc1: some warnings being treated as errors


vim +22 include/linux/cacheflush.h

    19	
    20	#ifndef flush_icache_pages
    21	static inline void flush_icache_pages(struct vm_area_struct *vma,
  > 22					     struct page *page, unsigned int nr)
    23	{
    24	}
    25	#endif
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
