Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B074B43174
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 18:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Il5ui6s7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700247301; x=1731783301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=22IeTBS/0i5e01l93kvTVPXptw53FK4PWLryYKbUdTI=;
  b=Il5ui6s7J8SIHdKkbZWY15DTnLVClRQofiXkgN9MjxymR2z5wAbA19Cy
   QiTLeH5uB0I5u3ZMNEH73LnUp+jF3SzxpBt/dFUr/jrdirI3ykybzu/TZ
   Auo0ovW8RfD5a09dbHtVZBlQBEbGzPgwsCWEopm4gH9yb6KK5Vn6P4+Y8
   5HDbjqy7PVFV6HOxSfoaR1CkoWIyt6R+zPPeGZKORTwGjgL+wKSfPYxs+
   fqvWnSQ70sXWAw7VsufdYigwMo3XHMkRnP/GAVO0WK9X6DnZUy+SLjLtR
   5cQEnHMQNsqMGr6v3a0+HrzoxucKCOcnjQm8Um0cIyUvgdkFrDh+/i+YD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="455650641"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="455650641"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 10:54:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="836148948"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="836148948"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Nov 2023 10:54:56 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r43zS-00033N-0l;
	Fri, 17 Nov 2023 18:54:54 +0000
Date: Sat, 18 Nov 2023 02:54:34 +0800
From: kernel test robot <lkp@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Karolina Stolarek <karolina.stolarek@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v7 6/8] drm/ttm/tests: Test simple BO creation and
 validation
Message-ID: <202311180247.4A61HKYG-lkp@intel.com>
References: <fe0d1ba291b12e7b4671bee8b95812ac30a469df.1700207346.git.karolina.stolarek@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe0d1ba291b12e7b4671bee8b95812ac30a469df.1700207346.git.karolina.stolarek@intel.com>

Hi Karolina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karolina-Stolarek/drm-ttm-tests-Add-tests-for-ttm_resource-and-ttm_sys_man/20231117-165755
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/fe0d1ba291b12e7b4671bee8b95812ac30a469df.1700207346.git.karolina.stolarek%40intel.com
patch subject: [PATCH v7 6/8] drm/ttm/tests: Test simple BO creation and validation
config: x86_64-randconfig-122-20231117 (https://download.01.org/0day-ci/archive/20231118/202311180247.4A61HKYG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311180247.4A61HKYG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180247.4A61HKYG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:98:9: sparse: sparse: cast removes address space '__rcu' of expression
>> drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:98:9: sparse: sparse: cast removes address space '__rcu' of expression

vim +/__rcu +98 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c

    59	
    60	KUNIT_ARRAY_PARAM(ttm_bo_types, ttm_bo_type_cases,
    61			  ttm_bo_validate_case_desc);
    62	
    63	static void ttm_bo_init_reserved_sys_man(struct kunit *test)
    64	{
    65		const struct ttm_bo_validate_test_case *params = test->param_value;
    66		struct ttm_test_devices *priv = test->priv;
    67		struct ttm_buffer_object *bo;
    68		struct ttm_place *place;
    69		struct ttm_placement *placement;
    70		enum ttm_bo_type bo_type = params->bo_type;
    71		struct ttm_operation_ctx ctx = { };
    72		uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
    73		int err;
    74	
    75		bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
    76		KUNIT_ASSERT_NOT_NULL(test, bo);
    77	
    78		place = ttm_place_kunit_init(test, TTM_PL_SYSTEM, 0);
    79		placement = ttm_placement_kunit_init(test, place, 1, NULL, 0);
    80	
    81		drm_gem_private_object_init(priv->drm, &bo->base, size);
    82	
    83		err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement,
    84					   PAGE_SIZE, &ctx, NULL, NULL,
    85					   &dummy_ttm_bo_destroy);
    86		dma_resv_unlock(bo->base.resv);
    87	
    88		KUNIT_EXPECT_EQ(test, err, 0);
    89		KUNIT_EXPECT_EQ(test, kref_read(&bo->kref), 1);
    90		KUNIT_EXPECT_PTR_EQ(test, bo->bdev, priv->ttm_dev);
    91		KUNIT_EXPECT_EQ(test, bo->type, bo_type);
    92		KUNIT_EXPECT_EQ(test, bo->page_alignment, PAGE_SIZE);
    93		KUNIT_EXPECT_PTR_EQ(test, bo->destroy, &dummy_ttm_bo_destroy);
    94		KUNIT_EXPECT_EQ(test, bo->pin_count, 0);
    95		KUNIT_EXPECT_NULL(test, bo->bulk_move);
    96		KUNIT_EXPECT_NOT_NULL(test, bo->ttm);
    97		KUNIT_EXPECT_FALSE(test, ttm_tt_is_populated(bo->ttm));
  > 98		KUNIT_EXPECT_NOT_NULL(test, (void *)bo->base.resv->fences);
    99		KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
   100	
   101		if (bo_type != ttm_bo_type_kernel)
   102			KUNIT_EXPECT_TRUE(test,
   103					  drm_mm_node_allocated(&bo->base.vma_node.vm_node));
   104	
   105		ttm_resource_free(bo, &bo->resource);
   106		ttm_bo_put(bo);
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
