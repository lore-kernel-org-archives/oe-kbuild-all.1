Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82E61361
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 04:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681966729; x=1713502729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=19s2ldsksMph3Uxwi8CYawcnq5lJ6cozkSc2+Bcatmg=;
  b=BzMu05yQhwmAUmSwLhngypZh38OkzlQtjemoHbI/aXPmVZVk390T+XXD
   hEaEEZuF+8/3UDwU2bb9Lb7gAmzDVtUfeinHetWluJPFx3dHEJuBAIUWc
   HtbW0cQJJcKm9IU9j5B7TluYzv0qPpqlo4yF48XQE6vYT68qp6mXI/aLg
   dpIVXQ6Iqvz23TAUYv0osqVApdckEO5JwUyJb4LcsXlePHmJ67gvJY5iR
   xUbAedCYlIImn7e1LpsPahbIoDx0gPVw5ttgJKRuY1mvACNw085uXx+Cw
   8YmZYZrutSrV4gSQBLtDDcL/7fsuiJxbh+P2tZGVvDkwuygfr4TWKXsH6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325962835"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="325962835"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 21:58:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="835573318"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="835573318"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Apr 2023 21:58:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppMNG-000fUi-2V;
	Thu, 20 Apr 2023 04:58:26 +0000
Date: Thu, 20 Apr 2023 12:57:52 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Huang <Leon.Huang1@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [linux-next:master 12500/13075]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:253:63: sparse:
 sparse: cast truncates bits from constant value (ffff becomes ff)
Message-ID: <202304201216.YgbKeHUJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cdbc01c40e34c57697f8934f2727a88551696be
commit: b8fe56375f78835db47565d91ea9d21767fe3c08 [12500/13075] drm/amd/display: Refactor ABM feature
config: mips-randconfig-s041-20230416 (https://download.01.org/0day-ci/archive/20230420/202304201216.YgbKeHUJ-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b8fe56375f78835db47565d91ea9d21767fe3c08
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b8fe56375f78835db47565d91ea9d21767fe3c08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201216.YgbKeHUJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:83:6: sparse: sparse: symbol 'dmub_abm_init' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:124:14: sparse: sparse: symbol 'dmub_abm_get_current_backlight' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:135:14: sparse: sparse: symbol 'dmub_abm_get_target_backlight' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:146:6: sparse: sparse: symbol 'dmub_abm_set_level' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:167:6: sparse: sparse: symbol 'dmub_abm_set_ambient_level' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:189:6: sparse: sparse: symbol 'dmub_abm_init_config' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:221:6: sparse: sparse: symbol 'dmub_abm_set_pause' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:241:6: sparse: sparse: symbol 'dmub_abm_set_pipe' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:263:6: sparse: sparse: symbol 'dmub_abm_set_backlight_level' was not declared. Should it be static?
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:253:63: sparse: sparse: cast truncates bits from constant value (ffff becomes ff)

vim +253 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c

    82	
  > 83	void dmub_abm_init(struct abm *abm, uint32_t backlight)
    84	{
    85		struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
    86	
    87		REG_WRITE(DC_ABM1_HG_SAMPLE_RATE, 0x3);
    88		REG_WRITE(DC_ABM1_HG_SAMPLE_RATE, 0x1);
    89		REG_WRITE(DC_ABM1_LS_SAMPLE_RATE, 0x3);
    90		REG_WRITE(DC_ABM1_LS_SAMPLE_RATE, 0x1);
    91		REG_WRITE(BL1_PWM_BL_UPDATE_SAMPLE_RATE, 0x1);
    92	
    93		REG_SET_3(DC_ABM1_HG_MISC_CTRL, 0,
    94				ABM1_HG_NUM_OF_BINS_SEL, 0,
    95				ABM1_HG_VMAX_SEL, 1,
    96				ABM1_HG_BIN_BITWIDTH_SIZE_SEL, 0);
    97	
    98		REG_SET_3(DC_ABM1_IPCSC_COEFF_SEL, 0,
    99				ABM1_IPCSC_COEFF_SEL_R, 2,
   100				ABM1_IPCSC_COEFF_SEL_G, 4,
   101				ABM1_IPCSC_COEFF_SEL_B, 2);
   102	
   103		REG_UPDATE(BL1_PWM_CURRENT_ABM_LEVEL,
   104				BL1_PWM_CURRENT_ABM_LEVEL, backlight);
   105	
   106		REG_UPDATE(BL1_PWM_TARGET_ABM_LEVEL,
   107				BL1_PWM_TARGET_ABM_LEVEL, backlight);
   108	
   109		REG_UPDATE(BL1_PWM_USER_LEVEL,
   110				BL1_PWM_USER_LEVEL, backlight);
   111	
   112		REG_UPDATE_2(DC_ABM1_LS_MIN_MAX_PIXEL_VALUE_THRES,
   113				ABM1_LS_MIN_PIXEL_VALUE_THRES, 0,
   114				ABM1_LS_MAX_PIXEL_VALUE_THRES, 1000);
   115	
   116		REG_SET_3(DC_ABM1_HGLS_REG_READ_PROGRESS, 0,
   117				ABM1_HG_REG_READ_MISSED_FRAME_CLEAR, 1,
   118				ABM1_LS_REG_READ_MISSED_FRAME_CLEAR, 1,
   119				ABM1_BL_REG_READ_MISSED_FRAME_CLEAR, 1);
   120	
   121		dmub_abm_enable_fractional_pwm(abm->ctx);
   122	}
   123	
   124	unsigned int dmub_abm_get_current_backlight(struct abm *abm)
   125	{
   126		struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
   127		unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
   128	
   129		/* return backlight in hardware format which is unsigned 17 bits, with
   130		 * 1 bit integer and 16 bit fractional
   131		 */
   132		return backlight;
   133	}
   134	
   135	unsigned int dmub_abm_get_target_backlight(struct abm *abm)
   136	{
   137		struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
   138		unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
   139	
   140		/* return backlight in hardware format which is unsigned 17 bits, with
   141		 * 1 bit integer and 16 bit fractional
   142		 */
   143		return backlight;
   144	}
   145	
   146	bool dmub_abm_set_level(struct abm *abm, uint32_t level, uint8_t panel_mask)
   147	{
   148		union dmub_rb_cmd cmd;
   149		struct dc_context *dc = abm->ctx;
   150	
   151		memset(&cmd, 0, sizeof(cmd));
   152		cmd.abm_set_level.header.type = DMUB_CMD__ABM;
   153		cmd.abm_set_level.header.sub_type = DMUB_CMD__ABM_SET_LEVEL;
   154		cmd.abm_set_level.abm_set_level_data.level = level;
   155		cmd.abm_set_level.abm_set_level_data.version = DMUB_CMD_ABM_CONTROL_VERSION_1;
   156		cmd.abm_set_level.abm_set_level_data.panel_mask = panel_mask;
   157		cmd.abm_set_level.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_level_data);
   158	
   159		dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
   160		dc_dmub_srv_cmd_execute(dc->dmub_srv);
   161		dc_dmub_srv_wait_idle(dc->dmub_srv);
   162	
   163		return true;
   164	}
   165	
   166	#ifndef TRIM_AMBIENT_GAMMA
   167	void dmub_abm_set_ambient_level(struct abm *abm, unsigned int ambient_lux, uint8_t panel_mask)
   168	{
   169		union dmub_rb_cmd cmd;
   170		struct dc_context *dc = abm->ctx;
   171	
   172		if (ambient_lux > 0xFFFF)
   173			ambient_lux = 0xFFFF;
   174	
   175		memset(&cmd, 0, sizeof(cmd));
   176		cmd.abm_set_ambient_level.header.type = DMUB_CMD__ABM;
   177		cmd.abm_set_ambient_level.header.sub_type = DMUB_CMD__ABM_SET_AMBIENT_LEVEL;
   178		cmd.abm_set_ambient_level.abm_set_ambient_level_data.ambient_lux = ambient_lux;
   179		cmd.abm_set_ambient_level.abm_set_ambient_level_data.version = DMUB_CMD_ABM_CONTROL_VERSION_1;
   180		cmd.abm_set_ambient_level.abm_set_ambient_level_data.panel_mask = panel_mask;
   181		cmd.abm_set_ambient_level.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_ambient_level_data);
   182	
   183		dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
   184		dc_dmub_srv_cmd_execute(dc->dmub_srv);
   185		dc_dmub_srv_wait_idle(dc->dmub_srv);
   186	}
   187	#endif
   188	
   189	void dmub_abm_init_config(struct abm *abm,
   190		const char *src,
   191		unsigned int bytes,
   192		unsigned int inst)
   193	{
   194		union dmub_rb_cmd cmd;
   195		struct dc_context *dc = abm->ctx;
   196		uint8_t panel_mask = 0x01 << inst;
   197	
   198		// TODO: Optimize by only reading back final 4 bytes
   199		dmub_flush_buffer_mem(&dc->dmub_srv->dmub->scratch_mem_fb);
   200	
   201		// Copy iramtable into cw7
   202		memcpy(dc->dmub_srv->dmub->scratch_mem_fb.cpu_addr, (void *)src, bytes);
   203	
   204		memset(&cmd, 0, sizeof(cmd));
   205		// Fw will copy from cw7 to fw_state
   206		cmd.abm_init_config.header.type = DMUB_CMD__ABM;
   207		cmd.abm_init_config.header.sub_type = DMUB_CMD__ABM_INIT_CONFIG;
   208		cmd.abm_init_config.abm_init_config_data.src.quad_part = dc->dmub_srv->dmub->scratch_mem_fb.gpu_addr;
   209		cmd.abm_init_config.abm_init_config_data.bytes = bytes;
   210		cmd.abm_init_config.abm_init_config_data.version = DMUB_CMD_ABM_CONTROL_VERSION_1;
   211		cmd.abm_init_config.abm_init_config_data.panel_mask = panel_mask;
   212	
   213		cmd.abm_init_config.header.payload_bytes = sizeof(struct dmub_cmd_abm_init_config_data);
   214	
   215		dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
   216		dc_dmub_srv_cmd_execute(dc->dmub_srv);
   217		dc_dmub_srv_wait_idle(dc->dmub_srv);
   218	
   219	}
   220	
   221	bool dmub_abm_set_pause(struct abm *abm, bool pause, unsigned int panel_inst, unsigned int stream_inst)
   222	{
   223		union dmub_rb_cmd cmd;
   224		struct dc_context *dc = abm->ctx;
   225		uint8_t panel_mask = 0x01 << panel_inst;
   226	
   227		memset(&cmd, 0, sizeof(cmd));
   228		cmd.abm_pause.header.type = DMUB_CMD__ABM;
   229		cmd.abm_pause.header.sub_type = DMUB_CMD__ABM_PAUSE;
   230		cmd.abm_pause.abm_pause_data.enable = pause;
   231		cmd.abm_pause.abm_pause_data.panel_mask = panel_mask;
   232		cmd.abm_set_level.header.payload_bytes = sizeof(struct dmub_cmd_abm_pause_data);
   233	
   234		dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
   235		dc_dmub_srv_cmd_execute(dc->dmub_srv);
   236		dc_dmub_srv_wait_idle(dc->dmub_srv);
   237	
   238		return true;
   239	}
   240	
   241	bool dmub_abm_set_pipe(struct abm *abm, uint32_t otg_inst, uint32_t option, uint32_t panel_inst)
   242	{
   243		union dmub_rb_cmd cmd;
   244		struct dc_context *dc = abm->ctx;
   245		uint32_t ramping_boundary = 0xFFFF;
   246	
   247		memset(&cmd, 0, sizeof(cmd));
   248		cmd.abm_set_pipe.header.type = DMUB_CMD__ABM;
   249		cmd.abm_set_pipe.header.sub_type = DMUB_CMD__ABM_SET_PIPE;
   250		cmd.abm_set_pipe.abm_set_pipe_data.otg_inst = otg_inst;
   251		cmd.abm_set_pipe.abm_set_pipe_data.set_pipe_option = option;
   252		cmd.abm_set_pipe.abm_set_pipe_data.panel_inst = panel_inst;
 > 253		cmd.abm_set_pipe.abm_set_pipe_data.ramping_boundary = ramping_boundary;
   254		cmd.abm_set_pipe.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_pipe_data);
   255	
   256		dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
   257		dc_dmub_srv_cmd_execute(dc->dmub_srv);
   258		dc_dmub_srv_wait_idle(dc->dmub_srv);
   259	
   260		return true;
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
