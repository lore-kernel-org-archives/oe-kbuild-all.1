Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C983314AB6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m28lT/Ko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699804065; x=1731340065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sODrFILA0yU0o0OAO7zmqV5cYaglUUXAStU7udI77OE=;
  b=m28lT/KopYBs1zZXtGuH6a2KTstTNpKYXwI6SzNZF64lXPoHzNAgQpGS
   A8Qnib/eO0+dGIoAIq5aoNyK9ItKNVGbxE5cnP35DU596p0mFmTZjYgtJ
   xCpvsDg0IA33eqKVOnYVdeeyJDG0+FtDy35T17O3l3+TXGci4ktuLPPm7
   NQI2pF697YKL4VXvo1T2qdR4NNEANlca35GFBZyGwq+dnq2MfKieW6IAT
   r6vg762p+t/diRASdFpzC5RqymzN5Cm2NlymIylTXxK/Eo+KkX1bfOKA5
   Z21Fjbw3JS4LdfSG3DjEHyp9pnUN7KEelHWt8p33HYx+TR0ZKMrjfFe2d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="393205389"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="393205389"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 07:47:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="881443105"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="881443105"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2023 07:47:43 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2CgX-000BFq-27;
	Sun, 12 Nov 2023 15:47:41 +0000
Date: Sun, 12 Nov 2023 23:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 1573/30000]
 drivers/input/touchscreen/vtl/vtl_ts.c:49:18: sparse: sparse: symbol
 'g_driver' was not declared. Should it be static?
Message-ID: <202311122315.7tePeocQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 3785cf3fded6ec2c0230baf53fca19a1e956446f [1573/30000] MLK-13244 input: touchscreen: add support for vtl touchscreen
config: i386-randconfig-062-20231021 (https://download.01.org/0day-ci/archive/20231112/202311122315.7tePeocQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311122315.7tePeocQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311122315.7tePeocQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/input/touchscreen/vtl/vtl_ts.c:80:6: sparse: sparse: symbol 'vtl_ts_free_gpio' was not declared. Should it be static?
>> drivers/input/touchscreen/vtl/vtl_ts.c:90:6: sparse: sparse: symbol 'vtl_ts_hw_reset' was not declared. Should it be static?
>> drivers/input/touchscreen/vtl/vtl_ts.c:278:6: sparse: sparse: symbol 'vtl_ts_remove' was not declared. Should it be static?
>> drivers/input/touchscreen/vtl/vtl_ts.c:366:5: sparse: sparse: symbol 'ct36x_test_tp' was not declared. Should it be static?
>> drivers/input/touchscreen/vtl/vtl_ts.c:382:5: sparse: sparse: symbol 'vtl_ts_probe' was not declared. Should it be static?

vim +/g_driver +49 drivers/input/touchscreen/vtl/vtl_ts.c

    46	
    47	
    48	/* Global or static variables */
  > 49	struct ts_driver g_driver;
    50	
    51	static struct ts_info g_ts = {
    52		.driver = &g_driver,
    53	};
    54	static struct ts_info *pg_ts = &g_ts;
    55	
    56	static struct i2c_device_id vtl_ts_id[] = {
    57		{ DRIVER_NAME, 0 },
    58		{ }
    59	};
    60	MODULE_DEVICE_TABLE(i2c, vtl_ts_id);
    61	
    62	
    63	static int vtl_ts_config(struct ts_info *ts)
    64	{
    65		struct device *dev;
    66	
    67		DEBUG();
    68	
    69		dev = &ts->driver->client->dev;
    70	
    71		/* ts config */
    72		ts->config_info.touch_point_number = TOUCH_POINT_NUM;
    73	
    74		pr_info("Configuring vtl\n");
    75		ts->config_info.screen_max_x = SCREEN_MAX_X;
    76		ts->config_info.screen_max_y = SCREEN_MAX_y;
    77		return 0;
    78	}
    79	
  > 80	void vtl_ts_free_gpio(void)
    81	{
    82		struct ts_info *ts;
    83	
    84		ts = pg_ts;
    85		DEBUG();
    86	
    87		gpio_free(ts->config_info.irq_gpio_number);
    88	}
    89	
  > 90	void vtl_ts_hw_reset(void)
    91	{
    92		struct ts_info *ts;
    93	
    94		ts = pg_ts;
    95		DEBUG();
    96	
    97		gpio_set_value(ts->config_info.rst_gpio_number, 0);
    98		mdelay(50);
    99		gpio_set_value(ts->config_info.rst_gpio_number, 1);
   100	}
   101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
