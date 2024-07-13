Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89722DDC3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 01:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720834141; cv=none; b=ZkzmvBIWZkRp6fP1Mmli1MQTMnrQtK/HMjnJAVdDioLKUlxW2zUIDPz8gU7BG4Jt9mDMwFkFNVQ0wzwMkQuW9eqXhPtd+TrW5vtEhwuzJbP7RjU6E6qUhRLZKBb1nTzS4qmpslicIei4xUJmvMcdcLTAPaAvaO5989yCDdtkSr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720834141; c=relaxed/simple;
	bh=LKHzzM640T/NYUF5+Iqp1vbMTPnduzbmGWhexIwcycA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PYxWxfxMKqR2ya2X7Cwsb7YjIUZdj0yEqa924ya4hmPMEGcNF2967euCCxdlvpcugJVHjqCYZvYkv5MHCB+ZJ4NU3NOcM+1RVV3XyvEuUUyLcGP9bAUbTUwtD18j9tp7jYRrSBQ98ZUyXfDhXWjZmwren7caL5NtobWCgewWG3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXsWg7RO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXsWg7RO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720834140; x=1752370140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LKHzzM640T/NYUF5+Iqp1vbMTPnduzbmGWhexIwcycA=;
  b=fXsWg7ROJJOeCobQJPIdldJzSeu6CXJ3UBYgdVfjoQz+uQSk7JKiP4RL
   PH9jmGla30TetBp0ppfmMLzJuYtoPsTrgrDSo9t+nsGOV4UTYa+tuAkWQ
   8nqCY3f63h6IVBKS3Uymmmj8WI4Q863ErUbhy/tTut00Tb5z4f3c6L1yo
   1frL2+92HFrjav6XisxL/vbjKJux4QYqt9W1CQghDTpu6Si39m3zd1XLd
   GGtupcXk6VF7eizVAfN/vLP+73vjUiZr7VBtkoNUHfKetun54yDvzVqWG
   q38Kr/yEyEQZKUPywfeBjUXoTfeaHYdAfErdnmLASAn52H9+XNbn0e8HX
   A==;
X-CSE-ConnectionGUID: r5im1GlbS0ODjZldedSW+A==
X-CSE-MsgGUID: u69U1sxiRSGCl9GWcuOBIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="29441195"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="29441195"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 18:28:58 -0700
X-CSE-ConnectionGUID: t0rp0OkORGaAyWCCYBnrcg==
X-CSE-MsgGUID: 9PWabvK7QFWrYgv2OlDgPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="48812638"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jul 2024 18:28:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSRZG-000bWQ-24;
	Sat, 13 Jul 2024 01:28:54 +0000
Date: Sat, 13 Jul 2024 09:28:02 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/asoc-wsa88xx-version 6/6]
 sound/soc/codecs/wsa884x.c:2106:undefined reference to
 `devm_hwmon_device_register_with_info'
Message-ID: <202407130935.PSK1LK1F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/asoc-wsa88xx-version
head:   82aff4b129f138d605adcb618c42f9f8bf851002
commit: 82aff4b129f138d605adcb618c42f9f8bf851002 [6/6] ASoC: codecs: wsa884x: Implement temperature reading and hwmon
config: i386-randconfig-014-20240713 (https://download.01.org/0day-ci/archive/20240713/202407130935.PSK1LK1F-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130935.PSK1LK1F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407130935.PSK1LK1F-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/codecs/wsa884x.o: in function `wsa884x_probe':
>> sound/soc/codecs/wsa884x.c:2106:(.text+0x79e): undefined reference to `devm_hwmon_device_register_with_info'


vim +2106 sound/soc/codecs/wsa884x.c

  2033	
  2034	static int wsa884x_probe(struct sdw_slave *pdev,
  2035				 const struct sdw_device_id *id)
  2036	{
  2037		struct device *dev = &pdev->dev;
  2038		struct wsa884x_priv *wsa884x;
  2039		struct device *hwmon;
  2040		unsigned int i;
  2041		int ret;
  2042	
  2043		wsa884x = devm_kzalloc(dev, sizeof(*wsa884x), GFP_KERNEL);
  2044		if (!wsa884x)
  2045			return -ENOMEM;
  2046	
  2047		mutex_init(&wsa884x->sp_lock);
  2048	
  2049		for (i = 0; i < WSA884X_SUPPLIES_NUM; i++)
  2050			wsa884x->supplies[i].supply = wsa884x_supply_name[i];
  2051	
  2052		ret = devm_regulator_bulk_get(dev, WSA884X_SUPPLIES_NUM,
  2053					      wsa884x->supplies);
  2054		if (ret)
  2055			return dev_err_probe(dev, ret, "Failed to get regulators\n");
  2056	
  2057		ret = regulator_bulk_enable(WSA884X_SUPPLIES_NUM, wsa884x->supplies);
  2058		if (ret)
  2059			return dev_err_probe(dev, ret, "Failed to enable regulators\n");
  2060	
  2061		ret = devm_add_action_or_reset(dev, wsa884x_regulator_disable,
  2062					       wsa884x->supplies);
  2063		if (ret)
  2064			return ret;
  2065	
  2066		ret = wsa884x_get_reset(dev, wsa884x);
  2067		if (ret)
  2068			return ret;
  2069	
  2070		dev_set_drvdata(dev, wsa884x);
  2071		wsa884x->slave = pdev;
  2072		wsa884x->dev = dev;
  2073		wsa884x->dev_mode = WSA884X_SPEAKER;
  2074		wsa884x->sconfig.ch_count = 1;
  2075		wsa884x->sconfig.bps = 1;
  2076		wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
  2077		wsa884x->sconfig.type = SDW_STREAM_PDM;
  2078	
  2079		/**
  2080		 * Port map index starts with 0, however the data port for this codec
  2081		 * are from index 1
  2082		 */
  2083		if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
  2084						WSA884X_MAX_SWR_PORTS))
  2085			dev_dbg(dev, "Static Port mapping not specified\n");
  2086	
  2087		pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS, 0);
  2088		pdev->prop.simple_clk_stop_capable = true;
  2089		pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
  2090		pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
  2091	
  2092		wsa884x_reset_deassert(wsa884x);
  2093		ret = devm_add_action_or_reset(dev, wsa884x_reset_powerdown, wsa884x);
  2094		if (ret)
  2095			return ret;
  2096	
  2097		wsa884x->regmap = devm_regmap_init_sdw(pdev, &wsa884x_regmap_config);
  2098		if (IS_ERR(wsa884x->regmap))
  2099			return dev_err_probe(dev, PTR_ERR(wsa884x->regmap),
  2100					     "regmap_init failed\n");
  2101	
  2102		/* Start in cache-only until device is enumerated */
  2103		regcache_cache_only(wsa884x->regmap, true);
  2104		wsa884x->hw_init = true;
  2105	
> 2106		hwmon = devm_hwmon_device_register_with_info(dev, "wsa884x", wsa884x,
  2107							     &wsa884x_hwmon_chip_info,
  2108							     NULL);
  2109		if (IS_ERR(hwmon))
  2110			return dev_err_probe(dev, PTR_ERR(hwmon),
  2111					     "Failed to register hwmon sensor\n");
  2112	
  2113		pm_runtime_set_autosuspend_delay(dev, 3000);
  2114		pm_runtime_use_autosuspend(dev);
  2115		pm_runtime_mark_last_busy(dev);
  2116		pm_runtime_set_active(dev);
  2117		pm_runtime_enable(dev);
  2118	
  2119		return devm_snd_soc_register_component(dev,
  2120						       &wsa884x_component_drv,
  2121						       wsa884x_dais,
  2122						       ARRAY_SIZE(wsa884x_dais));
  2123	}
  2124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
