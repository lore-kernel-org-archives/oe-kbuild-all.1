Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1071A4964E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 02:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754100378; cv=none; b=MHW/xwxioC6AeRsvshFcWFJD/81FjiNCuw9ILvmy4vn2oFHXeJKtKx+SQYe40gHbqrX05g6n2UsxYLM4l6nrhpBDNvrBFmG4tw855+zzioDgyp2LW/BJGLwq96xj9M0BmyPcWRcHqZrZGgGbM25FP5a7CVCyavjkgOvu2CFvJus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754100378; c=relaxed/simple;
	bh=CeO9+H5Wkv8f40ztt39PVBGF/5d/D/HEC/Zq02+ZlAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SU3VZFMG0vFuqVvXszbKseMp9tABlzW41OwGXd0Kxm/uhw/f3i79xCgXy7gVLnxxWKcUQTqD21ojsctGrTZ9mRnH6xsUfg/N6EkJh9s/eqLOd+MypG92suLu0n87TLgJXIb+uTfNeFG3mHUsdndqnK18yASJIS9wojyz7v0qW3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRHzu07a; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRHzu07a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754100376; x=1785636376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CeO9+H5Wkv8f40ztt39PVBGF/5d/D/HEC/Zq02+ZlAk=;
  b=gRHzu07aPjWb3VTLHRvhl7mr1om7WQ6Dh8MrpMsxSNyRvT9azjRPysIH
   aXLbw68tplqImzBFoEr2t8PLhcJOpAkYabzTVE8u78ldrLy0tIMF+8Qs1
   /Tya15WlMF1mX3aD4mrcczo1bM//d65uq3+rSmMVRHqXBg76cDPCVVU/Q
   SLppI0fvc9Oq4EdUEYxnisbb7XpbtZTMqIsLp2z9iCxPvdvkPSc8OOxa8
   8SG2ZAXOy0b1R0LG0ADeO8ZlBdG7NUSGwE3QVSldFGZgOevMZc/NMPuDZ
   qhEJsfW9qiHXvDGMF+ZQyQKJbWHCzBoy/tiqX4ZnZSy5eiuMRPawpXTyC
   w==;
X-CSE-ConnectionGUID: urRTsZv4SHuFW2rk03f2Xw==
X-CSE-MsgGUID: JT0ZoJN0Tna24uTqiwSliQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56533053"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56533053"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 19:06:16 -0700
X-CSE-ConnectionGUID: LgNeLNgPSp+1Wn4PqI526Q==
X-CSE-MsgGUID: 445MpQXNR/G4Gg0faCKEdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164093941"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Aug 2025 19:06:14 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui1dU-000564-0t;
	Sat, 02 Aug 2025 02:06:12 +0000
Date: Sat, 2 Aug 2025 10:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/state-readout 39/51]
 drivers/gpu/drm/tidss/tidss_dispc.c:2992:1: warning: label 'err_clk_disable'
 defined but not used
Message-ID: <202508021007.dgIrVQ5n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/state-readout
head:   f8f58ab7e9eac7e5daa40ab3f03b67f54ee9e9a4
commit: a002bb9e724a3a99d4e0d030a90d053a61980592 [39/51] [HACK] drm/tidss: dispc: Skip reset
config: arm-randconfig-001-20250802 (https://download.01.org/0day-ci/archive/20250802/202508021007.dgIrVQ5n-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508021007.dgIrVQ5n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508021007.dgIrVQ5n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'dispc_init_hw':
>> drivers/gpu/drm/tidss/tidss_dispc.c:2992:1: warning: label 'err_clk_disable' defined but not used [-Wunused-label]
    2992 | err_clk_disable:
         | ^~~~~~~~~~~~~~~
   At top level:
>> drivers/gpu/drm/tidss/tidss_dispc.c:2939:12: warning: 'dispc_softreset' defined but not used [-Wunused-function]
    2939 | static int dispc_softreset(struct dispc_device *dispc)
         |            ^~~~~~~~~~~~~~~
   In file included from <command-line>:
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'FLD_MOD':
   include/linux/compiler_types.h:568:38: error: call to '__compiletime_assert_438' declared with attribute error: FIELD_PREP: mask is not constant
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:549:4: note: in definition of macro '__compiletime_assert'
     549 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
         |   ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:3: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
         |   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/tidss/tidss_dispc.c:581:26: note: in expansion of macro 'FIELD_PREP'
     581 |  return (orig & ~mask) | FIELD_PREP(mask, val);
         |                          ^~~~~~~~~~
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'REG_GET':
   include/linux/compiler_types.h:568:38: error: call to '__compiletime_assert_443' declared with attribute error: FIELD_GET: mask is not constant
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:549:4: note: in definition of macro '__compiletime_assert'
     549 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
         |   ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:3: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: "); \
         |   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/tidss/tidss_dispc.c:586:9: note: in expansion of macro 'FIELD_GET'
     586 |  return FIELD_GET(mask, dispc_read(dispc, idx));
         |         ^~~~~~~~~


vim +/err_clk_disable +2992 drivers/gpu/drm/tidss/tidss_dispc.c

576d96c5c89622 Tomi Valkeinen  2023-11-09  2938  
aceafbb5035c4b Tomi Valkeinen  2023-11-09 @2939  static int dispc_softreset(struct dispc_device *dispc)
c9b2d923befd8c Devarsh Thakkar 2022-03-14  2940  {
c9b2d923befd8c Devarsh Thakkar 2022-03-14  2941  	u32 val;
c2746e4d278be8 Tomi Valkeinen  2023-11-09  2942  	int ret;
c9b2d923befd8c Devarsh Thakkar 2022-03-14  2943  
576d96c5c89622 Tomi Valkeinen  2023-11-09  2944  	if (dispc->feat->subrev == DISPC_K2G) {
576d96c5c89622 Tomi Valkeinen  2023-11-09  2945  		dispc_softreset_k2g(dispc);
151825150cf9c2 Tomi Valkeinen  2023-11-09  2946  		return 0;
576d96c5c89622 Tomi Valkeinen  2023-11-09  2947  	}
151825150cf9c2 Tomi Valkeinen  2023-11-09  2948  
c9b2d923befd8c Devarsh Thakkar 2022-03-14  2949  	/* Soft reset */
8e7aa9647fd416 Maxime Ripard   2025-07-18  2950  	REG_FLD_MOD(dispc, DSS_SYSCONFIG, 1, DSS_SYSCONFIG_SOFTRESET_MASK);
c9b2d923befd8c Devarsh Thakkar 2022-03-14  2951  	/* Wait for reset to complete */
c9b2d923befd8c Devarsh Thakkar 2022-03-14  2952  	ret = readl_poll_timeout(dispc->base_common + DSS_SYSSTATUS,
c9b2d923befd8c Devarsh Thakkar 2022-03-14  2953  				 val, val & 1, 100, 5000);
aceafbb5035c4b Tomi Valkeinen  2023-11-09  2954  	if (ret) {
aceafbb5035c4b Tomi Valkeinen  2023-11-09  2955  		dev_err(dispc->dev, "failed to reset dispc\n");
aceafbb5035c4b Tomi Valkeinen  2023-11-09  2956  		return ret;
aceafbb5035c4b Tomi Valkeinen  2023-11-09  2957  	}
aceafbb5035c4b Tomi Valkeinen  2023-11-09  2958  
aceafbb5035c4b Tomi Valkeinen  2023-11-09  2959  	return 0;
c9b2d923befd8c Devarsh Thakkar 2022-03-14  2960  }
c9b2d923befd8c Devarsh Thakkar 2022-03-14  2961  
bc288a927815ef Tomi Valkeinen  2023-11-09  2962  static int dispc_init_hw(struct dispc_device *dispc)
bc288a927815ef Tomi Valkeinen  2023-11-09  2963  {
bc288a927815ef Tomi Valkeinen  2023-11-09  2964  	struct device *dev = dispc->dev;
bc288a927815ef Tomi Valkeinen  2023-11-09  2965  	int ret;
bc288a927815ef Tomi Valkeinen  2023-11-09  2966  
bc288a927815ef Tomi Valkeinen  2023-11-09  2967  	ret = pm_runtime_set_active(dev);
bc288a927815ef Tomi Valkeinen  2023-11-09  2968  	if (ret) {
bc288a927815ef Tomi Valkeinen  2023-11-09  2969  		dev_err(dev, "Failed to set DSS PM to active\n");
bc288a927815ef Tomi Valkeinen  2023-11-09  2970  		return ret;
bc288a927815ef Tomi Valkeinen  2023-11-09  2971  	}
bc288a927815ef Tomi Valkeinen  2023-11-09  2972  
bc288a927815ef Tomi Valkeinen  2023-11-09  2973  	ret = clk_prepare_enable(dispc->fclk);
bc288a927815ef Tomi Valkeinen  2023-11-09  2974  	if (ret) {
bc288a927815ef Tomi Valkeinen  2023-11-09  2975  		dev_err(dev, "Failed to enable DSS fclk\n");
bc288a927815ef Tomi Valkeinen  2023-11-09  2976  		goto err_runtime_suspend;
bc288a927815ef Tomi Valkeinen  2023-11-09  2977  	}
bc288a927815ef Tomi Valkeinen  2023-11-09  2978  
a002bb9e724a3a Maxime Ripard   2025-07-25  2979  	/* ret = dispc_softreset(dispc); */
a002bb9e724a3a Maxime Ripard   2025-07-25  2980  	/* if (ret) */
a002bb9e724a3a Maxime Ripard   2025-07-25  2981  	/* 	goto err_clk_disable; */
bc288a927815ef Tomi Valkeinen  2023-11-09  2982  
bc288a927815ef Tomi Valkeinen  2023-11-09  2983  	clk_disable_unprepare(dispc->fclk);
bc288a927815ef Tomi Valkeinen  2023-11-09  2984  	ret = pm_runtime_set_suspended(dev);
bc288a927815ef Tomi Valkeinen  2023-11-09  2985  	if (ret) {
bc288a927815ef Tomi Valkeinen  2023-11-09  2986  		dev_err(dev, "Failed to set DSS PM to suspended\n");
bc288a927815ef Tomi Valkeinen  2023-11-09  2987  		return ret;
bc288a927815ef Tomi Valkeinen  2023-11-09  2988  	}
bc288a927815ef Tomi Valkeinen  2023-11-09  2989  
bc288a927815ef Tomi Valkeinen  2023-11-09  2990  	return 0;
bc288a927815ef Tomi Valkeinen  2023-11-09  2991  
bc288a927815ef Tomi Valkeinen  2023-11-09 @2992  err_clk_disable:
bc288a927815ef Tomi Valkeinen  2023-11-09  2993  	clk_disable_unprepare(dispc->fclk);
bc288a927815ef Tomi Valkeinen  2023-11-09  2994  
bc288a927815ef Tomi Valkeinen  2023-11-09  2995  err_runtime_suspend:
bc288a927815ef Tomi Valkeinen  2023-11-09  2996  	ret = pm_runtime_set_suspended(dev);
bc288a927815ef Tomi Valkeinen  2023-11-09  2997  	if (ret) {
bc288a927815ef Tomi Valkeinen  2023-11-09  2998  		dev_err(dev, "Failed to set DSS PM to suspended\n");
bc288a927815ef Tomi Valkeinen  2023-11-09  2999  		return ret;
bc288a927815ef Tomi Valkeinen  2023-11-09  3000  	}
bc288a927815ef Tomi Valkeinen  2023-11-09  3001  
bc288a927815ef Tomi Valkeinen  2023-11-09  3002  	return ret;
bc288a927815ef Tomi Valkeinen  2023-11-09  3003  }
bc288a927815ef Tomi Valkeinen  2023-11-09  3004  

:::::: The code at line 2992 was first introduced by commit
:::::: bc288a927815efcf9d7f4a54d4d89c5df478c635 drm/tidss: Fix dss reset

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
