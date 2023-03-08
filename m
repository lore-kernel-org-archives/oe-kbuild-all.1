Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B077491
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 15:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678288378; x=1709824378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lh40L9s5rp2D7YZOCxPrM1Z2ojl0ahWv9j3QjcnXtAA=;
  b=c+UHGqt75kl8tupDbYhEtmKAksrl9qO7I0HOT5faKVYNBXUX8mKxFkmk
   4m2vL7JyFOS4CHsCWSjI+JtysjweEdTgtOI5Gh7I2gGcNHxo65LUIHImL
   DpkT3HYJoEQBhkD4t5jhjcUDBbhAqtWUzmHDtjvmc2DAGX0JRwkV8OMRn
   Uya0Hf/zHrlRovTxNIDjnW6VLw1PLRj7dAPTl4BPZUEUtNF0yuxAE+1pG
   yXsv+flvGqkPIQrg6fkxNKv4JzyXwchXG60nYMj1V5AwHMIk2yf5nXOfc
   ftA3Cd2mfcm5YWp2ZvK0rKYU6cuK8TfzFFIGVwkjRRJ568l6yxClYgLJC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400997194"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="400997194"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 07:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="707204794"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="707204794"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Mar 2023 07:12:48 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZvTD-0002Cl-27;
	Wed, 08 Mar 2023 15:12:47 +0000
Date: Wed, 8 Mar 2023 23:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [linux-next:master 1742/1915]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:1214:31:
 warning: variable 'res_pool' set but not used
Message-ID: <202303082325.YWFMFBAj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fc31900c948610e7b5c2f15fb7795832c8325327
commit: bf77fda02411fe2cac3522f40d8d6882d27ac14b [1742/1915] drm/amd/display: Drop unnecessary DCN guards
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230308/202303082325.YWFMFBAj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bf77fda02411fe2cac3522f40d8d6882d27ac14b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout bf77fda02411fe2cac3522f40d8d6882d27ac14b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082325.YWFMFBAj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c: In function 'pre_compute_mst_dsc_configs_for_state':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:1214:31: warning: variable 'res_pool' set but not used [-Wunused-but-set-variable]
    1214 |         struct resource_pool *res_pool;
         |                               ^~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:39:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h: At top level:
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
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:35,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:30:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/res_pool +1214 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c

d9fe1a4c560b70 Alex Deucher   2020-01-07  1204  
7cce4cd628bee0 Lyude Paul     2022-11-14  1205  static int pre_compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
17ce8a6907f77b Roman Li       2022-01-28  1206  						 struct dc_state *dc_state,
17ce8a6907f77b Roman Li       2022-01-28  1207  						 struct dsc_mst_fairness_vars *vars)
17ce8a6907f77b Roman Li       2022-01-28  1208  {
17ce8a6907f77b Roman Li       2022-01-28  1209  	int i, j;
17ce8a6907f77b Roman Li       2022-01-28  1210  	struct dc_stream_state *stream;
17ce8a6907f77b Roman Li       2022-01-28  1211  	bool computed_streams[MAX_PIPES];
17ce8a6907f77b Roman Li       2022-01-28  1212  	struct amdgpu_dm_connector *aconnector;
d3e2c664ec9a3b Lyude Paul     2022-11-14  1213  	struct drm_dp_mst_topology_mgr *mst_mgr;
efa4c4df864ecd Harry Wentland 2023-02-13 @1214  	struct resource_pool *res_pool;
17ce8a6907f77b Roman Li       2022-01-28  1215  	int link_vars_start_index = 0;
33ac94dbdfd5f0 Lyude Paul     2022-11-18  1216  	int ret = 0;
17ce8a6907f77b Roman Li       2022-01-28  1217  
17ce8a6907f77b Roman Li       2022-01-28  1218  	for (i = 0; i < dc_state->stream_count; i++)
17ce8a6907f77b Roman Li       2022-01-28  1219  		computed_streams[i] = false;
17ce8a6907f77b Roman Li       2022-01-28  1220  
17ce8a6907f77b Roman Li       2022-01-28  1221  	for (i = 0; i < dc_state->stream_count; i++) {
17ce8a6907f77b Roman Li       2022-01-28  1222  		stream = dc_state->streams[i];
efa4c4df864ecd Harry Wentland 2023-02-13  1223  		res_pool = stream->ctx->dc->res_pool;
17ce8a6907f77b Roman Li       2022-01-28  1224  
17ce8a6907f77b Roman Li       2022-01-28  1225  		if (stream->signal != SIGNAL_TYPE_DISPLAY_PORT_MST)
17ce8a6907f77b Roman Li       2022-01-28  1226  			continue;
17ce8a6907f77b Roman Li       2022-01-28  1227  
17ce8a6907f77b Roman Li       2022-01-28  1228  		aconnector = (struct amdgpu_dm_connector *)stream->dm_stream_context;
17ce8a6907f77b Roman Li       2022-01-28  1229  
f0127cb11299df Wayne Lin      2022-12-28  1230  		if (!aconnector || !aconnector->dc_sink || !aconnector->mst_output_port)
17ce8a6907f77b Roman Li       2022-01-28  1231  			continue;
17ce8a6907f77b Roman Li       2022-01-28  1232  
17ce8a6907f77b Roman Li       2022-01-28  1233  		if (!aconnector->dc_sink->dsc_caps.dsc_dec_caps.is_dsc_supported)
17ce8a6907f77b Roman Li       2022-01-28  1234  			continue;
17ce8a6907f77b Roman Li       2022-01-28  1235  
17ce8a6907f77b Roman Li       2022-01-28  1236  		if (computed_streams[i])
17ce8a6907f77b Roman Li       2022-01-28  1237  			continue;
17ce8a6907f77b Roman Li       2022-01-28  1238  
17ce8a6907f77b Roman Li       2022-01-28  1239  		if (!is_dsc_need_re_compute(state, dc_state, stream->link))
17ce8a6907f77b Roman Li       2022-01-28  1240  			continue;
17ce8a6907f77b Roman Li       2022-01-28  1241  
f0127cb11299df Wayne Lin      2022-12-28  1242  		mst_mgr = aconnector->mst_output_port->mgr;
d3e2c664ec9a3b Lyude Paul     2022-11-14  1243  		ret = compute_mst_dsc_configs_for_link(state, dc_state, stream->link, vars, mst_mgr,
7cce4cd628bee0 Lyude Paul     2022-11-14  1244  						       &link_vars_start_index);
d3e2c664ec9a3b Lyude Paul     2022-11-14  1245  		if (ret != 0)
7cce4cd628bee0 Lyude Paul     2022-11-14  1246  			return ret;
17ce8a6907f77b Roman Li       2022-01-28  1247  
17ce8a6907f77b Roman Li       2022-01-28  1248  		for (j = 0; j < dc_state->stream_count; j++) {
17ce8a6907f77b Roman Li       2022-01-28  1249  			if (dc_state->streams[j]->link == stream->link)
17ce8a6907f77b Roman Li       2022-01-28  1250  				computed_streams[j] = true;
17ce8a6907f77b Roman Li       2022-01-28  1251  		}
17ce8a6907f77b Roman Li       2022-01-28  1252  	}
17ce8a6907f77b Roman Li       2022-01-28  1253  
7cce4cd628bee0 Lyude Paul     2022-11-14  1254  	return ret;
17ce8a6907f77b Roman Li       2022-01-28  1255  }
17ce8a6907f77b Roman Li       2022-01-28  1256  

:::::: The code at line 1214 was first introduced by commit
:::::: efa4c4df864ecd969670093524d3e8f69188e5eb drm/amd/display: call remove_stream_from_ctx from res_pool funcs

:::::: TO: Harry Wentland <harry.wentland@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
