Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3F51840
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 07:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692948066; x=1724484066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tJmH5HfyMZXLROcb3o5aeWl7LjYncamr1BCFfgh7c4g=;
  b=Tu47LyvJrelzuZblWD/kessE0PFkOqjPhDa6IyUPr0d5tOPY8VwKfL9t
   aLVVuUJ1FzJ0lzaNQgK5NDnv0AQ+5Y/AxRzMKXjt/IolaZGQEyQP06EFA
   b/y3YLE5uPWazvqWoUZpdRV9vrvFNjporEx8G8d4ADDYv6P9F23opVCyx
   gsmIbZoV4SlrB2UYLlMsBUtY4TBm+f8FWsoWXm9eqCJ7uAdHBKaYb3nV+
   wTLdm9eNv/QqexQ8ohIw7lQYoXIZq3exmO285ngxb53pJ0il2WKUs+uBB
   HZOzUdHYAY06A93PEH6Jp3xM9s93G2fdCEDXAfBbZyxcLJocO3VWLup6L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="354180939"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="354180939"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 00:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="766864767"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="766864767"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Aug 2023 00:21:02 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZR7p-0003J2-3A;
	Fri, 25 Aug 2023 07:20:59 +0000
Date: Fri, 25 Aug 2023 15:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.1 176/194]
 drivers/regulator/max597x-regulator.c:360:35: warning:
 'max597x_regmap_config' defined but not used
Message-ID: <202308251503.pGbUzUZr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.1
head:   85fab119da960f995715afa217cb4bf1696b596d
commit: d46fda7e582fc22ad8241538cb2ea62312519df7 [176/194] mfd: max597x: Add support for MAX5970 and MAX5978
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230825/202308251503.pGbUzUZr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251503.pGbUzUZr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251503.pGbUzUZr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/regulator/max597x-regulator.c: In function 'max597x_regulator_probe':
   drivers/regulator/max597x-regulator.c:447:41: error: 'struct max597x_data' has no member named 'dev'
     447 |                     devm_kzalloc(max597x->dev, sizeof(struct max597x_regulator),
         |                                         ^~
   drivers/regulator/max597x-regulator.c:453:39: error: 'struct max597x_data' has no member named 'regmap'
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
   drivers/regulator/max597x-regulator.c:476:20: error: 'struct max597x_data' has no member named 'irq'
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
>> drivers/regulator/max597x-regulator.c:360:35: warning: 'max597x_regmap_config' defined but not used [-Wunused-const-variable=]
     360 | static const struct regmap_config max597x_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~


vim +/max597x_regmap_config +360 drivers/regulator/max597x-regulator.c

38493f008deb43 Patrick Rudolph 2022-07-05  359  
38493f008deb43 Patrick Rudolph 2022-07-05 @360  static const struct regmap_config max597x_regmap_config = {
38493f008deb43 Patrick Rudolph 2022-07-05  361  	.reg_bits = 8,
38493f008deb43 Patrick Rudolph 2022-07-05  362  	.val_bits = 8,
38493f008deb43 Patrick Rudolph 2022-07-05  363  	.max_register = MAX_REGISTERS,
38493f008deb43 Patrick Rudolph 2022-07-05  364  };
38493f008deb43 Patrick Rudolph 2022-07-05  365  

:::::: The code at line 360 was first introduced by commit
:::::: 38493f008deb435577361d4c4cdd69f7bb30f4b9 regulator: max597x: Add support for max597x regulator

:::::: TO: Patrick Rudolph <patrick.rudolph@9elements.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
