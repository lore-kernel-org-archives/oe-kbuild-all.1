Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42976184
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 00:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693440617; x=1724976617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s73CAuGa31nEwKpHlZRt1lovR7oAnj6AXHJJ2QW0dek=;
  b=RqqwGgtrC5PIS6PHPdvhNnk6K42F9uvE+/wMJxiPCG/FruWYiTE6jjBC
   JEEbfGIA04imcnPz5LatNCncTbWesjzw2g79VFH8VCcVahThrxIi+p37b
   imh0qMN9VTyDvkaVJo5XBT7fGlutmXG9dq6kvtbEyjGs0xyMPjExgcgLe
   c6oCflD8h7du1vbBy0Q8Pl4NNXdtiZ94cIwg+FkVD3ILoGigZiALs7Yg+
   o649nedD4uXsJ8d/r2Mhu9a6x945+uvhkfgR6A8gavM1L4sTwBD8Z5mxb
   z89tpWROvPRJg5sNI5OdRmVmOue3NSYx7xzw+aRcHMn39/QSkeutG5SoL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="365981900"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="365981900"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 17:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774281064"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="774281064"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 30 Aug 2023 17:10:15 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbVGH-000AOF-0b;
	Thu, 31 Aug 2023 00:10:13 +0000
Date: Thu, 31 Aug 2023 08:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 5/7] drivers/mfd/rn5t618.c:190:50: error: passing
 argument 1 of 'i2c_get_match_data' from incompatible pointer type
Message-ID: <202308310842.e47xr9J1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   2f859c7b504dbff5d4770187e5416610db4625e3
commit: ac865741027a59abe81c2e7d30edfd26082751f3 [5/7] Use of_device_get_match_data
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230831/202308310842.e47xr9J1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310842.e47xr9J1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310842.e47xr9J1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/rn5t618.c: In function 'rn5t618_i2c_probe':
>> drivers/mfd/rn5t618.c:190:50: error: passing argument 1 of 'i2c_get_match_data' from incompatible pointer type [-Werror=incompatible-pointer-types]
     190 |         priv->variant = (long)i2c_get_match_data(&i2c->dev);
         |                                                  ^~~~~~~~~
         |                                                  |
         |                                                  struct device *
   In file included from drivers/mfd/rn5t618.c:10:
   include/linux/i2c.h:370:57: note: expected 'const struct i2c_client *' but argument is of type 'struct device *'
     370 | const void *i2c_get_match_data(const struct i2c_client *client);
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +/i2c_get_match_data +190 drivers/mfd/rn5t618.c

   179	
   180	static int rn5t618_i2c_probe(struct i2c_client *i2c)
   181	{
   182		struct rn5t618 *priv;
   183		int ret;
   184	
   185		priv = devm_kzalloc(&i2c->dev, sizeof(*priv), GFP_KERNEL);
   186		if (!priv)
   187			return -ENOMEM;
   188	
   189		i2c_set_clientdata(i2c, priv);
 > 190		priv->variant = (long)i2c_get_match_data(&i2c->dev);
   191		priv->irq = i2c->irq;
   192		priv->dev = &i2c->dev;
   193	
   194		priv->regmap = devm_regmap_init_i2c(i2c, &rn5t618_regmap_config);
   195		if (IS_ERR(priv->regmap)) {
   196			ret = PTR_ERR(priv->regmap);
   197			dev_err(&i2c->dev, "regmap init failed: %d\n", ret);
   198			return ret;
   199		}
   200	
   201		if (priv->variant == RC5T619)
   202			ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_NONE,
   203						   rc5t619_cells,
   204						   ARRAY_SIZE(rc5t619_cells),
   205						   NULL, 0, NULL);
   206		else
   207			ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_NONE,
   208						   rn5t618_cells,
   209						   ARRAY_SIZE(rn5t618_cells),
   210						   NULL, 0, NULL);
   211		if (ret) {
   212			dev_err(&i2c->dev, "failed to add sub-devices: %d\n", ret);
   213			return ret;
   214		}
   215	
   216		rn5t618_pm_power_off = i2c;
   217		if (of_device_is_system_power_controller(i2c->dev.of_node)) {
   218			if (!pm_power_off)
   219				pm_power_off = rn5t618_power_off;
   220			else
   221				dev_warn(&i2c->dev, "Poweroff callback already assigned\n");
   222		}
   223	
   224		rn5t618_restart_handler.notifier_call = rn5t618_restart;
   225		rn5t618_restart_handler.priority = 192;
   226	
   227		ret = register_restart_handler(&rn5t618_restart_handler);
   228		if (ret) {
   229			dev_err(&i2c->dev, "cannot register restart handler, %d\n", ret);
   230			return ret;
   231		}
   232	
   233		return rn5t618_irq_init(priv);
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
