Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B0615D1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 03:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714273272; cv=none; b=m9KjMDcczCvp2lBN2Y4tpuSI+OfPgVTDdePj7Xg/bMCdsWvZs1+ATTH0WeWMib6lYr4aAEBPowqCbVDvu1CQmjsc/xq994qzWRml5MbjYdxy0ntrcajqMWE1l0vQVylkCuUN3lrWNq+5QDuJYu+zqEfxqhInOyl1kjZf6XnlzDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714273272; c=relaxed/simple;
	bh=AyffaSCEdF2I7eKX8IzbZDJ6UtufEzj3nVy3kbT9KZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KUHuUGFu6nWye9hQOFD6nCE8Iv7Y4smATKOhmeDkoapvoXr4HevurcqOqp7Zs9AdZiu14Uz9oXK9zQd9XSb7juHVolgdqjXewdbIELDoJ/hLXlgXfC1VppVZRd/D0iGyr+Qq2fumCGwi0wqxypcnSEanFLT5RAOB6SGVvQGLEMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6Uuyp5y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6Uuyp5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714273270; x=1745809270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AyffaSCEdF2I7eKX8IzbZDJ6UtufEzj3nVy3kbT9KZU=;
  b=M6Uuyp5yS8nK9BmjkIbsNIrt+VAqcI0LPB53SMjW/148JjLgN9vZnyLR
   O+wWg6AfXekXjCZ1BUKm0q7pxUmgn7Xmc9/vg32NHGK4aFSdlXaqBPD50
   Hf4J/lfsjXSqSG2aOXzWG0kSVTImC1eANlSxwB0qnlbDiAbq8u5gud3cl
   BMjqXZ9Xzd6waWuMISt7M+8ndUbeYc17HA7w28EaS2LKkEldll4HXviRc
   LfNFEK1G1r96woGJQ9kCrYSNpbP2qzBVqFtznioc/nJnbfHC+EGXbzEfN
   zjMRUsYPMMxqL1y27PBDOqmuBc9ghlwj3V1lZ1tfJCY+ve0ONJU53JxiT
   A==;
X-CSE-ConnectionGUID: yktmjzi0T86/mJtPn6PUJA==
X-CSE-MsgGUID: m9CERiDnRtOlh4AJGohf7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27422533"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="27422533"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 20:01:04 -0700
X-CSE-ConnectionGUID: 74QXShgwS0KFjt2p+MCaCw==
X-CSE-MsgGUID: cD+/Zv1nQLy9Dd4kyKtkVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="56973811"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Apr 2024 20:01:04 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0umj-0005m8-07;
	Sun, 28 Apr 2024 03:01:01 +0000
Date: Sun, 28 Apr 2024 11:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 2665/11728] aarch64-linux-ld:
 Unexpected GOT/PLT entries detected!
Message-ID: <202404281042.a1yCIRfu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 28f7ee66a10609525341c91f1aef06e8548f994f [2665/11728] LF-8343-2: driver: i2c: buses: flexio: rework to use mfd
config: arm64-randconfig-004-20240428 (https://download.01.org/0day-ci/archive/20240428/202404281042.a1yCIRfu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281042.a1yCIRfu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281042.a1yCIRfu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_init_hardware':
   i2c-flexio.c:(.text+0xd0): undefined reference to `flexio_sw_reset'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xf0): undefined reference to `flexio_setup_shiftcfg'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x11c): undefined reference to `flexio_setup_shiftctl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x138): undefined reference to `flexio_setup_shiftcfg'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x160): undefined reference to `flexio_setup_shiftctl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x188): undefined reference to `flexio_setup_timercfg'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x1a8): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x1dc): undefined reference to `flexio_setup_timerctl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x200): undefined reference to `flexio_setup_timercfg'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x210): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x248): undefined reference to `flexio_setup_timerctl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x258): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x268): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x270): undefined reference to `flexio_get_default_ctrl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x280): undefined reference to `flexio_setup_ctrl'
   aarch64-linux-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_master_xfer':
   i2c-flexio.c:(.text+0x694): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x6a8): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x6d8): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x72c): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x748): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x754): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x768): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x7f4): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x824): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x860): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x8bc): undefined reference to `flexio_writel'
   aarch64-linux-ld: drivers/i2c/busses/i2c-flexio.o:i2c-flexio.c:(.text+0x910): more undefined references to `flexio_writel' follow
   aarch64-linux-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_master_xfer':
   i2c-flexio.c:(.text+0x9d4): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0x9f4): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xa00): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xa14): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xa20): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xa34): undefined reference to `flexio_writel'
   aarch64-linux-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_isr':
   i2c-flexio.c:(.text+0xb08): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xb40): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xb6c): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xb90): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xbc8): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xc08): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xc18): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xc4c): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xc6c): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xca0): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xcd4): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xce8): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xcf8): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xd10): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xd64): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xd88): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xdac): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xdc0): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xdd4): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xde8): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xe08): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xe24): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xe68): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xe78): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xe84): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xe94): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xea8): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xebc): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xecc): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xee4): undefined reference to `flexio_writel'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xf04): undefined reference to `flexio_readl'
   aarch64-linux-ld: i2c-flexio.c:(.text+0xf18): undefined reference to `flexio_writel'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
