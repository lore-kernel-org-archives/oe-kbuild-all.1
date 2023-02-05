Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5262215B4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 01:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675560089; x=1707096089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o5kjE/imZdSh/XdeqqbLjOha58INFy9iDWdnIcW8Lm8=;
  b=F14nwcUTVgivU/BUbUAPitbEvXgUwiiciSWatOaxdPyE03i0uTEtCt5L
   s4J9XRbNd6eZk7g9DN+2jYCYKvyTJWziYzlOjMlaMnQpx6dTxtiO+iPAW
   v/A8ln2aYBEAKHta1ollADzcid6ue+UlS1H4imCvNXTEcg7hylGMXWrpI
   0E/1gtGS7yZ5n07a/RBNj++U1GWYszu5N1uVsmTyvMzeFF3cHq3YNYmRA
   YiEztuk2Xl/zifyogun5qVUJdPqts34QzWAIok8pJztUvXmlLMxZ4c+Wg
   FFu+0cKg5hwSp56p0auc0w84TWwX2r9v7nRM+8s/VSDmo/4MLFtT2Ipv5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="415225407"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="415225407"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 17:21:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="616092042"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="616092042"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Feb 2023 17:21:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOTiI-0001d9-1P;
	Sun, 05 Feb 2023 01:21:02 +0000
Date: Sun, 5 Feb 2023 09:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 160/20208]
 sound/soc/codecs/pcm512x.c:1595:14: warning: unused variable 'clk_name'
Message-ID: <202302050945.cd1bsDVd-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: c7981269740967250226190f3236434d1f060084 [160/20208] MLK-25015: sound: soc: codecs: pcm512x: set input sclk
config: x86_64-randconfig-a004 (https://download.01.org/0day-ci/archive/20230205/202302050945.cd1bsDVd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Freescale/linux-fslc/commit/c7981269740967250226190f3236434d1f060084
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout c7981269740967250226190f3236434d1f060084
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/input/touchscreen/ sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/codecs/pcm512x.c: In function 'pcm512x_probe':
>> sound/soc/codecs/pcm512x.c:1595:14: warning: unused variable 'clk_name' [-Wunused-variable]
    1595 |         char clk_name[8];
         |              ^~~~~~~~


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
https://github.com/intel/lkp-tests
