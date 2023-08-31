Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E7811722
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693490498; x=1725026498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lNbU7jtcjOutRl09wehUOFToS/gdM8kAXGu2kdTBmso=;
  b=RMBiiKjj+tSG9/iUNZlLilvja5huedkHQ/MQQMTzdOS8o+eGMSG1/wz1
   Y18G3y5adldBIlE/O9jH9w8rx48SppjcRonOL8gmIakh1LrsnBmYDQaz6
   Dv/tI26NRDx3jw1eG40L5nRPqoerwMPjEuZGoSDnCAaICsiEIXDNAt+nf
   3QOBjzOKJ/9dq3KO2Vh1c7m/fzFLrA2+NmGwjkq0j8yJUDI2u7D2niT87
   kS9A3Iv7kmB30vbc9RNm9AMd7E0HheN9n+jliFOPvURv7mPSi0nuejtHb
   US9I91bsThpzHrKhMHhcNIX652/IS9HPdlEsrz7OH9YzpeuBjsi0+Y7oe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="366167771"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="366167771"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 06:39:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739532430"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="739532430"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Aug 2023 06:39:51 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbhtk-0000Bl-3C;
	Thu, 31 Aug 2023 13:39:48 +0000
Date: Thu, 31 Aug 2023 21:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 1335/24603]
 drivers/video/fbdev/mxc/mxc_edid.c:190:5: warning: no previous declaration
 for 'mxc_edid_fb_mode_is_equal'
Message-ID: <202308312112.lKe2OZ73-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 53b409327c6b9468f2c8c306a2b833e8fa3035be [1335/24603] video: fbdev: mxc: add Northwest Logic DSI driver support
config: x86_64-randconfig-071-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312112.lKe2OZ73-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312112.lKe2OZ73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312112.lKe2OZ73-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/mxc/mxc_edid.c:190:5: warning: no previous declaration for 'mxc_edid_fb_mode_is_equal' [-Wmissing-declarations]
    int mxc_edid_fb_mode_is_equal(bool use_aspect,
        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/mxc/mxc_edid.c: In function 'get_detailed_timing':
   drivers/video/fbdev/mxc/mxc_edid.c:257:34: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
      DPRINTK("Aspect ratio: 16:9\n");
                                     ^
   drivers/video/fbdev/mxc/mxc_edid.c:259:33: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
      DPRINTK("Aspect ratio: 4:3\n");
                                    ^


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
