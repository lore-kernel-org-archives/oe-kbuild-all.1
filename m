Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DF917D6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 05:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769662810; cv=none; b=ON/xSF1TajlXduW7VXS9nu7MkqB81caQxOikTy4G8sKG0fsjwOFu2J2pezSxmrp/txDvg5V4dDhChdE/VuG78wn2qOjAF69DFaQPqc5LN+ukBh+EBB1O4C61oEVnu8sHF49jwZ2eN/8UqTILZoFH8SR6Ef0kewqFdO3tYZ2CbIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769662810; c=relaxed/simple;
	bh=QlmKrOjuY+knU1zA3JUU1Jo+sD8HikI+L8Nnagaaqps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H8A8i6gSgzEA1L5g1Ck+/wYoNUuz8B6WoFBt+ucqyY+RwX6nbm5ky6N0eai11+Bb3Q6JOgiQBmxHK0JB4PV2v63d0uBVHNzz+m6V7v/Ts80dnczfgggo7gjOsmVyDIL16p46Jq1XxeHTkgUghq7pROyKDOYT7tMrlCqKsU+QDsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcWgNiM6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcWgNiM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769662809; x=1801198809;
  h=date:from:to:cc:subject:message-id;
  bh=QlmKrOjuY+knU1zA3JUU1Jo+sD8HikI+L8Nnagaaqps=;
  b=jcWgNiM6l5r+TzgE5aM5E8ujHUlX+Ad8W8JMOyhPrE7TiTjvJYUQrW+f
   qghhRF26haY0+IFv0HJpmrRURDpb7HLQmIowrCPnnmMatIWZRTFeOLyMi
   VK2tdbZoEPBQwyeD7Eaf3LN5AsqS5xXvRdMKDmS8Y8hC9HiSwST5Ok3QU
   IzHE26SuKibvXxsMfR/K/cfb/Y8cxs+0Jnt/yhAfDiJGUowZWUJggt3mH
   p/GQCWF/LGjJ1fLTEvd/ZF+FxiGgTpIwLIO2NnSmy2+lpLB6qH8LfkdGd
   bRXxMrO9SilBopCKKgR8kZ0nWsZ6UIPoA7/UmdJAptVYb90yOSQ7lEgDX
   g==;
X-CSE-ConnectionGUID: dDsXz2EAScKM96dQpMWiag==
X-CSE-MsgGUID: jBYyRWaIRBC6IFyOvTuveQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="88307093"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="88307093"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 21:00:08 -0800
X-CSE-ConnectionGUID: v3omfQH+Q+y1/mOiqjDbLg==
X-CSE-MsgGUID: BHiRYOluS66sfQuKbkst4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208560647"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Jan 2026 21:00:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlK8R-00000000b72-3yal;
	Thu, 29 Jan 2026 05:00:03 +0000
Date: Thu, 29 Jan 2026 12:59:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 10/10]
 drivers/spi/spi-lp8841-rtc.c:62:28: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202601291245.NIgpvnRp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   1c9a36be08e2ec0df08adea5af77949513a5e13d
commit: 1c9a36be08e2ec0df08adea5af77949513a5e13d [10/10] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: parisc-randconfig-r121-20260129 (https://download.01.org/0day-ci/archive/20260129/202601291245.NIgpvnRp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291245.NIgpvnRp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291245.NIgpvnRp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/spi/spi-lp8841-rtc.c:111:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:111:41: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/spi/spi-lp8841-rtc.c:111:41: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:120:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:120:41: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/spi/spi-lp8841-rtc.c:120:41: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:142:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:142:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/spi/spi-lp8841-rtc.c:142:33: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:146:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:146:41: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/spi/spi-lp8841-rtc.c:146:41: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:208:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *iomem @@     got void [noderef] __iomem * @@
   drivers/spi/spi-lp8841-rtc.c:208:21: sparse:     expected void *iomem
   drivers/spi/spi-lp8841-rtc.c:208:21: sparse:     got void [noderef] __iomem *
   drivers/spi/spi-lp8841-rtc.c:56:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:56:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/spi/spi-lp8841-rtc.c:56:33: sparse:     got void *iomem
>> drivers/spi/spi-lp8841-rtc.c:62:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:62:28: sparse:     expected void const [noderef] __iomem *
   drivers/spi/spi-lp8841-rtc.c:62:28: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:56:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:56:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/spi/spi-lp8841-rtc.c:56:33: sparse:     got void *iomem
>> drivers/spi/spi-lp8841-rtc.c:62:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:62:28: sparse:     expected void const [noderef] __iomem *
   drivers/spi/spi-lp8841-rtc.c:62:28: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     got void *iomem

vim +62 drivers/spi/spi-lp8841-rtc.c

7ecbfff6711fb3 Sergei Ianovich 2016-02-23  58  
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  59  static inline int
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  60  getmiso(struct spi_lp8841_rtc *data)
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  61  {
7ecbfff6711fb3 Sergei Ianovich 2016-02-23 @62  	return ioread8(data->iomem) & SPI_LP8841_RTC_MISO;
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  63  }
7ecbfff6711fb3 Sergei Ianovich 2016-02-23  64  

:::::: The code at line 62 was first introduced by commit
:::::: 7ecbfff6711fb331591003ac32c002ce55a0758f spi: master driver to enable RTC on ICPDAS LP-8841

:::::: TO: Sergei Ianovich <ynvich@gmail.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
