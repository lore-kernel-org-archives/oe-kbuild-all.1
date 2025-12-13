Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DB7139D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765629127; cv=none; b=hRRM+MhgBLBnrB90V1SNQewNhtDAp7LkCfme3lj6Ywm5CmYuTLfi5Zp0w7G6a6Nskd75qv/WwjczfQnK7OKRhMbXPnnwF7gq91M8MlPmMjvX6GYAZWePYmHc59ts7nzdqCtFkuFW/uiIAncIKnLwMrXoPexHMb0YQj4gDmCJ7X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765629127; c=relaxed/simple;
	bh=HyUgSndSl6ExY9bWVCqjUKKoE+G3R9C160tsRtH8z8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rqk08uL8RNO+WM1ymMSF4YVdFR2SXCHm5I64lKLe3FqI6zXEBq74DGCX19LuPc64gvdidaRUirPZFMENn/mWH37jwz9XcVrNEauhpIf93pzNtLCUz+46jCUuWTZjDlfkWYbenfTH1m8DbEy698IQ6f4n2HNLBhLbqb5xEfzMQwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KnYGohVg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KnYGohVg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765629125; x=1797165125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HyUgSndSl6ExY9bWVCqjUKKoE+G3R9C160tsRtH8z8k=;
  b=KnYGohVghAuwSeiTZT9HazYq3xF1mi/RSw6Z1dEejbet57JOpPZc2oul
   jHPOvmBNFuRlbLLUhJbBmIDFEIbEBmzIrygGA6LWtuLa6fUcZ54deFwyp
   eb5o0jA+nWg/ohHBwswEB0RaBl01UgJWK2GawSdtVBQCnAIaKl7SIWxBq
   zq6kmM+kSGzjjdmilwVlLdcaN1TbLkVAUdxZv5693Nyi4LdzB4FK6akQR
   z7OL3WPIE3fsYPddYBm4+xI0E6O/5jlOi4Wwva6uT26pZLx/AmHMycFnB
   tC3XEDGso/8fyJaclVqHXWTM80Fna4b5cQOeXSW4uTsGvpiY6KRA+o4C5
   A==;
X-CSE-ConnectionGUID: +dIvp4m3SYO4A9+fn5cwww==
X-CSE-MsgGUID: M6Gb2PEATR+xMc87nHE53g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66781661"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="66781661"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 04:32:05 -0800
X-CSE-ConnectionGUID: feiFsWyfTeWUE7aMfg3zPw==
X-CSE-MsgGUID: uU4bLJDKSEmKG7YB0cfhmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196923333"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 13 Dec 2025 04:31:30 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUOmW-0000000024C-1Tlr;
	Sat, 13 Dec 2025 12:31:28 +0000
Date: Sat, 13 Dec 2025 13:31:06 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/40] htmldocs:
 ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or
 member 'minimum_z8_residency_time' not described in 'dc_debug_options'
Message-ID: <202512131333.WSe8Z8V2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: 25f603624246062fd473812e6ebda98e3c387017 [0/40] drm/amd/display: Add minimum Z8 residency debug option
reproduce: (https://download.01.org/0day-ci/archive/20251213/202512131333.WSe8Z8V2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131333.WSe8Z8V2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'skip_detection_link_training' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'edid_read_retry_times' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'force_odm_combine' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'seamless_boot_odm_combine' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'force_odm_combine_4to1' not described in 'dc_debug_options'
>> ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'minimum_z8_residency_time' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'disable_z9_mpc' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'force_fclk_khz' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'enable_tri_buf' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'dmub_offload_enabled' not described in 'dc_debug_options'
   ./drivers/gpu/drm/amd/display/dc/dc.h:860: warning: Function parameter or member 'dmcub_emulation' not described in 'dc_debug_options'


vim +860 ./drivers/gpu/drm/amd/display/dc/dc.h

91a9ead069b8cc Mark Morra                  2021-06-28  705  
ea76895ffab1a6 Rodrigo Siqueira            2022-04-01  706  /**
ea76895ffab1a6 Rodrigo Siqueira            2022-04-01  707   * struct dc_debug_options - DC debug struct
ea76895ffab1a6 Rodrigo Siqueira            2022-04-01  708   *
ea76895ffab1a6 Rodrigo Siqueira            2022-04-01  709   * This struct provides a simple mechanism for developers to change some
ea76895ffab1a6 Rodrigo Siqueira            2022-04-01  710   * configurations, enable/disable features, and activate extra debug options.
ea76895ffab1a6 Rodrigo Siqueira            2022-04-01  711   * This can be very handy to narrow down whether some specific feature is
ea76895ffab1a6 Rodrigo Siqueira            2022-04-01  712   * causing an issue or not.
ea76895ffab1a6 Rodrigo Siqueira            2022-04-01  713   */
cfd84fd36531b2 Jun Lei                     2018-07-12  714  struct dc_debug_options {
91a9ead069b8cc Mark Morra                  2021-06-28  715  	bool native422_support;
91a9ead069b8cc Mark Morra                  2021-06-28  716  	bool disable_dsc;
bf53769d9fc95c Gloria Li                   2018-07-03  717  	enum visual_confirm visual_confirm;
21f45a2363bb0c hvanzyll                    2021-11-05  718  	int visual_confirm_rect_height;
21f45a2363bb0c hvanzyll                    2021-11-05  719  
2b13d7d380d508 Tony Cheng                  2017-07-14  720  	bool sanity_checks;
4562236b3bc0a2 Harry Wentland              2017-09-12  721  	bool max_disp_clk;
4562236b3bc0a2 Harry Wentland              2017-09-12  722  	bool surface_trace;
9474980ac470a2 Yongqiang Sun               2016-12-08  723  	bool timing_trace;
c9742685c24acd Dmytro Laktyushkin          2017-06-07  724  	bool clock_trace;
4562236b3bc0a2 Harry Wentland              2017-09-12  725  	bool validation_trace;
1249acefefd430 Bhawanpreet Lakha           2018-03-08  726  	bool bandwidth_calcs_trace;
3f460907be1b53 Xingyue Tao                 2018-04-19  727  	int max_downscale_src_width;
966869d07aae2d Tony Cheng                  2017-09-26  728  
966869d07aae2d Tony Cheng                  2017-09-26  729  	/* stutter efficiency related */
4562236b3bc0a2 Harry Wentland              2017-09-12  730  	bool disable_stutter;
966869d07aae2d Tony Cheng                  2017-09-26  731  	bool use_max_lb;
a32a7708ae8b01 Tony Cheng                  2017-09-25  732  	enum dcc_option disable_dcc;
ea76895ffab1a6 Rodrigo Siqueira            2022-04-01  733  
ea76895ffab1a6 Rodrigo Siqueira            2022-04-01  734  	/**
ea76895ffab1a6 Rodrigo Siqueira            2022-04-01  735  	 * @pipe_split_policy: Define which pipe split policy is used by the
ea76895ffab1a6 Rodrigo Siqueira            2022-04-01  736  	 * display core.
ea76895ffab1a6 Rodrigo Siqueira            2022-04-01  737  	 */
966869d07aae2d Tony Cheng                  2017-09-26  738  	enum pipe_split_policy pipe_split_policy;
966869d07aae2d Tony Cheng                  2017-09-26  739  	bool force_single_disp_pipe_split;
6512387a54357c Tony Cheng                  2017-09-27  740  	bool voltage_align_fclk;
ad0d8ebcb8dfc5 Harry Wentland              2020-06-24  741  	bool disable_min_fclk;
966869d07aae2d Tony Cheng                  2017-09-26  742  
4562236b3bc0a2 Harry Wentland              2017-09-12  743  	bool disable_dfs_bypass;
ff5ef99248662e Alex Deucher                2017-06-15  744  	bool disable_dpp_power_gate;
ff5ef99248662e Alex Deucher                2017-06-15  745  	bool disable_hubp_power_gate;
97bda0322b8a91 Harry Wentland              2019-02-25  746  	bool disable_dsc_power_gate;
b5cf0647c2a837 Nikola Cornij               2019-08-16  747  	int dsc_min_slice_height_override;
2af0f378c4808e Nikola Cornij               2019-12-03  748  	int dsc_bpp_increment_div;
ff5ef99248662e Alex Deucher                2017-06-15  749  	bool disable_pplib_wm_range;
441ad741739e90 Eric Yang                   2017-09-27  750  	enum wm_report_mode pplib_wm_report_mode;
4f4ee68686c74b Hersen Wu                   2017-09-20  751  	unsigned int min_disp_clk_khz;
e9bcc1e03048b3 Dmytro Laktyushkin          2019-07-02  752  	unsigned int min_dpp_clk_khz;
ba9012fcb2741f David Galiffi               2021-09-13  753  	unsigned int min_dram_clk_khz;
139cb65c5202ba Dmytro Laktyushkin          2017-06-21  754  	int sr_exit_time_dpm0_ns;
139cb65c5202ba Dmytro Laktyushkin          2017-06-21  755  	int sr_enter_plus_exit_time_dpm0_ns;
ff5ef99248662e Alex Deucher                2017-06-15  756  	int sr_exit_time_ns;
ff5ef99248662e Alex Deucher                2017-06-15  757  	int sr_enter_plus_exit_time_ns;
ff5ef99248662e Alex Deucher                2017-06-15  758  	int urgent_latency_ns;
1a7d296d162ede Thomas Lim                  2019-04-29  759  	uint32_t underflow_assert_delay_us;
ff5ef99248662e Alex Deucher                2017-06-15  760  	int percent_of_ideal_drambw;
ff5ef99248662e Alex Deucher                2017-06-15  761  	int dram_clock_change_latency_ns;
f3efec54ed6ac0 Tony Cheng                  2018-06-08  762  	bool optimized_watermark;
e73b59b7e0cdec Dmytro Laktyushkin          2017-05-19  763  	int always_scale;
2c8ad2d5a20c8b Alex Deucher                2017-06-15  764  	bool disable_pplib_clock_request;
4562236b3bc0a2 Harry Wentland              2017-09-12  765  	bool disable_clock_gate;
cc4935087e2057 Braden Bakker               2020-02-11  766  	bool disable_mem_low_power;
118a331516581c Nicholas Kazlauskas         2021-05-19  767  	bool pstate_enabled;
aa66df58b2f272 Yongqiang Sun               2016-12-15  768  	bool disable_dmcu;
70814f6f092a91 Anthony Koo                 2017-01-27  769  	bool force_abm_enable;
73fb63e74fb26c Charlene Liu                2017-10-02  770  	bool disable_stereo_support;
f6cb588a42a781 Charlene Liu                2017-10-02  771  	bool vsr_support;
215a6f05bcc18f Dmytro Laktyushkin          2017-10-06  772  	bool performance_trace;
7c357e61e21bf9 Charlene Liu                2018-01-09  773  	bool az_endpoint_mute_only;
a771c1f2892139 Krunoslav Kovac             2018-01-10  774  	bool always_use_regamma;
3ba43a59927fbd Charlene Liu                2018-04-18  775  	bool recovery_enabled;
91f191c74e8da2 Tony Cheng                  2018-06-14  776  	bool avoid_vbios_exec_table;
e0d85b20c74fc0 Charlene Liu                2018-06-25  777  	bool scl_reset_length10;
8fc0a0d4a0a49e Charlene Liu                2018-06-26  778  	bool hdmi20_disable;
aafded888514ba Tony Cheng                  2018-07-11  779  	bool skip_detection_link_training;
f1e1f272151b65 Raymond Yang                2020-11-07  780  	uint32_t edid_read_retry_times;
49782c638f6a33 Dmytro Laktyushkin          2018-12-05  781  	unsigned int force_odm_combine; //bit vector based on otg inst
663d2daeaee6fa Duncan Ma                   2022-03-31  782  	unsigned int seamless_boot_odm_combine;
5dba4991fd338d Bhawanpreet Lakha           2020-05-21  783  	unsigned int force_odm_combine_4to1; //bit vector based on otg inst
25f60362424606 Nicholas Kazlauskas         2023-02-17  784  	int minimum_z8_residency_time;
2083640f0d5bf9 Nicholas Kazlauskas         2021-05-19  785  	bool disable_z9_mpc;
51ba137ef22625 Hugo Hu                     2018-11-21  786  	unsigned int force_fclk_khz;
091018a51c16ec Aric Cyr                    2020-08-21  787  	bool enable_tri_buf;
3a1627b07385a6 Nicholas Kazlauskas         2019-10-25  788  	bool dmub_offload_enabled;
3a1627b07385a6 Nicholas Kazlauskas         2019-10-25  789  	bool dmcub_emulation;
4d55b0dd1cdd85 Bhawanpreet Lakha           2020-05-21  790  	bool disable_idle_power_optimizations;
e74c8a461139b4 Joshua Aberback             2020-08-31  791  	unsigned int mall_size_override;
ea7154d8d9fb26 Bhawanpreet Lakha           2021-01-19  792  	unsigned int mall_additional_timer_percent;
ea7154d8d9fb26 Bhawanpreet Lakha           2021-01-19  793  	bool mall_error_as_fatal;
3a1627b07385a6 Nicholas Kazlauskas         2019-10-25  794  	bool dmub_command_table; /* for testing only */
f55be0be5b7296 Joshua Aberback             2019-04-01  795  	struct dc_bw_validation_profile bw_val_profile;
97bda0322b8a91 Harry Wentland              2019-02-25  796  	bool disable_fec;
aa91916770d07c Bhawanpreet Lakha           2019-07-26  797  	bool disable_48mhz_pwrdwn;
2131f65581ba46 Jun Lei                     2019-05-17  798  	/* This forces a hard min on the DCFCLK requested to SMU/PP
2131f65581ba46 Jun Lei                     2019-05-17  799  	 * watermarks are not affected.
2131f65581ba46 Jun Lei                     2019-05-17  800  	 */
2131f65581ba46 Jun Lei                     2019-05-17  801  	unsigned int force_min_dcfclk_mhz;
5dba4991fd338d Bhawanpreet Lakha           2020-05-21  802  	int dwb_fi_phase;
70f1476a7eedf8 Joshua Aberback             2019-05-17  803  	bool disable_timing_sync;
290129c256179d Qingqing Zhuo               2019-06-27  804  	bool cm_in_bypass;
39bca3599aab8e Charlene Liu                2019-07-02  805  	int force_clock_mode;/*every mode change.*/
1cad8ff7ecc6b7 Eric Yang                   2019-10-11  806  
5622b2d68d0a6e David Galiffi               2019-10-01  807  	bool disable_dram_clock_change_vactive_support;
b9fe5151052f9d Jaehyun Chung               2019-10-31  808  	bool validate_dml_output;
8c0192533c3966 Yongqiang Sun               2019-12-16  809  	bool enable_dmcub_surface_flip;
ee76592482d34c George Shen                 2019-12-17  810  	bool usbc_combo_phy_reset_wa;
f00889dc7157fa Alvin Lee                   2020-04-21  811  	bool enable_dram_clock_change_one_display_vactive;
f01ee019586220 Fangzhi Zuo                 2021-08-03  812  	/* TODO - remove once tested */
f01ee019586220 Fangzhi Zuo                 2021-08-03  813  	bool legacy_dp2_lt;
05692bb02abd63 Wenjing Liu                 2021-09-24  814  	bool set_mst_en_for_sst;
3d38a5839ea8af Wenjing Liu                 2021-11-26  815  	bool disable_uhbr;
800de20b1dbdfd Wenjing Liu                 2021-11-26  816  	bool force_dp2_lt_fallback_method;
4a3ad932b2c538 Shen, George                2022-01-23  817  	bool ignore_cable_id;
cae78e03314596 Jacky Liao                  2020-10-15  818  	union mem_low_power_enable_options enable_mem_low_power;
8017ecb11ebbcd Jake Wang                   2021-10-01  819  	union root_clock_optimization_options root_clock_optimization;
0a068b683c87a8 Jake Wang                   2021-10-21  820  	bool hpo_optimization;
77a2b7265f20ee Vladimir Stempen            2020-12-29  821  	bool force_vblank_alignment;
4f8e37dbaf584d Meenakshikumar Somasundaram 2021-01-22  822  
4f8e37dbaf584d Meenakshikumar Somasundaram 2021-01-22  823  	/* Enable dmub aux for legacy ddc */
4f8e37dbaf584d Meenakshikumar Somasundaram 2021-01-22  824  	bool enable_dmub_aux_for_legacy_ddc;
00fa7f031dd4b8 Rodrigo Siqueira            2022-06-16  825  	bool disable_fams;
8cf9575d70793f Mike Hsieh                  2021-01-25  826  	/* FEC/PSR1 sequence enable delay in 100us */
8cf9575d70793f Mike Hsieh                  2021-01-25  827  	uint8_t fec_enable_delay_in100us;
3550d6225b1ff8 Leo (Hanghong  Ma           2021-08-15  828) 	bool enable_driver_sequence_debug;
f3edefce70887d Michael Strauss             2021-11-18  829  	enum det_size crb_alloc_policy;
f3edefce70887d Michael Strauss             2021-11-18  830  	int crb_alloc_policy_min_disp_count;
2083640f0d5bf9 Nicholas Kazlauskas         2021-05-19  831  	bool disable_z10;
b5d9a483685c37 Eric Yang                   2022-01-23  832  	bool enable_z9_disable_interface;
18225134088453 Nicholas Kazlauskas         2022-11-25  833  	bool psr_skip_crtc_disable;
b0ce6272183309 Meenakshikumar Somasundaram 2021-06-23  834  	union dpia_debug_options dpia_debug;
0bbd1c7de319ca George Shen                 2022-01-31  835  	bool disable_fixed_vs_aux_timeout_wa;
d3dfceb58de5f8 Aurabindo Pillai            2022-02-23  836  	bool force_disable_subvp;
d3dfceb58de5f8 Aurabindo Pillai            2022-02-23  837  	bool force_subvp_mclk_switch;
fe77d95f7a7f2f Alvin Lee                   2022-08-24  838  	bool allow_sw_cursor_fallback;
5c1a431aaf52bb Lee, Alvin                  2022-08-25  839  	unsigned int force_subvp_num_ways;
525a65c77db51c Alvin Lee                   2022-09-14  840  	unsigned int force_mall_ss_num_ways;
6eef3746058426 Alvin Lee                   2022-09-01  841  	bool alloc_extra_way_for_cursor;
d3dfceb58de5f8 Aurabindo Pillai            2022-02-23  842  	bool force_usr_allow;
405bb9eea36a02 Alvin Lee                   2022-04-29  843  	/* uses value at boot and disables switch */
405bb9eea36a02 Alvin Lee                   2022-04-29  844  	bool disable_dtb_ref_clk_switch;
8bc3812d0b33c2 Duncan Ma                   2022-06-20  845  	uint32_t fixed_vs_aux_delay_config_wa;
e5fc78252ccd8d Gabe Teeger                 2022-03-14  846  	bool extended_blank_optimization;
bb90786fa8d9ab Jimmy Kizito                2022-03-22  847  	union aux_wake_wa_options aux_wake_wa;
8bc3812d0b33c2 Duncan Ma                   2022-06-20  848  	uint32_t mst_start_top_delay;
b51759661e2987 Shah Dharati                2022-02-16  849  	uint8_t psr_power_use_phy_fsm;
4a0caac06a4c58 Michael Strauss             2022-04-05  850  	enum dml_hostvm_override_opts dml_hostvm_override;
86678d46272021 David Galiffi               2022-07-20  851  	bool dml_disallow_alternate_prefetch_modes;
d445dd7b39c56a Lei, Jun                    2022-05-26  852  	bool use_legacy_soc_bb_mechanism;
a141d2083b4625 Alvin Lee                   2022-06-03  853  	bool exit_idle_opt_for_cursor_updates;
88ef4c5bb36bf6 Samson Tam                  2022-05-26  854  	bool enable_single_display_2to1_odm_policy;
1e939ea1bf4917 Dillon Varone               2022-09-09  855  	bool enable_double_buffered_dsc_pg_support;
88ef4c5bb36bf6 Samson Tam                  2022-05-26  856  	bool enable_dp_dig_pixel_rate_div_policy;
280f1884892f38 Michael Strauss             2022-08-17  857  	enum lttpr_mode lttpr_mode_override;
d5e0fb0d9dea54 George Shen                 2022-10-14  858  	unsigned int dsc_delay_factor_wa_x1000;
ce902d987a8caa Dillon Varone               2022-10-27  859  	unsigned int min_prefetch_in_strobe_ns;
cfd84fd36531b2 Jun Lei                     2018-07-12 @860  };
3ba43a59927fbd Charlene Liu                2018-04-18  861  

:::::: The code at line 860 was first introduced by commit
:::::: cfd84fd36531b2f1de01b3530b6953ed34ed2c95 drm/amd/display: separate dc_debug into dc_debug_options and dc_debug data

:::::: TO: Jun Lei <Jun.Lei@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
