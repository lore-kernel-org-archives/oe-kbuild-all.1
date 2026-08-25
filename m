Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A539285041
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650827; cv=none; b=KmYoEBVOHbRwg2x1y8JYxrsiXjCYKZiPG6cifpuLHQWIT4R7jpo95Yp6sqQs1Ti50Cs7Hnc8kWBKFrbwnRMCq4t9740Zb8yJaBEgpy8BX4P3e64cPfpT2JBXQZF1bS91cgxO1RgsBnXe4W2aRa29dy3GwyzkvzqEajqTYoJOQsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650827; c=relaxed/simple;
	bh=ZwR0Ocb+82fKdTLdT8xlWXmQSqBmtyuPcYjqtnh20P8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FgLgdZSoycx+JmLPVAVaxAxVsSqIWJcp6H54AvJyZXPnsUMm2FJXhU8GY09AD5DjsxJdqAhhZiKU04uaQbn+kvz2tcAzZEwIvciK8XVVVZgvQQsSJESGuDbNt1K/EQ/eJAe2e2LBYMPjSod4QG6mBWu0GDwvJuwR16PnTDmhcek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaM9/JrM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaM9/JrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787650825; x=1819186825;
  h=date:from:to:cc:subject:message-id;
  bh=ZwR0Ocb+82fKdTLdT8xlWXmQSqBmtyuPcYjqtnh20P8=;
  b=AaM9/JrMYWNS6KZlQoICiXCNMsDO1+aIQrsCb9RTzb8G793OOeoGd/56
   eSwanF1zilcQ0seubdn/EG3t0wR28qgWTgvIOJahpSDsrWJ7ovBZ/vOx3
   4HoHexZ0cXpZ264sEqLJkel6KXDqTfUqtlgVN/ibp9ibtfpErJac0P5hx
   gXRqza9k8uVBLHiUPx888K3tOwPmX0Y4HSHVpwou+Gc70leBvOvkhxKtP
   hJQbPhiFhZRE9RxTp3+GCtUyP92zUr0w2yDRqRu3ZcbIMnFrgG5PeRXY5
   DJgzSjg4zU5j8Jdyb4rD11k+DWssBaePAe/rZnz/ouGomRm4+cxwZ0Zol
   Q==;
X-CSE-ConnectionGUID: P1g18GgeQF6EOSIvdu5mCg==
X-CSE-MsgGUID: pYhrfkftSsqtnA3Qt0bYhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88241499"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="88241499"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 02:40:24 -0700
X-CSE-ConnectionGUID: AuwEI61LQxiUqAkzCwBXKw==
X-CSE-MsgGUID: vdUwAf3ZRGG0LrEK0wmlRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="297146346"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Aug 2026 02:40:23 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyndl-000000005ZZ-0sHd;
	Tue, 25 Aug 2026 09:40:21 +0000
Date: Tue, 25 Aug 2026 17:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 232/232]
 drivers/video/fbdev/vt8500lcdfb.c:437:34: sparse: sparse: incorrect type in
 argument 3 (different address spaces)
Message-ID: <202608251719.7lMDk1Ku-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   c61fd5b8b09deae047599969ab292b6bdb20b706
commit: e87e1071e5187807267aaf73d8daeb472299b1cc [232/232] fbdev: vt8500lcdfb: Fix dma_free_coherent() cpu_addr parameter
config: arm-randconfig-r111-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251719.7lMDk1Ku-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251719.7lMDk1Ku-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608251719.7lMDk1Ku-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/vt8500lcdfb.c:361:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got void *[assigned] fb_mem_virt @@
   drivers/video/fbdev/vt8500lcdfb.c:361:33: sparse:     expected char [noderef] __iomem *screen_base
   drivers/video/fbdev/vt8500lcdfb.c:361:33: sparse:     got void *[assigned] fb_mem_virt
   drivers/video/fbdev/vt8500lcdfb.c:364:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *palette_cpu @@     got void * @@
   drivers/video/fbdev/vt8500lcdfb.c:364:33: sparse:     expected void [noderef] __iomem *palette_cpu
   drivers/video/fbdev/vt8500lcdfb.c:364:33: sparse:     got void *
   drivers/video/fbdev/vt8500lcdfb.c:434:30: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got void [noderef] __iomem *palette_cpu @@
   drivers/video/fbdev/vt8500lcdfb.c:434:30: sparse:     expected void *cpu_addr
   drivers/video/fbdev/vt8500lcdfb.c:434:30: sparse:     got void [noderef] __iomem *palette_cpu
>> drivers/video/fbdev/vt8500lcdfb.c:437:34: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/vt8500lcdfb.c:437:34: sparse:     expected void *cpu_addr
   drivers/video/fbdev/vt8500lcdfb.c:437:34: sparse:     got char [noderef] __iomem *screen_base
   drivers/video/fbdev/vt8500lcdfb.c:462:30: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got void [noderef] __iomem *palette_cpu @@
   drivers/video/fbdev/vt8500lcdfb.c:462:30: sparse:     expected void *cpu_addr
   drivers/video/fbdev/vt8500lcdfb.c:462:30: sparse:     got void [noderef] __iomem *palette_cpu

vim +437 drivers/video/fbdev/vt8500lcdfb.c

   265	
   266	static int vt8500lcd_probe(struct platform_device *pdev)
   267	{
   268		struct vt8500lcd_info *fbi;
   269		struct resource *res;
   270		struct display_timings *disp_timing;
   271		void *addr;
   272		int irq, ret;
   273	
   274		struct fb_videomode	of_mode;
   275		u32			bpp;
   276		dma_addr_t fb_mem_phys;
   277		unsigned long fb_mem_len;
   278		void *fb_mem_virt;
   279	
   280		ret = -ENOMEM;
   281		fbi = NULL;
   282	
   283		fbi = devm_kzalloc(&pdev->dev, sizeof(struct vt8500lcd_info)
   284				+ sizeof(u32) * 16, GFP_KERNEL);
   285		if (!fbi)
   286			return -ENOMEM;
   287	
   288		strcpy(fbi->fb.fix.id, "VT8500 LCD");
   289	
   290		fbi->fb.fix.type	= FB_TYPE_PACKED_PIXELS;
   291		fbi->fb.fix.xpanstep	= 0;
   292		fbi->fb.fix.ypanstep	= 1;
   293		fbi->fb.fix.ywrapstep	= 0;
   294		fbi->fb.fix.accel	= FB_ACCEL_NONE;
   295	
   296		fbi->fb.var.nonstd	= 0;
   297		fbi->fb.var.activate	= FB_ACTIVATE_NOW;
   298		fbi->fb.var.height	= -1;
   299		fbi->fb.var.width	= -1;
   300		fbi->fb.var.vmode	= FB_VMODE_NONINTERLACED;
   301	
   302		fbi->fb.fbops		= &vt8500lcd_ops;
   303		fbi->fb.flags		= FBINFO_DEFAULT
   304					| FBINFO_HWACCEL_COPYAREA
   305					| FBINFO_HWACCEL_FILLRECT
   306					| FBINFO_HWACCEL_YPAN
   307					| FBINFO_VIRTFB
   308					| FBINFO_PARTIAL_PAN_OK;
   309		fbi->fb.node		= -1;
   310	
   311		addr = fbi;
   312		addr = addr + sizeof(struct vt8500lcd_info);
   313		fbi->fb.pseudo_palette	= addr;
   314	
   315		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   316		if (res == NULL) {
   317			dev_err(&pdev->dev, "no I/O memory resource defined\n");
   318			return -ENODEV;
   319		}
   320	
   321		res = request_mem_region(res->start, resource_size(res), "vt8500lcd");
   322		if (res == NULL) {
   323			dev_err(&pdev->dev, "failed to request I/O memory\n");
   324			return -EBUSY;
   325		}
   326	
   327		fbi->regbase = ioremap(res->start, resource_size(res));
   328		if (fbi->regbase == NULL) {
   329			dev_err(&pdev->dev, "failed to map I/O memory\n");
   330			ret = -EBUSY;
   331			goto failed_free_res;
   332		}
   333	
   334		disp_timing = of_get_display_timings(pdev->dev.of_node);
   335		if (!disp_timing) {
   336			ret = -EINVAL;
   337			goto failed_free_io;
   338		}
   339	
   340		ret = of_get_fb_videomode(pdev->dev.of_node, &of_mode,
   341								OF_USE_NATIVE_MODE);
   342		if (ret)
   343			goto failed_free_io;
   344	
   345		ret = of_property_read_u32(pdev->dev.of_node, "bits-per-pixel", &bpp);
   346		if (ret)
   347			goto failed_free_io;
   348	
   349		/* try allocating the framebuffer */
   350		fb_mem_len = of_mode.xres * of_mode.yres * 2 * (bpp / 8);
   351		fb_mem_virt = dma_alloc_coherent(&pdev->dev, fb_mem_len, &fb_mem_phys,
   352					GFP_KERNEL);
   353		if (!fb_mem_virt) {
   354			pr_err("%s: Failed to allocate framebuffer\n", __func__);
   355			ret = -ENOMEM;
   356			goto failed_free_io;
   357		}
   358	
   359		fbi->fb.fix.smem_start	= fb_mem_phys;
   360		fbi->fb.fix.smem_len	= fb_mem_len;
   361		fbi->fb.screen_base	= fb_mem_virt;
   362	
   363		fbi->palette_size	= PAGE_ALIGN(512);
   364		fbi->palette_cpu	= dma_alloc_coherent(&pdev->dev,
   365							     fbi->palette_size,
   366							     &fbi->palette_phys,
   367							     GFP_KERNEL);
   368		if (fbi->palette_cpu == NULL) {
   369			dev_err(&pdev->dev, "Failed to allocate palette buffer\n");
   370			ret = -ENOMEM;
   371			goto failed_free_mem_virt;
   372		}
   373	
   374		irq = platform_get_irq(pdev, 0);
   375		if (irq < 0) {
   376			dev_err(&pdev->dev, "no IRQ defined\n");
   377			ret = -ENODEV;
   378			goto failed_free_palette;
   379		}
   380	
   381		ret = request_irq(irq, vt8500lcd_handle_irq, 0, "LCD", fbi);
   382		if (ret) {
   383			dev_err(&pdev->dev, "request_irq failed: %d\n", ret);
   384			ret = -EBUSY;
   385			goto failed_free_palette;
   386		}
   387	
   388		init_waitqueue_head(&fbi->wait);
   389	
   390		if (fb_alloc_cmap(&fbi->fb.cmap, 256, 0) < 0) {
   391			dev_err(&pdev->dev, "Failed to allocate color map\n");
   392			ret = -ENOMEM;
   393			goto failed_free_irq;
   394		}
   395	
   396		fb_videomode_to_var(&fbi->fb.var, &of_mode);
   397	
   398		fbi->fb.var.xres_virtual	= of_mode.xres;
   399		fbi->fb.var.yres_virtual	= of_mode.yres * 2;
   400		fbi->fb.var.bits_per_pixel	= bpp;
   401	
   402		ret = vt8500lcd_set_par(&fbi->fb);
   403		if (ret) {
   404			dev_err(&pdev->dev, "Failed to set parameters\n");
   405			goto failed_free_cmap;
   406		}
   407	
   408		writel(fbi->fb.fix.smem_start >> 22, fbi->regbase + 0x1c);
   409		writel((fbi->palette_phys & 0xfffffe00) | 1, fbi->regbase + 0x18);
   410	
   411		platform_set_drvdata(pdev, fbi);
   412	
   413		ret = register_framebuffer(&fbi->fb);
   414		if (ret < 0) {
   415			dev_err(&pdev->dev,
   416				"Failed to register framebuffer device: %d\n", ret);
   417			goto failed_free_cmap;
   418		}
   419	
   420		/*
   421		 * Ok, now enable the LCD controller
   422		 */
   423		writel(readl(fbi->regbase) | 1, fbi->regbase);
   424	
   425		return 0;
   426	
   427	failed_free_cmap:
   428		if (fbi->fb.cmap.len)
   429			fb_dealloc_cmap(&fbi->fb.cmap);
   430	failed_free_irq:
   431		free_irq(irq, fbi);
   432	failed_free_palette:
   433		dma_free_coherent(&pdev->dev, fbi->palette_size,
   434				  fbi->palette_cpu, fbi->palette_phys);
   435	failed_free_mem_virt:
   436		dma_free_coherent(&pdev->dev, fbi->fb.fix.smem_len,
 > 437				  fbi->fb.screen_base, fbi->fb.fix.smem_start);
   438	failed_free_io:
   439		iounmap(fbi->regbase);
   440	failed_free_res:
   441		release_mem_region(res->start, resource_size(res));
   442		return ret;
   443	}
   444	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
