Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9231E871
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736078559; cv=none; b=Irw0sx3/Ud6xftYPTzEkqwq05UQSyXp00uWBoq+jx6Dk9f95xmNTq0DGZa3DkVhtjLI00jhjw2Psb8g3PqBS1GIikXWsq6mFjkc8JrfdsGzhRVCUMCszA+OZo1LILm8IeLCLLgO5XXqy/gOrOxT7nBabICwtfkPQIXElRXbFiJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736078559; c=relaxed/simple;
	bh=qzagKvGRcOTTZ40B33iHwZuNQGfSYXTeW7uc0KnSRsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=einRb7Rx/MN5ZCNkPjMd82g0it7rX109KV2JgKtCscGUHZ8vHuH5m3WYKWM3HEgzaSP3Smq2PSy0QQXLm8ZaCFu9ijP7lNJ8wdpY8bnHknW8X3x33+EVnwfjXOhogpXTc5xx61YjFAWkYlhxEou+7uHtM+y1V7vP/HytdxQJiIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xki1O5J1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xki1O5J1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736078558; x=1767614558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qzagKvGRcOTTZ40B33iHwZuNQGfSYXTeW7uc0KnSRsw=;
  b=Xki1O5J1hBeHD/BY8RYcUDtrd7biOCSnNQGOVxg0rquQ11hc40mGOISU
   NHypLXlvsAuDhOl8PjL10TD5B5sELyhfjt8Uszx/1mc6thpMVWpomaSZC
   ggLfyxGiKoBfDgQgd9nDTVdgP8ixp95T8vW29rvVgmnHSXRU4Y94jG0JI
   Q5KvlAEiJfmbILN/7Cjv37bfFh+m3z5xUSavtWspXBgjqwzX920mUc8AC
   8oTDJm06Qc8fDAqn85djabjQRfX4TcUedIWY0E4UoF1/PotZSmvAwxcJF
   b2w9X3fjuLIZBzRHqDnJ+HAWnFMCZ4SD1mKFrNFNyvRWVdf1li50wHKKp
   Q==;
X-CSE-ConnectionGUID: +p+9ek5SRyytHWgrwHlLpQ==
X-CSE-MsgGUID: FwVwyldoTwOx9UH+RMX6iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36264954"
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="36264954"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 04:02:38 -0800
X-CSE-ConnectionGUID: J8Y6KK2rQXugGSxp2QgwWw==
X-CSE-MsgGUID: WZz3yR1ETXmaliIo4Sh8Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="102676033"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jan 2025 04:02:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUPKz-000Bf5-27;
	Sun, 05 Jan 2025 12:02:33 +0000
Date: Sun, 5 Jan 2025 20:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:57: warning: '_sel'
 directive output may be truncated writing 4 bytes into a region of size
 between 3 and 13
Message-ID: <202501051919.A2xmLCN8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab75170520d4964f3acf8bb1f91d34cbc650688e
commit: 03ee752f00fd0daa082b43774cfd03a7f9a17385 drm/imx: prefer snprintf over sprintf
date:   11 months ago
config: csky-randconfig-r053-20231127 (https://download.01.org/0day-ci/archive/20250105/202501051919.A2xmLCN8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501051919.A2xmLCN8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501051919.A2xmLCN8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/imx/ipuv3/imx-ldb.c: In function 'imx_ldb_probe':
>> drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:57: warning: '_sel' directive output may be truncated writing 4 bytes into a region of size between 3 and 13 [-Wformat-truncation=]
     658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
         |                                                         ^~~~
   drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:17: note: 'snprintf' output between 8 and 18 bytes into a destination of size 16
     658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/_sel +658 drivers/gpu/drm/imx/ipuv3/imx-ldb.c

   617	
   618	static int imx_ldb_probe(struct platform_device *pdev)
   619	{
   620		struct device *dev = &pdev->dev;
   621		struct device_node *np = dev->of_node;
   622		struct device_node *child;
   623		struct imx_ldb *imx_ldb;
   624		int dual;
   625		int ret;
   626		int i;
   627	
   628		imx_ldb = devm_kzalloc(dev, sizeof(*imx_ldb), GFP_KERNEL);
   629		if (!imx_ldb)
   630			return -ENOMEM;
   631	
   632		imx_ldb->regmap = syscon_regmap_lookup_by_phandle(np, "gpr");
   633		if (IS_ERR(imx_ldb->regmap)) {
   634			dev_err(dev, "failed to get parent regmap\n");
   635			return PTR_ERR(imx_ldb->regmap);
   636		}
   637	
   638		/* disable LDB by resetting the control register to POR default */
   639		regmap_write(imx_ldb->regmap, IOMUXC_GPR2, 0);
   640	
   641		imx_ldb->dev = dev;
   642		imx_ldb->lvds_mux = device_get_match_data(dev);
   643	
   644		dual = of_property_read_bool(np, "fsl,dual-channel");
   645		if (dual)
   646			imx_ldb->ldb_ctrl |= LDB_SPLIT_MODE_EN;
   647	
   648		/*
   649		 * There are three different possible clock mux configurations:
   650		 * i.MX53:  ipu1_di0_sel, ipu1_di1_sel
   651		 * i.MX6q:  ipu1_di0_sel, ipu1_di1_sel, ipu2_di0_sel, ipu2_di1_sel
   652		 * i.MX6dl: ipu1_di0_sel, ipu1_di1_sel, lcdif_sel
   653		 * Map them all to di0_sel...di3_sel.
   654		 */
   655		for (i = 0; i < 4; i++) {
   656			char clkname[16];
   657	
 > 658			snprintf(clkname, sizeof(clkname), "di%d_sel", i);
   659			imx_ldb->clk_sel[i] = devm_clk_get(imx_ldb->dev, clkname);
   660			if (IS_ERR(imx_ldb->clk_sel[i])) {
   661				ret = PTR_ERR(imx_ldb->clk_sel[i]);
   662				imx_ldb->clk_sel[i] = NULL;
   663				break;
   664			}
   665	
   666			imx_ldb->clk_parent[i] = clk_get_parent(imx_ldb->clk_sel[i]);
   667		}
   668		if (i == 0)
   669			return ret;
   670	
   671		for_each_child_of_node(np, child) {
   672			struct imx_ldb_channel *channel;
   673			int bus_format;
   674	
   675			ret = of_property_read_u32(child, "reg", &i);
   676			if (ret || i < 0 || i > 1) {
   677				ret = -EINVAL;
   678				goto free_child;
   679			}
   680	
   681			if (!of_device_is_available(child))
   682				continue;
   683	
   684			if (dual && i > 0) {
   685				dev_warn(dev, "dual-channel mode, ignoring second output\n");
   686				continue;
   687			}
   688	
   689			channel = &imx_ldb->channel[i];
   690			channel->ldb = imx_ldb;
   691			channel->chno = i;
   692	
   693			/*
   694			 * The output port is port@4 with an external 4-port mux or
   695			 * port@2 with the internal 2-port mux.
   696			 */
   697			ret = drm_of_find_panel_or_bridge(child,
   698							  imx_ldb->lvds_mux ? 4 : 2, 0,
   699							  &channel->panel, &channel->bridge);
   700			if (ret && ret != -ENODEV)
   701				goto free_child;
   702	
   703			/* panel ddc only if there is no bridge */
   704			if (!channel->bridge) {
   705				ret = imx_ldb_panel_ddc(dev, channel, child);
   706				if (ret)
   707					goto free_child;
   708			}
   709	
   710			bus_format = of_get_bus_format(dev, child);
   711			if (bus_format == -EINVAL) {
   712				/*
   713				 * If no bus format was specified in the device tree,
   714				 * we can still get it from the connected panel later.
   715				 */
   716				if (channel->panel && channel->panel->funcs &&
   717				    channel->panel->funcs->get_modes)
   718					bus_format = 0;
   719			}
   720			if (bus_format < 0) {
   721				dev_err(dev, "could not determine data mapping: %d\n",
   722					bus_format);
   723				ret = bus_format;
   724				goto free_child;
   725			}
   726			channel->bus_format = bus_format;
   727			channel->child = child;
   728		}
   729	
   730		platform_set_drvdata(pdev, imx_ldb);
   731	
   732		return component_add(&pdev->dev, &imx_ldb_ops);
   733	
   734	free_child:
   735		of_node_put(child);
   736		return ret;
   737	}
   738	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
