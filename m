Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9191C68E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 23:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOTZSiYk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701299226; x=1732835226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dTSxHBFd5dWw2kXcD+RRkqRnn/A4a5M/WaizGUr7JNU=;
  b=AOTZSiYk2z0QKEjnACSqhMEIozl4gLHZwkpmlUfhXNEnYbaSCbFW4g6D
   Jx8amv4VlFbix+DscAP1c0y1/cw2XrM9M3CHFjCKXT8iRSqfzsZTjXdJk
   ITgB8jk1Cx63Z/zLBPsEUoHAidolOJU3rcEdkqbcRMqn7/XY5UlF/or1u
   i+K2fj/3HMsRTk10DJnJYuZQYqY++ZfE7CZGEREVtCp9rCRIDI//zyQk+
   aip/DqXM8UGMkh1Rz3WI1gSgVmJPTY4Fj2XH2bTpMp5rzug/akxJ8xH12
   T5+UnTShpAnuH98nJB0MWTpK/LCqIEEfxlBOGJxfFEeHAfOwzNCtIe0ea
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="459731766"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="459731766"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 15:07:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="10525987"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Nov 2023 15:07:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Te2-00013a-0x;
	Wed, 29 Nov 2023 23:07:02 +0000
Date: Thu, 30 Nov 2023 07:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 538/30000]
 drivers/video/fbdev/mxc/mxc_edid.c:190:5: warning: no previous prototype for
 function 'mxc_edid_fb_mode_is_equal'
Message-ID: <202311300259.8pPLuLbo-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: bf9855d59aee1df9ce038a24159c9e8f986be3bf [538/30000] video: fbdev: mxc: add Northwest Logic DSI driver support
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231130/202311300259.8pPLuLbo-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311300259.8pPLuLbo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311300259.8pPLuLbo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/mxc/mxc_edid.c:190:5: warning: no previous prototype for function 'mxc_edid_fb_mode_is_equal' [-Wmissing-prototypes]
   int mxc_edid_fb_mode_is_equal(bool use_aspect,
       ^
   drivers/video/fbdev/mxc/mxc_edid.c:190:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mxc_edid_fb_mode_is_equal(bool use_aspect,
   ^
   static 
   1 warning generated.


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
