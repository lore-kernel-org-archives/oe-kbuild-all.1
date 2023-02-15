Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E1815AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 01:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676426309; x=1707962309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PQ2F9jNNgsRMNllnHiMEpYhG5ukoP51Vj3lVLYRlF0Q=;
  b=IAyqt+72VxeYEcuQIu7iGGuirHFxzSgkHxUwTgEYtlRLhC+9sMeavVpP
   2c+YE8Dooqr9LTBtq2Fkv1gD+tngZKDGKOOsnO53HCKqLhln8eSVeV7Hl
   Ef1zYwM3AEnFEj7q/5Eoeuxx9ohWBmVvPrOVIHiRk8RByxAH3qKAfnB0g
   0dArbxbakZUuYYWwGIAK858TeTsnO6chCS1fW1jWil9ahDCU/b1bUS8q6
   pvfznrg/yP8A+9MfuK7461Nn65mI+tOpfGVBt9uImmZWBPqa9TuFE1HbL
   jariuS2zeUBTs7s8Fzo2Ct+3r/CTG3bOklhRUQLXJ1yeGFivgVMo0hHzU
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="333458743"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="333458743"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 17:58:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="619260279"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="619260279"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Feb 2023 17:58:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS73z-0008uu-0Y;
	Wed, 15 Feb 2023 01:58:27 +0000
Date: Wed, 15 Feb 2023 09:58:02 +0800
From: kernel test robot <lkp@intel.com>
To: Wenjing Liu <wenjing.liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Jun Lei <Jun.Lei@amd.com>
Subject: [agd5f:drm-next 96/97]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:1199:
 warning: expecting prototype for dc_link_detect_connection_type(). Prototype
 was for link_detect_connection_type() instead
Message-ID: <202302150939.um9QWAEP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   35f33086b1b9cf5d85f55b36c75b92f8cccfbf12
commit: 5ca38a18b5a47017d0e9a016661dad12322767fa [96/97] drm/amd/display: move public dc link function implementation to dc_link_exports
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230215/202302150939.um9QWAEP-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 5ca38a18b5a47017d0e9a016661dad12322767fa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302150939.um9QWAEP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:844: warning: Function parameter or member 'link' not described in 'detect_link_and_local_sink'
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:844: warning: Function parameter or member 'reason' not described in 'detect_link_and_local_sink'
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:1199: warning: Function parameter or member 'link' not described in 'link_detect_connection_type'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:1199: warning: expecting prototype for dc_link_detect_connection_type(). Prototype was for link_detect_connection_type() instead


vim +1199 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c

54618888d1ea7a Wenjing Liu 2023-01-18  1190  
54618888d1ea7a Wenjing Liu 2023-01-18  1191  /**
54618888d1ea7a Wenjing Liu 2023-01-18  1192   * dc_link_detect_connection_type() - Determine if there is a sink connected
54618888d1ea7a Wenjing Liu 2023-01-18  1193   *
54618888d1ea7a Wenjing Liu 2023-01-18  1194   * @type: Returned connection type
54618888d1ea7a Wenjing Liu 2023-01-18  1195   * Does not detect downstream devices, such as MST sinks
54618888d1ea7a Wenjing Liu 2023-01-18  1196   * or display connected through active dongles
54618888d1ea7a Wenjing Liu 2023-01-18  1197   */
5ca38a18b5a470 Wenjing Liu 2023-02-01  1198  bool link_detect_connection_type(struct dc_link *link, enum dc_connection_type *type)
54618888d1ea7a Wenjing Liu 2023-01-18 @1199  {
54618888d1ea7a Wenjing Liu 2023-01-18  1200  	uint32_t is_hpd_high = 0;
54618888d1ea7a Wenjing Liu 2023-01-18  1201  
54618888d1ea7a Wenjing Liu 2023-01-18  1202  	if (link->connector_signal == SIGNAL_TYPE_LVDS) {
54618888d1ea7a Wenjing Liu 2023-01-18  1203  		*type = dc_connection_single;
54618888d1ea7a Wenjing Liu 2023-01-18  1204  		return true;
54618888d1ea7a Wenjing Liu 2023-01-18  1205  	}
54618888d1ea7a Wenjing Liu 2023-01-18  1206  
54618888d1ea7a Wenjing Liu 2023-01-18  1207  	if (link->connector_signal == SIGNAL_TYPE_EDP) {
54618888d1ea7a Wenjing Liu 2023-01-18  1208  		/*in case it is not on*/
54618888d1ea7a Wenjing Liu 2023-01-18  1209  		if (!link->dc->config.edp_no_power_sequencing)
54618888d1ea7a Wenjing Liu 2023-01-18  1210  			link->dc->hwss.edp_power_control(link, true);
54618888d1ea7a Wenjing Liu 2023-01-18  1211  		link->dc->hwss.edp_wait_for_hpd_ready(link, true);
54618888d1ea7a Wenjing Liu 2023-01-18  1212  	}
54618888d1ea7a Wenjing Liu 2023-01-18  1213  
54618888d1ea7a Wenjing Liu 2023-01-18  1214  	/* Link may not have physical HPD pin. */
54618888d1ea7a Wenjing Liu 2023-01-18  1215  	if (link->ep_type != DISPLAY_ENDPOINT_PHY) {
54618888d1ea7a Wenjing Liu 2023-01-18  1216  		if (link->is_hpd_pending || !dc_link_dpia_query_hpd_status(link))
54618888d1ea7a Wenjing Liu 2023-01-18  1217  			*type = dc_connection_none;
54618888d1ea7a Wenjing Liu 2023-01-18  1218  		else
54618888d1ea7a Wenjing Liu 2023-01-18  1219  			*type = dc_connection_single;
54618888d1ea7a Wenjing Liu 2023-01-18  1220  
54618888d1ea7a Wenjing Liu 2023-01-18  1221  		return true;
54618888d1ea7a Wenjing Liu 2023-01-18  1222  	}
54618888d1ea7a Wenjing Liu 2023-01-18  1223  
54618888d1ea7a Wenjing Liu 2023-01-18  1224  
54618888d1ea7a Wenjing Liu 2023-01-18  1225  	if (!query_hpd_status(link, &is_hpd_high))
54618888d1ea7a Wenjing Liu 2023-01-18  1226  		goto hpd_gpio_failure;
54618888d1ea7a Wenjing Liu 2023-01-18  1227  
54618888d1ea7a Wenjing Liu 2023-01-18  1228  	if (is_hpd_high) {
54618888d1ea7a Wenjing Liu 2023-01-18  1229  		*type = dc_connection_single;
54618888d1ea7a Wenjing Liu 2023-01-18  1230  		/* TODO: need to do the actual detection */
54618888d1ea7a Wenjing Liu 2023-01-18  1231  	} else {
54618888d1ea7a Wenjing Liu 2023-01-18  1232  		*type = dc_connection_none;
54618888d1ea7a Wenjing Liu 2023-01-18  1233  	}
54618888d1ea7a Wenjing Liu 2023-01-18  1234  
54618888d1ea7a Wenjing Liu 2023-01-18  1235  	return true;
54618888d1ea7a Wenjing Liu 2023-01-18  1236  
54618888d1ea7a Wenjing Liu 2023-01-18  1237  hpd_gpio_failure:
54618888d1ea7a Wenjing Liu 2023-01-18  1238  	return false;
54618888d1ea7a Wenjing Liu 2023-01-18  1239  }
54618888d1ea7a Wenjing Liu 2023-01-18  1240  

:::::: The code at line 1199 was first introduced by commit
:::::: 54618888d1ea7a26f8bccfb89e3c2420350c8047 drm/amd/display: break down dc_link.c

:::::: TO: Wenjing Liu <wenjing.liu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
