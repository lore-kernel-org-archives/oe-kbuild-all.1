Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8813919BD5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 19:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690831038; x=1722367038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oeVuUVkl3fLGz0wGUT2pOIornhho82Lq6arcpMCu1zU=;
  b=C40RFlKD6E7SGSIgpv7Cz7LBjWXwvMla7tFzI+tAm+Lj1z06Y9awDvem
   Tu8/r895SEui7g1Rf8bMZ0sCGkZPiWnUzUE3ts2ocEyNXuEF2vZoC/lQ5
   QBpv1PT8bvy6rEYVvgV1R/0/2iGcG4LDMUvQ5tbISg2uI5H2P8IG07JLA
   ybl0bGp9s/GGHGMRgxyZgdF83CkasbQbKP5GjDL/Ab+rTEjxTBjvcWcBF
   qOTkMuzVWvNIrmohbkOfEMug4N89BK8kNcjJvz08No/ZGI3049ZgBKWDm
   gomZksHTOGNYukUJSywTQmnpOo1QCBgZ/1rlNTnCBq+/tKUJcCvl0ttRj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="455483037"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="455483037"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 12:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="793837416"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="793837416"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 31 Jul 2023 12:17:12 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQYO8-0005J9-0C;
	Mon, 31 Jul 2023 19:17:05 +0000
Date: Tue, 1 Aug 2023 03:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 25/38]
 arch/sparc/include/asm/cacheflush_32.h:39:37: warning: 'struct page'
 declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202308010337.BUL3k9Pl-lkp@intel.com>
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
commit: 7d045092c4e5ea60de796aed1cce6e1239a300ca [25/38] sparc32: Implement the new page table range API
config: sparc-randconfig-r023-20230731 (https://download.01.org/0day-ci/archive/20230801/202308010337.BUL3k9Pl-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010337.BUL3k9Pl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010337.BUL3k9Pl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/cacheflush.h:11,
                    from include/linux/cacheflush.h:5,
                    from drivers/crypto/xilinx/zynqmp-sha.c:6:
>> arch/sparc/include/asm/cacheflush_32.h:39:37: warning: 'struct page' declared inside parameter list will not be visible outside of this definition or declaration
      39 | void sparc_flush_page_to_ram(struct page *page);
         |                                     ^~~~
>> arch/sparc/include/asm/cacheflush_32.h:40:38: warning: 'struct folio' declared inside parameter list will not be visible outside of this definition or declaration
      40 | void sparc_flush_folio_to_ram(struct folio *folio);
         |                                      ^~~~~
   arch/sparc/include/asm/cacheflush_32.h:44:45: warning: 'struct page' declared inside parameter list will not be visible outside of this definition or declaration
      44 | static inline void flush_dcache_page(struct page *page)
         |                                             ^~~~
   arch/sparc/include/asm/cacheflush_32.h: In function 'flush_dcache_page':
   arch/sparc/include/asm/cacheflush_32.h:46:28: error: implicit declaration of function 'page_folio' [-Werror=implicit-function-declaration]
      46 |         flush_dcache_folio(page_folio(page));
         |                            ^~~~~~~~~~
   arch/sparc/include/asm/cacheflush_32.h:43:74: note: in definition of macro 'flush_dcache_folio'
      43 | #define flush_dcache_folio(folio)               sparc_flush_folio_to_ram(folio)
         |                                                                          ^~~~~
>> arch/sparc/include/asm/cacheflush_32.h:46:28: warning: passing argument 1 of 'sparc_flush_folio_to_ram' makes pointer from integer without a cast [-Wint-conversion]
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


vim +39 arch/sparc/include/asm/cacheflush_32.h

f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  20  
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  21  #define copy_to_user_page(vma, page, vaddr, dst, src, len) \
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  22  	do {							\
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  23  		flush_cache_page(vma, vaddr, page_to_pfn(page));\
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  24  		memcpy(dst, src, len);				\
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  25  	} while (0)
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  26  #define copy_from_user_page(vma, page, vaddr, dst, src, len) \
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  27  	do {							\
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  28  		flush_cache_page(vma, vaddr, page_to_pfn(page));\
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  29  		memcpy(dst, src, len);				\
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  30  	} while (0)
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  31  
5d83d66635bb16 arch/sparc/include/asm/cacheflush_32.h David S. Miller         2012-05-13  32  #define __flush_page_to_ram(addr) \
5d83d66635bb16 arch/sparc/include/asm/cacheflush_32.h David S. Miller         2012-05-13  33  	sparc32_cachetlb_ops->page_to_ram(addr)
5d83d66635bb16 arch/sparc/include/asm/cacheflush_32.h David S. Miller         2012-05-13  34  #define flush_sig_insns(mm,insn_addr) \
5d83d66635bb16 arch/sparc/include/asm/cacheflush_32.h David S. Miller         2012-05-13  35  	sparc32_cachetlb_ops->sig_insns(mm, insn_addr)
5d83d66635bb16 arch/sparc/include/asm/cacheflush_32.h David S. Miller         2012-05-13  36  #define flush_page_for_dma(addr) \
5d83d66635bb16 arch/sparc/include/asm/cacheflush_32.h David S. Miller         2012-05-13  37  	sparc32_cachetlb_ops->page_for_dma(addr)
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  38  
f05a68653e56ca arch/sparc/include/asm/cacheflush_32.h Sam Ravnborg            2014-05-16 @39  void sparc_flush_page_to_ram(struct page *page);
7d045092c4e5ea arch/sparc/include/asm/cacheflush_32.h Matthew Wilcox (Oracle  2023-02-13 @40) void sparc_flush_folio_to_ram(struct folio *folio);
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  41  
2d4dc890b5c8fa arch/sparc/include/asm/cacheflush_32.h Ilya Loginov            2009-11-26  42  #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
7d045092c4e5ea arch/sparc/include/asm/cacheflush_32.h Matthew Wilcox (Oracle  2023-02-13  43) #define flush_dcache_folio(folio)		sparc_flush_folio_to_ram(folio)
7d045092c4e5ea arch/sparc/include/asm/cacheflush_32.h Matthew Wilcox (Oracle  2023-02-13  44) static inline void flush_dcache_page(struct page *page)
7d045092c4e5ea arch/sparc/include/asm/cacheflush_32.h Matthew Wilcox (Oracle  2023-02-13  45) {
7d045092c4e5ea arch/sparc/include/asm/cacheflush_32.h Matthew Wilcox (Oracle  2023-02-13 @46) 	flush_dcache_folio(page_folio(page));
7d045092c4e5ea arch/sparc/include/asm/cacheflush_32.h Matthew Wilcox (Oracle  2023-02-13  47) }
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  48  #define flush_dcache_mmap_lock(mapping)		do { } while (0)
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  49  #define flush_dcache_mmap_unlock(mapping)	do { } while (0)
f5e706ad886b6a include/asm-sparc/cacheflush_32.h      Sam Ravnborg            2008-07-17  50  

:::::: The code at line 39 was first introduced by commit
:::::: f05a68653e56ca2f23bccf7e50be69486886f052 sparc: drop use of extern for prototypes in arch/sparc/include/asm

:::::: TO: Sam Ravnborg <sam@ravnborg.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
