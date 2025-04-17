Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714DE3208
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 06:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744871838; cv=none; b=XnYJDE1eHvnkdrGRNtN5CqAJJhqkxFWzMC587J6tTR441z1sbWtOiJShyANEyEHPUWQ+n1MOr8WNwstImB82okgAStkl+akmYGHkZaKGrc1F3OJHcQUUQuIYVjKbej50Cb6CZ87XFQSqEw1vAKgzzzlzWaIMbQh+hD3TQLU6kHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744871838; c=relaxed/simple;
	bh=lYj5cnuoOe5nnKW8efOJXWRkxkxdcE05L2ABwC7hzwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OMwCj3sE7O/YIHgUQUy+VftJdz7ye2A3bMRi4GC0FX5oVDOLwoT2FIKahQXQ0c30cNpW6CSDTbbKfubv9A3Ykisr3037ARkJMY3x0kLXpquA9W2XbP6nUDHzIREgCCXkeHge0OSBIe4rqUA8nltU+d/DYWeWFe6Nh/8OkmTCc7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIyYQwBe; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIyYQwBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744871837; x=1776407837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lYj5cnuoOe5nnKW8efOJXWRkxkxdcE05L2ABwC7hzwg=;
  b=ZIyYQwBeR/2A/LmSmW/XzpIaORVewbRy1/UdJS6Xv5bokh79NUD1ha1R
   rmExkAZB5LTtQJt8+OwgytdsHbITd/YdSsIL5iYBjNcXNktvd1xxP5+vL
   nMDr8Y2ZJCWEVZ1qjjfkwslTm2zqJeMdz56hbsGlKoGk3tIEjmC8zzwwp
   mvF3K9+aAzm9wTTZRYR1AsbgZGDTFG7Z8JWjBk4x2lWiV2CbQfSFeevHe
   3PncTKbAkjFSib8K5nM4nlJgGFifr7XvLBlB1c5YwPhhuNJ4Fogrhf9bD
   Y9WnxwjVjNGChW5bfbogQF0S++YMSr3sDRzjMd7SOXiejbLBxteMWYQGa
   w==;
X-CSE-ConnectionGUID: 5rFdqNJ+Rfe3E3EASIhaAw==
X-CSE-MsgGUID: rvVaBtiVRv+nPfZuXBga0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="56627595"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="56627595"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:37:17 -0700
X-CSE-ConnectionGUID: rjcnqMpdTUeAiEyGhdItew==
X-CSE-MsgGUID: ATpEVh+sQSKHdz+vthI4sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="130665930"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Apr 2025 23:37:14 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5Is4-000Lcq-0b;
	Thu, 17 Apr 2025 06:37:12 +0000
Date: Thu, 17 Apr 2025 14:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.15-rc1-next-next-inband 24/24] kismet: WARNING: unmet
 direct dependencies detected for MDIO_GPIO when selected by ZII_RAP
Message-ID: <202504171448.wB5ORzf5-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_MDIO_GPIO-CONFIG_ZII_RAP-0-0 (https://download.01.org/0day-ci/archive/20250417/202504171448.wB5ORzf5-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250417/202504171448.wB5ORzf5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171448.wB5ORzf5-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MDIO_GPIO when selected by ZII_RAP
   WARNING: unmet direct dependencies detected for NET_DSA
     Depends on [n]: NET [=n] && (BRIDGE [=n] || BRIDGE [=n]=n [=n]) && (HSR [=n] || HSR [=n]=n [=n]) && INET [=n] && NETDEVICES [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for IGB
     Depends on [n]: NETDEVICES [=n] && ETHERNET [=n] && NET_VENDOR_INTEL [=n] && PCI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
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
   
   WARNING: unmet direct dependencies detected for NET_DSA_MV88E6XXX
     Depends on [n]: NETDEVICES [=n] && NET_DSA [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for PHYLIB
     Depends on [n]: NETDEVICES [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for USB_SERIAL
     Depends on [n]: USB_SUPPORT [=n] && USB [=n] && TTY [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for DS1682
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for USB_SERIAL_CONSOLE
     Depends on [n]: USB_SUPPORT [=n] && USB [=n] && USB_SERIAL [=y]=y [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for MDIO_BITBANG
     Depends on [n]: NETDEVICES [=n] && MDIO_DEVICE [=n] && MDIO_BUS [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for USB_SERIAL_FTDI_SIO
     Depends on [n]: USB_SUPPORT [=n] && USB [=n] && USB_SERIAL [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for I2C_OCORES
     Depends on [n]: I2C [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED
     Depends on [n]: INPUT [=y] && INPUT_KEYBOARD [=n] && GPIOLIB [=y]
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
