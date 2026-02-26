Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C0F395275
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 08:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095436; cv=none; b=lA2QMIT7Z/sQPzkQtHkaiQGCMAoQXyHZHF1p4B2dJ9Zro1ve0A/175GusljSNBg4Hbxr4eVSYSaW20XkkGq2LhECuggmE7LCC/oZZH0qmvA70IbkVYTBSN5kes6WLiRaotoKMhtBnRIryQOuMRWgmAfxNlqqIBSfRsBL6pKUrIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095436; c=relaxed/simple;
	bh=LWHhHbNyBFOxgRMwLOsyUoQRrO5T67oTfVmGHsjFQBA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qf+PEdyJ08KFHwON9hypBVPd2Kp930LRM5xCV4pc6gkkau+5MNa+0NIZs5MHVIIJeSL7WvtJoe/Q3lVGGnUTy33ftPN4LoqgvHFbcYNQt/0fodqFxUqxB7D3mVLDJ/1pBzPpig/rE0NCCoOnwjead8KHt4prx8ZfICXliXVoFTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npUNKt20; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npUNKt20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772095433; x=1803631433;
  h=date:from:to:cc:subject:message-id;
  bh=LWHhHbNyBFOxgRMwLOsyUoQRrO5T67oTfVmGHsjFQBA=;
  b=npUNKt20s3yai5/yfTwMw+qDkt6I7CnJmh7Go6SezmO9JuBr/LKKQXkE
   vU3Qcc/gLHry4a3n9ieCs6QHueFckzEd5AD1yPDkYi6qNC8zylSH+rFIF
   iB/DNpnaSfHbZ076h46t4z2QNEj/FZStIzbhOWpFD/ACyztoXCLfSwB6e
   gktMiQ1CAny0gs2vBn4aUrQ/gVlbuha5Eqv1SPGp4gDJQC4PELH0lXI34
   BuK5YzTufEZkvuAl8iCocP+CcO4W6BUGRXVK39159w0UXMb/w2A2orlGx
   L2W074obpdEa07c5MJhjBpHuH0RhhqpcT+XAdKctzR6n1OfL8jIRRumky
   w==;
X-CSE-ConnectionGUID: jMbB3aS5SyiqodpWhloaMw==
X-CSE-MsgGUID: 5BbkAO5ETAaiwCD0Or+PxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73221022"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73221022"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 00:43:52 -0800
X-CSE-ConnectionGUID: kxV0zI+UQvyqpN4LUC30JQ==
X-CSE-MsgGUID: 3KA4mqqIQDiJurDifvm36A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="215615126"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2026 00:43:51 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvWy6-000000008cH-1Ctf;
	Thu, 26 Feb 2026 08:43:36 +0000
Date: Thu, 26 Feb 2026 16:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:dma-buf/heaps-as-modules 5/11]
 kernel/dma/contiguous.c:267: undefined reference to
 `dma_heap_cma_register_heap'
Message-ID: <202602261642.TyLgeKsx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git dma-buf/heaps-as-modules
head:   76fb805e4205aeb664b6d25e17e41d2d3ccd2a90
commit: 6c2c98f655198f65147567cbd9cce6f2f07526c4 [5/11] dma: contiguous: Turn heap registration logic around
config: s390-randconfig-002-20260226 (https://download.01.org/0day-ci/archive/20260226/202602261642.TyLgeKsx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602261642.TyLgeKsx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602261642.TyLgeKsx-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/dma/contiguous.o: in function `dma_contiguous_reserve':
>> kernel/dma/contiguous.c:267: undefined reference to `dma_heap_cma_register_heap'
   s390-linux-ld: drivers/dma-buf/heaps/cma_heap.o: in function `add_cma_heaps':
>> drivers/dma-buf/heaps/cma_heap.c:414: undefined reference to `dma_contiguous_get_reserved_region'
>> s390-linux-ld: drivers/dma-buf/heaps/cma_heap.c:414: undefined reference to `dma_contiguous_get_reserved_region'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [m]:
   - REGULATOR_RT5133 [=m] && REGULATOR [=y] && I2C [=m] && GPIOLIB [=y] && OF [=y]


vim +267 kernel/dma/contiguous.c

b7176c261cdbce kernel/dma/contiguous.c       Barry Song         2020-08-24  212  
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  213  /**
a2547380393ac8 drivers/base/dma-contiguous.c Marek Szyprowski   2013-07-29  214   * dma_contiguous_reserve() - reserve area(s) for contiguous memory handling
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  215   * @limit: End address of the reserved memory (optional, 0 for any).
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  216   *
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  217   * This function reserves memory from early allocator. It should be
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  218   * called by arch specific code once the early allocator (memblock or bootmem)
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  219   * has been activated and all other subsystems have already allocated/reserved
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  220   * memory.
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  221   */
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  222  void __init dma_contiguous_reserve(phys_addr_t limit)
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  223  {
4009793e15d444 drivers/base/dma-contiguous.c Vitaly Andrianov   2012-12-05  224  	phys_addr_t selected_size = 0;
5ea3b1b2f8ad91 drivers/base/dma-contiguous.c Akinobu Mita       2014-06-04  225  	phys_addr_t selected_base = 0;
5ea3b1b2f8ad91 drivers/base/dma-contiguous.c Akinobu Mita       2014-06-04  226  	phys_addr_t selected_limit = limit;
5ea3b1b2f8ad91 drivers/base/dma-contiguous.c Akinobu Mita       2014-06-04  227  	bool fixed = false;
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  228  
bf29bfaa54901a kernel/dma/contiguous.c       Yajun Deng         2023-07-12  229  	dma_numa_cma_reserve();
22e4a348f87c59 kernel/dma/contiguous.c       Yajun Deng         2023-05-12  230  
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  231  	pr_debug("%s(limit %08lx)\n", __func__, (unsigned long)limit);
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  232  
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  233  	if (size_cmdline != -1) {
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  234  		selected_size = size_cmdline;
5ea3b1b2f8ad91 drivers/base/dma-contiguous.c Akinobu Mita       2014-06-04  235  		selected_base = base_cmdline;
aa807b9f22df2e kernel/dma/contiguous.c       Feng Tang          2025-06-12  236  
aa807b9f22df2e kernel/dma/contiguous.c       Feng Tang          2025-06-12  237  		/* Hornor the user setup dma address limit */
aa807b9f22df2e kernel/dma/contiguous.c       Feng Tang          2025-06-12  238  		selected_limit = limit_cmdline ?: limit;
aa807b9f22df2e kernel/dma/contiguous.c       Feng Tang          2025-06-12  239  
5ea3b1b2f8ad91 drivers/base/dma-contiguous.c Akinobu Mita       2014-06-04  240  		if (base_cmdline + size_cmdline == limit_cmdline)
5ea3b1b2f8ad91 drivers/base/dma-contiguous.c Akinobu Mita       2014-06-04  241  			fixed = true;
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  242  	} else {
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  243  #ifdef CONFIG_CMA_SIZE_SEL_MBYTES
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  244  		selected_size = size_bytes;
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  245  #elif defined(CONFIG_CMA_SIZE_SEL_PERCENTAGE)
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  246  		selected_size = cma_early_percent_memory();
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  247  #elif defined(CONFIG_CMA_SIZE_SEL_MIN)
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  248  		selected_size = min(size_bytes, cma_early_percent_memory());
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  249  #elif defined(CONFIG_CMA_SIZE_SEL_MAX)
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  250  		selected_size = max(size_bytes, cma_early_percent_memory());
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  251  #endif
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  252  	}
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  253  
a2547380393ac8 drivers/base/dma-contiguous.c Marek Szyprowski   2013-07-29  254  	if (selected_size && !dma_contiguous_default_area) {
8f1fc1bf1a3d5a kernel/dma/contiguous.c       Maxime Ripard      2025-10-13  255  		int ret;
8f1fc1bf1a3d5a kernel/dma/contiguous.c       Maxime Ripard      2025-10-13  256  
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  257  		pr_debug("%s: reserving %ld MiB for global area\n", __func__,
4009793e15d444 drivers/base/dma-contiguous.c Vitaly Andrianov   2012-12-05  258  			 (unsigned long)selected_size / SZ_1M);
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  259  
c33efdfcfa6f80 kernel/dma/contiguous.c       Shanker Donthineni 2026-01-29  260  		ret = dma_contiguous_reserve_area(selected_size, selected_base,
5ea3b1b2f8ad91 drivers/base/dma-contiguous.c Akinobu Mita       2014-06-04  261  						  selected_limit,
5ea3b1b2f8ad91 drivers/base/dma-contiguous.c Akinobu Mita       2014-06-04  262  						  &dma_contiguous_default_area,
5ea3b1b2f8ad91 drivers/base/dma-contiguous.c Akinobu Mita       2014-06-04  263  						  fixed);
c33efdfcfa6f80 kernel/dma/contiguous.c       Shanker Donthineni 2026-01-29  264  		if (ret)
c33efdfcfa6f80 kernel/dma/contiguous.c       Shanker Donthineni 2026-01-29  265  			return;
8f1fc1bf1a3d5a kernel/dma/contiguous.c       Maxime Ripard      2025-10-13  266  
8f1fc1bf1a3d5a kernel/dma/contiguous.c       Maxime Ripard      2025-10-13 @267  		ret = dma_heap_cma_register_heap(dma_contiguous_default_area);
8f1fc1bf1a3d5a kernel/dma/contiguous.c       Maxime Ripard      2025-10-13  268  		if (ret)
8f1fc1bf1a3d5a kernel/dma/contiguous.c       Maxime Ripard      2025-10-13  269  			pr_warn("Couldn't register default CMA heap.");
5ea3b1b2f8ad91 drivers/base/dma-contiguous.c Akinobu Mita       2014-06-04  270  	}
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  271  }
c64be2bb1c6eb4 drivers/base/dma-contiguous.c Marek Szyprowski   2011-12-29  272  

:::::: The code at line 267 was first introduced by commit
:::::: 8f1fc1bf1a3d5a61f7465435591a439c1e4671f2 dma: contiguous: Reserve default CMA heap

:::::: TO: Maxime Ripard <mripard@kernel.org>
:::::: CC: Sumit Semwal <sumit.semwal@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
