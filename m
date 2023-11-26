Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEAF63D9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XiMsdsTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701002515; x=1732538515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7163plrftMrSgXn0Ybgt5qmGOpX+1EPpLKKP2Qsd6ic=;
  b=XiMsdsTh/hUHkCtq0BWrcGTisPVw+NeNVrOYscZ91/sG+PIoeCBcEdPq
   NFdk2DSOPV/SZPL9mUVdC7qPeEVxamehgLioZc7mRtTkCRqa8PRZLYOr6
   X7J2eKc0VTFVtwNvxcRV4t8H4sKV8C6iVygXs1Camo0vO4rD3QwIwVcoE
   6rR94SBa0towJhS4AiylCmwtsQv+gXS5kX8QmgLaDpz2p7brNvL3G5sZK
   bDipUhfLLfaS5M/8V86Qr6Cz0RAyTi7PXnFHnkQE+7JcglgC3t1obpBzY
   cmGoEZ/cKaVL7BXg6p13CE7EB4I6F7rPf84cRfl6bKX6glBj446GdkEfT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="11260354"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="11260354"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 04:41:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="1099514252"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="1099514252"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Nov 2023 04:41:52 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7ESL-0005A4-35;
	Sun, 26 Nov 2023 12:41:49 +0000
Date: Sun, 26 Nov 2023 20:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: Keerthy <j-keerthy@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Apurva Nandan <a-nandan@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 68/128]
 drivers/thermal/k3_j72xx_bandgap.c:407:5: sparse: sparse: symbol
 'k3_thermal_register_cpu_cooling' was not declared. Should it be static?
Message-ID: <202311261932.WDaKOOQs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   3a4f51391fe1d39254fed39393815b2879e44d73
commit: 38a145da1625c46c90e453d6e28537e6f97e2720 [68/128] thermal: k3_j72xx_bandgap: Add cooling device support
config: arm-randconfig-r132-20231126 (https://download.01.org/0day-ci/archive/20231126/202311261932.WDaKOOQs-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311261932.WDaKOOQs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311261932.WDaKOOQs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thermal/k3_j72xx_bandgap.c:407:5: sparse: sparse: symbol 'k3_thermal_register_cpu_cooling' was not declared. Should it be static?

vim +/k3_thermal_register_cpu_cooling +407 drivers/thermal/k3_j72xx_bandgap.c

   406	
 > 407	int k3_thermal_register_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
   408	{
   409		struct k3_thermal_data *data;
   410		struct device_node *np = bgp->dev->of_node;
   411	
   412		/*
   413		 * We are assuming here that if one deploys the zone
   414		 * using DT, then it must be aware that the cooling device
   415		 * loading has to happen via cpufreq driver.
   416		 */
   417		if (of_find_property(np, "#thermal-sensor-cells", NULL))
   418			return 0;
   419	
   420		data = bgp->ts_data[id];
   421		if (!data)
   422			return -EINVAL;
   423	
   424		data->policy = cpufreq_cpu_get(0);
   425		if (!data->policy) {
   426			pr_debug("%s: CPUFreq policy not found\n", __func__);
   427			return -EPROBE_DEFER;
   428		}
   429	
   430		/* Register cooling device */
   431		data->cool_dev = cpufreq_cooling_register(data->policy);
   432		if (IS_ERR(data->cool_dev)) {
   433			int ret = PTR_ERR(data->cool_dev);
   434	
   435			dev_err(bgp->dev, "Failed to register cpu cooling device %d\n",
   436				ret);
   437			cpufreq_cpu_put(data->policy);
   438	
   439			return ret;
   440		}
   441	
   442		data->mode = THERMAL_DEVICE_ENABLED;
   443	
   444		INIT_WORK(&data->thermal_wq, k3_thermal_work);
   445	
   446		return 0;
   447	}
   448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
