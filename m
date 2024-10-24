Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E7023CB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 08:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729759428; cv=none; b=Vu8nlRNaxZnNuBX8Hi9JSsePcS+WbdiTxUxxUr2jVlVRFu11jXCAn/REA7ZF7+jBguow97a1zZ3nCrly3xM9qiVDAxJIRcIX7oVriFvZtEatOBoUn/5B+/2o+zt6pin5aBmGAbd3xfPzlfkv8zBXwUInwO9ImeiQIQeli9rWYVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729759428; c=relaxed/simple;
	bh=JqYHSguQE/DtelMwXsN6tZ3U28cVJzVnLLM/6zSC7wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lQswp66mIuS0bkzQpx1s6EwyU1kbEHysQtkM3CR+iC0azn2uVaoMJ5i4Ap4m/RTHcGs6Jaw79v8k6Wo0ge7MKaF+6U+Jt1GTXz2ircw6069QOVUvNpQ4YOsyckAzJCo/c+nQh8vO27cS3j2jm9EU2J5CC29KHrow4Z3cWwzb6jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ri438wfH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ri438wfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729759426; x=1761295426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JqYHSguQE/DtelMwXsN6tZ3U28cVJzVnLLM/6zSC7wQ=;
  b=Ri438wfHqr5QllfSag03abmQUPEpqdXNnLJQl1J1ClRsmyH5zc2YTml9
   KVNiYa5hh7ZgRRpm2ft4WhqZ1EfhOsfhke+7CFp0OEhi5cxqve8zSHAxQ
   bCxmWoiKRH9uEXgjAwZOnvFcavayP+TkwO5EFIoaGFQbiDX04e3JhjCMH
   PoL6nr4plsAkbvfePiVWUqAkTNIbaqyMtuC/cShVssBCP4l05Oxqe6h/v
   z9bjdUMV1Ay7NhtsYqM0k5o+G70Tn/xVle1UobtdrpS8shmIsMDtaL8FI
   Cy68+PS3sFVWgTZFCaatOxjSFgxuhCkCpATf74KTOtI0W8bh+CJz/rE47
   g==;
X-CSE-ConnectionGUID: r49ZqSWNSUOo1KpxEZtCnw==
X-CSE-MsgGUID: 39MjxBxvR2iOc1/Qd0z2eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29307006"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29307006"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 01:43:45 -0700
X-CSE-ConnectionGUID: 3EwSwSToQnCnSf2erCdwLg==
X-CSE-MsgGUID: neWJWKnEQzaGJN4xDOUjpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="81345236"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Oct 2024 01:43:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3tRW-000WAu-0S;
	Thu, 24 Oct 2024 08:43:42 +0000
Date: Thu, 24 Oct 2024 16:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 24216/30000]
 drivers/net/dsa/mv88e6xxx/chip.c:2320:25: error: implicit declaration of
 function 'mv88e6xxx_g2_eeprom_wait'; did you mean 'mv88e6xxx_g2_pvt_write'?
Message-ID: <202410241622.JPCqkyC5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fabio,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5faf5aae71283199f69c2a60ed91ab2847f3ffd8
commit: 02956abc74ede6549249eb21e5b319b92dd147f3 [24216/30000] net: dsa: mv88e6xxx: Avoid EEPROM timeout when EEPROM is absent
config: x86_64-buildonly-randconfig-006-20241024 (https://download.01.org/0day-ci/archive/20241024/202410241622.JPCqkyC5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241622.JPCqkyC5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241622.JPCqkyC5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/dsa/mv88e6xxx/chip.c: In function 'mv88e6xxx_hardware_reset':
>> drivers/net/dsa/mv88e6xxx/chip.c:2320:25: error: implicit declaration of function 'mv88e6xxx_g2_eeprom_wait'; did you mean 'mv88e6xxx_g2_pvt_write'? [-Werror=implicit-function-declaration]
    2320 |                         mv88e6xxx_g2_eeprom_wait(chip);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
         |                         mv88e6xxx_g2_pvt_write
   cc1: some warnings being treated as errors


vim +2320 drivers/net/dsa/mv88e6xxx/chip.c

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
