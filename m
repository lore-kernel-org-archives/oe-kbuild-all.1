Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0698CC14F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 07:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689750746; x=1721286746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XXEUU8Fh+yIXOWwDkmXkovR5V3wL1hDW3m8qhGtqFqY=;
  b=GplkozG5/+FPAPfUAhwtX0gHPObu6DSroHpzgCMDJjTWDc6rIAjQAOMB
   JittzBOZt4hM91Eso4e702gTsceYFYQ4O1Hu6wJ5J/NXnYuOHCFP/mDGj
   n9MNPEm8/nDXYR2FAkLSdvzO0LdOj/RaNR6KRQtCRwUtA9ejuq0S3zTgD
   f81YZ+M7RDx1Y3hgaBHG2HKKuLhhOaSoLvleQX6M8IDsuRO46AQiAfr/M
   8o4bcS2awHcxMxgWU4o5nqJeLz6gwXCXzo7J57Dr488IJWFPvlxC50BA3
   mIKusJfGiZT/NM+XhrlnPXNeenvNUlx4EUxa+qm+hCI7ePCzHbysOSBqQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="430157370"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="430157370"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 00:12:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="701192198"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="701192198"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Jul 2023 00:12:09 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM1M0-0004FR-2D;
	Wed, 19 Jul 2023 07:12:08 +0000
Date: Wed, 19 Jul 2023 15:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/637 1292/12466]
 drivers/video/fbdev/mxc/mxc_edid.c:190:5: warning: no previous prototype for
 'mxc_edid_fb_mode_is_equal'
Message-ID: <202307191555.m6eaIypR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fancy,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/637
head:   ec33c7fc43bef23fa0b69db996fee0ba601875e9
commit: a25565555c623a73e159ae4afd3542c8d937e186 [1292/12466] video: fbdev: mxc: add Northwest Logic DSI driver support
config: alpha-randconfig-r014-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191555.m6eaIypR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191555.m6eaIypR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191555.m6eaIypR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/mxc/mxc_edid.c:190:5: warning: no previous prototype for 'mxc_edid_fb_mode_is_equal' [-Wmissing-prototypes]
     190 | int mxc_edid_fb_mode_is_equal(bool use_aspect,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/mxc/mxc_edid.c: In function 'get_detailed_timing':
>> drivers/video/fbdev/mxc/mxc_edid.c:257:48: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     257 |                 DPRINTK("Aspect ratio: 16:9\n");
         |                                                ^
   drivers/video/fbdev/mxc/mxc_edid.c:259:47: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     259 |                 DPRINTK("Aspect ratio: 4:3\n");
         |                                               ^


vim +/mxc_edid_fb_mode_is_equal +190 drivers/video/fbdev/mxc/mxc_edid.c

   184	
   185	/*
   186	 * We have a special version of fb_mode_is_equal that ignores
   187	 * pixclock, since for many CEA modes, 2 frequencies are supported
   188	 * e.g. 640x480 @ 60Hz or 59.94Hz
   189	 */
 > 190	int mxc_edid_fb_mode_is_equal(bool use_aspect,
   191				const struct fb_videomode *mode1,
   192				const struct fb_videomode *mode2)
   193	{
   194		u32 mask;
   195	
   196		if (use_aspect)
   197			mask = ~0;
   198		else
   199			mask = ~FB_VMODE_ASPECT_MASK;
   200	
   201		return (mode1->xres         == mode2->xres &&
   202			mode1->yres         == mode2->yres &&
   203			mode1->hsync_len    == mode2->hsync_len &&
   204			mode1->vsync_len    == mode2->vsync_len &&
   205			mode1->left_margin  == mode2->left_margin &&
   206			mode1->right_margin == mode2->right_margin &&
   207			mode1->upper_margin == mode2->upper_margin &&
   208			mode1->lower_margin == mode2->lower_margin &&
   209			mode1->sync         == mode2->sync &&
   210			/* refresh check, 59.94Hz and 60Hz have the same parameter
   211			 * in struct of mxc_cea_mode */
   212			abs(mode1->refresh - mode2->refresh) <= 1 &&
   213			(mode1->vmode & mask) == (mode2->vmode & mask));
   214	}
   215	
   216	static void get_detailed_timing(unsigned char *block,
   217					struct fb_videomode *mode)
   218	{
   219		mode->xres = H_ACTIVE;
   220		mode->yres = V_ACTIVE;
   221		mode->pixclock = PIXEL_CLOCK;
   222		mode->pixclock /= 1000;
   223		mode->pixclock = KHZ2PICOS(mode->pixclock);
   224		mode->right_margin = H_SYNC_OFFSET;
   225		mode->left_margin = (H_ACTIVE + H_BLANKING) -
   226			(H_ACTIVE + H_SYNC_OFFSET + H_SYNC_WIDTH);
   227		mode->upper_margin = V_BLANKING - V_SYNC_OFFSET -
   228			V_SYNC_WIDTH;
   229		mode->lower_margin = V_SYNC_OFFSET;
   230		mode->hsync_len = H_SYNC_WIDTH;
   231		mode->vsync_len = V_SYNC_WIDTH;
   232		if (HSYNC_POSITIVE)
   233			mode->sync |= FB_SYNC_HOR_HIGH_ACT;
   234		if (VSYNC_POSITIVE)
   235			mode->sync |= FB_SYNC_VERT_HIGH_ACT;
   236		mode->refresh = PIXEL_CLOCK/((H_ACTIVE + H_BLANKING) *
   237					     (V_ACTIVE + V_BLANKING));
   238		if (INTERLACED) {
   239			mode->yres *= 2;
   240			mode->upper_margin *= 2;
   241			mode->lower_margin *= 2;
   242			mode->vsync_len *= 2;
   243			mode->vmode |= FB_VMODE_INTERLACED;
   244		}
   245		mode->flag = FB_MODE_IS_DETAILED;
   246	
   247		if ((H_SIZE / 16) == (V_SIZE / 9))
   248			mode->vmode |= FB_VMODE_ASPECT_16_9;
   249		else if ((H_SIZE / 4) == (V_SIZE / 3))
   250			mode->vmode |= FB_VMODE_ASPECT_4_3;
   251		else if ((mode->xres / 16) == (mode->yres / 9))
   252			mode->vmode |= FB_VMODE_ASPECT_16_9;
   253		else if ((mode->xres / 4) == (mode->yres / 3))
   254			mode->vmode |= FB_VMODE_ASPECT_4_3;
   255	
   256		if (mode->vmode & FB_VMODE_ASPECT_16_9)
 > 257			DPRINTK("Aspect ratio: 16:9\n");
   258		if (mode->vmode & FB_VMODE_ASPECT_4_3)
   259			DPRINTK("Aspect ratio: 4:3\n");
   260		DPRINTK("      %d MHz ",  PIXEL_CLOCK/1000000);
   261		DPRINTK("%d %d %d %d ", H_ACTIVE, H_ACTIVE + H_SYNC_OFFSET,
   262		       H_ACTIVE + H_SYNC_OFFSET + H_SYNC_WIDTH, H_ACTIVE + H_BLANKING);
   263		DPRINTK("%d %d %d %d ", V_ACTIVE, V_ACTIVE + V_SYNC_OFFSET,
   264		       V_ACTIVE + V_SYNC_OFFSET + V_SYNC_WIDTH, V_ACTIVE + V_BLANKING);
   265		DPRINTK("%sHSync %sVSync\n\n", (HSYNC_POSITIVE) ? "+" : "-",
   266		       (VSYNC_POSITIVE) ? "+" : "-");
   267	}
   268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
