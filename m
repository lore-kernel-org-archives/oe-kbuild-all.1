Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD6EA47
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 03:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693278942; x=1724814942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JWjC9vY9vdIpumUU591JZMA76ODXN0XyrqQl/iYRgs0=;
  b=HFTgmZvhAD8dhCPYkk/yP1+2zY0Z7jVzne3FycpnkPsyLA1HZW7+93Dq
   Vt4oMwZgxH+GrzPr6NZ8qtahGKJmwIAj9rlOZnXOf51AeyLBogK3LrUyk
   wkyeq0zAVUO1HiEuI80a1TVOStt9+k5utkJYM6O/bPkmkdK1OlAO9Vwtr
   AQG9cwmEANM+l96psB3QyR5j0xEl5y+3YIkXwf+oluzqxPO5k92fHkcyk
   0ZByOLYQa13xVGvh3UKVOeQg1Mmr7Mim1GlhRqRJWGWw4ybcuT4QP/QTW
   rY6VoM36LLtRRiQElhzg0i3rvOiph8DaZa2xyh7e3nXvMjOwaFqjgAwZP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="365469449"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="365469449"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 20:15:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="985164581"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="985164581"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 28 Aug 2023 20:15:40 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qapCd-0008LB-0Z;
	Tue, 29 Aug 2023 03:15:39 +0000
Date: Tue, 29 Aug 2023 11:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.1 176/194]
 drivers/regulator/max597x-regulator.c:447:41: error: 'struct max597x_data'
 has no member named 'dev'
Message-ID: <202308291157.xHKRbaHY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Patrick,

First bad commit (maybe != root cause):

tree:   https://github.com/shenki/linux dev-6.1
head:   85fab119da960f995715afa217cb4bf1696b596d
commit: d46fda7e582fc22ad8241538cb2ea62312519df7 [176/194] mfd: max597x: Add support for MAX5970 and MAX5978
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230829/202308291157.xHKRbaHY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291157.xHKRbaHY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291157.xHKRbaHY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/regulator/max597x-regulator.c: In function 'max597x_regulator_probe':
>> drivers/regulator/max597x-regulator.c:447:41: error: 'struct max597x_data' has no member named 'dev'
     447 |                     devm_kzalloc(max597x->dev, sizeof(struct max597x_regulator),
         |                                         ^~
>> drivers/regulator/max597x-regulator.c:453:39: error: 'struct max597x_data' has no member named 'regmap'
     453 |                 data->regmap = max597x->regmap;
         |                                       ^~
   drivers/regulator/max597x-regulator.c:462:37: error: 'struct max597x_data' has no member named 'dev'
     462 |                 config.dev = max597x->dev;
         |                                     ^~
   drivers/regulator/max597x-regulator.c:465:55: error: 'struct max597x_data' has no member named 'dev'
     465 |                 rdev = devm_regulator_register(max597x->dev,
         |                                                       ^~
   In file included from include/linux/device.h:15,
                    from drivers/regulator/max597x-regulator.c:11:
   drivers/regulator/max597x-regulator.c:468:40: error: 'struct max597x_data' has no member named 'dev'
     468 |                         dev_err(max597x->dev, "failed to register regulator %s\n",
         |                                        ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/regulator/max597x-regulator.c:468:25: note: in expansion of macro 'dev_err'
     468 |                         dev_err(max597x->dev, "failed to register regulator %s\n",
         |                         ^~~~~~~
>> drivers/regulator/max597x-regulator.c:476:20: error: 'struct max597x_data' has no member named 'irq'
     476 |         if (max597x->irq) {
         |                    ^~
   drivers/regulator/max597x-regulator.c:478:46: error: 'struct max597x_data' has no member named 'dev'
     478 |                     max597x_setup_irq(max597x->dev, max597x->irq, rdevs, num_switches,
         |                                              ^~
   drivers/regulator/max597x-regulator.c:478:60: error: 'struct max597x_data' has no member named 'irq'
     478 |                     max597x_setup_irq(max597x->dev, max597x->irq, rdevs, num_switches,
         |                                                            ^~
   drivers/regulator/max597x-regulator.c:481:40: error: 'struct max597x_data' has no member named 'dev'
     481 |                         dev_err(max597x->dev, "IRQ setup failed");
         |                                        ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/regulator/max597x-regulator.c:481:25: note: in expansion of macro 'dev_err'
     481 |                         dev_err(max597x->dev, "IRQ setup failed");
         |                         ^~~~~~~
   drivers/regulator/max597x-regulator.c: At top level:
   drivers/regulator/max597x-regulator.c:360:35: warning: 'max597x_regmap_config' defined but not used [-Wunused-const-variable=]
     360 | static const struct regmap_config max597x_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~


vim +447 drivers/regulator/max597x-regulator.c

38493f008deb43 Patrick Rudolph 2022-07-05  434  
38493f008deb43 Patrick Rudolph 2022-07-05  435  
38493f008deb43 Patrick Rudolph 2022-07-05  436  	struct max597x_data *max597x = dev_get_drvdata(pdev->dev.parent);
38493f008deb43 Patrick Rudolph 2022-07-05  437  	struct max597x_regulator *data;
38493f008deb43 Patrick Rudolph 2022-07-05  438  
38493f008deb43 Patrick Rudolph 2022-07-05  439  	struct regulator_config config = { };
38493f008deb43 Patrick Rudolph 2022-07-05  440  	struct regulator_dev *rdev;
38493f008deb43 Patrick Rudolph 2022-07-05  441  	struct regulator_dev *rdevs[MAX5970_NUM_SWITCHES];
38493f008deb43 Patrick Rudolph 2022-07-05  442  	int num_switches = max597x->num_switches;
38493f008deb43 Patrick Rudolph 2022-07-05  443  	int ret, i;
38493f008deb43 Patrick Rudolph 2022-07-05  444  
38493f008deb43 Patrick Rudolph 2022-07-05  445  	for (i = 0; i < num_switches; i++) {
38493f008deb43 Patrick Rudolph 2022-07-05  446  		data =
38493f008deb43 Patrick Rudolph 2022-07-05 @447  		    devm_kzalloc(max597x->dev, sizeof(struct max597x_regulator),
38493f008deb43 Patrick Rudolph 2022-07-05  448  				 GFP_KERNEL);
38493f008deb43 Patrick Rudolph 2022-07-05  449  		if (!data)
38493f008deb43 Patrick Rudolph 2022-07-05  450  			return -ENOMEM;
38493f008deb43 Patrick Rudolph 2022-07-05  451  
38493f008deb43 Patrick Rudolph 2022-07-05  452  		data->num_switches = num_switches;
38493f008deb43 Patrick Rudolph 2022-07-05 @453  		data->regmap = max597x->regmap;
38493f008deb43 Patrick Rudolph 2022-07-05  454  
38493f008deb43 Patrick Rudolph 2022-07-05  455  		ret = max597x_adc_range(data->regmap, i, &max597x->irng[i], &max597x->mon_rng[i]);
38493f008deb43 Patrick Rudolph 2022-07-05  456  		if (ret < 0)
38493f008deb43 Patrick Rudolph 2022-07-05  457  			return ret;
38493f008deb43 Patrick Rudolph 2022-07-05  458  
38493f008deb43 Patrick Rudolph 2022-07-05  459  		data->irng = max597x->irng[i];
38493f008deb43 Patrick Rudolph 2022-07-05  460  		data->mon_rng = max597x->mon_rng[i];
38493f008deb43 Patrick Rudolph 2022-07-05  461  
38493f008deb43 Patrick Rudolph 2022-07-05  462  		config.dev = max597x->dev;
38493f008deb43 Patrick Rudolph 2022-07-05  463  		config.driver_data = (void *)data;
38493f008deb43 Patrick Rudolph 2022-07-05  464  		config.regmap = data->regmap;
38493f008deb43 Patrick Rudolph 2022-07-05  465  		rdev = devm_regulator_register(max597x->dev,
38493f008deb43 Patrick Rudolph 2022-07-05  466  					       &regulators[i], &config);
38493f008deb43 Patrick Rudolph 2022-07-05  467  		if (IS_ERR(rdev)) {
38493f008deb43 Patrick Rudolph 2022-07-05  468  			dev_err(max597x->dev, "failed to register regulator %s\n",
38493f008deb43 Patrick Rudolph 2022-07-05  469  				regulators[i].name);
38493f008deb43 Patrick Rudolph 2022-07-05  470  			return PTR_ERR(rdev);
38493f008deb43 Patrick Rudolph 2022-07-05  471  		}
38493f008deb43 Patrick Rudolph 2022-07-05  472  		rdevs[i] = rdev;
38493f008deb43 Patrick Rudolph 2022-07-05  473  		max597x->shunt_micro_ohms[i] = data->shunt_micro_ohms;
38493f008deb43 Patrick Rudolph 2022-07-05  474  	}
38493f008deb43 Patrick Rudolph 2022-07-05  475  
38493f008deb43 Patrick Rudolph 2022-07-05 @476  	if (max597x->irq) {
38493f008deb43 Patrick Rudolph 2022-07-05  477  		ret =
38493f008deb43 Patrick Rudolph 2022-07-05  478  		    max597x_setup_irq(max597x->dev, max597x->irq, rdevs, num_switches,
38493f008deb43 Patrick Rudolph 2022-07-05  479  				      data);
38493f008deb43 Patrick Rudolph 2022-07-05  480  		if (ret) {
38493f008deb43 Patrick Rudolph 2022-07-05  481  			dev_err(max597x->dev, "IRQ setup failed");
38493f008deb43 Patrick Rudolph 2022-07-05  482  			return ret;
38493f008deb43 Patrick Rudolph 2022-07-05  483  		}
38493f008deb43 Patrick Rudolph 2022-07-05  484  	}
38493f008deb43 Patrick Rudolph 2022-07-05  485  
38493f008deb43 Patrick Rudolph 2022-07-05  486  	return ret;
38493f008deb43 Patrick Rudolph 2022-07-05  487  }
38493f008deb43 Patrick Rudolph 2022-07-05  488  

:::::: The code at line 447 was first introduced by commit
:::::: 38493f008deb435577361d4c4cdd69f7bb30f4b9 regulator: max597x: Add support for max597x regulator

:::::: TO: Patrick Rudolph <patrick.rudolph@9elements.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
