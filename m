Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4234B38DF6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 16:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXHIolq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702053312; x=1733589312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LsPMmJtZcaZVmsx7fKHa1N0uHH9/QU5zB7Mt/dYr7JQ=;
  b=VXHIolq17wdt4aDY00bGQzMYy+kGP04mFKiUDb+PwDtlEFru0pNjrXou
   VwqSDRrFnNANAwysF3cYUuTyTITfL9aoPmr2+xwykMVK1u/GLlUnsK/lM
   ztILEGOfO6Df/oRFRmoKYvBIRxl7tTiDShlNE91P5zhRyQ4lTpI1kg0MA
   D97Mo426wbyxpcwXAKZl+6FF+9tHy6T8Ya2n92BBvGNCV6dHLXSZson4H
   X9Eh/Sh1ku+TmaeocYSX/Gfl2MFZO74TI1wWujW8UYvA0BVJaTdzcLes2
   KdxgYaQoNjswg7TFzvg5UwiBlKCzh3ZRiAgAwzFjdKhioXZb06QEbjiY4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1516579"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1516579"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 08:35:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1103611047"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1103611047"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 08 Dec 2023 08:35:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBdoZ-000E0l-1S;
	Fri, 08 Dec 2023 16:34:59 +0000
Date: Sat, 9 Dec 2023 00:34:44 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: drivers/video/fbdev/atmel_lcdfb.c:342:9: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202312090019.Qaf0s7b7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5e3f5b81de80c98338bcb47c233aebefee5a4801
commit: 90db9dbedd26ce029f3a0f8d2cbd3a142f452408 kasan, powerpc: don't rename memintrinsics if compiler adds prefixes
date:   9 months ago
config: powerpc-randconfig-r132-20231117 (https://download.01.org/0day-ci/archive/20231209/202312090019.Qaf0s7b7-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312090019.Qaf0s7b7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312090019.Qaf0s7b7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/atmel_lcdfb.c:334:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got void * @@
   drivers/video/fbdev/atmel_lcdfb.c:334:27: sparse:     expected char [noderef] __iomem *screen_base
   drivers/video/fbdev/atmel_lcdfb.c:334:27: sparse:     got void *
   drivers/video/fbdev/atmel_lcdfb.c:342:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:342:9: sparse:     expected void const *
   drivers/video/fbdev/atmel_lcdfb.c:342:9: sparse:     got char [noderef] __iomem *screen_base
   drivers/video/fbdev/atmel_lcdfb.c:342:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:342:9: sparse:     expected void const *
   drivers/video/fbdev/atmel_lcdfb.c:342:9: sparse:     got char [noderef] __iomem *screen_base
>> drivers/video/fbdev/atmel_lcdfb.c:342:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:342:9: sparse:     expected void *p
   drivers/video/fbdev/atmel_lcdfb.c:342:9: sparse:     got char [noderef] __iomem *screen_base
   drivers/video/fbdev/atmel_lcdfb.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:246:46: sparse: sparse: self-comparison always evaluates to false
   drivers/video/fbdev/atmel_lcdfb.c:313:59: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:313:59: sparse:     expected void *cpu_addr
   drivers/video/fbdev/atmel_lcdfb.c:313:59: sparse:     got char [noderef] __iomem *screen_base
   drivers/video/fbdev/atmel_lcdfb.c:313:59: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:313:59: sparse:     expected void *cpu_addr
   drivers/video/fbdev/atmel_lcdfb.c:313:59: sparse:     got char [noderef] __iomem *screen_base
--
   drivers/mtd/nand/raw/hisi504_nand.c:362:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/hisi504_nand.c:367:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse:     expected void const *
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse:     expected void const *
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse:     got void [noderef] __iomem *mmio
>> drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse:     expected void *p
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse:     expected void const *
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse:     expected void const *
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse:     expected void *p
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse:     expected void const *
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse:     expected void const *
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse:     expected void *p
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:246:46: sparse: sparse: self-comparison always evaluates to false

vim +342 drivers/video/fbdev/atmel_lcdfb.c

14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  316  
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  317  /**
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  318   *	atmel_lcdfb_alloc_video_memory - Allocate framebuffer memory
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  319   *	@sinfo: the frame buffer to allocate memory for
1d01e83557105e drivers/video/atmel_lcdfb.c       Krzysztof Helt     2009-07-08  320   * 	
1d01e83557105e drivers/video/atmel_lcdfb.c       Krzysztof Helt     2009-07-08  321   * 	This function is called only from the atmel_lcdfb_probe()
1d01e83557105e drivers/video/atmel_lcdfb.c       Krzysztof Helt     2009-07-08  322   * 	so no locking by fb_info->mm_lock around smem_len setting is needed.
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  323   */
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  324  static int atmel_lcdfb_alloc_video_memory(struct atmel_lcdfb_info *sinfo)
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  325  {
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  326  	struct fb_info *info = sinfo->info;
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  327  	struct fb_var_screeninfo *var = &info->var;
ea757acad5a518 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen 2008-08-12  328  	unsigned int smem_len;
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  329  
ea757acad5a518 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen 2008-08-12  330  	smem_len = (var->xres_virtual * var->yres_virtual
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  331  		    * ((var->bits_per_pixel + 7) / 8));
ea757acad5a518 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen 2008-08-12  332  	info->fix.smem_len = max(smem_len, sinfo->smem_len);
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  333  
f6e45661f9be54 drivers/video/fbdev/atmel_lcdfb.c Luis R. Rodriguez  2016-01-22 @334  	info->screen_base = dma_alloc_wc(info->device, info->fix.smem_len,
f6e45661f9be54 drivers/video/fbdev/atmel_lcdfb.c Luis R. Rodriguez  2016-01-22  335  					 (dma_addr_t *)&info->fix.smem_start,
f6e45661f9be54 drivers/video/fbdev/atmel_lcdfb.c Luis R. Rodriguez  2016-01-22  336  					 GFP_KERNEL);
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  337  
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  338  	if (!info->screen_base) {
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  339  		return -ENOMEM;
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  340  	}
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  341  
01d3a5e7fab773 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen 2008-04-28 @342  	memset(info->screen_base, 0, info->fix.smem_len);
01d3a5e7fab773 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen 2008-04-28  343  
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  344  	return 0;
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  345  }
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  346  

:::::: The code at line 342 was first introduced by commit
:::::: 01d3a5e7fab7732cfc5d5d4533e9378ea435295a atmel_lcdfb: don't initialize a pre-allocated framebuffer

:::::: TO: Haavard Skinnemoen <hskinnemoen@atmel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
