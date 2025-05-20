Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8131B4121
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 21:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775496; cv=none; b=Zg9YlKBQ9NrLWHkAYhG+FARXoNgFrQ4uo65W2cdMWnkvxPqERQPqvEB1uTvljDj7goe2EEz/jp488OLHVAj3St/IzHXy21O6+ZGLMv45bSwAC0ASLzos8kbnqBQpnL4FFq29suQCxf/SwdGetfT2vPIQQCsvfIpHzZ+p2ZkJg44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775496; c=relaxed/simple;
	bh=vq0tpm8oWZ2LfahmyT65ua3EARel6qvrXfZLNY0qI6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FuAaJMz3A3HIJislLbLM9IervsCoczzKhoi91e9LeeqpjW+3+CXwmSozyD6NrXW0COY/tHU+HSQjIbT9Ostv7ZXzZCvGB7w0f3LOPltxD8ShR8E/ixU00Ks8sbppt3Rbf7PJy+l2kLtGXxQs0ogTR4IaUxudVbamr+r6Mv52Cbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfAxJ0WH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfAxJ0WH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747775495; x=1779311495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vq0tpm8oWZ2LfahmyT65ua3EARel6qvrXfZLNY0qI6A=;
  b=TfAxJ0WHdw87KYy2187QGDx2Y4F2IvW++f61U+3T4c6E3PwEKXBPS6TF
   fSY6M1MScf7nOQfMmadrvDpQm+uo3xjFJxo3JkFqYV+V5JLzN+3hvU/OT
   6/vEkWHVAF0Tz2mrxPxu0+8yd/tmbq5pDrytwB25hDPFileBRWejX2jBX
   LkCepRXzr3uYwy5vzm/zfIVVlVufUkPyfpAzPs8Gh5cI/6QSlwkC3VwWz
   rfujDTKCZioxEEjTS6Ta52VHtHBhUg0ae26NKV2kCTYLju1DxM4IPUhbn
   a2P6xHoF0rNzS0HCOkNho/gjRv+14ZCrBpn3pNG/DTJrKqUIz2VoU3J8l
   A==;
X-CSE-ConnectionGUID: JdJ5TjGOSK+EL+e+aQbzMA==
X-CSE-MsgGUID: 4YZoDFWzS/u+TV8agM6zEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53541714"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="53541714"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 14:11:35 -0700
X-CSE-ConnectionGUID: S0L3VAG1SUmT9CcrG7kDQg==
X-CSE-MsgGUID: SHJJ2yFDTvWjWy1OdtlG7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139713329"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 May 2025 14:11:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHUFH-000NZ8-09;
	Tue, 20 May 2025 21:11:31 +0000
Date: Wed, 21 May 2025 05:11:27 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:dev 19/20]
 drivers/platform/chrome/cros_ec_uart_test.c:127:27: error: too few arguments
 to function 'serdev_controller_alloc'
Message-ID: <202505210509.AtyvLGTr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git dev
head:   13ac901a15c34decc881c9ad9fbe22443d06258e
commit: c4bd46c8c5c1750c0c59c902bcc11b64905901f4 [19/20] platform/chrome: kunit: cros_ec_uart: Add tests with kprobes stub
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250521/202505210509.AtyvLGTr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210509.AtyvLGTr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210509.AtyvLGTr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/chrome/cros_ec_uart_test.c: In function 'cros_ec_uart_test_init':
>> drivers/platform/chrome/cros_ec_uart_test.c:127:27: error: too few arguments to function 'serdev_controller_alloc'
     127 |         priv->fake_ctrl = serdev_controller_alloc(&priv->fake_ctrl_dev, 0);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/chrome/cros_ec_uart_test.c:11:
   include/linux/serdev.h:171:27: note: declared here
     171 | struct serdev_controller *serdev_controller_alloc(struct device *host,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~


vim +/serdev_controller_alloc +127 drivers/platform/chrome/cros_ec_uart_test.c

    90	
    91	static int cros_ec_uart_test_init(struct kunit *test)
    92	{
    93		struct cros_ec_uart_test_priv *priv;
    94		int ret;
    95		struct device_driver *drv;
    96		enum probe_type orig;
    97		static struct acpi_hardware_id hwid = {
    98			.id = "GOOG0019",
    99		};
   100	
   101		kunit_activate_kprobes_stub(test, acpi_dev_get_resources, fake_acpi_dev_get_resources);
   102		kunit_activate_kprobes_stub(test, acpi_dev_gpio_irq_wake_get_by,
   103					    fake_acpi_dev_gpio_irq_wake_get_by);
   104		kunit_activate_kprobes_stub(test, cros_ec_register, fake_cros_ec_register);
   105		kunit_activate_kprobes_stub(test, cros_ec_unregister, fake_cros_ec_unregister);
   106	
   107		priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
   108		KUNIT_ASSERT_NOT_NULL(test, priv);
   109		test->priv = priv;
   110	
   111		priv->fake_class = class_create("fake-class");
   112		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->fake_class);
   113	
   114		priv->fake_ctrl_dev.class = priv->fake_class;
   115		dev_set_name(&priv->fake_ctrl_dev, "fake-ctrl-dev");
   116		ret = device_register(&priv->fake_ctrl_dev);
   117		if (ret)
   118			put_device(&priv->fake_ctrl_dev);
   119		KUNIT_ASSERT_EQ(test, ret, 0);
   120	
   121		mutex_init(&priv->ctrl_adev.physical_node_lock);
   122		INIT_LIST_HEAD(&priv->ctrl_adev.physical_node_list);
   123		fwnode_init(&priv->ctrl_adev.fwnode, &acpi_device_fwnode_ops);
   124		device_initialize(&priv->ctrl_adev.dev);
   125		ACPI_COMPANION_SET(&priv->fake_ctrl_dev, &priv->ctrl_adev);
   126	
 > 127		priv->fake_ctrl = serdev_controller_alloc(&priv->fake_ctrl_dev, 0);
   128		KUNIT_ASSERT_NOT_NULL(test, priv->fake_ctrl);
   129		priv->fake_ctrl->ops = &fake_ctrl_ops;
   130		priv->fake_ctrl->serdev = (void *)true;
   131		KUNIT_ASSERT_EQ(test, serdev_controller_add(priv->fake_ctrl), 0);
   132		priv->fake_ctrl->serdev = NULL;
   133	
   134		mutex_init(&priv->adev.physical_node_lock);
   135		INIT_LIST_HEAD(&priv->adev.physical_node_list);
   136		fwnode_init(&priv->adev.fwnode, &acpi_device_fwnode_ops);
   137		device_initialize(&priv->adev.dev);
   138	
   139		INIT_LIST_HEAD(&priv->adev.pnp.ids);
   140		INIT_LIST_HEAD(&hwid.list);
   141		list_add_tail(&hwid.list, &priv->adev.pnp.ids);
   142	
   143		priv->adev.pnp.type.hardware_id = 1;
   144		priv->adev.status.present = 1;
   145		priv->adev.dev.kobj.ktype = &dummy_ktype;
   146		ret = kobject_add(&priv->adev.dev.kobj, NULL, "dummy_kobj");
   147		KUNIT_ASSERT_GE(test, ret, 0);
   148	
   149		priv->fake_sdev = serdev_device_alloc(priv->fake_ctrl);
   150		KUNIT_ASSERT_NOT_NULL(test, priv->fake_sdev);
   151		ACPI_COMPANION_SET(&priv->fake_sdev->dev, &priv->adev);
   152		KUNIT_ASSERT_NOT_NULL(test, ACPI_COMPANION(&priv->fake_sdev->dev));
   153	
   154		/*
   155		 * Force to use synchronous probe so that the upcoming serdev device gets
   156		 * probed correctly and synchronously.
   157		 */
   158		ret = bus_for_each_drv(priv->fake_ctrl->dev.bus, NULL, &drv, find_target_driver);
   159		KUNIT_ASSERT_EQ(test, ret, 0);
   160		KUNIT_ASSERT_NOT_NULL(test, drv);
   161		orig = drv->probe_type;
   162		drv->probe_type = PROBE_FORCE_SYNCHRONOUS;
   163	
   164		ret = serdev_device_add(priv->fake_sdev);
   165		/* Restore to original probe type. */
   166		drv->probe_type = orig;
   167		KUNIT_ASSERT_EQ(test, ret, 0);
   168	
   169		return 0;
   170	}
   171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
