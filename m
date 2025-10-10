Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5CE2F7ADD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760109057; cv=none; b=W1ZW1NQ1T61CjWviMQ9foVPAIOA4SB60Hs8FMCNvz/M3oZhH4KXDTA/UzLfJW1cKyG2rXYqVNJOjiDgz9NjgVLRFSWkx/ZFCpyg7ncrsS3q3iYAI1DAONE2IZTAxEem9guoTiXe44cGj7gs38kR3u5xS0B3COWu6iaw5JeYoN0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760109057; c=relaxed/simple;
	bh=3bq+lll4selOwzI1mzp5ZL0CdqpCdCpTxCSOWeZ+iEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYT63u/UkTsjj2iK30taWwlhW5Llfsj0lxvtoYESo71rtdoiCBQyEKmv3tgIhKPDUxicRHONRjcvhgYYE2Ai11deSTA54fMEXEDqsWN7diCDDgwfhKVPLu7Ix7STUpuA0Irx3m+i0eJciuzxjZxdInL1kTN+b2FKX5wQPqLFouQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXXrbJu/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXXrbJu/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760109055; x=1791645055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3bq+lll4selOwzI1mzp5ZL0CdqpCdCpTxCSOWeZ+iEU=;
  b=hXXrbJu/6RQ44NZjte97YFBscQ2cCNAORJE22qU+KoWbTc5zxL/OP9kj
   UXm2iZS7bOCA0JAVqA+brrmOuyYgV0+44G9WNqgHbCzKgWCvljMcCT1cy
   9JQiWLN8RkFVS7UKgkdoHEZuJ8D1bByO93LnRLkRVvNuwhR8o3guDpOS4
   Is3Tq6Bpfoj4h4NKSDY6cAyqK4PPdPhxM+bRLr17Fw39Eq7GGXVXJWYcW
   GXf2YzCXaU+TZNh+ngsAm4rAi0RZYmKbSiZX7XEEiLe/Xv9vyP0y0YJ/e
   Z/fW/mDHoWEZdk/OS3mCwFLAYhpVlsHrD9UfpDfluuj4uABWRhRVC9CvX
   A==;
X-CSE-ConnectionGUID: MVs5VxlmSQm1RLGtW+mQWg==
X-CSE-MsgGUID: 0QS/wqDbSTyPxZAmSPa8Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="61538620"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="61538620"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 08:10:53 -0700
X-CSE-ConnectionGUID: 8AIej7TsQ7a7dKDVguZulg==
X-CSE-MsgGUID: XkdFaoXqRjKmjW8GIcRLPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="181425613"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Oct 2025 08:10:52 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Eld-0002t1-1w;
	Fri, 10 Oct 2025 15:10:49 +0000
Date: Fri, 10 Oct 2025 23:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 2/5] drm/ttm: Replace multiple booleans with flags in
 pool init
Message-ID: <202510102220.inEYOJoK-lkp@intel.com>
References: <20251008115314.55438-3-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008115314.55438-3-tvrtko.ursulin@igalia.com>

Hi Tvrtko,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-xe/drm-xe-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.17 next-20251009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-ttm-Add-getter-for-some-pool-properties/20251010-052711
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20251008115314.55438-3-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v3 2/5] drm/ttm: Replace multiple booleans with flags in pool init
config: sh-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251010/202510102220.inEYOJoK-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510102220.inEYOJoK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510102220.inEYOJoK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ttm/tests/ttm_pool_test.c: In function 'ttm_pool_alloc_basic':
>> drivers/gpu/drm/ttm/tests/ttm_pool_test.c:167:21: error: implicit declaration of function 'ttm_pool_uses_dma_alloc'; did you mean 'ttm_pool_restore_and_alloc'? [-Wimplicit-function-declaration]
     167 |                 if (ttm_pool_uses_dma_alloc(pool)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
         |                     ttm_pool_restore_and_alloc
--
   drivers/gpu/drm/ttm/tests/ttm_device_test.c: In function 'ttm_device_init_pools':
>> drivers/gpu/drm/ttm/tests/ttm_device_test.c:177:37: error: implicit declaration of function 'ttm_pool_uses_dma_alloc'; did you mean 'ttm_pool_restore_and_alloc'? [-Wimplicit-function-declaration]
     177 |                                 if (ttm_pool_uses_dma_alloc(pool))
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~
         |                                     ttm_pool_restore_and_alloc


vim +167 drivers/gpu/drm/ttm/tests/ttm_pool_test.c

   130	
   131	KUNIT_ARRAY_PARAM(ttm_pool_alloc_basic, ttm_pool_basic_cases,
   132			  ttm_pool_alloc_case_desc);
   133	
   134	static void ttm_pool_alloc_basic(struct kunit *test)
   135	{
   136		struct ttm_pool_test_priv *priv = test->priv;
   137		struct ttm_test_devices *devs = priv->devs;
   138		const struct ttm_pool_test_case *params = test->param_value;
   139		struct ttm_tt *tt;
   140		struct ttm_pool *pool;
   141		struct page *fst_page, *last_page;
   142		enum ttm_caching caching = ttm_uncached;
   143		unsigned int expected_num_pages = 1 << params->order;
   144		size_t size = expected_num_pages * PAGE_SIZE;
   145		int err;
   146	
   147		tt = ttm_tt_kunit_init(test, 0, caching, size);
   148		KUNIT_ASSERT_NOT_NULL(test, tt);
   149	
   150		pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
   151		KUNIT_ASSERT_NOT_NULL(test, pool);
   152	
   153		ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, params->flags);
   154	
   155		KUNIT_ASSERT_PTR_EQ(test, pool->dev, devs->dev);
   156		KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
   157		KUNIT_ASSERT_EQ(test, pool->flags, params->flags);
   158	
   159		err = ttm_pool_alloc(pool, tt, &simple_ctx);
   160		KUNIT_ASSERT_EQ(test, err, 0);
   161		KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
   162	
   163		fst_page = tt->pages[0];
   164		last_page = tt->pages[tt->num_pages - 1];
   165	
   166		if (params->order <= MAX_PAGE_ORDER) {
 > 167			if (ttm_pool_uses_dma_alloc(pool)) {
   168				KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
   169				KUNIT_ASSERT_NOT_NULL(test, (void *)last_page->private);
   170			} else {
   171				KUNIT_ASSERT_EQ(test, fst_page->private, params->order);
   172			}
   173		} else {
   174			if (ttm_pool_uses_dma_alloc(pool)) {
   175				KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
   176				KUNIT_ASSERT_NULL(test, (void *)last_page->private);
   177			} else {
   178				/*
   179				 * We expect to alloc one big block, followed by
   180				 * order 0 blocks
   181				 */
   182				KUNIT_ASSERT_EQ(test, fst_page->private,
   183						min_t(unsigned int, MAX_PAGE_ORDER,
   184						      params->order));
   185				KUNIT_ASSERT_EQ(test, last_page->private, 0);
   186			}
   187		}
   188	
   189		ttm_pool_free(pool, tt);
   190		ttm_tt_fini(tt);
   191		ttm_pool_fini(pool);
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
