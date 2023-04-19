Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B78A179
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 00:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681862901; x=1713398901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yCe7Z2YbMuu4bjbfbn+2zuZHIdmtw0snhgZjE+P3Bkw=;
  b=l+dTzAJrClkPYHh8uAznbMdaQhfnskNylrOPkErWxM11K8eXC1tBJr5N
   gpDCGpq2PkEDlGRNFu4h/xgDg2asEtKUrAv8e40j4DxQBCOOUZmPSPEO1
   asE/dIZlCYwF5mTUvrgpoduSlW8xnJGZjjXUMbBKzRRkUZsu3HSCBQSGF
   cSGvKmt7Oc9Gi2fw6pc9VG2n2w4ieGrbeMYFQuBKWAWe/w0wsq8XYTnKe
   OFvLmiZ5RlS1zNY+K2186eDMO2GU/e3nIGxpYqywULEyyCj3DL/ghXyTc
   yclKA/bqk59C7+3HT+HwPwIKCZ2XEgyDWKbsCkBbco9gDQTIdMsZOh+nt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="329486904"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="329486904"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 17:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693821639"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="693821639"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Apr 2023 17:08:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1povMw-000eFl-0R;
	Wed, 19 Apr 2023 00:08:18 +0000
Date: Wed, 19 Apr 2023 08:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Huang <Leon.Huang1@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [agd5f:drm-next 12/67]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.c:138:22: warning:
 variable 'feature_support' set but not used
Message-ID: <202304190746.ViVd2eR5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   86b20703e4c5a3c39891def0a68e7438aeca9db9
commit: b8fe56375f78835db47565d91ea9d21767fe3c08 [12/67] drm/amd/display: Refactor ABM feature
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230419/202304190746.ViVd2eR5-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout b8fe56375f78835db47565d91ea9d21767fe3c08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/ drivers/gpu/drm/amd/display/dc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190746.ViVd2eR5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.c: In function 'dmub_abm_set_event_ex':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.c:138:22: warning: variable 'feature_support' set but not used [-Wunused-but-set-variable]
     138 |         unsigned int feature_support;
         |                      ^~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:83:6: warning: no previous prototype for 'dmub_abm_init' [-Wmissing-prototypes]
      83 | void dmub_abm_init(struct abm *abm, uint32_t backlight)
         |      ^~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:124:14: warning: no previous prototype for 'dmub_abm_get_current_backlight' [-Wmissing-prototypes]
     124 | unsigned int dmub_abm_get_current_backlight(struct abm *abm)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:135:14: warning: no previous prototype for 'dmub_abm_get_target_backlight' [-Wmissing-prototypes]
     135 | unsigned int dmub_abm_get_target_backlight(struct abm *abm)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:146:6: warning: no previous prototype for 'dmub_abm_set_level' [-Wmissing-prototypes]
     146 | bool dmub_abm_set_level(struct abm *abm, uint32_t level, uint8_t panel_mask)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:167:6: warning: no previous prototype for 'dmub_abm_set_ambient_level' [-Wmissing-prototypes]
     167 | void dmub_abm_set_ambient_level(struct abm *abm, unsigned int ambient_lux, uint8_t panel_mask)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:189:6: warning: no previous prototype for 'dmub_abm_init_config' [-Wmissing-prototypes]
     189 | void dmub_abm_init_config(struct abm *abm,
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:221:6: warning: no previous prototype for 'dmub_abm_set_pause' [-Wmissing-prototypes]
     221 | bool dmub_abm_set_pause(struct abm *abm, bool pause, unsigned int panel_inst, unsigned int stream_inst)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:241:6: warning: no previous prototype for 'dmub_abm_set_pipe' [-Wmissing-prototypes]
     241 | bool dmub_abm_set_pipe(struct abm *abm, uint32_t otg_inst, uint32_t option, uint32_t panel_inst)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:263:6: warning: no previous prototype for 'dmub_abm_set_backlight_level' [-Wmissing-prototypes]
     263 | bool dmub_abm_set_backlight_level(struct abm *abm,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/feature_support +138 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.c

   133	
   134	static bool dmub_abm_set_event_ex(struct abm *abm, unsigned int full_screen, unsigned int video_mode,
   135			unsigned int hdr_mode, unsigned int panel_inst)
   136	{
   137		bool ret = false;
 > 138		unsigned int feature_support;
   139	
   140		feature_support = abm_feature_support(abm, panel_inst);
   141	
   142		return ret;
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
