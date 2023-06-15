Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9180C379
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 00:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686790343; x=1718326343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uKWYpxFsg1ceqqLyqaN1j9vrdoYWyx6t2BcLYoYd3EA=;
  b=a4L3AY0ja2RQEqQl2AMeNj9Ljyc0o0drPsYoccOjlCorGWo1UXcHZUpS
   uFCTSrk2LYAOInnEiHK+DN//i1l67TLXRSMgTr22yWcY6CQc+2YRNSTOP
   JsJyaqGcmTyWpNHzQXedFB32dRyeepuG4YcHCT9WuucsDLxnaV2Q4E0p6
   xxVhtzpRVx25dMRh+IeTuhPp+Qy+Gyt+BEOPSSz8FxZSEnM9+VIqw/A6K
   HTa5i98Qm21UQyl/anrfh+bGU0OJZx8ZYIeW82jDq63qH4SaQdOAtfVvm
   mGboAvTTMguXs6AKLn9UuvwiU5ZBrs2qBzrwYVrgzAFBrcVzJYwS9Mv3G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="356268387"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="356268387"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 17:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="802140355"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="802140355"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2023 17:52:15 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9bDj-0001DV-02;
	Thu, 15 Jun 2023 00:52:15 +0000
Date: Thu, 15 Jun 2023 08:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS_2023.1_update 335/1079]
 drivers/gpu/drm/xlnx/xlnx_fb.c:340: warning: expecting prototype for
 xlnx_fbdev_fini(). Prototype was for xlnx_fb_fini() instead
Message-ID: <202306150829.iF4vY8cR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
head:   b8d15414a440db0904ee32f03268e2d262dbf397
commit: e9d2cf7603c4047f82bf335e4a6392428d7847ab [335/1079] drm: xlnx: Xilinx DRM KMS driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230615/202306150829.iF4vY8cR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/e9d2cf7603c4047f82bf335e4a6392428d7847ab
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
        git checkout e9d2cf7603c4047f82bf335e4a6392428d7847ab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/xlnx/ drivers/media/platform/xilinx/ drivers/net/ethernet/xilinx/ drivers/staging/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306150829.iF4vY8cR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xlnx/xlnx_fb.c:340: warning: expecting prototype for xlnx_fbdev_fini(). Prototype was for xlnx_fb_fini() instead


vim +340 drivers/gpu/drm/xlnx/xlnx_fb.c

   332	
   333	/**
   334	 * xlnx_fbdev_fini - Free the Xilinx framebuffer
   335	 * @fb_helper: drm_fb_helper struct
   336	 *
   337	 * This function is based on drm_fbdev_cma_fini().
   338	 */
   339	void xlnx_fb_fini(struct drm_fb_helper *fb_helper)
 > 340	{
   341		struct xlnx_fbdev *fbdev = to_fbdev(fb_helper);
   342	
   343		drm_fb_helper_unregister_fbi(&fbdev->fb_helper);
   344		if (fbdev->fb_helper.fbdev)
   345			xlnx_fbdev_defio_fini(fbdev->fb_helper.fbdev);
   346	
   347		if (fbdev->fb_helper.fb)
   348			drm_framebuffer_remove(fbdev->fb_helper.fb);
   349	
   350		drm_fb_helper_fini(&fbdev->fb_helper);
   351		kfree(fbdev);
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
