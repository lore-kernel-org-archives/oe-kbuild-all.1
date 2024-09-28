Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA06A1DFF0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 19:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727552615; cv=none; b=SGPq3TZxHldobyLSfbbywtXyCVXhkeuW9S7oNdDQLv6YIXa6hbgdVkpTcmRNyTNFZ3gxEIAkvaWvLVY/9gKIdqBf1hacmeHLBvxYaKFznge31cW64Y4rqyk8G7P34EAD0v/PHW7Mf5wcsUaeCs3gHxCanZCF9iT6ls6l0eh+040=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727552615; c=relaxed/simple;
	bh=jVqIuDAf7y6JbCAI9T29G4pUHO61rDH3tVFIIaKv51o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O+i6sucYqAG/D2kJD3/tBvFhE9j7deKQVj6q+jisQbg9mJu2spT7BHqIGTPE3hScmvDGyQwgrCtJPJprmq4K7LQCSlSPCieMbrjHLH6dVstqpD4Xe1K5NCN92g+5npWIFXQqwV1cXSklcPpdTJ/lDjL1FtAy0pT5cslwdLa/LPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLuvYpax; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLuvYpax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727552613; x=1759088613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jVqIuDAf7y6JbCAI9T29G4pUHO61rDH3tVFIIaKv51o=;
  b=bLuvYpax2vy6J9RXKrQKmqWFBu8Zl4V3ubEA92NyFLi2BwwVMq9Cek/B
   bWkx0wDQUyosp9pPaOtaOmcmqXR+x2i5c8FKr7isJryniMGEefN7H70dg
   LHwIyyT3dHgj6l/l72bObSzz1ekpAq+TJDmvOwjUdqyQ5M+hLG+dCJg+z
   Snx8qcf1zlCrKII977JNW4SoopJjpKdPqUUhrgxY+joPjI6YAl2i/d1XK
   3SRzjliKS2f3m1p5Oo6cXS664ltFUcw26w4LiXyyKHShgBYz7GqOLOTTa
   Wep7mrNREIIrncyPhopG7CW2Vg+/Srqiazwj70GyDW3aOyeFnDeQuRhGK
   A==;
X-CSE-ConnectionGUID: y9+f9YVZT5+pp4TR/zbWFQ==
X-CSE-MsgGUID: ki/rDvw9QdGtoyp2bXPG2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26551407"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26551407"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 12:43:33 -0700
X-CSE-ConnectionGUID: pM7zR3PZR2O+2PcrAWbrqA==
X-CSE-MsgGUID: yIGs/NrMROekA2GHnTDMXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="77691319"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Sep 2024 12:43:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sudLl-000NZ5-0A;
	Sat, 28 Sep 2024 19:43:29 +0000
Date: Sun, 29 Sep 2024 03:42:45 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 169/16788]
 sound/soc/codecs/pcm512x.c:1594:7: warning: unused variable 'clk_name'
Message-ID: <202409290318.5h8TieXH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: ffedc20aa7341e69b85228c9fd0327348159ee94 [169/16788] MLK-25015: sound: soc: codecs: pcm512x: set input sclk
config: i386-buildonly-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290318.5h8TieXH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290318.5h8TieXH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290318.5h8TieXH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/pcm512x.c:1594:7: warning: unused variable 'clk_name' [-Wunused-variable]
    1594 |         char clk_name[8];
         |              ^~~~~~~~
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
