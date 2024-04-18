Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF353B18D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713454462; cv=none; b=ulXcxcGOX2ysYr/MW8dwJMRXlAeT7OSwx1sPoRGEzft1CK5+PVPJYxbMXkxblfjSJBgoPQ56BelxDEnx12hmcunDyJwyBIogHta/fRXcX+OH8KQGMH2xPaYUbjep53e6ht23kFZTHr+TJjyRTbNN+wT2nLLM8EnxSXfKnEK7b2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713454462; c=relaxed/simple;
	bh=EkbCrMBlpaJ60pXbgylLiOxAX9sM1qfyA1geN5kHz/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P6ptS+cvN7CA4uGJh1t6/W4t89m2+6M6G5JKxNKCEiiq3e5hsOTAvjdm/C8Aj7YXPosUl0RDNbiByUvlBXmlnBPkknrRklmI8YorZjD3F1gLof5Fb9LtH6VvzcsEPCresS7y/Z3+HqbA2/T3QBAkuxiNORrBDTDgomQey17FFtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1l5M81A; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1l5M81A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713454460; x=1744990460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EkbCrMBlpaJ60pXbgylLiOxAX9sM1qfyA1geN5kHz/w=;
  b=V1l5M81Ani7XlIzsR5zTm4kgG2nykAh/YTyESoM2Joo2ET8oKHIQI+vM
   V6UPKf1n640vaw6cpaBzCgPewSCEXMXLxzfSVtyA2mgqWUTenHIiE6/bV
   zIagwIpucaT8IyXFrWOeQUHHllUsnW9+WVOgs1IyGzX9L89Iz1KokfjZF
   2J3HSC/XASbx9CnC+RnYwMO5HVaoURb0JcMqYiOOH7h4luEdq68hvywUw
   noaDY8cT1ufNgJG3cawOxaqhBN7Ptb4evtN5wlkOLH/kUtNegDJYXLqH+
   uCBtBK43lzxYmds9dnEsLlYF/I5U6lpQGnJshDMv7CccCsqS2zEY5H5u3
   A==;
X-CSE-ConnectionGUID: 0h1rKOBwTEifnw3hk35row==
X-CSE-MsgGUID: rlXivCuuTJ24yfjvPh1ozw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8845071"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8845071"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 08:34:19 -0700
X-CSE-ConnectionGUID: L1KAV5bHRBqRtCq0wDMcJw==
X-CSE-MsgGUID: 5oZYQ+ElQXCqnuVEkM82Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="22997901"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 Apr 2024 08:34:17 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxTmA-0008Uw-1Y;
	Thu, 18 Apr 2024 15:34:14 +0000
Date: Thu, 18 Apr 2024 23:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/parse-functions 10/12]
 drivers/soundwire/bus_type.c:108:undefined reference to `sdca_alloc'
Message-ID: <202404182348.lRlTAIGv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/parse-functions
head:   999b877354e492b6b1c8206962dcf1fd21c09f15
commit: cd24ac936a37b583771317da3d0865c6857cca92 [10/12] soundwire: add SDCA alloc/parsing
config: x86_64-randconfig-012-20240418 (https://download.01.org/0day-ci/archive/20240418/202404182348.lRlTAIGv-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404182348.lRlTAIGv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404182348.lRlTAIGv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `sdw_drv_probe':
>> drivers/soundwire/bus_type.c:108:(.text+0xac21cb): undefined reference to `sdca_alloc'
>> ld: drivers/soundwire/bus_type.c:114:(.text+0xac21dd): undefined reference to `sdca_find_functions'


vim +108 drivers/soundwire/bus_type.c

    81	
    82	static int sdw_drv_probe(struct device *dev)
    83	{
    84		struct sdw_slave *slave = dev_to_sdw_dev(dev);
    85		struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
    86		const struct sdw_device_id *id;
    87		const char *name;
    88		int ret;
    89	
    90		/*
    91		 * fw description is mandatory to bind
    92		 */
    93		if (!dev->fwnode)
    94			return -ENODEV;
    95	
    96		if (!IS_ENABLED(CONFIG_ACPI) && !dev->of_node)
    97			return -ENODEV;
    98	
    99		id = sdw_get_device_id(slave, drv);
   100		if (!id)
   101			return -ENODEV;
   102	
   103		/*
   104		 * the SDCA alloc/parsing is done before the driver probe
   105		 * so that all the information extracted from firmware is
   106		 * available.
   107		 */
 > 108		ret = sdca_alloc(&slave->sdca_context,
   109				 &slave->dev,
   110				 slave);
   111		if (ret < 0)
   112			return ret;
   113	
 > 114		sdca_find_functions(slave->sdca_context);
   115	
   116		/*
   117		 * attach to power domain but don't turn on (last arg)
   118		 */
   119		ret = dev_pm_domain_attach(dev, false);
   120		if (ret)
   121			return ret;
   122	
   123		ret = drv->probe(slave, id);
   124		if (ret) {
   125			name = drv->name;
   126			if (!name)
   127				name = drv->driver.name;
   128	
   129			dev_err(dev, "Probe of %s failed: %d\n", name, ret);
   130			dev_pm_domain_detach(dev, false);
   131			return ret;
   132		}
   133		mutex_lock(&slave->sdw_dev_lock);
   134	
   135		/* device is probed so let's read the properties now */
   136		if (drv->ops && drv->ops->read_prop)
   137			drv->ops->read_prop(slave);
   138	
   139		if (slave->prop.use_domain_irq)
   140			sdw_irq_create_mapping(slave);
   141	
   142		/* init the dynamic sysfs attributes we need */
   143		ret = sdw_slave_sysfs_dpn_init(slave);
   144		if (ret < 0)
   145			dev_warn(dev, "Slave sysfs init failed:%d\n", ret);
   146	
   147		/*
   148		 * Check for valid clk_stop_timeout, use DisCo worst case value of
   149		 * 300ms
   150		 *
   151		 * TODO: check the timeouts and driver removal case
   152		 */
   153		if (slave->prop.clk_stop_timeout == 0)
   154			slave->prop.clk_stop_timeout = 300;
   155	
   156		slave->bus->clk_stop_timeout = max_t(u32, slave->bus->clk_stop_timeout,
   157						     slave->prop.clk_stop_timeout);
   158	
   159		slave->probed = true;
   160	
   161		/*
   162		 * if the probe happened after the bus was started, notify the codec driver
   163		 * of the current hardware status to e.g. start the initialization.
   164		 * Errors are only logged as warnings to avoid failing the probe.
   165		 */
   166		if (drv->ops && drv->ops->update_status) {
   167			ret = drv->ops->update_status(slave, slave->status);
   168			if (ret < 0)
   169				dev_warn(dev, "%s: update_status failed with status %d\n", __func__, ret);
   170		}
   171	
   172		mutex_unlock(&slave->sdw_dev_lock);
   173	
   174		dev_dbg(dev, "probe complete\n");
   175	
   176		return 0;
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
