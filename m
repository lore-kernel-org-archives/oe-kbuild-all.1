Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63707D26B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+Ux5GQw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698052486; x=1729588486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vwS170J2pKNrem9pBwfZXUscw9tZ7GWXRK0vEMvnhRk=;
  b=c+Ux5GQwXEtPOPhLBOXE46Y73e2u4hSlen2wf4u/HvIJl7Z7Kfw4jnJt
   Bh4L8xinRgcQGTDAASKtn+UY9s6HLaJiCJKutTA/uv0/SLoLEqVoeM84H
   UNEWQUFRPliDdVKnFjvl0YHHllZjzwhmNWh+qjbgnTFbRE4tnZdCgAuZb
   Ue4e8HU5GTsoybt/Z/TzHgjonUm2UJn0Mz70UKREBsJigLu3tac+cx/R2
   O4aIRDlrAT5rYa3B2uA/dG8zbv694R9AZ2iVS6Pdei2dpbu9/pQH1aIif
   mbWvPT8EadNlWqkpQyxNtcLqUNZ84kKFQrGUo6+xQd6Nx+Lr3Ya96ZPHQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="8356889"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="8356889"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 02:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="707879570"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="707879570"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Oct 2023 02:14:44 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qur1F-0006lJ-32;
	Mon, 23 Oct 2023 09:14:41 +0000
Date: Mon, 23 Oct 2023 17:14:18 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 538/30000]
 drivers/video/fbdev/mxc/mxc_edid.c:190:5: warning: no previous prototype for
 function 'mxc_edid_fb_mode_is_equal'
Message-ID: <202310231750.QbBuK3hK-lkp@intel.com>
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231023/202310231750.QbBuK3hK-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310231750.QbBuK3hK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310231750.QbBuK3hK-lkp@intel.com/

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
