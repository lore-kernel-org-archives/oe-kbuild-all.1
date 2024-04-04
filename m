Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A5D367
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 00:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712188940; cv=none; b=UzCxdiBvnov+wYiLF4Sj8s+5rEYWhgG1GrTxu4Unnntp7nTDY5lYHYwx9K+hWImvTRfbFKvWSMKmz+AwFwotJk2Fcgc8GcTcM/6+pONoNXNsQd0CuNx8wajXDNKD9wh5xW0kvt1WVWKTwvO00ei4TFNrOL6SGLpRH1G2Tb3FjRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712188940; c=relaxed/simple;
	bh=u3jdBy7QkQCvFaD/bUZ7OOSrAJCNgeGyAScLnBwC0J4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FU/3Kgq01FpY6QASDAqWZ7Wpa31UA7OSmVsEIG2OHjkG8eNDFpWO0NPqwa0Iaj+wSRBx+mcBDsA82sRNPJwHIxpkQsxZt3Gz8UT5MmDhjJ1mXXI29ih7dV3EVpt0l3XZ8meac6uIgv1pY5Pm3pVEGFP+TXM51rYeLdSb4Vd5xmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jE9tg0N0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jE9tg0N0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712188939; x=1743724939;
  h=date:from:cc:subject:message-id:mime-version;
  bh=u3jdBy7QkQCvFaD/bUZ7OOSrAJCNgeGyAScLnBwC0J4=;
  b=jE9tg0N0T/gI1+GwRXFXstGDDd5K+1qMmKxyLrE/S+YxVnn5dOUFYAkx
   Hvpkf6WHdrcJrexX6Vn06A5zMVUdaeOqXUh6ZK+tZTek8ADcwUwtjLrlf
   rrOpAviutP9zA1eXSvkks41q83rR+nymwRvStAsrgxtWSvcTgEf7l146r
   KfGZYBk5a+mpmUYTU10jjWLC703sdipLcUQ1nv/46C1PyZXvg68kwaOFQ
   O85HRfXeYnJpknUHrfOxYKJ2tZBgmcGk0YWlPseNIB7rpOFdczbGH5uCr
   7p2tfZqOaIEvf0Z2iCNuPHcG5kUw1Hi6wAi9jOWQB9U41krUiN9mDqwo6
   g==;
X-CSE-ConnectionGUID: 9Y/KIUQHQ7yatwPz0TAZIw==
X-CSE-MsgGUID: VwLzl8QERWSW6WZ8AyHp5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7318795"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7318795"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 17:02:18 -0700
X-CSE-ConnectionGUID: 0AO+2i4bQ52rIOHD/3Jhng==
X-CSE-MsgGUID: icG0svvpR1OlaVCBSOIL2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="23263206"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2024 17:02:17 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsAYY-0000NS-30;
	Thu, 04 Apr 2024 00:02:14 +0000
Date: Thu, 4 Apr 2024 08:01:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] kismet: WARNING: unmet direct
 dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_NSP_GPIO
Message-ID: <202404040748.hUrCQrmO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   01dbe4e64bacaa4c891c1997f2724c320698d61f
commit: cf0136753f9892c69092d959eb86c8e06e706138 [45/107] media: i2c: add DS90UB960 driver
config: alpha-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_NSP_GPIO-0-0 (https://download.01.org/0day-ci/archive/20240404/202404040748.hUrCQrmO-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240404/202404040748.hUrCQrmO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040748.hUrCQrmO-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_NSP_GPIO
   
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB960 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]
   
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_NSP_GPIO [=y] && PINCTRL [=y] && OF_GPIO [=y] && (ARCH_BCM_NSP || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
