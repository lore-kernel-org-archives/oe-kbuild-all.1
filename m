Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC88191494
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 22:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736031277; cv=none; b=OanhM0j2KPwxyswBGUosnnVUEh/9OUUgJZOi+hRncTkc+e6xGcfIqMeTAkBhZu4/Z8XsY6goBKft2xPvvS2cdh79KfacFMvUCqC/LeBXOOwTcVDKv1+PhYdF6VJCGc2s9Bsh7PdoWv4Ckz7LtzUbpCee9zoqfXaafsJ4fKZdtls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736031277; c=relaxed/simple;
	bh=cEe1FpAKBSqrk7SLKYsfFezTlcMyyM+10d3SrquvrIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yt2ZnurX5Y5DHYwDY/pt4qhVIJB0THa/+eanan4Z5YNfsSsAxJU8m7bxLUHgS7e4gQZDknH61QYextH3w++cWYm/9loGdfiwg/Hvwkj/fDRRPiwNv+Xe3/HjlBBSK2INJc9vmiacDcxW3m51qPUbK85x3b5T7o8hyLkSBUukecE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HYYbujpY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYYbujpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736031275; x=1767567275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cEe1FpAKBSqrk7SLKYsfFezTlcMyyM+10d3SrquvrIQ=;
  b=HYYbujpYMdVRRK/4Tw1v62B1gx3JcIw6ZOT7fQu48g1PCfBOFl00cTyc
   rD6ZRspE0qgbNuUCTK5ekRoWtXLNc8x1hK4p0qpuhP+lsyYJPRJBUJ7S5
   x2r7g20QZFv4lAGCCQtQeQ1d4sVW8xMYGXqvmP6U1RsoqUSzyVLukpR6X
   zeZcYSg0GnhhlqtKFos0mMudIm+cD03GzXiKd+DbiGHCuv1+hE1Lgq5a3
   43j09+tx+LCLyl5kC4zX3UuopMEIsz/fY71TpPX7GqhJB4KSkvO7e4E23
   MqjJ5jR+ffEMfzCDrDybhlu9MQ1etNZJSLg+ghQZPggGZ4AdruGtZERK+
   A==;
X-CSE-ConnectionGUID: 8xgxbnwATiy7Xx6EbU5W3g==
X-CSE-MsgGUID: ag9i3K3xTvOa/KkPmiwiJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="58691733"
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="58691733"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 14:54:35 -0800
X-CSE-ConnectionGUID: raYJSmm/TLqcNZ+TlQvW5g==
X-CSE-MsgGUID: WZGbo/RGRg6l6rM8h/Vycw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="132922667"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jan 2025 14:54:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUD2N-000BHr-0g;
	Sat, 04 Jan 2025 22:54:31 +0000
Date: Sun, 5 Jan 2025 06:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: drivers/iio/adc/aspeed_adc.c:232:65: warning: '%s' directive
 argument is null
Message-ID: <202501050616.5XfV11Bf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab75170520d4964f3acf8bb1f91d34cbc650688e
commit: 9223bd0471bb078377a98cfc188dae47448f0456 iio: adc: aspeed: Use model_data to set clk scaler.
date:   3 years, 3 months ago
config: parisc-randconfig-r025-20211224 (https://download.01.org/0day-ci/archive/20250105/202501050616.5XfV11Bf-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501050616.5XfV11Bf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501050616.5XfV11Bf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/adc/aspeed_adc.c: In function 'aspeed_adc_probe':
>> drivers/iio/adc/aspeed_adc.c:232:65: warning: '%s' directive argument is null [-Wformat-truncation=]
     232 |         snprintf(clk_parent_name, ARRAY_SIZE(clk_parent_name), "%s",
         |                                                                 ^~


vim +232 drivers/iio/adc/aspeed_adc.c

   208	
   209	static int aspeed_adc_probe(struct platform_device *pdev)
   210	{
   211		struct iio_dev *indio_dev;
   212		struct aspeed_adc_data *data;
   213		int ret;
   214		u32 adc_engine_control_reg_val;
   215		unsigned long scaler_flags = 0;
   216		char clk_name[32], clk_parent_name[32];
   217	
   218		indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*data));
   219		if (!indio_dev)
   220			return -ENOMEM;
   221	
   222		data = iio_priv(indio_dev);
   223		data->dev = &pdev->dev;
   224		data->model_data = of_device_get_match_data(&pdev->dev);
   225	
   226		data->base = devm_platform_ioremap_resource(pdev, 0);
   227		if (IS_ERR(data->base))
   228			return PTR_ERR(data->base);
   229	
   230		/* Register ADC clock prescaler with source specified by device tree. */
   231		spin_lock_init(&data->clk_lock);
 > 232		snprintf(clk_parent_name, ARRAY_SIZE(clk_parent_name), "%s",
   233			 of_clk_get_parent_name(pdev->dev.of_node, 0));
   234	
   235		if (data->model_data->need_prescaler) {
   236			snprintf(clk_name, ARRAY_SIZE(clk_name), "%s-prescaler",
   237				 data->model_data->model_name);
   238			data->clk_prescaler = clk_hw_register_divider(
   239				&pdev->dev, clk_name, clk_parent_name, 0,
   240				data->base + ASPEED_REG_CLOCK_CONTROL, 17, 15, 0,
   241				&data->clk_lock);
   242			if (IS_ERR(data->clk_prescaler))
   243				return PTR_ERR(data->clk_prescaler);
   244			snprintf(clk_parent_name, ARRAY_SIZE(clk_parent_name),
   245				 clk_name);
   246			scaler_flags = CLK_SET_RATE_PARENT;
   247		}
   248		/*
   249		 * Register ADC clock scaler downstream from the prescaler. Allow rate
   250		 * setting to adjust the prescaler as well.
   251		 */
   252		snprintf(clk_name, ARRAY_SIZE(clk_name), "%s-scaler",
   253			 data->model_data->model_name);
   254		data->clk_scaler = clk_hw_register_divider(
   255			&pdev->dev, clk_name, clk_parent_name, scaler_flags,
   256			data->base + ASPEED_REG_CLOCK_CONTROL, 0,
   257			data->model_data->scaler_bit_width, 0, &data->clk_lock);
   258		if (IS_ERR(data->clk_scaler)) {
   259			ret = PTR_ERR(data->clk_scaler);
   260			goto scaler_error;
   261		}
   262	
   263		data->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
   264		if (IS_ERR(data->rst)) {
   265			dev_err(&pdev->dev,
   266				"invalid or missing reset controller device tree entry");
   267			ret = PTR_ERR(data->rst);
   268			goto reset_error;
   269		}
   270		reset_control_deassert(data->rst);
   271	
   272		ret = aspeed_adc_vref_config(indio_dev);
   273		if (ret)
   274			goto vref_config_error;
   275	
   276		if (data->model_data->wait_init_sequence) {
   277			/* Enable engine in normal mode. */
   278			writel(FIELD_PREP(ASPEED_ADC_OP_MODE,
   279					  ASPEED_ADC_OP_MODE_NORMAL) |
   280				       ASPEED_ADC_ENGINE_ENABLE,
   281			       data->base + ASPEED_REG_ENGINE_CONTROL);
   282	
   283			/* Wait for initial sequence complete. */
   284			ret = readl_poll_timeout(data->base + ASPEED_REG_ENGINE_CONTROL,
   285						 adc_engine_control_reg_val,
   286						 adc_engine_control_reg_val &
   287						 ASPEED_ADC_CTRL_INIT_RDY,
   288						 ASPEED_ADC_INIT_POLLING_TIME,
   289						 ASPEED_ADC_INIT_TIMEOUT);
   290			if (ret)
   291				goto poll_timeout_error;
   292		}
   293	
   294		/* Start all channels in normal mode. */
   295		ret = clk_prepare_enable(data->clk_scaler->clk);
   296		if (ret)
   297			goto clk_enable_error;
   298	
   299		adc_engine_control_reg_val =
   300			ASPEED_ADC_CTRL_CHANNEL |
   301			FIELD_PREP(ASPEED_ADC_OP_MODE, ASPEED_ADC_OP_MODE_NORMAL) |
   302			ASPEED_ADC_ENGINE_ENABLE;
   303		writel(adc_engine_control_reg_val,
   304		       data->base + ASPEED_REG_ENGINE_CONTROL);
   305	
   306		indio_dev->name = data->model_data->model_name;
   307		indio_dev->info = &aspeed_adc_iio_info;
   308		indio_dev->modes = INDIO_DIRECT_MODE;
   309		indio_dev->channels = aspeed_adc_iio_channels;
   310		indio_dev->num_channels = data->model_data->num_channels;
   311	
   312		ret = iio_device_register(indio_dev);
   313		if (ret)
   314			goto iio_register_error;
   315	
   316		return 0;
   317	
   318	iio_register_error:
   319		writel(FIELD_PREP(ASPEED_ADC_OP_MODE, ASPEED_ADC_OP_MODE_PWR_DOWN),
   320		       data->base + ASPEED_REG_ENGINE_CONTROL);
   321		clk_disable_unprepare(data->clk_scaler->clk);
   322	clk_enable_error:
   323	poll_timeout_error:
   324	vref_config_error:
   325		reset_control_assert(data->rst);
   326	reset_error:
   327		clk_hw_unregister_divider(data->clk_scaler);
   328	scaler_error:
   329		if (data->model_data->need_prescaler)
   330			clk_hw_unregister_divider(data->clk_prescaler);
   331		return ret;
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
