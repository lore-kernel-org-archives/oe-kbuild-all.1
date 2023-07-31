Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCB51DDC5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 22:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690841210; x=1722377210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7h29BWEjhc5ARtyLmiHTjL+6rHUMCiFLJTGvRIFFQDU=;
  b=eo9+ARDKLzX6drrVXZWU6nA6rSHB6a9YC+Xib24SRT7s1aPuvcfdB39a
   HAoZ2De0td8MBsQsuuNc8qrRHjQMY0fo7erw2GMRsQEGNPOFNpx9yAzx2
   OONCU1FXpVvjDJ5x7tPbm+CW1fHLSevzoXDEV8IYBBMZMIhmFLGOmiWw1
   t3OPTp/CdsU54Sa2ft5aJeTNg6siJ+jDuNmC+7PkzYCWLnIvTI8VKo1at
   RtvNlgxcvdQqZZioRfmQ9LIsV4VFbF9Yu5vCrW9ywVOaQoe/43SI34VH+
   LTam0rzhnRb1J+a9GY5TJpOkfMyH9G+QnxzIechw0/dtAXh1Yp9jhb1/Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="354057765"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="354057765"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 15:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="705584306"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="705584306"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 31 Jul 2023 15:06:41 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQb2G-0005P9-2Q;
	Mon, 31 Jul 2023 22:06:40 +0000
Date: Tue, 1 Aug 2023 06:05:50 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 25/38]
 arch/sparc/include/asm/cacheflush_32.h:46:28: error: implicit declaration of
 function 'page_folio'
Message-ID: <202308010517.0oSf0Jty-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   5e7db769b94c0abd184e56c90f1f89554e9f0639
commit: 7d045092c4e5ea60de796aed1cce6e1239a300ca [25/38] sparc32: Implement the new page table range API
config: sparc-randconfig-r023-20230731 (https://download.01.org/0day-ci/archive/20230801/202308010517.0oSf0Jty-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010517.0oSf0Jty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010517.0oSf0Jty-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/cacheflush.h:11,
                    from include/linux/cacheflush.h:5,
                    from drivers/crypto/xilinx/zynqmp-sha.c:6:
   arch/sparc/include/asm/cacheflush_32.h:39:37: warning: 'struct page' declared inside parameter list will not be visible outside of this definition or declaration
      39 | void sparc_flush_page_to_ram(struct page *page);
         |                                     ^~~~
   arch/sparc/include/asm/cacheflush_32.h:40:38: warning: 'struct folio' declared inside parameter list will not be visible outside of this definition or declaration
      40 | void sparc_flush_folio_to_ram(struct folio *folio);
         |                                      ^~~~~
   arch/sparc/include/asm/cacheflush_32.h:44:45: warning: 'struct page' declared inside parameter list will not be visible outside of this definition or declaration
      44 | static inline void flush_dcache_page(struct page *page)
         |                                             ^~~~
   arch/sparc/include/asm/cacheflush_32.h: In function 'flush_dcache_page':
>> arch/sparc/include/asm/cacheflush_32.h:46:28: error: implicit declaration of function 'page_folio' [-Werror=implicit-function-declaration]
      46 |         flush_dcache_folio(page_folio(page));
         |                            ^~~~~~~~~~
   arch/sparc/include/asm/cacheflush_32.h:43:74: note: in definition of macro 'flush_dcache_folio'
      43 | #define flush_dcache_folio(folio)               sparc_flush_folio_to_ram(folio)
         |                                                                          ^~~~~
   arch/sparc/include/asm/cacheflush_32.h:46:28: warning: passing argument 1 of 'sparc_flush_folio_to_ram' makes pointer from integer without a cast [-Wint-conversion]
      46 |         flush_dcache_folio(page_folio(page));
         |                            ^~~~~~~~~~~~~~~~
         |                            |
         |                            int
   arch/sparc/include/asm/cacheflush_32.h:43:74: note: in definition of macro 'flush_dcache_folio'
      43 | #define flush_dcache_folio(folio)               sparc_flush_folio_to_ram(folio)
         |                                                                          ^~~~~
   arch/sparc/include/asm/cacheflush_32.h:40:45: note: expected 'struct folio *' but argument is of type 'int'
      40 | void sparc_flush_folio_to_ram(struct folio *folio);
         |                               ~~~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors


vim +/page_folio +46 arch/sparc/include/asm/cacheflush_32.h

    41	
    42	#define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
    43	#define flush_dcache_folio(folio)		sparc_flush_folio_to_ram(folio)
    44	static inline void flush_dcache_page(struct page *page)
    45	{
  > 46		flush_dcache_folio(page_folio(page));
    47	}
    48	#define flush_dcache_mmap_lock(mapping)		do { } while (0)
    49	#define flush_dcache_mmap_unlock(mapping)	do { } while (0)
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
