Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167F612E4A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 06:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735365923; cv=none; b=ETH0pDtdnXDi+lTpTn5lbpK7cMHPv41vdixUTS8LHcRrgs/77+8GKA1FRMTEsVsdFDzclSDLGqoYMpXpHGisM9foWr7WaFxa3EsUw5SoMLz3/ecXlWYpokDDTWXKp45vj+NVdb/3tEd9cjl9WyoPdHyiN7q9BLfG3jqtLafueuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735365923; c=relaxed/simple;
	bh=Zqj9l31B4YH0EHkI5YA67k1oivsCFmUiBM+sFtQzPyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZAaEoJeK69yNNOUE1R6pPpZd2BhPaHzhHNfx2fM4htvfYYE0DB9xkw9Ly0QQX0inZfQIdlokmI6sjsv1sW3KMOKsJL6nkPm3nyIprARgB7tqWlpUx/LQPoo+h497kbyJq+z1xUJZdds5T900E8Rq8uRAWvRlX7U2+YRZ2GJAFw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhGdb30u; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhGdb30u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735365920; x=1766901920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zqj9l31B4YH0EHkI5YA67k1oivsCFmUiBM+sFtQzPyE=;
  b=YhGdb30uB+TULar1VUmcY8LN6FMIEBXqnx2NYf/OpArMA30mA2nTJ69N
   RlGKrlxtMmtsTNEQ/FiSW4DvUC3jW5tj6Blu3GcfpXHM4Kw92vCcs5+Wm
   lhJGp9eZYtb0GtrX2LDtqYlP7DNBZ6eX4GucALraiV8oa8Mg0ssdA+Udl
   Wp6HxeLDQ6NfKg5qbXfIiP3zQhNUsr78/YxOFTofpHwRCYAeXE+li+/qG
   yUXzJ5P1TYubuRvGUtsEWGmQjwMaOD4WcZfx31FIo45YT7RqOrkUgncmO
   grrSln/u0pKAJnOhP5xSj6TEVm90XSYZg4mP8UORhLDxNj7HsGAKWkcOu
   A==;
X-CSE-ConnectionGUID: iQOqu9SpQfmwszcPWyGU1w==
X-CSE-MsgGUID: NOKcTPq9QHihi0DlBHD6fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="39523983"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="39523983"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 22:05:19 -0800
X-CSE-ConnectionGUID: OpP/JkKNQpOZqctMTR/tcA==
X-CSE-MsgGUID: 51NfPuWmQuy+1LvIpdTbvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104374402"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Dec 2024 22:05:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRPwq-0003u4-1D;
	Sat, 28 Dec 2024 06:05:16 +0000
Date: Sat, 28 Dec 2024 14:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: drivers/counter/microchip-tcb-capture.c:341:56: warning: '%d'
 directive output may be truncated writing between 1 and 11 bytes into a
 region of size 6
Message-ID: <202412281402.OOqCckbG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
commit: 106b104137fd5f0dbcafadd7ad566b86ec183466 counter: Add microchip TCB capture counter
date:   4 years, 5 months ago
config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241228/202412281402.OOqCckbG-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281402.OOqCckbG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281402.OOqCckbG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/counter/microchip-tcb-capture.c: In function 'mchp_tc_probe':
>> drivers/counter/microchip-tcb-capture.c:341:56: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 6 [-Wformat-truncation=]
     341 |                 snprintf(clk_name, sizeof(clk_name), "t%d_clk", channel);
         |                                                        ^~
   drivers/counter/microchip-tcb-capture.c:341:54: note: directive argument in the range [-2147483648, 2]
     341 |                 snprintf(clk_name, sizeof(clk_name), "t%d_clk", channel);
         |                                                      ^~~~~~~~~
   drivers/counter/microchip-tcb-capture.c:341:17: note: 'snprintf' output between 7 and 17 bytes into a destination of size 7
     341 |                 snprintf(clk_name, sizeof(clk_name), "t%d_clk", channel);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +341 drivers/counter/microchip-tcb-capture.c

   296	
   297	static int mchp_tc_probe(struct platform_device *pdev)
   298	{
   299		struct device_node *np = pdev->dev.of_node;
   300		const struct atmel_tcb_config *tcb_config;
   301		const struct of_device_id *match;
   302		struct mchp_tc_data *priv;
   303		char clk_name[7];
   304		struct regmap *regmap;
   305		struct clk *clk[3];
   306		int channel;
   307		int ret, i;
   308	
   309		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
   310		if (!priv)
   311			return -ENOMEM;
   312	
   313		platform_set_drvdata(pdev, priv);
   314	
   315		match = of_match_node(atmel_tc_of_match, np->parent);
   316		tcb_config = match->data;
   317		if (!tcb_config) {
   318			dev_err(&pdev->dev, "No matching parent node found\n");
   319			return -ENODEV;
   320		}
   321	
   322		regmap = syscon_node_to_regmap(np->parent);
   323		if (IS_ERR(priv->regmap))
   324			return PTR_ERR(priv->regmap);
   325	
   326		/* max. channels number is 2 when in QDEC mode */
   327		priv->num_channels = of_property_count_u32_elems(np, "reg");
   328		if (priv->num_channels < 0) {
   329			dev_err(&pdev->dev, "Invalid or missing channel\n");
   330			return -EINVAL;
   331		}
   332	
   333		/* Register channels and initialize clocks */
   334		for (i = 0; i < priv->num_channels; i++) {
   335			ret = of_property_read_u32_index(np, "reg", i, &channel);
   336			if (ret < 0 || channel > 2)
   337				return -ENODEV;
   338	
   339			priv->channel[i] = channel;
   340	
 > 341			snprintf(clk_name, sizeof(clk_name), "t%d_clk", channel);
   342	
   343			clk[i] = of_clk_get_by_name(np->parent, clk_name);
   344			if (IS_ERR(clk[i])) {
   345				/* Fallback to t0_clk */
   346				clk[i] = of_clk_get_by_name(np->parent, "t0_clk");
   347				if (IS_ERR(clk[i]))
   348					return PTR_ERR(clk[i]);
   349			}
   350	
   351			ret = clk_prepare_enable(clk[i]);
   352			if (ret)
   353				return ret;
   354	
   355			ret = devm_add_action_or_reset(&pdev->dev,
   356						       mchp_tc_clk_remove,
   357						       clk[i]);
   358			if (ret)
   359				return ret;
   360	
   361			dev_dbg(&pdev->dev,
   362				"Initialized capture mode on channel %d\n",
   363				channel);
   364		}
   365	
   366		priv->tc_cfg = tcb_config;
   367		priv->regmap = regmap;
   368		priv->counter.name = dev_name(&pdev->dev);
   369		priv->counter.parent = &pdev->dev;
   370		priv->counter.ops = &mchp_tc_ops;
   371		priv->counter.num_counts = ARRAY_SIZE(mchp_tc_counts);
   372		priv->counter.counts = mchp_tc_counts;
   373		priv->counter.num_signals = ARRAY_SIZE(mchp_tc_count_signals);
   374		priv->counter.signals = mchp_tc_count_signals;
   375		priv->counter.priv = priv;
   376	
   377		return devm_counter_register(&pdev->dev, &priv->counter);
   378	}
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
