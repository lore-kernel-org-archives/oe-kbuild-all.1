Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E591F95B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 19:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690917942; x=1722453942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9to6D4l5uoCGZRN8pem4q3UvpKGaAPzH9qNZ+F+t7R4=;
  b=nMLbNcRBVeV+jnhf4V+n80C2lM23Voa5Z1q5t96I4aLL5HOyOxIXRd0D
   7nbh+psVo+igt6o1NKGm5ZSUkc+A4Gx4vbCJ/l82I/fhQhDLo5WEfiOts
   kk9wnHa0ULnwwNQZ6xnHDpCZimmHMEvkLmK9K5cbRx1MgZb2+VnwvC5MY
   vaQZdQNuFgRH7l8xtlaY0LzLV+Vg1omlNw3Il8olTP7eSe7JAz1AkoxmT
   zh0YLF+1XeZaHSxaxPDqfTLgv9jaOrO0RkeGCGD8z5BZkCZd9wkv+2vnY
   XLn37kEIzlRehaTZ3g/sqzk3a1SdCI5AEAURIaledTw87zHqn2lU/YiTY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="354321330"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="354321330"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 12:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="722584947"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="722584947"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Aug 2023 12:25:40 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQuzz-0000YR-1y;
	Tue, 01 Aug 2023 19:25:39 +0000
Date: Wed, 2 Aug 2023 03:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/ttm/ttm_pool.c:378:22: sparse: sparse: incompatible
 types in comparison expression (different type sizes):
Message-ID: <202308020306.gm7zHFiQ-lkp@intel.com>
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
date:   2 years, 4 months ago
config: sparc-randconfig-r081-20230730 (https://download.01.org/0day-ci/archive/20230802/202308020306.gm7zHFiQ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020306.gm7zHFiQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020306.gm7zHFiQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/ttm/ttm_pool.c:378:22: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> drivers/gpu/drm/ttm/ttm_pool.c:378:22: sparse:    unsigned long *
>> drivers/gpu/drm/ttm/ttm_pool.c:378:22: sparse:    int *

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
https://github.com/intel/lkp-tests/wiki
