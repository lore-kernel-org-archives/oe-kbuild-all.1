Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1963912C54A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 22:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711321025; cv=none; b=uNk2jNW78BRk5//ITro+BYrTPZA5X8PtcxHNhdp7XWU+qgqhJG3WrWwRwKrSzL/UQkBxk0gX9OVXvqV7/9eUG0ouEdekrtTni70U2slFdRQ53dyVucrFZzqZ1VKSbBzhgCYaBwXEMLZI72YBXN4V4eBsHjSbdhDiqO/Qt29l9fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711321025; c=relaxed/simple;
	bh=9plVV1Cg2RkPJhURCy1Mb1KwEs7f5+6uuGlCWdF9s1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tf51sq8BJYvvPd4P2eV6cY4NGbYRH2bB+a9asMlKfwMeJCAA02uqb5ABlwCFYzq4ppbo08TvGmgjUxzDK6qYl+LY/1CVTmXu/5GW/WNQLbKbxpqO7tLIye7b2e6ZACOSR5GWs/HLBpi7Sx/kaYgFsYc4ACqlkZTLBM8V9ncTKGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIpr5Xzb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIpr5Xzb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711321023; x=1742857023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9plVV1Cg2RkPJhURCy1Mb1KwEs7f5+6uuGlCWdF9s1M=;
  b=SIpr5XzbFys29ZwXiw8vNdHTVWti0x86pOPJK2IZoVhChqlKZ3LgoP4M
   E2bFHC4/IWW+RIQ7sCxDrRiDKDxPVtNzwLuq1bkOyoDAuRAfblPklALiP
   sg6qmL12heDysn5WMslj1uxo8x8X4KcgUF1WDUc654e3E+nOeotYoMgQ/
   y6MZm0noNfSETJjq0vFj3lWJCh8ZpY3Pcr1WA0YpkK/UnoRjlSHLXpcPV
   yt3dFhnaYIznav+eVaTVPe3o/aEJDCIM27RZJUdfAIgps5hS/SgGElI2R
   gmsrnxBuYPB0XVKRjsQinKXv4Z9NRXUwseuk2hJac80QGpyukJQoXWpR+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6430511"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6430511"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 15:57:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="20109673"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Mar 2024 15:57:02 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roWlu-000M3L-2f;
	Sun, 24 Mar 2024 22:56:58 +0000
Date: Mon, 25 Mar 2024 06:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29921/30000]
 drivers/net/dsa/mv88e6xxx/chip.c:2320:25: error: implicit declaration of
 function 'mv88e6xxx_g2_eeprom_wait'; did you mean 'mv88e6xxx_g2_pvt_write'?
Message-ID: <202403250650.sQ1xsBky-lkp@intel.com>
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
config: x86_64-randconfig-012-20240323 (https://download.01.org/0day-ci/archive/20240325/202403250650.sQ1xsBky-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240325/202403250650.sQ1xsBky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403250650.sQ1xsBky-lkp@intel.com/

Note: the openeuler/OLK-5.10 HEAD b670dd901cbbf97745380d373b1d2607b3235590 builds fine.
      It only hurts bisectability.

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
