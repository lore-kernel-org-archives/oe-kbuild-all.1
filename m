Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499CA29A8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Apr 2023 17:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682270836; x=1713806836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SM/IfPvYFAw7FJcX4lwVnz4QVk8IuuMUQtvHGwBpxjs=;
  b=CC/ooNY9nYZn2Fy3x5noqRsPeIXtrokqSkckAgDig3mDKKLYaeMFCYNz
   DNPXZe49KifGS/BvmbXKm96yQKoaJjeXpt+SGBY9jhKkTkz0n6dzirnFw
   pEBv+UO9sWgYs84kpuDzEjbwbetZr/EgQ4RvkHSY0zHd3pIVw2c590Dc5
   8NrgkfZ5Q8QpTKFGIyodGW/N2TcPy8MpCY33hSRcupZCbyE+mZrBUKv/q
   Ldu1IzXdJLeg2kkarPEIJerYruOcJ2vSqCTR1vFTtYTCAOjS7MQ96IZ1W
   UDAnya7Dh2RvZWvO5dOsrmaDM1jgllvRV5PYWXcVMa0QRzzYhaHQSWeb1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="432576134"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="432576134"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 10:27:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="816989972"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="816989972"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Apr 2023 10:27:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqdUX-000i00-0Z;
	Sun, 23 Apr 2023 17:27:13 +0000
Date: Mon, 24 Apr 2023 01:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: Melissa Wen <mwen@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 05/40] drm/amd/display: add shaper LUT driver-private
 props
Message-ID: <202304240140.BTgpUYgN-lkp@intel.com>
References: <20230423141051.702990-6-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230423141051.702990-6-mwen@igalia.com>

Hi Melissa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230421]
[also build test WARNING on linus/master v6.3-rc7]
[cannot apply to drm-misc/drm-misc-next v6.3-rc7 v6.3-rc6 v6.3-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Melissa-Wen/drm-amd-display-fix-segment-distribution-for-linear-LUTs/20230423-221602
base:   next-20230421
patch link:    https://lore.kernel.org/r/20230423141051.702990-6-mwen%40igalia.com
patch subject: [RFC PATCH 05/40] drm/amd/display: add shaper LUT driver-private props
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230424/202304240140.BTgpUYgN-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6ff0b9c8b0f775b8dfc3201db5b743c17728c5a7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Melissa-Wen/drm-amd-display-fix-segment-distribution-for-linear-LUTs/20230423-221602
        git checkout 6ff0b9c8b0f775b8dfc3201db5b743c17728c5a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304240140.BTgpUYgN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c:320: warning: expecting prototype for drm_crtc_additional_color_mgmt(). Prototype was for dm_crtc_additional_color_mgmt() instead


vim +320 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c

   308	
   309	#ifdef CONFIG_STEAM_DECK
   310	/**
   311	 * drm_crtc_additional_color_mgmt - enable additional color properties
   312	 * @crtc: DRM CRTC
   313	 *
   314	 * This function lets the driver enable the 3D LUT color correction property
   315	 * on a CRTC. This includes shaper LUT, 3D LUT and regamma TF. The shaper
   316	 * LUT and 3D LUT property is only attached if its size is not 0.
   317	 */
   318	static void
   319	dm_crtc_additional_color_mgmt(struct drm_crtc *crtc)
 > 320	{
   321		struct amdgpu_device *adev = drm_to_adev(crtc->dev);
   322	
   323		if (adev->dm.dc->caps.color.mpc.num_3dluts) {
   324			drm_object_attach_property(&crtc->base,
   325						   adev->mode_info.shaper_lut_property, 0);
   326			drm_object_attach_property(&crtc->base,
   327						   adev->mode_info.shaper_lut_size_property,
   328						   MAX_COLOR_LUT_ENTRIES);
   329		}
   330	}
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
