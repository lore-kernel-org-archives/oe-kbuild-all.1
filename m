Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5692036EE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 18:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731523212; cv=none; b=PQ3bHF1/DWGTach+f4ytwywsqvkrOInpCrXgXeG5jDRJjE+DPkjqcu72SupYZU3vQkqfrEqQp0h39t6tEvWUjA8ItN+BnPQ5peLPURFoD07m6k2taPS9v0Su66MWFf1Rr1MuE89MWaUxFAzJbVKiBOhcVjLqHBxWatjzi5JXBkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731523212; c=relaxed/simple;
	bh=XcAQSeXllJlBWc3PZb/zjZFaaU0cw+x1txNYV2YYgGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rPkhwYTjCtd8cuWNZLoRrzgV5o8wUJ70SMJYHB5CPhWGHQnow6kSdNFOz4ripyg6fnmL3LBssqbNEmcftWA5DqlKsTRkYCb3W4J0HeKbzCtgEQL7/PCHYjeES/mD80fHnisxQ5m2KLunc5ihqGgAFzEefhVIAbTbpi08FSYfnhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ntxv39tn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ntxv39tn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731523210; x=1763059210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XcAQSeXllJlBWc3PZb/zjZFaaU0cw+x1txNYV2YYgGQ=;
  b=Ntxv39tn+KSl011VQx17jdhbjLjcMkFRd01GxKroCN9YWc+2N6VCOivi
   ASwJp3HDIn3MCpzl7/UGwBckiMZdPXHi/iL2tvb+VJ2tvjZUOx58xzIhg
   UPWziwDzbFv/TxxbW4UAxQWxLl5Y8UlT+8Tsu8ASYaHJk/AuE9linZOCb
   eUt++Z7FgZ6Xq5M71gDOxGya7cN6f8eXh/6mJgDz2dYOrqCZn6GkFVObG
   itoEF/cidYm0jMP9OM2gwntzn8N/XARYYldhV9dVQSQ/cYzwAtLW1vc6H
   50uv2LU1C9jeRg8gYquon/KS4+mM+OjhS3VP7ZSL6rdktuUynxwPTkrWG
   w==;
X-CSE-ConnectionGUID: cCO2OR0bSv69dp7B9ToS1A==
X-CSE-MsgGUID: 330LdHs/QUeya2KlIaD+EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48885853"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48885853"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 10:40:10 -0800
X-CSE-ConnectionGUID: 56ZE4Yy9QCCAKcrhjFOnAQ==
X-CSE-MsgGUID: ClrE0whsTF27Nt7bJ4RN9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="88375985"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2024 10:40:09 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBIHe-0000d1-2R;
	Wed, 13 Nov 2024 18:40:06 +0000
Date: Thu, 14 Nov 2024 02:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tian Wei <tianwei@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1294/1294]
 drivers/gpio/gpio-phytium-platform.c:30:36: warning:
 'phytium_gpio_acpi_match' defined but not used
Message-ID: <202411140242.XxdoeZ1Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a81d020c58c2c6a55ebaf15846470a9ecb69bd1a
commit: 00711bad7e372a30c4975ba43811ffa666aff0e1 [1294/1294] gpio: add phytium gpio driver
config: arm64-randconfig-001-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140242.XxdoeZ1Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140242.XxdoeZ1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140242.XxdoeZ1Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-phytium-platform.c:30:36: warning: 'phytium_gpio_acpi_match' defined but not used [-Wunused-const-variable=]
      30 | static const struct acpi_device_id phytium_gpio_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
   Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
   Selected by [y]:
   - SDEI_WATCHDOG [=y] && <choice> && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]


vim +/phytium_gpio_acpi_match +30 drivers/gpio/gpio-phytium-platform.c

    29	
  > 30	static const struct acpi_device_id phytium_gpio_acpi_match[] = {
    31		{ "PHYT0001", 0 },
    32		{ }
    33	};
    34	MODULE_DEVICE_TABLE(acpi, phytium_gpio_acpi_match);
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
