Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271D82673AA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 19:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766432714; cv=none; b=KB2tTJwTjM0spKhzV1Gstr0ubyxOU5O/FgrRnNU+a8LtPz/xCL2BcetP9KV2OWvPs6tYUtGkwVLJ+tr0ByytYotddxXQM8/8Wc7TgK8ZMFdxEdGckzpSWHKg6CoMkTNXpDIi5lqBFYw7OsRSAMai94hv6CXZYMCmq/xOOHxD7Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766432714; c=relaxed/simple;
	bh=kRk6snx4U2T6YxqU6RtAER6LfTC3iRfBokqvWR6EHsk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nwijllc23/qtAmZep/Y0H1m3rJVgc9egtmNxutWA+xaxZO+khfXUiAloo+Oik+DemY8T0q0xtrB1RMsddKuhF34ztj9tM0jVCEE+uTm4aV8gWHsLU5ANe2WoO1gJ+IBjMf7T7gV81k1cFG7SUgbgcIVZJR2IZXzn6FUZqP7WNkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SlCSWD/q; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SlCSWD/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766432712; x=1797968712;
  h=date:from:to:cc:subject:message-id;
  bh=kRk6snx4U2T6YxqU6RtAER6LfTC3iRfBokqvWR6EHsk=;
  b=SlCSWD/qAUTMEV7J3oEeJ6gTcISTiGlQY10aTBn8NoBVRfaqorVdGABl
   k1EMTjI+ZLGE1JhbhrI1k7TmKvHb+rUJkfc9VwFlkML2RxErUZUzO67ng
   BzDYNSiXh7B8kjBxmnoqfS9JGSydoMN/oXJiEgg36euuHoY2fvIV6gOSV
   CaCmfhbSnDikA438Tyw7WFythrMxO27DV0AFZIMvYjoM7qjnOs/3FaJUc
   ZXf72JVOwOp3iQR7PzMBjKTd4fvxhz2YW7l63yXYvSR1kKLGdxzARuSIF
   7+9NrJ2aNMix6KG4cNyqeoVXf/Dzi+afo3rcUBkbnI2Oefd09QsQZ/V19
   A==;
X-CSE-ConnectionGUID: A3hrVKfTQ62R2vs27ytd9g==
X-CSE-MsgGUID: KYK/xHRmR0GkkG6z/AdtCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85875493"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="85875493"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 11:45:12 -0800
X-CSE-ConnectionGUID: u2pKaiUnTbmrdalJ3GLZSg==
X-CSE-MsgGUID: lHvYNNuYQlelNfsQXbuE0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="230257385"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Dec 2025 11:45:10 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXlq5-0000000013P-1Cud;
	Mon, 22 Dec 2025 19:45:05 +0000
Date: Tue, 23 Dec 2025 03:44:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3418/3418]
 drivers/net/dsa/mv88e6xxx/chip.c:2320:25: error: implicit declaration of
 function 'mv88e6xxx_g2_eeprom_wait'; did you mean 'mv88e6xxx_g2_pvt_write'?
Message-ID: <202512230339.KxFb5dKg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Fabio,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: 02956abc74ede6549249eb21e5b319b92dd147f3 [3418/3418] net: dsa: mv88e6xxx: Avoid EEPROM timeout when EEPROM is absent
config: x86_64-randconfig-012-20251217 (https://download.01.org/0day-ci/archive/20251223/202512230339.KxFb5dKg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230339.KxFb5dKg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230339.KxFb5dKg-lkp@intel.com/

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
