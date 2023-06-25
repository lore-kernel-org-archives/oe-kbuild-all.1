Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E417464
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 19:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687721513; x=1719257513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h5dlSzkRQUQ2h2ypHWTs/UaqgpF3m510tt4OGG6v2Ak=;
  b=jq8e3yey1UAUpQCG9PZyF0YWMtWI9vcp215MOCb5E+1vk6F/skRcOkt0
   ul59ye57FHhDR+1Ljgms6Gyz+iLrBneAghprrnY92uqroDE64QA1h1qoM
   kRbeiRvvGMle/UXfxi6yRUU7gQ+WDr4P/7/n4RGLlLQS82HvKyaURCq0e
   TBSlMQKr85TzQAUg2QnqWAku971VQB7yNA3HYudrfbS4cRsGHlfxY6Kdq
   s+adb0IFsqY2IVkMw0PyHdkUq1XMPDsPLLKuuath2hXK3c9ZUOFoHQRr7
   IHBgKyvFBVitXQsBFzL8mK5yDgecSJHFNqcSTRmARDEq90B/h5UIssJyw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="359977842"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="359977842"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 12:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="745551535"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="745551535"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Jun 2023 12:31:50 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDVSf-000AFR-0r;
	Sun, 25 Jun 2023 19:31:49 +0000
Date: Mon, 26 Jun 2023 03:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.14 19/24]
 drivers/video/fbdev/imsttfb.c:1457:10: warning: 'return' with a value, in
 function returning void
Message-ID: <202306260342.5e7Kix4k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.14
head:   0e9637227cc384da9adde8bf7e03e8d23fdb4fa1
commit: c4cef46ac038645e61c8d88a3e2b45726d6f0f50 [19/24] fbdev: imsttfb: Release framebuffer and dealloc cmap on error path
config: i386-randconfig-i011-20230625 (https://download.01.org/0day-ci/archive/20230626/202306260342.5e7Kix4k-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306260342.5e7Kix4k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306260342.5e7Kix4k-lkp@intel.com/

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
