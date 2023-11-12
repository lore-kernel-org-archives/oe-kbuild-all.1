Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A74E1840
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 03:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYiA/+cN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699761296; x=1731297296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9ZYnMAAX1Pi1fTkXbGvWRD1CSAfqpSLnT7C5cE01qRo=;
  b=JYiA/+cNE+H/UZRWcEnArGG/GBxYewEwD/QHO+hQUulLwONKq46jz402
   9dhHyxONtyMzsPaOZ518sliR4UArZnZIw3AUlvWLeLZkeEOnWjKTv0KNi
   jHeDU+ndlWQGVpESAM9J96txRZiNDs9x6Jy7wCMFkOqqy2+eirVAX1I8t
   0PUK5712poLa+g9KHdEw9es9CgFgPNTUdEZUykSHeoXf33NDaRx8354s1
   6I4GA9z46gx7V4L5tp/+8InV9IiRxaO2Qkgr9Y5xNszrXgZ1qx8mFQFlI
   huxad3MSe9cL1F/2WcNWn6sVbwzPDsX6DAY/EzgB1WAwklOnQuEKFU81c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="394210915"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="394210915"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 19:54:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="1095466454"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="1095466454"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Nov 2023 19:54:54 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r21Yi-000Avy-13;
	Sun, 12 Nov 2023 03:54:52 +0000
Date: Sun, 12 Nov 2023 11:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 4/5] net: dsa: realtek: load switch variants on
 demand
Message-ID: <202311121144.6m9zKmIa-lkp@intel.com>
References: <20231111215647.4966-5-luizluca@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231111215647.4966-5-luizluca@gmail.com>

Hi Luiz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Angelo-Daros-de-Luca/dt-bindings-net-dsa-realtek-reset-gpios-is-not-required/20231112-055916
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231111215647.4966-5-luizluca%40gmail.com
patch subject: [RFC net-next 4/5] net: dsa: realtek: load switch variants on demand
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231112/202311121144.6m9zKmIa-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311121144.6m9zKmIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311121144.6m9zKmIa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   hppa-linux-ld: drivers/mtd/nand/raw/nand_base.o: in function `nand_do_write_ops':
>> (.text+0x4a24): undefined reference to `.L874'
--
   drivers/net/dsa/realtek/realtek-common.c: In function 'realtek_common_probe':
>> drivers/net/dsa/realtek/realtek-common.c:107:68: warning: format '%s' expects argument of type 'char *', but argument 5 has type 'const void *' [-Wformat=]
     107 |                               "failed to get module for '%s'. Is '%s' loaded?",
         |                                                                   ~^
         |                                                                    |
         |                                                                    char *
         |                                                                   %p
     108 |                               match->compatible, match->data);
         |                                                  ~~~~~~~~~~~        
         |                                                       |
         |                                                       const void *


vim +107 drivers/net/dsa/realtek/realtek-common.c

    89	
    90	struct realtek_priv *realtek_common_probe(struct device *dev,
    91			struct regmap_config rc, struct regmap_config rc_nolock)
    92	{
    93		const struct realtek_variant *var;
    94		const struct of_device_id *match;
    95		struct realtek_priv *priv;
    96		struct device_node *np;
    97		int ret;
    98	
    99		match = of_match_device(dev->driver->of_match_table, dev);
   100		if (!match || !match->data)
   101			return ERR_PTR(-EINVAL);
   102	
   103		var = realtek_variant_get(match);
   104		if (IS_ERR(var)) {
   105			ret = PTR_ERR(var);
   106			dev_err_probe(dev, ret,
 > 107				      "failed to get module for '%s'. Is '%s' loaded?",
   108				      match->compatible, match->data);
   109			goto err_variant_put;
   110		}
   111	
   112		priv = devm_kzalloc(dev, size_add(sizeof(*priv), var->chip_data_sz),
   113				    GFP_KERNEL);
   114		if (!priv) {
   115			ret = -ENOMEM;
   116			goto err_variant_put;
   117		}
   118	
   119		mutex_init(&priv->map_lock);
   120	
   121		rc.lock_arg = priv;
   122		priv->map = devm_regmap_init(dev, NULL, priv, &rc);
   123		if (IS_ERR(priv->map)) {
   124			ret = PTR_ERR(priv->map);
   125			dev_err(dev, "regmap init failed: %d\n", ret);
   126			goto err_variant_put;
   127		}
   128	
   129		priv->map_nolock = devm_regmap_init(dev, NULL, priv, &rc_nolock);
   130		if (IS_ERR(priv->map_nolock)) {
   131			ret = PTR_ERR(priv->map_nolock);
   132			dev_err(dev, "regmap init failed: %d\n", ret);
   133			goto err_variant_put;
   134		}
   135	
   136		/* Link forward and backward */
   137		priv->dev = dev;
   138		priv->clk_delay = var->clk_delay;
   139		priv->cmd_read = var->cmd_read;
   140		priv->cmd_write = var->cmd_write;
   141		priv->variant = var;
   142		priv->ops = var->ops;
   143		priv->chip_data = (void *)priv + sizeof(*priv);
   144	
   145		dev_set_drvdata(dev, priv);
   146		spin_lock_init(&priv->lock);
   147	
   148		/* Fetch MDIO pins */
   149		priv->mdc = devm_gpiod_get_optional(dev, "mdc", GPIOD_OUT_LOW);
   150	
   151		if (IS_ERR(priv->mdc)) {
   152			ret = PTR_ERR(priv->mdc);
   153			goto err_variant_put;
   154		}
   155	
   156		priv->mdio = devm_gpiod_get_optional(dev, "mdio", GPIOD_OUT_LOW);
   157		if (IS_ERR(priv->mdio)) {
   158			ret = PTR_ERR(priv->mdio);
   159			goto err_variant_put;
   160		}
   161	
   162		np = dev->of_node;
   163		priv->leds_disabled = of_property_read_bool(np, "realtek,disable-leds");
   164	
   165		/* TODO: if power is software controlled, set up any regulators here */
   166		priv->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
   167		if (IS_ERR(priv->reset)) {
   168			ret = PTR_ERR(priv->reset);
   169			dev_err(dev, "failed to get RESET GPIO\n");
   170			goto err_variant_put;
   171		}
   172		if (priv->reset) {
   173			gpiod_set_value(priv->reset, 1);
   174			dev_dbg(dev, "asserted RESET\n");
   175			msleep(REALTEK_HW_STOP_DELAY);
   176			gpiod_set_value(priv->reset, 0);
   177			msleep(REALTEK_HW_START_DELAY);
   178			dev_dbg(dev, "deasserted RESET\n");
   179		}
   180	
   181		priv->ds = devm_kzalloc(dev, sizeof(*priv->ds), GFP_KERNEL);
   182		if (!priv->ds) {
   183			ret = -ENOMEM;
   184			goto err_variant_put;
   185		}
   186	
   187		priv->ds->dev = dev;
   188		priv->ds->priv = priv;
   189	
   190		return priv;
   191	
   192	err_variant_put:
   193		realtek_variant_put(var);
   194	
   195		return ERR_PTR(ret);
   196	}
   197	EXPORT_SYMBOL(realtek_common_probe);
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
