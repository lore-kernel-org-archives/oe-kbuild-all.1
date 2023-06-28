Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F24D532
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 20:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687985641; x=1719521641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Q8PXyH+Qbu8MCpchqIm26OhRmPukkdUdhJbhjVKMb4=;
  b=Nca9wf+qxzAQ9CnbMkYuFgnEAegAiQr9vmq6E8iXwwoTbMlRyqnQdbk6
   AatAkeHR/rt7KYIcKQknd1wC+a732cY3yvRgjIR6XQLfX1GTXQpyUzJy/
   rm0CWlCNHA/s+i/DxBfuBX6og/iCGLQjitcUsjrhgJHwul1ewvs2b9aHI
   6B+h8YiMl2rLXEqKlffGcUcvBIP7GkMJnoYUVbliBDiLFPWFjxfTXA9FD
   mPwLOiFcV+M92EcIf3Et0NxMVl6EtMyHOc+xUkmcRqriHy6NJQefT3jwe
   JhhOUsMWdBum59TwwPTVIbRFjvkLtqG5ft+4RYPrt3mH8P1uuh3N0QjU0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="359446827"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="359446827"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 13:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="830274723"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="830274723"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2023 13:53:54 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEcAj-000DUX-1K;
	Wed, 28 Jun 2023 20:53:53 +0000
Date: Thu, 29 Jun 2023 04:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:filemf5lkb 2/4] drivers/regulator/raa215300.c:55:
 undefined reference to `clk_unregister_fixed_rate'
Message-ID: <202306290452.FCbqwB6t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filemf5lkb
head:   6f037a89263ba15691af03418051f0c7e0c14341
commit: 7bce16630837c705f72e8fd53a11ae8c236236f4 [2/4] regulator: Add Renesas PMIC RAA215300 driver
config: m68k-randconfig-m041-20230628 (https://download.01.org/0day-ci/archive/20230629/202306290452.FCbqwB6t-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306290452.FCbqwB6t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306290452.FCbqwB6t-lkp@intel.com/

Note: the broonie-ci/filemf5lkb HEAD 6f037a89263ba15691af03418051f0c7e0c14341 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/regulator/raa215300.o: in function `raa215300_rtc_unregister_device':
>> drivers/regulator/raa215300.c:55: undefined reference to `clk_unregister_fixed_rate'
   m68k-linux-ld: drivers/regulator/raa215300.o: in function `raa215300_i2c_probe':
>> drivers/regulator/raa215300.c:133: undefined reference to `clk_register_fixed_rate'


vim +55 drivers/regulator/raa215300.c

    50	
    51	static void raa215300_rtc_unregister_device(void *data)
    52	{
    53		i2c_unregister_device(data);
    54		if (!clk) {
  > 55			clk_unregister_fixed_rate(clk);
    56			clk = NULL;
    57		}
    58	}
    59	
    60	static int raa215300_clk_present(struct i2c_client *client, const char *name)
    61	{
    62		struct clk *clk;
    63	
    64		clk = devm_clk_get_optional(&client->dev, name);
    65		if (IS_ERR(clk))
    66			return PTR_ERR(clk);
    67	
    68		return !!clk;
    69	}
    70	
    71	static int raa215300_i2c_probe(struct i2c_client *client)
    72	{
    73		struct device *dev = &client->dev;
    74		const char *clk_name = xin_name;
    75		unsigned int pmic_version, val;
    76		struct regmap *regmap;
    77		int ret;
    78	
    79		regmap = devm_regmap_init_i2c(client, &raa215300_regmap_config);
    80		if (IS_ERR(regmap))
    81			return dev_err_probe(dev, PTR_ERR(regmap),
    82					     "regmap i2c init failed\n");
    83	
    84		ret = regmap_read(regmap, RAA215300_HW_REV, &pmic_version);
    85		if (ret < 0)
    86			return dev_err_probe(dev, ret, "HW rev read failed\n");
    87	
    88		dev_dbg(dev, "RAA215300 PMIC version 0x%04x\n", pmic_version);
    89	
    90		/* Clear all blocks except RTC, if enabled */
    91		regmap_read(regmap, RAA215300_REG_BLOCK_EN, &val);
    92		val &= RAA215300_REG_BLOCK_EN_RTC_EN;
    93		regmap_write(regmap, RAA215300_REG_BLOCK_EN, val);
    94	
    95		/*Clear the latched registers */
    96		regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_1, &val);
    97		regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_1, val);
    98		regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_2, &val);
    99		regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_2, val);
   100		regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_3, &val);
   101		regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_3, val);
   102		regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_4, &val);
   103		regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_4, val);
   104		regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_6, &val);
   105		regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_6, val);
   106	
   107		/* Mask all the PMIC interrupts */
   108		regmap_write(regmap, RAA215300_INT_MASK_1, RAA215300_INT_MASK_1_ALL);
   109		regmap_write(regmap, RAA215300_INT_MASK_2, RAA215300_INT_MASK_2_ALL);
   110		regmap_write(regmap, RAA215300_INT_MASK_3, RAA215300_INT_MASK_3_ALL);
   111		regmap_write(regmap, RAA215300_INT_MASK_4, RAA215300_INT_MASK_4_ALL);
   112		regmap_write(regmap, RAA215300_INT_MASK_6, RAA215300_INT_MASK_6_ALL);
   113	
   114		ret = raa215300_clk_present(client, xin_name);
   115		if (ret < 0) {
   116			return ret;
   117		} else if (!ret) {
   118			ret = raa215300_clk_present(client, clkin_name);
   119			if (ret < 0)
   120				return ret;
   121	
   122			clk_name = clkin_name;
   123		}
   124	
   125		if (ret) {
   126			char *name = pmic_version >= 0x12 ? "isl1208" : "raa215300_a0";
   127			struct device_node *np = client->dev.of_node;
   128			u32 addr = RAA215300_RTC_DEFAULT_ADDR;
   129			struct i2c_board_info info = {};
   130			struct i2c_client *rtc_client;
   131			ssize_t size;
   132	
 > 133			clk = clk_register_fixed_rate(NULL, clk_name, NULL, 0, 32000);
   134			clk_register_clkdev(clk, clk_name, NULL);
   135	
   136			if (np) {
   137				int i;
   138	
   139				i = of_property_match_string(np, "reg-names", "rtc");
   140				if (i >= 0)
   141					of_property_read_u32_index(np, "reg", i, &addr);
   142			}
   143	
   144			info.addr = addr;
   145			if (client->irq > 0)
   146				info.irq = client->irq;
   147	
   148			size = strscpy(info.type, name, sizeof(info.type));
   149			if (size < 0)
   150				return dev_err_probe(dev, size,
   151						     "Invalid device name: %s\n", name);
   152	
   153			/* Enable RTC block */
   154			regmap_update_bits(regmap, RAA215300_REG_BLOCK_EN,
   155					   RAA215300_REG_BLOCK_EN_RTC_EN,
   156					   RAA215300_REG_BLOCK_EN_RTC_EN);
   157	
   158			rtc_client = i2c_new_client_device(client->adapter, &info);
   159			if (IS_ERR(rtc_client))
   160				return PTR_ERR(rtc_client);
   161	
   162			ret = devm_add_action_or_reset(dev,
   163						       raa215300_rtc_unregister_device,
   164						       rtc_client);
   165			if (ret < 0)
   166				return ret;
   167		}
   168	
   169		return 0;
   170	}
   171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
