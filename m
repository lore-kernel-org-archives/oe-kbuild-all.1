Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E513EB0F2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 19:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781032062; cv=none; b=WSLWP+aSrXNGjq8ZZ+MZbYl8PnnZFPMf+bpziWG5v8j4qFmb3D3LF+kr8Ak615aUKzq2hERBH5v4SS0zGs0Bup672g6tkYawUNRMsddaalDy3edQJEBFb9s1PeP7Reu9nyV1xArFW19PHSKyuXoonND7uVQCUr7kAOJpFsXLg10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781032062; c=relaxed/simple;
	bh=9f7ck/stwXVD8RezY/hFDQIr0c4aIYh88cvAY0W34ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fO2VZetEDNwk6v0tl37k2qek2Eaw3lZckAR9T5ljkWFf0guzeni/VOskBV+5tMAVz6i5sNtGoYEgmsr4ZyVTkgH2lJPNyPELDUJ2aZL9s2ZP3pluaQwph4znM/UNwwAhDSPf1/xAjxtKnoBYBX2PxZTvEeb1BntyOd3kzKtWvBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGUHw5VT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGUHw5VT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781032061; x=1812568061;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9f7ck/stwXVD8RezY/hFDQIr0c4aIYh88cvAY0W34ZU=;
  b=WGUHw5VTB3So7BO+yHZK4JeUjS6Cfy40ztP9gC+0k6BHufpP/zJZiflt
   z3iOxmGYUwxz26dTG4L3DuZOHSkDYkQZyIRBq8x/wgBmrTsndzAGtziMM
   2u6NhgOJ7kGRp5hoSS60wK2jCj6miQpTva+8R2OPRFYem6NEtG5J0eZua
   wF6OTx/zKeHrU2bYb32MLgVOgd8YENxst76MwB0rYG5HDAnGpm1Lr8hTc
   TwbZ8HBwSLOj086iFwCpzf42HqJ3buUSnE0toFUgcaCjRCcafjGLBREan
   r65u6MetuuxU0Zj6IyJ2QoLD0Chm+0s6cqtUkwT25qCWvU94AWLICEn4X
   g==;
X-CSE-ConnectionGUID: RuVZnmYjQk2TJCnpTdW+ww==
X-CSE-MsgGUID: 3CYsUCMZTa2bSfigxQvm5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85655656"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="85655656"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 12:07:39 -0700
X-CSE-ConnectionGUID: joJ46VWWTWa3hvi705Z29Q==
X-CSE-MsgGUID: nPBG9K8DTnKKG4aUD56muQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="241806142"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2026 12:07:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX1nS-00000000KSk-2O80;
	Tue, 09 Jun 2026 19:07:34 +0000
Date: Wed, 10 Jun 2026 03:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig"?= <u.kleine-koenig@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>
Subject: [deller-fbdev:fbdev-7.0-2 4/7]
 drivers/video/fbdev/au1100fb.c:448:39: error: call to undeclared function
 'KSEG1ADDR'; ISO C99 and later do not support implicit function declarations
Message-ID: <202606100206.xNHV4qAm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.=
git fbdev-7.0-2
head:   0f967cb8ea04486953f85b249b42dda3de842053
commit: 6f366e86481a7503a821de82930df517dddd4047 [4/7] fbdev: au1100fb: Mak=
e driver compilable on non-mips platforms
config: mips-randconfig-r054-20260609 (https://download.01.org/0day-ci/arch=
ive/20260610/202606100206.xNHV4qAm-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 791=
7772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260610/202606100206.xNHV4qAm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100206.xNHV4qAm-lkp@i=
ntel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/video/fbdev/au1100fb.c:448:39: error: call to undeclared functio=
n 'KSEG1ADDR'; ISO C99 and later do not support implicit function declarati=
ons [-Wimplicit-function-declaration]
     448 |         fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(fbdev->=
info.fix.mmio_start);
         |                                              ^
>> drivers/video/fbdev/au1100fb.c:448:16: warning: cast to 'struct au1100fb=
_regs *' from smaller integer type 'int' [-Wint-to-pointer-cast]
     448 |         fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(fbdev->=
info.fix.mmio_start);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/KSEG1ADDR +448 drivers/video/fbdev/au1100fb.c

^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  404 =20
48c68c4f1b54244 drivers/video/au1100fb.c       Greg Kroah-Hartman 2012-12-2=
1  405  static int au1100fb_drv_probe(struct platform_device *dev)
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  406  {
46953e6aab262dc drivers/video/fbdev/au1100fb.c Markus Elfring     2018-03-2=
8  407  	struct au1100fb_device *fbdev;
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  408  	struct resource *regs_res;
6b1889c14b4606b drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-2=
3  409  	struct clk *c;
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  410 =20
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  411  	/* Allocate new device private */
db66f0252e2f17a drivers/video/fbdev/au1100fb.c Markus Elfring     2018-03-2=
8  412  	fbdev =3D devm_kzalloc(&dev->dev, sizeof(*fbdev), GFP_KERNEL);
29914badc59b23e drivers/video/fbdev/au1100fb.c Markus Elfring     2018-03-2=
8  413  	if (!fbdev)
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  414  		return -ENOMEM;
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  415 =20
d121c3f3cedb846 drivers/video/au1100fb.c       Manuel Lauss       2011-09-3=
0  416  	if (au1100fb_setup(fbdev))
d121c3f3cedb846 drivers/video/au1100fb.c       Manuel Lauss       2011-09-3=
0  417  		goto failed;
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  418 =20
7a192ec334cab9f drivers/video/au1100fb.c       Ming Lei           2009-02-0=
6  419  	platform_set_drvdata(dev, (void *)fbdev);
67f30ad19c4b329 drivers/video/fbdev/au1100fb.c Christoph Hellwig  2019-04-2=
8  420  	fbdev->dev =3D &dev->dev;
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  421 =20
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  422  	/* Allocate region for our registers and map them */
d121c3f3cedb846 drivers/video/au1100fb.c       Manuel Lauss       2011-09-3=
0  423  	regs_res =3D platform_get_resource(dev, IORESOURCE_MEM, 0);
d121c3f3cedb846 drivers/video/au1100fb.c       Manuel Lauss       2011-09-3=
0  424  	if (!regs_res) {
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  425  		print_err("fail to retrieve registers resource");
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  426  		return -EFAULT;
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  427  	}
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  428 =20
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  429  	fbdev->info.fix =3D (struct fb_fix_screeninfo) {
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  430  		.mmio_start =3D regs_res->start,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  431  		.mmio_len =3D resource_size(regs_res),
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  432  		.id =3D "AU1100 FB",
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  433  		.xpanstep =3D 1,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  434  		.ypanstep =3D 1,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  435  		.type =3D FB_TYPE_PACKED_PIXELS,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  436  		.accel =3D FB_ACCEL_NONE,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  437  	};
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  438 =20
93019734555f8df drivers/video/au1100fb.c       Manuel Lauss       2012-03-2=
4  439  	if (!devm_request_mem_region(&dev->dev,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  440  				     fbdev->info.fix.mmio_start,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  441  				     fbdev->info.fix.mmio_len,
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  442  				     DRIVER_NAME)) {
c05b7f3d12b9455 drivers/video/au1100fb.c       Rodolfo Giometti   2006-05-3=
0  443  		print_err("fail to lock memory region at 0x%08lx",
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  444  			  fbdev->info.fix.mmio_start);
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  445  		return -EBUSY;
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  446  	}
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  447 =20
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16 @448  	fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.=
fix.mmio_start);
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  449 =20
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  450  	print_dbg("Register memory map at %p", fbdev->regs);
13c89a37c6f6f33 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  451  	print_dbg("phys=3D0x%08x, size=3D%zu", fbdev->regs_phys, fbde=
v->regs_len);
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  452 =20
6b1889c14b4606b drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-2=
3  453  	c =3D clk_get(NULL, "lcd_intclk");
6b1889c14b4606b drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-2=
3  454  	if (!IS_ERR(c)) {
6b1889c14b4606b drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-2=
3  455  		fbdev->lcdclk =3D c;
6b1889c14b4606b drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-2=
3  456  		clk_set_rate(c, 48000000);
6b1889c14b4606b drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-2=
3  457  		clk_prepare_enable(c);
6b1889c14b4606b drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-2=
3  458  	}
6b1889c14b4606b drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-2=
3  459 =20
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  460  	/* Allocate the framebuffer to the maximum screen size * nbr of vi=
deo buffers */
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  461  	fbdev->fb_len =3D fbdev->panel->xres * fbdev->panel->yres *
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  462  		  	(fbdev->panel->bpp >> 3) * AU1100FB_NBR_VIDEO_BUFFERS;
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  463 =20
93019734555f8df drivers/video/au1100fb.c       Manuel Lauss       2012-03-2=
4  464  	fbdev->fb_mem =3D dmam_alloc_coherent(&dev->dev,
1c16697bf9d5b20 drivers/video/au1100fb.c       Julia Lawall       2012-01-2=
1  465  					    PAGE_ALIGN(fbdev->fb_len),
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  466  					    &fbdev->fb_phys, GFP_KERNEL);
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  467  	if (!fbdev->fb_mem) {
13c89a37c6f6f33 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  468  		print_err("fail to allocate framebuffer (size: %zuK))",
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  469  			  fbdev->fb_len / 1024);
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  470  		return -ENOMEM;
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  471  	}
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  472 =20
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  473  	fbdev->info.fix.smem_start =3D fbdev->fb_phys;
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  474  	fbdev->info.fix.smem_len =3D fbdev->fb_len;
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  475 =20
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  476  	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
13c89a37c6f6f33 drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  477  	print_dbg("phys=3D0x%pad, size=3D%zuK", &fbdev->fb_phys, fbde=
v->fb_len / 1024);
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  478 =20
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  479  	/* load the panel info into the var struct */
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  480  	fbdev->info.var =3D (struct fb_var_screeninfo) {
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  481  		.activate =3D FB_ACTIVATE_NOW,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  482  		.height =3D -1,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  483  		.width =3D -1,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  484  		.vmode =3D FB_VMODE_NONINTERLACED,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  485  		.bits_per_pixel =3D fbdev->panel->bpp,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  486  		.xres =3D fbdev->panel->xres,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  487  		.xres_virtual =3D fbdev->panel->xres,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  488  		.yres =3D fbdev->panel->yres,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  489  		.yres_virtual =3D fbdev->panel->yres,
7939cecdc6fa39e drivers/video/fbdev/au1100fb.c Uwe Kleine-K=C3=B6nig   2026=
-02-16  490  	};
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  491 =20
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  492  	fbdev->info.screen_base =3D fbdev->fb_mem;
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  493  	fbdev->info.fbops =3D &au1100fb_ops;
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  494 =20
1c16697bf9d5b20 drivers/video/au1100fb.c       Julia Lawall       2012-01-2=
1  495  	fbdev->info.pseudo_palette =3D
a86854d0c599b32 drivers/video/fbdev/au1100fb.c Kees Cook          2018-06-1=
2  496  		devm_kcalloc(&dev->dev, 16, sizeof(u32), GFP_KERNEL);
1c16697bf9d5b20 drivers/video/au1100fb.c       Julia Lawall       2012-01-2=
1  497  	if (!fbdev->info.pseudo_palette)
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  498  		return -ENOMEM;
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  499 =20
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  500  	if (fb_alloc_cmap(&fbdev->info.cmap, AU1100_LCD_NBR_PALETTE_ENTRIE=
S, 0) < 0) {
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  501  		print_err("Fail to allocate colormap (%d entries)",
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  502  			   AU1100_LCD_NBR_PALETTE_ENTRIES);
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  503  		return -EFAULT;
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  504  	}
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  505 =20
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  506  	/* Set h/w registers */
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  507  	au1100fb_setmode(fbdev);
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  508 =20
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  509  	/* Register new framebuffer */
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  510  	if (register_framebuffer(&fbdev->info) < 0) {
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  511  		print_err("cannot register new framebuffer");
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  512  		goto failed;
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  513  	}
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  514 =20
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  515  	return 0;
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  516 =20
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  517  failed:
6b1889c14b4606b drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-2=
3  518  	if (fbdev->lcdclk) {
6b1889c14b4606b drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-2=
3  519  		clk_disable_unprepare(fbdev->lcdclk);
6b1889c14b4606b drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-2=
3  520  		clk_put(fbdev->lcdclk);
6b1889c14b4606b drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-2=
3  521  	}
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  522  	if (fbdev->info.cmap.len !=3D 0) {
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  523  		fb_dealloc_cmap(&fbdev->info.cmap);
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  524  	}
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  525 =20
1c16697bf9d5b20 drivers/video/au1100fb.c       Julia Lawall       2012-01-2=
1  526  	return -ENODEV;
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov         2005-04-0=
4  527  }
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds     2005-04-1=
6  528 =20

:::::: The code at line 448 was first introduced by commit
:::::: 7939cecdc6fa39ea9e74507a389f31a7a7936b18 fbdev: au1100fb: Don't stor=
e device specific data in global variables

:::::: TO: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
:::::: CC: Helge Deller <deller@gmx.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
