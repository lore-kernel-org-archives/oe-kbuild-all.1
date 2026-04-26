Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD0E2D12EE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Apr 2026 23:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777246149; cv=none; b=KH5O0qFfGAYRzWkL59a57sEdq17ampVNZVmuFNADZSC53uUo1YU9B48ZkevnH8zyQUrA5xpEYVBxchZEBPc6xvqQC44hFTaxjcDjS7urNLt1JxMTjVrAwfvp/g6hzxYuA/7BzFtzXUIaG4alhM2IrN08VQwV8yonU3stBJTktA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777246149; c=relaxed/simple;
	bh=nmAJ313zYCLauuPEdE9Ns9XMS5zMMxBNeQIU7FhFbGE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BSsjs3WTXxGoWAYp6/MjfPNrcshm/0BFzjVLlPcadPROu2pFHKYyjwY4vFw0Urh6scPa3lLx/jHknOp0BsXtUknuvTmYvzi5abYtyW5NucMd0f7Ksp1ZLmPSFW6A4ZFaJPOfmOU9HSiBIe5/JsHi9SzPqrHjSMSnVo90aNOsmHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xf/NLO90; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xf/NLO90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777246147; x=1808782147;
  h=date:from:to:cc:subject:message-id;
  bh=nmAJ313zYCLauuPEdE9Ns9XMS5zMMxBNeQIU7FhFbGE=;
  b=Xf/NLO90Qg7CqUHiNtv5InKYP8afIFimRxm1a2nQ4nY0IKIgDX5vy6Cf
   vYV48gd10pXEHyictn/Y7Q4edlGIdmJAIq60DNHYy2IWROAIH2Zk/zU3O
   VfNuM6l1gJJs6W2FRqVt3bsHYVUFg1mnqKd1tyZFBw2EL+m0MTMGMB1No
   ujOT0NcRa5k9jNsB5prGh4i6t2n6Rf3zci1W2KKvwqRD016ZLx3NfpeQ6
   vNvODoAugmc1hxaCGq4dvKSMj7DLD/DP1vH4hZ6yG8b+F0AKQKuaCtYDG
   Lk7BkZtmisv5r/d2Ip9P5zL1NZxa6UcFY8e8nDylQMoOwFtgjANKc6v7t
   w==;
X-CSE-ConnectionGUID: iEvlYo4rTDqOjzmpjJZOEg==
X-CSE-MsgGUID: zv7U6WBlSd+7E7aSl1ZaxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77292072"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="77292072"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 16:29:06 -0700
X-CSE-ConnectionGUID: Zql0hsJeQF6V4Au/sS3cIA==
X-CSE-MsgGUID: JMQclUucRV+hu2YX/JKkTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="230287611"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Apr 2026 16:29:04 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wH8uL-000000008I5-3M62;
	Sun, 26 Apr 2026 23:29:01 +0000
Date: Mon, 27 Apr 2026 07:28:26 +0800
From: kernel test robot <lkp@intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Roman Li <roman.li@amd.com>
Subject: 
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:13384:37-39: WARNING !A ||
 A && B is equivalent to !A || B
Message-ID: <202604270741.pABgRDTb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   254f49634ee16a731174d2ae34bc50bd5f45e731
commit: 6f71d5dd320663f2003fff252a5da93f4f753bef drm/amd/display: Read sink freesync support via mccs
date:   9 days ago
config: s390-randconfig-r063-20260426 (https://download.01.org/0day-ci/archive/20260427/202604270741.pABgRDTb-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6f71d5dd3206 ("drm/amd/display: Read sink freesync support via mccs")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604270741.pABgRDTb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:13384:37-39: WARNING !A || A && B is equivalent to !A || B

vim +13384 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

 13260	
 13261	/**
 13262	 * amdgpu_dm_update_freesync_caps - Update Freesync capabilities
 13263	 *
 13264	 * @connector: Connector to query.
 13265	 * @drm_edid: DRM EDID from monitor
 13266	 *
 13267	 * Amdgpu supports Freesync in DP and HDMI displays, and it is required to keep
 13268	 * track of some of the display information in the internal data struct used by
 13269	 * amdgpu_dm. This function checks which type of connector we need to set the
 13270	 * FreeSync parameters.
 13271	 */
 13272	void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 13273					    const struct drm_edid *drm_edid)
 13274	{
 13275		int i = 0;
 13276		struct amdgpu_dm_connector *amdgpu_dm_connector =
 13277				to_amdgpu_dm_connector(connector);
 13278		struct dm_connector_state *dm_con_state = NULL;
 13279		struct dc_sink *sink;
 13280		struct amdgpu_device *adev = drm_to_adev(connector->dev);
 13281		struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
 13282		const struct edid *edid;
 13283		bool freesync_capable = false;
 13284		enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
 13285	
 13286		if (!connector->state) {
 13287			drm_err(adev_to_drm(adev), "%s - Connector has no state", __func__);
 13288			goto update;
 13289		}
 13290	
 13291		sink = amdgpu_dm_connector->dc_sink ?
 13292			amdgpu_dm_connector->dc_sink :
 13293			amdgpu_dm_connector->dc_em_sink;
 13294	
 13295		drm_edid_connector_update(connector, drm_edid);
 13296	
 13297		if (!drm_edid || !sink) {
 13298			dm_con_state = to_dm_connector_state(connector->state);
 13299	
 13300			amdgpu_dm_connector->min_vfreq = 0;
 13301			amdgpu_dm_connector->max_vfreq = 0;
 13302			freesync_capable = false;
 13303	
 13304			goto update;
 13305		}
 13306	
 13307		dm_con_state = to_dm_connector_state(connector->state);
 13308	
 13309		if (!adev->dm.freesync_module || !dc_supports_vrr(sink->ctx->dce_version))
 13310			goto update;
 13311	
 13312		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 13313	
 13314		/* Some eDP panels only have the refresh rate range info in DisplayID */
 13315		if ((connector->display_info.monitor_range.min_vfreq == 0 ||
 13316		     connector->display_info.monitor_range.max_vfreq == 0))
 13317			parse_edid_displayid_vrr(connector, edid);
 13318	
 13319		if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
 13320			     sink->sink_signal == SIGNAL_TYPE_EDP)) {
 13321			if (amdgpu_dm_connector->dc_link &&
 13322			    amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid_MSA_timing_param) {
 13323				amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
 13324				amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
 13325				if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
 13326					freesync_capable = true;
 13327			}
 13328	
 13329			get_amd_vsdb(amdgpu_dm_connector, &vsdb_info);
 13330	
 13331			if (vsdb_info.replay_mode) {
 13332				amdgpu_dm_connector->vsdb_info.replay_mode = vsdb_info.replay_mode;
 13333				amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_info.amd_vsdb_version;
 13334				amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
 13335			}
 13336	
 13337		} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
 13338			i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 13339			if (i >= 0) {
 13340				amdgpu_dm_connector->vsdb_info = vsdb_info;
 13341				sink->edid_caps.freesync_vcp_code = vsdb_info.freesync_mccs_vcp_code;
 13342	
 13343				if (vsdb_info.freesync_supported) {
 13344					amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
 13345					amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
 13346					if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
 13347						freesync_capable = true;
 13348	
 13349					connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
 13350					connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
 13351				}
 13352			}
 13353		}
 13354	
 13355		if (amdgpu_dm_connector->dc_link)
 13356			as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
 13357	
 13358		if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) {
 13359			i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 13360			if (i >= 0) {
 13361				amdgpu_dm_connector->vsdb_info = vsdb_info;
 13362				sink->edid_caps.freesync_vcp_code = vsdb_info.freesync_mccs_vcp_code;
 13363	
 13364				if (vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
 13365					amdgpu_dm_connector->pack_sdp_v1_3 = true;
 13366					amdgpu_dm_connector->as_type = as_type;
 13367	
 13368					amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
 13369					amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
 13370					if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
 13371						freesync_capable = true;
 13372	
 13373					connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
 13374					connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
 13375				}
 13376			}
 13377		}
 13378	
 13379		/* Handle MCCS */
 13380		dm_helpers_read_mccs_caps(adev->dm.dc->ctx, amdgpu_dm_connector->dc_link, sink);
 13381		if ((sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A ||
 13382			as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) &&
 13383			(!sink->edid_caps.freesync_vcp_code ||
 13384			(sink->edid_caps.freesync_vcp_code && !sink->mccs_caps.freesync_supported)))
 13385			freesync_capable = false;
 13386	
 13387	update:
 13388		if (dm_con_state)
 13389			dm_con_state->freesync_capable = freesync_capable;
 13390	
 13391		if (connector->state && amdgpu_dm_connector->dc_link && !freesync_capable &&
 13392		    amdgpu_dm_connector->dc_link->replay_settings.config.replay_supported) {
 13393			amdgpu_dm_connector->dc_link->replay_settings.config.replay_supported = false;
 13394			amdgpu_dm_connector->dc_link->replay_settings.replay_feature_enabled = false;
 13395		}
 13396	
 13397		if (connector->vrr_capable_property)
 13398			drm_connector_set_vrr_capable_property(connector,
 13399							       freesync_capable);
 13400	}
 13401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
