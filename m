Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0E41FD6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 19:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzqY+KW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701026061; x=1732562061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r2sZQEOMNhjDK37zXLM4VYwnP0gbC+2hq6gPw2iJp+s=;
  b=VzqY+KW/R5Z/jsKbHZl+6wciit6SKkg+MyIAWms3pj8d9YmiHeb+HiKy
   amwLL480Cgf8P6Tyx3K9KFdL0YbeQ73r0dL4E8HNQzIimD1zHR4RkXHZT
   med3PUVwqgtL/GhqsPQbz6u7ou1JclZfQe+Ao4UU89bo6iQBoGFgwUho/
   75LtGw9/MzNoIqN7FZHAjyt6Mz/VdoILsxDI0VpPFcq/puSoGJIwfdgJK
   eJGt+xykvermMExN5na+AAIm2LIg1O8zOeWLL75rss2QNdHZMr0bYkTbH
   +ZNaSgzKzJHQgedYIhtjg5cO1n07oJeOxJBv8ejRlOPLN0Y6AUnDDD5hP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="396508464"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="396508464"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 11:14:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="911907334"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="911907334"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Nov 2023 11:14:19 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7Ka8-0005RR-36;
	Sun, 26 Nov 2023 19:14:16 +0000
Date: Mon, 27 Nov 2023 03:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 251/382]
 drivers/dma-buf/heaps/carveout-heap.c:363:21: sparse: sparse: symbol
 'heap_areas' was not declared. Should it be static?
Message-ID: <202311270152.fCoMBL0f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   3a4f51391fe1d39254fed39393815b2879e44d73
commit: 0657a5681046633ab41f6505bcdbc292ee2ce3d4 [251/382] dma-buf: heaps: Add Carveout heap to DMA-BUF Heaps
config: riscv-randconfig-r112-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270152.fCoMBL0f-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270152.fCoMBL0f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270152.fCoMBL0f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zicbom_zihintpause'
>> drivers/dma-buf/heaps/carveout-heap.c:363:21: sparse: sparse: symbol 'heap_areas' was not declared. Should it be static?
>> drivers/dma-buf/heaps/carveout-heap.c:364:8: sparse: sparse: symbol 'heap_area_count' was not declared. Should it be static?

vim +/heap_areas +363 drivers/dma-buf/heaps/carveout-heap.c

   361	
   362	#define MAX_HEAP_AREAS 7
 > 363	struct reserved_mem heap_areas[MAX_HEAP_AREAS];
 > 364	size_t heap_area_count;
   365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
