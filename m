Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8326C415B7E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 05:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142320; cv=none; b=cs5791qmhgbmiqq9aoz3vQShdqmzQGmXsDG9TCOiwLG0m7oaS1AV4I0nVnfQkdFfTpJ6V5OUOXoNrXhHGUuI/QSCW2tOycMKS2jpTV0kE4jC1+wfQSjlAuzctebEW0Ip3WIkJEl7ipd/P+xo9gHViUIxHN63o9kwqHjxqNHdjp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142320; c=relaxed/simple;
	bh=j+tg3tYTAxcFVa28hA2mOcdgmEsEaFuQ8BaZ8PMSKLk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mM7SEU1ABIcKUqQMivCkpfB+WLB6Xm0WU/WHn2R7+pOXzn9XpOB1LTwlPZwTZotwY3y3K6s5yy9B5YVtXkskouckGX1Ag8OM7jrlpsUQ8YCLlkGvd5W6D6NHn0z8T8OXZrhEWT+ruGMM7Aijbx2nbZW8JBQyIfldw0FVktTbUsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mKzI3pJD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKzI3pJD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790142319; x=1821678319;
  h=date:from:to:cc:subject:message-id;
  bh=j+tg3tYTAxcFVa28hA2mOcdgmEsEaFuQ8BaZ8PMSKLk=;
  b=mKzI3pJDieYACsBsJ9ER1otJraEb7RWSPsS9J8UjXv5RZJm4No5Dt/X9
   vuf1lzSWmFgOW6VP9n3qpzAJdyzuWDJHMeQ3AP69R9DrdbYSX+L5jdp3Y
   uNfZXnCjo1kI6W2RRkM3Hf+2Nde5KEpU5nl3IeEcwlJWoub9rCWudFH/v
   RZfOVy+uqIePgnoG6SBJiTbn7AjxBk6EJSv94lo4txkM7xvxW7S6sT+AT
   1hPp/8ze6d6QuRUykCHCij9zuRQ+/oe9lZOxzpdrmIGi+1owZB4YefgSZ
   3bsSW2pnVDYHPbT8ie4nVZi4q9lc8/N3TldKV2Bp1M+JRkUY1rhdGIJC/
   A==;
X-CSE-ConnectionGUID: M90jaNjIT0CXHW7O16JuzA==
X-CSE-MsgGUID: 0yKUJLNvSPe+jef3CPJyPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="102160710"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="102160710"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:45:15 -0700
X-CSE-ConnectionGUID: 5xs9ohy4QeewnSy5xxS5Xg==
X-CSE-MsgGUID: Lpjfu7PISBWcvT8Eb+6NAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="272656864"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Sep 2026 22:45:13 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Fn4-00000000Gam-45RD;
	Wed, 23 Sep 2026 05:45:10 +0000
Date: Wed, 23 Sep 2026 13:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jonhunter:tegra/phy 7/8] drivers/phy/tegra/xusb.c:1260:48:
 warning: too many arguments for format
Message-ID: <202609231315.OCykhu1i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jonhunter/linux tegra/phy
head:   9e9fa3f13e336e32163c18c43a5543007dd180fc
commit: 2116b46dd4b4aa9036f83bdbd828d6aa6fec9bed [7/8] phy: tegra: xusb: Use dev_err_probe()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260923/202609231315.OCykhu1i-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231315.OCykhu1i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231315.OCykhu1i-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/tegra/xusb.c: In function 'tegra_xusb_padctl_probe':
>> drivers/phy/tegra/xusb.c:1260:48: warning: too many arguments for format [-Wformat-extra-args]
    1260 |                 dev_err_probe(&pdev->dev, err, "failed to setup XUSB ports\n",
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1260 drivers/phy/tegra/xusb.c

  1180	
  1181	static int tegra_xusb_padctl_probe(struct platform_device *pdev)
  1182	{
  1183		struct device_node *np = pdev->dev.of_node;
  1184		const struct tegra_xusb_padctl_soc *soc;
  1185		struct tegra_xusb_padctl *padctl;
  1186		const struct of_device_id *match;
  1187		int err;
  1188	
  1189		/* for backwards compatibility with old device trees */
  1190		np = of_get_child_by_name(np, "pads");
  1191		if (!np) {
  1192			dev_warn(&pdev->dev, "deprecated DT, using legacy driver\n");
  1193			return tegra_xusb_padctl_legacy_probe(pdev);
  1194		}
  1195	
  1196		of_node_put(np);
  1197	
  1198		match = of_match_node(tegra_xusb_padctl_of_match, pdev->dev.of_node);
  1199		soc = match->data;
  1200	
  1201		padctl = soc->ops->probe(&pdev->dev, soc);
  1202		if (IS_ERR(padctl))
  1203			return PTR_ERR(padctl);
  1204	
  1205		platform_set_drvdata(pdev, padctl);
  1206		INIT_LIST_HEAD(&padctl->ports);
  1207		INIT_LIST_HEAD(&padctl->lanes);
  1208		INIT_LIST_HEAD(&padctl->pads);
  1209		mutex_init(&padctl->lock);
  1210	
  1211		padctl->regs = devm_platform_ioremap_resource(pdev, 0);
  1212		if (IS_ERR(padctl->regs)) {
  1213			err = PTR_ERR(padctl->regs);
  1214			goto remove;
  1215		}
  1216	
  1217		padctl->rst = devm_reset_control_get(&pdev->dev, NULL);
  1218		if (IS_ERR(padctl->rst)) {
  1219			err = PTR_ERR(padctl->rst);
  1220			goto remove;
  1221		}
  1222	
  1223		padctl->supplies = devm_kcalloc(&pdev->dev, padctl->soc->num_supplies,
  1224						sizeof(*padctl->supplies), GFP_KERNEL);
  1225		if (!padctl->supplies) {
  1226			err = -ENOMEM;
  1227			goto remove;
  1228		}
  1229	
  1230		regulator_bulk_set_supply_names(padctl->supplies,
  1231						padctl->soc->supply_names,
  1232						padctl->soc->num_supplies);
  1233	
  1234		err = devm_regulator_bulk_get(&pdev->dev, padctl->soc->num_supplies,
  1235					      padctl->supplies);
  1236		if (err < 0) {
  1237			dev_err_probe(&pdev->dev, err, "failed to get regulators\n");
  1238			goto remove;
  1239		}
  1240	
  1241		err = reset_control_deassert(padctl->rst);
  1242		if (err < 0)
  1243			goto remove;
  1244	
  1245		err = regulator_bulk_enable(padctl->soc->num_supplies,
  1246					    padctl->supplies);
  1247		if (err < 0) {
  1248			dev_err(&pdev->dev, "failed to enable supplies: %d\n", err);
  1249			goto reset;
  1250		}
  1251	
  1252		err = tegra_xusb_setup_pads(padctl);
  1253		if (err < 0) {
  1254			dev_err(&pdev->dev, "failed to setup pads: %d\n", err);
  1255			goto power_down;
  1256		}
  1257	
  1258		err = tegra_xusb_setup_ports(padctl);
  1259		if (err) {
> 1260			dev_err_probe(&pdev->dev, err, "failed to setup XUSB ports\n",
  1261				      err);
  1262			goto remove_pads;
  1263		}
  1264	
  1265		return 0;
  1266	
  1267	remove_pads:
  1268		tegra_xusb_remove_pads(padctl);
  1269	power_down:
  1270		regulator_bulk_disable(padctl->soc->num_supplies, padctl->supplies);
  1271	reset:
  1272		reset_control_assert(padctl->rst);
  1273	remove:
  1274		platform_set_drvdata(pdev, NULL);
  1275		soc->ops->remove(padctl);
  1276		return err;
  1277	}
  1278	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
