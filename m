Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB311EB5B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 16:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711210326; cv=none; b=U7lMHueNheA9OS6cB+gIs8QI0i0mQlxMn9Rqq0IQBrNf+m0rmbeYjoLFvgx3g226wQtgb0fEpYK67ZQjnt5HFcXyP/Rbz7ye74Ho9nB2W4qBAHJ6GP4NCI0r6gfzcNOxdZ/2rfwfMqdBgXPyeufm+/dY+CWh1TV5Qp/Pc9vd+VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711210326; c=relaxed/simple;
	bh=qRvNwPdX/rOHfzL+/I6pdIxLJpMPCWODdaOcErgcmGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=skLvW1KXT1aV5deuyXdSzjsVEIQgoEqePufyYnNcC0VzdhrcAqYG9S1kFDyHqedCLjo2x6AHCsXi5pguu6OmV4UPQApxycV0bIOjVyZsZYRcOxEEosMvs1vEaA76ZUbgrJNJDrDvIrP96Jb2iy2x1FM36T8qwPRYpzyloDAQsOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MS7lt0Jz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MS7lt0Jz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711210325; x=1742746325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qRvNwPdX/rOHfzL+/I6pdIxLJpMPCWODdaOcErgcmGI=;
  b=MS7lt0JzjQudhocF5gCTizm41jc45oju3k9//FY3EnXLYhvfo5zGcba6
   RCEKdPLu4RW0Fc1S+9i8aipghg8Lkv/cYf+Nm9CvgmtP9O8dWwkxRphBy
   rRmUm/2Xc3OgPX/Eocx1GMVOwgk+mnRdiNN3G11X35d6uWpRa+maSKZlN
   ptOIU2elq+nYmQ2S0dpPl4orcZ1ALytxsEesOlctxa9/Tx7rzVOnD5vUo
   knVVK4QpIironO+jKC1eUsJSxaKNHiLJHdOGGmGj7QGT2xJCCULOqjAQw
   PJ4QC/T4yUk4AEALZjOJXKfBARfqXIVgyyJmT6TvdMpwOMpjovOZS9vqy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="10026429"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="10026429"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 09:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="15610947"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Mar 2024 09:12:03 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro3yT-000LHb-03;
	Sat, 23 Mar 2024 16:12:01 +0000
Date: Sun, 24 Mar 2024 00:11:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29921/30000]
 drivers/net/dsa/mv88e6xxx/chip.c:2320:4: error: implicit declaration of
 function 'mv88e6xxx_g2_eeprom_wait'
Message-ID: <202403240020.k6ATfsBm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b670dd901cbbf97745380d373b1d2607b3235590
commit: 02956abc74ede6549249eb21e5b319b92dd147f3 [29921/30000] net: dsa: mv88e6xxx: Avoid EEPROM timeout when EEPROM is absent
config: x86_64-randconfig-071-20240323 (https://download.01.org/0day-ci/archive/20240324/202403240020.k6ATfsBm-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403240020.k6ATfsBm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403240020.k6ATfsBm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/mv88e6xxx/chip.c:2320:4: error: implicit declaration of function 'mv88e6xxx_g2_eeprom_wait' [-Werror,-Wimplicit-function-declaration]
    2320 |                         mv88e6xxx_g2_eeprom_wait(chip);
         |                         ^
   drivers/net/dsa/mv88e6xxx/chip.c:2320:4: note: did you mean 'mv88e6xxx_g2_pvt_write'?
   drivers/net/dsa/mv88e6xxx/global2.h:457:19: note: 'mv88e6xxx_g2_pvt_write' declared here
     457 | static inline int mv88e6xxx_g2_pvt_write(struct mv88e6xxx_chip *chip,
         |                   ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


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
