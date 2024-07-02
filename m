Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C581BB69B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 15:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719932561; cv=none; b=dv+Xwe86BqAZ6QzTnVEYKFhDQEdOdOTit3vMFY8F9ehtbBK5mygn3hfvPNIzuoJxd6bLIlMP3JPu7K0fXeQQkkn0IFOuAP2p/zAQAusVILZZ5OnV8i8Cfmb929SFSe9DmSrquANW6FuyGBvJSRCQntI8zwDnBo77s+l/VM6fq0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719932561; c=relaxed/simple;
	bh=fRZmFtWK246zoX2wjlOt7Ky6m8PhJRn/qzLB6TQKw7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mTcRk07OmMQDbZj5jnBKzG004m8UQ4imN5xyzNQlZc9Za/ICMiP3He3cG02jG9AsLws261QXUiw9jJPSMtxMWkpfM6A4vgGaSPlh+DRLQZQZxnkJDpNy1G/ksriFxJo0Xc9XRSursLR2CTPybg1MkA/G7uwAIuI2TB8MjJ+xfEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1AlptOC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1AlptOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719932560; x=1751468560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fRZmFtWK246zoX2wjlOt7Ky6m8PhJRn/qzLB6TQKw7Q=;
  b=S1AlptOCLoqyttyfY2aXDBsONhgt13w2Cs3knUUOJKckuYE++eJvrVv1
   90adYPRD3gLLg1llfbQzb48Sa+C/Nhvfi9gnK9Cmblc4MHmzyp5Q5qzXh
   P6U6i0KEedk1yhRCE/I3aRbvlG/6pbjTID/Lo0acuGVkeZ7TluVkOU6GR
   hS9eo9Tv6gMjSLj+UPYvH5Ko9JeEyMxoNrAnGi3wIw6AJwZZqheMAfuGc
   THybLcl0CcC7EPU3cRev3wMeU79yjwYYvOksPea4bITOH3HJI8pl8Ws3t
   chKgf8Mb5gZtSAk0KM8xihWotJOSrrN5hxV7wl9TJv7b6WjAcQ+ekv893
   w==;
X-CSE-ConnectionGUID: SQcesyPBTNiEAfN2Bk3wvA==
X-CSE-MsgGUID: DayF1k5cTkyn8FoqoO4azA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28511233"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="28511233"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 08:02:19 -0700
X-CSE-ConnectionGUID: lGZp1WZBRcuhsdIPSVogyg==
X-CSE-MsgGUID: or26g4ckQwuspA+Fsso0kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="50375728"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Jul 2024 08:02:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOf1L-000OJM-1h;
	Tue, 02 Jul 2024 15:02:15 +0000
Date: Tue, 2 Jul 2024 23:01:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [linux-next:master 9580/10049]
 drivers/power/supply/cros_charge-control.c:297:18: warning: array subscript
 3 is above array bounds of 'struct attribute *[3]'
Message-ID: <202407022251.MmrQxLGJ-lkp@intel.com>
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
config: x86_64-randconfig-012-20240702 (https://download.01.org/0day-ci/archive/20240702/202407022251.MmrQxLGJ-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240702/202407022251.MmrQxLGJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407022251.MmrQxLGJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/power/supply/cros_charge-control.c: In function 'cros_chctl_probe':
>> drivers/power/supply/cros_charge-control.c:297:18: warning: array subscript 3 is above array bounds of 'struct attribute *[3]' [-Warray-bounds]
     priv->attributes[_CROS_CHCTL_ATTR_COUNT] = NULL;
     ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~


vim +297 drivers/power/supply/cros_charge-control.c

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
