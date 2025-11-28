Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A401D9346
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 04:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764304080; cv=none; b=GdmwAa42aN2L3ZIFKU68BpEelXFv7NMCGhrcWKLr/gp/7ok2DSAMbpIREGvWYOf2ncFGWrR+S+pfW1+Mxt7WRBaPMeIR8uiXltoCdrsEgBv6RH0YVr1I+0iBjxtKtDpc7X3EGNgyapGWz3p0G4NEV69yX5jnq0jFX2YboS0q8yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764304080; c=relaxed/simple;
	bh=Leq+OxocHlCwtRvRah1X19T19DwSMtFENqxVB0eI0Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WS3pw7qP7QJ9X8lhzT++NC9oC2PVK53aJqrfGIpmSn59t4ShhoIxO0Ye2x1Rig0bXjjrkX6OwqUtXTpIrRhVKs+36fuyt7Q36K4wc9DNUq6DHs8vv9DqVS+0MCNkIqTmwJpkk7ZSGDJJ+pzkmDeocPJ4d4w6vG/OvTx9lugMN30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4lu8tps; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4lu8tps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764304079; x=1795840079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Leq+OxocHlCwtRvRah1X19T19DwSMtFENqxVB0eI0Oo=;
  b=O4lu8tpsxOBXhGpj11jT9h0KQLadbM3jCCBHhbwJvKlcF6YbLg2LVuz8
   ASlmxB0+7BHgQpi0V3SmEqz54/8vFpEQi2++Sh1xzSHh+/tHtwXLrPzT7
   9caP2d2ztt5zUd7m0ai8SDsNguQPYUB4mit9a/ohiABFS+UyH+ZKrrHF2
   6u0msTJpTr1RVRRArMze+vhSw+RCm0eDA/jAgVwiSW5kw33m+Dq1ymewt
   ifGcCMklBJ1iblPnkAiPZ8EQlFRC5S9jGeq7+H2bN6ElvV8P8DOqEVZmv
   0GiXgdG5ZlGXdqiudDitl9uEg5DO0hOUQFfKdg4rMmksKfWH28R1KB5bp
   A==;
X-CSE-ConnectionGUID: UJedlE/qSJeW2zlDvwsvsQ==
X-CSE-MsgGUID: uVl0q77KTuKtNxdUEDE6Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66301962"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66301962"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 20:27:58 -0800
X-CSE-ConnectionGUID: 286LrtvoSye7T5WCHicWFQ==
X-CSE-MsgGUID: O5dRBDqPRMunKYDaI9gyTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193265420"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Nov 2025 20:27:55 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOq5J-0000000062L-1Vjk;
	Fri, 28 Nov 2025 04:27:53 +0000
Date: Fri, 28 Nov 2025 12:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 9984/12398]
 sound/soc/sdca/sdca_class.c:32:undefined reference to `sdw_slave_read_prop'
Message-ID: <202511281223.DDs12LiC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
commit: 2d877d0659cb69cc0677ee2805e9521966d70ac5 [9984/12398] ASoC: SDCA: Add basic SDCA class driver
config: x86_64-randconfig-006-20251128 (https://download.01.org/0day-ci/archive/20251128/202511281223.DDs12LiC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511281223.DDs12LiC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511281223.DDs12LiC-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `sdwhid_parse':
>> sound/soc/sdca/sdca_hid.c:37:(.text+0x41b3c34): undefined reference to `hid_parse_report'
   ld: vmlinux.o: in function `sdca_add_hid_device':
>> sound/soc/sdca/sdca_hid.c:95:(.text+0x41b3cb5): undefined reference to `hid_allocate_device'
>> ld: sound/soc/sdca/sdca_hid.c:114:(.text+0x41b3f4e): undefined reference to `hid_add_device'
   ld: vmlinux.o: in function `sdca_hid_process_report':
>> sound/soc/sdca/sdca_hid.c:160:(.text+0x41b4346): undefined reference to `hid_input_report'
   ld: vmlinux.o: in function `class_read_prop':
>> sound/soc/sdca/sdca_class.c:32:(.text+0x41b8e19): undefined reference to `sdw_slave_read_prop'
   ld: vmlinux.o: in function `class_sdw_probe':
>> sound/soc/sdca/sdca_class.c:216:(.text+0x41b954a): undefined reference to `__devm_regmap_init_sdw'
   ld: vmlinux.o: in function `class_sdw_driver_init':
>> sound/soc/sdca/sdca_class.c:300:(.init.text+0xcfc2e): undefined reference to `__sdw_register_driver'
   ld: vmlinux.o: in function `sdca_add_hid_device':
>> sound/soc/sdca/sdca_hid.c:117:(.text.unlikely+0x400212): undefined reference to `hid_destroy_device'
   ld: vmlinux.o: in function `class_sdw_driver_exit':
>> sound/soc/sdca/sdca_class.c:300:(.exit.text+0xb38c): undefined reference to `sdw_unregister_driver'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_SDCA_HID
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SDCA [=y] && (HID [=n]=y [=y] || HID [=n]=SND_SOC_SDCA [=y])
   Selected by [y]:
   - SND_SOC_SDCA_CLASS [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SDCA [=y]


vim +32 sound/soc/sdca/sdca_class.c

    27	
    28	static int class_read_prop(struct sdw_slave *sdw)
    29	{
    30		struct sdw_slave_prop *prop = &sdw->prop;
    31	
  > 32		sdw_slave_read_prop(sdw);
    33	
    34		prop->use_domain_irq = true;
    35		prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY |
    36				      SDW_SCP_INT1_IMPL_DEF;
    37	
    38		return 0;
    39	}
    40	
    41	static int class_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_status status)
    42	{
    43		struct sdca_class_drv *drv = dev_get_drvdata(&sdw->dev);
    44	
    45		switch (status) {
    46		case SDW_SLAVE_ATTACHED:
    47			dev_dbg(drv->dev, "device attach\n");
    48	
    49			drv->attached = true;
    50	
    51			complete(&drv->device_attach);
    52			break;
    53		case SDW_SLAVE_UNATTACHED:
    54			dev_dbg(drv->dev, "device detach\n");
    55	
    56			drv->attached = false;
    57	
    58			reinit_completion(&drv->device_attach);
    59			break;
    60		default:
    61			break;
    62		}
    63	
    64		return 0;
    65	}
    66	
    67	static const struct sdw_slave_ops class_sdw_ops = {
    68		.read_prop	= class_read_prop,
    69		.update_status	= class_sdw_update_status,
    70	};
    71	
    72	static void class_regmap_lock(void *data)
    73	{
    74		struct mutex *lock = data;
    75	
    76		mutex_lock(lock);
    77	}
    78	
    79	static void class_regmap_unlock(void *data)
    80	{
    81		struct mutex *lock = data;
    82	
    83		mutex_unlock(lock);
    84	}
    85	
    86	static int class_wait_for_attach(struct sdca_class_drv *drv)
    87	{
    88		if (!drv->attached) {
    89			unsigned long timeout = msecs_to_jiffies(CLASS_SDW_ATTACH_TIMEOUT_MS);
    90			unsigned long time;
    91	
    92			time = wait_for_completion_timeout(&drv->device_attach, timeout);
    93			if (!time) {
    94				dev_err(drv->dev, "timed out waiting for device re-attach\n");
    95				return -ETIMEDOUT;
    96			}
    97		}
    98	
    99		regcache_cache_only(drv->dev_regmap, false);
   100	
   101		return 0;
   102	}
   103	
   104	static bool class_dev_regmap_volatile(struct device *dev, unsigned int reg)
   105	{
   106		switch (reg) {
   107		case SDW_SCP_SDCA_INTMASK1 ... SDW_SCP_SDCA_INTMASK4:
   108			return false;
   109		default:
   110			return true;
   111		}
   112	}
   113	
   114	static bool class_dev_regmap_precious(struct device *dev, unsigned int reg)
   115	{
   116		switch (reg) {
   117		case SDW_SCP_SDCA_INT1 ... SDW_SCP_SDCA_INT4:
   118		case SDW_SCP_SDCA_INTMASK1 ... SDW_SCP_SDCA_INTMASK4:
   119			return false;
   120		default:
   121			return true;
   122		}
   123	}
   124	
   125	static const struct regmap_config class_dev_regmap_config = {
   126		.name			= "sdca-device",
   127		.reg_bits		= 32,
   128		.val_bits		= 8,
   129	
   130		.max_register		= SDW_SDCA_MAX_REGISTER,
   131		.volatile_reg		= class_dev_regmap_volatile,
   132		.precious_reg		= class_dev_regmap_precious,
   133	
   134		.cache_type		= REGCACHE_MAPLE,
   135	
   136		.lock			= class_regmap_lock,
   137		.unlock			= class_regmap_unlock,
   138	};
   139	
   140	static void class_boot_work(struct work_struct *work)
   141	{
   142		struct sdca_class_drv *drv = container_of(work,
   143							  struct sdca_class_drv,
   144							  boot_work);
   145		int ret;
   146	
   147		ret = class_wait_for_attach(drv);
   148		if (ret)
   149			goto err;
   150	
   151		drv->irq_info = sdca_irq_allocate(drv->dev, drv->dev_regmap,
   152						  drv->sdw->irq);
   153		if (IS_ERR(drv->irq_info))
   154			goto err;
   155	
   156		ret = sdca_dev_register_functions(drv->sdw);
   157		if (ret)
   158			goto err;
   159	
   160		dev_dbg(drv->dev, "boot work complete\n");
   161	
   162		pm_runtime_mark_last_busy(drv->dev);
   163		pm_runtime_put_autosuspend(drv->dev);
   164	
   165		return;
   166	
   167	err:
   168		pm_runtime_put_sync(drv->dev);
   169	}
   170	
   171	static void class_dev_remove(void *data)
   172	{
   173		struct sdca_class_drv *drv = data;
   174	
   175		cancel_work_sync(&drv->boot_work);
   176	
   177		sdca_dev_unregister_functions(drv->sdw);
   178	}
   179	
   180	static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
   181	{
   182		struct device *dev = &sdw->dev;
   183		struct sdca_device_data *data = &sdw->sdca_data;
   184		struct regmap_config *dev_config;
   185		struct sdca_class_drv *drv;
   186		int ret;
   187	
   188		sdca_lookup_swft(sdw);
   189	
   190		drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
   191		if (!drv)
   192			return -ENOMEM;
   193	
   194		dev_config = devm_kmemdup(dev, &class_dev_regmap_config,
   195					  sizeof(*dev_config), GFP_KERNEL);
   196		if (!dev_config)
   197			return -ENOMEM;
   198	
   199		drv->functions = devm_kcalloc(dev, data->num_functions,
   200					      sizeof(*drv->functions),
   201					      GFP_KERNEL);
   202		if (!drv->functions)
   203			return -ENOMEM;
   204	
   205		drv->dev = dev;
   206		drv->sdw = sdw;
   207		mutex_init(&drv->regmap_lock);
   208	
   209		dev_set_drvdata(drv->dev, drv);
   210	
   211		INIT_WORK(&drv->boot_work, class_boot_work);
   212		init_completion(&drv->device_attach);
   213	
   214		dev_config->lock_arg = &drv->regmap_lock;
   215	
 > 216		drv->dev_regmap = devm_regmap_init_sdw(sdw, dev_config);
   217		if (IS_ERR(drv->dev_regmap))
   218			return dev_err_probe(drv->dev, PTR_ERR(drv->dev_regmap),
   219					     "failed to create device regmap\n");
   220	
   221		regcache_cache_only(drv->dev_regmap, true);
   222	
   223		pm_runtime_set_autosuspend_delay(dev, 250);
   224		pm_runtime_use_autosuspend(dev);
   225		pm_runtime_set_active(dev);
   226		pm_runtime_get_noresume(dev);
   227	
   228		ret = devm_pm_runtime_enable(dev);
   229		if (ret)
   230			return ret;
   231	
   232		ret = devm_add_action_or_reset(dev, class_dev_remove, drv);
   233		if (ret)
   234			return ret;
   235	
   236		queue_work(system_long_wq, &drv->boot_work);
   237	
   238		return 0;
   239	}
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
