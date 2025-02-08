Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D39623C8DA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 07:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739000303; cv=none; b=GYW4dydQN5GcJqenAsUFOjIMac+0kfq/t/2jwMtPUyb2r1S1Kzj3SIbqbqahYAK9H2uMQSBSo2i4xU0j19rMo6uZHSibY4tkon9hLOE2KXEz+VH0ik3MjZeS7F+WMV2KbvPJBHLBvnZj+Nw5Ek12OD0rVElftilIgOWgw1A/ir4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739000303; c=relaxed/simple;
	bh=e+WfQV89Rp9PtLaArS0T1l3bvI/Cr+7XcNoT8CiCg5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D+F+AFSiDRrOinFlT7pIQ8oc5D4cTojjqs+r62YU9vvkjILdRLLM8cY2eDQDuI6Yl9iYHMhQvXuT/4H4K7PdURf9wuu4tJhKlc9szWtOZIEh1pdRK/C6+9RtnWsuHtzsi/JlLtadibcbjyGSzfpahZ77z+zh1z+chOmNCpnOqhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVw3Bkxq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVw3Bkxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739000301; x=1770536301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e+WfQV89Rp9PtLaArS0T1l3bvI/Cr+7XcNoT8CiCg5M=;
  b=aVw3BkxqApv3CnTAW77z2cspKY4NmczDx/xwOJ3RbE4GSf8QvS6lEVhL
   qgeAyy9+MPo8XDSj+7wI3nnAml6QfVUzy1QjcwNLw0n2khdiNHDaQ5kTI
   Nc1/g/jZOSFSoHAS8c9BUqvdcnPA+cAsWMo1qWQfns1s6aaRkOdzub4vf
   Ge8SL41L+n+Ckbf/aJSopuUOR5CtgsC2fBfj5lIrgt+nGFzk59RvZiL4T
   kM0M+Rqlzl5O8Ku7oiY4RGd+LxsUqL1bXJBpH/dsMxRASz9eXaq3SZ8RV
   u0wNFAunhI6aj3ONad04smnpGalXjKGiQh9K+U2pQrOTKsUoQB+tC0kED
   Q==;
X-CSE-ConnectionGUID: F8SJwUh6QOK7uRKTOz+eXQ==
X-CSE-MsgGUID: ieJx3TVITpyy1lBJwtedcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39772455"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="39772455"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 23:38:21 -0800
X-CSE-ConnectionGUID: TItk76NzQHKb8zacIXN9zA==
X-CSE-MsgGUID: 9pSdOgegRGaYmZDIq4Prjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116332179"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Feb 2025 23:38:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgfPt-000zhx-0y;
	Sat, 08 Feb 2025 07:38:17 +0000
Date: Sat, 8 Feb 2025 15:37:59 +0800
From: kernel test robot <lkp@intel.com>
To: Zsolt Kajtar <soci@c64.rulez.org>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>
Subject: [deller-fbdev:for-next 13/15]
 drivers/video/fbdev/core/fb_imageblit.h:332:14: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202502081503.sOVHPKm3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git for-next
head:   720fcad9d12e92368192689a90e2b932a1e44406
commit: d244899de08c324fdcf4dbed95ecb64ea292ff61 [13/15] fbdev: core: Use generic imageblit for as cfb_imageblit
config: microblaze-randconfig-r111-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081503.sOVHPKm3-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250208/202502081503.sOVHPKm3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081503.sOVHPKm3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/core/cfbimgblt.c: note: in included file:
>> drivers/video/fbdev/core/fb_imageblit.h:332:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *dst1 @@     got void * @@
   drivers/video/fbdev/core/fb_imageblit.h:332:14: sparse:     expected unsigned char [noderef] [usertype] __iomem *dst1
   drivers/video/fbdev/core/fb_imageblit.h:332:14: sparse:     got void *

vim +332 drivers/video/fbdev/core/fb_imageblit.h

d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  310  
24d36dc5bee2bf Zsolt Kajtar 2025-02-07  311  void FB_IMAGEBLIT (struct fb_info *p, const struct fb_image *image)
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  312  {
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  313          u32 fgcolor, bgcolor, start_index, bitstart, pitch_index = 0;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  314          u32 bpl = sizeof(u32), bpp = p->var.bits_per_pixel;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  315          u32 width = image->width;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  316          u32 dx = image->dx, dy = image->dy;
24d36dc5bee2bf Zsolt Kajtar 2025-02-07  317          u8 FB_MEM *dst1;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  318  
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  319          if (p->state != FBINFO_STATE_RUNNING)
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  320                  return;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  321  
24d36dc5bee2bf Zsolt Kajtar 2025-02-07  322          if ((p->flags & FBINFO_VIRTFB) != FB_SPACE)
24d36dc5bee2bf Zsolt Kajtar 2025-02-07  323                  fb_warn_once(p, "Framebuffer is not in " FB_SPACE_NAME
24d36dc5bee2bf Zsolt Kajtar 2025-02-07  324                               " address space.");
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  325  
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  326          bitstart = (dy * p->fix.line_length * 8) + (dx * bpp);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  327          start_index = bitstart & (32 - 1);
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  328          pitch_index = (p->fix.line_length & (bpl - 1)) * 8;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  329  
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  330          bitstart /= 8;
d933e6d9f4eb8e Zsolt Kajtar 2025-02-07  331          bitstart &= ~(bpl - 1);
24d36dc5bee2bf Zsolt Kajtar 2025-02-07 @332          dst1 = (void __force *)FB_SCREEN_BASE(p) + bitstart;

:::::: The code at line 332 was first introduced by commit
:::::: 24d36dc5bee2bf0768f51e207925d044d7e66b6f fbdev: core: Make fb_imageblit generic

:::::: TO: Zsolt Kajtar <soci@c64.rulez.org>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
