Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20A7273D8D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 15:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756049952; cv=none; b=dSu6K/rjo8hs4AFD8nJanBUb2P6PyHvi712o6UCWUVlReIjp51rHYv1OJnNgs78BSRoouddSDgaFif5DfqNOOhM2FPzVL43q+F3chiQG+zMKXKz6b1RoEJ08BsbMZV2pNEJrooQm8ObQavsjKdhyN4qzzMMTbkfwt59+rQxLBj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756049952; c=relaxed/simple;
	bh=Yrki1EonlkPikaNoH4zrkmvvLO8uO5krvQtQtz+JKnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HoKwkuvOZbFyBLr21jtGR1FRGe1fuObsA88ScqW9RPuXBlP1Pf/NHjRt+6r96nLebX1xWC3RWyyhDVs1JcqbafrauSUGEYr/O+MU213tXtRc7Gt/R6GSwsmTZugKQcgmL8Qdvnmi7+pt4wbKPZhPPm6Ru+7buPSBrFU2l2DW9qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSwkOdaJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSwkOdaJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756049951; x=1787585951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yrki1EonlkPikaNoH4zrkmvvLO8uO5krvQtQtz+JKnI=;
  b=NSwkOdaJFlS8rzgrfH8kZvbVS4cN++dhxF4odijZm3+LyKQylXncgG5G
   ZZ9RC0H+qPZG1yfCu3jJbBqeiPt188Dd9PoHCrC6fXxMz9QRlNtdGCWrC
   dOpb4rPOUxwnimpObEw5mzM8IF8Act8inoFlIq+5rFEnRgMIlXDO61rrh
   IiGGVoRbDGLm7XrVEBC574hqLOLbiI/2jbjgJNh98O8QHjyr2TU4Os2/2
   XTekbntRJGiO/k7yeaT1IgWA0k895xYUgyjjgzQ6ti+N5zznyP8Q4sgZw
   h1yfkw5b6/Ks3JXMVmsBohenS5VeIdF/CaclfkP8MIYr+cMhNopc1Vmck
   Q==;
X-CSE-ConnectionGUID: AhfmtIinSgmp0LVdxWt+Pw==
X-CSE-MsgGUID: 1rbtrm/bQdenyrizOqfRNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="68989889"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68989889"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 08:39:10 -0700
X-CSE-ConnectionGUID: tFvzdesKSgWN6T3us+zQMA==
X-CSE-MsgGUID: q3tkZmvCR9ub/cgETOByeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168341771"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Aug 2025 08:39:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqCoE-000N3j-0l;
	Sun, 24 Aug 2025 15:39:06 +0000
Date: Sun, 24 Aug 2025 23:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Chang <jeff_chang@richtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:file9hSd1B 2/6]
 drivers/regulator/rt5133-regulator.c:605:22: error: assignment to 'int
 (*)(struct gpio_chip *, unsigned int,  int)' from incompatible pointer type
 'void (*)(struct gpio_chip *, unsigned int,  int)'
Message-ID: <202508242354.RCxgsVve-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git file9hSd1B
head:   a38bbcf99a235ad87ca22a673abe906c45f88c4e
commit: 06d526b92e54e82ffe5c7f1d803e83c7f9bcca8b [2/6] regulator: rt5133: Add RT5133 PMIC regulator Support
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20250824/202508242354.RCxgsVve-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508242354.RCxgsVve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508242354.RCxgsVve-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/regulator/rt5133-regulator.c: In function 'rt5133_probe':
>> drivers/regulator/rt5133-regulator.c:605:22: error: assignment to 'int (*)(struct gpio_chip *, unsigned int,  int)' from incompatible pointer type 'void (*)(struct gpio_chip *, unsigned int,  int)' [-Wincompatible-pointer-types]
     605 |         priv->gc.set = rt5133_gpio_set;
         |                      ^
   drivers/regulator/rt5133-regulator.c:261:13: note: 'rt5133_gpio_set' declared here
     261 | static void rt5133_gpio_set(struct gpio_chip *chip, unsigned int offset,
         |             ^~~~~~~~~~~~~~~


vim +605 drivers/regulator/rt5133-regulator.c

   542	
   543	static int rt5133_probe(struct i2c_client *i2c)
   544	{
   545		struct rt5133_priv *priv;
   546		struct regulator_config config = {0};
   547		int i, ret;
   548	
   549		priv = devm_kzalloc(&i2c->dev, sizeof(*priv), GFP_KERNEL);
   550		if (!priv)
   551			return -ENOMEM;
   552	
   553		priv->dev = &i2c->dev;
   554		crc8_populate_msb(priv->crc8_tbls, RT5133_CRC8_POLYNOMIAL);
   555	
   556		priv->enable_gpio = devm_gpiod_get_optional(&i2c->dev, "enable",
   557							    GPIOD_OUT_HIGH);
   558		if (IS_ERR(priv->enable_gpio))
   559			dev_err(&i2c->dev, "Failed to request HWEN gpio, check if default en=high\n");
   560	
   561		priv->regmap = devm_regmap_init(&i2c->dev, &rt5133_regmap_bus, priv,
   562						&rt5133_regmap_config);
   563		if (IS_ERR(priv->regmap)) {
   564			dev_err(&i2c->dev, "Failed to register regmap\n");
   565			return PTR_ERR(priv->regmap);
   566		}
   567	
   568		ret = rt5133_validate_vendor_info(priv);
   569		if (ret) {
   570			dev_err(&i2c->dev, "Failed to check vendor info [%d]\n", ret);
   571			return ret;
   572		}
   573	
   574		ret = rt5133_chip_reset(priv);
   575		if (ret) {
   576			dev_err(&i2c->dev, "Failed to execute sw reset\n");
   577			return ret;
   578		}
   579	
   580		config.dev = &i2c->dev;
   581		config.driver_data = priv;
   582		config.regmap = priv->regmap;
   583	
   584		for (i = 0; i < RT5133_REGULATOR_MAX; i++) {
   585			priv->rdev[i] = devm_regulator_register(&i2c->dev,
   586								priv->cdata->regulators + i,
   587								&config);
   588			if (IS_ERR(priv->rdev[i])) {
   589				dev_err(&i2c->dev,
   590					"Failed to register [%d] regulator\n", i);
   591				return PTR_ERR(priv->rdev[i]);
   592			}
   593		}
   594	
   595		ret = rt5133_parse_dt(priv);
   596		if (ret) {
   597			dev_err(&i2c->dev, "%s, Failed to parse dt\n", __func__);
   598			return ret;
   599		}
   600	
   601		priv->gc.label = dev_name(&i2c->dev);
   602		priv->gc.parent = &i2c->dev;
   603		priv->gc.base = -1;
   604		priv->gc.ngpio = RT5133_GPIO_NR;
 > 605		priv->gc.set = rt5133_gpio_set;
   606		priv->gc.get = rt5133_gpio_get;
   607		priv->gc.direction_output = rt5133_gpio_direction_output;
   608		priv->gc.can_sleep = true;
   609	
   610		ret = devm_gpiochip_add_data(&i2c->dev, &priv->gc, priv);
   611		if (ret)
   612			return ret;
   613	
   614		ret = rt5133_enable_interrupts(i2c->irq, priv);
   615		if (ret) {
   616			dev_err(&i2c->dev, "enable interrupt failed\n");
   617			return ret;
   618		}
   619	
   620		i2c_set_clientdata(i2c, priv);
   621	
   622		return ret;
   623	}
   624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
