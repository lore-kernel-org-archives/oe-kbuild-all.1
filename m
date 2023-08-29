Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104C917AA5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 19:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693337026; x=1724873026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rZ2bBLck6ScQmMaXDalfPWMP1g8rniPK/zxpREZvjZc=;
  b=cyOy9zpn7Gbhc8bmAgm+R0tN4p55TAkE4tYa8SHuagDt5bBBSqFKKnWe
   FnhN6Picvho6dbc9CglBkx+oncZtC4S59lgfMZHtmvLW5SAJS3RNVjC8E
   /TC1Ps0rtIOwBdnW8c+dOQMmZ8vsOcpc+f2S6j4o8/aR+PVc3EMzGXi20
   CmNLR4SNHuN7/a6hcz8ov08iQaVXyo+06WctyTwPbT1eRf1UZ00/smto8
   zQJZSN6oUd+pNQM7eLeXjY5NC/u193MBabARGgn2a6mMnY+nb82CLam2e
   yPL1OPv0+Dp+kEPEr+tCxNIYEcnhq+h+kbbg5rdGFyEnxbRXcdnpX5/xd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="372870679"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="372870679"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 12:23:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="985440757"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="985440757"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 29 Aug 2023 12:23:43 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb4JT-00091T-08;
	Tue, 29 Aug 2023 19:23:43 +0000
Date: Wed, 30 Aug 2023 03:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.1 176/194]
 drivers/regulator/max597x-regulator.c:447:29: error: no member named 'dev'
 in 'struct max597x_data'
Message-ID: <202308300309.aDMxK8qc-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230830/202308300309.aDMxK8qc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300309.aDMxK8qc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300309.aDMxK8qc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/max597x-regulator.c:447:29: error: no member named 'dev' in 'struct max597x_data'
                       devm_kzalloc(max597x->dev, sizeof(struct max597x_regulator),
                                    ~~~~~~~  ^
>> drivers/regulator/max597x-regulator.c:453:27: error: no member named 'regmap' in 'struct max597x_data'
                   data->regmap = max597x->regmap;
                                  ~~~~~~~  ^
   drivers/regulator/max597x-regulator.c:462:25: error: no member named 'dev' in 'struct max597x_data'
                   config.dev = max597x->dev;
                                ~~~~~~~  ^
   drivers/regulator/max597x-regulator.c:465:43: error: no member named 'dev' in 'struct max597x_data'
                   rdev = devm_regulator_register(max597x->dev,
                                                  ~~~~~~~  ^
   drivers/regulator/max597x-regulator.c:468:21: error: no member named 'dev' in 'struct max597x_data'
                           dev_err(max597x->dev, "failed to register regulator %s\n",
                                   ~~~~~~~  ^
   include/linux/dev_printk.h:144:44: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
>> drivers/regulator/max597x-regulator.c:476:15: error: no member named 'irq' in 'struct max597x_data'
           if (max597x->irq) {
               ~~~~~~~  ^
   drivers/regulator/max597x-regulator.c:478:34: error: no member named 'dev' in 'struct max597x_data'
                       max597x_setup_irq(max597x->dev, max597x->irq, rdevs, num_switches,
                                         ~~~~~~~  ^
   drivers/regulator/max597x-regulator.c:478:48: error: no member named 'irq' in 'struct max597x_data'
                       max597x_setup_irq(max597x->dev, max597x->irq, rdevs, num_switches,
                                                       ~~~~~~~  ^
   drivers/regulator/max597x-regulator.c:481:21: error: no member named 'dev' in 'struct max597x_data'
                           dev_err(max597x->dev, "IRQ setup failed");
                                   ~~~~~~~  ^
   include/linux/dev_printk.h:144:44: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
   9 errors generated.


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
