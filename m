Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D9B45BF1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 20:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcGZpBFu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702672044; x=1734208044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PzZ2VXB5q6ofyxtIZdagRHB3a5C0hOR/e9DMHX/5Gbg=;
  b=mcGZpBFupMwYU53176uhS/Tfd3+46anbfBbzjuKgxfOCPgVRodRWac8o
   XroG+3HNH+T06SA7y7zFOdTbn+/XTo0lPd5ojpTKkXQPnAJbPp4zjswtO
   o6j5vJM71ySI9gEgd0p9phQ1B42zlu2ZEnNyKVqvQn/HfmnP00rg+uSrB
   c5uQgDZ288MP/cZbJImXWcHu+ZOKIBufbVKsnjhuprMGsDnYaiRNYZUKr
   FnuV2/if37s9NW2QqGUVQM6mGeAPpQE4jxrXZxTNUMyu7r6vo8ZztSej+
   Gg7TByWBfZRZ//MGPxMRGY07/v0h1gYisEZzFzz/dG7kBrcf9cYJLlBGJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="392498773"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="392498773"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 12:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="774872844"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="774872844"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Dec 2023 12:27:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEEmE-0000i4-2j;
	Fri, 15 Dec 2023 20:27:18 +0000
Date: Sat, 16 Dec 2023 04:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: Stafford Horne <shorne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/video/fbdev/cirrusfb.c:1852:28: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202312160443.RP8KyYa0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f7168591ebf7bbdb91797d02b1afaf00a4289b1
commit: ded2ee36313c941f1a12b6f85cde295b575264ae openrisc: Add pci bus support
date:   1 year, 5 months ago
config: openrisc-randconfig-r112-20231116 (https://download.01.org/0day-ci/archive/20231216/202312160443.RP8KyYa0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231216/202312160443.RP8KyYa0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160443.RP8KyYa0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/cirrusfb.c:866:30: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/cirrusfb.c:867:38: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/cirrusfb.c:871:40: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/cirrusfb.c:873:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/cirrusfb.c:876:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/cirrusfb.c:877:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/cirrusfb.c:878:27: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/cirrusfb.c:879:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/cirrusfb.c:1245:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/cirrusfb.c:1246:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/cirrusfb.c:1247:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/video/fbdev/cirrusfb.c:1852:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dest @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/cirrusfb.c:1852:28: sparse:     expected void *dest
   drivers/video/fbdev/cirrusfb.c:1852:28: sparse:     got char [noderef] __iomem *screen_base

vim +1852 drivers/video/fbdev/cirrusfb.c

^1da177e4c3f415 drivers/video/cirrusfb.c Linus Torvalds 2005-04-16  1809  
8503df65976d0f8 drivers/video/cirrusfb.c Krzysztof Helt 2007-10-16  1810  static void cirrusfb_imageblit(struct fb_info *info,
8503df65976d0f8 drivers/video/cirrusfb.c Krzysztof Helt 2007-10-16  1811  			       const struct fb_image *image)
^1da177e4c3f415 drivers/video/cirrusfb.c Linus Torvalds 2005-04-16  1812  {
^1da177e4c3f415 drivers/video/cirrusfb.c Linus Torvalds 2005-04-16  1813  	struct cirrusfb_info *cinfo = info->par;
7cade31cabec33c drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1814  	unsigned char op = (info->var.bits_per_pixel == 24) ? 0xc : 0x4;
^1da177e4c3f415 drivers/video/cirrusfb.c Linus Torvalds 2005-04-16  1815  
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1816  	if (info->state != FBINFO_STATE_RUNNING)
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1817  		return;
df3aafd57d590d6 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1818  	/* Alpine/SD64 does not work at 24bpp ??? */
df3aafd57d590d6 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1819  	if (info->flags & FBINFO_HWACCEL_DISABLED || image->depth != 1)
df3aafd57d590d6 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1820  		cfb_imageblit(info, image);
df3aafd57d590d6 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1821  	else if ((cinfo->btype == BT_ALPINE || cinfo->btype == BT_SD64) &&
df3aafd57d590d6 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1822  		  op == 0xc)
^1da177e4c3f415 drivers/video/cirrusfb.c Linus Torvalds 2005-04-16  1823  		cfb_imageblit(info, image);
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1824  	else {
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1825  		unsigned size = ((image->width + 7) >> 3) * image->height;
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1826  		int m = info->var.bits_per_pixel;
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1827  		u32 fg, bg;
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1828  
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1829  		if (info->var.bits_per_pixel == 8) {
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1830  			fg = image->fg_color;
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1831  			bg = image->bg_color;
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1832  		} else {
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1833  			fg = ((u32 *)(info->pseudo_palette))[image->fg_color];
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1834  			bg = ((u32 *)(info->pseudo_palette))[image->bg_color];
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1835  		}
7cade31cabec33c drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1836  		if (info->var.bits_per_pixel == 24) {
7cade31cabec33c drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1837  			/* clear background first */
7cade31cabec33c drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1838  			cirrusfb_RectFill(cinfo->regbase,
7cade31cabec33c drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1839  					  info->var.bits_per_pixel,
7cade31cabec33c drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1840  					  (image->dx * m) / 8, image->dy,
7cade31cabec33c drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1841  					  (image->width * m) / 8,
7cade31cabec33c drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1842  					  image->height,
7cade31cabec33c drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1843  					  bg, bg,
7cade31cabec33c drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1844  					  info->fix.line_length, 0x40);
7cade31cabec33c drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1845  		}
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1846  		cirrusfb_RectFill(cinfo->regbase,
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1847  				  info->var.bits_per_pixel,
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1848  				  (image->dx * m) / 8, image->dy,
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1849  				  (image->width * m) / 8, image->height,
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1850  				  fg, bg,
7cade31cabec33c drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1851  				  info->fix.line_length, op);
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31 @1852  		memcpy(info->screen_base, image->data, size);
9e8480625332071 drivers/video/cirrusfb.c Krzysztof Helt 2009-03-31  1853  	}
^1da177e4c3f415 drivers/video/cirrusfb.c Linus Torvalds 2005-04-16  1854  }
^1da177e4c3f415 drivers/video/cirrusfb.c Linus Torvalds 2005-04-16  1855  

:::::: The code at line 1852 was first introduced by commit
:::::: 9e848062533207130667f6eaa748549367ccbedf cirrusfb: add imageblit function

:::::: TO: Krzysztof Helt <krzysztof.h1@wp.pl>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
