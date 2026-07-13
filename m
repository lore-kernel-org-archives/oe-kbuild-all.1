Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FE7235C01
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 05:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783920071; cv=none; b=Rn8lOreE3Or0t/P2LGqwuwUCg+nugBMxt8bqVJg0ZG5D70Ve7lGe/WIWro73cV+tTAn1+7+DO+OQFKy/6kGkmXp7mMfEWTVOgNGawAYhl7Aiq14ZHjPqHOl3JMyQjTaPybooFFD+i+B3lO1pG20xugxQaE2hENlktRAIPDhVqn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783920071; c=relaxed/simple;
	bh=oC62lEHOyWRXtfLUUo3iwPtCt6v5EI24j379zyHUpfs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pluZyX+0aLksvMhxaTPFrlolZurE1853lAry3IfND1LEZklppcAdHssXD1iJHBRJ5mziGh6A/6V8RMsywgzmh+THCBqSe4TucdpBnm5AR1GEY5SN0hIkW03sv1V98l8EMb85q9XavF1Y6tMvhGNizQDBaFfe8DR1yY5sGbfcyp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4D6uVej; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4D6uVej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783920069; x=1815456069;
  h=date:from:to:cc:subject:message-id;
  bh=oC62lEHOyWRXtfLUUo3iwPtCt6v5EI24j379zyHUpfs=;
  b=n4D6uVejZq0PTxgOgMgeFumE8JGpH39Kga2gGTtqgMR7QyrWmIdTkT7j
   /1QRbcIztCushmKQRG4fMxoOiWQNFG5m9Le/JLsytMVGBHjwKBLh/6MCT
   QmcvLtGkD/gRQzY07/2fc510oEuQXYitc1eTWR3adSQTEKPhsXp+KL98O
   KM222DEdQas8h0Wk5W5GuIlr5m7ZO5e2MSqeo4jdh4h2aF342HNR2BaqZ
   GFtRGG7XSMd8MNHCynNxbhBVbnzn/E7JvG5iK14bzg/isue2EuD2qciS6
   wciT3Kud+09Eu240PRDukk4YIgqbTSCr6lpQZfZZOtvIAoWED2aDcPKBE
   g==;
X-CSE-ConnectionGUID: gBZASrP8RC2C5CeupMVDPw==
X-CSE-MsgGUID: yYMYH6WWRZCI1QZZ3Tj8vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84715133"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84715133"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 22:21:08 -0700
X-CSE-ConnectionGUID: tVjEB5hPRVO0FlYM0ljJVg==
X-CSE-MsgGUID: CCrF1fKhTRWOLdC4gF6aPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253704334"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 12 Jul 2026 22:21:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj96F-00000000LOu-0AH2;
	Mon, 13 Jul 2026 05:21:03 +0000
Date: Mon, 13 Jul 2026 13:20:55 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: drivers/video/fbdev/pvr2fb.c:730:27: sparse: sparse:
 incorrect type in initializer (incompatible argument 2 (different address
 spaces))
Message-ID: <202607131247.fpQ6eTc7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Florian,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   44696aa3a489d2baf58efa61b37833f100072bee
commit: 5f566c0ac51cd2474e47da68dbe719d3acf7d999 fbdev: pvr2fb: Fix leftover reference to ONCHIP_NR_DMA_CHANNELS
date:   9 months ago
config: sh-randconfig-r111-20260713 (https://download.01.org/0day-ci/archive/20260713/202607131247.fpQ6eTc7-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607131247.fpQ6eTc7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5f566c0ac51c ("fbdev: pvr2fb: Fix leftover reference to ONCHIP_NR_DMA_CHANNELS")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607131247.fpQ6eTc7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/pvr2fb.c:730:27: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *fb_write )( ... ) @@     got int ( * )( ... ) @@
   drivers/video/fbdev/pvr2fb.c:730:27: sparse:     expected int ( *fb_write )( ... )
   drivers/video/fbdev/pvr2fb.c:730:27: sparse:     got int ( * )( ... )
   drivers/video/fbdev/pvr2fb.c:1081:11: sparse: sparse: Using plain integer as NULL pointer

vim +730 drivers/video/fbdev/pvr2fb.c

^1da177e4c3f415 drivers/video/pvr2fb.c       Linus Torvalds            2005-04-16  725  
8a48ac339398f21 drivers/video/fbdev/pvr2fb.c Jani Nikula               2019-12-03  726  static const struct fb_ops pvr2fb_ops = {
db7f2cb965cb792 drivers/video/fbdev/pvr2fb.c Bartlomiej Zolnierkiewicz 2019-06-07  727  	.owner		= THIS_MODULE,
423273970906070 drivers/video/fbdev/pvr2fb.c Thomas Zimmermann         2023-09-27  728  #ifdef CONFIG_PVR2_DMA
423273970906070 drivers/video/fbdev/pvr2fb.c Thomas Zimmermann         2023-09-27  729  	.fb_read	= fb_io_read,
423273970906070 drivers/video/fbdev/pvr2fb.c Thomas Zimmermann         2023-09-27 @730  	.fb_write	= pvr2fb_write,
423273970906070 drivers/video/fbdev/pvr2fb.c Thomas Zimmermann         2023-09-27  731  #else
423273970906070 drivers/video/fbdev/pvr2fb.c Thomas Zimmermann         2023-09-27  732  	__FB_DEFAULT_IOMEM_OPS_RDWR,
423273970906070 drivers/video/fbdev/pvr2fb.c Thomas Zimmermann         2023-09-27  733  #endif
db7f2cb965cb792 drivers/video/fbdev/pvr2fb.c Bartlomiej Zolnierkiewicz 2019-06-07  734  	.fb_setcolreg	= pvr2fb_setcolreg,
db7f2cb965cb792 drivers/video/fbdev/pvr2fb.c Bartlomiej Zolnierkiewicz 2019-06-07  735  	.fb_blank	= pvr2fb_blank,
423273970906070 drivers/video/fbdev/pvr2fb.c Thomas Zimmermann         2023-09-27  736  	__FB_DEFAULT_IOMEM_OPS_DRAW,
db7f2cb965cb792 drivers/video/fbdev/pvr2fb.c Bartlomiej Zolnierkiewicz 2019-06-07  737  	.fb_check_var	= pvr2fb_check_var,
db7f2cb965cb792 drivers/video/fbdev/pvr2fb.c Bartlomiej Zolnierkiewicz 2019-06-07  738  	.fb_set_par	= pvr2fb_set_par,
423273970906070 drivers/video/fbdev/pvr2fb.c Thomas Zimmermann         2023-09-27  739  	__FB_DEFAULT_IOMEM_OPS_MMAP,
db7f2cb965cb792 drivers/video/fbdev/pvr2fb.c Bartlomiej Zolnierkiewicz 2019-06-07  740  };
db7f2cb965cb792 drivers/video/fbdev/pvr2fb.c Bartlomiej Zolnierkiewicz 2019-06-07  741  

:::::: The code at line 730 was first introduced by commit
:::::: 4232739709060703e9dd6f5d6839c37e008d389d fbdev/pvr2fb: Initialize fb_ops to fbdev I/O-memory helpers

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
