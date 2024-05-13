Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A94B208CB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 17:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715620970; cv=none; b=h2Y9h7cGD/5j778E6eVMI6jDpyB/cii+74E8ni4jOm4edcDHLxsrDP98zMME/SkO6d0zqAYCoC57IBBru3c7ispfrSKL8gscXBzyd1VkbW1mBtUfjuG6xDbHDiLFIKBNURZf8W0OrAIAw+22RLX0dydXCZidC58uDqy8MCpkPTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715620970; c=relaxed/simple;
	bh=rAAQCBGPTTzLd1XOwSpdngTVz40sTYcprrcxi6SPO0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=thyA9PF82EV0nqhJ8Qv/IusRc4OClhRzmFY8sV78wD53MDIlrOIPits+EXYz7K7U3hPwSZkpZMfQfoI2kE5xwoAKM4bV7N1kJYMJUrw7QEp+KZrhhm1X6/r/5VdyGB0JdFQ4+mYoMaHCdYeyfYYe+dzPBRtJ5TpzEmgRHOboMKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PycUVfad; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PycUVfad"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715620969; x=1747156969;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rAAQCBGPTTzLd1XOwSpdngTVz40sTYcprrcxi6SPO0Y=;
  b=PycUVfadjHNhROo2+akRZ0RYOHeaZWlGNPuphX+Ev7BTynSCu100yO+O
   6RzKSqmfmubFjSSvcLX+X9y95Zi1k/f0sruI+p05jcMboid7Bjuw/wpbE
   P4JiOtqVA8JyVl5vSkAvLC74Mv9RtvDs6PNy71LXX5UxD2FqJLwYHMmF3
   T9vRF0SDFSynSP6+4qjolOKZhtU0NzB6mhOqllcPYzhCPl+A+0CcsCWZD
   2QzcnEW7ZMqPAbZbRwZU6jznMJqNLW6/Wo8de3X71DwMUZse9fOpQZ0XQ
   XlF0JfGHvIo4839WiiAMtw1KV9xPHfkT5lx+o3D7xnodQVRlAv2FSmnH/
   A==;
X-CSE-ConnectionGUID: piXW/t/4SZeiu0zB44P5RQ==
X-CSE-MsgGUID: BdcRKrxNSD+c544Jdy1ABw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11744066"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="11744066"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 10:22:46 -0700
X-CSE-ConnectionGUID: bbxQ648HTuiWpYUFl1WCAg==
X-CSE-MsgGUID: v9JLYQisSUK8eaWH6IfNTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="30960550"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 May 2024 10:22:45 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6ZNq-000AUN-1G;
	Mon, 13 May 2024 17:22:42 +0000
Date: Tue, 14 May 2024 01:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:i2c/for-next 3/5] drivers/power/supply/sbs-manager.c:361:31:
 error: too many arguments to function 'i2c_mux_add_adapter'
Message-ID: <202405140120.JCgghAp8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
head:   d76accc8f0f1c99edb2c0776874a2a8ea3719415
commit: fec1982d70721c0062758861fec7e4e9d1103fb6 [3/5] i2c: mux: Remove class argument from i2c_mux_add_adapter()
config: i386-buildonly-randconfig-003-20240513 (https://download.01.org/0day-ci/archive/20240514/202405140120.JCgghAp8-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405140120.JCgghAp8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405140120.JCgghAp8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/power/supply/sbs-manager.c: In function 'sbsm_probe':
>> drivers/power/supply/sbs-manager.c:361:31: error: too many arguments to function 'i2c_mux_add_adapter'
     361 |                         ret = i2c_mux_add_adapter(data->muxc, 0, i + 1, 0);
         |                               ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/power/supply/sbs-manager.c:19:
   include/linux/i2c-mux.h:58:5: note: declared here
      58 | int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
         |     ^~~~~~~~~~~~~~~~~~~


vim +/i2c_mux_add_adapter +361 drivers/power/supply/sbs-manager.c

814ddbd9ec0b93 Sebastian Reichel    2021-03-09  317  
02d1a40141a7b9 Uwe Kleine-König     2022-11-18  318  static int sbsm_probe(struct i2c_client *client)
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  319  {
02d1a40141a7b9 Uwe Kleine-König     2022-11-18  320  	const struct i2c_device_id *id = i2c_client_get_device_id(client);
22ee8384dc688c Wolfram Sang         2019-06-08  321  	struct i2c_adapter *adapter = client->adapter;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  322  	struct sbsm_data *data;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  323  	struct device *dev = &client->dev;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  324  	struct power_supply_desc *psy_desc;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  325  	struct power_supply_config psy_cfg = {};
a0b8839e2afc66 Phil Reid            2017-08-24  326  	int ret = 0, i;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  327  
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  328  	/* Device listens only at address 0x0a */
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  329  	if (client->addr != 0x0a)
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  330  		return -EINVAL;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  331  
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  332  	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  333  		return -EPFNOSUPPORT;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  334  
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  335  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  336  	if (!data)
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  337  		return -ENOMEM;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  338  
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  339  	i2c_set_clientdata(client, data);
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  340  
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  341  	data->client = client;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  342  	data->is_ltc1760 = !!strstr(id->name, "ltc1760");
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  343  
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  344  	ret  = sbsm_read_word(client, SBSM_CMD_BATSYSINFO);
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  345  	if (ret < 0)
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  346  		return ret;
a0b8839e2afc66 Phil Reid            2017-08-24  347  	data->supported_bats = ret & SBSM_MASK_BAT_SUPPORTED;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  348  	data->muxc = i2c_mux_alloc(adapter, dev, SBSM_MAX_BATS, 0,
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  349  				   I2C_MUX_LOCKED, &sbsm_select, NULL);
436ff8c9280faa Sebastian Reichel    2021-03-09  350  	if (!data->muxc)
436ff8c9280faa Sebastian Reichel    2021-03-09  351  		return dev_err_probe(dev, -ENOMEM, "failed to alloc i2c mux\n");
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  352  	data->muxc->priv = data;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  353  
814ddbd9ec0b93 Sebastian Reichel    2021-03-09  354  	ret = devm_add_action_or_reset(dev, sbsm_del_mux_adapter, data);
814ddbd9ec0b93 Sebastian Reichel    2021-03-09  355  	if (ret)
814ddbd9ec0b93 Sebastian Reichel    2021-03-09  356  		return ret;
814ddbd9ec0b93 Sebastian Reichel    2021-03-09  357  
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  358  	/* register muxed i2c channels. One for each supported battery */
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  359  	for (i = 0; i < SBSM_MAX_BATS; ++i) {
a0b8839e2afc66 Phil Reid            2017-08-24  360  		if (data->supported_bats & BIT(i)) {
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24 @361  			ret = i2c_mux_add_adapter(data->muxc, 0, i + 1, 0);
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  362  			if (ret)
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  363  				break;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  364  		}
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  365  	}
436ff8c9280faa Sebastian Reichel    2021-03-09  366  	if (ret)
436ff8c9280faa Sebastian Reichel    2021-03-09  367  		return dev_err_probe(dev, ret, "failed to register i2c mux channel %d\n", i + 1);
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  368  
436ff8c9280faa Sebastian Reichel    2021-03-09  369  	psy_desc = devm_kmemdup(dev, &sbsm_default_psy_desc, sizeof(*psy_desc), GFP_KERNEL);
436ff8c9280faa Sebastian Reichel    2021-03-09  370  	if (!psy_desc)
436ff8c9280faa Sebastian Reichel    2021-03-09  371  		return -ENOMEM;
436ff8c9280faa Sebastian Reichel    2021-03-09  372  
436ff8c9280faa Sebastian Reichel    2021-03-09  373  	psy_desc->name = devm_kasprintf(dev, GFP_KERNEL, "sbsm-%s", dev_name(&client->dev));
436ff8c9280faa Sebastian Reichel    2021-03-09  374  	if (!psy_desc->name)
436ff8c9280faa Sebastian Reichel    2021-03-09  375  		return -ENOMEM;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  376  
a0b8839e2afc66 Phil Reid            2017-08-24  377  	ret = sbsm_gpio_setup(data);
a0b8839e2afc66 Phil Reid            2017-08-24  378  	if (ret < 0)
436ff8c9280faa Sebastian Reichel    2021-03-09  379  		return ret;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  380  
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  381  	psy_cfg.drv_data = data;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  382  	psy_cfg.of_node = dev->of_node;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  383  	data->psy = devm_power_supply_register(dev, psy_desc, &psy_cfg);
436ff8c9280faa Sebastian Reichel    2021-03-09  384  	if (IS_ERR(data->psy))
436ff8c9280faa Sebastian Reichel    2021-03-09  385  		return dev_err_probe(dev, PTR_ERR(data->psy),
436ff8c9280faa Sebastian Reichel    2021-03-09  386  				     "failed to register power supply %s\n", psy_desc->name);
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  387  
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  388  	return 0;
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  389  }
dbc4deda03fe61 Karl-Heinz Schneider 2017-08-24  390  

:::::: The code at line 361 was first introduced by commit
:::::: dbc4deda03fe61a1c29d8218269714bf2c334b9b power: Adds support for Smart Battery System Manager

:::::: TO: Karl-Heinz Schneider <karl-heinz@schneider-inet.de>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
