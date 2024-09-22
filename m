Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763F339ADD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 01:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726968855; cv=none; b=WrLzGEwE/LLVG9BacBeMYRE20vdluHKuzy3pOjEGfbtXhY9uyQ/RqCS0jyrU5Lt6T3UHkgZi2kYdddRMHld5ZQXjGagXR+APZKrmtEJ/yubFnOobGVV3jV8zUG4YSsA6kbZEFTim//IxewQLKjy5Vpcdd5sanOUpVNALPQ+/oXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726968855; c=relaxed/simple;
	bh=DOWQGQDJ9RBMQBvvixgN5toK2ri0kdQk/sko2aTkC6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hUv2ptQQssyNCa6IFsBD4tolHIb1wTTFLk7ocN+RXIOXnIbR1/I8yV4+6sU6QV8rMTMykz76q9UvcEjd/X2lDYLuUeGxS2enDTI94PACxTWYbeSnV5ge3lkB3ftMj7wVnHg+vNHxtsiZXaHuXeaHo84RYcoH4+fm/TlB2B+68yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUFjXutj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUFjXutj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726968854; x=1758504854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DOWQGQDJ9RBMQBvvixgN5toK2ri0kdQk/sko2aTkC6A=;
  b=jUFjXutjCN6xUK64X+IeK29rQI97wC/M3Adq18IW53jsGuruGCnblb5R
   4MZjA4whEt6raT66I76dq1vPCTkCWu/CotdnWWzpIwJ2PYT5vkS3o+MBZ
   hlmY+LbjP90XARS+navzbepOS9Ne86Mk9N/fXlglVahFaCPGFyRDrOLTp
   ss98rQ1Vj+rFlDTJXPpdtfSWngfsiMhqINnkGVdDZdgJo6r5cEHFDHRTl
   zl3A6DPeyCWqmQ27FIr+bA6fDhswNerGf4WdFS6HyPEojyoN2r9r9RwTq
   t4jPFMuHz4UWmWcT/PG0phpsf6dXFCHY+tIypqKt7rYZa6j+dLl8Y4I73
   Q==;
X-CSE-ConnectionGUID: rvwPCwMMTe+M+wAceXZhuQ==
X-CSE-MsgGUID: AILPsqj9S0mQkQTgRoAFCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36605199"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="36605199"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 18:34:13 -0700
X-CSE-ConnectionGUID: M7shVjeHT+WvW+pbBaAN6w==
X-CSE-MsgGUID: ie1WPE4wRHCApYVrRtYrwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="71521257"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Sep 2024 18:34:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssBUH-000FwA-16;
	Sun, 22 Sep 2024 01:34:09 +0000
Date: Sun, 22 Sep 2024 09:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 1073/16782]
 drivers/video/fbdev/mxc/mxc_edid.c:190:5: warning: no previous prototype for
 'mxc_edid_fb_mode_is_equal'
Message-ID: <202409221103.vHMPNwpP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   d023c381fa6161a7af966abaad8e7d9a997f07e7
commit: 5186caddfc7d3885dd5dfd4c6d15caad2f900c4c [1073/16782] video: fbdev: mxc: add Northwest Logic DSI driver support
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240922/202409221103.vHMPNwpP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409221103.vHMPNwpP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409221103.vHMPNwpP-lkp@intel.com/

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
