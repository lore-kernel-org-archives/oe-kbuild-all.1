Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25342417E0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 15:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769356212; cv=none; b=KuLyTyzTbyY4ru6KvXQciquYXl6FFBrFu3Q9tZ5CcpWkpOb5Y1TbkdjxOV20/uk/YwAxWvMyG3lM+rnIP8iJ5SYjrJzfCc5SCUER1lgP9w0uLmbuyOqMejDMoAj+v34bIesq8VxZtE10Gk5TIZC8/tgALaT7feHDTj07q6Iklm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769356212; c=relaxed/simple;
	bh=iBc1SlniEarb9ejh5Pu5FEiCO2y3O2eVdh1WLx8Ofgo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AkmAYnfUaRc7Ju1kONoyBHE2LB3ilGmXZoq8ZFpQLuPcLqTyX6rGeYkCeNdqqAwFEZhlLjaHmpH1ChCXrdGd6CUs9Sfcj2UlGsczFzKbW5L/YE6mxPmP3ZaWOvYxmRs1H3StVNrl9Dwo2AKHLW2kGj+u8Y+Q3PW4uJOkUxREd7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFhU4DC9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFhU4DC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769356210; x=1800892210;
  h=date:from:to:cc:subject:message-id;
  bh=iBc1SlniEarb9ejh5Pu5FEiCO2y3O2eVdh1WLx8Ofgo=;
  b=fFhU4DC9KeCzjg7fs+DQOCzoJeAjwc1Km0mbQay55duURW7hN1rGMhpP
   FAOPvke3ELLWP3ZzrLzmW/Z2wuHEech9rXH0XzLz69LE3FQ9wwceIuApN
   inrfbLiIA4DY7A70yoMGOSneTVOeTkIWYMQm1+GG7wRKNwwrMdzesq6u/
   jY2ik+KOJIeDedint278woK8fKnhV4hVkDRegJxpROPdrQAvNBLN9rNv9
   j+Ml7FsSIKtsvg0HWVKOjN2lrZ5k7m2mZkIBi06OQ48vycc8j42PTB1IK
   45Z6wbbvQQIu3bisALYZ0T9uN6THG4DqPg5xemrgHxUIwq4MFYzvHG3++
   Q==;
X-CSE-ConnectionGUID: I6nuSgW7Rw6SiVq+ll0YyQ==
X-CSE-MsgGUID: ZBP5eJGNQUSEH/AeNkg0Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70706073"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="70706073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 07:50:10 -0800
X-CSE-ConnectionGUID: tfOTlBSYTi2OFdlJs8EpbA==
X-CSE-MsgGUID: X5PrryV2QW+r8Rj5k93DEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207729609"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Jan 2026 07:50:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk2NK-00000000W7G-2jck;
	Sun, 25 Jan 2026 15:50:06 +0000
Date: Sun, 25 Jan 2026 23:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 4/4] ld.lld: error: undefined
 symbol: __mdiobus_read
Message-ID: <202601252338.z9Nq8UKK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   c624c4db89acf5f5e2466e371f744a5b6c8261e2
commit: e720a50b14c5896defc425452f52d3ee1d2de1c5 [4/4] ANDROID: GKI: Select PHY_PACKAGE for vendor modules
config: arm-randconfig-002-20260125 (https://download.01.org/0day-ci/archive/20260125/202601252338.z9Nq8UKK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601252338.z9Nq8UKK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601252338.z9Nq8UKK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __mdiobus_read
   >>> referenced by phy_package.c:78 (drivers/net/phy/phy_package.c:78)
   >>>               drivers/net/phy/phy_package.o:(__phy_package_read) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __mdiobus_write
   >>> referenced by phy_package.c:90 (drivers/net/phy/phy_package.c:90)
   >>>               drivers/net/phy/phy_package.o:(__phy_package_write) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mmd_phy_read
   >>> referenced by phy_package.c:121 (drivers/net/phy/phy_package.c:121)
   >>>               drivers/net/phy/phy_package.o:(__phy_package_read_mmd) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mmd_phy_write
   >>> referenced by phy_package.c:154 (drivers/net/phy/phy_package.c:154)
   >>>               drivers/net/phy/phy_package.o:(__phy_package_write_mmd) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHY_PACKAGE
   Depends on [n]: NETDEVICES [=n] && PHYLIB [=n]
   Selected by [y]:
   - GKI_HIDDEN_PHY_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
