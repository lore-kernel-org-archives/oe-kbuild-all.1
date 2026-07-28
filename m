Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0F840D58B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 08:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229192; cv=none; b=f4mmbXR1J4lC7Mpwg5+ow6mgp5kJjshXe3q3gxf+apajxuo6fteNgcIhEbj+dEUnKaWvi0ff6Mvj50OflFMfOyjtKCHsDieqd96yph5OipgZIRYTaQG73bXFdI+e/WCLiNtUlFIsI4WPnVp1qYumbye4wqs6Jn/SrO3FnOk91SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229192; c=relaxed/simple;
	bh=7L3QdUqKFuZGfldNGDzFooIL6WhskfIme6Y4fw60isM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jUVOo3nDcQFbor+lE8c6TE4kozyewRZXpjuIjVPFEEQ0mLWjDOAMnwFMkmn5L5zjL4yAJ8GQGaixjW58oI1IlkBsv+vFY+8eo6lUKWsOhun08azhm3kmgiW7Vr3cysb3vun+1aH2C+2MQhBq/AeDSiZvt2W76US7UiQ1UmcwHcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hb37Zky+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hb37Zky+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785229190; x=1816765190;
  h=date:from:to:cc:subject:message-id;
  bh=7L3QdUqKFuZGfldNGDzFooIL6WhskfIme6Y4fw60isM=;
  b=Hb37Zky+4pYQ9NLmsI4VnT3uuzd3kPL6gDiFrxFi4B4CcfDDJycJy6R7
   5DtzzQSyhdsa2OZ6CiyPgm7lJHY6ax8Z89l+ELYAk1d8RpxwkIr+c0suz
   0aKeWzlBEX5CQQY0tXZ0sFqO1n+6SJv3Tban9S0B2QmZTPXMGAXNQQxU9
   LgIF1dMcPVw6Y+o2IFBwVh1M8cNrU2U+WMxUrmUbP441DsiI82BVMWKIh
   Ulg6IvrDP0W5ICgLIpySuwMTUeVRXFHVFC50ghqEyNqHAz5fCteQWe80j
   YgfS/9nzktkK7SN9cjYeHRmV1IsppErNx6kIzd/TnCoMy8POAQl4PvXB+
   Q==;
X-CSE-ConnectionGUID: leBS1hzqSg2h0CLowRhs6g==
X-CSE-MsgGUID: Mpfyr+MBTCW+mbkzXsudrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85847137"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85847137"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 01:59:49 -0700
X-CSE-ConnectionGUID: TZlmmZEpSuWCQi+sgnKAaQ==
X-CSE-MsgGUID: SqqiIOg9TWCXhRrAK6cvMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="257846965"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Jul 2026 01:59:47 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wodf6-00000000eA7-2ZMi;
	Tue, 28 Jul 2026 08:59:44 +0000
Date: Tue, 28 Jul 2026 16:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>
Subject: [linux-next:master 8131/9367]
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c:573:20: warning: 'mb862xx_intr'
 defined but not used
Message-ID: <202607281630.t9ZvGgmJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0d33d21e47d9dc66f91e44da3fc9220c74d93df7
commit: 0738ecee1ab15aa75d2ea433e636d8cbf25623de [8131/9367] fbdev: mb862xx: replace dead select with dependency
config: powerpc-randconfig-r063-20260728 (https://download.01.org/0day-ci/archive/20260728/202607281630.t9ZvGgmJ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281630.t9ZvGgmJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281630.t9ZvGgmJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/mb862xx/mb862xxfbdrv.c:573:20: warning: 'mb862xx_intr' defined but not used [-Wunused-function]
     573 | static irqreturn_t mb862xx_intr(int irq, void *dev_id)
         |                    ^~~~~~~~~~~~
   In file included from include/linux/acpi.h:15,
                    from include/linux/i2c.h:13,
                    from include/uapi/linux/fb.h:6,
                    from include/linux/fb.h:5,
                    from drivers/video/fbdev/mb862xx/mb862xxfbdrv.c:14:
>> include/linux/device.h:279:26: warning: 'dev_attr_dispregs' defined but not used [-Wunused-variable]
     279 |  struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                          ^~~~~~~~~
   drivers/video/fbdev/mb862xx/mb862xxfbdrv.c:571:8: note: in expansion of macro 'DEVICE_ATTR_RO'
     571 | static DEVICE_ATTR_RO(dispregs);
         |        ^~~~~~~~~~~~~~
>> drivers/video/fbdev/mb862xx/mb862xxfbdrv.c:411:12: warning: 'mb862xxfb_init_fbinfo' defined but not used [-Wunused-function]
     411 | static int mb862xxfb_init_fbinfo(struct fb_info *fbi)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/mb862xx_intr +573 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c

17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  409  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  410  /* initialize fb_info data */
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06 @411  static int mb862xxfb_init_fbinfo(struct fb_info *fbi)
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  412  {
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  413  	struct mb862xxfb_par *par = fbi->par;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  414  	struct mb862xx_gc_mode *mode = par->gc_mode;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  415  	unsigned long reg;
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  416  	int stride;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  417  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  418  	fbi->fbops = &mb862xxfb_ops;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  419  	fbi->pseudo_palette = par->pseudo_palette;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  420  	fbi->screen_base = par->fb_base;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  421  	fbi->screen_size = par->mapped_vram;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  422  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  423  	strcpy(fbi->fix.id, DRV_NAME);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  424  	fbi->fix.smem_start = (unsigned long)par->fb_base_phys;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  425  	fbi->fix.mmio_start = (unsigned long)par->mmio_base_phys;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  426  	fbi->fix.mmio_len = par->mmio_len;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  427  	fbi->fix.accel = FB_ACCEL_NONE;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  428  	fbi->fix.type = FB_TYPE_PACKED_PIXELS;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  429  	fbi->fix.type_aux = 0;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  430  	fbi->fix.xpanstep = 1;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  431  	fbi->fix.ypanstep = 1;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  432  	fbi->fix.ywrapstep = 0;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  433  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  434  	reg = inreg(disp, GC_DCM1);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  435  	if (reg & GC_DCM01_DEN && reg & GC_DCM01_L0E) {
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  436  		/* get the disp mode from active display cfg */
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  437  		unsigned long sc = ((reg & GC_DCM01_SC) >> 8) + 1;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  438  		unsigned long hsp, vsp, ht, vt;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  439  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  440  		dev_dbg(par->dev, "using bootloader's disp. mode\n");
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  441  		fbi->var.pixclock = (sc * 1000000) / par->refclk;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  442  		fbi->var.xres = (inreg(disp, GC_HDB_HDP) & 0x0fff) + 1;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  443  		reg = inreg(disp, GC_VDP_VSP);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  444  		fbi->var.yres = ((reg >> 16) & 0x0fff) + 1;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  445  		vsp = (reg & 0x0fff) + 1;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  446  		fbi->var.xres_virtual = fbi->var.xres;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  447  		fbi->var.yres_virtual = fbi->var.yres;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  448  		reg = inreg(disp, GC_L0EM);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  449  		if (reg & GC_L0EM_L0EC_24) {
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  450  			fbi->var.bits_per_pixel = 32;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  451  		} else {
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  452  			reg = inreg(disp, GC_L0M);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  453  			if (reg & GC_L0M_L0C_16)
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  454  				fbi->var.bits_per_pixel = 16;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  455  			else
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  456  				fbi->var.bits_per_pixel = 8;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  457  		}
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  458  		reg = inreg(disp, GC_VSW_HSW_HSP);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  459  		fbi->var.hsync_len = ((reg & 0xff0000) >> 16) + 1;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  460  		fbi->var.vsync_len = ((reg & 0x3f000000) >> 24) + 1;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  461  		hsp = (reg & 0xffff) + 1;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  462  		ht = ((inreg(disp, GC_HTP) & 0xfff0000) >> 16) + 1;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  463  		fbi->var.right_margin = hsp - fbi->var.xres;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  464  		fbi->var.left_margin = ht - hsp - fbi->var.hsync_len;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  465  		vt = ((inreg(disp, GC_VTR) & 0xfff0000) >> 16) + 1;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  466  		fbi->var.lower_margin = vsp - fbi->var.yres;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  467  		fbi->var.upper_margin = vt - vsp - fbi->var.vsync_len;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  468  	} else if (mode) {
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  469  		dev_dbg(par->dev, "using supplied mode\n");
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  470  		fb_videomode_to_var(&fbi->var, (struct fb_videomode *)mode);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  471  		fbi->var.bits_per_pixel = mode->def_bpp ? mode->def_bpp : 8;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  472  	} else {
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  473  		int ret;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  474  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  475  		ret = fb_find_mode(&fbi->var, fbi, "640x480-16@60",
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  476  				   NULL, 0, NULL, 16);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  477  		if (ret == 0 || ret == 4) {
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  478  			dev_err(par->dev,
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  479  				"failed to get initial mode\n");
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  480  			return -EINVAL;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  481  		}
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  482  	}
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  483  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  484  	fbi->var.xoffset = 0;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  485  	fbi->var.yoffset = 0;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  486  	fbi->var.grayscale = 0;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  487  	fbi->var.nonstd = 0;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  488  	fbi->var.height = -1;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  489  	fbi->var.width = -1;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  490  	fbi->var.accel_flags = 0;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  491  	fbi->var.vmode = FB_VMODE_NONINTERLACED;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  492  	fbi->var.activate = FB_ACTIVATE_NOW;
b3e148d730b725 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c Thomas Zimmermann  2023-07-15  493  	fbi->flags =
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  494  #ifdef __BIG_ENDIAN
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  495  		     FBINFO_FOREIGN_ENDIAN |
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  496  #endif
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  497  		     FBINFO_HWACCEL_XPAN |
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  498  		     FBINFO_HWACCEL_YPAN;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  499  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  500  	/* check and possibly fix bpp */
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  501  	if ((fbi->fbops->fb_check_var)(&fbi->var, fbi))
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  502  		dev_err(par->dev, "check_var() failed on initial setup?\n");
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  503  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  504  	fbi->fix.visual = fbi->var.bits_per_pixel == 8 ?
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  505  			 FB_VISUAL_PSEUDOCOLOR : FB_VISUAL_TRUECOLOR;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  506  	fbi->fix.line_length = (fbi->var.xres_virtual *
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  507  				fbi->var.bits_per_pixel) / 8;
dcdf2f7e7e1549 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2011-05-13  508  	fbi->fix.smem_len = fbi->fix.line_length * fbi->var.yres_virtual;
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  509  
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  510  	/*
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  511  	 * reserve space for capture buffers and two cursors
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  512  	 * at the end of vram: 720x576 * 2 * 2.2 + 64x64 * 16.
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  513  	 */
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  514  	par->cap_buf = par->mapped_vram - 0x1bd800 - 0x10000;
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  515  	par->cap_len = 0x1bd800;
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  516  	par->l1_cfg.sx = 0;
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  517  	par->l1_cfg.sy = 0;
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  518  	par->l1_cfg.sw = 720;
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  519  	par->l1_cfg.sh = 576;
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  520  	par->l1_cfg.dx = 0;
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  521  	par->l1_cfg.dy = 0;
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  522  	par->l1_cfg.dw = 720;
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  523  	par->l1_cfg.dh = 576;
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  524  	stride = par->l1_cfg.sw * (fbi->var.bits_per_pixel / 8);
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  525  	par->l1_stride = stride / 64 + ((stride % 64) ? 1 : 0);
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  526  	outreg(cap, GC_CAP_CBM, GC_CBM_OO | GC_CBM_CBST |
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  527  				(par->l1_stride << 16));
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  528  	outreg(cap, GC_CAP_CBOA, par->cap_buf);
f64d8a5fdec35e drivers/video/mb862xx/mb862xxfbdrv.c       Anatolij Gustschin 2011-05-13  529  	outreg(cap, GC_CAP_CBLA, par->cap_buf + par->cap_len);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  530  	return 0;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  531  }
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  532  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  533  /*
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  534   * show some display controller and cursor registers
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  535   */
ff323d6d72e1e4 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c Zhen Lei           2021-06-01  536  static ssize_t dispregs_show(struct device *dev,
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  537  			     struct device_attribute *attr, char *buf)
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  538  {
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  539  	struct fb_info *fbi = dev_get_drvdata(dev);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  540  	struct mb862xxfb_par *par = fbi->par;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  541  	char *ptr = buf;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  542  	unsigned int reg;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  543  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  544  	for (reg = GC_DCM0; reg <= GC_L0DY_L0DX; reg += 4)
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  545  		ptr += sprintf(ptr, "%08x = %08x\n",
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  546  			       reg, inreg(disp, reg));
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  547  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  548  	for (reg = GC_CPM_CUTC; reg <= GC_CUY1_CUX1; reg += 4)
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  549  		ptr += sprintf(ptr, "%08x = %08x\n",
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  550  			       reg, inreg(disp, reg));
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  551  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  552  	for (reg = GC_DCM1; reg <= GC_L0WH_L0WW; reg += 4)
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  553  		ptr += sprintf(ptr, "%08x = %08x\n",
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  554  			       reg, inreg(disp, reg));
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  555  
2ec509b96cce5e drivers/video/mb862xx/mb862xxfb.c          Valentin Sitdikov  2009-12-15  556  	for (reg = 0x400; reg <= 0x410; reg += 4)
2ec509b96cce5e drivers/video/mb862xx/mb862xxfb.c          Valentin Sitdikov  2009-12-15  557  		ptr += sprintf(ptr, "geo %08x = %08x\n",
2ec509b96cce5e drivers/video/mb862xx/mb862xxfb.c          Valentin Sitdikov  2009-12-15  558  			       reg, inreg(geo, reg));
2ec509b96cce5e drivers/video/mb862xx/mb862xxfb.c          Valentin Sitdikov  2009-12-15  559  
2ec509b96cce5e drivers/video/mb862xx/mb862xxfb.c          Valentin Sitdikov  2009-12-15  560  	for (reg = 0x400; reg <= 0x410; reg += 4)
2ec509b96cce5e drivers/video/mb862xx/mb862xxfb.c          Valentin Sitdikov  2009-12-15  561  		ptr += sprintf(ptr, "draw %08x = %08x\n",
2ec509b96cce5e drivers/video/mb862xx/mb862xxfb.c          Valentin Sitdikov  2009-12-15  562  			       reg, inreg(draw, reg));
2ec509b96cce5e drivers/video/mb862xx/mb862xxfb.c          Valentin Sitdikov  2009-12-15  563  
2ec509b96cce5e drivers/video/mb862xx/mb862xxfb.c          Valentin Sitdikov  2009-12-15  564  	for (reg = 0x440; reg <= 0x450; reg += 4)
2ec509b96cce5e drivers/video/mb862xx/mb862xxfb.c          Valentin Sitdikov  2009-12-15  565  		ptr += sprintf(ptr, "draw %08x = %08x\n",
2ec509b96cce5e drivers/video/mb862xx/mb862xxfb.c          Valentin Sitdikov  2009-12-15  566  			       reg, inreg(draw, reg));
2ec509b96cce5e drivers/video/mb862xx/mb862xxfb.c          Valentin Sitdikov  2009-12-15  567  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  568  	return ptr - buf;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  569  }
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  570  
ff323d6d72e1e4 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c Zhen Lei           2021-06-01  571  static DEVICE_ATTR_RO(dispregs);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  572  
b71b7633395205 drivers/video/mb862xx/mb862xxfbdrv.c       H Hartley Sweeten  2012-05-02 @573  static irqreturn_t mb862xx_intr(int irq, void *dev_id)
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  574  {
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  575  	struct mb862xxfb_par *par = (struct mb862xxfb_par *) dev_id;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  576  	unsigned long reg_ist, mask;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  577  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  578  	if (!par)
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  579  		return IRQ_NONE;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  580  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  581  	if (par->type == BT_CARMINE) {
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  582  		/* Get Interrupt Status */
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  583  		reg_ist = inreg(ctrl, GC_CTRL_STATUS);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  584  		mask = inreg(ctrl, GC_CTRL_INT_MASK);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  585  		if (reg_ist == 0)
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  586  			return IRQ_HANDLED;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  587  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  588  		reg_ist &= mask;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  589  		if (reg_ist == 0)
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  590  			return IRQ_HANDLED;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  591  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  592  		/* Clear interrupt status */
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  593  		outreg(ctrl, 0x0, reg_ist);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  594  	} else {
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  595  		/* Get status */
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  596  		reg_ist = inreg(host, GC_IST);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  597  		mask = inreg(host, GC_IMASK);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  598  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  599  		reg_ist &= mask;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  600  		if (reg_ist == 0)
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  601  			return IRQ_HANDLED;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  602  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  603  		/* Clear status */
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  604  		outreg(host, GC_IST, ~reg_ist);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  605  	}
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  606  	return IRQ_HANDLED;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  607  }
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  608  

:::::: The code at line 573 was first introduced by commit
:::::: b71b76333952053c383d20f7b2175968d8ada304 video: mb862xxfbdrv.c: local functions should not be exposed globally

:::::: TO: H Hartley Sweeten <hartleys@visionengravers.com>
:::::: CC: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
