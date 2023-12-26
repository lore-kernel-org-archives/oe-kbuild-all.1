Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4B2224CE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Dec 2023 04:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2KGpgJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703563319; x=1735099319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+4DZvSdwDGREHTk6ZAavIwYKUPn5Gx8BqEBj/KCrm1E=;
  b=C2KGpgJZghItKo4p0wr9+1f9kowXMOJYGko2ClzXk7VHX/+JlRC4mLdL
   vas5KxGIudhOjnmMgV75M9u6/WmbXBT2e+1LFDMeeA3FYdxxHIZIAOnh6
   qpWtjJpFoDLgGzmvImlHr96aP8Kbb8tKVf3YiWw3pDVH5rjzTNc1P4gY4
   +8Nirl9YYabR4EiNH0+BVhfO1ORsICvtz3URig60Bkso3R7d2R1x1aXZd
   tGU2628Kk/70fX1L/xafBBVM5eNOEBUC/OyyuzUemw9IbWZBUhtRYJQky
   ggOtLY/9jj+55STuwtvxWeQP2TX/O1RtrUeYFwa17z4RL5Qf+Jw/e2y3W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="3150935"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="3150935"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 20:01:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="727647315"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="727647315"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Dec 2023 20:01:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHyde-000Dz3-0u;
	Tue, 26 Dec 2023 04:01:54 +0000
Date: Tue, 26 Dec 2023 12:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 935/1123] drivers/spi/spi-sh-msiof.c:590:29:
 sparse: sparse: incorrect type in argument 1 (different modifiers)
Message-ID: <202312261116.cwnsLQyx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   c8b3583bc86352009c6ac61e2ced0e12118f8ebb
commit: ae655c59997b0da487fa28ef79046f3a129a61cf [935/1123] spi: Replace all spi->chip_select and spi->cs_gpiod references with function call
config: powerpc64-randconfig-r133-20231225 (https://download.01.org/0day-ci/archive/20231226/202312261116.cwnsLQyx-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231226/202312261116.cwnsLQyx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312261116.cwnsLQyx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-sh-msiof.c:590:29: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct spi_device *spi @@     got struct spi_device const *spi @@
   drivers/spi/spi-sh-msiof.c:590:29: sparse:     expected struct spi_device *spi
   drivers/spi/spi-sh-msiof.c:590:29: sparse:     got struct spi_device const *spi
   drivers/spi/spi-sh-msiof.c:594:41: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct spi_device *spi @@     got struct spi_device const *spi @@
   drivers/spi/spi-sh-msiof.c:594:41: sparse:     expected struct spi_device *spi
   drivers/spi/spi-sh-msiof.c:594:41: sparse:     got struct spi_device const *spi
   drivers/spi/spi-sh-msiof.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false

vim +590 drivers/spi/spi-sh-msiof.c

   581	
   582	static int sh_msiof_prepare_message(struct spi_controller *ctlr,
   583					    struct spi_message *msg)
   584	{
   585		struct sh_msiof_spi_priv *p = spi_controller_get_devdata(ctlr);
   586		const struct spi_device *spi = msg->spi;
   587		u32 ss, cs_high;
   588	
   589		/* Configure pins before asserting CS */
 > 590		if (spi_get_csgpiod(spi, 0)) {
   591			ss = ctlr->unused_native_cs;
   592			cs_high = p->native_cs_high;
   593		} else {
   594			ss = spi_get_chipselect(spi, 0);
   595			cs_high = !!(spi->mode & SPI_CS_HIGH);
   596		}
   597		sh_msiof_spi_set_pin_regs(p, ss, !!(spi->mode & SPI_CPOL),
   598					  !!(spi->mode & SPI_CPHA),
   599					  !!(spi->mode & SPI_3WIRE),
   600					  !!(spi->mode & SPI_LSB_FIRST), cs_high);
   601		return 0;
   602	}
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
