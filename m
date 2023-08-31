Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7929D1846
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 05:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693459869; x=1724995869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5yjFWjVmw6OhzAHda5Q62eUzhhAInSELlK6a+y4TOK8=;
  b=S46VGGfZsnsoWaJeX1s2NJVWH5fuFak5M+VvboZlSDbQ38vPUJUfwC+e
   OSowmfU9ZKkELnp7AknsMki58xzxmK0h7603ZDIJTDdrZoXAeNWrRxSEL
   PHV1/j1oOoq0n6iCswnAjTzDk/dmUqo1MoifnJjfjyzfX+bWV+pZiCeuG
   sbyuBkSwn39EqPvgpmzG0eu/9g7dNcUJaZyKc9X+AuGejCOGgHmbbPfkL
   K7OoCvySF25fUPyeEvUz51EgkUHIZRWNwqYsMkWTNWSGT6HG6nhqiWUcx
   7GTCuHnfcFUYyBFOnRrERqIw60oB+0rUa+NvfANn/Stq3F/mGdFz4ow5z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442179047"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="442179047"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 22:31:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="804799794"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="804799794"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Aug 2023 22:31:07 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbaGd-000Ah7-1c;
	Thu, 31 Aug 2023 05:31:00 +0000
Date: Thu, 31 Aug 2023 13:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 160/24604]
 sound/soc/codecs/pcm512x.c:1595:7: warning: unused variable 'clk_name'
Message-ID: <202308311308.77SwqqDO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Adrian,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: c7981269740967250226190f3236434d1f060084 [160/24604] MLK-25015: sound: soc: codecs: pcm512x: set input sclk
config: hexagon-randconfig-r013-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311308.77SwqqDO-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311308.77SwqqDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311308.77SwqqDO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/pcm512x.c:1595:7: warning: unused variable 'clk_name' [-Wunused-variable]
           char clk_name[8];
                ^
   1 warning generated.


vim +/clk_name +1595 sound/soc/codecs/pcm512x.c

  1591	
  1592	int pcm512x_probe(struct device *dev, struct regmap *regmap)
  1593	{
  1594		struct pcm512x_priv *pcm512x;
> 1595		char clk_name[8];
  1596		int i, ret;
  1597	
  1598		pcm512x = devm_kzalloc(dev, sizeof(struct pcm512x_priv), GFP_KERNEL);
  1599		if (!pcm512x)
  1600			return -ENOMEM;
  1601	
  1602		mutex_init(&pcm512x->mutex);
  1603	
  1604		dev_set_drvdata(dev, pcm512x);
  1605		pcm512x->regmap = regmap;
  1606	
  1607		for (i = 0; i < ARRAY_SIZE(pcm512x->supplies); i++)
  1608			pcm512x->supplies[i].supply = pcm512x_supply_names[i];
  1609	
  1610		ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pcm512x->supplies),
  1611					      pcm512x->supplies);
  1612		if (ret != 0) {
  1613			dev_err(dev, "Failed to get supplies: %d\n", ret);
  1614			return ret;
  1615		}
  1616	
  1617		pcm512x->supply_nb[0].notifier_call = pcm512x_regulator_event_0;
  1618		pcm512x->supply_nb[1].notifier_call = pcm512x_regulator_event_1;
  1619		pcm512x->supply_nb[2].notifier_call = pcm512x_regulator_event_2;
  1620	
  1621		for (i = 0; i < ARRAY_SIZE(pcm512x->supplies); i++) {
  1622			ret = devm_regulator_register_notifier(
  1623							pcm512x->supplies[i].consumer,
  1624							&pcm512x->supply_nb[i]);
  1625			if (ret != 0) {
  1626				dev_err(dev,
  1627					"Failed to register regulator notifier: %d\n",
  1628					ret);
  1629			}
  1630		}
  1631	
  1632		ret = regulator_bulk_enable(ARRAY_SIZE(pcm512x->supplies),
  1633					    pcm512x->supplies);
  1634		if (ret != 0) {
  1635			dev_err(dev, "Failed to enable supplies: %d\n", ret);
  1636			return ret;
  1637		}
  1638	
  1639		/* Reset the device, verifying I/O in the process for I2C */
  1640		ret = regmap_write(regmap, PCM512x_RESET,
  1641				   PCM512x_RSTM | PCM512x_RSTR);
  1642		if (ret != 0) {
  1643			dev_err(dev, "Failed to reset device: %d\n", ret);
  1644			goto err;
  1645		}
  1646	
  1647		ret = regmap_write(regmap, PCM512x_RESET, 0);
  1648		if (ret != 0) {
  1649			dev_err(dev, "Failed to reset device: %d\n", ret);
  1650			goto err;
  1651		}
  1652	
  1653		/* default to first sclk */
  1654		pcm512x->num_clocks = 1;
  1655		pcm512x->sclk_src = PCM512x_SYSCLK_MCLK1;
  1656	
  1657		pcm512x->sclk[0] = devm_clk_get(dev, NULL);
  1658		if (PTR_ERR(pcm512x->sclk[0]) == -EPROBE_DEFER) {
  1659			ret = -EPROBE_DEFER;
  1660			goto err;
  1661		}
  1662	
  1663		if (!IS_ERR(pcm512x->sclk[0])) {
  1664			ret = clk_prepare_enable(pcm512x->sclk[0]);
  1665			if (ret != 0) {
  1666				dev_err(dev, "Failed to enable SCLK: %d\n", ret);
  1667				goto err;
  1668			}
  1669		}
  1670	
  1671		/* Default to standby mode */
  1672		ret = regmap_update_bits(pcm512x->regmap, PCM512x_POWER,
  1673					 PCM512x_RQST, PCM512x_RQST);
  1674		if (ret != 0) {
  1675			dev_err(dev, "Failed to request standby: %d\n",
  1676				ret);
  1677			goto err_clk;
  1678		}
  1679	
  1680		pm_runtime_set_active(dev);
  1681		pm_runtime_enable(dev);
  1682		pm_runtime_idle(dev);
  1683	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
