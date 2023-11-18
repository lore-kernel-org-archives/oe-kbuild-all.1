Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332E123A8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 03:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfJ5VUMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700279369; x=1731815369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+EoFR0cj0+VGJ4groLlxTDAtdkFOj1XwxfhyfTgLFts=;
  b=AfJ5VUMJh07awSRan8XQQuvbYIdYsAO4esILVlGwezZa80pBDJVMAi8L
   glWIppT+qWkw0fUDTklFD13KZMz3bGWSYax0gCv8L1ZUMSZWgIN7SB4p2
   IqpE30J08viRvkANtnxObOE1yB2BYGnvvVhSpZPe8wuCDX1oe3skVDpF0
   HK9N1AWQDh/eaB3w8aAUnQHq4jaN6NJYHORat95xfqx/VNNv+5rabBvuU
   XugZmB9taYqHfcNBl8dFPzWJw3bU/TyG/NSO9XtFO9QEsPmzaTduFPaaM
   grVUb4WBLgSqNM8rPZ/UQ33UrFTwZ44mjUzfXmjo8Ds0l+lu5ctUwlXdl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="376452266"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="376452266"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 19:49:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="13661858"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Nov 2023 19:49:25 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4CKg-0003Up-0K;
	Sat, 18 Nov 2023 03:49:22 +0000
Date: Sat, 18 Nov 2023 11:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: drivers/remoteproc/stm32_rproc.c:139:20: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202311181131.FV6wkpIs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   791c8ab095f71327899023223940dd52257a4173
commit: 03bd158e1535e68bcd2b1e095b0ebcad7c84bd20 remoteproc: stm32: use correct format strings on 64-bit
date:   5 months ago
config: arm-randconfig-r121-20231118 (https://download.01.org/0day-ci/archive/20231118/202311181131.FV6wkpIs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231118/202311181131.FV6wkpIs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181131.FV6wkpIs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/stm32_rproc.c:122:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/stm32_rproc.c:122:12: sparse:     expected void *va
   drivers/remoteproc/stm32_rproc.c:122:12: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/stm32_rproc.c:139:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *io_addr @@     got void *va @@
   drivers/remoteproc/stm32_rproc.c:139:20: sparse:     expected void volatile [noderef] __iomem *io_addr
   drivers/remoteproc/stm32_rproc.c:139:20: sparse:     got void *va
   drivers/remoteproc/stm32_rproc.c:644:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/remoteproc/stm32_rproc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +139 drivers/remoteproc/stm32_rproc.c

13140de09cc2dd Fabien Dessenne 2019-05-14  114  
13140de09cc2dd Fabien Dessenne 2019-05-14  115  static int stm32_rproc_mem_alloc(struct rproc *rproc,
13140de09cc2dd Fabien Dessenne 2019-05-14  116  				 struct rproc_mem_entry *mem)
13140de09cc2dd Fabien Dessenne 2019-05-14  117  {
13140de09cc2dd Fabien Dessenne 2019-05-14  118  	struct device *dev = rproc->dev.parent;
13140de09cc2dd Fabien Dessenne 2019-05-14  119  	void *va;
13140de09cc2dd Fabien Dessenne 2019-05-14  120  
03bd158e1535e6 Arnd Bergmann   2023-06-09  121  	dev_dbg(dev, "map memory: %pad+%zx\n", &mem->dma, mem->len);
13140de09cc2dd Fabien Dessenne 2019-05-14 @122  	va = ioremap_wc(mem->dma, mem->len);
13140de09cc2dd Fabien Dessenne 2019-05-14  123  	if (IS_ERR_OR_NULL(va)) {
03bd158e1535e6 Arnd Bergmann   2023-06-09  124  		dev_err(dev, "Unable to map memory region: %pad+0x%zx\n",
13140de09cc2dd Fabien Dessenne 2019-05-14  125  			&mem->dma, mem->len);
13140de09cc2dd Fabien Dessenne 2019-05-14  126  		return -ENOMEM;
13140de09cc2dd Fabien Dessenne 2019-05-14  127  	}
13140de09cc2dd Fabien Dessenne 2019-05-14  128  
13140de09cc2dd Fabien Dessenne 2019-05-14  129  	/* Update memory entry va */
13140de09cc2dd Fabien Dessenne 2019-05-14  130  	mem->va = va;
13140de09cc2dd Fabien Dessenne 2019-05-14  131  
13140de09cc2dd Fabien Dessenne 2019-05-14  132  	return 0;
13140de09cc2dd Fabien Dessenne 2019-05-14  133  }
13140de09cc2dd Fabien Dessenne 2019-05-14  134  
13140de09cc2dd Fabien Dessenne 2019-05-14  135  static int stm32_rproc_mem_release(struct rproc *rproc,
13140de09cc2dd Fabien Dessenne 2019-05-14  136  				   struct rproc_mem_entry *mem)
13140de09cc2dd Fabien Dessenne 2019-05-14  137  {
13140de09cc2dd Fabien Dessenne 2019-05-14  138  	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
13140de09cc2dd Fabien Dessenne 2019-05-14 @139  	iounmap(mem->va);
13140de09cc2dd Fabien Dessenne 2019-05-14  140  
13140de09cc2dd Fabien Dessenne 2019-05-14  141  	return 0;
13140de09cc2dd Fabien Dessenne 2019-05-14  142  }
13140de09cc2dd Fabien Dessenne 2019-05-14  143  

:::::: The code at line 139 was first introduced by commit
:::::: 13140de09cc2dd5e5166ad42292bb82af4e23cef remoteproc: stm32: add an ST stm32_rproc driver

:::::: TO: Fabien Dessenne <fabien.dessenne@st.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
