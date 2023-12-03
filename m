Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADE628F1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+06wI3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701588779; x=1733124779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vi7UFIjAcGjE39RqlZEJirYnZmJ9uc0KkaGoHFpiqvw=;
  b=S+06wI3F3NOGi1dvbH2oEh/M/A0wDa+HgJy680l4Wmo75c+YNFQUXeeY
   vt+uQevQw1EuneJJcKU1YuprAzceAHKRuxSeRM/d/u7FjoAXq07utRA26
   yN4Jnw/h0XN0HNO+peWKJSlS8zBPidC9GvLgq3Ogk1S9PenQjgX5AYVt2
   UJynhW6NIRdJe0P1spNDZ7uK9oPY4jFIXgTvm8pdGmbt97ITp3Rk/ykjb
   ijkTxVTJPJKciPJFH1FsxrqKcheLj2k1NFo1ykMzPnFl8qFHvg/XylzFK
   LOjQyf5PpXaGJPoodhbOZX2YOY+Qb2SmpV0IaxiYJQozJdD0vENNxNxml
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="397517638"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="397517638"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 23:32:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="799231489"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="799231489"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 02 Dec 2023 23:32:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9gy9-0006Ph-0V;
	Sun, 03 Dec 2023 07:32:49 +0000
Date: Sun, 3 Dec 2023 15:32:43 +0800
From: kernel test robot <lkp@intel.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: drivers/video/fbdev/amifb.c:3637:22: sparse: sparse: cast truncates
 bits from constant value (2e90edd000 becomes 90edd000)
Message-ID: <202312031411.3OnOYJaj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: 1f2f01b122d7c78a9e842a126ef168afb279552b kbuild: add machine size to CHECKFLAGS
date:   6 years ago
config: m68k-randconfig-r131-20231129 (https://download.01.org/0day-ci/archive/20231203/202312031411.3OnOYJaj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031411.3OnOYJaj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312031411.3OnOYJaj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/amifb.c:3375:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dst @@     got char [noderef] <asn:2> *screen_base @@
   drivers/video/fbdev/amifb.c:3375:32: sparse:     expected void *dst
   drivers/video/fbdev/amifb.c:3375:32: sparse:     got char [noderef] <asn:2> *screen_base
   drivers/video/fbdev/amifb.c:3713:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] <asn:2> *screen_base @@     got char * @@
   drivers/video/fbdev/amifb.c:3713:35: sparse:     expected char [noderef] <asn:2> *screen_base
   drivers/video/fbdev/amifb.c:3713:35: sparse:     got char *
   drivers/video/fbdev/amifb.c:3755:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:2> *addr @@     got void * @@
   drivers/video/fbdev/amifb.c:3755:26: sparse:     expected void [noderef] <asn:2> *addr
   drivers/video/fbdev/amifb.c:3755:26: sparse:     got void *
   drivers/video/fbdev/amifb.c:3772:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:2> *addr @@     got void * @@
   drivers/video/fbdev/amifb.c:3772:26: sparse:     expected void [noderef] <asn:2> *addr
   drivers/video/fbdev/amifb.c:3772:26: sparse:     got void *
>> drivers/video/fbdev/amifb.c:3637:22: sparse: sparse: cast truncates bits from constant value (2e90edd000 becomes 90edd000)
   drivers/video/fbdev/amifb.c: In function 'ami_decode_var':
   drivers/video/fbdev/amifb.c:1127:23: warning: variable 'vtotal' set but not used [-Wunused-but-set-variable]
    1127 |         u_int htotal, vtotal;
         |                       ^~~~~~
   drivers/video/fbdev/amifb.c:1127:15: warning: variable 'htotal' set but not used [-Wunused-but-set-variable]
    1127 |         u_int htotal, vtotal;
         |               ^~~~~~
   drivers/video/fbdev/amifb.c: In function 'ami_get_var_cursorinfo':
   drivers/video/fbdev/amifb.c:1848:19: warning: variable 'alloc' set but not used [-Wunused-but-set-variable]
    1848 |         int size, alloc;
         |                   ^~~~~
   drivers/video/fbdev/amifb.c: In function 'amifb_pan_display':
   drivers/video/fbdev/amifb.c:2540:34: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
    2540 |                 if (var->yoffset < 0 ||
         |                                  ^
   In file included from drivers/video/fbdev/amifb.c:43:
   drivers/video/fbdev/amifb.c: At top level:
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'amifb_driver_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/platform_device.h:251:1: note: in expansion of macro 'module_init'
     251 | module_init(__platform_driver##_init); 36-      | ^~~~~~~~~~~
   drivers/video/fbdev/amifb.c:3786:1: note: in expansion of macro 'module_platform_driver_probe'
    3786 | module_platform_driver_probe(amifb_driver, amifb_probe);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/video/fbdev/amifb.c:53:
   drivers/video/fbdev/amifb.c:3786:30: note: 'init_module' target declared here
    3786 | module_platform_driver_probe(amifb_driver, amifb_probe);
         |                              ^~~~~~~~~~~~
   include/linux/platform_device.h:246:19: note: in definition of macro 'module_platform_driver_probe'
     246 | static int __init __platform_driver##_init(void) 46-      |                   ^~~~~~~~~~~~~~~~~
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'amifb_driver_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/platform_device.h:256:1: note: in expansion of macro 'module_exit'
     256 | module_exit(__platform_driver##_exit);
         | ^~~~~~~~~~~
   drivers/video/fbdev/amifb.c:3786:1: note: in expansion of macro 'module_platform_driver_probe'
    3786 | module_platform_driver_probe(amifb_driver, amifb_probe);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/amifb.c:3786:30: note: 'cleanup_module' target declared here
    3786 | module_platform_driver_probe(amifb_driver, amifb_probe);
         |                              ^~~~~~~~~~~~
   include/linux/platform_device.h:252:20: note: in definition of macro 'module_platform_driver_probe'
     252 | static void __exit __platform_driver##_exit(void) 61-      |                    ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/amifb.c:2344:19: warning: 'amifb_setup' defined but not used [-Wunused-function]
    2344 | static int __init amifb_setup(char *options)
         |                   ^~~~~~~~~~~

vim +3637 drivers/video/fbdev/amifb.c

f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3619  
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3620  	default:
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3621  #ifdef CONFIG_FB_AMIGA_OCS
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3622  		printk("Unknown graphics chipset, defaulting to OCS\n");
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3623  		strcat(info->fix.id, "Unknown");
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3624  		goto default_chipset;
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3625  #else /* CONFIG_FB_AMIGA_OCS */
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3626  		err = -ENODEV;
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3627  		goto release;
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3628  #endif /* CONFIG_FB_AMIGA_OCS */
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3629  		break;
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3630  	}
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3631  
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3632  	/*
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3633  	 * Calculate the Pixel Clock Values for this Machine
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3634  	 */
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3635  
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3636  	{
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21 @3637  	u_long tmp = DIVUL(200000000000ULL, amiga_eclock);
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3638  
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3639  	pixclock[TAG_SHRES] = (tmp + 4) / 8;	/* SHRES:  35 ns / 28 MHz */
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3640  	pixclock[TAG_HIRES] = (tmp + 2) / 4;	/* HIRES:  70 ns / 14 MHz */
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3641  	pixclock[TAG_LORES] = (tmp + 1) / 2;	/* LORES: 140 ns /  7 MHz */
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3642  	}
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3643  
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3644  	/*
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3645  	 * Replace the Tag Values with the Real Pixel Clock Values
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3646  	 */
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3647  
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3648  	for (i = 0; i < NUM_TOTAL_MODES; i++) {
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3649  		struct fb_videomode *mode = &ami_modedb[i];
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3650  		tag = mode->pixclock;
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3651  		if (tag == TAG_SHRES || tag == TAG_HIRES || tag == TAG_LORES) {
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3652  			mode->pixclock = pixclock[tag];
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3653  		}
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3654  	}
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3655  
03c740a04c8da4 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3656  	if (amifb_hfmin) {
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3657  		info->monspecs.hfmin = amifb_hfmin;
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3658  		info->monspecs.hfmax = amifb_hfmax;
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3659  		info->monspecs.vfmin = amifb_vfmin;
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3660  		info->monspecs.vfmax = amifb_vfmax;
03c740a04c8da4 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3661  	} else {
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3662  		/*
03c740a04c8da4 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3663  		 *  These are for a typical Amiga monitor (e.g. A1960)
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3664  		 */
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3665  		info->monspecs.hfmin = 15000;
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3666  		info->monspecs.hfmax = 38000;
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3667  		info->monspecs.vfmin = 49;
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3668  		info->monspecs.vfmax = 90;
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3669  	}
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3670  
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3671  	info->fbops = &amifb_ops;
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3672  	info->flags = FBINFO_DEFAULT;
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3673  	info->device = &pdev->dev;
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3674  
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3675  	if (!fb_find_mode(&info->var, info, mode_option, ami_modedb,
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3676  			  NUM_TOTAL_MODES, &ami_modedb[defmode], 4)) {
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3677  		err = -EINVAL;
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3678  		goto release;
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3679  	}
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3680  
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3681  	fb_videomode_to_modelist(ami_modedb, NUM_TOTAL_MODES,
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3682  				 &info->modelist);
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3683  
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3684  	round_down_bpp = 0;
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3685  	chipptr = chipalloc(info->fix.smem_len + SPRITEMEMSIZE +
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3686  			    DUMMYSPRITEMEMSIZE + COPINITSIZE +
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3687  			    4 * COPLISTSIZE);
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3688  	if (!chipptr) {
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3689  		err = -ENOMEM;
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3690  		goto release;
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3691  	}
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3692  
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3693  	assignchunk(videomemory, u_long, chipptr, info->fix.smem_len);
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3694  	assignchunk(spritememory, u_long, chipptr, SPRITEMEMSIZE);
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3695  	assignchunk(dummysprite, u_short *, chipptr, DUMMYSPRITEMEMSIZE);
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3696  	assignchunk(copdisplay.init, copins *, chipptr, COPINITSIZE);
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3697  	assignchunk(copdisplay.list[0][0], copins *, chipptr, COPLISTSIZE);
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3698  	assignchunk(copdisplay.list[0][1], copins *, chipptr, COPLISTSIZE);
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3699  	assignchunk(copdisplay.list[1][0], copins *, chipptr, COPLISTSIZE);
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3700  	assignchunk(copdisplay.list[1][1], copins *, chipptr, COPLISTSIZE);
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3701  
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3702  	/*
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3703  	 * access the videomem with writethrough cache
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3704  	 */
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3705  	info->fix.smem_start = (u_long)ZTWO_PADDR(videomemory);
c7c95f19f37976 drivers/video/fbdev/amifb.c Toshi Kani         2015-06-04  3706  	videomemory = (u_long)ioremap_wt(info->fix.smem_start,
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3707  					 info->fix.smem_len);
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3708  	if (!videomemory) {
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3709  		dev_warn(&pdev->dev,
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3710  			 "Unable to map videomem cached writethrough\n");
6112ea0862faca drivers/video/amifb.c       Geert Uytterhoeven 2011-01-09  3711  		info->screen_base = ZTWO_VADDR(info->fix.smem_start);
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3712  	} else
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21 @3713  		info->screen_base = (char *)videomemory;
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3714  
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3715  	memset(dummysprite, 0, DUMMYSPRITEMEMSIZE);
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3716  
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3717  	/*
af5761d6092903 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3718  	 * Make sure the Copper has something to do
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3719  	 */
af5761d6092903 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3720  	ami_init_copper();
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3721  
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3722  	/*
af5761d6092903 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3723  	 * Enable Display DMA
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3724  	 */
af5761d6092903 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3725  	custom.dmacon = DMAF_SETCLR | DMAF_MASTER | DMAF_RASTER | DMAF_COPPER |
af5761d6092903 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3726  			DMAF_BLITTER | DMAF_SPRITE;
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3727  
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3728  	err = request_irq(IRQ_AMIGA_COPPER, amifb_interrupt, 0,
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3729  			  "fb vertb handler", info->par);
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3730  	if (err)
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3731  		goto disable_dma;
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3732  
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3733  	err = fb_alloc_cmap(&info->cmap, 1 << info->var.bits_per_pixel, 0);
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3734  	if (err)
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3735  		goto free_irq;
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3736  
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3737  	dev_set_drvdata(&pdev->dev, info);
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3738  
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3739  	err = register_framebuffer(info);
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3740  	if (err)
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3741  		goto unset_drvdata;
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3742  
31b6780c15a4e3 drivers/video/amifb.c       Joe Perches        2013-09-19  3743  	fb_info(info, "%s frame buffer device, using %dK of video memory\n",
31b6780c15a4e3 drivers/video/amifb.c       Joe Perches        2013-09-19  3744  		info->fix.id, info->fix.smem_len>>10);
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3745  
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3746  	return 0;
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3747  
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3748  unset_drvdata:
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3749  	fb_dealloc_cmap(&info->cmap);
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3750  free_irq:
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3751  	free_irq(IRQ_AMIGA_COPPER, info->par);
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3752  disable_dma:
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3753  	custom.dmacon = DMAF_ALL | DMAF_MASTER;
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3754  	if (videomemory)
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3755  		iounmap((void *)videomemory);
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3756  	chipfree();
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3757  release:
61640c295bbe8b drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3758  	framebuffer_release(info);
f1cbb17ac73993 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  3759  	return err;
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3760  }
^1da177e4c3f41 drivers/video/amifb.c       Linus Torvalds     2005-04-16  3761  

:::::: The code at line 3637 was first introduced by commit
:::::: f1cbb17ac73993225402d7e40a0694c502570876 fbdev/amifb: Reorder functions to remove forward declarations

:::::: TO: Geert Uytterhoeven <geert@linux-m68k.org>
:::::: CC: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
