Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE642375B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 15:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1RNqtgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701703156; x=1733239156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HrPuf3RtcFKj+a3zVlizOd1McaTeRaEp1C41H0DqCdo=;
  b=V1RNqtgc+TVrOmBOJz+7/eLESC8TGXARyap7AAoYRCV3C+DMrJHhTjUv
   GSxHGq5LFjNuujnGONEiRZpykO3QL4BMV3f4E36M77Bu+2PcZn4xDS1bW
   nTQUKcP2v308AzztNxAxgf867Xuyq5Oh9kYE33T1UX50IJwNEX7gO+EJv
   2eZ4m6D1do4B/XUKVqCjpP0/DKVpiTw/P12gawXEScRB55PlnBkRZvWbc
   58X35zV3wdXZn8NxxRulAakmQl94CNQKQgiJIlPbsgAO+tHVIuK/f7dHD
   tESxJCw0mMkqXtpldTRyEK3ay7G00bjKpkN8FBQFxS86hZPwBLmf7i5kL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="801138"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="801138"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 07:19:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="861405026"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861405026"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 07:19:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAAj1-0007pu-0i;
	Mon, 04 Dec 2023 15:19:11 +0000
Date: Mon, 4 Dec 2023 23:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/video/fbdev/omap/lcdc.c:642:23: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202312042207.lG7YN0oe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 804f7f19c2e2928aeb8eafef8379fe8b8d13f98b fbdev: omap: avoid using mach/*.h files
date:   1 year, 7 months ago
config: arm-randconfig-r131-20231117 (https://download.01.org/0day-ci/archive/20231204/202312042207.lG7YN0oe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312042207.lG7YN0oe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312042207.lG7YN0oe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/omap/lcdc.c:642:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *vaddr @@     got void *static [addressable] [assigned] [toplevel] vram_virt @@
   drivers/video/fbdev/omap/lcdc.c:642:23: sparse:     expected void [noderef] __iomem *vaddr
   drivers/video/fbdev/omap/lcdc.c:642:23: sparse:     got void *static [addressable] [assigned] [toplevel] vram_virt
   drivers/video/fbdev/omap/lcdc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:258:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/video/fbdev/omap/omapfb_main.c:1027:11: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/omap/omapfb_main.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/radix-tree.h, ...):
   include/linux/page-flags.h:258:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/video/fbdev/omap/lcd_mipid.c:451:23: sparse: sparse: cast to restricted __be32
   drivers/video/fbdev/omap/lcd_mipid.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/radix-tree.h, ...):
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
