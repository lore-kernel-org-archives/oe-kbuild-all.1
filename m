Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755688BFD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 17:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719077040; cv=none; b=GBzHrWfLbNVRD9HHaRC0gA+Fxc9wZpa+AFy+V7P28NLo+vgBw6whUih6QmDLQc2EfWsR3Vel5DWT0Vwx7XmXCbbUanV95bYW8LzNbpoQROZpiMGPEBBN+mCl8Jy8WrRsZkZ/AltPAcOQzpK8B5dRvp5kSCBzWQdD06SArPHlGOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719077040; c=relaxed/simple;
	bh=dr0I/I9abVSIT9nEPIZQNLx54T+a6KLHrHxt/+ZwNYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WRNJM2p+YPFKZU5zJCnEJmnv4lXGSkTIy2ZmdFayp7HP1taV6OH73eFgjpvVNn/Xvuw2OqGic2YC6AV0ciCTbvBRw1VZnbfJlwhFAgi3rkysWqMsPXcvcICbgsW+tGgdyUDK4b6L59TTnTJGYAtXOgI+SmXKnoS5X1pO+Vkx68Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JuLvgWar; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JuLvgWar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719077039; x=1750613039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dr0I/I9abVSIT9nEPIZQNLx54T+a6KLHrHxt/+ZwNYk=;
  b=JuLvgWar0+4oy7Dg2xlMCRF0pv6vxO4epOm+cuKPsHIXDawwMsyGohbp
   g0RUz/e4eBbb6nhdBIRXI75WpzrBgCKJiwyIJkd30XClB+xc7hV6vI+9n
   1k9qhrQucnSYKUiZk/5712QV4KIZD3G+KUFJKUNGjvDyYH9emxZopvXeq
   nDUBuSH1uufZo1bn09HxFFgnBcw6rvMqGqUPOzB0bHZEuAxtTp6/aML9e
   lfy6ARn7ECGfUeZHptOhlPuX5QQHKisghjaBVALxC3t60Va7hZjDh4dP4
   +6VY/gQddQNtycb0jF0oupn/xucURtu7qNl1AJJIEtnJ+fa5dNjJRQy0S
   A==;
X-CSE-ConnectionGUID: 3bK5zdKXSK2xuJe3gVLmQQ==
X-CSE-MsgGUID: Fm9wj7yGQkOVQRdqT2WPeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="27510024"
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="27510024"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 10:23:58 -0700
X-CSE-ConnectionGUID: vRmVhkM0Scq4P/+4dXrjEg==
X-CSE-MsgGUID: w7mU/pC+R7WBcZirFUb22A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="48041426"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Jun 2024 10:23:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sL4Sw-0009qY-30;
	Sat, 22 Jun 2024 17:23:54 +0000
Date: Sun, 23 Jun 2024 01:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Malloy Liu <liuqi1610@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21291/23028]
 drivers/spi/spi-phytium-plat.c:186:34: warning: unused variable
 'phytium_spi_of_match'
Message-ID: <202406230104.pOYbvQkT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Malloy,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   10a294b680ddfda97a09883fe559dd418e5340cd
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [21291/23028] spi: add phytium spi support
config: x86_64-randconfig-005-20240420 (https://download.01.org/0day-ci/archive/20240623/202406230104.pOYbvQkT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240623/202406230104.pOYbvQkT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406230104.pOYbvQkT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-phytium-plat.c:186:34: warning: unused variable 'phytium_spi_of_match' [-Wunused-const-variable]
     186 | static const struct of_device_id phytium_spi_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
   Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
   Selected by [y]:
   - SPI_PHYTIUM_PLAT [=y] && SPI [=y] && SPI_MASTER [=y]


vim +/phytium_spi_of_match +186 drivers/spi/spi-phytium-plat.c

   185	
 > 186	static const struct of_device_id phytium_spi_of_match[] = {
   187		{ .compatible = "phytium,spi", .data = (void *)0 },
   188		{ /* end of table */}
   189	};
   190	MODULE_DEVICE_TABLE(of, phytium_spi_of_match);
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
