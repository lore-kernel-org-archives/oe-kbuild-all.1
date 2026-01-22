Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2019030EF6B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 00:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769043086; cv=none; b=sy5HdG/MKPwjoGHXrPGOX7pXl3l0dcJZ+gv/iHFqEjYVLeZj9hNJOJK5To0ElLOdVo9l+BTWI/xYDvWBBEfPwDN3pxppemnTgEVNbzCKfsCjb4hkLa9WqPmzbgAO8HRW9YXiP6FJH+xGBllssRbhq/n4I3cc1cDX99PQFRdtZfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769043086; c=relaxed/simple;
	bh=j3dXB6NdxjkDmX47nsWF0BMFig45t/16waBKVBs5lA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PjnZ0pNPaAOyJBX9zxDWhZXTfvVQakvRCe6+1MeEYNccdF8kgsgQ0PrnPzMqYvDtabGfu5HigDK1s3nwxdlofG5972c7ur4hbQF2qmIiwB8ItwGyIdOP1slzUcXkmXSp5Y3bUK1ptPt+g2uN9crlfxXZvGjY/Lbda06E5iTpZgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWMjXjDZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWMjXjDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769043084; x=1800579084;
  h=date:from:to:cc:subject:message-id;
  bh=j3dXB6NdxjkDmX47nsWF0BMFig45t/16waBKVBs5lA4=;
  b=PWMjXjDZOB9K5jgk2goIq7M9EXd0bryClNHyiArFcBG3OKPAWp1vIkox
   CKjUIitl6f0WGEbaqi+ouwOwaA3ZTVHUsRpPWJW86HEJnjxN6imGirZMJ
   dPm3hgREl3CqhrywfmDjRTwnnRMD516ObXCorRqK8ZdadyKw3I5LMsqCl
   OT546O1x5M+luem6zZhiQzZCgGvsV9EG167C5JCbmsRQ6ml85YxYUGjil
   H6fOMryLuSHYi1WAvzeZ+xohpaYbPp5UsnZn71erTAH4p3FV/Bb4NXRAz
   pUuAepOYRN0Jej0vlqqoezx1WHWg+X+33ace1iBSR50e7SypgvydmiyP/
   g==;
X-CSE-ConnectionGUID: QZ0XiEw2TCiPT5QYgtuKQw==
X-CSE-MsgGUID: s7qrNyXIRWuxNNstl7T64A==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70195030"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70195030"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 16:51:24 -0800
X-CSE-ConnectionGUID: jya8Nsr9QwekZkC00nxeiA==
X-CSE-MsgGUID: 5MeMwXThSNuHcBjmgwmobQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jan 2026 16:51:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viiut-00000000SDT-2tkM;
	Thu, 22 Jan 2026 00:51:19 +0000
Date: Thu, 22 Jan 2026 08:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 18/18]
 drivers/remoteproc/rcar_rproc.c:46:20: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202601220824.OOBYQyyy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   65d443800b21b6e87b8a3d9b81cae549d2102db9
commit: 65d443800b21b6e87b8a3d9b81cae549d2102db9 [18/18] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: mips-randconfig-r132-20260122 (https://download.01.org/0day-ci/archive/20260122/202601220824.OOBYQyyy-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220824.OOBYQyyy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220824.OOBYQyyy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/rcar_rproc.c:29:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/rcar_rproc.c:29:12: sparse:     expected void *va
   drivers/remoteproc/rcar_rproc.c:29:12: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/rcar_rproc.c:46:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *va @@
   drivers/remoteproc/rcar_rproc.c:46:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/remoteproc/rcar_rproc.c:46:20: sparse:     got void *va
--
>> drivers/spi/spi-lp8841-rtc.c:111:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:111:41: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/spi/spi-lp8841-rtc.c:111:41: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:120:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:120:41: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/spi/spi-lp8841-rtc.c:120:41: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:142:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:142:33: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/spi/spi-lp8841-rtc.c:142:33: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:146:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:146:41: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/spi/spi-lp8841-rtc.c:146:41: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:208:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *iomem @@     got void [noderef] __iomem * @@
   drivers/spi/spi-lp8841-rtc.c:208:21: sparse:     expected void *iomem
   drivers/spi/spi-lp8841-rtc.c:208:21: sparse:     got void [noderef] __iomem *
   drivers/spi/spi-lp8841-rtc.c:56:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:56:33: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/spi/spi-lp8841-rtc.c:56:33: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:62:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:62:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/spi/spi-lp8841-rtc.c:62:28: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:56:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:56:33: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/spi/spi-lp8841-rtc.c:56:33: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:62:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:62:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/spi/spi-lp8841-rtc.c:62:28: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     got void *iomem
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *iomem @@
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/spi/spi-lp8841-rtc.c:46:33: sparse:     got void *iomem

vim +46 drivers/remoteproc/rcar_rproc.c

285892a74f1370 Julien Massot 2021-12-07  41  
285892a74f1370 Julien Massot 2021-12-07  42  static int rcar_rproc_mem_release(struct rproc *rproc,
285892a74f1370 Julien Massot 2021-12-07  43  				   struct rproc_mem_entry *mem)
285892a74f1370 Julien Massot 2021-12-07  44  {
285892a74f1370 Julien Massot 2021-12-07  45  	dev_dbg(&rproc->dev, "unmap memory: %pa\n", &mem->dma);
285892a74f1370 Julien Massot 2021-12-07 @46  	iounmap(mem->va);
285892a74f1370 Julien Massot 2021-12-07  47  
285892a74f1370 Julien Massot 2021-12-07  48  	return 0;
285892a74f1370 Julien Massot 2021-12-07  49  }
285892a74f1370 Julien Massot 2021-12-07  50  

:::::: The code at line 46 was first introduced by commit
:::::: 285892a74f1370a12249f765c6a4e3b16194852e remoteproc: Add Renesas rcar driver

:::::: TO: Julien Massot <julien.massot@iot.bzh>
:::::: CC: Mathieu Poirier <mathieu.poirier@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
