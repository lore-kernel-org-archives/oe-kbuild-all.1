Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7A01553BB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 17:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961844; cv=none; b=a8B+1QEAGExEACD+8Jy86KjDrXuzm6sBZGC3NvNkiv3UNv6lIeSMuTR7SHiswhyXNqbZVbXypebfhBqJpeuiFAh6wwMTMVQGouTOQcxSYIQRtGZ/YZxzhWOr1t/GeArYakAIJFv/0WDZfYJVvkiOTZBRi/L77j296IIHcaL0L4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961844; c=relaxed/simple;
	bh=JKVaPh2vD+LAuozmIC8zy1eaZkr7rODzBfEw/SZzxtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HtJxGh7OohRdiD2x6zFSBqRpmCiuyge3KOvg4thpMECeIKiC2vifnv74rwy0Ol3Lo01OtjAcS81M/limK1OZCMCV3ZAAFyChNxpl0JZSpFAElNsCGzoKOTGnB8ECKWkzdlm0+eGvyefXbrxE0/AEJwhVswaj4nzjVgFQy3dUYaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezfiyFOv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezfiyFOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736961842; x=1768497842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JKVaPh2vD+LAuozmIC8zy1eaZkr7rODzBfEw/SZzxtg=;
  b=ezfiyFOv0Y6xrzm6JjulDPVjJGeiTLZoHKYJlDbvDILdj8aifJb8wupJ
   GsEstY/b7hmGq6j1uz8kmMn52xmV0QhVsCOXlOcJIg87Ia2IdYH7J99XZ
   PPm1ubkXczPvN6Di7Ug7qKgZ8ll8zJ7ZFq2nC8lVY4JHUB6GTxdT84mYp
   MrXV0gvPVA2LyCkej2pd5OrnWUHwVm+uk0JXM7y7+fybkmewhEQVD8VFa
   dz5H0D4Yq99tEhtWV6LOY3PO1mpSRtIAHp8gW8x+inptLkJHD9HjPNucS
   FCdon06Y2cvlKfcDoWbuuL2XULH//hYDYatLFnfEJajfNkWNWp7WJsMKA
   Q==;
X-CSE-ConnectionGUID: 3zN/sb5wQeyrtj9a3ubS3Q==
X-CSE-MsgGUID: Q/mZWv6IT+Salf/BRS5lGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="36524087"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="36524087"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 09:24:02 -0800
X-CSE-ConnectionGUID: 8yXMHlDoR2C3U1EAs/v88w==
X-CSE-MsgGUID: Qi54Mi5yT0iPa+wri8I+dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="105790378"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jan 2025 09:24:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tY77W-000Qen-0C;
	Wed, 15 Jan 2025 17:23:58 +0000
Date: Thu, 16 Jan 2025 01:23:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 275/275]
 drivers/pmdomain/mediatek/mtk-scpsys.c:943:13: warning: no previous
 prototype for 'init_scp'
Message-ID: <202501160144.VzafSTa7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0014573e8c8416a944ddeb1015b257d2bf148222
commit: 5c7b16c63a5bb549975112a6402d06e91c0a5aea [275/275] CHROMIUM: pmdomain: mediatek: add mt8196 power domain driver
config: i386-buildonly-randconfig-003-20250115 (https://download.01.org/0day-ci/archive/20250116/202501160144.VzafSTa7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160144.VzafSTa7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501160144.VzafSTa7-lkp@intel.com/

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
