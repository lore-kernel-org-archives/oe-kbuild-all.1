Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048426;
	b=2rRaT60UC1NTdeFT8eer24qKlUkz2rrmVhH9ji08tl0+pU58XEbpb42trb91YkeHbvmb
	 qXq3RkKj7c0nulLTGfsbdkg3uXake/UMzPp7LqPFhZC8VDGO1oZpxR3U6VxYHx91iCljg
	 Cq5wST0ml83y3s1riPB6e3pfFv+glmViakWGs2uYwvLiXb5+qCrUpdqCrJbCZNNgyjJ5Q
	 LOH0/2sePeesrgW36VJPnvZvCKatwHIo5iAATpNcnAXblTtDy0FEnz70BO30CfuduRvlv
	 ohmUh2bl/uMw1QaX+jebZtQ4EIz/iVIP/53zJ50x4tXT9wpYvEoHtcRfW4x8v+AqVdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048426;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=RRwB0IhcROvaxzMWH7LOTpTca4+TMIcITq841/nI9jc=;
	b=HMHajKv77ZY+UxQyjvvlTi65ep4WZx+zUsRxgsbf7QjX5nB0GIfgFm7yzS12Rzs39CUy
	 10jvNKm7u0lBOJyG3zGsPCmyXlcDN2EsyNsX3Ktf+kIWMSDKUOG0Io6akREEeLHfEybIt
	 bUBpxdZ2pz8Yj24CTBwFRveIeYSgC1omoURnkV+UJLHlUnX4MlLB9e7BFCiZs9fI13RLN
	 LYBGUciUADG5ZAIdaOyZjyxcMvnYQ1ncuaMdFRmCDAjNUsHVe0dY9m+nWpfEM5TorhJj7
	 rSqYLi/aLjWUAOdWMVNlfVJUvOA4ZHwBuWj76L+SHFt+/EwA8a/IMrY7ZOul8NhAeyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XBQ0T6QQ;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262B5606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 00:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 262B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XBQ0T6QQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795048425; x=1826584425;
  h=date:from:to:cc:subject:message-id;
  bh=86mXcjYCuDxT24JOC5l9lxup8xUqvnSL87YAu083/7U=;
  b=XBQ0T6QQRFicgjKYXyzPE6cU9zaIM8PnlgFkJwPiEdtMZcJHf/nChAEN
   k3AfEDXeFeYLiGVv+aaaDWsJtROy8I4Aw72nw1Dtg/fCZVx3hYfTHOItP
   2yFGZrz0z9KxcXU16W8Ljx6LvprAI31Jpni5hAJDbNNsA3wd+xLmKUpXZ
   SpA+jf+YcPzlrroARJ3G9gUFS6dXSFS2CEoo5s7MOdt42sZy3GJ1uzqt7
   RsYUaJM5avG8wF6Tb6COMIVaOrHKX4QSXS+HOaO9P80SVxBjGQ5nKd45L
   4+enAQE22CPakroEkuHhIRpnqGgMuFzEpu5ksJhy/VzCo70AyaW1CilaA
   A==;
X-CSE-ConnectionGUID: quOyXPcTQCGnADoHPm/9hw==
X-CSE-MsgGUID: lVKqmsEwQZaEFCNGwy5jog==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3776798"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3776798"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 16:33:45 -0800
X-CSE-ConnectionGUID: xNs5Hko7RE6hMgOmDMhmaQ==
X-CSE-MsgGUID: WnRltuBETi+E6WkSdhUoTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10082491"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 18 Nov 2026 16:33:43 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTq5s-000000003Y1-454o;
	Thu, 19 Nov 2026 00:33:40 +0000
Date: Thu, 19 Nov 2026 01:33:20 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-lts 200/200]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:83:6: warning: no
 previous prototype for 'dmub_abm_init'
Message-ID: <20261119012802.ki0Jt3gc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-6.1-lts
head:   32c8e7bb8f634f61dd3c764ccd86ac57794bb9f5
commit: c4c35f1deb8c1130b702ed48bd1c6724d474c296 [200/200] drm/amd/display: Refactor ABM feature
config: i386-randconfig-2001-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119012802.ki0Jt3gc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119012802.ki0Jt3gc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119012802.ki0Jt3gc-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:31:
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


vim +/dmub_abm_init +83 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c

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
 > 124	unsigned int dmub_abm_get_current_backlight(struct abm *abm)
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
 > 135	unsigned int dmub_abm_get_target_backlight(struct abm *abm)
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
 > 146	bool dmub_abm_set_level(struct abm *abm, uint32_t level, uint8_t panel_mask)
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
 > 167	void dmub_abm_set_ambient_level(struct abm *abm, unsigned int ambient_lux, uint8_t panel_mask)
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
 > 189	void dmub_abm_init_config(struct abm *abm,
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
 > 221	bool dmub_abm_set_pause(struct abm *abm, bool pause, unsigned int panel_inst, unsigned int stream_inst)
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
 > 241	bool dmub_abm_set_pipe(struct abm *abm, uint32_t otg_inst, uint32_t option, uint32_t panel_inst)
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
   253		cmd.abm_set_pipe.abm_set_pipe_data.ramping_boundary = ramping_boundary;
   254		cmd.abm_set_pipe.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_pipe_data);
   255	
   256		dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
   257		dc_dmub_srv_cmd_execute(dc->dmub_srv);
   258		dc_dmub_srv_wait_idle(dc->dmub_srv);
   259	
   260		return true;
   261	}
   262	
 > 263	bool dmub_abm_set_backlight_level(struct abm *abm,
   264			unsigned int backlight_pwm_u16_16,
   265			unsigned int frame_ramp,
   266			unsigned int panel_inst)
   267	{
   268		union dmub_rb_cmd cmd;
   269		struct dc_context *dc = abm->ctx;
   270	
   271		memset(&cmd, 0, sizeof(cmd));
   272		cmd.abm_set_backlight.header.type = DMUB_CMD__ABM;
   273		cmd.abm_set_backlight.header.sub_type = DMUB_CMD__ABM_SET_BACKLIGHT;
   274		cmd.abm_set_backlight.abm_set_backlight_data.frame_ramp = frame_ramp;
   275		cmd.abm_set_backlight.abm_set_backlight_data.backlight_user_level = backlight_pwm_u16_16;
   276		cmd.abm_set_backlight.abm_set_backlight_data.version = DMUB_CMD_ABM_CONTROL_VERSION_1;
   277		cmd.abm_set_backlight.abm_set_backlight_data.panel_mask = (0x01 << panel_inst);
   278		cmd.abm_set_backlight.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_backlight_data);
   279	
   280		dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
   281		dc_dmub_srv_cmd_execute(dc->dmub_srv);
   282		dc_dmub_srv_wait_idle(dc->dmub_srv);
   283	
   284		return true;
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
