Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C4E1C36
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 02:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721270053; cv=none; b=ihT9o2v6AYP2no2UedqPp4OE4BpZYoHv273pKBSFEB2impcGMNOfq41vREx3tX8g7jmv/aiEi+plqtezlwZ8BRRc82pXma5zOIDomPzgpGiLuFw50w8Wvk/HqZnhZn5p5LvZ7KEfuMUC6Qe+B6YrYUxF97tUAeLBpffxNb23LJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721270053; c=relaxed/simple;
	bh=gXDiO56efPY3yjfnFIPOdmAJbsmLkAWb8n1GYdUL3FM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=InTtsy8oy1GxdiQrKYeQEoG9skCeYEc94xJLdtd/n7PoFf2xCaI6Gz+sEb0LGH6gYmdrzlOstjw1tgD1nO6qaThwlxZkDQPE/sTknGY3a1psDd9lR5+XGP3Cp6vFylnvOdUISbEKFDPrsNMZXekP6RzyB38Q0WQ+YGIs0nGh1Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTcjbfqC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTcjbfqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721270050; x=1752806050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gXDiO56efPY3yjfnFIPOdmAJbsmLkAWb8n1GYdUL3FM=;
  b=fTcjbfqCHqWY6r7ydPy6VLXqIj1/qxt5GjgQcSI+aIkWZQ5fKgdOB17z
   dc1zmBQj/B2Ty6pUPo38dPlMFeZIOrHxBv12tkTg1Lik0tAVCcqw9aTtQ
   SvrkpXUKaoLLSEaI+ZLX61zoKYTa1BatsJJNcJVt6a3R/ofygSWtvlLoR
   3rcQJSgLCMEFguYlwdn/KlzN/9/5r4S+PTumk6y2y/HOKDn8S+ZdUXoAu
   hyvMVCK/ypvpVhFZMX4AQyTOrkUJCSRGEFr3TnkDUPeN3TrbkooEVBvIl
   1yi0x9NtTc5+A2gzGyWYP8p7VFVzteOZ4lPkdtdVYlnzzFvDnDHJwFmXr
   w==;
X-CSE-ConnectionGUID: QOIe/dA7TfyUq8Yh/pL08Q==
X-CSE-MsgGUID: SVRi8BjAQ66p1BO2wtigKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18923782"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="18923782"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 19:34:10 -0700
X-CSE-ConnectionGUID: wyP+6ze/RhC4NsFShfFKZg==
X-CSE-MsgGUID: SCJhe26wSoaur0et1Rl18A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="50554852"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jul 2024 19:34:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUGy6-000gsg-1l;
	Thu, 18 Jul 2024 02:34:06 +0000
Date: Thu, 18 Jul 2024 10:33:38 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.10.y 27/86]
 drivers/i2c/busses/i2c-qcom-cci.c:526:23: warning: variable 'cci_clk_rate'
 set but not used
Message-ID: <202407181039.f3KVi6yL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.10.y
head:   22e716620cdb9912603edf51c8bee9f4fa5bb4a4
commit: b969412bcd58b2703d6b9cfaaf434407ab735e3f [27/86] i2c: qcom-cci: Stop complaining about DT set clock rate
config: i386-buildonly-randconfig-001-20240718 (https://download.01.org/0day-ci/archive/20240718/202407181039.f3KVi6yL-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407181039.f3KVi6yL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181039.f3KVi6yL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-qcom-cci.c: In function 'cci_probe':
>> drivers/i2c/busses/i2c-qcom-cci.c:526:23: warning: variable 'cci_clk_rate' set but not used [-Wunused-but-set-variable]
     526 |         unsigned long cci_clk_rate = 0;
         |                       ^~~~~~~~~~~~


vim +/cci_clk_rate +526 drivers/i2c/busses/i2c-qcom-cci.c

e517526195de40 Loic Poulain        2020-04-07  522  
e517526195de40 Loic Poulain        2020-04-07  523  static int cci_probe(struct platform_device *pdev)
e517526195de40 Loic Poulain        2020-04-07  524  {
e517526195de40 Loic Poulain        2020-04-07  525  	struct device *dev = &pdev->dev;
e517526195de40 Loic Poulain        2020-04-07 @526  	unsigned long cci_clk_rate = 0;
e517526195de40 Loic Poulain        2020-04-07  527  	struct device_node *child;
e517526195de40 Loic Poulain        2020-04-07  528  	struct resource *r;
e517526195de40 Loic Poulain        2020-04-07  529  	struct cci *cci;
e517526195de40 Loic Poulain        2020-04-07  530  	int ret, i;
e517526195de40 Loic Poulain        2020-04-07  531  	u32 val;
e517526195de40 Loic Poulain        2020-04-07  532  
e517526195de40 Loic Poulain        2020-04-07  533  	cci = devm_kzalloc(dev, sizeof(*cci), GFP_KERNEL);
e517526195de40 Loic Poulain        2020-04-07  534  	if (!cci)
e517526195de40 Loic Poulain        2020-04-07  535  		return -ENOMEM;
e517526195de40 Loic Poulain        2020-04-07  536  
e517526195de40 Loic Poulain        2020-04-07  537  	cci->dev = dev;
e517526195de40 Loic Poulain        2020-04-07  538  	platform_set_drvdata(pdev, cci);
e517526195de40 Loic Poulain        2020-04-07  539  	cci->data = device_get_match_data(dev);
e517526195de40 Loic Poulain        2020-04-07  540  	if (!cci->data)
e517526195de40 Loic Poulain        2020-04-07  541  		return -ENOENT;
e517526195de40 Loic Poulain        2020-04-07  542  
e517526195de40 Loic Poulain        2020-04-07  543  	for_each_available_child_of_node(dev->of_node, child) {
f24bc86adec6e2 Vladimir Zapolskiy  2022-06-02  544  		struct cci_master *master;
e517526195de40 Loic Poulain        2020-04-07  545  		u32 idx;
e517526195de40 Loic Poulain        2020-04-07  546  
e517526195de40 Loic Poulain        2020-04-07  547  		ret = of_property_read_u32(child, "reg", &idx);
e517526195de40 Loic Poulain        2020-04-07  548  		if (ret) {
e517526195de40 Loic Poulain        2020-04-07  549  			dev_err(dev, "%pOF invalid 'reg' property", child);
e517526195de40 Loic Poulain        2020-04-07  550  			continue;
e517526195de40 Loic Poulain        2020-04-07  551  		}
e517526195de40 Loic Poulain        2020-04-07  552  
e517526195de40 Loic Poulain        2020-04-07  553  		if (idx >= cci->data->num_masters) {
e517526195de40 Loic Poulain        2020-04-07  554  			dev_err(dev, "%pOF invalid 'reg' value: %u (max is %u)",
e517526195de40 Loic Poulain        2020-04-07  555  				child, idx, cci->data->num_masters - 1);
e517526195de40 Loic Poulain        2020-04-07  556  			continue;
e517526195de40 Loic Poulain        2020-04-07  557  		}
e517526195de40 Loic Poulain        2020-04-07  558  
f24bc86adec6e2 Vladimir Zapolskiy  2022-06-02  559  		master = &cci->master[idx];
f24bc86adec6e2 Vladimir Zapolskiy  2022-06-02  560  		master->adap.quirks = &cci->data->quirks;
f24bc86adec6e2 Vladimir Zapolskiy  2022-06-02  561  		master->adap.algo = &cci_algo;
f24bc86adec6e2 Vladimir Zapolskiy  2022-06-02  562  		master->adap.dev.parent = dev;
f24bc86adec6e2 Vladimir Zapolskiy  2022-06-02  563  		master->adap.dev.of_node = of_node_get(child);
f24bc86adec6e2 Vladimir Zapolskiy  2022-06-02  564  		master->master = idx;
f24bc86adec6e2 Vladimir Zapolskiy  2022-06-02  565  		master->cci = cci;
e517526195de40 Loic Poulain        2020-04-07  566  
f24bc86adec6e2 Vladimir Zapolskiy  2022-06-02  567  		i2c_set_adapdata(&master->adap, master);
f24bc86adec6e2 Vladimir Zapolskiy  2022-06-02  568  		snprintf(master->adap.name, sizeof(master->adap.name), "Qualcomm-CCI");
e517526195de40 Loic Poulain        2020-04-07  569  
f24bc86adec6e2 Vladimir Zapolskiy  2022-06-02  570  		master->mode = I2C_MODE_STANDARD;
e517526195de40 Loic Poulain        2020-04-07  571  		ret = of_property_read_u32(child, "clock-frequency", &val);
e517526195de40 Loic Poulain        2020-04-07  572  		if (!ret) {
fd6ddaa0f50a1d Andy Shevchenko     2021-03-31  573  			if (val == I2C_MAX_FAST_MODE_FREQ)
f24bc86adec6e2 Vladimir Zapolskiy  2022-06-02  574  				master->mode = I2C_MODE_FAST;
fd6ddaa0f50a1d Andy Shevchenko     2021-03-31  575  			else if (val == I2C_MAX_FAST_MODE_PLUS_FREQ)
f24bc86adec6e2 Vladimir Zapolskiy  2022-06-02  576  				master->mode = I2C_MODE_FAST_PLUS;
e517526195de40 Loic Poulain        2020-04-07  577  		}
e517526195de40 Loic Poulain        2020-04-07  578  
f24bc86adec6e2 Vladimir Zapolskiy  2022-06-02  579  		init_completion(&master->irq_complete);
e517526195de40 Loic Poulain        2020-04-07  580  	}
e517526195de40 Loic Poulain        2020-04-07  581  
e517526195de40 Loic Poulain        2020-04-07  582  	/* Memory */
e517526195de40 Loic Poulain        2020-04-07  583  
fdbd69549be876 Md Sadre Alam       2023-03-06  584  	cci->base = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
e517526195de40 Loic Poulain        2020-04-07  585  	if (IS_ERR(cci->base))
e517526195de40 Loic Poulain        2020-04-07  586  		return PTR_ERR(cci->base);
e517526195de40 Loic Poulain        2020-04-07  587  
e517526195de40 Loic Poulain        2020-04-07  588  	/* Clocks */
e517526195de40 Loic Poulain        2020-04-07  589  
e517526195de40 Loic Poulain        2020-04-07  590  	ret = devm_clk_bulk_get_all(dev, &cci->clocks);
7f2e65a8f546a0 Harshit Mogalapalli 2023-08-23  591  	if (ret < 0)
605efbf4381385 Liao Chang          2023-08-08  592  		return dev_err_probe(dev, ret, "failed to get clocks\n");
7f2e65a8f546a0 Harshit Mogalapalli 2023-08-23  593  	else if (!ret)
7f2e65a8f546a0 Harshit Mogalapalli 2023-08-23  594  		return dev_err_probe(dev, -EINVAL, "not enough clocks in DT\n");
e517526195de40 Loic Poulain        2020-04-07  595  	cci->nclocks = ret;
e517526195de40 Loic Poulain        2020-04-07  596  
e517526195de40 Loic Poulain        2020-04-07  597  	/* Retrieve CCI clock rate */
e517526195de40 Loic Poulain        2020-04-07  598  	for (i = 0; i < cci->nclocks; i++) {
e517526195de40 Loic Poulain        2020-04-07  599  		if (!strcmp(cci->clocks[i].id, "cci")) {
e517526195de40 Loic Poulain        2020-04-07  600  			cci_clk_rate = clk_get_rate(cci->clocks[i].clk);
e517526195de40 Loic Poulain        2020-04-07  601  			break;
e517526195de40 Loic Poulain        2020-04-07  602  		}
e517526195de40 Loic Poulain        2020-04-07  603  	}
e517526195de40 Loic Poulain        2020-04-07  604  
e517526195de40 Loic Poulain        2020-04-07  605  	ret = cci_enable_clocks(cci);
e517526195de40 Loic Poulain        2020-04-07  606  	if (ret < 0)
e517526195de40 Loic Poulain        2020-04-07  607  		return ret;
e517526195de40 Loic Poulain        2020-04-07  608  
e517526195de40 Loic Poulain        2020-04-07  609  	/* Interrupt */
e517526195de40 Loic Poulain        2020-04-07  610  
e517526195de40 Loic Poulain        2020-04-07  611  	ret = platform_get_irq(pdev, 0);
e517526195de40 Loic Poulain        2020-04-07  612  	if (ret < 0)
e517526195de40 Loic Poulain        2020-04-07  613  		goto disable_clocks;
e517526195de40 Loic Poulain        2020-04-07  614  	cci->irq = ret;
e517526195de40 Loic Poulain        2020-04-07  615  
e517526195de40 Loic Poulain        2020-04-07  616  	ret = devm_request_irq(dev, cci->irq, cci_isr, 0, dev_name(dev), cci);
e517526195de40 Loic Poulain        2020-04-07  617  	if (ret < 0) {
e517526195de40 Loic Poulain        2020-04-07  618  		dev_err(dev, "request_irq failed, ret: %d\n", ret);
e517526195de40 Loic Poulain        2020-04-07  619  		goto disable_clocks;
e517526195de40 Loic Poulain        2020-04-07  620  	}
e517526195de40 Loic Poulain        2020-04-07  621  
e517526195de40 Loic Poulain        2020-04-07  622  	val = readl(cci->base + CCI_HW_VERSION);
e517526195de40 Loic Poulain        2020-04-07  623  	dev_dbg(dev, "CCI HW version = 0x%08x", val);
e517526195de40 Loic Poulain        2020-04-07  624  
e517526195de40 Loic Poulain        2020-04-07  625  	ret = cci_reset(cci);
e517526195de40 Loic Poulain        2020-04-07  626  	if (ret < 0)
e517526195de40 Loic Poulain        2020-04-07  627  		goto error;
e517526195de40 Loic Poulain        2020-04-07  628  
e517526195de40 Loic Poulain        2020-04-07  629  	ret = cci_init(cci);
e517526195de40 Loic Poulain        2020-04-07  630  	if (ret < 0)
e517526195de40 Loic Poulain        2020-04-07  631  		goto error;
e517526195de40 Loic Poulain        2020-04-07  632  
61775d54d674ff Bryan O'Donoghue    2022-10-18  633  	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
61775d54d674ff Bryan O'Donoghue    2022-10-18  634  	pm_runtime_use_autosuspend(dev);
61775d54d674ff Bryan O'Donoghue    2022-10-18  635  	pm_runtime_set_active(dev);
61775d54d674ff Bryan O'Donoghue    2022-10-18  636  	pm_runtime_enable(dev);
61775d54d674ff Bryan O'Donoghue    2022-10-18  637  
e517526195de40 Loic Poulain        2020-04-07  638  	for (i = 0; i < cci->data->num_masters; i++) {
e517526195de40 Loic Poulain        2020-04-07  639  		if (!cci->master[i].cci)
e517526195de40 Loic Poulain        2020-04-07  640  			continue;
e517526195de40 Loic Poulain        2020-04-07  641  
e517526195de40 Loic Poulain        2020-04-07  642  		ret = i2c_add_adapter(&cci->master[i].adap);
02a4a69667a2ad Vladimir Zapolskiy  2022-02-03  643  		if (ret < 0) {
02a4a69667a2ad Vladimir Zapolskiy  2022-02-03  644  			of_node_put(cci->master[i].adap.dev.of_node);
e517526195de40 Loic Poulain        2020-04-07  645  			goto error_i2c;
e517526195de40 Loic Poulain        2020-04-07  646  		}
02a4a69667a2ad Vladimir Zapolskiy  2022-02-03  647  	}
e517526195de40 Loic Poulain        2020-04-07  648  
e517526195de40 Loic Poulain        2020-04-07  649  	return 0;
e517526195de40 Loic Poulain        2020-04-07  650  
e517526195de40 Loic Poulain        2020-04-07  651  error_i2c:
61775d54d674ff Bryan O'Donoghue    2022-10-18  652  	pm_runtime_disable(dev);
61775d54d674ff Bryan O'Donoghue    2022-10-18  653  	pm_runtime_dont_use_autosuspend(dev);
61775d54d674ff Bryan O'Donoghue    2022-10-18  654  
a0d48505a1d68e Vladimir Zapolskiy  2022-02-03  655  	for (--i ; i >= 0; i--) {
02a4a69667a2ad Vladimir Zapolskiy  2022-02-03  656  		if (cci->master[i].cci) {
e517526195de40 Loic Poulain        2020-04-07  657  			i2c_del_adapter(&cci->master[i].adap);
02a4a69667a2ad Vladimir Zapolskiy  2022-02-03  658  			of_node_put(cci->master[i].adap.dev.of_node);
02a4a69667a2ad Vladimir Zapolskiy  2022-02-03  659  		}
e517526195de40 Loic Poulain        2020-04-07  660  	}
e517526195de40 Loic Poulain        2020-04-07  661  error:
e517526195de40 Loic Poulain        2020-04-07  662  	disable_irq(cci->irq);
e517526195de40 Loic Poulain        2020-04-07  663  disable_clocks:
e517526195de40 Loic Poulain        2020-04-07  664  	cci_disable_clocks(cci);
e517526195de40 Loic Poulain        2020-04-07  665  
e517526195de40 Loic Poulain        2020-04-07  666  	return ret;
e517526195de40 Loic Poulain        2020-04-07  667  }
e517526195de40 Loic Poulain        2020-04-07  668  

:::::: The code at line 526 was first introduced by commit
:::::: e517526195de400158e05a08764d1fb61d579105 i2c: Add Qualcomm CCI I2C driver

:::::: TO: Loic Poulain <loic.poulain@linaro.org>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
