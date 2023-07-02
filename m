Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB941C02
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jul 2023 13:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688304401; x=1719840401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f6Pxt3/+BMe8Ve7v7MnwEcB09aUZpmPApPGzeOC39u0=;
  b=VCS3cnmj/agtMoT8tem9jzq443YLB29Azse6seinqMRTjJMQjCRfx/6i
   F63iNYAvp7YjezhBJci0l3m0122xFFiqtfG9q6dXgcgaPGBQqud1scBga
   HxZZLodiKlQyeFDyTZJZsEx7dgqCV3dA9OZkmiqGrXx5LrO9ssWhaY7/Q
   I9DtLfWcN2JNKcS5O3VXH2qdswquiy1uKmJrQTmX8TCKO1D3rGEWqbuPM
   I1RLO6cxF8YsFQ9APH7R+5l97768Hff+Trzou00VuNk0wSeN7qBCMEM8R
   7/eI1fH4OrpgwiDYN4iuJkCtKK7rvkIFcF0rP5o5tQkNDS9XHcz1eEVMK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="366183796"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="366183796"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 06:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="783591740"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="783591740"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Jul 2023 06:26:39 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFx67-000GfM-0d;
	Sun, 02 Jul 2023 13:26:39 +0000
Date: Sun, 2 Jul 2023 21:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:vhost-page-frag 1/2] include/linux/gfp.h:316:33: error:
 implicit declaration of function 'virt_to_head_page'; did you mean
 'virt_to_page'?
Message-ID: <202307022104.3K7w5ZCu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git vhost-page-frag
head:   43d9a865a0a23c03923aae2db7a33d78be36c595
commit: 53f6f24c5ff57ba7933cab95bb643d725484ea38 [1/2] net: introduce page_frag_cache_drain()
config: arc-randconfig-r043-20230702 (https://download.01.org/0day-ci/archive/20230702/202307022104.3K7w5ZCu-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230702/202307022104.3K7w5ZCu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307022104.3K7w5ZCu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:7,
                    from arch/arc/kernel/asm-offsets.c:7:
   include/linux/gfp.h: In function 'page_frag_cache_drain':
>> include/linux/gfp.h:316:33: error: implicit declaration of function 'virt_to_head_page'; did you mean 'virt_to_page'? [-Werror=implicit-function-declaration]
     316 |         __page_frag_cache_drain(virt_to_head_page(nc->va), nc->pagecnt_bias);
         |                                 ^~~~~~~~~~~~~~~~~
         |                                 virt_to_page
>> include/linux/gfp.h:316:33: warning: passing argument 1 of '__page_frag_cache_drain' makes pointer from integer without a cast [-Wint-conversion]
     316 |         __page_frag_cache_drain(virt_to_head_page(nc->va), nc->pagecnt_bias);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 int
   include/linux/gfp.h:306:50: note: expected 'struct page *' but argument is of type 'int'
     306 | extern void __page_frag_cache_drain(struct page *page, unsigned int count);
         |                                     ~~~~~~~~~~~~~^~~~
   include/linux/mm.h: At top level:
>> include/linux/mm.h:1169:28: error: conflicting types for 'virt_to_head_page'; have 'struct page *(const void *)'
    1169 | static inline struct page *virt_to_head_page(const void *x)
         |                            ^~~~~~~~~~~~~~~~~
   include/linux/gfp.h:316:33: note: previous implicit declaration of 'virt_to_head_page' with type 'int()'
     316 |         __page_frag_cache_drain(virt_to_head_page(nc->va), nc->pagecnt_bias);
         |                                 ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/arc/kernel/asm-offsets.s] Error 1 shuffle=1237481610
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1287: prepare0] Error 2 shuffle=1237481610
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2 shuffle=1237481610
   make: Target 'prepare' not remade because of errors.


vim +316 include/linux/gfp.h

   304	
   305	struct page_frag_cache;
   306	extern void __page_frag_cache_drain(struct page *page, unsigned int count);
   307	extern void *page_frag_alloc_align(struct page_frag_cache *nc,
   308					   unsigned int fragsz, gfp_t gfp_mask,
   309					   unsigned int align_mask);
   310	
   311	static inline void page_frag_cache_drain(struct page_frag_cache *nc)
   312	{
   313		if (!nc->va)
   314			return;
   315	
 > 316		__page_frag_cache_drain(virt_to_head_page(nc->va), nc->pagecnt_bias);
   317		nc->va = NULL;
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
