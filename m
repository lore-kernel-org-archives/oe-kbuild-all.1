Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B35800
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 16:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689784364; x=1721320364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IZT0Hs7E/dstNRNFdJXQAPFFjxXnpn3pccQGfPlZxgk=;
  b=E/Sksdlvlfadzl6zkB7/BrUmUiQq4eafcDRb/fCZ1gbVjdQ0dt46yDp2
   FX/1/hUD0Yn/WOd9FwEz9KTh5ZmlJH+AQMFsHzxsxKqI0VTrb6MeeurS2
   fPdNYhaX8Y8Ldm8XgfT0Zm0YFpVAExyHplDOCK3+9NYrGE/bVF5jlnf/S
   eW8vnYljMACR7xkkb8w9V2EsqrGuBbFMPXc0pMYvbRGIJyy5QRfT1rkta
   ct41G93Yd+SuJ8vr5FF4d6/ZNy/mS2XOXLLxR+3ixUo/6PcR5N9QH05T5
   gTSwClDSNnQZmRwyY+Jp/FM6wCJ8NQPDVWmCyfEy/0Y6CAoVRu4D+REyc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="365398049"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="365398049"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 09:32:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="837754260"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="837754260"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2023 09:32:39 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMA6Q-0005GS-2Y;
	Wed, 19 Jul 2023 16:32:38 +0000
Date: Thu, 20 Jul 2023 00:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/637 1292/12466]
 drivers/video/fbdev/mxc/mxc_edid.c:190:5: warning: no previous prototype for
 function 'mxc_edid_fb_mode_is_equal'
Message-ID: <202307200024.dIdgfmg9-lkp@intel.com>
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
config: x86_64-randconfig-r015-20230718 (https://download.01.org/0day-ci/archive/20230720/202307200024.dIdgfmg9-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200024.dIdgfmg9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200024.dIdgfmg9-lkp@intel.com/

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
