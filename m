Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F975693
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 11:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691751822; x=1723287822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/96RTtNZfmIif1OCBdZ6izCfnrU0lIJ29WRym15WpNk=;
  b=lHF6SV+39G/6sHCQj3IltA1NoIPikBJqR+Dyc0cY+TOA58+yTBLlI67M
   hvNuYt4xaYok4B6NeleyjXLGK9vYvGb2SQfWfiT8Bufy45Ohf8z/JJ8lF
   qRGWDbT9VUJ7lCsH72VM0GM6SY3t7fU7v41cfPlKnShYGYtqI9Q3cgXIA
   pIVcXWFWEFUyMs4TI80VpFqtmWP6uvPPTGHC+WNk3gqXVoV58fcM2qo9h
   UBCOH6BkrgD07BWF0F/w+DwdZmno81vPcEfF9WMu7AVMJMK9YRCVeYQPS
   S2GF+N7mvsgZrUaJ9y9hvllhzD9FXygoCHE3VrFG1opI5of+gXwG+oAeA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="437989890"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="437989890"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP; 11 Aug 2023 04:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="979206136"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="979206136"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Aug 2023 04:03:40 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUPvf-0007jR-1j;
	Fri, 11 Aug 2023 11:03:39 +0000
Date: Fri, 11 Aug 2023 19:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.14.y 4888/5126]
 drivers/video/fbdev/imsttfb.c:1457:10: warning: 'return' with a value, in
 function returning void
Message-ID: <202308111903.QndKHO7x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   42c4d61793d56abc629911c78aaa9ed24293151a
commit: 8f05ae0e3fdd533865dbd1b0b2632986c0706a50 [4888/5126] fbdev: imsttfb: Release framebuffer and dealloc cmap on error path
config: x86_64-randconfig-r022-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111903.QndKHO7x-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111903.QndKHO7x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111903.QndKHO7x-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/imsttfb.c: In function 'init_imstt':
>> drivers/video/fbdev/imsttfb.c:1457:10: warning: 'return' with a value, in function returning void
      return -ENODEV;
             ^
   drivers/video/fbdev/imsttfb.c:1351:13: note: declared here
    static void init_imstt(struct fb_info *info)
                ^~~~~~~~~~


vim +/return +1457 drivers/video/fbdev/imsttfb.c

  1418	
  1419		if ((info->var.xres * info->var.yres) * (info->var.bits_per_pixel >> 3) > info->fix.smem_len
  1420		    || !(compute_imstt_regvals(par, info->var.xres, info->var.yres))) {
  1421			printk("imsttfb: %ux%ux%u not supported\n", info->var.xres, info->var.yres, info->var.bits_per_pixel);
  1422			framebuffer_release(info);
  1423			return;
  1424		}
  1425	
  1426		sprintf(info->fix.id, "IMS TT (%s)", par->ramdac == IBM ? "IBM" : "TVP");
  1427		info->fix.mmio_len = 0x1000;
  1428		info->fix.accel = FB_ACCEL_IMS_TWINTURBO;
  1429		info->fix.type = FB_TYPE_PACKED_PIXELS;
  1430		info->fix.visual = info->var.bits_per_pixel == 8 ? FB_VISUAL_PSEUDOCOLOR
  1431								: FB_VISUAL_DIRECTCOLOR;
  1432		info->fix.line_length = info->var.xres * (info->var.bits_per_pixel >> 3);
  1433		info->fix.xpanstep = 8;
  1434		info->fix.ypanstep = 1;
  1435		info->fix.ywrapstep = 0;
  1436	
  1437		info->var.accel_flags = FB_ACCELF_TEXT;
  1438	
  1439	//	if (par->ramdac == IBM)
  1440	//		imstt_cursor_init(info);
  1441		if (info->var.green.length == 6)
  1442			set_565(par);
  1443		else
  1444			set_555(par);
  1445		set_imstt_regvals(info, info->var.bits_per_pixel);
  1446	
  1447		info->var.pixclock = 1000000 / getclkMHz(par);
  1448	
  1449		info->fbops = &imsttfb_ops;
  1450		info->flags = FBINFO_DEFAULT |
  1451	                      FBINFO_HWACCEL_COPYAREA |
  1452		              FBINFO_HWACCEL_FILLRECT |
  1453		              FBINFO_HWACCEL_YPAN;
  1454	
  1455		if (fb_alloc_cmap(&info->cmap, 0, 0)) {
  1456			framebuffer_release(info);
> 1457			return -ENODEV;
  1458		}
  1459	
  1460		if (register_framebuffer(info) < 0) {
  1461			fb_dealloc_cmap(&info->cmap);
  1462			framebuffer_release(info);
  1463			return;
  1464		}
  1465	
  1466		tmp = (read_reg_le32(par->dc_regs, SSTATUS) & 0x0f00) >> 8;
  1467		fb_info(info, "%s frame buffer; %uMB vram; chip version %u\n",
  1468			info->fix.id, info->fix.smem_len >> 20, tmp);
  1469	}
  1470	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
