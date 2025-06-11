Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE7843147
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 02:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749607836; cv=none; b=phxgVuNMXKFkc9Itb5WBQhCbuHt1o2z12bahM/Tgmjy03OeuhzXOtM8Lv9T33Pcq/h+lhFWAMhQiFsiczjt1u4Uf7VxwBqhv15Rx/51VWuSnKgPYz5ORJmJu4yhJUCDLQp16ZF8ys9eratyMBMH5K911+jFrKpt5PzDlspynaoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749607836; c=relaxed/simple;
	bh=Hd0I/GEXcRtkCQdIuDp/oUXNGhK6Knhmxn4YFuPXrX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VaEa25HgiGZrLCSYUOQ9438YGDsCZsR3htK+WE//xm2qNN0ItUkRDAnPG17Vdu6ox1xdeSOA9xECR1bTKhJpUpz15UAOIleotSzUwImp8BMhcpznyedktUUlcMeZ2c061x2IIXMCQwNZKFgVPqJh3jZblaqAHUhXBhu7FJieUpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnAfYzWm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnAfYzWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749607834; x=1781143834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hd0I/GEXcRtkCQdIuDp/oUXNGhK6Knhmxn4YFuPXrX0=;
  b=SnAfYzWmiSztzm3BZbXC5whtYp/gZlfi0ZNPuD42JTeia/KexYRJHRym
   D66VJwS8Xcpf1smWNOfMIIyYjtHHjvg3MJQD2PSP9Y64TIZrBarpUdLE8
   SDN1kvyIrzsA4mZiHkNeCopJWFtRYlrsc74qX48oHwImos6kTca9nNhTp
   8I+nb/MRG+KjyUbJo6dFoIczjW8Ov9IPOxP04mm4+htyjMRqRxwsRrbtk
   /nOJIHDVCdmhGJK5HPtD/ZFM0MOvLMfgZmUvgIX2Llzx0bgBEO7DtmIrx
   57ucBkrW1UCz6BwkPgjVgBIuOw82+BbdCQwTb4abxNL4wI52WW6yYNRGo
   g==;
X-CSE-ConnectionGUID: tUeMgD52R9uJWZnvQ7wLVw==
X-CSE-MsgGUID: J47ntvwqQlmx2VzQyVRlgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="63089342"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="63089342"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 19:10:33 -0700
X-CSE-ConnectionGUID: tNyBSmbtQ5efPPIM3/aESQ==
X-CSE-MsgGUID: kbsdFL3kS4y8hIxMIjrVBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="146889178"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jun 2025 19:10:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPAv8-0009nN-2D;
	Wed, 11 Jun 2025 02:10:30 +0000
Date: Wed, 11 Jun 2025 10:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2954/2954]
 drivers/net/dsa/mv88e6xxx/chip.c:2320:25: error: implicit declaration of
 function 'mv88e6xxx_g2_eeprom_wait'; did you mean 'mv88e6xxx_g2_pvt_write'?
Message-ID: <202506111048.RGaU4PH0-lkp@intel.com>
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
head:   90ff3e07cc268a8e40bd578dcc4907a3db419c52
commit: 02956abc74ede6549249eb21e5b319b92dd147f3 [2954/2954] net: dsa: mv88e6xxx: Avoid EEPROM timeout when EEPROM is absent
config: arm64-randconfig-r133-20250610 (https://download.01.org/0day-ci/archive/20250611/202506111048.RGaU4PH0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250611/202506111048.RGaU4PH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111048.RGaU4PH0-lkp@intel.com/

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
