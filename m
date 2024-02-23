Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982D4146E81
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 21:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708725550; cv=none; b=XYy+diXNItS2diP2Q5x4OYCzSyF6ewKdwHiglvQhShD2/SS8UgI4xRc2WJwsqhFEWTfEzon2zplXtfGTCuOtFPoyoMBtqWX+jcesIYPOLLsaJoPoDL9z9wQXtcN/6LxC4WbeK+B+rqtWALS1zLF+hNqtgryAvUeqSNbyVn/1v80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708725550; c=relaxed/simple;
	bh=lIHsa651QWlwhH8I/beGsp7DZTCEf9FbTZ4cxiTaSVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gV8vJP7HsIauv6FCCrz15Tirrdgk1ednH333vii3E4ORGwEpJcBDwOR+KGN2blCojPhhv3Ln3odzVUJ4n3n1MlU2V3frntIQ0nQQCfK/cosaIzLb7T28hkKnOWjBLXPNN1kVIyVtgTv4RXsvF14V6DK5fju6oPXnA1dTydzOUA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecNwpVnd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecNwpVnd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708725548; x=1740261548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lIHsa651QWlwhH8I/beGsp7DZTCEf9FbTZ4cxiTaSVo=;
  b=ecNwpVnd2DAhgDCBa/wnw9lisXXyk45NTIsRNMuyFdR4koNEwy62l0Cv
   yFMOv3oh3zEVjB2keL4KCUgobCTGqVAWXAqo2TZtDyzLIbwz9x9npeQ8H
   1zC61FpJ479GHgw19mAnXt4OY1LKOfrfhoQ6NjPpZ8cJU1HnPqZDtpB7e
   B5NcgJ9Ws/BJPQp0X+01q+M9tOzU3JXI3MPggm/l/nisKwywgdbef9eYU
   KtYTl4mhOUfy+qRxlGR/10akNU7yaTrgPXeZZXGxG5QQ9Sm5o4qeigHFb
   7xNc7KG8Wjy5onBpbA6DTBCJj7jTAAAuLYcFEweLXP8lcPVsxZ5/3XNdp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6881381"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6881381"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 13:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="29218394"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Feb 2024 13:59:05 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rddZP-0007wG-1C;
	Fri, 23 Feb 2024 21:59:03 +0000
Date: Sat, 24 Feb 2024 05:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 26075/26659]
 drivers/gpu/drm/ttm/tests/ttm_device_test.c:179:36: warning: iteration 11
 invokes undefined behavior
Message-ID: <202402240531.J6eLI1uC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   7e3ada2cf0f205554b13ee75575c4125d972148c
commit: bafcbea642d8a1cb2ef6e7ff3c1dd05d80a4d746 [26075/26659] UPSTREAM: drm/ttm/tests: Add tests for ttm_device
config: i386-buildonly-randconfig-002-20240223 (https://download.01.org/0day-ci/archive/20240224/202402240531.J6eLI1uC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240531.J6eLI1uC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240531.J6eLI1uC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/ttm/tests/ttm_device_test.c: In function 'ttm_device_init_pools':
>> drivers/gpu/drm/ttm/tests/ttm_device_test.c:179:36: warning: iteration 11 invokes undefined behavior [-Waggressive-loop-optimizations]
     179 |                                 pt = pool->caching[i].orders[j];
         |                                 ~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_device_test.c:178:43: note: within this loop
     178 |                         for (int j = 0; j <= MAX_ORDER; ++j) {


vim +179 drivers/gpu/drm/ttm/tests/ttm_device_test.c

   152	
   153	static void ttm_device_init_pools(struct kunit *test)
   154	{
   155		struct ttm_test_devices *priv = test->priv;
   156		const struct ttm_device_test_case *params = test->param_value;
   157		struct ttm_device *ttm_dev;
   158		struct ttm_pool *pool;
   159		struct ttm_pool_type pt;
   160		int err;
   161	
   162		ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
   163		KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
   164	
   165		err = ttm_device_kunit_init(priv, ttm_dev,
   166					    params->use_dma_alloc,
   167					    params->use_dma32);
   168		KUNIT_ASSERT_EQ(test, err, 0);
   169	
   170		pool = &ttm_dev->pool;
   171		KUNIT_ASSERT_NOT_NULL(test, pool);
   172		KUNIT_EXPECT_PTR_EQ(test, pool->dev, priv->dev);
   173		KUNIT_EXPECT_EQ(test, pool->use_dma_alloc, params->use_dma_alloc);
   174		KUNIT_EXPECT_EQ(test, pool->use_dma32, params->use_dma32);
   175	
   176		if (params->pools_init_expected) {
   177			for (int i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
   178				for (int j = 0; j <= MAX_ORDER; ++j) {
 > 179					pt = pool->caching[i].orders[j];
   180					KUNIT_EXPECT_PTR_EQ(test, pt.pool, pool);
   181					KUNIT_EXPECT_EQ(test, pt.caching, i);
   182					KUNIT_EXPECT_EQ(test, pt.order, j);
   183	
   184					if (params->use_dma_alloc)
   185						KUNIT_ASSERT_FALSE(test,
   186								   list_empty(&pt.pages));
   187				}
   188			}
   189		}
   190	
   191		ttm_device_fini(ttm_dev);
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
