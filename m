Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D450239478D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780127791; cv=none; b=rEOWK/49DffnszjOcBAFW2ORwP0jYPb/JGHQdmVQhkN52XaUHcJxI30q9IMng9ODNPWCGfvewcnVcq+9qbe6aCY+ywTV/s6umtAY9xiIBi4tmhBu/VA0nFQyR1o+/Pw965X4B5fRSb1/OAJbC76SpTReqcrXBLBTd0oF6NhzfkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780127791; c=relaxed/simple;
	bh=mhwbwDKKcDd0r/Kq42IqKZfmrFImo5jE7ycNrbv83l0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A5mTqBPUp/YAlYQDQEr5brE4s0mvdzTicHtz9LtcVjw+nHeHoU0qrzBrSPtbNfwmEDZ9LkeFoagiPgw+o8qLL/vHzNOaELkY435lRS5ypnDJHKfKD/51LvC24JCY/7/s4OgPjefO44uhfuhw1FFYXCJJd0D9araSnC2YLIbg15c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zmvgjrw4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zmvgjrw4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780127790; x=1811663790;
  h=date:from:to:cc:subject:message-id;
  bh=mhwbwDKKcDd0r/Kq42IqKZfmrFImo5jE7ycNrbv83l0=;
  b=Zmvgjrw4U9VgYSzEwNhQvjaMsDzZ8iigV7QnJiFp+jcktTbyaBaB6Wzr
   vz2+NyyK1OvpHgkhlZnq/2KOJBsjBlwPwllIZDe9kUeWdeIobnz92lxS5
   0pWDbuB3h4A65kSd1tE5smw+/pPVVRETqB5m0vYPa6tDm6zYnphx4oiz1
   aQBXYHEGSKMNYW0/ovN+VHc0yWnxrInUFcQ8N+urOcoZqSysxiJduhsaw
   lkAX3RXyURL2CSFGe3NYbfGnYYsv90bUijNAiRu0mdrUCevbVYoaSPEzv
   JUmkwsu5fULYfQcq7obIwrNPOa9cEHdgSgKjP5W6l06T0abHgQxaOLYbO
   A==;
X-CSE-ConnectionGUID: ZljXwiyoQZ+V6WqdXLGLTg==
X-CSE-MsgGUID: 4pVCwvxSQ6KbE6CKF9sVlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80941639"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="80941639"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 00:56:28 -0700
X-CSE-ConnectionGUID: /L0qJNuJRoqkNkh1fsUzAQ==
X-CSE-MsgGUID: +I5pdHsJTym7Mz+MJFKwQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="247980244"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 May 2026 00:56:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTEYR-000000008Es-1jEX;
	Sat, 30 May 2026 07:56:23 +0000
Date: Sat, 30 May 2026 15:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Lukasz Luba <lukasz.luba@arm.com>
Subject: [thermal:thermal/bleeding-edge 23/30]
 drivers/hwmon/cros_ec_hwmon.c:535:10: error: implicit declaration of function
 'devm_thermal_cooling_device_register'; did you mean
 'devm_thermal_of_cooling_device_register'?
Message-ID: <202605301554.S9n45bfQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Daniel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/bleeding-edge
head:   100e27ef9a645f07881160256b7131fb40885215
commit: fe809a49f5cd6e2e0b24bf3c1b1af588b1a19760 [23/30] hwmon: Use non-OF thermal cooling device registration API
config: arm64-randconfig-004-20260530 (https://download.01.org/0day-ci/archive/20260530/202605301554.S9n45bfQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301554.S9n45bfQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301554.S9n45bfQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/hwmon/cros_ec_hwmon.c: In function 'cros_ec_hwmon_register_fan_cooling_devices':
>> drivers/hwmon/cros_ec_hwmon.c:535:10: error: implicit declaration of function 'devm_thermal_cooling_device_register'; did you mean 'devm_thermal_of_cooling_device_register'? [-Werror=implicit-function-declaration]
      cdev = devm_thermal_cooling_device_register(dev, type, cpriv,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             devm_thermal_of_cooling_device_register
>> drivers/hwmon/cros_ec_hwmon.c:535:8: warning: assignment to 'struct thermal_cooling_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      cdev = devm_thermal_cooling_device_register(dev, type, cpriv,
           ^
   cc1: some warnings being treated as errors


vim +535 drivers/hwmon/cros_ec_hwmon.c

   504	
   505	static void cros_ec_hwmon_register_fan_cooling_devices(struct device *dev,
   506							       struct cros_ec_hwmon_priv *priv)
   507	{
   508		struct cros_ec_hwmon_cooling_priv *cpriv;
   509		struct thermal_cooling_device *cdev;
   510		const char *type;
   511		size_t i;
   512	
   513		if (!IS_ENABLED(CONFIG_THERMAL))
   514			return;
   515	
   516		if (!priv->fan_control_supported)
   517			return;
   518	
   519		for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
   520			if (!(priv->usable_fans & BIT(i)))
   521				continue;
   522	
   523			cpriv = devm_kzalloc(dev, sizeof(*cpriv), GFP_KERNEL);
   524			if (!cpriv)
   525				continue;
   526	
   527			type = devm_kasprintf(dev, GFP_KERNEL, "%s-fan%zu", dev_name(dev), i);
   528			if (!type) {
   529				dev_warn(dev, "no memory to compose cooling device type for fan %zu\n", i);
   530				continue;
   531			}
   532	
   533			cpriv->hwmon_priv = priv;
   534			cpriv->index = i;
 > 535			cdev = devm_thermal_cooling_device_register(dev, type, cpriv,
   536								    &cros_ec_thermal_cooling_ops);
   537			if (IS_ERR(cdev)) {
   538				dev_warn(dev, "failed to register fan %zu as a cooling device: %pe\n", i,
   539					 cdev);
   540				continue;
   541			}
   542		}
   543	}
   544	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
