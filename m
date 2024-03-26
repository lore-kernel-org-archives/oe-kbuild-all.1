Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8284D13D24D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 19:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711482002; cv=none; b=p/7shWEdqb9WDoPhE5QYbkeYm6eX4sIUunsnihiRAm7uLgwE8GZwP8WNLv3hBb6r4mTZU3zf+u/Km8auZ7kCw4nliFZMNDz4osvXOKW8ZOMUtzgiGb28ZLXsZlOL32ETba3NYv0tP5Nd4ykXBfJG50lrxXDshcbJwENOY/ax1DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711482002; c=relaxed/simple;
	bh=BqNuBsHT8JIryqATkPHjf51VB9gwaSjiIeMz9mrstoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OApdDT0NBfVa5w0M2H/VnnnkG66EnPxmgQEqPi6WVtIOLQ8BqBjDPNSbFVQZ8T5YwjsonyQCAOywGlNbpCnlw/K3dU/yUK9B7DdAeq1EqL8v6jbw+7egHb3MP9IAZ6N16h72NKv2bQUzHcTrh4R+6sQKFuMDXygz826Bq1wj1+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8Bp3Mc7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8Bp3Mc7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711481999; x=1743017999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BqNuBsHT8JIryqATkPHjf51VB9gwaSjiIeMz9mrstoU=;
  b=H8Bp3Mc70VOJdvm/aHs6S+x6U0/CxB2bkOjoK90ylgu1Aw1mWlQPxhGW
   w5mFZi8G9IKkskSXE6vg/VNBGXZ36uQZEWbFZQs266ppunXNx4ej9UPU/
   krq4MECCKjZbmRj1+38VSnjlR50HsjxuUPZAZEonMttRtqzaCW91PuqvU
   X8AaSHk+NrVm9+0dChRERLyCnfGH6Qr+YVVRu4vw41nfRlBcSN6VZG3on
   9SESQHehOnTa4IYQqO7hRIyFbRh3pWHWjIo9LhmxpaJPrBUuOAAOwl9qT
   Ln0yqqEU8o+yh/g/olMnoSDOpw3n6XmAD940E5qwpkfBEQZf7eKijXswB
   g==;
X-CSE-ConnectionGUID: h7yhMSseT9Gw+UxrlPA4tw==
X-CSE-MsgGUID: WoH0S7A7SgeCCWCYBVJeIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17101834"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17101834"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 12:39:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20551607"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Mar 2024 12:39:58 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpCeK-0000MG-1H;
	Tue, 26 Mar 2024 19:39:56 +0000
Date: Wed, 27 Mar 2024 03:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1141/1756] drivers/pwm/pwm-stm32.c:662:15: error:
 implicit declaration of function 'devm_clk_rate_exclusive_get'; did you mean
 'clk_rate_exclusive_get'?
Message-ID: <202403270305.ydvX9xq1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   084c8e315db34b59d38d06e684b1a0dd07d30287
commit: 50d05a09e8474fa4768ffd39cce6af7f73cf003b [1141/1756] pwm: stm32: Fix for settings using period > UINT32_MAX
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20240327/202403270305.ydvX9xq1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403270305.ydvX9xq1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403270305.ydvX9xq1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pwm/pwm-stm32.c: In function 'stm32_pwm_probe':
>> drivers/pwm/pwm-stm32.c:662:15: error: implicit declaration of function 'devm_clk_rate_exclusive_get'; did you mean 'clk_rate_exclusive_get'? [-Werror=implicit-function-declaration]
     662 |         ret = devm_clk_rate_exclusive_get(dev, priv->clk);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               clk_rate_exclusive_get
   cc1: some warnings being treated as errors


vim +662 drivers/pwm/pwm-stm32.c

   627	
   628	static int stm32_pwm_probe(struct platform_device *pdev)
   629	{
   630		struct device *dev = &pdev->dev;
   631		struct device_node *np = dev->of_node;
   632		struct stm32_timers *ddata = dev_get_drvdata(pdev->dev.parent);
   633		struct pwm_chip *chip;
   634		struct stm32_pwm *priv;
   635		unsigned int npwm, num_enabled;
   636		unsigned int i;
   637		int ret;
   638	
   639		npwm = stm32_pwm_detect_channels(ddata->regmap, &num_enabled);
   640	
   641		chip = devm_pwmchip_alloc(dev, npwm, sizeof(*priv));
   642		if (IS_ERR(chip))
   643			return PTR_ERR(chip);
   644		priv = to_stm32_pwm_dev(chip);
   645	
   646		mutex_init(&priv->lock);
   647		priv->regmap = ddata->regmap;
   648		priv->clk = ddata->clk;
   649		priv->max_arr = ddata->max_arr;
   650	
   651		if (!priv->regmap || !priv->clk)
   652			return dev_err_probe(dev, -EINVAL, "Failed to get %s\n",
   653					     priv->regmap ? "clk" : "regmap");
   654	
   655		ret = stm32_pwm_probe_breakinputs(priv, np);
   656		if (ret)
   657			return dev_err_probe(dev, ret,
   658					     "Failed to configure breakinputs\n");
   659	
   660		stm32_pwm_detect_complementary(priv);
   661	
 > 662		ret = devm_clk_rate_exclusive_get(dev, priv->clk);
   663		if (ret)
   664			return dev_err_probe(dev, ret, "Failed to lock clock\n");
   665	
   666		/*
   667		 * With the clk running with not more than 1 GHz the calculations in
   668		 * .apply() won't overflow.
   669		 */
   670		if (clk_get_rate(priv->clk) > 1000000000)
   671			return dev_err_probe(dev, -EINVAL, "Failed to lock clock\n");
   672	
   673		chip->ops = &stm32pwm_ops;
   674	
   675		/* Initialize clock refcount to number of enabled PWM channels. */
   676		for (i = 0; i < num_enabled; i++)
   677			clk_enable(priv->clk);
   678	
   679		ret = devm_pwmchip_add(dev, chip);
   680		if (ret < 0)
   681			return dev_err_probe(dev, ret,
   682					     "Failed to register pwmchip\n");
   683	
   684		platform_set_drvdata(pdev, chip);
   685	
   686		return 0;
   687	}
   688	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
