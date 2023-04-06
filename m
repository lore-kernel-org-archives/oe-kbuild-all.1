Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB196FD0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 14:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680791161; x=1712327161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vj+HIBzGm+7m7uGY63WM1MlgTshKyfs5HfqoP9uFhy4=;
  b=RHwbhQ5gm1pEzy7z3hhTFxwA2KH8zkKiBz8wd5IIw7aG/3d0F00Xyech
   +50Ab1xrGEzT/kghzQb5XRMnm3a61164MZ6slnYJG8iLyNPxhroH9cKiL
   1nIiURlnTP7xQNi9k1Y7AU8uBuF9T3ern/0B8Wz8pRG5PA9ent8XmneIS
   24CmdGsSMLVPMlxYeV7H0H9KE1xTqE0GSpp3QktiCJtwgU+NJjnfNFXYX
   teMO0+OU9YveBnkoeLKVbzph4eAEV2Zsoxf7N+vauA1yvQG6UQfuzINpc
   c78Vyvj+3gDp57v7AVHccvu+LNiw8q8yBUnk+8aVT/8TxAtbz5AVmdKgH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="342753799"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="342753799"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 07:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="830765900"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="830765900"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2023 07:26:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkQYk-000RQs-2d;
	Thu, 06 Apr 2023 14:25:54 +0000
Date: Thu, 6 Apr 2023 22:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [abelvesa:qcom/genpd/ignore_unused_until_sync_state 1/1]
 drivers/soc/imx/gpcv2.c:1346:51: warning: implicit conversion from 'enum
 <anonymous>' to 'enum gpd_status'
Message-ID: <202304062203.bBbr9MNP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git qcom/genpd/ignore_unused_until_sync_state
head:   4f9e6140dfe77884012383f8ba2140cadb62ca4a
commit: 4f9e6140dfe77884012383f8ba2140cadb62ca4a [1/1] [WIP]: PM: domains: Keep domains enabled/unknown at boot enabled until sync state
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230406/202304062203.bBbr9MNP-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/commit/?id=4f9e6140dfe77884012383f8ba2140cadb62ca4a
        git remote add abelvesa https://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git
        git fetch --no-tags abelvesa qcom/genpd/ignore_unused_until_sync_state
        git checkout 4f9e6140dfe77884012383f8ba2140cadb62ca4a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304062203.bBbr9MNP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/imx/gpcv2.c: In function 'imx_pgc_domain_probe':
>> drivers/soc/imx/gpcv2.c:1346:51: warning: implicit conversion from 'enum <anonymous>' to 'enum gpd_status' [-Wenum-conversion]
    1346 |         ret = pm_genpd_init(&domain->genpd, NULL, true);
         |                                                   ^~~~
--
   drivers/soc/imx/imx8m-blk-ctrl.c: In function 'imx8m_blk_ctrl_probe':
>> drivers/soc/imx/imx8m-blk-ctrl.c:273:59: warning: implicit conversion from 'enum <anonymous>' to 'enum gpd_status' [-Wenum-conversion]
     273 |                 ret = pm_genpd_init(&domain->genpd, NULL, true);
         |                                                           ^~~~
--
   drivers/soc/imx/imx8mp-blk-ctrl.c: In function 'imx8mp_blk_ctrl_probe':
>> drivers/soc/imx/imx8mp-blk-ctrl.c:704:59: warning: implicit conversion from 'enum <anonymous>' to 'enum gpd_status' [-Wenum-conversion]
     704 |                 ret = pm_genpd_init(&domain->genpd, NULL, true);
         |                                                           ^~~~
--
   drivers/soc/imx/imx93-blk-ctrl.c: In function 'imx93_blk_ctrl_probe':
>> drivers/soc/imx/imx93-blk-ctrl.c:266:59: warning: implicit conversion from 'enum <anonymous>' to 'enum gpd_status' [-Wenum-conversion]
     266 |                 ret = pm_genpd_init(&domain->genpd, NULL, true);
         |                                                           ^~~~
--
   drivers/soc/mediatek/mtk-pm-domains.c: In function 'scpsys_add_one_domain':
>> drivers/soc/mediatek/mtk-pm-domains.c:465:49: warning: implicit conversion from 'enum <anonymous>' to 'enum gpd_status' [-Wenum-conversion]
     465 |                 pm_genpd_init(&pd->genpd, NULL, true);
         |                                                 ^~~~
   drivers/soc/mediatek/mtk-pm-domains.c:467:49: warning: implicit conversion from 'enum <anonymous>' to 'enum gpd_status' [-Wenum-conversion]
     467 |                 pm_genpd_init(&pd->genpd, NULL, false);
         |                                                 ^~~~~
--
   drivers/firmware/scpi_pm_domain.c: In function 'scpi_pm_domain_probe':
>> drivers/firmware/scpi_pm_domain.c:128:54: warning: implicit conversion from 'enum <anonymous>' to 'enum gpd_status' [-Wenum-conversion]
     128 |                 pm_genpd_init(&scpi_pd->genpd, NULL, true);
         |                                                      ^~~~
--
   drivers/soc/amlogic/meson-ee-pwrc.c: In function 'meson_ee_pwrc_init_domain':
>> drivers/soc/amlogic/meson-ee-pwrc.c:471:55: warning: implicit conversion from 'enum <anonymous>' to 'enum gpd_status' [-Wenum-conversion]
     471 |                 ret = pm_genpd_init(&dom->base, NULL, false);
         |                                                       ^~~~~
--
   drivers/soc/qcom/rpmhpd.c: In function 'rpmhpd_probe':
>> drivers/soc/qcom/rpmhpd.c:792:54: warning: implicit conversion from 'enum <anonymous>' to 'enum gpd_status' [-Wenum-conversion]
     792 |                 pm_genpd_init(&rpmhpds[i]->pd, NULL, true);
         |                                                      ^~~~
--
   drivers/soc/qcom/rpmpd.c: In function 'rpmpd_probe':
>> drivers/soc/qcom/rpmpd.c:959:53: warning: implicit conversion from 'enum <anonymous>' to 'enum gpd_status' [-Wenum-conversion]
     959 |                 pm_genpd_init(&rpmpds[i]->pd, NULL, true);
         |                                                     ^~~~
--
   drivers/soc/renesas/rcar-sysc.c: In function 'rcar_sysc_pd_setup':
>> drivers/soc/renesas/rcar-sysc.c:263:60: warning: implicit conversion from 'enum <anonymous>' to 'enum gpd_status' [-Wenum-conversion]
     263 |         error = pm_genpd_init(genpd, &simple_qos_governor, false);
         |                                                            ^~~~~
--
   drivers/soc/renesas/rcar-gen4-sysc.c: In function 'rcar_gen4_sysc_pd_setup':
>> drivers/soc/renesas/rcar-gen4-sysc.c:271:60: warning: implicit conversion from 'enum <anonymous>' to 'enum gpd_status' [-Wenum-conversion]
     271 |         error = pm_genpd_init(genpd, &simple_qos_governor, false);
         |                                                            ^~~~~
..


vim +1346 drivers/soc/imx/gpcv2.c

2a53b9d47b13ae Adam Ford      2021-05-24  1312  
73f59712a1a3e5 Anson Huang    2018-08-28  1313  static int imx_pgc_domain_probe(struct platform_device *pdev)
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1314  {
73f59712a1a3e5 Anson Huang    2018-08-28  1315  	struct imx_pgc_domain *domain = pdev->dev.platform_data;
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1316  	int ret;
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1317  
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1318  	domain->dev = &pdev->dev;
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1319  
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1320  	domain->regulator = devm_regulator_get_optional(domain->dev, "power");
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1321  	if (IS_ERR(domain->regulator)) {
b663b798d04fb7 Anson Huang    2020-08-11  1322  		if (PTR_ERR(domain->regulator) != -ENODEV)
b663b798d04fb7 Anson Huang    2020-08-11  1323  			return dev_err_probe(domain->dev, PTR_ERR(domain->regulator),
b663b798d04fb7 Anson Huang    2020-08-11  1324  					     "Failed to get domain's regulator\n");
685efffe37c921 Lucas Stach    2018-11-16  1325  	} else if (domain->voltage) {
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1326  		regulator_set_voltage(domain->regulator,
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1327  				      domain->voltage, domain->voltage);
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1328  	}
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1329  
cbca0b4fd21123 Lucas Stach    2021-05-10  1330  	domain->num_clks = devm_clk_bulk_get_all(domain->dev, &domain->clks);
cbca0b4fd21123 Lucas Stach    2021-05-10  1331  	if (domain->num_clks < 0)
cbca0b4fd21123 Lucas Stach    2021-05-10  1332  		return dev_err_probe(domain->dev, domain->num_clks,
cbca0b4fd21123 Lucas Stach    2021-05-10  1333  				     "Failed to get domain's clocks\n");
ae1d2add26a4a0 Lucas Stach    2018-12-17  1334  
fe58c887fb8ca2 Lucas Stach    2021-05-10  1335  	domain->reset = devm_reset_control_array_get_optional_exclusive(domain->dev);
fe58c887fb8ca2 Lucas Stach    2021-05-10  1336  	if (IS_ERR(domain->reset))
fe58c887fb8ca2 Lucas Stach    2021-05-10  1337  		return dev_err_probe(domain->dev, PTR_ERR(domain->reset),
fe58c887fb8ca2 Lucas Stach    2021-05-10  1338  				     "Failed to get domain's resets\n");
fe58c887fb8ca2 Lucas Stach    2021-05-10  1339  
1382eb1967d74f Lucas Stach    2021-05-10  1340  	pm_runtime_enable(domain->dev);
1382eb1967d74f Lucas Stach    2021-05-10  1341  
c0ce75395f8d08 Lucas Stach    2021-05-10  1342  	if (domain->bits.map)
d9651b99dd65e8 Lucas Stach    2022-03-30  1343  		regmap_update_bits(domain->regmap, domain->regs->map,
4ac6317a370100 Lucas Stach    2021-05-10  1344  				   domain->bits.map, domain->bits.map);
4ac6317a370100 Lucas Stach    2021-05-10  1345  
9e01e2d56db234 Stefan Agner   2017-08-02 @1346  	ret = pm_genpd_init(&domain->genpd, NULL, true);
9e01e2d56db234 Stefan Agner   2017-08-02  1347  	if (ret) {
9e01e2d56db234 Stefan Agner   2017-08-02  1348  		dev_err(domain->dev, "Failed to init power domain\n");
4ac6317a370100 Lucas Stach    2021-05-10  1349  		goto out_domain_unmap;
9e01e2d56db234 Stefan Agner   2017-08-02  1350  	}
9e01e2d56db234 Stefan Agner   2017-08-02  1351  
fadf79a07b48af Lucas Stach    2021-10-02  1352  	if (IS_ENABLED(CONFIG_LOCKDEP) &&
fadf79a07b48af Lucas Stach    2021-10-02  1353  	    of_property_read_bool(domain->dev->of_node, "power-domains"))
fadf79a07b48af Lucas Stach    2021-10-02  1354  		lockdep_set_subclass(&domain->genpd.mlock, 1);
fadf79a07b48af Lucas Stach    2021-10-02  1355  
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1356  	ret = of_genpd_add_provider_simple(domain->dev->of_node,
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1357  					   &domain->genpd);
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1358  	if (ret) {
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1359  		dev_err(domain->dev, "Failed to add genpd provider\n");
4ed57c97b414a2 Lucas Stach    2021-05-10  1360  		goto out_genpd_remove;
4ed57c97b414a2 Lucas Stach    2021-05-10  1361  	}
4ed57c97b414a2 Lucas Stach    2021-05-10  1362  
4ed57c97b414a2 Lucas Stach    2021-05-10  1363  	return 0;
4ed57c97b414a2 Lucas Stach    2021-05-10  1364  
4ed57c97b414a2 Lucas Stach    2021-05-10  1365  out_genpd_remove:
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1366  	pm_genpd_remove(&domain->genpd);
4ac6317a370100 Lucas Stach    2021-05-10  1367  out_domain_unmap:
c0ce75395f8d08 Lucas Stach    2021-05-10  1368  	if (domain->bits.map)
d9651b99dd65e8 Lucas Stach    2022-03-30  1369  		regmap_update_bits(domain->regmap, domain->regs->map,
4ac6317a370100 Lucas Stach    2021-05-10  1370  				   domain->bits.map, 0);
1382eb1967d74f Lucas Stach    2021-05-10  1371  	pm_runtime_disable(domain->dev);
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1372  
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1373  	return ret;
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1374  }
03aa12629fc4f7 Andrey Smirnov 2017-03-28  1375  

:::::: The code at line 1346 was first introduced by commit
:::::: 9e01e2d56db23485a75864b6aeee8e443f024ddb soc: imx: gpcv2: fix regulator deferred probe

:::::: TO: Stefan Agner <stefan@agner.ch>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
