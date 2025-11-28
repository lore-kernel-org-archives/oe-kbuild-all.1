Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC7C30F807
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330736; cv=none; b=RV5eSdVqB5mN67eg7mShd5vvn0JwOiGwlOK/Yxif7bv53FViLUGrQbpezKEpsD9Ix1tZLtjJcxPdgKDvZaZdScmPxEiD6i4smPoczvnRzx1v7ktE1LzKcoHctzt6AMCxe9dgyW34m6976vifz+k09MNnIsd919L5TolmEJLhPQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330736; c=relaxed/simple;
	bh=cbhnTbK6ZCfDjvqWEEbAisNG/HX4hmP549OA+BBgmn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uf07HXaLpYwxdGxhBj0lxXetwhMhhWbh/shRmOPww44hsE0NuFhErIS3iIUORx9YblCscoR3eLZoXsNjlH+gPFT2IM+V2qJlzPQXXlbCkkFu9dBrZQKSLfH59zhSMyooo7XOyokZzX8VWeon+/ZqSlIo/qaLd0+h4228nJnAWxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtiY8LLQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtiY8LLQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764330734; x=1795866734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cbhnTbK6ZCfDjvqWEEbAisNG/HX4hmP549OA+BBgmn8=;
  b=FtiY8LLQMJnXPuCDigvme6xfrb5QesJmNclThJ/4oErwo308qUZCOVLT
   7Kd1J6pNYRhJ1UXLmWFBHYGiXDpoRdaI9wYYtn/1+OwlPxKmO0SOCrjht
   gocetlZpuuRLpS6s+iDjfGVOT1aYFtivCfbcC1ewzmQNVSA77fJySdSCJ
   EAz7MgTw0QkZq6LtGktiC3uHs2n7OeUKqodTLKh2sWerqhRQxnAmZL/pm
   GtGA0odWOuymL87gj9BAgO/h6MqY8jXYpQCjC9CPQHx4AMionA4JbIw0A
   6sUB7TAcIqMfQwlfij7smJ1EYFhUO0xI0eERZNF4IWYThkQamUYWUvYIo
   Q==;
X-CSE-ConnectionGUID: lJq36XIRTF2dyLdMus2p3A==
X-CSE-MsgGUID: gX6uUprZSIW2vMayQ1PKtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="91839016"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="91839016"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 03:52:14 -0800
X-CSE-ConnectionGUID: suxygc4JQW6HKAQHCmzivg==
X-CSE-MsgGUID: OUlsNeJDSOafrq0I3KlPzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="216792254"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Nov 2025 03:52:12 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOx1F-000000006Lt-45eq;
	Fri, 28 Nov 2025 11:52:09 +0000
Date: Fri, 28 Nov 2025 19:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 9939/12740]
 sound/soc/sdca/sdca_class_function.c:349:undefined reference to
 `__devm_regmap_init_sdw_mbq'
Message-ID: <202511281900.DQmp9w3q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d31f578f3230f3b7b33b0930b08f9afd8429817
commit: 3af1815a2f9caebfc666af3912e24d030a5368d5 [9939/12740] ASoC: SDCA: Add basic SDCA function driver
config: x86_64-randconfig-006-20251128 (https://download.01.org/0day-ci/archive/20251128/202511281900.DQmp9w3q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511281900.DQmp9w3q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511281900.DQmp9w3q-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `sdwhid_parse':
   sound/soc/sdca/sdca_hid.c:37:(.text+0x41b3c34): undefined reference to `hid_parse_report'
   ld: vmlinux.o: in function `sdca_add_hid_device':
   sound/soc/sdca/sdca_hid.c:95:(.text+0x41b3cb5): undefined reference to `hid_allocate_device'
   ld: sound/soc/sdca/sdca_hid.c:114:(.text+0x41b3f4e): undefined reference to `hid_add_device'
   ld: vmlinux.o: in function `sdca_hid_process_report':
   sound/soc/sdca/sdca_hid.c:160:(.text+0x41b4346): undefined reference to `hid_input_report'
   ld: vmlinux.o: in function `class_read_prop':
   sound/soc/sdca/sdca_class.c:32:(.text+0x41b8e19): undefined reference to `sdw_slave_read_prop'
   ld: vmlinux.o: in function `class_sdw_probe':
   sound/soc/sdca/sdca_class.c:216:(.text+0x41b954a): undefined reference to `__devm_regmap_init_sdw'
   ld: vmlinux.o: in function `class_function_probe':
>> sound/soc/sdca/sdca_class_function.c:349:(.text+0x41bb038): undefined reference to `__devm_regmap_init_sdw_mbq'
   ld: vmlinux.o: in function `class_sdw_driver_init':
   sound/soc/sdca/sdca_class.c:300:(.init.text+0xcfc2e): undefined reference to `__sdw_register_driver'
   ld: vmlinux.o: in function `sdca_add_hid_device':
   sound/soc/sdca/sdca_hid.c:117:(.text.unlikely+0x400212): undefined reference to `hid_destroy_device'
   ld: vmlinux.o: in function `class_sdw_driver_exit':
   sound/soc/sdca/sdca_class.c:300:(.exit.text+0xb38c): undefined reference to `sdw_unregister_driver'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_SDCA_HID
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SDCA [=y] && (HID [=n]=y [=y] || HID [=n]=SND_SOC_SDCA [=y])
   Selected by [y]:
   - SND_SOC_SDCA_CLASS [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SDCA [=y]


vim +349 sound/soc/sdca/sdca_class_function.c

   265	
   266	static int class_function_probe(struct auxiliary_device *auxdev,
   267					const struct auxiliary_device_id *aux_dev_id)
   268	{
   269		struct device *dev = &auxdev->dev;
   270		struct sdca_class_drv *core = dev_get_drvdata(dev->parent);
   271		struct sdca_device_data *data = &core->sdw->sdca_data;
   272		struct sdca_function_desc *desc;
   273		struct snd_soc_component_driver *cmp_drv;
   274		struct snd_soc_dai_driver *dais;
   275		struct class_function_drv *drv;
   276		struct regmap_sdw_mbq_cfg *mbq_config;
   277		struct regmap_config *config;
   278		struct reg_default *defaults;
   279		int ndefaults;
   280		int num_dais;
   281		int ret;
   282		int i;
   283	
   284		drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
   285		if (!drv)
   286			return -ENOMEM;
   287	
   288		cmp_drv = devm_kmemdup(dev, &class_function_component_drv, sizeof(*cmp_drv),
   289				       GFP_KERNEL);
   290		if (!cmp_drv)
   291			return -ENOMEM;
   292	
   293		config = devm_kmemdup(dev, &class_function_regmap_config, sizeof(*config),
   294				      GFP_KERNEL);
   295		if (!config)
   296			return -ENOMEM;
   297	
   298		mbq_config = devm_kmemdup(dev, &class_function_mbq_config, sizeof(*mbq_config),
   299					  GFP_KERNEL);
   300		if (!mbq_config)
   301			return -ENOMEM;
   302	
   303		drv->dev = dev;
   304		drv->core = core;
   305	
   306		for (i = 0; i < data->num_functions; i++) {
   307			desc = &data->function[i];
   308	
   309			if (desc->type == aux_dev_id->driver_data)
   310				break;
   311		}
   312		if (i == core->sdw->sdca_data.num_functions) {
   313			dev_err(dev, "failed to locate function\n");
   314			return -EINVAL;
   315		}
   316	
   317		drv->function = &core->functions[i];
   318	
   319		ret = sdca_parse_function(dev, core->sdw, desc, drv->function);
   320		if (ret)
   321			return ret;
   322	
   323		ndefaults = sdca_regmap_count_constants(dev, drv->function);
   324		if (ndefaults < 0)
   325			return ndefaults;
   326	
   327		defaults = devm_kcalloc(dev, ndefaults, sizeof(*defaults), GFP_KERNEL);
   328		if (!defaults)
   329			return -ENOMEM;
   330	
   331		ret = sdca_regmap_populate_constants(dev, drv->function, defaults);
   332		if (ret < 0)
   333			return ret;
   334	
   335		regcache_sort_defaults(defaults, ndefaults);
   336	
   337		auxiliary_set_drvdata(auxdev, drv);
   338	
   339		config->reg_defaults = defaults;
   340		config->num_reg_defaults = ndefaults;
   341		config->lock_arg = &core->regmap_lock;
   342	
   343		if (drv->function->busy_max_delay) {
   344			mbq_config->timeout_us = drv->function->busy_max_delay;
   345			mbq_config->retry_us = umax(drv->function->busy_max_delay / 10,
   346						    mbq_config->retry_us);
   347		}
   348	
 > 349		drv->regmap = devm_regmap_init_sdw_mbq_cfg(dev, core->sdw, config, mbq_config);
   350		if (IS_ERR(drv->regmap))
   351			return dev_err_probe(dev, PTR_ERR(drv->regmap),
   352					     "failed to create regmap");
   353	
   354		ret = sdca_asoc_populate_component(dev, drv->function, cmp_drv,
   355						   &dais, &num_dais,
   356						   &class_function_sdw_ops);
   357		if (ret)
   358			return ret;
   359	
   360		pm_runtime_set_autosuspend_delay(dev, 200);
   361		pm_runtime_use_autosuspend(dev);
   362		pm_runtime_set_active(dev);
   363		pm_runtime_get_noresume(dev);
   364	
   365		ret = devm_pm_runtime_enable(dev);
   366		if (ret)
   367			return ret;
   368	
   369		ret = class_function_boot(drv);
   370		if (ret)
   371			return ret;
   372	
   373		ret = devm_snd_soc_register_component(dev, cmp_drv, dais, num_dais);
   374		if (ret)
   375			return dev_err_probe(dev, ret, "failed to register component\n");
   376	
   377		pm_runtime_mark_last_busy(dev);
   378		pm_runtime_put_autosuspend(dev);
   379	
   380		return 0;
   381	}
   382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
