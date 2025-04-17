Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2247A1C6B4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 20:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744921151; cv=none; b=HEDs55rTOVuDQbXLoef1v3gkhb7MxPLba9PmivVR6TSaNZnIyL34lsc/HoabAOdjNDVAaSicyJh8mFoCRZtgCTYFoZwhphlACwsk3+T/e7Jix8UfEUwQ2Gf7X0HQKaqJjBqdtLwH+mGB1gSOnsh7dsP2abGoiEvCenE63T9FKFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744921151; c=relaxed/simple;
	bh=qTh1s2pn5kbrPJaqgDXNeOwSR9VOcAg048kVfFpBd50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a9u022AQo8anQR3GmlYuFXg/dg4qeCC3tR51EY6vzt2gCH1p7yuSQ8uHCc40johA/lYKVc4q9UJ5FobtrcUqJu/sNuIdNTDE/GwDZzyf3OK3kNgaGT2IUdbPQDGTNdrJWeWMp+jXGn6BUGae0XcEylF+vFLBP52DTEu2ubZcUBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxrSKvOP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxrSKvOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744921149; x=1776457149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qTh1s2pn5kbrPJaqgDXNeOwSR9VOcAg048kVfFpBd50=;
  b=dxrSKvOPgGhvl8mmPrVZE+r10KAUR/P2MARoqIg1IaisIx9v78tudw61
   KNNHX82Lmi7fMXIX9t4TCdwKjh8MXmwzgDTYv8f0kqd6zQ2Iv2DAEDKuq
   fscQ5db49k8kfnDDgb8o4yx36rNx/nd4VIvsxgtcPbJ5KyUkn3TrRGIjE
   /AYAZ7mMtZfzEwimBeLg24tsgKNk20mlqcqWkZI5iki4inctZEHDgWyl+
   1HCPyNBPKJCGaltvXqOgflfGab1lL9WvjZbnU6KX1bUKjgHQMgzqdK76I
   zQM8f7DlMYdnIRryk0Op9b1RTDLbGsIwbuNm7U8f/iODTdAQryWfOHa+8
   w==;
X-CSE-ConnectionGUID: R7ZnRa++R8mlRfVNjPT1Kw==
X-CSE-MsgGUID: sKYOngN2S5yKGoTbbq/6Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="69039265"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="69039265"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 13:19:08 -0700
X-CSE-ConnectionGUID: dyJTPO1SSjuEOnWAVeh2Mg==
X-CSE-MsgGUID: 5VBPhaOmQKWtNnJx1C7ZNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="131456353"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2025 13:19:07 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5VhR-00020x-0G;
	Thu, 17 Apr 2025 20:19:05 +0000
Date: Fri, 18 Apr 2025 04:18:13 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.15-rc1-next-next-inband 24/24] kismet: WARNING: unmet
 direct dependencies detected for RTC_DRV_DS1307 when selected by ZII_RAP
Message-ID: <202504180447.nde6CojZ-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_RTC_DRV_DS1307-CONFIG_ZII_RAP-0-0 (https://download.01.org/0day-ci/archive/20250418/202504180447.nde6CojZ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250418/202504180447.nde6CojZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180447.nde6CojZ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RTC_DRV_DS1307 when selected by ZII_RAP
   WARNING: unmet direct dependencies detected for NET_DSA
     Depends on [n]: NET [=y] && (BRIDGE [=n] || BRIDGE [=n]=n [=n]) && (HSR [=y] || HSR [=y]=n [=n]) && INET [=y] && NETDEVICES [=n]
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
