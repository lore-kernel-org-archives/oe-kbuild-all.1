Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA6E4A8A05
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484163; cv=none; b=KWcYqiEpfBGYE83CpQh4rZZqhmlXC/v8dvrxGoF+zb4MpVuy/Sgukt8UaxKaC6EA3uaKUQC1vLRh4xrxj3taEyRBAf1xX/UIvraBqIPd5Jhg/qxXEgA+ANXv72yQlZnpOqeo6VyLronoBnAFkGtV4uBVZYpjxdOw4FwzWsMcfcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484163; c=relaxed/simple;
	bh=OAIWvnwmICuBxHXGlAIYQnLGb3R6ioDPKRlYrZ3h8Fo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cxpN7Remj/1HfrUgHwqUq7m4JHkXL3QKaRgxkpOvZ8xzUQUF2w9TEPMgP9izBDhMYvm6lBwrptE8UdJFbtZhiw9bnD//X/lY4nsfIBmdNKLR6PCvDt5N4khc5k00zUeU5isUYwj6oOAGgo/iBvg5plHyrRmD12QuRZ6lpjC2D0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFPtR179; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFPtR179"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789484157; x=1821020157;
  h=date:from:to:cc:subject:message-id;
  bh=OAIWvnwmICuBxHXGlAIYQnLGb3R6ioDPKRlYrZ3h8Fo=;
  b=dFPtR179+jZWcoYMNkHL9Vl+3DNt3tQJAVlns8/QslBot/H1An58DwTG
   a1lH4ejg0wIwSdJZsAmfkEtuR3vCldrDSSmAjPBr9QdwGixV1R55CYzAZ
   sAqHmmDYh/VXZK4IcBuzEi1NqjZxOn5PYVHdvD47XNXNM6ukrRFjipudc
   dgOQWWjJSpjNXOLKJkFVMzLM09TvuFytlcPdTjRalZGz/qVvwE5VlV2aw
   eEyzTixu5/N+QCkNd/9Zxg31HOJLzoAhL3B3eowOz+v7sILbjDoeQbiSM
   ZRvuWfC6w3xxxbtqNkifeVrbag81njqVAwY0zhwCGZIIh7y0c/e8pxPaZ
   g==;
X-CSE-ConnectionGUID: HauGeZanRACxMGADAJHt3w==
X-CSE-MsgGUID: hIYRiCRuRTOFlzGtlPTIiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101002082"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101002082"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 07:55:45 -0700
X-CSE-ConnectionGUID: fwCPZFJ7Try2uKlYo0vFhQ==
X-CSE-MsgGUID: 3fHAvh4ERzuqX7qeDa8O/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270413373"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Sep 2026 07:55:43 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6UZR-000000000db-02E0;
	Tue, 15 Sep 2026 14:55:41 +0000
Date: Tue, 15 Sep 2026 16:54:53 +0200
From: kernel test robot <lkp@intel.com>
To: Lohita Mudimela <lohita.mudimela@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Robin Chen <robin.chen@amd.com>, Ivan Lipski <ivan.lipski@amd.com>
Subject: 
 drivers/gpu/drm/amd/display/modules/power/power_replay.c:693:80-85: WARNING:
 conversion to bool not needed here
Message-ID: <202609151622.vbDLWOBV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   587858367581b9c55c3690f4e63382ad622719d4
commit: d7e41c6f513ef59e890d9fb34a2631fdf6d87789 drm/amd/display: Refactor Replay functionality into dedicated power_replay module
date:   4 months ago
config: x86_64-randconfig-103-20260911 (https://download.01.org/0day-ci/archive/20260915/202609151622.vbDLWOBV-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d7e41c6f513e ("drm/amd/display: Refactor Replay functionality into dedicated power_replay module")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151622.vbDLWOBV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/modules/power/power_replay.c:693:80-85: WARNING: conversion to bool not needed here

vim +693 drivers/gpu/drm/amd/display/modules/power/power_replay.c

   622	
   623	bool mod_power_set_replay_event(struct mod_power *mod_power,
   624		struct dc_stream_state *stream, bool set_event,
   625		enum replay_event event, bool wait_for_disable)
   626	{
   627		struct core_power *core_power = NULL;
   628		struct dc_link *link = NULL;
   629		unsigned int stream_index = 0;
   630		unsigned int active_replay_events = 0;
   631		bool replay_active_request = false;
   632		bool force_static = false;
   633		uint32_t coasting_vtotal = 0;
   634		bool current_timing_sync_status = false;
   635		bool is_full_screen_video = false;
   636		bool is_ultra_sleep_mode = false;
   637		unsigned int sink_duration_us = 0;
   638		bool low_rr_active = false;
   639		uint16_t frame_skip_number = 0;
   640		bool is_video_playback = false;
   641	
   642		if (!stream)
   643			return false;
   644	
   645		if (mod_power == NULL)
   646			return false;
   647	
   648		core_power = MOD_POWER_TO_CORE(mod_power);
   649	
   650		if (core_power->num_entities == 0)
   651			return false;
   652	
   653		stream_index = map_index_from_stream(core_power, stream);
   654	
   655		if (set_event)
   656			core_power->map[stream_index].replay_events |= event;
   657		else
   658			core_power->map[stream_index].replay_events &= ~event;
   659	
   660		link = dc_stream_get_link(stream);
   661		if (!link || !link->replay_settings.replay_feature_enabled)
   662			return false;
   663	
   664		if ((core_power->map[stream_index].replay_events & replay_event_disable_replay_while_switching_mux) != 0)
   665			return false;
   666	
   667		if ((core_power->map[stream_index].replay_events & replay_event_os_override_hold) != 0)
   668			return false;
   669	
   670		active_replay_events = core_power->map[stream_index].replay_events;
   671	
   672		current_timing_sync_status =
   673			link->replay_settings.config.replay_timing_sync_supported;
   674	
   675		replay_active_request = mod_power_update_replay_active_status(active_replay_events,
   676			link, &coasting_vtotal, &is_full_screen_video, &is_ultra_sleep_mode, &frame_skip_number, &is_video_playback);
   677	
   678		if (is_full_screen_video)
   679			mod_power_replay_set_pseudo_vtotal(mod_power, stream,
   680				link->replay_settings.low_rr_full_screen_video_pseudo_vtotal);
   681		else
   682			mod_power_replay_set_pseudo_vtotal(mod_power, stream, 0);
   683	
   684		//If timing_sync_status change, then re-enabled set timing_sync_supported value and re-enabled replay
   685		if (current_timing_sync_status != link->replay_settings.config.replay_timing_sync_supported)
   686			mod_power_replay_set_timing_sync_supported(mod_power, stream);
   687	
   688		if (link->replay_settings.config.low_rr_supported) {
   689			sink_duration_us =
   690				(unsigned int)(div_u64(((unsigned long long)(coasting_vtotal)
   691					* 10000) * stream->timing.h_total,
   692						stream->timing.pix_clk_100hz));
 > 693			low_rr_active = sink_duration_us < LOW_REFRESH_RATE_DURATION_US_UPPER_BOUND ? false : true;
   694			if (low_rr_active != link->replay_settings.config.low_rr_activated) {
   695				mod_power_set_low_rr_activate(mod_power, stream, low_rr_active);
   696				link->replay_settings.config.low_rr_activated = low_rr_active;
   697			}
   698		}
   699	
   700		// The function return fail when
   701		// 1. DMUB function is not support (for backward compatible).
   702		// 2. active_replay_events or coasting_vtotal is not updated in the same time
   703		if (!mod_power_replay_set_power_opt_and_coasting_vtotal(mod_power,
   704			stream, active_replay_events, coasting_vtotal, is_ultra_sleep_mode, frame_skip_number)) {
   705			if (!mod_power_replay_set_power_opt(mod_power, stream, active_replay_events, is_ultra_sleep_mode))
   706				return false;
   707	
   708			if (!mod_power_replay_set_coasting_vtotal(mod_power, stream, coasting_vtotal, frame_skip_number))
   709				return false;
   710		}
   711	
   712		mod_power_set_live_capture_with_cvt_activate(mod_power, stream, is_video_playback);
   713	
   714		mod_power_update_error_status(mod_power, stream);
   715	
   716		// If Replay is going to be enable (No matter is disable -> enable or enable -> enable), we don't need to wait.
   717		// If Replay is going to be disable
   718		//     if disable -> disable
   719		//         -> Replay DMUB state should be state 0.
   720		//            So no matter wait_for_disable is true or not, it should makes no difference.
   721		//     if enable -> disable -> We should wait if wait_for_disable is true.
   722		if (replay_active_request)
   723			wait_for_disable = false;
   724	
   725		if (!mod_power_set_replay_active(stream, replay_active_request, wait_for_disable, force_static))
   726			return false;
   727	
   728		return true;
   729	}
   730	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
