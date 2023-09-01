Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71D23C3B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 08:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693555232; x=1725091232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IUXyKotZCnOhjoi4SXWepIGSqCVQmICKG0QJ3su2LcQ=;
  b=I16manZm9y181NI58z7P6aguqtSRddVyj3egmxLbS3PWVh+ml7/d2DAP
   mkmYGOLh+McnuLZI7jmj115Q1m34P9ibWgBX7EVCu1wsKrV4W1sEqNp1o
   9XdPYLVG/W0e8QwcrTWkYAL4WqD06d8fKmwtoVgfAf7N8H2Cixx4f/gn2
   QwEvNMmiB0bQP8mh/CyhmmiWSpm6EwSJl/so14DXGRqiYK9oHLCxK2WvV
   quEhDy3lgfCu7CcUP6BIyrWwDstR5xcmBFoy0jZ41xLGRQCJiZ/L2HnOA
   VA9R3XjNopstyYFFOwRg0tUEZZATyXzeRe0icr89h8StceA4pGKuqOen8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462524944"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="462524944"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 01:00:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="883100735"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="883100735"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2023 01:00:34 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbz4u-00015F-2t;
	Fri, 01 Sep 2023 08:00:28 +0000
Date: Fri, 1 Sep 2023 16:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:dev 2/3]
 drivers/platform/chrome/cros_ec.c:186:9: error: implicit declaration of
 function 'KUNIT_STATIC_STUB_REDIRECT'
Message-ID: <202309011521.0DghktOf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git dev
head:   f54bc0b7e87fc979c2b36d7bbc70d614e0d569d6
commit: 2aa9c9537b9331ff45002c7c9c769132c0752c39 [2/3] platform/chrome: turn functions to stubbable
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230901/202309011521.0DghktOf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011521.0DghktOf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011521.0DghktOf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/chrome/cros_ec.c: In function 'cros_ec_register':
>> drivers/platform/chrome/cros_ec.c:186:9: error: implicit declaration of function 'KUNIT_STATIC_STUB_REDIRECT' [-Werror=implicit-function-declaration]
     186 |         KUNIT_STATIC_STUB_REDIRECT(cros_ec_register, ec_dev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/KUNIT_STATIC_STUB_REDIRECT +186 drivers/platform/chrome/cros_ec.c

   171	
   172	/**
   173	 * cros_ec_register() - Register a new ChromeOS EC, using the provided info.
   174	 * @ec_dev: Device to register.
   175	 *
   176	 * Before calling this, allocate a pointer to a new device and then fill
   177	 * in all the fields up to the --private-- marker.
   178	 *
   179	 * Return: 0 on success or negative error code.
   180	 */
   181	int cros_ec_register(struct cros_ec_device *ec_dev)
   182	{
   183		struct device *dev = ec_dev->dev;
   184		int err = 0;
   185	
 > 186		KUNIT_STATIC_STUB_REDIRECT(cros_ec_register, ec_dev);
   187	
   188		BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->event_notifier);
   189		BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->panic_notifier);
   190	
   191		ec_dev->max_request = sizeof(struct ec_params_hello);
   192		ec_dev->max_response = sizeof(struct ec_response_get_protocol_info);
   193		ec_dev->max_passthru = 0;
   194		ec_dev->ec = NULL;
   195		ec_dev->pd = NULL;
   196		ec_dev->suspend_timeout_ms = EC_HOST_SLEEP_TIMEOUT_DEFAULT;
   197	
   198		ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
   199		if (!ec_dev->din)
   200			return -ENOMEM;
   201	
   202		ec_dev->dout = devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
   203		if (!ec_dev->dout)
   204			return -ENOMEM;
   205	
   206		lockdep_register_key(&ec_dev->lockdep_key);
   207		mutex_init(&ec_dev->lock);
   208		lockdep_set_class(&ec_dev->lock, &ec_dev->lockdep_key);
   209	
   210		err = cros_ec_query_all(ec_dev);
   211		if (err) {
   212			dev_err(dev, "Cannot identify the EC: error %d\n", err);
   213			goto exit;
   214		}
   215	
   216		if (ec_dev->irq > 0) {
   217			err = devm_request_threaded_irq(dev, ec_dev->irq,
   218							cros_ec_irq_handler,
   219							cros_ec_irq_thread,
   220							IRQF_TRIGGER_LOW | IRQF_ONESHOT,
   221							"chromeos-ec", ec_dev);
   222			if (err) {
   223				dev_err(dev, "Failed to request IRQ %d: %d\n",
   224					ec_dev->irq, err);
   225				goto exit;
   226			}
   227		}
   228	
   229		/* Register a platform device for the main EC instance */
   230		ec_dev->ec = platform_device_register_data(ec_dev->dev, "cros-ec-dev",
   231						PLATFORM_DEVID_AUTO, &ec_p,
   232						sizeof(struct cros_ec_platform));
   233		if (IS_ERR(ec_dev->ec)) {
   234			dev_err(ec_dev->dev,
   235				"Failed to create CrOS EC platform device\n");
   236			err = PTR_ERR(ec_dev->ec);
   237			goto exit;
   238		}
   239	
   240		if (ec_dev->max_passthru) {
   241			/*
   242			 * Register a platform device for the PD behind the main EC.
   243			 * We make the following assumptions:
   244			 * - behind an EC, we have a pd
   245			 * - only one device added.
   246			 * - the EC is responsive at init time (it is not true for a
   247			 *   sensor hub).
   248			 */
   249			ec_dev->pd = platform_device_register_data(ec_dev->dev,
   250						"cros-ec-dev",
   251						PLATFORM_DEVID_AUTO, &pd_p,
   252						sizeof(struct cros_ec_platform));
   253			if (IS_ERR(ec_dev->pd)) {
   254				dev_err(ec_dev->dev,
   255					"Failed to create CrOS PD platform device\n");
   256				err = PTR_ERR(ec_dev->pd);
   257				goto exit;
   258			}
   259		}
   260	
   261		if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
   262			err = devm_of_platform_populate(dev);
   263			if (err) {
   264				dev_err(dev, "Failed to register sub-devices\n");
   265				goto exit;
   266			}
   267		}
   268	
   269		/*
   270		 * Clear sleep event - this will fail harmlessly on platforms that
   271		 * don't implement the sleep event host command.
   272		 */
   273		err = cros_ec_sleep_event(ec_dev, 0);
   274		if (err < 0)
   275			dev_dbg(ec_dev->dev, "Error %d clearing sleep event to ec\n",
   276				err);
   277	
   278		if (ec_dev->mkbp_event_supported) {
   279			/*
   280			 * Register the notifier for EC_HOST_EVENT_INTERFACE_READY
   281			 * event.
   282			 */
   283			ec_dev->notifier_ready.notifier_call = cros_ec_ready_event;
   284			err = blocking_notifier_chain_register(&ec_dev->event_notifier,
   285							      &ec_dev->notifier_ready);
   286			if (err)
   287				goto exit;
   288		}
   289	
   290		dev_info(dev, "Chrome EC device registered\n");
   291	
   292		/*
   293		 * Unlock EC that may be waiting for AP to process MKBP events.
   294		 * If the AP takes to long to answer, the EC would stop sending events.
   295		 */
   296		if (ec_dev->mkbp_event_supported)
   297			cros_ec_irq_thread(0, ec_dev);
   298	
   299		return 0;
   300	exit:
   301		platform_device_unregister(ec_dev->ec);
   302		platform_device_unregister(ec_dev->pd);
   303		mutex_destroy(&ec_dev->lock);
   304		lockdep_unregister_key(&ec_dev->lockdep_key);
   305		return err;
   306	}
   307	EXPORT_SYMBOL(cros_ec_register);
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
