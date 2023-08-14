Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05268100AA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 20:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692046596; x=1723582596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xavVHTn084LC2b3z/pArwTQtA80lhC6mGTj7Abx2oyE=;
  b=ZhwdwB6uP6dK4BIb1A62IR6w8hXt0w2KKfqhsHJdOeDizLxqoZiKI7/T
   9zODKvoBeCvoCIQ+AwLJl/y6EwP4VGe4p2bDTFz6HXpu3VgeHHRiT+ec2
   8lz5823Ab9ztaPMYKi4B+K+6jv0y20OUhIlvAY6JeKl5vBDesvgI+cqUQ
   NPyeo1PM6Ybxb4DtnsS605E4+bMlMvtJDhjFePly7DDiEoHWsjHkG0Bep
   cNq2W+TSynx3x9rml33gZpQ16pWqpNeXnNrpA/kdE3Wa5vi36+CgJKvFz
   mrow/7HrTFclZA4CYWLgRbzZEgNlHC3sk9pAb5QHwMTckcaZJV9kn/XZk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="436029938"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="436029938"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 13:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="823605290"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="823605290"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2023 13:56:34 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVec5-0000Pf-36;
	Mon, 14 Aug 2023 20:56:33 +0000
Date: Tue, 15 Aug 2023 04:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [drm-misc:for-linux-next 3/3]
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:37: warning: cast to pointer
 from integer of different size
Message-ID: <202308150419.PaHfWntn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   f5d8f9c0d8b4bc8ad7e7b23a9f4d116e99202dd3
commit: 204042049a941d2a9a7d49bdcda768578b5f88ec [3/3] drm/ttm/tests: Add tests for ttm_pool
config: arm-randconfig-m041-20230815 (https://download.01.org/0day-ci/archive/20230815/202308150419.PaHfWntn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150419.PaHfWntn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150419.PaHfWntn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/drm/drm_kunit_helpers.h:6,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:12,
                    from drivers/gpu/drm/ttm/tests/ttm_pool_test.c:10:
   drivers/gpu/drm/ttm/tests/ttm_pool_test.c: In function 'ttm_pool_alloc_basic_dma_addr':
>> drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
         |                                     ^
   include/kunit/test.h:598:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     598 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1384:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1384 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1379:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
    1379 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
     231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
         |         ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
         |                                     ^
   include/kunit/test.h:598:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     598 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1384:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1384 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1379:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
    1379 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
     231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
         |                                     ^
   include/kunit/test.h:598:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     598 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1384:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1384 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1379:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
    1379 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
     232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
         |                                     ^
   include/kunit/test.h:598:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     598 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1384:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1384 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1379:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
    1379 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
     232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
         |         ^~~~~~~~~~~~~~~~~~~~~


vim +231 drivers/gpu/drm/ttm/tests/ttm_pool_test.c

   195	
   196	static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
   197	{
   198		struct ttm_pool_test_priv *priv = test->priv;
   199		struct ttm_test_devices *devs = priv->devs;
   200		const struct ttm_pool_test_case *params = test->param_value;
   201		struct ttm_tt *tt;
   202		struct ttm_pool *pool;
   203		struct ttm_buffer_object *bo;
   204		dma_addr_t dma1, dma2;
   205		enum ttm_caching caching = ttm_uncached;
   206		unsigned int expected_num_pages = 1 << params->order;
   207		size_t size = expected_num_pages * PAGE_SIZE;
   208		int err;
   209	
   210		tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
   211		KUNIT_ASSERT_NOT_NULL(test, tt);
   212	
   213		bo = ttm_bo_kunit_init(test, devs, size);
   214		KUNIT_ASSERT_NOT_NULL(test, bo);
   215	
   216		err = ttm_sg_tt_init(tt, bo, 0, caching);
   217		KUNIT_ASSERT_EQ(test, err, 0);
   218	
   219		pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
   220		KUNIT_ASSERT_NOT_NULL(test, pool);
   221	
   222		ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
   223	
   224		err = ttm_pool_alloc(pool, tt, &simple_ctx);
   225		KUNIT_ASSERT_EQ(test, err, 0);
   226		KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
   227	
   228		dma1 = tt->dma_address[0];
   229		dma2 = tt->dma_address[tt->num_pages - 1];
   230	
 > 231		KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
   232		KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
   233	
   234		ttm_pool_free(pool, tt);
   235		ttm_tt_fini(tt);
   236		ttm_pool_fini(pool);
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
