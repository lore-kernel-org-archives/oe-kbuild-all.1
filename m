Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B58447ECD8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184871; cv=none; b=lHFK5IgNoM12c108en85NEQAy7li/dsyulnUvzr50WL3LboExsw82hBqdmXhlZGdHDaZmZSorQFTzEB1yeURG31laMG4BtYcFV3WMgF2c9FYFAsNCRpnFfZCIEwpS6S44qCHfdsoSSajgePaMA+bWVUUm/dLyQtIGXEB/vTnobU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184871; c=relaxed/simple;
	bh=SBeFWkb9L5Sr0Ok+jsWwsdiHNXDMlZKXJGGytS9lilw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F0AY9ceTzXM4Iy/Ew9F84WrRFZ4WlM6RqeIQRQ2br0AA2fp3ZuEtxKU8zb0rSFPcjysSwwjKMHsgkSqY5QPrnP0LTCZIs1Xii/IJYrqWMY20xmg8deiuS38Pi/YE/YY7D9OETbtaxdcT0nUAQcNNszsUehryQ8CB/Yp1dXRVSdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXffP12R; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXffP12R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788184870; x=1819720870;
  h=date:from:to:cc:subject:message-id;
  bh=SBeFWkb9L5Sr0Ok+jsWwsdiHNXDMlZKXJGGytS9lilw=;
  b=LXffP12RbOHcnbTrbEgqqVcf0gQpDiEBrTSuQycGlLBR7a+Qq32qwn4m
   AWGAQDzTB1GFvWA55eGXtVDmahR6WVRh5sckqTAcDMdZt1odD7Kn9q0+r
   0+zJkfYpE+R//eUTmDcriL1fD4P8tsP63qkQblzmlNn4ieHCEtNX4gVjC
   pn10JYUSQ0ruxY+eD4HvLyuBf5LEUvFQFSYkzoQw9KSeStk8Zvdsyp439
   yApxwJP+jRnrBNpTbzQ+7CNB82S7J0bHzCMCN7rhurCa9bo0sVmAp3D4/
   zoC/FaNtjvI77K56p79Jem67WSb4ftUsnNgizXLs0Baez4iSA24LrbYVK
   w==;
X-CSE-ConnectionGUID: zpGH58apR3mGnlm/TusQMA==
X-CSE-MsgGUID: Cd/QG9dWTsOV1ULenPgQZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="111365170"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="111365170"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 07:01:09 -0700
X-CSE-ConnectionGUID: Cn52ln85QfqTl1nnDNSTxA==
X-CSE-MsgGUID: Fq8x4rpcTT22VbYonPJGkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="269394541"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Aug 2026 07:01:07 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x12ZN-000000000jJ-1OXD;
	Mon, 31 Aug 2026 14:01:05 +0000
Date: Mon, 31 Aug 2026 22:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/vramstuff 12/29]
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:792:38: error: passing
 argument 1 of 'ttm_bo_swapout' from incompatible pointer type
Message-ID: <202608312151.nQyyQb4A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/vramstuff
head:   13a8e2000329a36f994acf2fd31d307d27fa9189
commit: 0e36b0fd7203ac94de49878034f754c0e9a41824 [12/29] drm/ttm: switch to ttm_bo_lru_for_each_reserved_guarded for swapout
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260831/202608312151.nQyyQb4A-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608312151.nQyyQb4A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608312151.nQyyQb4A-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c: In function 'ttm_bo_validate_swapout':
>> drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:792:38: error: passing argument 1 of 'ttm_bo_swapout' from incompatible pointer type [-Wincompatible-pointer-types]
     792 |         swapped = ttm_bo_swapout(priv->ttm_dev, &ctx_init, man, GFP_KERNEL,
         |                                  ~~~~^~~~~~~~~
         |                                      |
         |                                      struct ttm_device *
   In file included from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:10,
                    from drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:12:
   include/drm/ttm/ttm_bo.h:411:46: note: expected 'struct ttm_buffer_object *' but argument is of type 'struct ttm_device *'
     411 | s64 ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~^~
>> drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:792:60: error: passing argument 3 of 'ttm_bo_swapout' makes integer from pointer without a cast [-Wint-conversion]
     792 |         swapped = ttm_bo_swapout(priv->ttm_dev, &ctx_init, man, GFP_KERNEL,
         |                                                            ^~~
         |                                                            |
         |                                                            struct ttm_resource_manager *
   include/drm/ttm/ttm_bo.h:412:26: note: expected 'gfp_t' {aka 'unsigned int'} but argument is of type 'struct ttm_resource_manager *'
     412 |                    gfp_t gfp_flags);
         |                    ~~~~~~^~~~~~~~~
>> drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:792:19: error: too many arguments to function 'ttm_bo_swapout'; expected 3, have 5
     792 |         swapped = ttm_bo_swapout(priv->ttm_dev, &ctx_init, man, GFP_KERNEL,
         |                   ^~~~~~~~~~~~~~
   include/drm/ttm/ttm_bo.h:411:5: note: declared here
     411 | s64 ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
         |     ^~~~~~~~~~~~~~


vim +/ttm_bo_swapout +792 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c

8eda41dfc9b2f04 Karolina Stolarek             2024-06-12  761  
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  762  static void ttm_bo_validate_swapout(struct kunit *test)
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  763  {
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  764  	u32 mem_type = TTM_PL_TT;
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  765  	struct ttm_test_devices *priv = test->priv;
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  766  	struct ttm_operation_ctx ctx_init = { };
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  767  	enum ttm_bo_type bo_type = ttm_bo_type_device;
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  768  	struct ttm_resource_manager *man;
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  769  	struct ttm_placement *placement;
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  770  	struct ttm_buffer_object *bo;
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  771  	struct ttm_place *place;
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  772  	int err;
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  773  	s64 swapped;
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  774  
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  775  	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  776  	man = ttm_manager_type(priv->ttm_dev, mem_type);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  777  	KUNIT_ASSERT_NOT_NULL(test, man);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  778  
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  779  	place = ttm_place_kunit_init(test, mem_type, 0);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  780  	placement = ttm_placement_kunit_init(test, place, 1);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  781  
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  782  	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  783  	KUNIT_ASSERT_NOT_NULL(test, bo);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  784  
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  785  	drm_gem_private_object_init(priv->drm, &bo->base, MANAGER_SIZE);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  786  	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement,
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  787  				   PAGE_SIZE, &ctx_init, NULL, NULL,
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  788  				   &dummy_ttm_bo_destroy);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  789  	KUNIT_EXPECT_EQ(test, err, 0);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  790  	dma_resv_unlock(bo->base.resv);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  791  
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09 @792  	swapped = ttm_bo_swapout(priv->ttm_dev, &ctx_init, man, GFP_KERNEL,
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  793  				 MANAGER_SIZE / PAGE_SIZE);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  794  	KUNIT_EXPECT_EQ(test, swapped, MANAGER_SIZE / PAGE_SIZE);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  795  	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, TTM_PL_SYSTEM);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  796  	KUNIT_EXPECT_TRUE(test, bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  797  
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  798  	ttm_bo_fini(bo);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  799  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  800  }
d11ac9043435cf1 Thadeu Lima de Souza Cascardo 2026-03-09  801  

:::::: The code at line 792 was first introduced by commit
:::::: d11ac9043435cf1ddf1abc59fa774eb6c0ca4e51 drm/ttm/tests: add a test to exercise ttm_bo_swapout

:::::: TO: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
:::::: CC: Tvrtko Ursulin <tursulin@ursulin.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
