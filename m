Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EB0146593
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 01:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748915896; cv=none; b=B+AeU5H90lMdZLFMZ93pzEtmvU9bF9XRagoLcSZ2+u4CDLSr7ZxsmChcazILiWuwkFISSMsjykw5ZetMKlobv5TNbsqmKrN7U3XA65quKMosqllXDV8rTAyMOJ0nQb4wcFezYk59O+zc4fWgl0oTNVng2qN3BIlP4CN5qSO8B0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748915896; c=relaxed/simple;
	bh=EgIMKLdIKVEbKO76xMQb+kK9JO/V2l5L7kxuNca6UoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FsdXdTRnTSd2L3X1/IOhz5dAOKZ3tRlIdg7LcGtMW2URUbFhB/MhXeRcUbBssEwUPNiolPrvbgCEgOmveZlbLz1xMLYXSMIwqpd7cYbkjLpfgSTntp/Qf9HvMG2s7DN51w4BabRmThFsWNtdna9JNaUKixCxdRi+/ZrLOVE+7/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9bKXUtz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9bKXUtz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748915894; x=1780451894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EgIMKLdIKVEbKO76xMQb+kK9JO/V2l5L7kxuNca6UoI=;
  b=m9bKXUtzMOKbDN7b5by1hTKsYA72NpoAD/TyuNqNDnuFUj7zySAkcroG
   mgqOAqisMD6Ns+ZAg/BJUJI1FUP1WGLTwqWkQP52d7X9AEBAWa8pKlVc5
   4rTZgjUhBQMVIlHblXm4ChTltcpUwjq56az+AJvvkFnY53C8m5LYtHbEh
   FP72YlEKUJVzX6/jur3qWUlVCgM78/CKsCpaZXUllIQkVwGEJ+ryo/LYw
   vX+PyvEc0ur6M/vhXHDHM+2kea/OQA8zbtPXMP7492xiGNYrTum2yJ9yS
   q6xS37s0ChKlzb+kbVPpcTdGP12KegCRCwmksqNwTHtmh/SgwnLX27f7m
   Q==;
X-CSE-ConnectionGUID: WeVk3914RE+TOMaAh0/RJw==
X-CSE-MsgGUID: Ge+oO1d9TZOxlEpHIZbN6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50943247"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="50943247"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 18:58:14 -0700
X-CSE-ConnectionGUID: 2OW4rlZKRbOK120lplUdDQ==
X-CSE-MsgGUID: B4iHFzjqTXWqTcwDlV4Dog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="144740966"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Jun 2025 18:58:13 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMGuo-0001Os-1z;
	Tue, 03 Jun 2025 01:58:10 +0000
Date: Tue, 3 Jun 2025 09:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 0/1]
 drivers/pmdomain/mediatek/mtk-scpsys.c:943:13: warning: no previous
 prototype for 'init_scp'
Message-ID: <202506030958.mSGcyQit-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   21fc2218c3dfde22b522a0352bb0112b85d0fe72
commit: 8fbb5225739855cb83c9a9661af26cf825b332dd [0/1] CHROMIUM: pmdomain: mediatek: add mt8196 power domain driver
config: i386-buildonly-randconfig-2003-20250502 (https://download.01.org/0day-ci/archive/20250603/202506030958.mSGcyQit-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506030958.mSGcyQit-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506030958.mSGcyQit-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/mediatek/mtk-scpsys.c:943:13: warning: no previous prototype for 'init_scp' [-Wmissing-prototypes]
     943 | struct scp *init_scp(struct platform_device *pdev, const struct scp_soc_data *soc)
         |             ^~~~~~~~
--
>> drivers/pmdomain/mediatek/mtk-scpsys.c:206: warning: Function parameter or member 'hwv_comp' not described in 'scp_domain_data'
>> drivers/pmdomain/mediatek/mtk-scpsys.c:206: warning: Function parameter or member 'hwv_done_ofs' not described in 'scp_domain_data'
>> drivers/pmdomain/mediatek/mtk-scpsys.c:206: warning: Function parameter or member 'hwv_ofs' not described in 'scp_domain_data'
>> drivers/pmdomain/mediatek/mtk-scpsys.c:206: warning: Function parameter or member 'hwv_set_ofs' not described in 'scp_domain_data'
>> drivers/pmdomain/mediatek/mtk-scpsys.c:206: warning: Function parameter or member 'hwv_clr_ofs' not described in 'scp_domain_data'
>> drivers/pmdomain/mediatek/mtk-scpsys.c:206: warning: Function parameter or member 'hwv_en_ofs' not described in 'scp_domain_data'
>> drivers/pmdomain/mediatek/mtk-scpsys.c:206: warning: Function parameter or member 'hwv_set_sta_ofs' not described in 'scp_domain_data'
>> drivers/pmdomain/mediatek/mtk-scpsys.c:206: warning: Function parameter or member 'hwv_clr_sta_ofs' not described in 'scp_domain_data'
>> drivers/pmdomain/mediatek/mtk-scpsys.c:206: warning: Function parameter or member 'hwv_shift' not described in 'scp_domain_data'
>> drivers/pmdomain/mediatek/mtk-scpsys.c:206: warning: Function parameter or member 'sram_slp_bits' not described in 'scp_domain_data'
>> drivers/pmdomain/mediatek/mtk-scpsys.c:206: warning: Function parameter or member 'sram_slp_ack_bits' not described in 'scp_domain_data'
>> drivers/pmdomain/mediatek/mtk-scpsys.c:206: warning: Function parameter or member 'bp_table' not described in 'scp_domain_data'


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
