Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA1740F8E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 23:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768951087; cv=none; b=Zi0IjXlyZk5bByV/o/XZSBABoMA4Tg+yt0nKRKmoAxg3YxR59FnogFtpp0jqqHN81eATYoBFTr9peXjVh85GIuD3SbF584bR7hz5QvPOJq8bCCGewKp2Ha7fLRZ+/Lx3UYTB+dXHZ/daxk4nQM4WFi0KSDU8CsHAk1QyoiPBPOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768951087; c=relaxed/simple;
	bh=KSXCUt+huvvliKSHJDz2saqptIuq+WLW7yDVA4OaNAA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PtHXw/CNVO9qINs21/d2Z14BBimQAoU2minqdytXfMxKZ7LTyYHUhBZDHENMCcU9qJkiuUmI7f+0mRud+efIKCSK6viwLAh1Tz3m3dLejzNx/xs2dxYqadf6aoM28pWeKQDvXUzU4LOabJB4bOH1G3FrulA8cqbozJVdiY+xJAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZuKpX3m; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZuKpX3m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768951086; x=1800487086;
  h=date:from:to:cc:subject:message-id;
  bh=KSXCUt+huvvliKSHJDz2saqptIuq+WLW7yDVA4OaNAA=;
  b=cZuKpX3mIthN21roAuY6SlDoi6HTCRWNfs/cn365Q6/Yn6rZjPOdcg9Y
   re+z9vSmWWPHdA8o4WYJ0JtTvENYOsngq4dLKAWENnWZ/aOBM/uFNaKa3
   SeWUGu+467ubLAiibAyDfKX26+wvljdBKdU30IK3Wj9ACAtBOAWTw9QLu
   736mc9RGD1LGXcvrTiQgfeNq6NOUxj8G4U1v3WPVUwQhozEfqP3k4+JFq
   u+60cC8UMo3eXpNEu8wPRWTSosnrX4j3MPWWo2fQ1e2E+14jafSQqeGqY
   4D8kEHGyzjPKHquuM8/E2wKYFvXEPAk/y7e+ZVsjphThOEtkqTSeG58TU
   Q==;
X-CSE-ConnectionGUID: vMVHmmOGQlWBI2MPACiQCw==
X-CSE-MsgGUID: DdystTpvQ5KLp0VdUqTaaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="74040253"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="74040253"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 15:18:03 -0800
X-CSE-ConnectionGUID: gKld+vW+Sr+DiV3urydLMw==
X-CSE-MsgGUID: nUuM7mN7Qb2qKf1wK08mww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="206600453"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jan 2026 15:18:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viKz1-00000000PfO-1cJw;
	Tue, 20 Jan 2026 23:17:59 +0000
Date: Wed, 21 Jan 2026 07:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 10/10]
 drivers/video/fbdev/atmel_lcdfb.c:341:20: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202601210739.9BXxqRTe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   406593924bc6e46a9b9f27a31a90d141f9d71f21
commit: 5ca8b64d16a77fedf6e4659f9affe8d1178933ff [10/10] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: arc-randconfig-r131-20260121 (https://download.01.org/0day-ci/archive/20260121/202601210739.9BXxqRTe-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210739.9BXxqRTe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210739.9BXxqRTe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/atmel_lcdfb.c:333:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got void * @@
   drivers/video/fbdev/atmel_lcdfb.c:333:27: sparse:     expected char [noderef] __iomem *screen_base
   drivers/video/fbdev/atmel_lcdfb.c:333:27: sparse:     got void *
>> drivers/video/fbdev/atmel_lcdfb.c:341:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:341:20: sparse:     expected void *ptr
   drivers/video/fbdev/atmel_lcdfb.c:341:20: sparse:     got char [noderef] __iomem *screen_base
   drivers/video/fbdev/atmel_lcdfb.c:312:59: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:312:59: sparse:     expected void *cpu_addr
   drivers/video/fbdev/atmel_lcdfb.c:312:59: sparse:     got char [noderef] __iomem *screen_base
   drivers/video/fbdev/atmel_lcdfb.c:312:59: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:312:59: sparse:     expected void *cpu_addr
   drivers/video/fbdev/atmel_lcdfb.c:312:59: sparse:     got char [noderef] __iomem *screen_base
--
>> drivers/tty/serial/8250/8250_platform.c:78:25: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/tty/serial/8250/8250_platform.c:78:71: sparse: signed value source

vim +341 drivers/video/fbdev/atmel_lcdfb.c

14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  315  
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  316  /**
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  317   *	atmel_lcdfb_alloc_video_memory - Allocate framebuffer memory
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  318   *	@sinfo: the frame buffer to allocate memory for
1d01e83557105e drivers/video/atmel_lcdfb.c       Krzysztof Helt     2009-07-08  319   *
1d01e83557105e drivers/video/atmel_lcdfb.c       Krzysztof Helt     2009-07-08  320   * 	This function is called only from the atmel_lcdfb_probe()
1d01e83557105e drivers/video/atmel_lcdfb.c       Krzysztof Helt     2009-07-08  321   * 	so no locking by fb_info->mm_lock around smem_len setting is needed.
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  322   */
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  323  static int atmel_lcdfb_alloc_video_memory(struct atmel_lcdfb_info *sinfo)
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  324  {
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  325  	struct fb_info *info = sinfo->info;
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  326  	struct fb_var_screeninfo *var = &info->var;
ea757acad5a518 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen 2008-08-12  327  	unsigned int smem_len;
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  328  
ea757acad5a518 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen 2008-08-12  329  	smem_len = (var->xres_virtual * var->yres_virtual
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  330  		    * ((var->bits_per_pixel + 7) / 8));
ea757acad5a518 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen 2008-08-12  331  	info->fix.smem_len = max(smem_len, sinfo->smem_len);
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  332  
f6e45661f9be54 drivers/video/fbdev/atmel_lcdfb.c Luis R. Rodriguez  2016-01-22  333  	info->screen_base = dma_alloc_wc(info->device, info->fix.smem_len,
f6e45661f9be54 drivers/video/fbdev/atmel_lcdfb.c Luis R. Rodriguez  2016-01-22  334  					 (dma_addr_t *)&info->fix.smem_start,
f6e45661f9be54 drivers/video/fbdev/atmel_lcdfb.c Luis R. Rodriguez  2016-01-22  335  					 GFP_KERNEL);
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  336  
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  337  	if (!info->screen_base) {
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  338  		return -ENOMEM;
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  339  	}
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  340  
01d3a5e7fab773 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen 2008-04-28 @341  	memset(info->screen_base, 0, info->fix.smem_len);
01d3a5e7fab773 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen 2008-04-28  342  
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  343  	return 0;
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  344  }
14340586148e7c drivers/video/atmel_lcdfb.c       Nicolas Ferre      2007-05-10  345  

:::::: The code at line 341 was first introduced by commit
:::::: 01d3a5e7fab7732cfc5d5d4533e9378ea435295a atmel_lcdfb: don't initialize a pre-allocated framebuffer

:::::: TO: Haavard Skinnemoen <hskinnemoen@atmel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
