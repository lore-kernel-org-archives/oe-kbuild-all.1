Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0542003C7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 11:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731496565; cv=none; b=ZwTfX4rFnl3m00BReGa2xb3XRdc/QV+r/ulpRYugyXxLX+hmCjVfLfddSoAHn3TSczfBD0nCiVM2uoEMAznva83SmjUMwepgJIxCCKB3ft7rMmjFDIIiu0tfNw2HxPGVZ9hxLFdsFZV0RYDNfYJthikFaJByjhuiW9b+nWfwuOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731496565; c=relaxed/simple;
	bh=nrtgNRE9MOFy1BqD2xWQGMutdHuHOBJBdBcJ7OuiPmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O6RI4vPuQeXcM4RUU0jbO1/8mGtP8+rQ0IooE/LLf75A/Aay03EnFDB2RQmtIgOQPx/NAiZBd0Uvbxcwqiehsc6cRiYR/9aO3C/DgT96BmIrWo0IB5AV1ncA++zjESNwKimfvm1iwMJz7uUh1SJeJjB3DCRuTeHjitFU7FLUhy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LtQd18Is; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LtQd18Is"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731496564; x=1763032564;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nrtgNRE9MOFy1BqD2xWQGMutdHuHOBJBdBcJ7OuiPmk=;
  b=LtQd18IsD90Vgs5qDqBf8iXArArGPyKbDQjeAd48LKZtAgmgtse5QJ9H
   vI+x6ktWvvAH8T1MAa1tpI4DdxGQ97XwD0oZ6cInfiS1UADQdDjenkwcJ
   xi/0Or7cLotzC2klOAKqWhJkpXmmJU0AtGLA/51cqrLOo02RpZ2B7xn7F
   D6finzc27TgoSnZFK25Cyix8hJ9atsIhD0Lq3fsXfGvx/9p7PLcevI8L0
   sCvO4wks3zn6CDTuCilNSBOD7GYtkOy4Vt0mf0ofsmrUxSP8gNk/2TsJ5
   hWMaB+t2DRXDMgMt+ZUViLn/0iTV8vpS90MywCn+2gY5fLvc9/W92UklW
   g==;
X-CSE-ConnectionGUID: twCZwLZtSEqofCTeJIqzGw==
X-CSE-MsgGUID: MbQ7gbPFSUusRZhTYqdo0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41944517"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41944517"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 03:16:01 -0800
X-CSE-ConnectionGUID: ykmdKmCIRbmCbzmMaPTdng==
X-CSE-MsgGUID: GumVhjaARzKjwIU3dLWFeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="92774445"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2024 03:16:01 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBBLq-0000IB-0F;
	Wed, 13 Nov 2024 11:15:58 +0000
Date: Wed, 13 Nov 2024 19:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hwmon-thermal 2/2]
 drivers/hwmon/hwmon.c:291:25: error: implicit declaration of function
 'thermal_zone_device_update'; did you mean 'thermal_zone_device_disable'?
Message-ID: <202411131906.J2o0Lxqx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hwmon-thermal
head:   62f918135d3a460bea6c9e74d19af6af41602ed3
commit: 62f918135d3a460bea6c9e74d19af6af41602ed3 [2/2] hwmon: (core) Avoid ifdef in C source file
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20241113/202411131906.J2o0Lxqx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131906.J2o0Lxqx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131906.J2o0Lxqx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/hwmon.c: In function 'hwmon_thermal_notify':
>> drivers/hwmon/hwmon.c:291:25: error: implicit declaration of function 'thermal_zone_device_update'; did you mean 'thermal_zone_device_disable'? [-Wimplicit-function-declaration]
     291 |                         thermal_zone_device_update(tzdata->tzd,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         thermal_zone_device_disable


vim +291 drivers/hwmon/hwmon.c

44e3ad882bb268 Akinobu Mita     2020-05-04  280  
1597b374af2226 Guenter Roeck    2020-05-28  281  static void hwmon_thermal_notify(struct device *dev, int index)
1597b374af2226 Guenter Roeck    2020-05-28  282  {
1597b374af2226 Guenter Roeck    2020-05-28  283  	struct hwmon_device *hwdev = to_hwmon_device(dev);
1597b374af2226 Guenter Roeck    2020-05-28  284  	struct hwmon_thermal_data *tzdata;
1597b374af2226 Guenter Roeck    2020-05-28  285  
62f918135d3a46 Thomas Weißschuh 2024-11-13  286  	if (!IS_ENABLED(CONFIG_THERMAL_OF))
62f918135d3a46 Thomas Weißschuh 2024-11-13  287  		return;
62f918135d3a46 Thomas Weißschuh 2024-11-13  288  
1597b374af2226 Guenter Roeck    2020-05-28  289  	list_for_each_entry(tzdata, &hwdev->tzdata, node) {
1597b374af2226 Guenter Roeck    2020-05-28  290  		if (tzdata->index == index) {
1597b374af2226 Guenter Roeck    2020-05-28 @291  			thermal_zone_device_update(tzdata->tzd,
1597b374af2226 Guenter Roeck    2020-05-28  292  						   THERMAL_EVENT_UNSPECIFIED);
1597b374af2226 Guenter Roeck    2020-05-28  293  		}
1597b374af2226 Guenter Roeck    2020-05-28  294  	}
1597b374af2226 Guenter Roeck    2020-05-28  295  }
1597b374af2226 Guenter Roeck    2020-05-28  296  

:::::: The code at line 291 was first introduced by commit
:::::: 1597b374af22266266e1e20612208c4b11359ad4 hwmon: Add notification support

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
