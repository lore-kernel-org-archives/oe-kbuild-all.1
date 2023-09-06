Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EB729AB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 22:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694039717; x=1725575717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qg1VT1sBPSgMYLBDvSJrNzsTj+lZy5SZ8Bvh677TZRA=;
  b=fx6R30kDju0Lh45HOc4TXptlVKS9qoEr5vQLOTLG1cCJzDekbNVMrdWJ
   IHCfMWrcBPqXr/rFQa3UMr2E/HD3r/8niazvXthHPi228Ld7oEJHOwArs
   ad8e6maexWsZPNJ0Yg81A9WRitCs+LvAgIs/YpMMekaweP5uHFNEPZEb+
   KdMBpCftgNrslFZ/tr6uK5muWskzr5v4NQlrUk6Qxg1xCjr8y9hPdXI1y
   bwugm8DoHt7d5l5c3Qr2GuUbAjuR6MhCom1j1G0kAo/uYjLTnw0AjgqJl
   Avj59SZsPcCfrHolqfIOyrT4JN0wR1NTUoBCArPKULWxQ+ru80Bq5puZe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="441188233"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="441188233"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 15:35:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865341984"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="865341984"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Sep 2023 15:35:07 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe173-0000eR-06;
	Wed, 06 Sep 2023 22:35:05 +0000
Date: Thu, 7 Sep 2023 06:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: drivers/remoteproc/stm32_rproc.c:122:12: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202309070614.RoOUEXgt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   744a759492b5c57ff24a6e8aabe47b17ad8ee964
commit: 03bd158e1535e68bcd2b1e095b0ebcad7c84bd20 remoteproc: stm32: use correct format strings on 64-bit
date:   3 months ago
config: csky-randconfig-r121-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070614.RoOUEXgt-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230907/202309070614.RoOUEXgt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070614.RoOUEXgt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/stm32_rproc.c:122:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/stm32_rproc.c:122:12: sparse:     expected void *va
   drivers/remoteproc/stm32_rproc.c:122:12: sparse:     got void [noderef] __iomem *
   drivers/remoteproc/stm32_rproc.c:139:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *va @@
   drivers/remoteproc/stm32_rproc.c:139:20: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/stm32_rproc.c:139:20: sparse:     got void *va
>> drivers/remoteproc/stm32_rproc.c:644:17: sparse: sparse: cast removes address space '__iomem' of expression

vim +122 drivers/remoteproc/stm32_rproc.c

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

:::::: The code at line 122 was first introduced by commit
:::::: 13140de09cc2dd5e5166ad42292bb82af4e23cef remoteproc: stm32: add an ST stm32_rproc driver

:::::: TO: Fabien Dessenne <fabien.dessenne@st.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
