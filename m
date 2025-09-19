Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45013164DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 15:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758296092; cv=none; b=maerJhiLt+d4y3KxUKK9eaMy4V7coUi4TvHDmTsZKOcr1vMplnUB9YvfSEAW1qNr9XGbyBzvG7o+OT2Wlp6LnmGl3nIJRGCxd34pzqcVkmQPl3hwJiRJUCKeB4qnrWP8/szNPPo3dkAorzqsGyaHYwtD5SAqg1IvkPwkaT60+Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758296092; c=relaxed/simple;
	bh=FTYV2dEd9yeBXE9Xf75nc5VYJCqGYA9oyAlTER+XDFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IvCRJoAQfPU63pWV1bw/QktDx8WenSLnIhnBl7pQKQlbLhML0G79xaOyzV0mPDyQ9UidPuXiO1rGDZS5skOUrIeuc5NdPCM4rGXu7XKzzaHW13hVq6BoY1nGR4T8ocvRXu+SYWLM75KOsTtiMg4ZGvixG2d5PDNO7KHNMCWXApg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOsXDNzi; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOsXDNzi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758296091; x=1789832091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FTYV2dEd9yeBXE9Xf75nc5VYJCqGYA9oyAlTER+XDFI=;
  b=fOsXDNzibp8otEv8hR1ApLle/v1grRwtGqE+WeWPx/kxDOtW/QikDJpx
   9305d74TVoBvUrU5eUuDYQ8RM0cFCQix9N7OQNIbtSTDwBPXmkbKHL4uO
   3kiat1nECo1aswCB4VjR7tYjxTp5DVVIMM5NwwvLg1Cv4IwrwRdYRay4y
   5detdpdpHUJ8ZPusx6QYf3mk/y5e+OFBROOrLP/gnJX7WgAOduc6LvkXe
   19Zd5IVfmaoHSSFgbvFuqhQDG0PhCPs+SjFbaFxKojJEQYkD66AB5Hk4+
   Rzhm4kVII5gfh20ddaNzdQx0qJN2NM/Z7StlwBsjbvctsVCu9El/sh5sI
   Q==;
X-CSE-ConnectionGUID: Q6KhKhK7QoulRzeJEjQujA==
X-CSE-MsgGUID: UhCpICq7Q2awyvKQnKy11g==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="60532510"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60532510"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 08:34:50 -0700
X-CSE-ConnectionGUID: ugJmHvHNTpGjr/nR2qCAug==
X-CSE-MsgGUID: iat2rJ8RSau0mHXGvZnqYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="206805395"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Sep 2025 08:34:49 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzd8I-0004Q3-1r;
	Fri, 19 Sep 2025 15:34:46 +0000
Date: Fri, 19 Sep 2025 23:34:26 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 39/44]
 arch/powerpc/platforms/ps3/system-bus.c:594:17: error: 'return' with no
 value, in function returning non-void
Message-ID: <202509192314.xBepoTlR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   89994637866a163d8f6c6c0aad64a64115fc05cd
commit: 05219b5f489decdb1f4b89b4eeaf14206d2a3f39 [39/44] powerpc: Convert to physical address DMA mapping
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250919/202509192314.xBepoTlR-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509192314.xBepoTlR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509192314.xBepoTlR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/ps3/system-bus.c: In function 'ps3_ioc0_map_phys':
>> arch/powerpc/platforms/ps3/system-bus.c:594:17: error: 'return' with no value, in function returning non-void [-Wreturn-mismatch]
     594 |                 return;
         |                 ^~~~~~
   arch/powerpc/platforms/ps3/system-bus.c:582:19: note: declared here
     582 | static dma_addr_t ps3_ioc0_map_phys(struct device *_dev, phys_addr_t phys,
         |                   ^~~~~~~~~~~~~~~~~


vim +/return +594 arch/powerpc/platforms/ps3/system-bus.c

   581	
   582	static dma_addr_t ps3_ioc0_map_phys(struct device *_dev, phys_addr_t phys,
   583					    size_t size,
   584					    enum dma_data_direction direction,
   585					    unsigned long attrs)
   586	{
   587		struct ps3_system_bus_device *dev = ps3_dev_to_system_bus_dev(_dev);
   588		int result;
   589		dma_addr_t bus_addr;
   590		u64 iopte_flag;
   591		void *ptr = phys_to_virt(phys);
   592	
   593		if (attrs & DMA_ATTR_MMIO)
 > 594			return;
   595	
   596		iopte_flag = CBE_IOPTE_M;
   597		switch (direction) {
   598		case DMA_BIDIRECTIONAL:
   599			iopte_flag |= CBE_IOPTE_PP_R | CBE_IOPTE_PP_W | CBE_IOPTE_SO_RW;
   600			break;
   601		case DMA_TO_DEVICE:
   602			iopte_flag |= CBE_IOPTE_PP_R | CBE_IOPTE_SO_R;
   603			break;
   604		case DMA_FROM_DEVICE:
   605			iopte_flag |= CBE_IOPTE_PP_W | CBE_IOPTE_SO_RW;
   606			break;
   607		default:
   608			/* not happened */
   609			BUG();
   610		}
   611		result = ps3_dma_map(dev->d_region, (unsigned long)ptr, size,
   612				     &bus_addr, iopte_flag);
   613	
   614		if (result) {
   615			pr_debug("%s:%d: ps3_dma_map failed (%d)\n",
   616				__func__, __LINE__, result);
   617		}
   618		return bus_addr;
   619	}
   620	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
