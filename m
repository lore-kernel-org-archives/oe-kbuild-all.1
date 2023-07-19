Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9A413FE0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 14:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689775410; x=1721311410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bkHJteSgbD0eg1BB+H05YxW7NNNqfd82UUqefNUorzg=;
  b=FfFBsFQJOMWjtyHOGuh/QP7IJQFaKLnqhzukOjQ4bx4aQt4FJhm69bcv
   La/9SRLysIYuCiMgMbdCEzcpnxkr+lCx1evE5rh/YGMFwbBV7K1m9/JKW
   XJbwtBQM+PDpzltsgl1jBBo0NVbq6NOiT0lg5j24sRopnjtdp7YDIeAt8
   A2Jth/l0vCCQnlbvu78lrC9IglDQUe+bDyZb+oMhAi6RL3jbqF+CDd9av
   Clx3n9VqYTMjTeboStBuaLzNezNGue8WtmnwvZJRdMYovFtoeRtWwZYcC
   5XbPLEjTtgx/cOcinWAZUGtrq+TS8JnpM6TD9T0sSe5a7e4faF0B5qHUU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430240129"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="430240129"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 07:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="674308863"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="674308863"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 19 Jul 2023 07:02:39 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM7lG-0004zd-11;
	Wed, 19 Jul 2023 14:02:38 +0000
Date: Wed, 19 Jul 2023 22:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/637 140/12466] sound/soc/codecs/pcm512x.c:1594:7:
 warning: unused variable 'clk_name'
Message-ID: <202307192221.u3rREYV6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/637
head:   ec33c7fc43bef23fa0b69db996fee0ba601875e9
commit: 90e8a15795a3ebaba518deb67fc8d32081769002 [140/12466] MLK-25015: sound: soc: codecs: pcm512x: set input sclk
config: x86_64-randconfig-r015-20230718 (https://download.01.org/0day-ci/archive/20230719/202307192221.u3rREYV6-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192221.u3rREYV6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307192221.u3rREYV6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/pcm512x.c:1594:7: warning: unused variable 'clk_name' [-Wunused-variable]
           char clk_name[8];
                ^
   1 warning generated.


vim +/clk_name +1594 sound/soc/codecs/pcm512x.c

  1590	
  1591	int pcm512x_probe(struct device *dev, struct regmap *regmap)
  1592	{
  1593		struct pcm512x_priv *pcm512x;
> 1594		char clk_name[8];
  1595		int i, ret;
  1596	
  1597		pcm512x = devm_kzalloc(dev, sizeof(struct pcm512x_priv), GFP_KERNEL);
  1598		if (!pcm512x)
  1599			return -ENOMEM;
  1600	
  1601		mutex_init(&pcm512x->mutex);
  1602	
  1603		dev_set_drvdata(dev, pcm512x);
  1604		pcm512x->regmap = regmap;
  1605	
  1606		for (i = 0; i < ARRAY_SIZE(pcm512x->supplies); i++)
  1607			pcm512x->supplies[i].supply = pcm512x_supply_names[i];
  1608	
  1609		ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pcm512x->supplies),
  1610					      pcm512x->supplies);
  1611		if (ret != 0) {
  1612			dev_err(dev, "Failed to get supplies: %d\n", ret);
  1613			return ret;
  1614		}
  1615	
  1616		pcm512x->supply_nb[0].notifier_call = pcm512x_regulator_event_0;
  1617		pcm512x->supply_nb[1].notifier_call = pcm512x_regulator_event_1;
  1618		pcm512x->supply_nb[2].notifier_call = pcm512x_regulator_event_2;
  1619	
  1620		for (i = 0; i < ARRAY_SIZE(pcm512x->supplies); i++) {
  1621			ret = devm_regulator_register_notifier(
  1622							pcm512x->supplies[i].consumer,
  1623							&pcm512x->supply_nb[i]);
  1624			if (ret != 0) {
  1625				dev_err(dev,
  1626					"Failed to register regulator notifier: %d\n",
  1627					ret);
  1628			}
  1629		}
  1630	
  1631		ret = regulator_bulk_enable(ARRAY_SIZE(pcm512x->supplies),
  1632					    pcm512x->supplies);
  1633		if (ret != 0) {
  1634			dev_err(dev, "Failed to enable supplies: %d\n", ret);
  1635			return ret;
  1636		}
  1637	
  1638		/* Reset the device, verifying I/O in the process for I2C */
  1639		ret = regmap_write(regmap, PCM512x_RESET,
  1640				   PCM512x_RSTM | PCM512x_RSTR);
  1641		if (ret != 0) {
  1642			dev_err(dev, "Failed to reset device: %d\n", ret);
  1643			goto err;
  1644		}
  1645	
  1646		ret = regmap_write(regmap, PCM512x_RESET, 0);
  1647		if (ret != 0) {
  1648			dev_err(dev, "Failed to reset device: %d\n", ret);
  1649			goto err;
  1650		}
  1651	
  1652		/* default to first sclk */
  1653		pcm512x->num_clocks = 1;
  1654		pcm512x->sclk_src = PCM512x_SYSCLK_MCLK1;
  1655	
  1656		pcm512x->sclk[0] = devm_clk_get(dev, NULL);
  1657		if (PTR_ERR(pcm512x->sclk[0]) == -EPROBE_DEFER) {
  1658			ret = -EPROBE_DEFER;
  1659			goto err;
  1660		}
  1661	
  1662		if (!IS_ERR(pcm512x->sclk[0])) {
  1663			ret = clk_prepare_enable(pcm512x->sclk[0]);
  1664			if (ret != 0) {
  1665				dev_err(dev, "Failed to enable SCLK: %d\n", ret);
  1666				goto err;
  1667			}
  1668		}
  1669	
  1670		/* Default to standby mode */
  1671		ret = regmap_update_bits(pcm512x->regmap, PCM512x_POWER,
  1672					 PCM512x_RQST, PCM512x_RQST);
  1673		if (ret != 0) {
  1674			dev_err(dev, "Failed to request standby: %d\n",
  1675				ret);
  1676			goto err_clk;
  1677		}
  1678	
  1679		pm_runtime_set_active(dev);
  1680		pm_runtime_enable(dev);
  1681		pm_runtime_idle(dev);
  1682	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
