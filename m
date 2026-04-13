Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53EE3612F1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074759; cv=none; b=bomjcP4EgkJpTC2bdi1dMDsGQFwD6ARS500BjIdYWHdD8xwJ87H+Qfp0mLGpUaI+YM8F0Stgf7bK+3mQvYSrANUkiwsRUUczGNiUZE040JeGxZtzaaBN8laCmNQUzb4YsI2oeDd/RdSoeOx4F+Cz1tCunQMJ3dVWnVyZZBrs3dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074759; c=relaxed/simple;
	bh=Vb6TzlLgOGtlv6QGzVrmv31imS8L7kpw7DO7cR5T87I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RsS7Rt4F+PGgIlNsN+8c5FLwZrONL0OBvHs5KstUzMeVRhhKoscIcIBSAzAMHSRSCGkmVjwTux9BXAGvTtrCGj66E1bVssKM9Klip6vyhZboemwxnwKHPS25enXt8ue2KJZ5wlyDAptGQQoBP2J7DDNUTne3O2UPQkxCdjcDqGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYf6ZeMF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYf6ZeMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776074758; x=1807610758;
  h=date:from:to:cc:subject:message-id;
  bh=Vb6TzlLgOGtlv6QGzVrmv31imS8L7kpw7DO7cR5T87I=;
  b=eYf6ZeMFx7Ewf1zSxDGOsKCgzyzVT+xsr2Zlsz+ixMRdpx+6jyuH3zeT
   Bnd+OBDpOwhSiK7lp6VZEI2mJos/2Gfl/JZ8y+XRcSJ/tMn13AmOM8xve
   CGOr71UFUXNjlvi5MDgVk1JGIY8B2oYLsDnEd0NHfBBAOLQhUgkJTij+E
   S9xev7yGVe1J9WwtVGiKukS31CljpDOkiNWqzTFP6RyTud95OGSgM4PrK
   hIuzaMyOIn+FS/i+Zek+EMFm18qoc71GtBTjXHn82mMWVtqQPNM570k7H
   Sfh9y+kH6lTwnQvJut58Jiqdcufag6Jd9o77p4xLwLqfSwdt3Q2o9vSj9
   w==;
X-CSE-ConnectionGUID: Re9hr4ObTuC8Ul3GfWzdyg==
X-CSE-MsgGUID: gbjUjiPpQ+S+7WrOeJ2Wcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="87706845"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="87706845"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 03:05:51 -0700
X-CSE-ConnectionGUID: 6cEsiPPKSem1e8RnMEqUqw==
X-CSE-MsgGUID: CDjAnPulSnKoUDjWiWszYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="225462606"
Received: from igk-lkp-server01.igk.intel.com (HELO c4377979e8cc) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 13 Apr 2026 03:05:50 -0700
Received: from kbuild by c4377979e8cc with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCEAu-0000000004v-3DUA;
	Mon, 13 Apr 2026 10:05:48 +0000
Date: Mon, 13 Apr 2026 12:05:05 +0200
From: kernel test robot <lkp@intel.com>
To: Vincent Cloutier <vincent@cloutier.co>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/power/supply/max17042_battery.c:906:13: warning:
 'max17042_suspend_soc_alerts' defined but not used
Message-ID: <202604131233.rOkq8qAi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Vincent-Cloutier/power-supply-max17042_battery-Put-LSB-units-into-defines/20260412-142925
head:   37edc884e5f771450f3d0763e8cb4bea69040120
commit: 0b8ab9c60702cb99f1e22c0538235eeeff68f4f2 power: supply: max17042_battery: Keep only critical alerts during suspend
date:   28 hours ago
config: i386-randconfig-2006-20250804 (https://download.01.org/0day-ci/archive/20260413/202604131233.rOkq8qAi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604131233.rOkq8qAi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604131233.rOkq8qAi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/supply/max17042_battery.c:906:13: warning: 'max17042_suspend_soc_alerts' defined but not used [-Wunused-function]
     906 | static void max17042_suspend_soc_alerts(struct max17042_chip *chip)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/max17042_suspend_soc_alerts +906 drivers/power/supply/max17042_battery.c

   905	
 > 906	static void max17042_suspend_soc_alerts(struct max17042_chip *chip)
   907	{
   908		if (chip->chip_type != MAXIM_DEVICE_TYPE_MAX17055)
   909			return;
   910	
   911		regmap_update_bits(chip->regmap, MAX17055_Config2,
   912				   CFG2_DSOCI_BIT_ENBL, 0);
   913		max17042_set_critical_soc_threshold(chip);
   914	}
   915	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
