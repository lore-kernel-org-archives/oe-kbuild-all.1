Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068441D8DEE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 20:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736974150; cv=none; b=t3/XAXrRUbXuUyRjEv/6A9eteUJgRnOUsQenuWZ01zj67i14EQz2GM6fy70SXrmBdIPuN+cG8VjPlH6/vO20jaE9pe2DEdADA1Ue21cEM5H7iOw69kRo5lEiZsKcgZXzIQVieYMyb/y91jWIjxhTo6h+RrTYxbsq8jlPzd0fK7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736974150; c=relaxed/simple;
	bh=45KRq1ghj31ossxRv9yggknnbXx+95S1ihlvmgWJjnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aoMMg9298pDI4fbjbaTLDlZNHg2r+av/GFITHQSLPMvdt71apiQJZwBE5VWF+E8pAp/ux6eP7Qox8e7DSDIDqLS9u2Ky4C9IvttAXjJwjxHCm2zcPmwYLmOc51hm7aA22Xg1+l9yTfQY+CCWEf8EqROff84X6ky1MqNwi7iOTYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNropGjL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNropGjL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736974149; x=1768510149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=45KRq1ghj31ossxRv9yggknnbXx+95S1ihlvmgWJjnM=;
  b=FNropGjLTInaFn6QkHqCOM/kpfzCszQYZxvX5LMId42xNA+DoCF/ND9R
   yGzt5emGqDeXNFlZHFb0tafktOuoaRUmsWpgSlM26Ae9/qRKD66I2YEHE
   Llqa0FoZZ+zHxKALJ+TuE/w5FsD5Qhpf6J58ioUANVokgZEdiLZ5w4iLX
   oJw1bPKtXDdRuovM1nS+Em6gyZNEOJHXRcTNpn5Ryi1tBE7dMkYajl0Ut
   NhE2D7JEm8qqrITSFZE+ai6JRKuyn0CuX+zcfgVFcRZKwvQuhGLLHCcAL
   RuRZtzgBjTgl0/CLMpLoG+7GMAAf7q+ae6CuzM6uS7aWABX5pRSwxdE9H
   Q==;
X-CSE-ConnectionGUID: 0LqfuW13Q86pMLZKq097pQ==
X-CSE-MsgGUID: ZR1iYNzFSge+TVLwen8+7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="24926735"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="24926735"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 12:49:08 -0800
X-CSE-ConnectionGUID: wv68XJrvTJmJYdJS9qfpCw==
X-CSE-MsgGUID: g4HzVZixTMuQvfaTeXWwow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="136101546"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jan 2025 12:49:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYAK0-000Qpz-2A;
	Wed, 15 Jan 2025 20:49:04 +0000
Date: Thu, 16 Jan 2025 04:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 278/278]
 drivers/pmdomain/mediatek/mtk-scpsys.c:943:13: warning: no previous
 prototype for function 'init_scp'
Message-ID: <202501160421.8q0cJQQr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   48b50213e678679ceae03f9a6b223e7f5827df88
commit: 5c7b16c63a5bb549975112a6402d06e91c0a5aea [278/278] CHROMIUM: pmdomain: mediatek: add mt8196 power domain driver
config: x86_64-buildonly-randconfig-005-20250116 (https://download.01.org/0day-ci/archive/20250116/202501160421.8q0cJQQr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160421.8q0cJQQr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501160421.8q0cJQQr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pmdomain/mediatek/mtk-scpsys.c:14:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/pmdomain/mediatek/mtk-scpsys.c:943:13: warning: no previous prototype for function 'init_scp' [-Wmissing-prototypes]
     943 | struct scp *init_scp(struct platform_device *pdev, const struct scp_soc_data *soc)
         |             ^
   drivers/pmdomain/mediatek/mtk-scpsys.c:943:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     943 | struct scp *init_scp(struct platform_device *pdev, const struct scp_soc_data *soc)
         | ^
         | static 
   2 warnings generated.


vim +/init_scp +943 drivers/pmdomain/mediatek/mtk-scpsys.c

   942	
 > 943	struct scp *init_scp(struct platform_device *pdev, const struct scp_soc_data *soc)
   944	{
   945		struct genpd_onecell_data *pd_data;
   946		struct resource *res;
   947		int i, j;
   948		struct scp *scp;
   949		struct clk *clk[CLK_MAX];
   950		int ret;
   951	
   952		scp = devm_kzalloc(&pdev->dev, sizeof(*scp), GFP_KERNEL);
   953		if (!scp)
   954			return ERR_PTR(-ENOMEM);
   955	
   956		scp->ctrl_reg.pwr_sta_offs = soc->regs.pwr_sta_offs;
   957		scp->ctrl_reg.pwr_sta2nd_offs = soc->regs.pwr_sta2nd_offs;
   958	
   959		scp->bus_prot_reg_update = soc->bus_prot_reg_update;
   960	
   961		scp->dev = &pdev->dev;
   962	
   963		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   964		scp->base = devm_ioremap_resource(&pdev->dev, res);
   965		if (IS_ERR(scp->base))
   966			return ERR_CAST(scp->base);
   967	
   968		scp->domains = devm_kcalloc(&pdev->dev,
   969					soc->num_domains, sizeof(*scp->domains), GFP_KERNEL);
   970		if (!scp->domains)
   971			return ERR_PTR(-ENOMEM);
   972	
   973		pd_data = &scp->pd_data;
   974	
   975		pd_data->domains = devm_kcalloc(&pdev->dev,
   976				soc->num_domains, sizeof(*pd_data->domains), GFP_KERNEL);
   977		if (!pd_data->domains)
   978			return ERR_PTR(-ENOMEM);
   979	
   980		if (soc->bp_list && soc->num_bp > 0) {
   981			scp->num_bp = soc->num_bp;
   982			scp->bp_regmap = devm_kcalloc(&pdev->dev,
   983					scp->num_bp, sizeof(*scp->bp_regmap), GFP_KERNEL);
   984			if (!scp->bp_regmap)
   985				return ERR_PTR(-ENOMEM);
   986	
   987			/* get bus prot regmap from dts node, 0 means invalid bus type */
   988			for (i = 1; i < scp->num_bp; i++) {
   989				ret = mtk_pd_get_regmap(pdev, &scp->bp_regmap[i], soc->bp_list[i]);
   990				if (ret)
   991					return ERR_PTR(ret);
   992			}
   993		} else {
   994			scp->infracfg = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
   995					"infracfg");
   996			if (IS_ERR(scp->infracfg)) {
   997				dev_err(&pdev->dev, "Cannot find infracfg controller: %ld\n",
   998						PTR_ERR(scp->infracfg));
   999				return ERR_CAST(scp->infracfg);
  1000			}
  1001		}
  1002	
  1003		for (i = 0; i < soc->num_domains; i++) {
  1004			struct scp_domain *scpd = &scp->domains[i];
  1005			const struct scp_domain_data *data = &soc->domains[i];
  1006	
  1007			scpd->supply = devm_regulator_get_optional(&pdev->dev, data->name);
  1008			if (IS_ERR(scpd->supply)) {
  1009				if (PTR_ERR(scpd->supply) == -ENODEV)
  1010					scpd->supply = NULL;
  1011				else
  1012					return ERR_CAST(scpd->supply);
  1013			}
  1014		}
  1015	
  1016		pd_data->num_domains = soc->num_domains;
  1017	
  1018		init_clks(pdev, clk);
  1019	
  1020		for (i = 0; i < soc->num_domains; i++) {
  1021			struct scp_domain *scpd = &scp->domains[i];
  1022			struct generic_pm_domain *genpd = &scpd->genpd;
  1023			const struct scp_domain_data *data = &soc->domains[i];
  1024	
  1025			pd_data->domains[i] = genpd;
  1026			scpd->scp = scp;
  1027	
  1028			scpd->data = data;
  1029	
  1030			for (j = 0; j < MAX_CLKS && data->clk_id[j]; j++) {
  1031				struct clk *c = clk[data->clk_id[j]];
  1032	
  1033				if (IS_ERR(c)) {
  1034					dev_err(&pdev->dev, "%s: clk unavailable\n",
  1035						data->name);
  1036					return ERR_CAST(c);
  1037				}
  1038	
  1039				scpd->clk[j] = c;
  1040			}
  1041	
  1042			if (data->hwv_comp) {
  1043				ret = mtk_pd_get_regmap(pdev, &scpd->hwv_regmap, data->hwv_comp);
  1044				if (ret)
  1045					return ERR_PTR(ret);
  1046			}
  1047	
  1048			genpd->name = data->name;
  1049			if (MTK_SCPD_CAPS(scpd, MTK_SCPD_HWV_OPS)) {
  1050				genpd->power_on = scpsys_hwv_power_on;
  1051				genpd->power_off = scpsys_hwv_power_off;
  1052			} else {
  1053				genpd->power_off = scpsys_power_off;
  1054				genpd->power_on = scpsys_power_on;
  1055			}
  1056			if (MTK_SCPD_CAPS(scpd, MTK_SCPD_ACTIVE_WAKEUP))
  1057				genpd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
  1058			if (MTK_SCPD_CAPS(scpd, MTK_SCPD_IRQ_SAVE))
  1059				genpd->flags |= GENPD_FLAG_IRQ_SAFE;
  1060			if (MTK_SCPD_CAPS(scpd, MTK_SCPD_ALWAYS_ON))
  1061				genpd->flags |= GENPD_FLAG_ALWAYS_ON;
  1062		}
  1063	
  1064		return scp;
  1065	}
  1066	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
