Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE0A1A840A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746615686; cv=none; b=e4aoNLyA4m9Y3C9VhLCDtaDJXXZv8mfMlQE3DzDBUrkY54FvqPN0ke/vy0G/dCk6LhRGZU6lkQLyGjw57W9PneW+TxUJzQhpACeE6gD8/ZcUq5UN+FBVVMkpBH7p8bLDanhAF34MbOOhjENe1bJoMLUly8tK/ZbctK5Snf7uhq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746615686; c=relaxed/simple;
	bh=35Zp7Xsq9UBcRuz5/JCG5qgSeL2JiJ7Unp6a9ZLhFX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unZdv6vNYa8ubd3nBoxf/OyPmedETZTQbahoEli12eue5YU4N4EgTNdk9OAPmPRjsug+M9emPbQ2QOnefyxyWJ32fNT6+UDrQUCxccYiuRXM/AEvPPU3okrMEbd5Y8vAI+wZJEmRDIKD+Hi9E+8d4He9RUGUf81rZbDwwLrBqFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7EqaaSg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7EqaaSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746615684; x=1778151684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=35Zp7Xsq9UBcRuz5/JCG5qgSeL2JiJ7Unp6a9ZLhFX0=;
  b=K7EqaaSgiVKmV/V4ZblJJ4DsAiEaY2JAlQ1sxkzDImamCWmYERS3a9ZW
   MPek7DThfGpEBRsjOLP1gnc1fol510yHo011in7T3Jxz/CGq4p5Psy+8c
   YEAGnovXri++fErCF+1G+CVLoKRESCFs7xLBN/n11vAtucLh/TqDUNWma
   XH1xycIWjZin9FJcvHZ7tn3AN1IijQqPNxn9u6peW7k/TghqhADOC3AL+
   nLoTOyYgC1cXpjYPWWDZ06TqTWpmsofE8T8p6NlQwLKjB/Cwc073eTzdx
   gDmBl80rBiugvE05jAlYbt172FPaxxmMRKHVNqRj13kcq/RyHYw0/QXmh
   A==;
X-CSE-ConnectionGUID: oH1+YiHWSk+03IFmtsoZPw==
X-CSE-MsgGUID: 1vzNwZiNSqaXm5C8nHs0mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58533865"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="58533865"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:01:23 -0700
X-CSE-ConnectionGUID: 0nrDZsWJT2aUGHbPlfEM8A==
X-CSE-MsgGUID: 0b/aWQjURTGsDwiOHTs6vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="159217723"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 May 2025 04:01:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCcWd-0007eH-2j;
	Wed, 07 May 2025 11:01:19 +0000
Date: Wed, 7 May 2025 19:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/ttm/xe: drop unused force_alloc flag
Message-ID: <202505071848.39m0TUuR-lkp@intel.com>
References: <20250423022920.27701-1-airlied@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250423022920.27701-1-airlied@gmail.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-exynos/exynos-drm-next linus/master v6.15-rc5]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/drm-ttm-xe-drop-unused-force_alloc-flag/20250423-103716
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250423022920.27701-1-airlied%40gmail.com
patch subject: [PATCH] drm/ttm/xe: drop unused force_alloc flag
config: i386-randconfig-005-20250426 (https://download.01.org/0day-ci/archive/20250507/202505071848.39m0TUuR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071848.39m0TUuR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071848.39m0TUuR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_dma_buf.c:319:
   drivers/gpu/drm/xe/tests/xe_dma_buf.c: In function 'check_residency':
>> drivers/gpu/drm/xe/tests/xe_dma_buf.c:68:15: error: too many arguments to function 'xe_bo_evict'
      68 |         ret = xe_bo_evict(exported, true);
         |               ^~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_dma_buf.c:17:
   drivers/gpu/drm/xe/xe_bo.h:277:5: note: declared here
     277 | int xe_bo_evict(struct xe_bo *bo);
         |     ^~~~~~~~~~~
--
   In file included from drivers/gpu/drm/xe/xe_bo.c:3022:
   drivers/gpu/drm/xe/tests/xe_bo.c: In function 'ccs_test_migrate':
>> drivers/gpu/drm/xe/tests/xe_bo.c:63:15: error: too many arguments to function 'xe_bo_evict'
      63 |         ret = xe_bo_evict(bo, true);
         |               ^~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:2843:5: note: declared here
    2843 | int xe_bo_evict(struct xe_bo *bo)
         |     ^~~~~~~~~~~
--
   In file included from drivers/gpu/drm/xe/xe_migrate.c:1729:
   drivers/gpu/drm/xe/tests/xe_migrate.c: In function 'test_migrate':
>> drivers/gpu/drm/xe/tests/xe_migrate.c:512:15: error: too many arguments to function 'xe_bo_evict'
     512 |         ret = xe_bo_evict(vram_bo, true);
         |               ^~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_migrate.c:23:
   drivers/gpu/drm/xe/xe_bo.h:277:5: note: declared here
     277 | int xe_bo_evict(struct xe_bo *bo);
         |     ^~~~~~~~~~~


vim +/xe_bo_evict +68 drivers/gpu/drm/xe/tests/xe_dma_buf.c

dd08ebf6c3525a Matthew Brost    2023-03-30   28  
dd08ebf6c3525a Matthew Brost    2023-03-30   29  static void check_residency(struct kunit *test, struct xe_bo *exported,
dd08ebf6c3525a Matthew Brost    2023-03-30   30  			    struct xe_bo *imported, struct dma_buf *dmabuf)
dd08ebf6c3525a Matthew Brost    2023-03-30   31  {
dd08ebf6c3525a Matthew Brost    2023-03-30   32  	struct dma_buf_test_params *params = to_dma_buf_test_params(test->priv);
dd08ebf6c3525a Matthew Brost    2023-03-30   33  	u32 mem_type;
dd08ebf6c3525a Matthew Brost    2023-03-30   34  	int ret;
dd08ebf6c3525a Matthew Brost    2023-03-30   35  
dd08ebf6c3525a Matthew Brost    2023-03-30   36  	xe_bo_assert_held(exported);
dd08ebf6c3525a Matthew Brost    2023-03-30   37  	xe_bo_assert_held(imported);
dd08ebf6c3525a Matthew Brost    2023-03-30   38  
dd08ebf6c3525a Matthew Brost    2023-03-30   39  	mem_type = XE_PL_VRAM0;
62742d12663145 Lucas De Marchi  2024-03-22   40  	if (!(params->mem_mask & XE_BO_FLAG_VRAM0))
dd08ebf6c3525a Matthew Brost    2023-03-30   41  		/* No VRAM allowed */
dd08ebf6c3525a Matthew Brost    2023-03-30   42  		mem_type = XE_PL_TT;
dd08ebf6c3525a Matthew Brost    2023-03-30   43  	else if (params->force_different_devices && !p2p_enabled(params))
dd08ebf6c3525a Matthew Brost    2023-03-30   44  		/* No P2P */
dd08ebf6c3525a Matthew Brost    2023-03-30   45  		mem_type = XE_PL_TT;
dd08ebf6c3525a Matthew Brost    2023-03-30   46  	else if (params->force_different_devices && !is_dynamic(params) &&
62742d12663145 Lucas De Marchi  2024-03-22   47  		 (params->mem_mask & XE_BO_FLAG_SYSTEM))
dd08ebf6c3525a Matthew Brost    2023-03-30   48  		/* Pin migrated to TT */
dd08ebf6c3525a Matthew Brost    2023-03-30   49  		mem_type = XE_PL_TT;
dd08ebf6c3525a Matthew Brost    2023-03-30   50  
dd08ebf6c3525a Matthew Brost    2023-03-30   51  	if (!xe_bo_is_mem_type(exported, mem_type)) {
dd08ebf6c3525a Matthew Brost    2023-03-30   52  		KUNIT_FAIL(test, "Exported bo was not in expected memory type.\n");
dd08ebf6c3525a Matthew Brost    2023-03-30   53  		return;
dd08ebf6c3525a Matthew Brost    2023-03-30   54  	}
dd08ebf6c3525a Matthew Brost    2023-03-30   55  
dd08ebf6c3525a Matthew Brost    2023-03-30   56  	if (xe_bo_is_pinned(exported))
dd08ebf6c3525a Matthew Brost    2023-03-30   57  		return;
dd08ebf6c3525a Matthew Brost    2023-03-30   58  
dd08ebf6c3525a Matthew Brost    2023-03-30   59  	/*
dd08ebf6c3525a Matthew Brost    2023-03-30   60  	 * Evict exporter. Note that the gem object dma_buf member isn't
dd08ebf6c3525a Matthew Brost    2023-03-30   61  	 * set from xe_gem_prime_export(), and it's needed for the move_notify()
dd08ebf6c3525a Matthew Brost    2023-03-30   62  	 * functionality, so hack that up here. Evicting the exported bo will
dd08ebf6c3525a Matthew Brost    2023-03-30   63  	 * evict also the imported bo through the move_notify() functionality if
dd08ebf6c3525a Matthew Brost    2023-03-30   64  	 * importer is on a different device. If they're on the same device,
dd08ebf6c3525a Matthew Brost    2023-03-30   65  	 * the exporter and the importer should be the same bo.
dd08ebf6c3525a Matthew Brost    2023-03-30   66  	 */
dd08ebf6c3525a Matthew Brost    2023-03-30   67  	swap(exported->ttm.base.dma_buf, dmabuf);
dd08ebf6c3525a Matthew Brost    2023-03-30  @68  	ret = xe_bo_evict(exported, true);
dd08ebf6c3525a Matthew Brost    2023-03-30   69  	swap(exported->ttm.base.dma_buf, dmabuf);
dd08ebf6c3525a Matthew Brost    2023-03-30   70  	if (ret) {
dd08ebf6c3525a Matthew Brost    2023-03-30   71  		if (ret != -EINTR && ret != -ERESTARTSYS)
dd08ebf6c3525a Matthew Brost    2023-03-30   72  			KUNIT_FAIL(test, "Evicting exporter failed with err=%d.\n",
dd08ebf6c3525a Matthew Brost    2023-03-30   73  				   ret);
dd08ebf6c3525a Matthew Brost    2023-03-30   74  		return;
dd08ebf6c3525a Matthew Brost    2023-03-30   75  	}
dd08ebf6c3525a Matthew Brost    2023-03-30   76  
dd08ebf6c3525a Matthew Brost    2023-03-30   77  	/* Verify that also importer has been evicted to SYSTEM */
a201c6ee37d63e Thomas Hellström 2023-06-26   78  	if (exported != imported && !xe_bo_is_mem_type(imported, XE_PL_SYSTEM)) {
dd08ebf6c3525a Matthew Brost    2023-03-30   79  		KUNIT_FAIL(test, "Importer wasn't properly evicted.\n");
dd08ebf6c3525a Matthew Brost    2023-03-30   80  		return;
dd08ebf6c3525a Matthew Brost    2023-03-30   81  	}
dd08ebf6c3525a Matthew Brost    2023-03-30   82  
dd08ebf6c3525a Matthew Brost    2023-03-30   83  	/* Re-validate the importer. This should move also exporter in. */
dd08ebf6c3525a Matthew Brost    2023-03-30   84  	ret = xe_bo_validate(imported, NULL, false);
dd08ebf6c3525a Matthew Brost    2023-03-30   85  	if (ret) {
dd08ebf6c3525a Matthew Brost    2023-03-30   86  		if (ret != -EINTR && ret != -ERESTARTSYS)
dd08ebf6c3525a Matthew Brost    2023-03-30   87  			KUNIT_FAIL(test, "Validating importer failed with err=%d.\n",
dd08ebf6c3525a Matthew Brost    2023-03-30   88  				   ret);
dd08ebf6c3525a Matthew Brost    2023-03-30   89  		return;
dd08ebf6c3525a Matthew Brost    2023-03-30   90  	}
dd08ebf6c3525a Matthew Brost    2023-03-30   91  
dd08ebf6c3525a Matthew Brost    2023-03-30   92  	/*
dd08ebf6c3525a Matthew Brost    2023-03-30   93  	 * If on different devices, the exporter is kept in system  if
dd08ebf6c3525a Matthew Brost    2023-03-30   94  	 * possible, saving a migration step as the transfer is just
dd08ebf6c3525a Matthew Brost    2023-03-30   95  	 * likely as fast from system memory.
dd08ebf6c3525a Matthew Brost    2023-03-30   96  	 */
62742d12663145 Lucas De Marchi  2024-03-22   97  	if (params->mem_mask & XE_BO_FLAG_SYSTEM)
dd08ebf6c3525a Matthew Brost    2023-03-30   98  		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, XE_PL_TT));
dd08ebf6c3525a Matthew Brost    2023-03-30   99  	else
dd08ebf6c3525a Matthew Brost    2023-03-30  100  		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
dd08ebf6c3525a Matthew Brost    2023-03-30  101  
dd08ebf6c3525a Matthew Brost    2023-03-30  102  	if (params->force_different_devices)
dd08ebf6c3525a Matthew Brost    2023-03-30  103  		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(imported, XE_PL_TT));
dd08ebf6c3525a Matthew Brost    2023-03-30  104  	else
dd08ebf6c3525a Matthew Brost    2023-03-30  105  		KUNIT_EXPECT_TRUE(test, exported == imported);
dd08ebf6c3525a Matthew Brost    2023-03-30  106  }
dd08ebf6c3525a Matthew Brost    2023-03-30  107  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
