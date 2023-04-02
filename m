Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7CF7C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Apr 2023 02:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680400849; x=1711936849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7nxn/Ua8nJkRMxxAXjefZY7ZAhrGJZkIb1Bz/1aTfgA=;
  b=H2ztHQ4ud6XOo/z26sZXDV3E82mDLHLiHiwKH1yJ3cskCtJeJ4Fc89D8
   pDrqodMcTyTI1ubff1qtKDyWC6excipASpp1UD1voajaqrY2V/N8oUJ+6
   BNluqYgnEpkCrBMxwbypppHEmMwN3AT7D/Rojq3WaOYpvo2eu/XST9rZq
   LeO8VHKcYT24kJQc8YheF3+kUq7s4os5pL5WcF4scjTmb+Kv5glhhB4j3
   F/xXif+ShP9QYdXydyyFNNXgRbDxBjGsdxqxzf7bgbDc2DOkxEBnCi/7+
   zZPnRNd6vDUwxptEl71FDJeHM7RsIj0eyobb44un0a/W415DF+kWA2G5E
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="340422179"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="340422179"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 19:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="679039251"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="679039251"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Apr 2023 19:00:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pin1R-000NAb-23;
	Sun, 02 Apr 2023 02:00:45 +0000
Date: Sun, 2 Apr 2023 10:00:42 +0800
From: kernel test robot <lkp@intel.com>
To: Wesley Chalmers <Wesley.Chalmers@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:294:6:
 warning: no previous prototype for
 'optc3_wait_drr_doublebuffer_pending_clear'
Message-ID: <202304020914.aETvh0O8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wesley,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   00c7b5f4ddc5b346df62b757ec73f9357bb452af
commit: 8f0d304d21b351d65e8c434c5399a40231876ba1 drm/amd/display: Do not commit pipe when updating DRR
date:   7 weeks ago
config: arm64-buildonly-randconfig-r005-20230402 (https://download.01.org/0day-ci/archive/20230402/202304020914.aETvh0O8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8f0d304d21b351d65e8c434c5399a40231876ba1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8f0d304d21b351d65e8c434c5399a40231876ba1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304020914.aETvh0O8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:294:6: warning: no previous prototype for 'optc3_wait_drr_doublebuffer_pending_clear' [-Wmissing-prototypes]
     294 | void optc3_wait_drr_doublebuffer_pending_clear(struct timing_generator *optc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:32:
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
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:35,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/reg_helper.h:28,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:26:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/optc3_wait_drr_doublebuffer_pending_clear +294 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c

   293	
 > 294	void optc3_wait_drr_doublebuffer_pending_clear(struct timing_generator *optc)
   295	{
   296		struct optc *optc1 = DCN10TG_FROM_TG(optc);
   297	
   298		REG_WAIT(OTG_DOUBLE_BUFFER_CONTROL, OTG_DRR_TIMING_DBUF_UPDATE_PENDING, 0, 2, 100000); /* 1 vupdate at 5hz */
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
