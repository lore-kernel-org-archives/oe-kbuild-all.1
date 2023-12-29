Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F034017D1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 03:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEckXnL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703820485; x=1735356485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DXt9A2DepFHnFv6y/6etV/vptatPqOLYsRyjWiQHi8s=;
  b=gEckXnL/0Fnxs/q6xNvrnsy7vKo3YsHjcftAdOgtouu3iwpUQEeWQtzG
   A7loZCw+6j4rPxs+FN2eVdrZwyMDoXipUcQNm0lKBHd7e0XnSbFOsaVSR
   AMEC0o8iDVhZE2sEqyHQ4ueZDyh+HQMOr1Z83IBB0PudJ005t76bVkDMj
   1MlbBtDGy7UBUcG6KSnSMyuZ7Qud5yczIsMoyxkuZCMYZU0L4Hon86G92
   YfJmxWIXZto+0KkHdlIPsp5wtbwNwp2igA24dWfkW5EobxtG7itIJLAdq
   qULyjYxz3AiJ+0P8eADf1WCzO2XxP1c4uSLQxHc+amsUUbOEfjDqaPmyu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="396336550"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="396336550"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 19:28:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="844592465"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="844592465"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Dec 2023 19:28:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJ3Wh-000H3b-1N;
	Fri, 29 Dec 2023 03:27:27 +0000
Date: Fri, 29 Dec 2023 11:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 323/382] s390x-linux-ld:
 spi-cadence-quadspi.c:undefined reference to `spi_mem_exec_op'
Message-ID: <202312291113.VrCfLokG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   6fb4edc44604c47af3c3cad1b691773ab5c855a1
commit: 4535fc8cd288f5c537ff9b8abe0e3131a0ebcc98 [323/382] spi: cadence-qspi: Tune PHY to allow running at higher frequencies
config: s390-randconfig-002-20231228 (https://download.01.org/0day-ci/archive/20231229/202312291113.VrCfLokG-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312291113.VrCfLokG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312291113.VrCfLokG-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: drivers/spi/spi-cadence-quadspi.o: in function `cqspi_mem_do_calibration':
   spi-cadence-quadspi.c:(.text+0x2d3a): undefined reference to `spi_mem_exec_op'
>> s390x-linux-ld: spi-cadence-quadspi.c:(.text+0x32c6): undefined reference to `spi_mem_exec_op'
   s390x-linux-ld: spi-cadence-quadspi.c:(.text+0x3406): undefined reference to `spi_mem_exec_op'
   s390x-linux-ld: spi-cadence-quadspi.c:(.text+0x35be): undefined reference to `spi_mem_exec_op'
   s390x-linux-ld: spi-cadence-quadspi.c:(.text+0x36fe): undefined reference to `spi_mem_exec_op'
   s390x-linux-ld: drivers/spi/spi-cadence-quadspi.o:spi-cadence-quadspi.c:(.text+0x38c2): more undefined references to `spi_mem_exec_op' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
