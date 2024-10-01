Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3451CCB37
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 18:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727808039; cv=none; b=k9qzHYaACRPgARHqi75mRy5yzJslFJKXYlWL0LZ+Fdt54+TLSaasJuHWR5f0m0d3SuN2pTZ22f4qFA0wYJ8uyDCS6ERiYFVmX7Pv+aeIFR/J649MjP98ulhSMO3sH0QpM0DevuvdpteVIM1/o8yA7syZsm4VIEx70w1donhF0wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727808039; c=relaxed/simple;
	bh=qmqXwBeyPek5PjR1Et6TH7yYu8tcjjDmVUja3ne6aRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MwMTryGM2m1YzETLWJb6cT9VAklV+zHyypV2WdWkEOoZ3X3e7nx1Ev1qVhBe97I3UwbrBvOuBS3zLZS+pMcoB6rUhlN+dZ/O1uC6EinrYMrnHRSWY6/jvdqTtTHvfLB2/6YC/Z9nSggQaUcUcPXGG9NryVED3MvCMqnlp+anZ4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzeWBph1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzeWBph1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727808037; x=1759344037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qmqXwBeyPek5PjR1Et6TH7yYu8tcjjDmVUja3ne6aRk=;
  b=dzeWBph1BOQX8Zxv3vY8UThh8SZQYhNYxISyBaCu6Ww91SsnyqejGshx
   u4QUzC+ynRgkrGXj7HE3twswe+eL7G7b5nrvbcGmciZB8Qv3kGyuwbBqI
   dT82IATZpkv5qULoUPhVtdrlayvOpe3BOeln1jXGlcE2M/AI8v2VHJDRR
   QqHKsIENEiFZXQqQ7n04r662miInQGNCgud7xI8FbJF4t11gy6LcSfpJU
   aPpObOMXMXQglHDqWZLCynfzWwxzvDjQ2OEninbOf3ZnTJyKIt26VILzk
   RslmOuUbSpsmKvsav9xYkRs/EmPL+GqsQ1zHvfj/LfTyWQYwJFojwkLi/
   A==;
X-CSE-ConnectionGUID: zrGtB5OQTbu6WoANq8tZaw==
X-CSE-MsgGUID: VUFdDCgxRgG3UpSqbzIvHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27092760"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="27092760"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 11:40:36 -0700
X-CSE-ConnectionGUID: Z1JnOKDrSzmho8XawlH/ow==
X-CSE-MsgGUID: KYLdGLnMREGkjbsfcnOT0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="104585458"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Oct 2024 11:40:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svhnU-000R3t-1f;
	Tue, 01 Oct 2024 18:40:32 +0000
Date: Wed, 2 Oct 2024 02:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:wdt/no-register-err 8/11] drivers/watchdog/rza_wdt.c:172:13:
 warning: unused variable 'ret'
Message-ID: <202410020232.5Iyvuuku-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git wdt/no-register-err
head:   06a01128e32e5210e49e9087e46fb67b0d9b8fef
commit: 7f3a9d0a8f9131103c2a0a3c92bff3acde93be1b [8/11] watchdog: rza_wdt: don't print out if registering watchdog fails
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241002/202410020232.5Iyvuuku-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020232.5Iyvuuku-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020232.5Iyvuuku-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/watchdog/rza_wdt.c: In function 'rza_wdt_probe':
>> drivers/watchdog/rza_wdt.c:172:13: warning: unused variable 'ret' [-Wunused-variable]
     172 |         int ret;
         |             ^~~


vim +/ret +172 drivers/watchdog/rza_wdt.c

aea24187f65e8a Chris Brandt       2017-03-04  166  
aea24187f65e8a Chris Brandt       2017-03-04  167  static int rza_wdt_probe(struct platform_device *pdev)
aea24187f65e8a Chris Brandt       2017-03-04  168  {
2361ac52898ef0 Guenter Roeck      2019-04-09  169  	struct device *dev = &pdev->dev;
aea24187f65e8a Chris Brandt       2017-03-04  170  	struct rza_wdt *priv;
aea24187f65e8a Chris Brandt       2017-03-04  171  	unsigned long rate;
aea24187f65e8a Chris Brandt       2017-03-04 @172  	int ret;
aea24187f65e8a Chris Brandt       2017-03-04  173  
2361ac52898ef0 Guenter Roeck      2019-04-09  174  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
aea24187f65e8a Chris Brandt       2017-03-04  175  	if (!priv)
aea24187f65e8a Chris Brandt       2017-03-04  176  		return -ENOMEM;
aea24187f65e8a Chris Brandt       2017-03-04  177  
0f0a6a285ec0c7 Guenter Roeck      2019-04-02  178  	priv->base = devm_platform_ioremap_resource(pdev, 0);
aea24187f65e8a Chris Brandt       2017-03-04  179  	if (IS_ERR(priv->base))
aea24187f65e8a Chris Brandt       2017-03-04  180  		return PTR_ERR(priv->base);
aea24187f65e8a Chris Brandt       2017-03-04  181  
2361ac52898ef0 Guenter Roeck      2019-04-09  182  	priv->clk = devm_clk_get(dev, NULL);
aea24187f65e8a Chris Brandt       2017-03-04  183  	if (IS_ERR(priv->clk))
aea24187f65e8a Chris Brandt       2017-03-04  184  		return PTR_ERR(priv->clk);
aea24187f65e8a Chris Brandt       2017-03-04  185  
aea24187f65e8a Chris Brandt       2017-03-04  186  	rate = clk_get_rate(priv->clk);
aea24187f65e8a Chris Brandt       2017-03-04  187  	if (rate < 16384) {
2361ac52898ef0 Guenter Roeck      2019-04-09  188  		dev_err(dev, "invalid clock rate (%ld)\n", rate);
aea24187f65e8a Chris Brandt       2017-03-04  189  		return -ENOENT;
aea24187f65e8a Chris Brandt       2017-03-04  190  	}
aea24187f65e8a Chris Brandt       2017-03-04  191  
414a9bf8285b8d Geert Uytterhoeven 2021-09-15  192  	priv->wdev.info = &rza_wdt_ident;
414a9bf8285b8d Geert Uytterhoeven 2021-09-15  193  	priv->wdev.ops = &rza_wdt_ops;
2361ac52898ef0 Guenter Roeck      2019-04-09  194  	priv->wdev.parent = dev;
aea24187f65e8a Chris Brandt       2017-03-04  195  
2361ac52898ef0 Guenter Roeck      2019-04-09  196  	priv->cks = (u8)(uintptr_t) of_device_get_match_data(dev);
8e89130632c25f Chris Brandt       2018-09-24  197  	if (priv->cks == CKS_4BIT) {
8e89130632c25f Chris Brandt       2018-09-24  198  		/* Assume slowest clock rate possible (CKS=0xF) */
8e89130632c25f Chris Brandt       2018-09-24  199  		priv->wdev.max_timeout = (DIVIDER_4BIT * U8_MAX) / rate;
8e89130632c25f Chris Brandt       2018-09-24  200  
8e89130632c25f Chris Brandt       2018-09-24  201  	} else if (priv->cks == CKS_3BIT) {
8e89130632c25f Chris Brandt       2018-09-24  202  		/* Assume slowest clock rate possible (CKS=7) */
8e89130632c25f Chris Brandt       2018-09-24  203  		rate /= DIVIDER_3BIT;
8e89130632c25f Chris Brandt       2018-09-24  204  
aea24187f65e8a Chris Brandt       2017-03-04  205  		/*
8e89130632c25f Chris Brandt       2018-09-24  206  		 * Since the max possible timeout of our 8-bit count
8e89130632c25f Chris Brandt       2018-09-24  207  		 * register is less than a second, we must use
8e89130632c25f Chris Brandt       2018-09-24  208  		 * max_hw_heartbeat_ms.
aea24187f65e8a Chris Brandt       2017-03-04  209  		 */
aea24187f65e8a Chris Brandt       2017-03-04  210  		priv->wdev.max_hw_heartbeat_ms = (1000 * U8_MAX) / rate;
2361ac52898ef0 Guenter Roeck      2019-04-09  211  		dev_dbg(dev, "max hw timeout of %dms\n",
aea24187f65e8a Chris Brandt       2017-03-04  212  			priv->wdev.max_hw_heartbeat_ms);
8e89130632c25f Chris Brandt       2018-09-24  213  	}
aea24187f65e8a Chris Brandt       2017-03-04  214  
aea24187f65e8a Chris Brandt       2017-03-04  215  	priv->wdev.min_timeout = 1;
aea24187f65e8a Chris Brandt       2017-03-04  216  	priv->wdev.timeout = DEFAULT_TIMEOUT;
aea24187f65e8a Chris Brandt       2017-03-04  217  
2361ac52898ef0 Guenter Roeck      2019-04-09  218  	watchdog_init_timeout(&priv->wdev, 0, dev);
aea24187f65e8a Chris Brandt       2017-03-04  219  	watchdog_set_drvdata(&priv->wdev, priv);
aea24187f65e8a Chris Brandt       2017-03-04  220  
7f3a9d0a8f9131 Wolfram Sang       2024-10-01  221  	return devm_watchdog_register_device(dev, &priv->wdev);
aea24187f65e8a Chris Brandt       2017-03-04  222  }
aea24187f65e8a Chris Brandt       2017-03-04  223  

:::::: The code at line 172 was first introduced by commit
:::::: aea24187f65e8adb00b2be949cd809fcb2aa241c watchdog: add rza_wdt driver

:::::: TO: Chris Brandt <chris.brandt@renesas.com>
:::::: CC: Wim Van Sebroeck <wim@iguana.be>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
