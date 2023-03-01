Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB6B363
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 00:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677631440; x=1709167440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sqWwdx+fmo4m2nWzhpVGHaKVkl2X6y8O/nRY5BSqixA=;
  b=DO0yRI5iWEpg5p8MzNXQz4blSRXpKjAj9cPJYipwmPY+pcpzJ+8/xSjD
   Se7xs+Fmk5B6V7yih5ARoBGVEPbFiUde00TVWQ9wSxXiE3BfkdUOZ5b6R
   IZzcvdoI7F5hmj7fO7YPmqtXuqaaQrPP4VQ/VMpSg6QXuKgs/r/RfqWAG
   tD+ZeQEe/Eb3ZZfRtHLYR1hIScMu8zLdbrGtpBwrH6irb8wA8hrz8sCio
   sU5FgLUmDy73sO8SO0AbAkH/7DTAvi7kHBVZCKNnmZKB0uMG98Y9lO5dg
   mXIktNDGVg0KyhnxjABv9GHyPWvuawKuoXlkvM4DF+QtpX+2fjaIolZvl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="420546690"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="420546690"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 16:43:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="676525733"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="676525733"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Feb 2023 16:43:58 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXAZZ-0005lT-2m;
	Wed, 01 Mar 2023 00:43:57 +0000
Date: Wed, 1 Mar 2023 08:43:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kun Liu <Kun.Liu2@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Evan Quan <evan.quan@amd.com>
Subject: [agd5f:drm-next 30/61]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1600:5: warning:
 no previous prototype for 'vangogh_set_apu_thermal_limit'
Message-ID: <202303010827.c2N0yBGT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   f4658f43450478240e2e758f0532d19f921f9a69
commit: 0c3c99364361171f8cfeb8b66b1e6f4709919dc3 [30/61] drm/amdgpu: added a sysfs interface for thermal throttling
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230301/202303010827.c2N0yBGT-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 0c3c99364361171f8cfeb8b66b1e6f4709919dc3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303010827.c2N0yBGT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1600:5: warning: no previous prototype for 'vangogh_set_apu_thermal_limit' [-Wmissing-prototypes]
    1600 | int vangogh_set_apu_thermal_limit(struct smu_context *smu, uint32_t limit)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:37,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:64,
                    from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:26:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/vangogh_set_apu_thermal_limit +1600 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c

  1599	
> 1600	int vangogh_set_apu_thermal_limit(struct smu_context *smu, uint32_t limit)
  1601	{
  1602		return smu_cmn_send_smc_msg_with_param(smu,
  1603						      SMU_MSG_SetReducedThermalLimit,
  1604						      limit, NULL);
  1605	}
  1606	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
