Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F18A4CE69E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 16:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219218; cv=none; b=njjNtIZyx21R60BkkKETSsGogAu6YE/tDS0Ks1oiUB1pyyboEJ7UbrQNzTqxTu62UDcwUSqaNHbkzuGSmuIZhLgYA9saxREXnFGKdIPn5Nj2wxmxJpvBb4/dnDN6TtT2Qql4hEVK2ZTsmJ0NP+jRVjlQ26biCOYgy6eTUlDrTBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219218; c=relaxed/simple;
	bh=Z/y4pVvKqmFpy6iXLUE0/6CA5TYhWmPPJyppm6Ly/Wc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ROnglpPRoxhwGN3WqKypQ9PGMmyP75KwZVyetBVJ98dChVaCoxiAEtlxNr5J86VqyVr3lKeugrElVgAXQyY/aWRqw8eZ+c9gEjbQU+eHSONzZY7eoyID9AGP/8CQ/wXnwS5CVigZqBJ0+AdYouXSprRuDNbB5RERUjRIPd0VEx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nc21J+bS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nc21J+bS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791219216; x=1822755216;
  h=date:from:to:cc:subject:message-id;
  bh=Z/y4pVvKqmFpy6iXLUE0/6CA5TYhWmPPJyppm6Ly/Wc=;
  b=Nc21J+bSwCQJoDziH1UEPeN6yt2Tv0kZNqmJmGzWxY5krZyVKdVxkK/l
   xEIUMFdUFab8X+2+flhFBxrJ25fykGk5/s1xUPbflmvDZ5DZrrrW/B7Wz
   EQj1OomXd98IrMcH94nafewJFPQ/3Kg8+ZimMzbs5JEDZjmlSd5eDn2OW
   OXYttOP2qJxGil4vvj3xDxUAuXdIwYglSYr4l0UFHxvuHjNpGKJA+0DPk
   DNu7MJlS9mvTd5V5PYXon5AlV7vAQdPm4KFeZuptvZHcihLvlpTVCjgk6
   +lKdy6U5QfD3JCczwVfBo1itkPnckvkSUlkpHx/yAXwQSV/NcsgNftL+v
   Q==;
X-CSE-ConnectionGUID: B9HfYjQLRVG+OXDSxV3eNg==
X-CSE-MsgGUID: lF/4E8jbQq6UEO4xpDVfYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="92005177"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="92005177"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 09:53:36 -0700
X-CSE-ConnectionGUID: abyIeCAtQgG18e56hO7NCA==
X-CSE-MsgGUID: +7FbuwY5T+CRxGxHQvcLEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="303131079"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Oct 2026 09:53:33 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDlwR-000000000E9-2feo;
	Mon, 05 Oct 2026 16:53:31 +0000
Date: Mon, 05 Oct 2026 18:53:27 +0200
From: kernel test robot <lkp@intel.com>
To: Ilya Bakoulin <Ilya.Bakoulin@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Chris Park <chris.park@amd.com>,
 Charlene Liu <charlene.liu@amd.com>
Subject: [linux-next:master 11716/14242]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hdmi_frl.c:491
 hdmi_frl_perform_link_training() warn: inconsistent indenting
Message-ID: <202610051807.3sDuXnvJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
commit: 7f8585e6b79e666738aad1bff37ed9926b51beb6 [11716/14242] drm/amd/display: Fix HDMI2.2 LT timeout duration
config: x86_64-randconfig-2200-20261003 (https://download.01.org/0day-ci/archive/20261005/202610051807.3sDuXnvJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051807.3sDuXnvJ-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hdmi_frl.c:491 hdmi_frl_perform_link_training() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hdmi_frl.c:546 hdmi_frl_perform_link_training() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hdmi_frl.c:827 hdmi_frl_verify_link_cap() error: we previously assumed 'link->local_sink' could be null (see line 821)
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hdmi_frl.c:981 hdmi_frl_set_preferred_link_settings() warn: variable dereferenced before check 'pipe->stream_res.hpo_frl_stream_enc' (see line 969)

vim +491 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hdmi_frl.c

   429	
   430	static enum link_result hdmi_frl_perform_link_training(struct ddc_service *ddc_service,
   431			struct dc_hdmi_frl_link_settings *link_settings)
   432	{
   433		enum link_result result = LINK_RESULT_UNKNOWN;
   434		uint8_t slave_address = HDMI_SCDC_ADDRESS;
   435		uint8_t offset = HDMI_SCDC_STATUS_FLAGS;
   436		uint32_t ln0_pattern = 0, pre_ln0_pattern = 0;
   437		uint32_t ln1_pattern = 0, pre_ln1_pattern = 0;
   438		uint32_t ln2_pattern = 0, pre_ln2_pattern = 0;
   439		uint32_t ln3_pattern = 0, pre_ln3_pattern = 0;
   440		uint8_t write_buffer[2] = {0};
   441		union hdmi_scdc_update_read_data scdc_update = {0};
   442		union hdmi_scdc_status_flags_data status_data = {0};
   443		union hdmi_scdc_source_test_req test_req = {0};
   444		union hdmi_scdc_LTP_req_data ltp_req = {0};
   445		unsigned long long poll_timeout_ns = 200 * 1000 * 1000;
   446		unsigned long long wait_time_ns = 2 * 1000 * 1000;
   447		unsigned long long num_polls = 0;
   448		struct hpo_frl_link_encoder *hpo_frl_link_enc = ddc_service->link->hpo_frl_link_enc;
   449		struct link_encoder *dio_link_enc = ddc_service->link->link_enc;
   450		uint8_t sink_version = 0;
   451		uint8_t FFE_Levels = hdmi_frl_get_max_ffe_level(ddc_service->link, link_settings);
   452		uint8_t current_FFE = 0;
   453		bool override_FFE = false;
   454		bool flt_no_timeout = false;
   455	
   456		DC_LOGGER_INIT(ddc_service->link->ctx->logger);
   457		FRL_INFO("FRL LINK TRAINING:  Starting FRL Link Training.\n");
   458	
   459		hdmi_frl_LTS_clear_Link_Setting(ddc_service);
   460	
   461		offset = HDMI_SCDC_SINK_VERSION;
   462		link_query_ddc_data(ddc_service, slave_address, &offset,
   463				sizeof(offset), &sink_version, sizeof(sink_version));
   464	
   465		FRL_INFO("FRL LINK TRAINING:  Read Sink Version = %d.\n", sink_version);
   466	
   467		if (sink_version == 0) {
   468			FRL_INFO("FRL LINK TRAINING: SKIP - FRL not supported by sink.\n");
   469			return LINK_RESULT_FALLBACK;
   470		}
   471	
   472		if (sink_version == 1) {
   473			/*Source Version = 1*/
   474			write_buffer[0] = HDMI_SCDC_SOURCE_VERSION;
   475			write_buffer[1] = 1;
   476			link_query_ddc_data(ddc_service, slave_address,
   477					write_buffer, sizeof(write_buffer), NULL, 0);
   478			FRL_INFO("FRL LINK TRAINING:  Set Source Version = 1.\n");
   479		}
   480	
   481		FRL_INFO("FRL LINK TRAINING:  Poll for FLT_READY.\n");
   482		offset = HDMI_SCDC_STATUS_FLAGS;
   483	
   484		/*LTS:2: Check FLT Ready, poll for 200ms */
   485		unsigned long long flt_poll_start = dm_get_timestamp(ddc_service->ctx);
   486		unsigned long long flt_poll_curr = flt_poll_start;
   487		unsigned long long elapsed = 0;
   488	
   489		do {
   490			flt_poll_curr = dm_get_timestamp(ddc_service->ctx);
 > 491						elapsed = dm_get_elapse_time_in_ns(ddc_service->ctx,
   492							flt_poll_curr, flt_poll_start);
   493			if (elapsed < (num_polls * wait_time_ns))
   494				continue;
   495			num_polls++;
   496	
   497			link_query_ddc_data(ddc_service, slave_address,
   498					&offset, sizeof(offset), &status_data.byte,
   499					sizeof(status_data.byte));
   500			FRL_INFO("FRL LINK TRAINING:  Read FLT_READY = %d.  num_polls = %llu\n",
   501					status_data.fields.FLT_READY, num_polls);
   502			if (status_data.fields.FLT_READY) {
   503				/* Spec recommends to clear update flag, but QD980 has problem */
   504				hdmi_frl_LTS_clear_Update_flag(ddc_service);
   505				dio_link_enc->funcs->prog_eq_setting(dio_link_enc, 0,
   506						test_req.fields.TXFFE_DEEMPHASIS,
   507						test_req.fields.TXFFE_PRESHOOT,
   508						test_req.fields.TXFFE_NOFFE,
   509						link_settings);
   510				break;
   511			}
   512		} while (elapsed < poll_timeout_ns);
   513	
   514		/*Test Condition - FLT_no_timeout avoid link training*/
   515		offset = HDMI_SCDC_SOURCE_TEST_REQ;
   516		link_query_ddc_data(ddc_service, slave_address, &offset,
   517				sizeof(offset), &test_req.byte, sizeof(test_req.byte));
   518		FRL_INFO("FRL TEST REQ:  FLT_no_timeout = %d \n", test_req.fields.FLT_NO_TIMEOUT);
   519		if (test_req.fields.FLT_NO_TIMEOUT)
   520			flt_no_timeout = true;
   521	
   522		if (status_data.fields.FLT_READY) {
   523			/*Specify FRL rate*/
   524			write_buffer[0] = HDMI_SCDC_CONFIG_1;
   525			/*FRL_RATE*/
   526			write_buffer[1] = (uint8_t)(link_settings->frl_link_rate | (FFE_Levels << 4));
   527			link_query_ddc_data(ddc_service, slave_address,
   528					write_buffer, sizeof(write_buffer), NULL, 0);
   529			FRL_INFO("FRL LINK TRAINING:  Write link rate = %d.  Max FFE_Levels = %d\n",
   530					link_settings->frl_link_rate, FFE_Levels);
   531	
   532			FRL_INFO("FRL LINK TRAINING:  Poll for FLT_UPDATE.\n");
   533			/*LTS:3: Start Link Training*/
   534			/*Start FLT Timer = 200 ms, or 300ms if link rate >= 16Gbps*/
   535			num_polls = 0;
   536			if (link_settings->frl_link_rate >= HDMI_FRL_LINK_RATE_16GBPS)
   537				poll_timeout_ns = 300 * 1000 * 1000;
   538			if (flt_no_timeout)
   539				poll_timeout_ns = 1000 * 1000 * 1000;
   540	
   541			flt_poll_start = dm_get_timestamp(ddc_service->ctx);
   542			uint8_t prev_flt_update = 0;
   543	
   544			do {
   545				flt_poll_curr = dm_get_timestamp(ddc_service->ctx);
   546						elapsed = dm_get_elapse_time_in_ns(ddc_service->ctx,
   547							flt_poll_curr, flt_poll_start);
   548				if (elapsed < (num_polls * wait_time_ns))
   549					continue;
   550				num_polls++;
   551	
   552				offset = HDMI_SCDC_UPDATE_0;
   553				/*Check FLT_update flag*/
   554				link_query_ddc_data(ddc_service, slave_address,
   555								&offset, sizeof(offset), &scdc_update.byte[0],
   556								sizeof(scdc_update.byte[0]));
   557	
   558				if (prev_flt_update != scdc_update.fields.FLT_UPDATE) {
   559					FRL_INFO("FRL LINK TRAINING: FLT_UPDATE=%d polls=%llu\n",
   560							scdc_update.fields.FLT_UPDATE, num_polls);
   561					prev_flt_update = scdc_update.fields.FLT_UPDATE;
   562				}
   563	
   564				/*Set TxFFE = TxFFE0*/
   565				/*Program FFE_Levels - scdc_config has this field at 0 */
   566				if (override_FFE) {
   567					if (flt_no_timeout)
   568						current_FFE = 0;
   569					if (current_FFE == 0)
   570						dio_link_enc->funcs->prog_eq_setting(dio_link_enc, current_FFE,
   571								test_req.fields.TXFFE_DEEMPHASIS,
   572								test_req.fields.TXFFE_PRESHOOT,
   573								test_req.fields.TXFFE_NOFFE,
   574								link_settings);
   575					else {
   576						if (scdc_update.fields.FLT_UPDATE)
   577							dio_link_enc->funcs->prog_eq_setting(dio_link_enc, current_FFE,
   578									test_req.fields.TXFFE_DEEMPHASIS,
   579									test_req.fields.TXFFE_PRESHOOT,
   580									test_req.fields.TXFFE_NOFFE,
   581									link_settings);
   582					}
   583					FRL_INFO("FRL LINK TRAINING:  TxFFE = %d.\n", current_FFE);
   584					override_FFE = false;
   585				}
   586				if (scdc_update.fields.FLT_UPDATE || flt_no_timeout) {
   587					offset = HDMI_SCDC_LTP_REQ;
   588					link_query_ddc_data(ddc_service, slave_address,
   589									&offset, sizeof(offset), ltp_req.byte,
   590									sizeof(ltp_req.byte));
   591	
   592					pre_ln0_pattern = ln0_pattern;
   593					pre_ln1_pattern = ln1_pattern;
   594					pre_ln2_pattern = ln2_pattern;
   595					pre_ln3_pattern = ln3_pattern;
   596	
   597					ln0_pattern = ltp_req.fields.LN0_LTP_REQ;
   598					ln1_pattern = ltp_req.fields.LN1_LTP_REQ;
   599					ln2_pattern = ltp_req.fields.LN2_LTP_REQ;
   600					ln3_pattern = ltp_req.fields.LN3_LTP_REQ;
   601	
   602					FRL_INFO("FRL LINK TRAINING:  Read LN0_LTP_REQ = %d.  LN1_LTP_REQ = %d\n",
   603							ltp_req.fields.LN0_LTP_REQ,
   604							ltp_req.fields.LN1_LTP_REQ);
   605					FRL_INFO("FRL LINK TRAINING:  Read LN2_LTP_REQ = %d.  LN3_LTP_REQ = %d\n",
   606							ltp_req.fields.LN2_LTP_REQ,
   607							ltp_req.fields.LN3_LTP_REQ);
   608	
   609					/*Clear FLT_update flag*/
   610					FRL_INFO("FRL LINK TRAINING:  Clear FLT_UPDATE flag.\n");
   611					write_buffer[0] = HDMI_SCDC_UPDATE_0;
   612					/*FLT_update - bit 5*/
   613					write_buffer[1] = (scdc_update.fields.FLT_UPDATE << 5);
   614					link_query_ddc_data(ddc_service, slave_address,
   615							write_buffer, sizeof(write_buffer), NULL, 0);
   616	
   617					if (ln0_pattern == 0x03 || ln1_pattern == 0x03 ||
   618							ln2_pattern == 0x03 || ln3_pattern == 0x03)
   619						if (!flt_no_timeout)
   620							continue;
   621	
   622					if (link_settings->frl_num_lanes == 3) {
   623						ln3_pattern = 1;
   624						if (!ln0_pattern && !ln1_pattern && !ln2_pattern) {
   625							/*Link Training is done*/
   626							FRL_INFO("FRL LINK TRAINING:  PASSED\n");
   627							return LINK_RESULT_SUCCESS;
   628						}
   629						if (ln0_pattern == 0x0F || ln1_pattern == 0x0F || ln2_pattern == 0x0F) {
   630							/*sink requesting to lower link rate*/
   631							FRL_INFO("FRL LINK TRAINING:  Sink requesting lower link rate.\n");
   632							return LINK_RESULT_LOWER_LINKRATE;
   633						}
   634						if (ln0_pattern == 0x0E || ln1_pattern == 0x0E || ln2_pattern == 0x0E) {
   635							/*sink requesting to next FFE*/
   636							FRL_INFO("FRL LINK TRAINING:  Sink requesting next FFE.\n");
   637							if (ddc_service->link->dc->debug.limit_ffe == 0) {
   638								return LINK_RESULT_LOWER_LINKRATE;
   639							}
   640							current_FFE++;
   641							override_FFE = true;
   642							if (current_FFE > FFE_Levels)
   643								current_FFE = 0;
   644							if (flt_no_timeout)
   645								current_FFE = 0;
   646						}
   647					} else {
   648						if (!ln0_pattern && !ln1_pattern && !ln2_pattern && !ln3_pattern) {
   649							/*Link Training is done*/
   650							FRL_INFO("FRL LINK TRAINING:  PASSED\n");
   651							return LINK_RESULT_SUCCESS;
   652						}
   653						if (ln0_pattern == 0x0F || ln1_pattern == 0x0F ||
   654							ln2_pattern == 0x0F || ln3_pattern == 0x0F) {
   655							/*sink requesting to lower link rate*/
   656							FRL_INFO("FRL LINK TRAINING:  Sink requesting lower link rate.\n");
   657							return LINK_RESULT_LOWER_LINKRATE;
   658						}
   659						if (ln0_pattern == 0x0E || ln1_pattern == 0x0E ||
   660							ln2_pattern == 0x0E  || ln3_pattern == 0x0E) {
   661							/*sink requesting to next FFE*/
   662							FRL_INFO("FRL LINK TRAINING:  Sink requesting next FFE.\n");
   663							if (ddc_service->link->dc->debug.limit_ffe == 0) {
   664								return LINK_RESULT_LOWER_LINKRATE;
   665							}
   666							current_FFE++;
   667							override_FFE = true;
   668							if (current_FFE > FFE_Levels)
   669								current_FFE = 0;
   670							if (flt_no_timeout)
   671								current_FFE = 0;
   672						}
   673					}
   674	
   675					if (override_FFE) {
   676						ln0_pattern = pre_ln0_pattern;
   677						ln1_pattern = pre_ln1_pattern;
   678						ln2_pattern = pre_ln2_pattern;
   679						ln3_pattern = pre_ln3_pattern;
   680					}
   681	
   682					FRL_INFO("FRL LINK TRAINING:  Setting Training Pattern [ln0,ln1,ln2,ln3] = [%d,%d,%d,%d].\n",
   683							ln0_pattern, ln1_pattern, ln2_pattern, ln3_pattern);
   684	
   685					hpo_frl_link_enc->funcs->set_hdmi_training_pattern(
   686						hpo_frl_link_enc,
   687						ln0_pattern - 1,
   688						ln1_pattern - 1,
   689						ln2_pattern - 1,
   690						ln3_pattern - 1);
   691					/* Workaround for DEDCN3AG-111
   692					 * HDMI-FRL Incorrect Serialization Order for LTP4
   693					 */
   694				}
   695			} while (elapsed < poll_timeout_ns);
   696			FRL_INFO("FRL LINK TRAINING:  FAILED - Timeout waiting for FLT_UPDATE to be set by sink.\n");
   697			write_buffer[0] = HDMI_SCDC_CONFIG_1;
   698			/*FRL_RATE*/
   699			write_buffer[1] = HDMI_FRL_LINK_RATE_DISABLE | (0 << 4);
   700			link_query_ddc_data(ddc_service, slave_address,
   701					write_buffer, sizeof(write_buffer), NULL, 0);
   702			hdmi_frl_LTS_clear_Link_Setting(ddc_service);
   703			result = LINK_RESULT_TIMEOUT;
   704		} else {
   705			FRL_INFO("FRL LINK TRAINING:  FAILED - FLT_READY not set by sink.\n");
   706			result = LINK_RESULT_TIMEOUT;
   707		}
   708	
   709		return result;
   710	}
   711	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
