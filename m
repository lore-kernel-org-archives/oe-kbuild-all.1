Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1681FA6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 10:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691578172; x=1723114172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1dWlbVvjbHktKkkhHOvrugt7na/mwPiT2H1SU5mAKdM=;
  b=GKQMYdi+vH6Mb3u/BK5mJXnGUg0VTbLayX5El0K3Wc3FVeMi2e2tf1VV
   UhRK9SZTCWYWJjJodLYxQTrNJ3444FyrsiY7Z5YabacCa5mH96T4Vj5QT
   zDcIvpeH+OZlYBgfVnQqNVS/zDbGjQKfyxDFQtemneV7JlG7oGSouegLe
   V2MFsAKpZRiQcYk+X+XWjYyK4+A6UUgXsZCzfBIkeWFp+79t/xpYnXKZ7
   sGvafEJk5610x4atjeFeCO5P6dLO2G6h+lMtiDxpDak3CJsB3a370EmS8
   ACI3DM3cuRSOc+9SZ5Plfa8xAtv8HziumO3wGwFMbBoewArxCN5uDQSsM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369991728"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="369991728"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 03:49:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681631383"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="681631383"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Aug 2023 03:49:30 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTgkr-00062i-1Z;
	Wed, 09 Aug 2023 10:49:29 +0000
Date: Wed, 9 Aug 2023 18:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-s390 2/2] mm/kfence/core.c:905:23:
 warning: assignment discards 'const' qualifier from pointer target type
Message-ID: <202308091858.9WZkiTgp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-s390
head:   8ecc52ceb357c56a3841a03f5743120a217d08b0
commit: 8ecc52ceb357c56a3841a03f5743120a217d08b0 [2/2] s390/mm: Make virt_to_pfn() a static inline
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230809/202308091858.9WZkiTgp-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091858.9WZkiTgp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091858.9WZkiTgp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/include/asm/thread_info.h:31,
                    from include/linux/thread_info.h:60,
                    from arch/s390/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/debugfs.h:15,
                    from mm/kfence/core.c:12:
   include/linux/mm.h: In function 'lowmem_page_address':
   arch/s390/include/asm/page.h:207:33: warning: return discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     207 | #define page_to_virt(page)      pfn_to_virt(page_to_pfn(page))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:2120:16: note: in expansion of macro 'page_to_virt'
    2120 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
   In file included from arch/s390/include/asm/page.h:215:
   arch/s390/include/asm/kfence.h: In function 'kfence_protect_page':
   arch/s390/include/asm/kfence.h:38:41: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
      38 |         __kernel_map_pages(virt_to_page(addr), 1, !protect);
         |                                         ^~~~
         |                                         |
         |                                         long unsigned int
   include/asm-generic/memory_model.h:37:45: note: in definition of macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   arch/s390/include/asm/kfence.h:38:28: note: in expansion of macro 'virt_to_page'
      38 |         __kernel_map_pages(virt_to_page(addr), 1, !protect);
         |                            ^~~~~~~~~~~~
   arch/s390/include/asm/page.h:199:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     199 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   mm/kfence/core.c: In function 'kfence_init_late':
>> mm/kfence/core.c:905:23: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     905 |         __kfence_pool = page_to_virt(pages);
         |                       ^


vim +/const +905 mm/kfence/core.c

b33f778bba5ef3 Tianchen Ding       2022-03-22  895  
b33f778bba5ef3 Tianchen Ding       2022-03-22  896  static int kfence_init_late(void)
b33f778bba5ef3 Tianchen Ding       2022-03-22  897  {
b33f778bba5ef3 Tianchen Ding       2022-03-22  898  	const unsigned long nr_pages = KFENCE_POOL_SIZE / PAGE_SIZE;
b33f778bba5ef3 Tianchen Ding       2022-03-22  899  #ifdef CONFIG_CONTIG_ALLOC
b33f778bba5ef3 Tianchen Ding       2022-03-22  900  	struct page *pages;
b33f778bba5ef3 Tianchen Ding       2022-03-22  901  
b33f778bba5ef3 Tianchen Ding       2022-03-22  902  	pages = alloc_contig_pages(nr_pages, GFP_KERNEL, first_online_node, NULL);
b33f778bba5ef3 Tianchen Ding       2022-03-22  903  	if (!pages)
b33f778bba5ef3 Tianchen Ding       2022-03-22  904  		return -ENOMEM;
b33f778bba5ef3 Tianchen Ding       2022-03-22 @905  	__kfence_pool = page_to_virt(pages);
b33f778bba5ef3 Tianchen Ding       2022-03-22  906  #else
b33f778bba5ef3 Tianchen Ding       2022-03-22  907  	if (nr_pages > MAX_ORDER_NR_PAGES) {
b33f778bba5ef3 Tianchen Ding       2022-03-22  908  		pr_warn("KFENCE_NUM_OBJECTS too large for buddy allocator\n");
b33f778bba5ef3 Tianchen Ding       2022-03-22  909  		return -EINVAL;
b33f778bba5ef3 Tianchen Ding       2022-03-22  910  	}
b33f778bba5ef3 Tianchen Ding       2022-03-22  911  	__kfence_pool = alloc_pages_exact(KFENCE_POOL_SIZE, GFP_KERNEL);
b33f778bba5ef3 Tianchen Ding       2022-03-22  912  	if (!__kfence_pool)
b33f778bba5ef3 Tianchen Ding       2022-03-22  913  		return -ENOMEM;
b33f778bba5ef3 Tianchen Ding       2022-03-22  914  #endif
b33f778bba5ef3 Tianchen Ding       2022-03-22  915  
b33f778bba5ef3 Tianchen Ding       2022-03-22  916  	if (!kfence_init_pool_late()) {
b33f778bba5ef3 Tianchen Ding       2022-03-22  917  		pr_err("%s failed\n", __func__);
b33f778bba5ef3 Tianchen Ding       2022-03-22  918  		return -EBUSY;
b33f778bba5ef3 Tianchen Ding       2022-03-22  919  	}
b33f778bba5ef3 Tianchen Ding       2022-03-22  920  
b33f778bba5ef3 Tianchen Ding       2022-03-22  921  	kfence_init_enable();
1c86a188e03156 Muchun Song         2023-03-15  922  	kfence_debugfs_init();
1c86a188e03156 Muchun Song         2023-03-15  923  
b33f778bba5ef3 Tianchen Ding       2022-03-22  924  	return 0;
0ce20dd840897b Alexander Potapenko 2021-02-25  925  }
0ce20dd840897b Alexander Potapenko 2021-02-25  926  

:::::: The code at line 905 was first introduced by commit
:::::: b33f778bba5ef3f76fe6708c611346c1ea03acd4 kfence: alloc kfence_pool after system startup

:::::: TO: Tianchen Ding <dtcccc@linux.alibaba.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
