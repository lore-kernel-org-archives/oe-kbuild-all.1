Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A0D1B27D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 19:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718566897; cv=none; b=t6u6R0dzUbssBNhnGPHH20NYsHTP/fPmFWftl6lapHD+Dg/yQwaggu+fVAbdMbLUSjBQck1ZgcQzWYCr+pLYrSqixyreS5zKmRXGHiv1XfAa0BPibFBtI0tRvV7sXsWedjXMWaNjKhtu460jZMV1nky3xKGiW/gTwWiDEiVcemo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718566897; c=relaxed/simple;
	bh=rqeQz1qG03Ftwh/pEpY/ALl9DQMKoDhnk5an/qE6AK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N71ReZ3RTwJHe36zMsnnX46t1/Uw7D55RePyfzC6ITUajtFUUPXPQdkhygxf9uemnsr20XWjcKmid/8mXS280MpOlHKnbUMbV1AOhks7XnK4lWUjrx3Hl1kQe3w76sX45Zi8WLjOHsgZOw48ggj38XH5VPUmSgWpS7kQEZMVmW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ff8UuxdF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ff8UuxdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718566895; x=1750102895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rqeQz1qG03Ftwh/pEpY/ALl9DQMKoDhnk5an/qE6AK0=;
  b=Ff8UuxdF03K12lAQXyup+5JOdTY/bvjCpAYySdhimbNTAnyRR6xkDswX
   xKopejs0fmPqFVBuBst+ATnhGZjIJdqoLcncixwyGmTX5Pi72wW0908H1
   4QI5OrB1uiLj+SxJjFa06NemKcyJwnIzJXClTS7kW3bf0MOWFWP+R6DAj
   g7RaQylGpcfW1dQitZQ3lk9Ze5723nU/lGFgcz1uo07HCi3b6jYDPfV8n
   Zs7S8p6PXPhqaiQ1b3/ci58i2shGsV6RL5zo0zdS8vJOl3I0SznkNa3MV
   3q08quoR6h1XOhPWDTe0G9xvK04SsLrLmgErzJTYsqXtMLflk6S2B9R6Y
   A==;
X-CSE-ConnectionGUID: f1mgPvxJSQ+27TM6fpRhhg==
X-CSE-MsgGUID: Q3PcVfHfT72VYgl73x1QAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26075897"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="26075897"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 12:41:35 -0700
X-CSE-ConnectionGUID: 9K9zhw3SS3C0RdN67zWIgw==
X-CSE-MsgGUID: s1fVN3bZQze03Tr8+rRCOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="72215650"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jun 2024 12:41:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIvkq-0003DL-17;
	Sun, 16 Jun 2024 19:41:32 +0000
Date: Mon, 17 Jun 2024 03:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.10-rsslro 2582/2587]
 drivers/net/phy/aquantia/aquantia.h:205:94: error: expected ';' before '}'
 token
Message-ID: <202406170342.l4ifciLD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.10-rsslro
head:   eb3136f791cd4e799431e1050a94b2b25b20dc0d
commit: b7efc711a9edfbc427f07e5542fdad6030468d22 [2582/2587] net: phy: aquantia: add support for PHY LEDs
config: sh-randconfig-001-20240616 (https://download.01.org/0day-ci/archive/20240617/202406170342.l4ifciLD-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170342.l4ifciLD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170342.l4ifciLD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/phy/aquantia/aquantia_hwmon.c:14:
   drivers/net/phy/aquantia/aquantia.h: In function 'aqr_phy_led_polarity_apply':
>> drivers/net/phy/aquantia/aquantia.h:205:94: error: expected ';' before '}' token
     205 | static inline int aqr_phy_led_polarity_apply(struct phy_device *phydev, int index) { return 0 };
         |                                                                                              ^~
         |                                                                                              ;


vim +205 drivers/net/phy/aquantia/aquantia.h

   202	
   203	int aqr_phy_led_polarity_set(struct phy_device *phydev, int index, unsigned long modes);
   204	#else
 > 205	static inline int aqr_phy_led_polarity_apply(struct phy_device *phydev, int index) { return 0 };

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
