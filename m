Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BBA325700
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 12:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764158753; cv=none; b=MzCUXsAt6CyzidBBtfv3qnuP0SlL9bxmWUB488S7bBlNf+Y1B2GYOoFwI8a/Om/uDspEWUGIdFYQshClmkBX/0vajrlp3RlObsLwirSKEjs6X2cvh/uKJyavrEsSMSkMnNgts9Krf2TaZFpAjuaDpT+rBMDeIwZdb+jYiVgvtd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764158753; c=relaxed/simple;
	bh=RaXu2gFypHqEll1zbwvsmfT9KyZ+ewCg0po8BgjBs5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bhEK+AWwpnuhfoXWt9eODsMRAyQso7PHpVaxkj2BrgsqrTNV1bTzOgH78ySvzrx5dwWEtpTfl9TEb1ikuuu90si8H9ZWrVXwxmteYhCkNZvhU+ex6UqUdRTkFJnFlB5+7DjI00s05lz/W/YDfvCm6QoJ7GctxwJn6aETkUejq6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msrX/p35; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msrX/p35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764158751; x=1795694751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RaXu2gFypHqEll1zbwvsmfT9KyZ+ewCg0po8BgjBs5I=;
  b=msrX/p35uOCXno9I77FhftrWHKo9dz+5/JGBIl6v0HcnBDYDYkZ2ImGk
   lHTbbFDroAef4N/dULxRY+zVIAG7KOeqOBFoUG+9HgbcEmkWBydhIGzFm
   0vIrB7f2XanRxjsba19rhYIbNd0XBA3t/7xAvjxU0MqVTWM0SieoE0dYY
   jQeNAJdNrDNHzr1mMF2samg02MPbaeraa5c2g6XHAUNNUyvqu9VsnzTda
   YWfnABVsb+90xQNeaiAQP1641CfOF5cH7Gjlh2ypRMTzgRXwKUTxJcepF
   AO3WjjGooyuTxj7+Z50JhF8fEv8MSbyy7EpNDXuy6smcFG96FsE25mpQK
   A==;
X-CSE-ConnectionGUID: EFzD4SaOTsq9ab3q87//1A==
X-CSE-MsgGUID: vwB+8/fzRMSIC80a/SVN5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77667529"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="77667529"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 04:05:50 -0800
X-CSE-ConnectionGUID: RebK2wHgSbWgK5jDZGgFBQ==
X-CSE-MsgGUID: dqUUsxxuS7awHLHdPzwThg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192714403"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Nov 2025 04:05:49 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOEHK-000000002nl-1i7p;
	Wed, 26 Nov 2025 12:05:46 +0000
Date: Wed, 26 Nov 2025 20:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 26/26] drivers/pinctrl/pinctrl-mpfs-mssio.c:301:
 undefined reference to `pinctrl_generic_pins_function_dt_node_to_map'
Message-ID: <202511261926.MmRDcRMC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   15aed9595708a344fa6ae3ff639223cf6ae2fd76
commit: 15aed9595708a344fa6ae3ff639223cf6ae2fd76 [26/26] doing stuff and things w/ generic functions
config: parisc-randconfig-r073-20251126 (https://download.01.org/0day-ci/archive/20251126/202511261926.MmRDcRMC-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511261926.MmRDcRMC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511261926.MmRDcRMC-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/pinctrl/pinctrl-pic64gx-gpio2.o: in function `pinconf_generic_dt_node_to_map_all':
   include/linux/pinctrl/pinconf-generic.h:235: undefined reference to `pinconf_generic_dt_node_to_map'
   hppa-linux-ld: drivers/pinctrl/pinctrl-mpfs-mssio.o: in function `mpfs_pinctrl_dt_node_to_map':
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:301: undefined reference to `pinctrl_generic_pins_function_dt_node_to_map'
   hppa-linux-ld: drivers/pinctrl/pinctrl-mpfs-iomux0.o: in function `pinconf_generic_dt_node_to_map_all':
   include/linux/pinctrl/pinconf-generic.h:235: undefined reference to `pinconf_generic_dt_node_to_map'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y] && HAS_IOMEM [=y]
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +301 drivers/pinctrl/pinctrl-mpfs-mssio.c

   296	
   297	
   298	static int mpfs_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev, struct device_node *np,
   299					       struct pinctrl_map **maps, unsigned int *num_maps)
   300	{
 > 301		return pinctrl_generic_pins_function_dt_node_to_map(pctrl_dev, np, maps, num_maps);
   302	}
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
