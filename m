Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A22C79E1C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 14:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXexr+Og"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702563575; x=1734099575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S9Cc4FVnez8OylvxlFTlGHOz/UjzO3c+U8FTgrr9GIs=;
  b=gXexr+OgzHoP1PArVXRMYfuBGUPwhTLjbIi0tI4IE/RBt3esAzHfWSpn
   Sx74vE/xSmWB421JuCGwNagtlNe5DdGn52VUQ0v/HpbF0012Wv0C6hp19
   6bCR0J9P2wc+3gnP7Q9HGAzFU+VZeDscL993Qi/LjXtyVO5jJsq4G1njq
   DUvpWp6gjLIhhCZTwrU8TXNQ3ssSGc8/ZYuRZnNtPECuNXbpQXmwtsKvZ
   ZWFZ75Qd2AQ3wdm2iOrzp85Y9PO447xR4KtJERr1sMPdkHJJqzHpKOUDJ
   wXlfUKE6h3LBv4snuBdFKSOXqpd/YIBfJUvwQoPPj9RnJNIXWnwLtuyne
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2292358"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="2292358"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 06:19:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1021519255"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1021519255"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Dec 2023 06:19:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDmYk-000MAO-38;
	Thu, 14 Dec 2023 14:19:30 +0000
Date: Thu, 14 Dec 2023 22:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/video/fbdev/omap/lcdc.c:642:23: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202312142216.PYFIXuY9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
commit: 804f7f19c2e2928aeb8eafef8379fe8b8d13f98b fbdev: omap: avoid using mach/*.h files
date:   1 year, 8 months ago
config: arm-randconfig-r131-20231117 (https://download.01.org/0day-ci/archive/20231214/202312142216.PYFIXuY9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312142216.PYFIXuY9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312142216.PYFIXuY9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/omap/lcdc.c:642:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *vaddr @@     got void *static [addressable] [assigned] [toplevel] vram_virt @@
   drivers/video/fbdev/omap/lcdc.c:642:23: sparse:     expected void [noderef] __iomem *vaddr
   drivers/video/fbdev/omap/lcdc.c:642:23: sparse:     got void *static [addressable] [assigned] [toplevel] vram_virt
   drivers/video/fbdev/omap/lcdc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:258:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/video/fbdev/omap/lcd_mipid.c:451:23: sparse: sparse: cast to restricted __be32
   drivers/video/fbdev/omap/lcd_mipid.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/radix-tree.h, ...):
   include/linux/page-flags.h:258:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/video/fbdev/omap/omapfb_main.c:1027:11: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/omap/omapfb_main.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/radix-tree.h, ...):
   include/linux/page-flags.h:258:46: sparse: sparse: self-comparison always evaluates to false

vim +642 drivers/video/fbdev/omap/lcdc.c

569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  620  
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  621  static int alloc_fbmem(struct omapfb_mem_region *region)
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  622  {
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  623  	int bpp;
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  624  	int frame_size;
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  625  	struct lcd_panel *panel = lcdc.fbdev->panel;
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  626  
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  627  	bpp = panel->bpp;
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  628  	if (bpp == 12)
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  629  		bpp = 16;
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  630  	frame_size = PAGE_ALIGN(panel->x_res * bpp / 8 * panel->y_res);
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  631  	if (region->size > frame_size)
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  632  		frame_size = region->size;
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  633  	lcdc.vram_size = frame_size;
f6e45661f9be54 drivers/video/fbdev/omap/lcdc.c Luis R. Rodriguez 2016-01-22  634  	lcdc.vram_virt = dma_alloc_wc(lcdc.fbdev->dev, lcdc.vram_size,
f6e45661f9be54 drivers/video/fbdev/omap/lcdc.c Luis R. Rodriguez 2016-01-22  635  				      &lcdc.vram_phys, GFP_KERNEL);
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  636  	if (lcdc.vram_virt == NULL) {
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  637  		dev_err(lcdc.fbdev->dev, "unable to allocate FB DMA memory\n");
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  638  		return -ENOMEM;
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  639  	}
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  640  	region->size = frame_size;
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  641  	region->paddr = lcdc.vram_phys;
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17 @642  	region->vaddr = lcdc.vram_virt;
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  643  	region->alloc = 1;
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  644  
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  645  	memset(lcdc.vram_virt, 0, lcdc.vram_size);
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  646  
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  647  	return 0;
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  648  }
569755c706f0f9 drivers/video/omap/lcdc.c       Imre Deak         2007-07-17  649  

:::::: The code at line 642 was first introduced by commit
:::::: 569755c706f0f94409edd2ae60b9878cb420844f OMAP: add TI OMAP1 internal LCD controller

:::::: TO: Imre Deak <imre.deak@solidboot.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
