Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B253B3BE1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 18:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794324; cv=none; b=j1OLY01+/F60Ojgk/jDmDC5C26zRRZ2WeAcgjKtPcjGHRroEX9OAhK334l+wlmzMiKrrfL3qbey+jFaNjcB0dD5rVtieq6xnNiGjTPpaNEmnUVqRtvEAco5uQMFsF3+sekvTd7Om6nAKl9XLwnFwN7uWqHWjHbGr2LKszNU3Afs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794324; c=relaxed/simple;
	bh=Hb2YGkswt0YO5Ug8ggDyCQ72u+TUp2TgiMEa63bCzpI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MWx+bqwMX8+8Gn4Lci27Q4i+tEov5qG0vlrLGF2tk62wLB2cE7KFDK0gyIjkgaaAQAd7xfdzAlI/aoTj/taMnQeszAw29AFNJz4+nvl/MJAY+t1+UclngOKtCJ24mOElkCegAi0OFU4az/4ngDXWE7XUKb7BTBZ8kHz3zBo55nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YyFZaHm3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YyFZaHm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790794323; x=1822330323;
  h=date:from:to:cc:subject:message-id;
  bh=Hb2YGkswt0YO5Ug8ggDyCQ72u+TUp2TgiMEa63bCzpI=;
  b=YyFZaHm3bWU9QLW6p0OaY4sFC1ymrgqN58i0lRLYcmXhKBkSItMi9FIq
   n0uFCVClGf3W5d0ljR9DyrlqGC4rIdimoq3qQIMtoTN6sYP3tUdrNBVNn
   /FsXSEGhnDUa+pROEu2jpbDNhojf56H1JoMFpFIrNwwtp2JZ0VaUIRjTp
   4cOmm6RShwJyFODF3e9VLDTdBuuZuAgWE7kwpjVEHCe4tUNY4ZUe+yeHC
   sI22E9Gd4raEAeM8FNyNdKunxOBB+O7fNSCqfuowDex8eSE0nqffxbYAi
   EnaxZht6RSPh0HA+aAx2Yk7YdDfz1ZFlXwcLWb+XIthiz5LDSy6zT0b3C
   Q==;
X-CSE-ConnectionGUID: E9ic9qXrR/OBUu1iPlzYUQ==
X-CSE-MsgGUID: wKpGr4BXTXSzUTI2diEZGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="95352279"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="95352279"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 11:52:00 -0700
X-CSE-ConnectionGUID: I5Y9Ts6rR7uyamJW0pvPHA==
X-CSE-MsgGUID: CqyRNOuITkaAeZKZJD5Eag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="275317841"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 30 Sep 2026 11:51:59 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBzPI-000000001y7-3cSp;
	Wed, 30 Sep 2026 18:51:56 +0000
Date: Wed, 30 Sep 2026 20:51:10 +0200
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10241/12559]
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c:336:9: warning: assignment to
 'struct drm_bridge *' from 'int' makes pointer from integer without a cast
Message-ID: <202609302014.WoEXKnE8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Luca,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6c2cb8b8b843d216ab549b678a0d8831c43153e0
commit: aa8a8c7e4641ebcef02dd6fa387ca334857367f4 [10241/12559] drm/bridge: panel: move all code to drm_panel.c
config: parisc-randconfig-r2200-20260930 (https://download.01.org/0day-ci/archive/20260930/202609302014.WoEXKnE8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609302014.WoEXKnE8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609302014.WoEXKnE8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c: In function 'dw_mipi_dsi_host_attach':
   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c:336:11: error: implicit declaration of function 'devm_drm_of_get_bridge'; did you mean 'devm_drm_put_bridge'? [-Werror=implicit-function-declaration]
     336 |  bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
         |           ^~~~~~~~~~~~~~~~~~~~~~
         |           devm_drm_put_bridge
>> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c:336:9: warning: assignment to 'struct drm_bridge *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     336 |  bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
         |         ^
   cc1: some warnings being treated as errors


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
