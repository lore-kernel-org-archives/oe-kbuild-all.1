Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3364A21
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 00:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719968033; cv=none; b=aCkIdBjXPiROqU6d8xpbaKcmufoVkwc+TibOGa6N4YdEpTS+5TMsksWRji1Lzlq3YduRo1rdbGODc9zxhg1P1s6kaK41e9PQMpoRc9gBnqQIkUZgAtMsFtQt6iVAJ0SLK2qrskSri2DOg1AsdJAtmBfeWtFFWTaRaGOA26Yi6Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719968033; c=relaxed/simple;
	bh=rbh5Aqm1mPNRbSGkmDVTxuB+JRTZ+AJAo6jo/a+m7gA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dsuCQk9wGKjVLEl9h5AJvhCWztJ6u4oDUXxw1YSyXSR6Amyh+25IUiAlTfUNp0ERugGOJ+Das/l+j1jGK9Nv/dPMtka+pXR9gR0/xHdlJnCAWH+Z/CONWlbV1D8KnIju8MUP0S0XcgiZLXqt+KmaLFx7STaQkCpiP7X/sekA0YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvkLR5kB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvkLR5kB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719968031; x=1751504031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rbh5Aqm1mPNRbSGkmDVTxuB+JRTZ+AJAo6jo/a+m7gA=;
  b=dvkLR5kBhicVnDnDUjwfCKDbNW+5xxBAJU+9zVLzWb9aAcBabcIhke59
   FQmamilmmWnSR8wmNGWY2slKnTjdJfKvmwVM8380Q+XT0VzDt7jkVcim4
   JDXLTOAPs52exycv44q39yJRxtxWp+A5fnsC/eMXDXKpaHGntFwi0gtR8
   7ctk7gF/4Rb7YKndsyUD4m/tsdT1NrPHAFqHUurCu1TrAFYAIdwwlBses
   Iyl0HgGqaono/vuOwagTnyvcI41S21B7LgDkKjAQTil0v0hhgLmO5pNut
   sTnk547z8P0QRS1f1hPePdw+3pNEG/xx7CuG9JfqpTQmpTYT0Q66CCH97
   A==;
X-CSE-ConnectionGUID: HH7durcZQoaXSlsWnAzq0g==
X-CSE-MsgGUID: M/AFRUgnSJi6L0lSCAvf1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28307166"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="28307166"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 17:53:51 -0700
X-CSE-ConnectionGUID: B/74RDSfSbW9PThoOQaK+g==
X-CSE-MsgGUID: NCgC8WA1SBu+hPQYLsNu8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="46728335"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Jul 2024 17:53:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOoFm-000P2l-1k;
	Wed, 03 Jul 2024 00:53:46 +0000
Date: Wed, 3 Jul 2024 08:53:24 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [linux-next:master 9580/10049]
 drivers/power/supply/cros_charge-control.c:210 charge_behaviour_store()
 warn: unsigned 'behaviour' is never less than zero.
Message-ID: <202407030856.WDIxlKzW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82e4255305c554b0bb18b7ccf2db86041b4c8b6e
commit: c6ed48ef52599098498a8442fd60bea5bd8cd309 [9580/10049] power: supply: add ChromeOS EC based charge control driver
config: x86_64-randconfig-161-20240703 (https://download.01.org/0day-ci/archive/20240703/202407030856.WDIxlKzW-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030856.WDIxlKzW-lkp@intel.com/

smatch warnings:
drivers/power/supply/cros_charge-control.c:210 charge_behaviour_store() warn: unsigned 'behaviour' is never less than zero.
drivers/power/supply/cros_charge-control.c:297 cros_chctl_probe() error: buffer overflow 'priv->attributes' 3 <= 3

vim +/behaviour +210 drivers/power/supply/cros_charge-control.c

   200	
   201	static ssize_t charge_behaviour_store(struct device *dev, struct device_attribute *attr,
   202					      const char *buf, size_t count)
   203	{
   204		struct cros_chctl_priv *priv = cros_chctl_attr_to_priv(&attr->attr,
   205								       CROS_CHCTL_ATTR_CHARGE_BEHAVIOUR);
   206		enum power_supply_charge_behaviour behaviour;
   207		int ret;
   208	
   209		behaviour = power_supply_charge_behaviour_parse(EC_CHARGE_CONTROL_BEHAVIOURS, buf);
 > 210		if (behaviour < 0)
   211			return behaviour;
   212	
   213		priv->current_behaviour = behaviour;
   214	
   215		ret = cros_chctl_configure_ec(priv);
   216		if (ret < 0)
   217			return ret;
   218	
   219		return count;
   220	}
   221	
   222	static umode_t cros_chtl_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
   223	{
   224		struct cros_chctl_priv *priv = cros_chctl_attr_to_priv(attr, n);
   225	
   226		if (priv->cmd_version < 2) {
   227			if (n == CROS_CHCTL_ATTR_START_THRESHOLD)
   228				return 0;
   229			if (n == CROS_CHCTL_ATTR_END_THRESHOLD)
   230				return 0;
   231		}
   232	
   233		return attr->mode;
   234	}
   235	
   236	static int cros_chctl_add_battery(struct power_supply *battery, struct acpi_battery_hook *hook)
   237	{
   238		struct cros_chctl_priv *priv = container_of(hook, struct cros_chctl_priv, battery_hook);
   239	
   240		if (priv->hooked_battery)
   241			return 0;
   242	
   243		priv->hooked_battery = battery;
   244		return device_add_group(&battery->dev, &priv->group);
   245	}
   246	
   247	static int cros_chctl_remove_battery(struct power_supply *battery, struct acpi_battery_hook *hook)
   248	{
   249		struct cros_chctl_priv *priv = container_of(hook, struct cros_chctl_priv, battery_hook);
   250	
   251		if (priv->hooked_battery == battery) {
   252			device_remove_group(&battery->dev, &priv->group);
   253			priv->hooked_battery = NULL;
   254		}
   255	
   256		return 0;
   257	}
   258	
   259	static int cros_chctl_probe(struct platform_device *pdev)
   260	{
   261		struct device *dev = &pdev->dev;
   262		struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
   263		struct cros_ec_device *cros_ec = ec_dev->ec_dev;
   264		struct cros_chctl_priv *priv;
   265		size_t i;
   266		int ret;
   267	
   268		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   269		if (!priv)
   270			return -ENOMEM;
   271	
   272		ret = cros_ec_get_cmd_versions(cros_ec, EC_CMD_CHARGE_CONTROL);
   273		if (ret < 0)
   274			return ret;
   275		else if (ret & EC_VER_MASK(3))
   276			priv->cmd_version = 3;
   277		else if (ret & EC_VER_MASK(2))
   278			priv->cmd_version = 2;
   279		else if (ret & EC_VER_MASK(1))
   280			priv->cmd_version = 1;
   281		else
   282			return -ENODEV;
   283	
   284		dev_dbg(dev, "Command version: %u\n", (unsigned int)priv->cmd_version);
   285	
   286		priv->cros_ec = cros_ec;
   287		priv->device_attrs[CROS_CHCTL_ATTR_START_THRESHOLD] =
   288			(struct device_attribute)__ATTR_RW(charge_control_start_threshold);
   289		priv->device_attrs[CROS_CHCTL_ATTR_END_THRESHOLD] =
   290			(struct device_attribute)__ATTR_RW(charge_control_end_threshold);
   291		priv->device_attrs[CROS_CHCTL_ATTR_CHARGE_BEHAVIOUR] =
   292			(struct device_attribute)__ATTR_RW(charge_behaviour);
   293		for (i = 0; i < _CROS_CHCTL_ATTR_COUNT; i++) {
   294			sysfs_attr_init(&priv->device_attrs[i].attr);
   295			priv->attributes[i] = &priv->device_attrs[i].attr;
   296		}
 > 297		priv->attributes[_CROS_CHCTL_ATTR_COUNT] = NULL;
   298		priv->group.is_visible = cros_chtl_attr_is_visible;
   299		priv->group.attrs = priv->attributes;
   300	
   301		priv->battery_hook.name = dev_name(dev);
   302		priv->battery_hook.add_battery = cros_chctl_add_battery;
   303		priv->battery_hook.remove_battery = cros_chctl_remove_battery;
   304	
   305		priv->current_behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
   306		priv->current_start_threshold = 0;
   307		priv->current_end_threshold = 100;
   308	
   309		/* Bring EC into well-known state */
   310		ret = cros_chctl_configure_ec(priv);
   311		if (ret < 0)
   312			return ret;
   313	
   314		return devm_battery_hook_register(dev, &priv->battery_hook);
   315	}
   316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
