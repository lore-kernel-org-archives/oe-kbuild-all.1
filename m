Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD15F2116
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 06:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678863267; x=1710399267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oH0pIw1t1Q5l+FVqk87kr7L//imzZXpxT26OsrTd8RE=;
  b=K0+x65g8/17YYcEXXjNYzt/qusv8lx3tvWV8N+PZJgoGBYdhznm0KiwI
   yWe8c6VD/YVqW5Zgqo0g1+LELlBmGup0fNHAQQ/gNpfE6v1tEKUBtZ5Uw
   /3yT1nmXrjEb3QrJXbC4fpLNLgSlbqPsqJQC/CVYaSXjL+pxcPBn6Xk8d
   cgydKfxcuJ0tgL2L154b3+fKUXW0fgKrUnflTNzlOH2z8zrNwPddRDf5X
   L0p2F/sBIvNCZd+SXMDpizM+QfjUc5kCGoPsg89AJNDu55jUQRjb7BWvw
   m/4Dg/Dj5dTQ0SJHIyDDB4WghI1TILpYK0884TQY2VKl6ove1YfJ42Wpy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="400211612"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="400211612"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 23:54:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="822661806"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="822661806"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2023 23:54:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcL1k-0007VD-1X;
	Wed, 15 Mar 2023 06:54:24 +0000
Date: Wed, 15 Mar 2023 14:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: Wenjing Liu <wenjing.liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>
Subject: [linux-next:master 3547/3780]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:258:10:
 warning: no previous prototype for 'link_timing_bandwidth_kbps'
Message-ID: <202303151409.por0SBf7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   225b6b81afe63b3850b7cee0a3590f51144f2a75
commit: 98ce7d32e2154a6676d4dc7e6877af68cebf8832 [3547/3780] drm/amd/display: convert link.h functions to function pointer style
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230315/202303151409.por0SBf7-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=98ce7d32e2154a6676d4dc7e6877af68cebf8832
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 98ce7d32e2154a6676d4dc7e6877af68cebf8832
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303151409.por0SBf7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:258:10: warning: no previous prototype for 'link_timing_bandwidth_kbps' [-Wmissing-prototypes]
     258 | uint32_t link_timing_bandwidth_kbps(const struct dc_crtc_timing *timing)
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/link.h:78,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.h:27,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:31:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:143:22: warning: 'SYNAPTICS_DEVICE_ID' defined but not used [-Wunused-const-variable=]
     143 | static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:140:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     140 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:138:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     138 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:135:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]
     135 | static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:133:22: warning: 'DP_SINK_DEVICE_STR_ID_2' defined but not used [-Wunused-const-variable=]
     133 | static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:132:22: warning: 'DP_SINK_DEVICE_STR_ID_1' defined but not used [-Wunused-const-variable=]
     132 | static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:37,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/link_timing_bandwidth_kbps +258 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c

   257	
 > 258	uint32_t link_timing_bandwidth_kbps(const struct dc_crtc_timing *timing)
   259	{
   260		uint32_t bits_per_channel = 0;
   261		uint32_t kbps;
   262	
   263		if (timing->flags.DSC)
   264			return dc_dsc_stream_bandwidth_in_kbps(timing,
   265					timing->dsc_cfg.bits_per_pixel,
   266					timing->dsc_cfg.num_slices_h,
   267					timing->dsc_cfg.is_dp);
   268	
   269		switch (timing->display_color_depth) {
   270		case COLOR_DEPTH_666:
   271			bits_per_channel = 6;
   272			break;
   273		case COLOR_DEPTH_888:
   274			bits_per_channel = 8;
   275			break;
   276		case COLOR_DEPTH_101010:
   277			bits_per_channel = 10;
   278			break;
   279		case COLOR_DEPTH_121212:
   280			bits_per_channel = 12;
   281			break;
   282		case COLOR_DEPTH_141414:
   283			bits_per_channel = 14;
   284			break;
   285		case COLOR_DEPTH_161616:
   286			bits_per_channel = 16;
   287			break;
   288		default:
   289			ASSERT(bits_per_channel != 0);
   290			bits_per_channel = 8;
   291			break;
   292		}
   293	
   294		kbps = timing->pix_clk_100hz / 10;
   295		kbps *= bits_per_channel;
   296	
   297		if (timing->flags.Y_ONLY != 1) {
   298			/*Only YOnly make reduce bandwidth by 1/3 compares to RGB*/
   299			kbps *= 3;
   300			if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420)
   301				kbps /= 2;
   302			else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR422)
   303				kbps = kbps * 2 / 3;
   304		}
   305	
   306		return kbps;
   307	}
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
