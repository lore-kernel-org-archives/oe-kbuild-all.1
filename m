Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC55C2CB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 18:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682620514; x=1714156514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B952ZQbHUgyA4AtBLXSam806e9fSQ6kyCQxx2wmr8YY=;
  b=CwAL/w3Zkkf0unvrMqFRIQnMcRJZQpHcW4CvAPtvD62Ou3yb7RhootT4
   7zUi2MGULvzt2MwKyifqRumz88PVTISaTxENErqzEmZbUWlZleHa3sYqr
   BSdWEncbce0T09l9Exbxk01IzP8mZcoaFf5qo4gGKeRGCQjgv7a9DV30N
   QDm8oXHNSE5vKXjE+RCvLtGrNFcuXBU7fdWDjrr+aWQOg0pS5X8KKJnRp
   Q7AY8u2++phS5BPfI+jFhUtUtPtnProo5Y1pIMSia8ESZFBgXpGRmE7JE
   aBBJa9rZoDCun+OuTzFHdfBtypSEzTf8/5Kw/tRixIhmt9E/vPrJQKxT7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="331818971"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="331818971"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 11:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="838514232"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="838514232"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2023 11:33:24 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps6Ql-000041-1q;
	Thu, 27 Apr 2023 18:33:23 +0000
Date: Fri, 28 Apr 2023 02:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/ttm/ttm_pool.c:378:22: sparse: sparse: incompatible
 types in comparison expression (different type sizes):
Message-ID: <202304280209.rz6syGWG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core61-58
head:   35a3169c34b511417772fc39505bd841ca6b275c
commit: 488c5dc8526b11ef7e565e4094620876ebb470f8 UPSTREAM: drm/ttm: new TT backend allocation pool v3
date:   2 years ago
config: arc-randconfig-s042-20230427 (https://download.01.org/0day-ci/archive/20230428/202304280209.rz6syGWG-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=488c5dc8526b11ef7e565e4094620876ebb470f8
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core61-58
        git checkout 488c5dc8526b11ef7e565e4094620876ebb470f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280209.rz6syGWG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/ttm/ttm_pool.c:378:22: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> drivers/gpu/drm/ttm/ttm_pool.c:378:22: sparse:    unsigned long *
>> drivers/gpu/drm/ttm/ttm_pool.c:378:22: sparse:    int *
   drivers/gpu/drm/ttm/ttm_pool.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
   arch/arc/include/asm/bitops.h:319:17: sparse: sparse: undefined identifier '__builtin_arc_fls'

vim +378 drivers/gpu/drm/ttm/ttm_pool.c

   339	
   340	/**
   341	 * ttm_pool_alloc - Fill a ttm_tt object
   342	 *
   343	 * @pool: ttm_pool to use
   344	 * @tt: ttm_tt object to fill
   345	 * @ctx: operation context
   346	 *
   347	 * Fill the ttm_tt object with pages and also make sure to DMA map them when
   348	 * necessary.
   349	 *
   350	 * Returns: 0 on successe, negative error code otherwise.
   351	 */
   352	int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
   353			   struct ttm_operation_ctx *ctx)
   354	{
   355		unsigned long num_pages = tt->num_pages;
   356		dma_addr_t *dma_addr = tt->dma_address;
   357		struct page **caching = tt->pages;
   358		struct page **pages = tt->pages;
   359		gfp_t gfp_flags = GFP_USER;
   360		unsigned int i, order;
   361		struct page *p;
   362		int r;
   363	
   364		WARN_ON(!num_pages || ttm_tt_is_populated(tt));
   365		WARN_ON(dma_addr && !pool->dev);
   366	
   367		if (tt->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)
   368			gfp_flags |= __GFP_ZERO;
   369	
   370		if (tt->page_flags & TTM_PAGE_FLAG_NO_RETRY)
   371			gfp_flags |= __GFP_RETRY_MAYFAIL;
   372	
   373		if (pool->use_dma32)
   374			gfp_flags |= GFP_DMA32;
   375		else
   376			gfp_flags |= GFP_HIGHUSER;
   377	
 > 378		for (order = min(MAX_ORDER - 1UL, __fls(num_pages)); num_pages;
   379		     order = min_t(unsigned int, order, __fls(num_pages))) {
   380			bool apply_caching = false;
   381			struct ttm_pool_type *pt;
   382	
   383			pt = ttm_pool_select_type(pool, tt->caching, order);
   384			p = pt ? ttm_pool_type_take(pt) : NULL;
   385			if (p) {
   386				apply_caching = true;
   387			} else {
   388				p = ttm_pool_alloc_page(pool, gfp_flags, order);
   389				if (p && PageHighMem(p))
   390					apply_caching = true;
   391			}
   392	
   393			if (!p) {
   394				if (order) {
   395					--order;
   396					continue;
   397				}
   398				r = -ENOMEM;
   399				goto error_free_all;
   400			}
   401	
   402			if (apply_caching) {
   403				r = ttm_pool_apply_caching(caching, pages,
   404							   tt->caching);
   405				if (r)
   406					goto error_free_page;
   407				caching = pages + (1 << order);
   408			}
   409	
   410			r = ttm_mem_global_alloc_page(&ttm_mem_glob, p,
   411						      (1 << order) * PAGE_SIZE,
   412						      ctx);
   413			if (r)
   414				goto error_free_page;
   415	
   416			if (dma_addr) {
   417				r = ttm_pool_map(pool, order, p, &dma_addr);
   418				if (r)
   419					goto error_global_free;
   420			}
   421	
   422			num_pages -= 1 << order;
   423			for (i = 1 << order; i; --i)
   424				*(pages++) = p++;
   425		}
   426	
   427		r = ttm_pool_apply_caching(caching, pages, tt->caching);
   428		if (r)
   429			goto error_free_all;
   430	
   431		return 0;
   432	
   433	error_global_free:
   434		ttm_mem_global_free_page(&ttm_mem_glob, p, (1 << order) * PAGE_SIZE);
   435	
   436	error_free_page:
   437		ttm_pool_free_page(pool, tt->caching, order, p);
   438	
   439	error_free_all:
   440		num_pages = tt->num_pages - num_pages;
   441		for (i = 0; i < num_pages; ) {
   442			order = ttm_pool_page_order(pool, tt->pages[i]);
   443			ttm_pool_free_page(pool, tt->caching, order, tt->pages[i]);
   444			i += 1 << order;
   445		}
   446	
   447		return r;
   448	}
   449	EXPORT_SYMBOL(ttm_pool_alloc);
   450	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
