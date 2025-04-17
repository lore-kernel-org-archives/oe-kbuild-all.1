Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2A1256C9C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 18:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744913125; cv=none; b=lbRNDQ1xm02MXmgR4MyAFSpo96nYqVrA0bvo3w1PyGjLZkZBWiP9HtTG57yP2rhL1OeDQW+VdeQhYzRL7kTCKk7kVrd10qiMsj+pubYrCEYjI93l+wd2PJspc9WvgFOh8FUonyGWX+wLekvYdlRktEGii/pe/A6QNtNjPlniF+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744913125; c=relaxed/simple;
	bh=cnAjtQxyKoxrqpKq7E5MMMQD5WQTE1OsHUYVGiUTPHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vfr/DJNhthbbc3mMIov3Ex+fqK+FRTxZ+QRJRIfB5BHTp6l8p4XKxC9k6p43g3JgX5lmyaOK+mqQETCBp1x3HsJs5LNnByBYBHqiGT1rg6YuHYTWOE7UNaKO4K4Yq3L9OQJex98I76EgA2ANkdTTjcjbVNoGupDPMjwG5NkRniU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvIkOAuz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvIkOAuz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744913123; x=1776449123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cnAjtQxyKoxrqpKq7E5MMMQD5WQTE1OsHUYVGiUTPHs=;
  b=TvIkOAuzZVOMBJHO2EkiyAJzbIISwGQ0UphE4muO+WWeIYDMwDAjTZ6B
   nZbSHCRkZ7G136RdPHpW3kJacvTFWzhHpALOkWGVf8/CAEQ+HiHVBsFKr
   OipmFbB3PR9ub6onWRnxkQmocmxg55gulosJ6q3Ig3pZuMJlLBMKVDux4
   EZa9aIowMS9gbcZ32PQVFYsreuWUbZ8Rh1ZQQJ9yowT95cVtW8WmepcM2
   y17rru0RtZPYMMshuR0Ij794gDr2igbnQbC7kkLv6BoPqL2l0YcucTCwH
   8V/H9WbeM3c4bom7bIbGz7FFzyXx1+9AbpVDu4IUE91mhbkQzto6xpLFY
   w==;
X-CSE-ConnectionGUID: /bGJCL1OQXWqf36uXytxcQ==
X-CSE-MsgGUID: GB5ouZKQSguBprUBRGk+9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46531946"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46531946"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 11:05:23 -0700
X-CSE-ConnectionGUID: lYKReBWhRN6/wJRLcbVVJg==
X-CSE-MsgGUID: Y15drGbdQJyBNh7NymjfnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="168075479"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Apr 2025 11:05:22 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5Tbz-0000o9-1y;
	Thu, 17 Apr 2025 18:05:19 +0000
Date: Fri, 18 Apr 2025 02:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.15-rc1-next-next-inband 24/24] kismet: WARNING: unmet
 direct dependencies detected for PINCTRL_SX150X when selected by ZII_RAP
Message-ID: <202504180115.cWs3Vy45-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_PINCTRL_SX150X-CONFIG_ZII_RAP-0-0 (https://download.01.org/0day-ci/archive/20250418/202504180115.cWs3Vy45-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250418/202504180115.cWs3Vy45-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180115.cWs3Vy45-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PINCTRL_SX150X when selected by ZII_RAP
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
   
   WARNING: unmet direct dependencies detected for TQMX86_WDT
     Depends on [n]: WATCHDOG [=n] && (X86 [=y] || COMPILE_TEST [=n])
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
   
   WARNING: unmet direct dependencies detected for USB_SERIAL
     Depends on [n]: USB_SUPPORT [=y] && USB [=n] && TTY [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for DS1682
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for USB_SERIAL_CONSOLE
     Depends on [n]: USB_SUPPORT [=y] && USB [=n] && USB_SERIAL [=y]=y [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for MDIO_BITBANG
     Depends on [n]: NETDEVICES [=n] && MDIO_DEVICE [=n] && MDIO_BUS [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for USB_SERIAL_FTDI_SIO
     Depends on [n]: USB_SUPPORT [=y] && USB [=n] && USB_SERIAL [=y]
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
