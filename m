Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2002868D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 19:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726947727; cv=none; b=TA8lVCCLwQvbZtOiwQkMl9OoSSLjsIP6SbpvElotx7uVPLzfcfbMzcSN9DjXoAO3yP3nVRtoHq/gFxhFQ13K47Zhl7pvCVfHKjMZHpVagwjm58xunCdzcyPTlSJ7TEnsp2yPtE2+EZUFsGgbisHUi1EtSm8/2edNch9Ydvord4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726947727; c=relaxed/simple;
	bh=x/uJcUkjFexz3omxDJ9T/o+3idzqJAuyFPhaFK2SxLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sOnEEXN7uPLe25IuaY73NuY4gBAF9aaNDbKHONZVLlVG8Qm6bavOx5ajB0QD//OmXThBB6FZojFlZdppO+JmFTBVjSk1Ij6W0ITI5X1U34C1UK4MlAsK7X2B6bqCAJx4BYYGFG69cpj2QhfsSEPjLy0TBSPR/ZLmjEvPi9iUVxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTpH8AyI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTpH8AyI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726947724; x=1758483724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x/uJcUkjFexz3omxDJ9T/o+3idzqJAuyFPhaFK2SxLk=;
  b=bTpH8AyIjYwsB5ySnLDLkJ3kg1mNitTbBpmea/palA6QxqHyzn7M+TQN
   UA/imU89pysLiHotpVnKdo4QoP70CROn083UMdfZgb3JcYDOaNDlhy2WF
   ayXEcc6RMGQZA3rG1CH33NTfLFcKzQKXbK/VLqXBJjzZh9z7oJ4BnThYE
   Xud0rqhDt40wZvVoP6rac99kxja7ilX/x3SFR7ArGSS6izmma9Ya6rAco
   B0esgeMGQqYbJiq8ztZVpxmixz+4uy7aD/eA8Bj8Y7H+lVCbl1TIc25Co
   FoTiwXHUDs30a2Ymvlx/ixlqD6NixKFRw+A3qWIf4t0s7Yk2M8udfk9XW
   g==;
X-CSE-ConnectionGUID: oZa/7s5OTJ6eRNx4JRomnw==
X-CSE-MsgGUID: AhFk99LjRMWOZB5tkmBtdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="43404069"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="43404069"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 12:42:04 -0700
X-CSE-ConnectionGUID: 3E/cSR05QpKGdYYLUllopA==
X-CSE-MsgGUID: fUBzgHeORQKxVEpvNFPvaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="70928950"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Sep 2024 12:42:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss5zU-000Fkk-2n;
	Sat, 21 Sep 2024 19:42:00 +0000
Date: Sun, 22 Sep 2024 03:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 1073/16782]
 drivers/video/fbdev/mxc/mxc_edid.c:190:5: warning: no previous prototype for
 function 'mxc_edid_fb_mode_is_equal'
Message-ID: <202409220314.tyltaJSg-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240922/202409220314.tyltaJSg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220314.tyltaJSg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220314.tyltaJSg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/mxc/mxc_edid.c:190:5: warning: no previous prototype for function 'mxc_edid_fb_mode_is_equal' [-Wmissing-prototypes]
     190 | int mxc_edid_fb_mode_is_equal(bool use_aspect,
         |     ^
   drivers/video/fbdev/mxc/mxc_edid.c:190:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     190 | int mxc_edid_fb_mode_is_equal(bool use_aspect,
         | ^
         | static 
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
