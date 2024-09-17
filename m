Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E84F510
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 21:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726610146; cv=none; b=ayXY75VvlBPgw0I5+KHMg8yIjikApMcor1mJCimR1+89oGDDh9XKEyw5bRNzzAAUI1RpkcZYYwCsNhRsbOvOMK8VsZJjuoOKbK+rxU8BGi745iSoYU/oCTd4bIFP4UGPAGC7WUL32D6LL7sweakfsM4nyO96KYfPPwCPaoLQrpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726610146; c=relaxed/simple;
	bh=+AFqWWyWaq05afPQy3AivvhmYeYAKKcg49OqfhX0Yv4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bEbnXCnC7MaEHVSqXDtLyDHCU4veITWLMKE0wrkxIouk5Huaq4IaL1Nht8Lc+yQyiw17/ZlBWMTpHhOx5ONlT8xiwebwq7c+FEQXpp231O6iCM6C9kz5Ba8pEpYrRcFOH53A3jOhu3KLXjQi1H3hkox7LFLG2Sy9ikK6gHEfYdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNvv3yRW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNvv3yRW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726610145; x=1758146145;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+AFqWWyWaq05afPQy3AivvhmYeYAKKcg49OqfhX0Yv4=;
  b=HNvv3yRWLFqtC9E675UMxh/YqJ5bA35IVCo7bvY9hDz4Kb0e8v3v+1H7
   VoeCz2/zqkkidi4zcbpTu10vL+tgrVrdixnLAUkudjhs0Ae4O0Cz1MS5D
   rfz6LKkE2nyLbEa0Y+oT3DfEK1dnAaXhBs99Ol0F3igj4MxPuLCQ4ZFf6
   CGYV52Mx5u6hhpuApXSrSicd6KwHdB3vt1KxPZIsOCzfwKh0c/gV/Xdjz
   m9qMO/CdRy9Ch9rbVBDw933fMq95FxDdBS+VCv/WXz0y8VBJNmv1T6Psk
   k18+wwPrBhdVkc7FAwTzeDFqlE4oJFakKKqf0lQc1AjTONhRlmwjZVcYA
   g==;
X-CSE-ConnectionGUID: vqVKNgL7Qk6qI5cKVGyGYg==
X-CSE-MsgGUID: 2Rms9WLdTJCrCQb9WBy8ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25439620"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25439620"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 14:55:44 -0700
X-CSE-ConnectionGUID: GyFg2K7sTomcCOW+LU/7jg==
X-CSE-MsgGUID: mXVWMCRpScGxMiOSrzLAPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69428785"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Sep 2024 14:55:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqgAd-000Bdq-3B;
	Tue, 17 Sep 2024 21:55:39 +0000
Date: Wed, 18 Sep 2024 05:55:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] kismet: WARNING: unmet direct
 dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_STMFX
Message-ID: <202409180515.w3kneRKB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   96b0ebd82722d16e9ab646cd3a73080e6f790747
commit: cf0136753f9892c69092d959eb86c8e06e706138 [45/107] media: i2c: add DS90UB960 driver
config: nios2-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_STMFX-0-0 (https://download.01.org/0day-ci/archive/20240918/202409180515.w3kneRKB-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409180515.w3kneRKB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409180515.w3kneRKB-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_STMFX
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB960 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]
   
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
