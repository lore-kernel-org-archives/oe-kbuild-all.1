Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5CD6AB9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 06:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzK+xJQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697177240; x=1728713240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7rAY7kwHyUmpCrQCLg2TxVxTjEQxlJPwCSV70nM2Iis=;
  b=EzK+xJQUp37btObPScw76EQ6RRfxpubuMAo1Bq7C8a9zELCHqDZyXG/a
   ufZoWE7/NMSjAKBpKgG6zwmVm4FDjb+aEUp4mAmurZ+AsEFlMoVq7hf70
   kEA2fN7WTfbJPxgKAcZyrxNhHNSR/TPPdibDJiB5gCphkjkGVidqsPGcc
   8sZ+QAkVtSN0QV9lhjS6Pe+t5iOAHpwen5LUAdkF9UwN62JXFbLzsPCZG
   JcteXR7Qjr3k72Izk8YNVB5+dUwSNIICPp+lKusmEUwDvXB7ZUIkwE9uu
   pa512JBXR7PMlzTXpady7G8k3r4mbG908h5XKni1g7Frq1kllXXjdenM0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="364478614"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="364478614"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 23:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="758359333"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="758359333"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Oct 2023 23:07:18 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrBKO-0004Op-0v;
	Fri, 13 Oct 2023 06:07:16 +0000
Date: Fri, 13 Oct 2023 14:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 538/30000]
 drivers/video/fbdev/mxc/mxc_edid.c:190:5: warning: no previous declaration
 for 'mxc_edid_fb_mode_is_equal'
Message-ID: <202310131312.osGRkFgO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: bf9855d59aee1df9ce038a24159c9e8f986be3bf [538/30000] video: fbdev: mxc: add Northwest Logic DSI driver support
config: x86_64-randconfig-001-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131312.osGRkFgO-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131312.osGRkFgO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131312.osGRkFgO-lkp@intel.com/

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
