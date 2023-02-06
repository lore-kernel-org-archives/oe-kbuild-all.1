Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1689128E8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675682099; x=1707218099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u7O/1i2YJdyG4abIKu2dmjy0+ZTSRY6BC3l6Oy9XhGQ=;
  b=Tlpvj5xxUIbdlkDU8zpZkM4Q+EBP7WKjOrD9JQyQgdHngWAF3WrpTF/s
   mEaLG7AHV9Bf8tkimrRQ0Qd8ZTMkvqjmgWxnFcRE/pJSEKdrSD1d7OaJx
   Wud9NsxZ+qQl1z4cGLgB+VdPts92g8BKKCvhVBCQx9uWqI0DzcaXIR+6B
   +9V+Ap3Ih71K2nBUr/RyR1hLS+PeMvjQ9VSUr23lOagYkzZLSYLGPMKiP
   8i+7lWqQgYKUgl8KL4f/uYemooGhHcrmAklLxQtDGBpbVinellZ9wnsto
   1ej9NRWCHppPjTvi2KQ3/zyLi498Hn+PrYY3O6ElgAWNTijQLV4ad6SNN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="312833977"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="312833977"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 03:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="911889466"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="911889466"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Feb 2023 03:14:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOzSY-0002VY-0m;
	Mon, 06 Feb 2023 11:14:54 +0000
Date: Mon, 6 Feb 2023 19:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: Charlene Liu <Charlene.Liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hansen Dsouza <hansen.dsouza@amd.com>,
	Duncan Ma <duncan.ma@amd.com>
Subject: [linux-next:master 3628/10565]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubbub.c:1011:6:
 warning: no previous prototype for 'hubbub31_init'
Message-ID: <202302061911.C7xvHX9v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   129af770823407ee115a56c69a04b440fd2fbe61
commit: dbc2309cac2a550a94357c31b3dacd69647a3f46 [3628/10565] drm/amd/display: add hubbub_init related
config: arm64-randconfig-r011-20230206 (https://download.01.org/0day-ci/archive/20230206/202302061911.C7xvHX9v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=dbc2309cac2a550a94357c31b3dacd69647a3f46
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout dbc2309cac2a550a94357c31b3dacd69647a3f46
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubbub.c:1011:6: warning: no previous prototype for 'hubbub31_init' [-Wmissing-prototypes]
    1011 | void hubbub31_init(struct hubbub *hubbub)
         |      ^~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hubbub.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubbub.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hubbub.h:28,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubbub.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubbub.c:27:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:137:22: warning: 'SYNAPTICS_DEVICE_ID' defined but not used [-Wunused-const-variable=]
     137 | static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:134:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]
     134 | static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:132:22: warning: 'DP_SINK_DEVICE_STR_ID_2' defined but not used [-Wunused-const-variable=]
     132 | static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:131:22: warning: 'DP_SINK_DEVICE_STR_ID_1' defined but not used [-Wunused-const-variable=]
     131 | static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubbub.c:948:6: warning: no previous prototype for 'hubbub32_init' [-Wmissing-prototypes]
     948 | void hubbub32_init(struct hubbub *hubbub)
         |      ^~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hubbub.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubbub.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hubbub.h:28,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubbub.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubbub.c:27:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:137:22: warning: 'SYNAPTICS_DEVICE_ID' defined but not used [-Wunused-const-variable=]
     137 | static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:134:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]
     134 | static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:132:22: warning: 'DP_SINK_DEVICE_STR_ID_2' defined but not used [-Wunused-const-variable=]
     132 | static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:131:22: warning: 'DP_SINK_DEVICE_STR_ID_1' defined but not used [-Wunused-const-variable=]
     131 | static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubp.c:158:6: warning: no previous prototype for 'hubp32_init' [-Wmissing-prototypes]
     158 | void hubp32_init(struct hubp *hubp)
         |      ^~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:35,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubp.c:26:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hubbub31_init +1011 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubbub.c

  1010	
> 1011	void hubbub31_init(struct hubbub *hubbub)
  1012	{
  1013		struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
  1014	
  1015		/*Enable clock gate*/
  1016		if (hubbub->ctx->dc->debug.disable_clock_gate) {
  1017			/*done in hwseq*/
  1018			/*REG_UPDATE(DCFCLK_CNTL, DCFCLK_GATE_DIS, 0);*/
  1019			REG_UPDATE_2(DCHUBBUB_CLOCK_CNTL,
  1020					DISPCLK_R_DCHUBBUB_GATE_DIS, 0,
  1021					DCFCLK_R_DCHUBBUB_GATE_DIS, 0);
  1022		}
  1023	
  1024		/*
  1025		only the DCN will determine when to connect the SDP port
  1026		*/
  1027		REG_UPDATE(DCHUBBUB_SDPIF_CFG0,	SDPIF_PORT_CONTROL, 1);
  1028	}
  1029	static const struct hubbub_funcs hubbub31_funcs = {
  1030		.update_dchub = hubbub2_update_dchub,
  1031		.init_dchub_sys_ctx = hubbub31_init_dchub_sys_ctx,
  1032		.init_vm_ctx = hubbub2_init_vm_ctx,
  1033		.dcc_support_swizzle = hubbub3_dcc_support_swizzle,
  1034		.dcc_support_pixel_format = hubbub2_dcc_support_pixel_format,
  1035		.get_dcc_compression_cap = hubbub31_get_dcc_compression_cap,
  1036		.wm_read_state = hubbub21_wm_read_state,
  1037		.get_dchub_ref_freq = hubbub31_get_dchub_ref_freq,
  1038		.program_watermarks = hubbub31_program_watermarks,
  1039		.allow_self_refresh_control = hubbub1_allow_self_refresh_control,
  1040		.is_allow_self_refresh_enabled = hubbub1_is_allow_self_refresh_enabled,
  1041		.verify_allow_pstate_change_high = hubbub31_verify_allow_pstate_change_high,
  1042		.program_det_size = dcn31_program_det_size,
  1043		.program_compbuf_size = dcn31_program_compbuf_size,
  1044		.init_crb = dcn31_init_crb,
  1045		.hubbub_read_state = hubbub2_read_state,
  1046	};
  1047	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
