Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C68D188938
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 05:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738991166; cv=none; b=VCk9KHeiUXD/oSflvsUQosxCdymER5A9EuPilXMORRFDu4kwDYFP+UWGlUOkVJszhMW/Rto9SsiTb69LvDf2NNVQVQ9mFeitc/8Sw2PcK7x3pcZrTy9xpuVzO5RDVdzYSzaXmFdn6JyZa0jbyI4r/feUq0yJTthGO+ZylaUetLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738991166; c=relaxed/simple;
	bh=yp1Ylz2dGl4DrYfR1kisoP9TLKls3aGKVNo+QCVXbZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M6NsirfVTOy8bmyfFsyzgzMgYy6Qv0Bf+l87yIzgcp+CY8suDCqZUZ6sBUGzaTytiwF7JDz6egYwLf09E3qNmFPYHXNEp2mXOqrQi47mIzThGqhw0RNI0zkiTn3kZTTLz3iZwvpl+QYvJSmaGsG+d+fgiCzCKI1McmjTe8G+H/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGcMIKAn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGcMIKAn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738991165; x=1770527165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yp1Ylz2dGl4DrYfR1kisoP9TLKls3aGKVNo+QCVXbZw=;
  b=AGcMIKAnvyCbnH/kx7328NmKdV8GhIBGhLng7WEaVAvdrTOBGo4WY2+1
   Dorm7BElIVeNWSTq3c6dcQ6i+fv2BLgBrxMmucvMYHleKNIl05/j0QHS8
   FagQpIUloym9mVlghtZ8FMZpUMHP1kgyPFbUkd6ya73jfedEQclPA6hl1
   cpV6RCD7IMqIrgqtwT/vbvYmKub48o7gMY+8P8F9lYXeLBSG8ezAiSrJ0
   M4zDRASTYIvCEww5SAqF1iQsQAmcok51lw8vVjOHx+dk7vABfl5mar28E
   PHt10qyKofYUJaWGJAnSK343peiZK2YVO8fr8zKVbc0B7uD9z/LBJb+up
   A==;
X-CSE-ConnectionGUID: viALnstKQymzDciY5xpUkg==
X-CSE-MsgGUID: +d6BhuS1Sbq0D3Zgtq86Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39544017"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="39544017"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 21:06:04 -0800
X-CSE-ConnectionGUID: mPJ8N8wXTMidlGlbBTKn7g==
X-CSE-MsgGUID: d0buIDwJTmChxA9pDMEzTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112142945"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Feb 2025 21:06:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgd2V-000zYC-1r;
	Sat, 08 Feb 2025 05:05:59 +0000
Date: Sat, 8 Feb 2025 13:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: Zsolt Kajtar <soci@c64.rulez.org>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>
Subject: [deller-fbdev:for-next 9/15]
 drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse: sparse: incorrect
 type in argument 1 (different base types)
Message-ID: <202502081239.v7sbJLcz-lkp@intel.com>
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
commit: 0a2b548593fa9beef459b3cc272ee1875007b94a [9/15] fbdev: core: Use generic fillrect for as cfb_fillrect
config: microblaze-randconfig-r111-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081239.v7sbJLcz-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250208/202502081239.v7sbJLcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081239.v7sbJLcz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/core/cfbfillrect.c: note: in included file:
>> drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long word @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse:     expected unsigned long word
   drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse:     got restricted __le32 [usertype]
>> drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse: sparse: cast to restricted __le32
>> drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long word @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse:     expected unsigned long word
   drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse:     got restricted __le32 [usertype]
>> drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse: sparse: cast to restricted __le32
>> drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long word @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse:     expected unsigned long word
   drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse:     got restricted __le32 [usertype]
>> drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse: sparse: cast to restricted __le32
>> drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long word @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse:     expected unsigned long word
   drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse:     got restricted __le32 [usertype]
>> drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse: sparse: cast to restricted __le32
>> drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long word @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse:     expected unsigned long word
   drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse:     got restricted __le32 [usertype]
>> drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse: sparse: cast to restricted __le32
>> drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long word @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse:     expected unsigned long word
   drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse:     got restricted __le32 [usertype]
>> drivers/video/fbdev/core/fb_fillrect.h:353:32: sparse: sparse: cast to restricted __le32

vim +353 drivers/video/fbdev/core/fb_fillrect.h

36344219eaa388 Zsolt Kajtar 2025-02-07  265  
8653af948e2a44 Zsolt Kajtar 2025-02-07  266  void FB_FILLRECT(struct fb_info *p, const struct fb_fillrect *rect)
36344219eaa388 Zsolt Kajtar 2025-02-07  267  {
36344219eaa388 Zsolt Kajtar 2025-02-07  268          unsigned long pat, pat2, fg;
36344219eaa388 Zsolt Kajtar 2025-02-07  269          unsigned long width = rect->width, height = rect->height;
36344219eaa388 Zsolt Kajtar 2025-02-07  270          int bits = BITS_PER_LONG, bytes = bits >> 3;
36344219eaa388 Zsolt Kajtar 2025-02-07  271          u32 bpp = p->var.bits_per_pixel;
8653af948e2a44 Zsolt Kajtar 2025-02-07  272          unsigned long FB_MEM *dst;
36344219eaa388 Zsolt Kajtar 2025-02-07  273          int dst_idx, left;
36344219eaa388 Zsolt Kajtar 2025-02-07  274  
36344219eaa388 Zsolt Kajtar 2025-02-07  275          if (p->state != FBINFO_STATE_RUNNING)
36344219eaa388 Zsolt Kajtar 2025-02-07  276                  return;
36344219eaa388 Zsolt Kajtar 2025-02-07  277  
8653af948e2a44 Zsolt Kajtar 2025-02-07  278          if ((p->flags & FBINFO_VIRTFB) != FB_SPACE)
8653af948e2a44 Zsolt Kajtar 2025-02-07  279                  fb_warn_once(p, "Framebuffer is not in " FB_SPACE_NAME
8653af948e2a44 Zsolt Kajtar 2025-02-07  280                               " address space.");
36344219eaa388 Zsolt Kajtar 2025-02-07  281  
36344219eaa388 Zsolt Kajtar 2025-02-07  282          if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
36344219eaa388 Zsolt Kajtar 2025-02-07  283              p->fix.visual == FB_VISUAL_DIRECTCOLOR )
36344219eaa388 Zsolt Kajtar 2025-02-07  284                  fg = ((u32 *) (p->pseudo_palette))[rect->color];
36344219eaa388 Zsolt Kajtar 2025-02-07  285          else
36344219eaa388 Zsolt Kajtar 2025-02-07  286                  fg = rect->color;
36344219eaa388 Zsolt Kajtar 2025-02-07  287  
36344219eaa388 Zsolt Kajtar 2025-02-07  288          pat = pixel_to_pat(bpp, fg);
36344219eaa388 Zsolt Kajtar 2025-02-07  289  
8653af948e2a44 Zsolt Kajtar 2025-02-07  290          dst = (unsigned long FB_MEM *)((unsigned long)FB_SCREEN_BASE(p) & ~(bytes-1));
8653af948e2a44 Zsolt Kajtar 2025-02-07  291          dst_idx = ((unsigned long)FB_SCREEN_BASE(p) & (bytes - 1))*8;
36344219eaa388 Zsolt Kajtar 2025-02-07  292          dst_idx += rect->dy*p->fix.line_length*8+rect->dx*bpp;
36344219eaa388 Zsolt Kajtar 2025-02-07  293          /* FIXME For now we support 1-32 bpp only */
36344219eaa388 Zsolt Kajtar 2025-02-07  294          left = bits % bpp;
36344219eaa388 Zsolt Kajtar 2025-02-07  295          if (p->fbops->fb_sync)
36344219eaa388 Zsolt Kajtar 2025-02-07  296                  p->fbops->fb_sync(p);
36344219eaa388 Zsolt Kajtar 2025-02-07  297          if (!left) {
36344219eaa388 Zsolt Kajtar 2025-02-07  298                  u32 bswapmask = fb_compute_bswapmask(p);
36344219eaa388 Zsolt Kajtar 2025-02-07  299                  void (*fill_op32)(struct fb_info *p,
8653af948e2a44 Zsolt Kajtar 2025-02-07  300                                    unsigned long FB_MEM *dst, int dst_idx,
36344219eaa388 Zsolt Kajtar 2025-02-07  301                                    unsigned long pat, unsigned n, int bits,
36344219eaa388 Zsolt Kajtar 2025-02-07  302                                    u32 bswapmask) = NULL;
36344219eaa388 Zsolt Kajtar 2025-02-07  303  
36344219eaa388 Zsolt Kajtar 2025-02-07  304                  switch (rect->rop) {
36344219eaa388 Zsolt Kajtar 2025-02-07  305                  case ROP_XOR:
36344219eaa388 Zsolt Kajtar 2025-02-07  306                          fill_op32 = bitfill_aligned_rev;
36344219eaa388 Zsolt Kajtar 2025-02-07  307                          break;
36344219eaa388 Zsolt Kajtar 2025-02-07  308                  case ROP_COPY:
36344219eaa388 Zsolt Kajtar 2025-02-07  309                          fill_op32 = bitfill_aligned;
36344219eaa388 Zsolt Kajtar 2025-02-07  310                          break;
36344219eaa388 Zsolt Kajtar 2025-02-07  311                  default:
8653af948e2a44 Zsolt Kajtar 2025-02-07  312                          printk( KERN_ERR FB_FILLRECT_NAME "(): unknown rop, "
8653af948e2a44 Zsolt Kajtar 2025-02-07  313                                  "defaulting to ROP_COPY\n");
36344219eaa388 Zsolt Kajtar 2025-02-07  314                          fill_op32 = bitfill_aligned;
36344219eaa388 Zsolt Kajtar 2025-02-07  315                          break;
36344219eaa388 Zsolt Kajtar 2025-02-07  316                  }
36344219eaa388 Zsolt Kajtar 2025-02-07  317                  while (height--) {
36344219eaa388 Zsolt Kajtar 2025-02-07  318                          dst += dst_idx >> (ffs(bits) - 1);
36344219eaa388 Zsolt Kajtar 2025-02-07  319                          dst_idx &= (bits - 1);
36344219eaa388 Zsolt Kajtar 2025-02-07  320                          fill_op32(p, dst, dst_idx, pat, width*bpp, bits,
36344219eaa388 Zsolt Kajtar 2025-02-07  321                                    bswapmask);
36344219eaa388 Zsolt Kajtar 2025-02-07  322                          dst_idx += p->fix.line_length*8;
36344219eaa388 Zsolt Kajtar 2025-02-07  323                  }
36344219eaa388 Zsolt Kajtar 2025-02-07  324          } else {
36344219eaa388 Zsolt Kajtar 2025-02-07  325                  int right, r;
8653af948e2a44 Zsolt Kajtar 2025-02-07  326                  void (*fill_op)(struct fb_info *p, unsigned long FB_MEM *dst,
36344219eaa388 Zsolt Kajtar 2025-02-07  327                                  int dst_idx, unsigned long pat, int left,
36344219eaa388 Zsolt Kajtar 2025-02-07  328                                  int right, unsigned n, int bits) = NULL;
36344219eaa388 Zsolt Kajtar 2025-02-07  329  #ifdef __LITTLE_ENDIAN
36344219eaa388 Zsolt Kajtar 2025-02-07  330                  right = left;
36344219eaa388 Zsolt Kajtar 2025-02-07  331                  left = bpp - right;
36344219eaa388 Zsolt Kajtar 2025-02-07  332  #else
36344219eaa388 Zsolt Kajtar 2025-02-07  333                  right = bpp - left;
36344219eaa388 Zsolt Kajtar 2025-02-07  334  #endif
36344219eaa388 Zsolt Kajtar 2025-02-07  335                  switch (rect->rop) {
36344219eaa388 Zsolt Kajtar 2025-02-07  336                  case ROP_XOR:
36344219eaa388 Zsolt Kajtar 2025-02-07  337                          fill_op = bitfill_unaligned_rev;
36344219eaa388 Zsolt Kajtar 2025-02-07  338                          break;
36344219eaa388 Zsolt Kajtar 2025-02-07  339                  case ROP_COPY:
36344219eaa388 Zsolt Kajtar 2025-02-07  340                          fill_op = bitfill_unaligned;
36344219eaa388 Zsolt Kajtar 2025-02-07  341                          break;
36344219eaa388 Zsolt Kajtar 2025-02-07  342                  default:
8653af948e2a44 Zsolt Kajtar 2025-02-07  343                          printk(KERN_ERR FB_FILLRECT_NAME "(): unknown rop, "
8653af948e2a44 Zsolt Kajtar 2025-02-07  344                                  "defaulting to ROP_COPY\n");
36344219eaa388 Zsolt Kajtar 2025-02-07  345                          fill_op = bitfill_unaligned;
36344219eaa388 Zsolt Kajtar 2025-02-07  346                          break;
36344219eaa388 Zsolt Kajtar 2025-02-07  347                  }
36344219eaa388 Zsolt Kajtar 2025-02-07  348                  while (height--) {
36344219eaa388 Zsolt Kajtar 2025-02-07  349                          dst += dst_idx / bits;
36344219eaa388 Zsolt Kajtar 2025-02-07  350                          dst_idx &= (bits - 1);
36344219eaa388 Zsolt Kajtar 2025-02-07  351                          r = dst_idx % bpp;
36344219eaa388 Zsolt Kajtar 2025-02-07  352                          /* rotate pattern to the correct start position */
36344219eaa388 Zsolt Kajtar 2025-02-07 @353                          pat2 = le_long_to_cpu(rolx(cpu_to_le_long(pat), r, bpp));

:::::: The code at line 353 was first introduced by commit
:::::: 36344219eaa388afac5a0e95fb91c0e06659b227 fbdev: core: Copy cfbfillrect to fb_fillrect

:::::: TO: Zsolt Kajtar <soci@c64.rulez.org>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
