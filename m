Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD0F28373
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 19:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744831186; cv=none; b=g+RSd3dO74oURGSwN205/KksWHDq3eWc7pM0/+oNMr1fYAg7L85iSJ/9Gc9O4gFmkmr3lDSTRMbQdTDtUBum17OOmR1cJvjjznjpPtVXewo0hudCTj/DEFWljfjnRJoIl+5RBzDjh+XjHWVVciq8z4qfjARLZrctF3DFxGw1Ft0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744831186; c=relaxed/simple;
	bh=syQSJzqgRVCc/Q0xL+XFJsyTUnjCAnou2MWXUsRCrCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=igS4lTetcMGpNH8EnAP6I7aSt5rRjHyqRoUZGOML9nIeb1aRvRTY7kEjyGO481AJpvMdI7QYb1mimcXqIQ5uP9wDFEKqNqQwBefJoquYeXrmfeqAyudkxTGzGYzGpyrji/gX8hkJWjbEXt7F/mrxAUE9DrkyWzk0ZYPConfWq40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fx/+zDoE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fx/+zDoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744831184; x=1776367184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=syQSJzqgRVCc/Q0xL+XFJsyTUnjCAnou2MWXUsRCrCQ=;
  b=Fx/+zDoEM8J5DNzCAZQC0GRnjIItLvn2RPIlzS9nCdsC5lFu5v2+MbIV
   e8FcJQTzQjhwsMKjFEF2a3BBl9vPuBaROqnkP/pEDgE8KG7cXdB9aJHwT
   2OF/hq6IKOXXA0clcBF9X/xuEl3FZPXPBb0CJGiacAFhXYa8Nn/hhLOo8
   NFzOUePaNgS4gsGlnuTwl/yKcgqlxyS7ytOjoH5J8EDiY+hqt1h6iwogw
   KFKcdtst8JisrZcrLJd6xIEXB/pflWCEzK2/F+ULZc56oNyNtFyog4E0w
   +u1Ad7/8UaOiuxqBZY080XIVxyppP4YmL9u6p9yRcmHw/zW9JV/TFAC8i
   w==;
X-CSE-ConnectionGUID: j4PbsW9sTG29wpOTnd2PRg==
X-CSE-MsgGUID: zWJ+2KYEQBeqK4Rqx/9NDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71788038"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="71788038"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 12:19:40 -0700
X-CSE-ConnectionGUID: M4Oty75xSiqOsZXCaQhJkQ==
X-CSE-MsgGUID: AYI2LPs9Syq+U/bL4H8YkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="167763175"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Apr 2025 12:19:38 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u58IK-000KEo-0n;
	Wed, 16 Apr 2025 19:19:36 +0000
Date: Thu, 17 Apr 2025 03:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.15-rc1-next-next-inband 24/24] kismet: WARNING: unmet
 direct dependencies detected for I2C_OCORES when selected by ZII_RAP
Message-ID: <202504170306.r6Zo9KBo-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_I2C_OCORES-CONFIG_ZII_RAP-0-0 (https://download.01.org/0day-ci/archive/20250417/202504170306.r6Zo9KBo-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250417/202504170306.r6Zo9KBo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170306.r6Zo9KBo-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_OCORES when selected by ZII_RAP
   WARNING: unmet direct dependencies detected for NET_DSA
     Depends on [n]: NET [=y] && (BRIDGE [=y] || BRIDGE [=y]=n [=n]) && (HSR [=y] || HSR [=y]=n [=n]) && INET [=n] && NETDEVICES [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for IGB
     Depends on [n]: NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_INTEL [=n] && PCI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
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
     Depends on [n]: I2C [=n] && SYSFS [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for USB_SERIAL
     Depends on [n]: USB_SUPPORT [=n] && USB [=n] && TTY [=n]
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
   
   WARNING: unmet direct dependencies detected for USB_SERIAL_FTDI_SIO
     Depends on [n]: USB_SUPPORT [=n] && USB [=n] && USB_SERIAL [=y]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
