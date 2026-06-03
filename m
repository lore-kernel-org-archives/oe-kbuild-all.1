Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D293FE645
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 07:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471816; cv=none; b=ckXRLJBuONE098CLFO/dGnfZLr2sTt7tkL6NiuIJ+jMHMJnDUeedtdl5tZoAP6q19HGjzB192tP5lOZpkfVM9yW0qWjsbhmVsTod6NjnjUN2LcU100elIFU+43ucaCyBGUT06i8EQwCuOl+E4uBhA4JZVTMb75v6mdNA05MM/N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471816; c=relaxed/simple;
	bh=5bYixKYpjwj7ZPAY12sOz2MO4Mz6K6pNDdTt2VRewjE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dXehiz6pTqlx2i121JUE/EV74VQHmdAJtjSgXP5hZnZxzcyZVoAz5avov7ClbZ5hfOKUbYPpeQ/YEK3gsucQxBo/FLkTUGlpGEznDYqbekXOFNVCOxhihLWCDWwc+Xq3amq/kEXFRP+IVxwmi9miN+HAK93Ha4/0lbbL8EOiTo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k001IC8Z; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k001IC8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780471811; x=1812007811;
  h=date:from:to:cc:subject:message-id;
  bh=5bYixKYpjwj7ZPAY12sOz2MO4Mz6K6pNDdTt2VRewjE=;
  b=k001IC8Z++mbHF///59uWVaLw5VbIfFlIU2e8ROU0BG1IxxqYRsOGVJl
   xKqMVLSCtQ4MsSB37xeCQBMXU6ZFJIKSP3Ji3vnu0VVC/gPHwi2CuFHiV
   ZfvEycaTg9eyhuw0txMqteZ0Y1XuVGxVPePO4Jt2ZE7AtnEgRboiBXcm/
   xpQP7leXjystWKJ/r66CCZcUCwfg+mVYd40F/iRsia4/rRLkVjaS3nkmd
   MWwAPvCq69kJoz1yL2XS3MZuSFlgM3BJT4nsWlMhrzWiWD6t3CSIkuuZq
   kyUZCMkBbBSZ9anCrYuB0DjnYHU+9A/gWCyPSdZSwjutwUXAd3XcUBBXz
   Q==;
X-CSE-ConnectionGUID: breFyI/8ShiDEEmSfZLkYw==
X-CSE-MsgGUID: DbQCm1X9RhCnGh8Ta3Rq7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="68812191"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="68812191"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 00:30:06 -0700
X-CSE-ConnectionGUID: Ek7aCIJgSFOtBAKBrwOrqQ==
X-CSE-MsgGUID: wR2wib4HREiAfuj9IW0Xsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="243286328"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Jun 2026 00:30:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUg37-00000000D5G-3EPZ;
	Wed, 03 Jun 2026 07:30:01 +0000
Date: Wed, 03 Jun 2026 15:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 239/239]
 drivers/net/dsa/mv88e6xxx/chip.c:2320:4: error: implicit declaration of
 function 'mv88e6xxx_g2_eeprom_wait'
Message-ID: <202606031526.CfjggVRI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Fabio,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   3b23bcc6f8584d5e2404df6e37244321a1ba778c
commit: d44346dda7d4faca4a64b6233a3ea0a09dc615e4 [239/239] net: dsa: mv88e6xxx: Avoid EEPROM timeout when EEPROM is absent
config: i386-buildonly-randconfig-006-20260603 (https://download.01.org/0day-ci/archive/20260603/202606031526.CfjggVRI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031526.CfjggVRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031526.CfjggVRI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/mv88e6xxx/chip.c:2320:4: error: implicit declaration of function 'mv88e6xxx_g2_eeprom_wait' [-Werror,-Wimplicit-function-declaration]
    2320 |                         mv88e6xxx_g2_eeprom_wait(chip);
         |                         ^
   drivers/net/dsa/mv88e6xxx/chip.c:2320:4: note: did you mean 'mv88e6xxx_g2_pvt_write'?
   drivers/net/dsa/mv88e6xxx/global2.h:457:19: note: 'mv88e6xxx_g2_pvt_write' declared here
     457 | static inline int mv88e6xxx_g2_pvt_write(struct mv88e6xxx_chip *chip,
         |                   ^
   1 error generated.


vim +/mv88e6xxx_g2_eeprom_wait +2320 drivers/net/dsa/mv88e6xxx/chip.c

  2306	
  2307	static void mv88e6xxx_hardware_reset(struct mv88e6xxx_chip *chip)
  2308	{
  2309		struct gpio_desc *gpiod = chip->reset;
  2310	
  2311		/* If there is a GPIO connected to the reset pin, toggle it */
  2312		if (gpiod) {
  2313			/* If the switch has just been reset and not yet completed
  2314			 * loading EEPROM, the reset may interrupt the I2C transaction
  2315			 * mid-byte, causing the first EEPROM read after the reset
  2316			 * from the wrong location resulting in the switch booting
  2317			 * to wrong mode and inoperable.
  2318			 */
  2319			if (chip->info->ops->get_eeprom)
> 2320				mv88e6xxx_g2_eeprom_wait(chip);
  2321	
  2322			gpiod_set_value_cansleep(gpiod, 1);
  2323			usleep_range(10000, 20000);
  2324			gpiod_set_value_cansleep(gpiod, 0);
  2325			usleep_range(10000, 20000);
  2326	
  2327			if (chip->info->ops->get_eeprom)
  2328				mv88e6xxx_g2_eeprom_wait(chip);
  2329		}
  2330	}
  2331	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
