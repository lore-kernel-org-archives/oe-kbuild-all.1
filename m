Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067BE1E1C36
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 23:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736205919; cv=none; b=e8b52qEeWgaSefE/gONAhxXGp2hVtthDVjp0inG/N0/GgFkPQXYFcbRlIcPtnXZdj447g3EMOaZPNTYCE0sCCnQ/JY6ptGCVF3YJaXc3nGiy6m8ML/0ty2Jsjg485rjahKCjvtgHD7smqoFz5cUYV5135Mgk1f74ofzD978F3bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736205919; c=relaxed/simple;
	bh=Ea/zy+DEjKIU54V+aZM+gyFE9L3p0LvaK2yOVc5SYfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OlShu4IFjBqoRN9c9xxZgh23U1Td8XaWB0oOFvGMhFQoTG02KV9itilFwfoaV43++pSXIzQV9I/Q8ZtKA534yYRrppSfDCbZwV+eJs4WhThA92mj7i8z8J+etezFxUlZ9bv07pDdWIjyR+Q6nZ/zuyznngGceZoSjoNHqVIGPBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFJxVM30; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFJxVM30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736205917; x=1767741917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ea/zy+DEjKIU54V+aZM+gyFE9L3p0LvaK2yOVc5SYfU=;
  b=oFJxVM30S8AtOzNXwhZtYpUx3oqIgDYxoKrBkbPrCo3Zf3ovcNma8cue
   HIg5MqtpgrYn9bvytNXrkmCAsi50lm/4Hqnm+97l7q+AYHBfIlozp8a5q
   Xo5a6x4Tv0M2E9P0kK2ZR5mcGtrNRIYoe5MJHPM7hXnwxWUf5upGZGGAN
   4BxKAgPg5YWoLod4HE8IZlVTBzk5FPi07/uehmwRYVOKpgZfF/RpGcm7Y
   AL06oiP9QvIAAr0uB4Jrdre518rf1ZWs4jEZt+hmPYyBjL/KLQN3J7GeU
   //mEyItzerHBM6W4zBDjGfaJlGxK1Ymhc6WEl4mMPTegj5mm1bZTiPuyi
   Q==;
X-CSE-ConnectionGUID: Uh/fWG8JQOOhTk3QkI3Euw==
X-CSE-MsgGUID: 6UU3RtUkS2SrkUU4JKCLKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="46863946"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="46863946"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 15:25:16 -0800
X-CSE-ConnectionGUID: e1oH5+spQim8N3CyFlrHig==
X-CSE-MsgGUID: 9hV4gl3YSOKsTluU5FDtQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="102400413"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Jan 2025 15:25:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUwTA-000E19-0Y;
	Mon, 06 Jan 2025 23:25:12 +0000
Date: Tue, 7 Jan 2025 07:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: drivers/clk/clk-cdce925.c:726:41: warning: '%d' directive writing
 between 1 and 11 bytes into a region of size 3
Message-ID: <202501070735.t35gx6tt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbfd64d25c7af3b8695201ebc85efe90be28c5a3
commit: d539fee9f825b0c8eac049732c83562b28a483b5 ARM: 9253/1: ubsan: select ARCH_HAS_UBSAN_SANITIZE_ALL
date:   2 years, 2 months ago
config: arm-randconfig-r006-20230802 (https://download.01.org/0day-ci/archive/20250107/202501070735.t35gx6tt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070735.t35gx6tt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070735.t35gx6tt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/clk-cdce925.c: In function 'cdce925_probe':
>> drivers/clk/clk-cdce925.c:726:41: warning: '%d' directive writing between 1 and 11 bytes into a region of size 3 [-Wformat-overflow=]
     726 |                 sprintf(child_name, "PLL%d", i+1);
         |                                         ^~
   drivers/clk/clk-cdce925.c:726:37: note: directive argument in the range [-2147483641, 2147483647]
     726 |                 sprintf(child_name, "PLL%d", i+1);
         |                                     ^~~~~~~
   drivers/clk/clk-cdce925.c:726:17: note: 'sprintf' output between 5 and 15 bytes into a destination of size 6
     726 |                 sprintf(child_name, "PLL%d", i+1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +726 drivers/clk/clk-cdce925.c

df221682075d17 Stephen Kitt       2022-04-07  645  
df221682075d17 Stephen Kitt       2022-04-07  646  static int cdce925_probe(struct i2c_client *client)
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  647  {
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  648  	struct clk_cdce925_chip *data;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  649  	struct device_node *node = client->dev.of_node;
df221682075d17 Stephen Kitt       2022-04-07  650  	const struct i2c_device_id *id = i2c_match_id(cdce925_id, client);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  651  	const char *parent_name;
5508124cccb8bd Akinobu Mita       2017-01-01  652  	const char *pll_clk_name[MAX_NUMBER_OF_PLLS] = {NULL,};
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  653  	struct clk_init_data init;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  654  	u32 value;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  655  	int i;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  656  	int err;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  657  	struct device_node *np_output;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  658  	char child_name[6];
5508124cccb8bd Akinobu Mita       2017-01-01  659  	struct regmap_config config = {
5508124cccb8bd Akinobu Mita       2017-01-01  660  		.name = "configuration0",
5508124cccb8bd Akinobu Mita       2017-01-01  661  		.reg_bits = 8,
5508124cccb8bd Akinobu Mita       2017-01-01  662  		.val_bits = 8,
5508124cccb8bd Akinobu Mita       2017-01-01  663  		.cache_type = REGCACHE_RBTREE,
5508124cccb8bd Akinobu Mita       2017-01-01  664  	};
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  665  
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  666  	dev_dbg(&client->dev, "%s\n", __func__);
d69d0b4384ba80 Phil Reid          2019-06-28  667  
d69d0b4384ba80 Phil Reid          2019-06-28  668  	err = cdce925_regulator_enable(&client->dev, "vdd");
d69d0b4384ba80 Phil Reid          2019-06-28  669  	if (err)
d69d0b4384ba80 Phil Reid          2019-06-28  670  		return err;
d69d0b4384ba80 Phil Reid          2019-06-28  671  
d69d0b4384ba80 Phil Reid          2019-06-28  672  	err = cdce925_regulator_enable(&client->dev, "vddout");
d69d0b4384ba80 Phil Reid          2019-06-28  673  	if (err)
d69d0b4384ba80 Phil Reid          2019-06-28  674  		return err;
d69d0b4384ba80 Phil Reid          2019-06-28  675  
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  676  	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  677  	if (!data)
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  678  		return -ENOMEM;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  679  
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  680  	data->i2c_client = client;
5508124cccb8bd Akinobu Mita       2017-01-01  681  	data->chip_info = &clk_cdce925_chip_info_tbl[id->driver_data];
5508124cccb8bd Akinobu Mita       2017-01-01  682  	config.max_register = CDCE925_OFFSET_PLL +
5508124cccb8bd Akinobu Mita       2017-01-01  683  		data->chip_info->num_plls * 0x10 - 1;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  684  	data->regmap = devm_regmap_init(&client->dev, &regmap_cdce925_bus,
5508124cccb8bd Akinobu Mita       2017-01-01  685  			&client->dev, &config);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  686  	if (IS_ERR(data->regmap)) {
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  687  		dev_err(&client->dev, "failed to allocate register map\n");
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  688  		return PTR_ERR(data->regmap);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  689  	}
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  690  	i2c_set_clientdata(client, data);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  691  
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  692  	parent_name = of_clk_get_parent_name(node, 0);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  693  	if (!parent_name) {
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  694  		dev_err(&client->dev, "missing parent clock\n");
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  695  		return -ENODEV;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  696  	}
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  697  	dev_dbg(&client->dev, "parent is: %s\n", parent_name);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  698  
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  699  	if (of_property_read_u32(node, "xtal-load-pf", &value) == 0)
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  700  		regmap_write(data->regmap,
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  701  			CDCE925_REG_XCSEL, (value << 3) & 0xF8);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  702  	/* PWDN bit */
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  703  	regmap_update_bits(data->regmap, CDCE925_REG_GLOBAL1, BIT(4), 0);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  704  
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  705  	/* Set input source for Y1 to be the XTAL */
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  706  	regmap_update_bits(data->regmap, 0x02, BIT(7), 0);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  707  
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  708  	init.ops = &cdce925_pll_ops;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  709  	init.flags = 0;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  710  	init.parent_names = &parent_name;
9416a5f8842a37 Colin Ian King     2017-09-05  711  	init.num_parents = 1;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  712  
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  713  	/* Register PLL clocks */
5508124cccb8bd Akinobu Mita       2017-01-01  714  	for (i = 0; i < data->chip_info->num_plls; ++i) {
e665f029a283af Rob Herring        2018-08-28  715  		pll_clk_name[i] = kasprintf(GFP_KERNEL, "%pOFn.pll%d",
e665f029a283af Rob Herring        2018-08-28  716  			client->dev.of_node, i);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  717  		init.name = pll_clk_name[i];
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  718  		data->pll[i].chip = data;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  719  		data->pll[i].hw.init = &init;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  720  		data->pll[i].index = i;
a85d11712dd13f Stephen Boyd       2016-06-01  721  		err = devm_clk_hw_register(&client->dev, &data->pll[i].hw);
a85d11712dd13f Stephen Boyd       2016-06-01  722  		if (err) {
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  723  			dev_err(&client->dev, "Failed register PLL %d\n", i);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  724  			goto error;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  725  		}
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03 @726  		sprintf(child_name, "PLL%d", i+1);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  727  		np_output = of_get_child_by_name(node, child_name);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  728  		if (!np_output)
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  729  			continue;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  730  		if (!of_property_read_u32(np_output,
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  731  			"clock-frequency", &value)) {
a85d11712dd13f Stephen Boyd       2016-06-01  732  			err = clk_set_rate(data->pll[i].hw.clk, value);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  733  			if (err)
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  734  				dev_err(&client->dev,
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  735  					"unable to set PLL frequency %ud\n",
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  736  					value);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  737  		}
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  738  		if (!of_property_read_u32(np_output,
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  739  			"spread-spectrum", &value)) {
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  740  			u8 flag = of_property_read_bool(np_output,
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  741  				"spread-spectrum-center") ? 0x80 : 0x00;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  742  			regmap_update_bits(data->regmap,
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  743  				0x16 + (i*CDCE925_OFFSET_PLL),
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  744  				0x80, flag);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  745  			regmap_update_bits(data->regmap,
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  746  				0x12 + (i*CDCE925_OFFSET_PLL),
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  747  				0x07, value & 0x07);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  748  		}
0b85de7cef013e Alexey Khoroshilov 2018-08-22  749  		of_node_put(np_output);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  750  	}
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  751  
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  752  	/* Register output clock Y1 */
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  753  	init.ops = &cdce925_clk_y1_ops;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  754  	init.flags = 0;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  755  	init.num_parents = 1;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  756  	init.parent_names = &parent_name; /* Mux Y1 to input */
e665f029a283af Rob Herring        2018-08-28  757  	init.name = kasprintf(GFP_KERNEL, "%pOFn.Y1", client->dev.of_node);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  758  	data->clk[0].chip = data;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  759  	data->clk[0].hw.init = &init;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  760  	data->clk[0].index = 0;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  761  	data->clk[0].pdiv = 1;
a85d11712dd13f Stephen Boyd       2016-06-01  762  	err = devm_clk_hw_register(&client->dev, &data->clk[0].hw);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  763  	kfree(init.name); /* clock framework made a copy of the name */
a85d11712dd13f Stephen Boyd       2016-06-01  764  	if (err) {
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  765  		dev_err(&client->dev, "clock registration Y1 failed\n");
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  766  		goto error;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  767  	}
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  768  
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  769  	/* Register output clocks Y2 .. Y5*/
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  770  	init.ops = &cdce925_clk_ops;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  771  	init.flags = CLK_SET_RATE_PARENT;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  772  	init.num_parents = 1;
5508124cccb8bd Akinobu Mita       2017-01-01  773  	for (i = 1; i < data->chip_info->num_outputs; ++i) {
e665f029a283af Rob Herring        2018-08-28  774  		init.name = kasprintf(GFP_KERNEL, "%pOFn.Y%d",
e665f029a283af Rob Herring        2018-08-28  775  			client->dev.of_node, i+1);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  776  		data->clk[i].chip = data;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  777  		data->clk[i].hw.init = &init;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  778  		data->clk[i].index = i;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  779  		data->clk[i].pdiv = 1;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  780  		switch (i) {
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  781  		case 1:
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  782  		case 2:
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  783  			/* Mux Y2/3 to PLL1 */
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  784  			init.parent_names = &pll_clk_name[0];
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  785  			break;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  786  		case 3:
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  787  		case 4:
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  788  			/* Mux Y4/5 to PLL2 */
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  789  			init.parent_names = &pll_clk_name[1];
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  790  			break;
5508124cccb8bd Akinobu Mita       2017-01-01  791  		case 5:
5508124cccb8bd Akinobu Mita       2017-01-01  792  		case 6:
5508124cccb8bd Akinobu Mita       2017-01-01  793  			/* Mux Y6/7 to PLL3 */
5508124cccb8bd Akinobu Mita       2017-01-01  794  			init.parent_names = &pll_clk_name[2];
5508124cccb8bd Akinobu Mita       2017-01-01  795  			break;
5508124cccb8bd Akinobu Mita       2017-01-01  796  		case 7:
5508124cccb8bd Akinobu Mita       2017-01-01  797  		case 8:
5508124cccb8bd Akinobu Mita       2017-01-01  798  			/* Mux Y8/9 to PLL4 */
5508124cccb8bd Akinobu Mita       2017-01-01  799  			init.parent_names = &pll_clk_name[3];
5508124cccb8bd Akinobu Mita       2017-01-01  800  			break;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  801  		}
a85d11712dd13f Stephen Boyd       2016-06-01  802  		err = devm_clk_hw_register(&client->dev, &data->clk[i].hw);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  803  		kfree(init.name); /* clock framework made a copy of the name */
a85d11712dd13f Stephen Boyd       2016-06-01  804  		if (err) {
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  805  			dev_err(&client->dev, "clock registration failed\n");
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  806  			goto error;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  807  		}
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  808  	}
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  809  
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  810  	/* Register the output clocks */
a85d11712dd13f Stephen Boyd       2016-06-01  811  	err = of_clk_add_hw_provider(client->dev.of_node, of_clk_cdce925_get,
a85d11712dd13f Stephen Boyd       2016-06-01  812  				  data);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  813  	if (err)
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  814  		dev_err(&client->dev, "unable to add OF clock provider\n");
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  815  
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  816  	err = 0;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  817  
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  818  error:
5508124cccb8bd Akinobu Mita       2017-01-01  819  	for (i = 0; i < data->chip_info->num_plls; ++i)
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  820  		/* clock framework made a copy of the name */
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  821  		kfree(pll_clk_name[i]);
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  822  
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  823  	return err;
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  824  }
19fbbbbcd3a3a8 Mike Looijmans     2015-06-03  825  

:::::: The code at line 726 was first introduced by commit
:::::: 19fbbbbcd3a3a8e307a4768784166abf7b55b779 Add TI CDCE925 I2C controlled clock synthesizer driver

:::::: TO: Mike Looijmans <mike.looijmans@topic.nl>
:::::: CC: Michael Turquette <mturquette@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
