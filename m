Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DC615B4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 01:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675560072; x=1707096072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WFThPd9l4PwBK+/ESCCKMEzBRLN3hloaEI6ypseAVqo=;
  b=AwIh91y4mNWVr4lAfWTxl0Mn/42hQbEq/6sv7t7qFeVIhG5Hro3DG5fn
   zeExqI08cm+BxnXLBpff0DBZXX0Q3gvIi3H2mcWALgRVUN94SSdM/PZnC
   3QWhjCtoeO67K47UW5nErUIlfnl3R+D+cbvzP5+ll0e3Yug+QwfadhY43
   5ybz5TpL2nkn37y79j9+ugopATSZMzVf8Njcc3pH6loFEgfJ/JfIZLtb7
   bkLTMA+Xx88kbdoHsAUj4XPEgvH7Ls6yNP6fIJYqRaHTD7Q/G0n/wfOWb
   zE0mh5zrBjEbGRYUTcT5upkVObqc7sYDJSi1Bzso9wkyA0FdMdOAsuWgc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="415225405"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="415225405"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 17:21:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="616092041"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="616092041"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Feb 2023 17:21:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOTiI-0001d6-1F;
	Sun, 05 Feb 2023 01:21:02 +0000
Date: Sun, 5 Feb 2023 09:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 1335/20208]
 drivers/video/fbdev/mxc/mxc_edid.c:190:5: warning: no previous prototype for
 function 'mxc_edid_fb_mode_is_equal'
Message-ID: <202302050938.zkY5r9Nm-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 53b409327c6b9468f2c8c306a2b833e8fa3035be [1335/20208] video: fbdev: mxc: add Northwest Logic DSI driver support
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230205/202302050938.zkY5r9Nm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/53b409327c6b9468f2c8c306a2b833e8fa3035be
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 53b409327c6b9468f2c8c306a2b833e8fa3035be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/i2c/busses/ drivers/video/fbdev/mxc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
https://github.com/intel/lkp-tests
