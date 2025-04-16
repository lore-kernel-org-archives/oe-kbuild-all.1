Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5767724BBE7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 23:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744847108; cv=none; b=euaojAZSnf+BFnf9gItDNsi2TS6F4BlMIG4iabk5pwcwro3Z/qrzxP+NwJ/2N9OUD6Ec+dYGvgwSFRCl8bj7DKXEHPvFkuGOGCpyGqc6n2ADuMG4qOA0sHJNXinj67BVCDi6MeOfwVbBCeI+9GCZDWB+wYaLOmbL0sobbufx/E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744847108; c=relaxed/simple;
	bh=ok/SlHOarrQEaJ1bUVc+h+Fdae77dwOTrnazE59ZgKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DNLepDDSj3cRYlAwvdvDouhrkPLRrFSK53aXgm7OShEE80f5nKiLBTTKQQJW1Cu1o0RsPbpuG/on+3iG6YmrG7RYkChKpgBCua9rWDBlJNYLbQW79YKfVdSTtjDRGA4fkfC4rhzi3Cdv2ACaVxr2vMi7pDsyoL3tVLTx7nzztug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gf8CGl52; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gf8CGl52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744847107; x=1776383107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ok/SlHOarrQEaJ1bUVc+h+Fdae77dwOTrnazE59ZgKM=;
  b=Gf8CGl52M3/EbSDY6nZM4dcKo6UPez5o3AK4YNl1P7UstA3li8gWOFg9
   lelbdkaK7Zdenaaml8U/Sx5HrRRhvpvGEHXHz4AJl0lHeJvmTdRkRtNOI
   2i/u8tg6BvRP1D4enscLVlGt1uMgeTIKXD/AwiHBPqcLYh6w6Jv0qGHeP
   Y+ZHwWSpYxT+kiOiekL5YyWL/A8ngLbcOzgmyzqIFQys4EhUV/MPWaFHp
   9UDyez8GDvRLCGqeKUXQpdKiWDOgUeF6mkUW7bziehom1dn9mcuapuqao
   a38eMgSD7U8ACRSO5EjHDnH/AbUwwzmXCkCeCygXeTp2JIQ1fmTIucJDA
   g==;
X-CSE-ConnectionGUID: rhwfNQ/LSUGRin3H+bCogA==
X-CSE-MsgGUID: nFqHdP3yQ4CeXBppD2HyCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57789979"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="57789979"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 16:45:04 -0700
X-CSE-ConnectionGUID: 6VN+rXf0RiymaJYLkrOduA==
X-CSE-MsgGUID: k4wvyHo3QXaDQ7+TGMwvqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="161671228"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Apr 2025 16:45:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5CR9-000KSc-33;
	Wed, 16 Apr 2025 23:44:59 +0000
Date: Thu, 17 Apr 2025 07:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.15-rc1-next-next-inband 24/24] kismet: WARNING: unmet
 direct dependencies detected for KEYBOARD_GPIO_POLLED when selected by
 ZII_RAP
Message-ID: <202504170745.McXRv9EV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.15-rc1-next-next-inband
head:   9e2d85243a79cbf10ea6538b605260e3199fda1a
commit: 9e2d85243a79cbf10ea6538b605260e3199fda1a [24/24] platform/x86: Add Zodiac Radio Access Point platform driver
config: x86_64-kismet-CONFIG_KEYBOARD_GPIO_POLLED-CONFIG_ZII_RAP-0-0 (https://download.01.org/0day-ci/archive/20250417/202504170745.McXRv9EV-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250417/202504170745.McXRv9EV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170745.McXRv9EV-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED when selected by ZII_RAP
   WARNING: unmet direct dependencies detected for NET_DSA
     Depends on [n]: NET [=n] && (BRIDGE [=n] || BRIDGE [=n]=n [=n]) && (HSR [=n] || HSR [=n]=n [=n]) && INET [=n] && NETDEVICES [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for IGB
     Depends on [n]: NETDEVICES [=n] && ETHERNET [=n] && NET_VENDOR_INTEL [=n] && PCI [=n] && PTP_1588_CLOCK_OPTIONAL [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for PINCTRL_SX150X
     Depends on [n]: PINCTRL [=y] && I2C [=n]=y [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for RTC_DRV_DS1307
     Depends on [n]: RTC_CLASS [=y] && I2C [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for EEPROM_AT24
     Depends on [n]: I2C [=n] && SYSFS [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for MMC_SDHCI_PCI
     Depends on [n]: MMC [=y] && MMC_SDHCI [=y] && PCI [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for NET_DSA_MV88E6XXX
     Depends on [n]: NETDEVICES [=n] && NET_DSA [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for PHYLIB
     Depends on [n]: NETDEVICES [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for DS1682
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for MDIO_BITBANG
     Depends on [n]: NETDEVICES [=n] && MDIO_DEVICE [=n] && MDIO_BUS [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for I2C_OCORES
     Depends on [n]: I2C [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED
     Depends on [n]: INPUT [=n] && INPUT_KEYBOARD [=n] && GPIOLIB [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for MARVELL_PHY
     Depends on [n]: NETDEVICES [=n] && PHYLIB [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for MDIO_GPIO
     Depends on [n]: NETDEVICES [=n] && MDIO_DEVICE [=n] && MDIO_BUS [=n] && MDIO_BITBANG [=y] && (GPIOLIB [=y] || COMPILE_TEST [=n])
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
