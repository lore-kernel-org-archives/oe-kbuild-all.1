Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEACC53363
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 04:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744863831; cv=none; b=Y/Bc7ZkJrQ1Opbn5TCI04XVyTLR8f3b5vIQZPjntMuza0a+dLBYsygovdQ96xKoLZCN8fLs04kS4tvuh2LJx9IeGMmPNycMVB7ydYrTfwd3x18Y0nWo2Fl6dUxOYPnB5u4lkO/6RizKIug3A5+hFFV01dN4WiGzCQlivMkISzqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744863831; c=relaxed/simple;
	bh=PK36A2mN8YvqZ4W1HKXuqmYsmzwUMY5lHiLewU2cWzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+wyb4Jn0QyP6bIYdtj1G4lul7GUXs6TBv00HQhM+HzO5QIpknyvU78jbxqWieQiok1XxLrZf6pO9OkTewuszX3vzdYapHZzD0v7QtKGqDs8HmnIYP+hGJaX4vXmFFxqFswf+shhRRTd+UnDXU4F+hH+GXCjMVWbnZWQMPq/Noc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRAVPH76; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRAVPH76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744863830; x=1776399830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PK36A2mN8YvqZ4W1HKXuqmYsmzwUMY5lHiLewU2cWzU=;
  b=QRAVPH769hgPFPgWuWKus/rGb2JV3R6NJJApYKuZnt8QvvhkQRsjRxr2
   FkiuCD2dxBPLk6OGJfaaaDdc1uBAegKpv/N1TazMYxIxu5b+D16p6tbS8
   mbwkqWtaNBUljjYjbkJLzOBoKb1fZWogdrZY5RH/0aC89+gjNAcG9Eawe
   j8n2VIBMHGw25d4QxaDpVTZFy9HEgwfa9t2VLUJEF0Op5ZBAN+yQdWvLJ
   z2SmganUKkDaO3qHiC/PJHnIhK4IC6sTKY6oQHEfALrnSiJOP0v6SqE/v
   fnxY9R/NuRTtVvN+9qSyUgeVu8CB0c30igR8g/w7sRzNvMB8mvWSQXHPB
   A==;
X-CSE-ConnectionGUID: vDwaAGhdRzqfuKG1PPHSsA==
X-CSE-MsgGUID: QyGgYH+8RLWzDigAwAhV5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46151377"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="46151377"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 21:23:49 -0700
X-CSE-ConnectionGUID: Ke3YEQXKTD2VyxgrprjTgA==
X-CSE-MsgGUID: mz8tgiImQGqJOQLs2D4/VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="161635720"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Apr 2025 21:23:47 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5Gmu-000LCW-37;
	Thu, 17 Apr 2025 04:23:44 +0000
Date: Thu, 17 Apr 2025 12:23:13 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.15-rc1-next-next-inband 24/24] kismet: WARNING: unmet
 direct dependencies detected for MDIO_BITBANG when selected by ZII_RAP
Message-ID: <202504171235.JyO21Iuv-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_MDIO_BITBANG-CONFIG_ZII_RAP-0-0 (https://download.01.org/0day-ci/archive/20250417/202504171235.JyO21Iuv-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250417/202504171235.JyO21Iuv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171235.JyO21Iuv-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MDIO_BITBANG when selected by ZII_RAP
   WARNING: unmet direct dependencies detected for NET_DSA
     Depends on [n]: NET [=y] && (BRIDGE [=n] || BRIDGE [=n]=n [=n]) && (HSR [=n] || HSR [=n]=n [=n]) && INET [=y] && NETDEVICES [=n]
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
     Depends on [n]: NETDEVICES [=n] && MDIO_DEVICE [=n] && MDIO_BUS [=n] && MDIO_BITBANG [=y] && (GPIOLIB [=y] || COMPILE_TEST [=y])
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
