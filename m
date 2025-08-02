Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3E042AA1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 01:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754098723; cv=none; b=MY6uNLgnhXN8x3HHCKuUiMtOHTedBqZubbcZnV04aJR3iwUEE4NqOpPr4dG44Ie1F2gBlq9J3CSWnqcl6yEHk0Z2cvJgCIzlOl/QNt1DLUPRON0kEagz5DHEn7o1qqHmFDO/Tfi6LYykCpfmsLi7xIWw4VbkZvshCZrb3+dd4yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754098723; c=relaxed/simple;
	bh=2sfE04cO8cgDd4Fg1avw/Ly9eqct9hagR6UUXU2DAh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tVtlanAK9aixuQ66Xlbrwz1rBvgCpEznpxboxEdu78wFw5/JVFjmvZvRjo48Fp3PA1SMxuDcnaZBLKaiPaYxTRih9ZFpMvI0wUDLfJGJDkjKkKbCe5MKgZBtsSq6vaMGEaOguxOpjgUR2ILwXQXH2xTqNvrjEu8oTforDwcWsVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxbEGVLN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxbEGVLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754098721; x=1785634721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2sfE04cO8cgDd4Fg1avw/Ly9eqct9hagR6UUXU2DAh4=;
  b=WxbEGVLNVuMfRMXFlf1rk3V3QyTAt53rm4x2QldN2EfjQ65O/m4fV2iM
   Do8tuY1zDtGF0aTdzZs3tDb6vBb4oFJgPA9dGUVOzOJf//rkpUjuLHZpM
   PG/Xk6J+NSu7IuNSLZIHahPcpI2+RLjhenbbTGZt9PVzelEaG7A8pw6G/
   5K5gme0nfGyoYcw1QUqBmLiMmxD83yAgW312QG9lyIovvV3ksVwOxKvA5
   uD7NF338lk8048NQo+eKWCgdfo1ILaaHW5cbzuU4BWn91+ta7n+7g2ROm
   +lV4otvn68P27wgbs5itVZkdCRxzx4qpx6jZHVRfuQR5ex0YnJW4Vs500
   w==;
X-CSE-ConnectionGUID: I//9Cx6qS9Kx+hIG8a+yaA==
X-CSE-MsgGUID: phYkaghOQhKkil1N7S1Q/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67815411"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67815411"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 18:38:41 -0700
X-CSE-ConnectionGUID: KdcgouR2QtGNevIybS6n/A==
X-CSE-MsgGUID: FOMdlO0lRia53mMl2iLm8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168170081"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 01 Aug 2025 18:38:40 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui1Cn-0001Kd-1R;
	Sat, 02 Aug 2025 01:38:37 +0000
Date: Sat, 2 Aug 2025 03:38:00 +0200
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/state-readout 39/51]
 drivers/gpu/drm/tidss/tidss_dispc.c:2992:1: warning: label 'err_clk_disable'
 defined but not used
Message-ID: <202508020338.YXfUAVLi-lkp@intel.com>
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
config: parisc-randconfig-2001-20250801 (https://download.01.org/0day-ci/archive/20250802/202508020338.YXfUAVLi-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020338.YXfUAVLi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020338.YXfUAVLi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/gpu/drm/tidss/tidss_dispc.c:7:
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'CH':
   drivers/gpu/drm/tidss/tidss_dispc.c:483:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     483 |         WARN_ON((dispc->dev->power.runtime_status != RPM_ACTIVE) &&
         |                                   ^
   arch/parisc/include/asm/bug.h:86:32: note: in definition of macro 'WARN_ON'
      86 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   drivers/gpu/drm/tidss/tidss_dispc.c:484:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     484 |                 (dispc->dev->power.runtime_status != RPM_RESUMING) &&
         |                                   ^
   arch/parisc/include/asm/bug.h:86:32: note: in definition of macro 'WARN_ON'
      86 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   drivers/gpu/drm/tidss/tidss_dispc.c:485:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     485 |                 (dispc->dev->power.runtime_status != RPM_SUSPENDING));
         |                                   ^
   arch/parisc/include/asm/bug.h:86:32: note: in definition of macro 'WARN_ON'
      86 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'FLD_MOD':
   drivers/gpu/drm/tidss/tidss_dispc.c:581:33: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     581 |         return (orig & ~mask) | FIELD_PREP(mask, val);
         |                                 ^~~~~~~~~~
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'REG_GET':
   drivers/gpu/drm/tidss/tidss_dispc.c:586:16: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     586 |         return FIELD_GET(mask, dispc_read(dispc, idx));
         |                ^~~~~~~~~
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'dispc_init_hw':
>> drivers/gpu/drm/tidss/tidss_dispc.c:2992:1: warning: label 'err_clk_disable' defined but not used [-Wunused-label]
    2992 | err_clk_disable:
         | ^~~~~~~~~~~~~~~
   drivers/gpu/drm/tidss/tidss_dispc.c: At top level:
>> drivers/gpu/drm/tidss/tidss_dispc.c:2939:12: warning: 'dispc_softreset' defined but not used [-Wunused-function]
    2939 | static int dispc_softreset(struct dispc_device *dispc)
         |            ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
