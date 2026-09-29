Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BE5352027
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 04:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790654437; cv=none; b=nf8yjCilkqlJqFQgXeYI+lVeo0lTr0PdC2ZqGpiH8ufUvLtV1IHgs6fsWD63p0TfuY7++d0h8t6LoSRjUJ1sMayjDsyEGV9dUz/jrsl5yhhtM6bB9VdvTxBIZ/lfhujhGaG7tGUK30VnjfQ5Yi3Q11gSvYjVvR1liCvNtU5pwqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790654437; c=relaxed/simple;
	bh=bF0/i+OoAJuYBkUZODAtITs0pf5fNefkQuD7hnlZWZ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WjdowAjtHQ4HSTbPCCTGXsnZ/8IiT+6HtLKw98EX5ieQAs9X/guy2h54z/TpDHQUqDMtE95xkl28zzwQR6D8a86tiDXS0ncTkmO6Gx/05Uid60e+EjCjRnkZDCBS8GNOytq9RF40sP7hzWd860qYQzK0W9o3S51OCBYyddjfHn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hcPqK35r; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hcPqK35r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790654434; x=1822190434;
  h=date:from:to:cc:subject:message-id;
  bh=bF0/i+OoAJuYBkUZODAtITs0pf5fNefkQuD7hnlZWZ8=;
  b=hcPqK35r8nzeA04lWmbfKF4s+wFCdcRP/S3+jfr7UffjGQSEZ1v9bAyT
   C1nbpM9WgF9Ao/9jPiu3TujQm/XGS3pSwDlJrr5FjN4pgVqwfN6ljlPIT
   1wBSfqnEcL5jggyIiJe6b+T7xxkEi66/OVSE2rlg8GeDny3sceRezRf3x
   QR1kxET74remJOcMWRIv47/BMBSoW0Ws/BlxYdrqtmnYU9dajbuzP0DBk
   zClvP/OCs5o6fGcPcnTAZPITnG5K0eiYuV0NHEalnmb1FzlDjKnyqSqcu
   kXzcm/8KF8N/xgwUegg4cECZhv/ol77/xICn/R3fcPcm97yD1s+wWtYSx
   w==;
X-CSE-ConnectionGUID: EQoZSxkZTwKzujWNh8couA==
X-CSE-MsgGUID: f1jAkUKFTHS1JlVeE2eeng==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90494631"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90494631"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 21:00:30 -0700
X-CSE-ConnectionGUID: knHDy0y4QrWq7nKC8r8lxg==
X-CSE-MsgGUID: MVPmTp7bQjWAgQRExxP88A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="275271270"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Sep 2026 21:00:29 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBP10-00000000Ov5-2mcw;
	Tue, 29 Sep 2026 04:00:26 +0000
Date: Tue, 29 Sep 2026 11:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 11138/11456]
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c:336:18: error: implicit
 declaration of function 'devm_drm_of_get_bridge'; did you mean
 'devm_drm_put_bridge'?
Message-ID: <202609291109.9RGna4XZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Luca,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6375e61c01e93e35ee7acd336a689ac1fae4b509
commit: aa8a8c7e4641ebcef02dd6fa387ca334857367f4 [11138/11456] drm/bridge: panel: move all code to drm_panel.c
config: i386-buildonly-randconfig-1001-20260929 (https://download.01.org/0day-ci/archive/20260929/202609291109.9RGna4XZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609291109.9RGna4XZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609291109.9RGna4XZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c: In function 'dw_mipi_dsi_host_attach':
>> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c:336:18: error: implicit declaration of function 'devm_drm_of_get_bridge'; did you mean 'devm_drm_put_bridge'? [-Wimplicit-function-declaration]
     336 |         bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
         |                  ^~~~~~~~~~~~~~~~~~~~~~
         |                  devm_drm_put_bridge
>> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c:336:16: error: assignment to 'struct drm_bridge *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     336 |         bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
         |                ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]


vim +336 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c

46fc51546d4406 Philippe CORNU   2017-07-17  316  
46fc51546d4406 Philippe CORNU   2017-07-17  317  static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
46fc51546d4406 Philippe CORNU   2017-07-17  318  				   struct mipi_dsi_device *device)
46fc51546d4406 Philippe CORNU   2017-07-17  319  {
46fc51546d4406 Philippe CORNU   2017-07-17  320  	struct dw_mipi_dsi *dsi = host_to_dsi(host);
90910a6511238d Heiko Stuebner   2018-10-01  321  	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
65af9070cd09a9 Jagan Teki       2022-03-31  322  	struct drm_bridge *bridge;
46fc51546d4406 Philippe CORNU   2017-07-17  323  	int ret;
46fc51546d4406 Philippe CORNU   2017-07-17  324  
46fc51546d4406 Philippe CORNU   2017-07-17  325  	if (device->lanes > dsi->plat_data->max_data_lanes) {
46fc51546d4406 Philippe CORNU   2017-07-17  326  		dev_err(dsi->dev, "the number of data lanes(%u) is too many\n",
46fc51546d4406 Philippe CORNU   2017-07-17  327  			device->lanes);
46fc51546d4406 Philippe CORNU   2017-07-17  328  		return -EINVAL;
46fc51546d4406 Philippe CORNU   2017-07-17  329  	}
46fc51546d4406 Philippe CORNU   2017-07-17  330  
46fc51546d4406 Philippe CORNU   2017-07-17  331  	dsi->lanes = device->lanes;
46fc51546d4406 Philippe CORNU   2017-07-17  332  	dsi->channel = device->channel;
46fc51546d4406 Philippe CORNU   2017-07-17  333  	dsi->format = device->format;
46fc51546d4406 Philippe CORNU   2017-07-17  334  	dsi->mode_flags = device->mode_flags;
46fc51546d4406 Philippe CORNU   2017-07-17  335  
1c74c1fb83ebb4 Jagan Teki       2022-03-31 @336  	bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
65af9070cd09a9 Jagan Teki       2022-03-31  337  	if (IS_ERR(bridge))
65af9070cd09a9 Jagan Teki       2022-03-31  338  		return PTR_ERR(bridge);
46fc51546d4406 Philippe CORNU   2017-07-17  339  
05aa61334592ad Ondrej Jirman    2023-06-18  340  	bridge->pre_enable_prev_first = true;
65af9070cd09a9 Jagan Teki       2022-03-31  341  	dsi->panel_bridge = bridge;
65af9070cd09a9 Jagan Teki       2022-03-31  342  
65af9070cd09a9 Jagan Teki       2022-03-31  343  	drm_bridge_add(&dsi->bridge);
65af9070cd09a9 Jagan Teki       2022-03-31  344  
90910a6511238d Heiko Stuebner   2018-10-01  345  	if (pdata->host_ops && pdata->host_ops->attach) {
90910a6511238d Heiko Stuebner   2018-10-01  346  		ret = pdata->host_ops->attach(pdata->priv_data, device);
90910a6511238d Heiko Stuebner   2018-10-01  347  		if (ret < 0)
be19b43f92fae4 Osama Abdelkader 2026-04-03  348  			goto err_remove_bridge;
90910a6511238d Heiko Stuebner   2018-10-01  349  	}
90910a6511238d Heiko Stuebner   2018-10-01  350  
46fc51546d4406 Philippe CORNU   2017-07-17  351  	return 0;
be19b43f92fae4 Osama Abdelkader 2026-04-03  352  
be19b43f92fae4 Osama Abdelkader 2026-04-03  353  err_remove_bridge:
be19b43f92fae4 Osama Abdelkader 2026-04-03  354  	drm_bridge_remove(&dsi->bridge);
be19b43f92fae4 Osama Abdelkader 2026-04-03  355  	return ret;
46fc51546d4406 Philippe CORNU   2017-07-17  356  }
46fc51546d4406 Philippe CORNU   2017-07-17  357  

:::::: The code at line 336 was first introduced by commit
:::::: 1c74c1fb83ebb414c017d459e7875abe777654d7 drm: bridge: dw-mipi-dsi: Switch to devm_drm_of_get_bridge

:::::: TO: Jagan Teki <jagan@amarulasolutions.com>
:::::: CC: Robert Foss <robert.foss@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
