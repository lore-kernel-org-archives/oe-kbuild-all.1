Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB421E5B63
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 05:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772948217; cv=none; b=K+DFYJVA/W34l1cefDfxENiAxdMpABxvysZtlHmpvXHIUCpp6rvRGxAU2ZaF5APQ3AQjJDpVc36ovoI0kd3J16TqI/jp+75OaIzzxo+Mpi8rUPG1EgsIKWBylUz6Ig4CLG222b2Plcn75ZqxoCl01f/JE7/94pvVwZtAPjXst2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772948217; c=relaxed/simple;
	bh=MK289e8fG8HYRSjoNHhubWtQSxDWhdjbbpQZnveWewA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GS+5h4M87sjP91b9I7S03cNx43xOlstVpGujqZmska7Uz8Ojx5pc/Tf8h+iNEAze7s/ji/u8bNBofX3paZ05YGurFc0eWpJMax5a0s/OtF2W27eiQfyPHd9DiOUcSQNv7x6awpSbaCNj9UHf0CCG2HuYGzusiTQK8tF8mMuOTgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDNivFsy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDNivFsy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772948215; x=1804484215;
  h=date:from:to:cc:subject:message-id;
  bh=MK289e8fG8HYRSjoNHhubWtQSxDWhdjbbpQZnveWewA=;
  b=fDNivFsyjlw04Khks2/rIK/862Z46oaK+u3jGpEzuySwVW4jsaf/nlQE
   PxsxmMCLIDSMnTB/4tUvMLe7hDz73dzupYr63Qb7EqqzukoMKm3bykhQn
   p1j53RO+zf5HkQui6TMxyDiqm63wpwxBO57+XRw8uigvfjQm5fde8Ms83
   6oOyWYD6MSwIVseUbEAG4W2ZIKpuTxiPuNw43jagIermgwoqiBh+XtSJI
   TYWBGR7t5HxaKlpBRzda+Gu/+so1hPqq6tKv/r3GYaRLF7Rl3Ol95G3n8
   VjIz6MsQLwK9TZGp0kaoOHB3bC1vX0svg/Hfh6AVZxQJcqN9SJvEuEiln
   A==;
X-CSE-ConnectionGUID: 1+rH/yiQSeWZIT8hx44iow==
X-CSE-MsgGUID: 1jOZFquQTwePFQJPE2I3bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="99474878"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="99474878"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 21:36:55 -0800
X-CSE-ConnectionGUID: K8jv5LsvRCaTtGRa54KCdQ==
X-CSE-MsgGUID: jW2MWONXSFGMFict3RNPFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="224115373"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Mar 2026 21:36:53 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz6os-000000002vx-3L4S;
	Sun, 08 Mar 2026 05:36:50 +0000
Date: Sun, 08 Mar 2026 13:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Lipski <ivan.lipski@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:1267
 mod_freesync_handle_v_update() warn: inconsistent indenting
Message-ID: <202603081312.BNBLYoQ7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c23719abc3308df7ed3ad35650ad211fb2d2003d
commit: 33c995709121a3a29d4567a08c943bf7a5b24b78 drm/amd/display: Allow VRR params change if unsynced with the stream
date:   4 months ago
config: alpha-randconfig-r071-20260304 (https://download.01.org/0day-ci/archive/20260308/202603081312.BNBLYoQ7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081312.BNBLYoQ7-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:1267 mod_freesync_handle_v_update() warn: inconsistent indenting

vim +1267 drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c

  1166	
  1167	void mod_freesync_handle_v_update(struct mod_freesync *mod_freesync,
  1168			const struct dc_stream_state *stream,
  1169			struct mod_vrr_params *in_out_vrr)
  1170	{
  1171		struct core_freesync *core_freesync = NULL;
  1172		unsigned int cur_timestamp_in_us;
  1173		unsigned long long cur_tick;
  1174	
  1175		if ((mod_freesync == NULL) || (stream == NULL) || (in_out_vrr == NULL))
  1176			return;
  1177	
  1178		core_freesync = MOD_FREESYNC_TO_CORE(mod_freesync);
  1179	
  1180		if (in_out_vrr->supported == false)
  1181			return;
  1182	
  1183		cur_tick = dm_get_timestamp(core_freesync->dc->ctx);
  1184		cur_timestamp_in_us = (unsigned int)
  1185				div_u64(dm_get_elapse_time_in_ns(core_freesync->dc->ctx, cur_tick, 0), 1000);
  1186	
  1187		in_out_vrr->flip_interval.vsyncs_between_flip++;
  1188		in_out_vrr->flip_interval.v_update_timestamp_in_us = cur_timestamp_in_us;
  1189	
  1190		if (in_out_vrr->state == VRR_STATE_ACTIVE_VARIABLE &&
  1191				(in_out_vrr->flip_interval.flip_interval_workaround_active ||
  1192				(!in_out_vrr->flip_interval.flip_interval_workaround_active &&
  1193				in_out_vrr->flip_interval.program_flip_interval_workaround))) {
  1194			// set freesync vmin vmax to nominal for workaround
  1195			in_out_vrr->adjust.v_total_min =
  1196				mod_freesync_calc_v_total_from_refresh(
  1197				stream, in_out_vrr->max_refresh_in_uhz);
  1198			in_out_vrr->adjust.v_total_max =
  1199					in_out_vrr->adjust.v_total_min;
  1200			in_out_vrr->flip_interval.program_flip_interval_workaround = false;
  1201			in_out_vrr->flip_interval.do_flip_interval_workaround_cleanup = true;
  1202			return;
  1203		}
  1204	
  1205		if (in_out_vrr->state != VRR_STATE_ACTIVE_VARIABLE &&
  1206				in_out_vrr->flip_interval.do_flip_interval_workaround_cleanup) {
  1207			in_out_vrr->flip_interval.do_flip_interval_workaround_cleanup = false;
  1208			in_out_vrr->flip_interval.flip_interval_detect_counter = 0;
  1209			in_out_vrr->flip_interval.vsyncs_between_flip = 0;
  1210			in_out_vrr->flip_interval.vsync_to_flip_in_us = 0;
  1211		}
  1212	
  1213		/* Below the Range Logic */
  1214	
  1215		/* Only execute if in fullscreen mode */
  1216		if (in_out_vrr->state == VRR_STATE_ACTIVE_VARIABLE &&
  1217						in_out_vrr->btr.btr_active) {
  1218			/* TODO: pass in flag for Pre-DCE12 ASIC
  1219			 * in order for frame variable duration to take affect,
  1220			 * it needs to be done one VSYNC early, which is at
  1221			 * frameCounter == 1.
  1222			 * For DCE12 and newer updates to V_TOTAL_MIN/MAX
  1223			 * will take affect on current frame
  1224			 */
  1225			if (in_out_vrr->btr.frames_to_insert ==
  1226					in_out_vrr->btr.frame_counter) {
  1227				in_out_vrr->adjust.v_total_min =
  1228					calc_v_total_from_duration(stream,
  1229					in_out_vrr,
  1230					in_out_vrr->btr.inserted_duration_in_us);
  1231				in_out_vrr->adjust.v_total_max =
  1232					in_out_vrr->adjust.v_total_min;
  1233			}
  1234	
  1235			if (in_out_vrr->btr.frame_counter > 0)
  1236				in_out_vrr->btr.frame_counter--;
  1237	
  1238			/* Restore FreeSync */
  1239			if (in_out_vrr->btr.frame_counter == 0) {
  1240				in_out_vrr->adjust.v_total_min =
  1241					mod_freesync_calc_v_total_from_refresh(stream,
  1242					in_out_vrr->max_refresh_in_uhz);
  1243				in_out_vrr->adjust.v_total_max =
  1244					mod_freesync_calc_v_total_from_refresh(stream,
  1245					in_out_vrr->min_refresh_in_uhz);
  1246			}
  1247		}
  1248	
  1249		/* If in fullscreen freesync mode or in video, do not program
  1250		 * static screen ramp values
  1251		 */
  1252		if (in_out_vrr->state == VRR_STATE_ACTIVE_VARIABLE)
  1253			in_out_vrr->fixed.ramping_active = false;
  1254	
  1255		/* Gradual Static Screen Ramping Logic
  1256		 * Execute if ramp is active and user enabled freesync static screen
  1257		 */
  1258		if (in_out_vrr->state == VRR_STATE_ACTIVE_FIXED &&
  1259					in_out_vrr->fixed.ramping_active) {
  1260			update_v_total_for_static_ramp(
  1261					core_freesync, stream, in_out_vrr);
  1262		}
  1263	
  1264		/*
  1265		 * If VRR is inactive, set vtotal min and max to nominal vtotal
  1266		 */
> 1267		 if (in_out_vrr->state == VRR_STATE_INACTIVE) {
  1268			in_out_vrr->adjust.v_total_min =
  1269				mod_freesync_calc_v_total_from_refresh(stream,
  1270					in_out_vrr->max_refresh_in_uhz);
  1271			in_out_vrr->adjust.v_total_max = in_out_vrr->adjust.v_total_min;
  1272			return;
  1273		}
  1274	}
  1275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
