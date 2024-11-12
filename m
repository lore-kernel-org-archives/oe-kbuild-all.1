Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2415205AD9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 05:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731391125; cv=none; b=NOriDh/QZ2ZkQhnZlzwX9COVCooJrh8Fnsq3M/ZbkndVXj8Mtp4zj3/CditS3o8eldCkzmhCmjr07z4iZmDkKqGsZKSI+DZsdUyyG02BWUUDuKkBoAjeYTHQI2QT7NoxYU+6U5ZK6VG8oGpuoy0npcxi9LR1Xxj4VkirYCOqn6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731391125; c=relaxed/simple;
	bh=6RPHpuRrY634HZd9bZ6F1A4GpJcOYTRi4dtL1LVdTRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PS6/SPDvYxhmFckyN08fdKk6aebQe/i/XBFGMsvwPnbbkmAllQ7CKG2Vj706XselMBGrpnoBedkPQ1cx10lpelkEdj3UZ03/H46PyX8NhtltHOEMv4CP/RE+d4mgBrWizmHSnO+g7xCAnzHl8fTTm1jF/NFGUM8PJtlCSKeOWF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8UdqV/K; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8UdqV/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731391124; x=1762927124;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6RPHpuRrY634HZd9bZ6F1A4GpJcOYTRi4dtL1LVdTRw=;
  b=U8UdqV/KZMxkeb+PqAyNRC+jTjqmon/bRENhpb9pL/Td340Pc4Da12s0
   vwq07EF69O7yUx1Mt4sgT8+aa4ICvkS9wKZpQFuG4fBc8d4qA69EWzUjg
   4bLa5uBjzo8ts0Zj1HzUmmO2RPqZ92O+vU13DluVDVtBPgXh1P+QfjSgx
   WL7d7ePoUuO7HoaVNa0M33KtmZgV9opro5Gi2IYSn9HpkfZj5l0SeUlmg
   lLAQ+pfisEcE/Ndd6gd8UOLRxu/KKZkqZWqGOmAB6roXJnL9cUEF/mxsC
   pqCVawVgq/Ol3RjXfC23oKM2+HD+gwOBL8COhwwZN3+Gx/P2a8qFY2wZo
   g==;
X-CSE-ConnectionGUID: gSFUx3+eQBeptbaLgkLW2g==
X-CSE-MsgGUID: aUgXqAp0Sk2X03Wd+TfScA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31070225"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31070225"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 21:58:44 -0800
X-CSE-ConnectionGUID: RvXxOCoaSHq0WhaJ/n0ISQ==
X-CSE-MsgGUID: QDaYmq7zTuegPMy/5GviTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87434830"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Nov 2024 21:58:42 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAjvE-0000Vx-0C;
	Tue, 12 Nov 2024 05:58:40 +0000
Date: Tue, 12 Nov 2024 13:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/amdgpu-drm_edid 6/7]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:101:
 warning: Function parameter or struct member 'drm_edid' not described in
 'dm_helpers_parse_edid_caps'
Message-ID: <202411121358.6vjrPutL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/amdgpu-drm_edid
head:   36a70587d73d8051d59295ea31b5ad1fcaad7779
commit: d236a4b83a0730653d4b3448f1111c858158d9b8 [6/7] drm/amd/display: Switch dc_sink to struct drm_edid
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241112/202411121358.6vjrPutL-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121358.6vjrPutL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121358.6vjrPutL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:101: warning: Function parameter or struct member 'drm_edid' not described in 'dm_helpers_parse_edid_caps'
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:101: warning: Excess function parameter 'edid' description in 'dm_helpers_parse_edid_caps'


vim +101 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c

613a7956deb3b1 Aurabindo Pillai     2023-06-12   87  
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   88  /**
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   89   * dm_helpers_parse_edid_caps() - Parse edid caps
4562236b3bc0a2 Harry Wentland       2017-09-12   90   *
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   91   * @link: current detected link
4562236b3bc0a2 Harry Wentland       2017-09-12   92   * @edid:	[in] pointer to edid
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   93   * @edid_caps:	[in] pointer to edid caps
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   94   *
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   95   * Return: void
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   96   */
4562236b3bc0a2 Harry Wentland       2017-09-12   97  enum dc_edid_status dm_helpers_parse_edid_caps(
3c021931023a30 Claudio Suarez       2021-10-17   98  		struct dc_link *link,
d236a4b83a0730 Thomas Weiﬂschuh     2024-06-15   99  		const struct drm_edid *drm_edid,
4562236b3bc0a2 Harry Wentland       2017-09-12  100  		struct dc_edid_caps *edid_caps)
4562236b3bc0a2 Harry Wentland       2017-09-12 @101  {
3c021931023a30 Claudio Suarez       2021-10-17  102  	struct amdgpu_dm_connector *aconnector = link->priv;
3c021931023a30 Claudio Suarez       2021-10-17  103  	struct drm_connector *connector = &aconnector->base;
d236a4b83a0730 Thomas Weiﬂschuh     2024-06-15  104  	const struct edid *edid_buf;
4562236b3bc0a2 Harry Wentland       2017-09-12  105  	struct cea_sad *sads;
4562236b3bc0a2 Harry Wentland       2017-09-12  106  	int sad_count = -1;
4562236b3bc0a2 Harry Wentland       2017-09-12  107  	int sadb_count = -1;
4562236b3bc0a2 Harry Wentland       2017-09-12  108  	int i = 0;
4562236b3bc0a2 Harry Wentland       2017-09-12  109  	uint8_t *sadb = NULL;
4562236b3bc0a2 Harry Wentland       2017-09-12  110  
4562236b3bc0a2 Harry Wentland       2017-09-12  111  	enum dc_edid_status result = EDID_OK;
4562236b3bc0a2 Harry Wentland       2017-09-12  112  
d236a4b83a0730 Thomas Weiﬂschuh     2024-06-15  113  	if (!edid_caps || !drm_edid)
4562236b3bc0a2 Harry Wentland       2017-09-12  114  		return EDID_BAD_INPUT;
4562236b3bc0a2 Harry Wentland       2017-09-12  115  
d236a4b83a0730 Thomas Weiﬂschuh     2024-06-15  116  	edid_buf = drm_edid_raw(drm_edid);
d236a4b83a0730 Thomas Weiﬂschuh     2024-06-15  117  
d236a4b83a0730 Thomas Weiﬂschuh     2024-06-15  118  	if (!drm_edid_valid(drm_edid))
4562236b3bc0a2 Harry Wentland       2017-09-12  119  		result = EDID_BAD_CHECKSUM;
4562236b3bc0a2 Harry Wentland       2017-09-12  120  
4562236b3bc0a2 Harry Wentland       2017-09-12  121  	edid_caps->manufacturer_id = (uint16_t) edid_buf->mfg_id[0] |
4562236b3bc0a2 Harry Wentland       2017-09-12  122  					((uint16_t) edid_buf->mfg_id[1])<<8;
4562236b3bc0a2 Harry Wentland       2017-09-12  123  	edid_caps->product_id = (uint16_t) edid_buf->prod_code[0] |
4562236b3bc0a2 Harry Wentland       2017-09-12  124  					((uint16_t) edid_buf->prod_code[1])<<8;
4562236b3bc0a2 Harry Wentland       2017-09-12  125  	edid_caps->serial_number = edid_buf->serial;
4562236b3bc0a2 Harry Wentland       2017-09-12  126  	edid_caps->manufacture_week = edid_buf->mfg_week;
4562236b3bc0a2 Harry Wentland       2017-09-12  127  	edid_caps->manufacture_year = edid_buf->mfg_year;
4562236b3bc0a2 Harry Wentland       2017-09-12  128  
0b7778f4a63a1e Claudio Suarez       2021-10-17  129  	drm_edid_get_monitor_name(edid_buf,
0b7778f4a63a1e Claudio Suarez       2021-10-17  130  				  edid_caps->display_name,
0b7778f4a63a1e Claudio Suarez       2021-10-17  131  				  AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
4562236b3bc0a2 Harry Wentland       2017-09-12  132  
3c021931023a30 Claudio Suarez       2021-10-17  133  	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
4562236b3bc0a2 Harry Wentland       2017-09-12  134  
b7cdccc6a84956 Ryan Lin             2024-02-28  135  	apply_edid_quirks(edid_buf, edid_caps);
b7cdccc6a84956 Ryan Lin             2024-02-28  136  
d236a4b83a0730 Thomas Weiﬂschuh     2024-06-15  137  	sad_count = drm_edid_to_sad(edid_buf, &sads);
ae2a3495973ef0 Jean Delvare         2019-09-04  138  	if (sad_count <= 0)
4562236b3bc0a2 Harry Wentland       2017-09-12  139  		return result;
4562236b3bc0a2 Harry Wentland       2017-09-12  140  
1347b15d5e8e16 Srinivasan Shanmugam 2023-08-13  141  	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
4562236b3bc0a2 Harry Wentland       2017-09-12  142  	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
4562236b3bc0a2 Harry Wentland       2017-09-12  143  		struct cea_sad *sad = &sads[i];
4562236b3bc0a2 Harry Wentland       2017-09-12  144  
4562236b3bc0a2 Harry Wentland       2017-09-12  145  		edid_caps->audio_modes[i].format_code = sad->format;
731a373698c967 Harry Wentland       2018-03-07  146  		edid_caps->audio_modes[i].channel_count = sad->channels + 1;
4562236b3bc0a2 Harry Wentland       2017-09-12  147  		edid_caps->audio_modes[i].sample_rate = sad->freq;
4562236b3bc0a2 Harry Wentland       2017-09-12  148  		edid_caps->audio_modes[i].sample_size = sad->byte2;
4562236b3bc0a2 Harry Wentland       2017-09-12  149  	}
4562236b3bc0a2 Harry Wentland       2017-09-12  150  
d236a4b83a0730 Thomas Weiﬂschuh     2024-06-15  151  	sadb_count = drm_edid_to_speaker_allocation(edid_buf, &sadb);
4562236b3bc0a2 Harry Wentland       2017-09-12  152  
4562236b3bc0a2 Harry Wentland       2017-09-12  153  	if (sadb_count < 0) {
4562236b3bc0a2 Harry Wentland       2017-09-12  154  		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sadb_count);
4562236b3bc0a2 Harry Wentland       2017-09-12  155  		sadb_count = 0;
4562236b3bc0a2 Harry Wentland       2017-09-12  156  	}
4562236b3bc0a2 Harry Wentland       2017-09-12  157  
4562236b3bc0a2 Harry Wentland       2017-09-12  158  	if (sadb_count)
4562236b3bc0a2 Harry Wentland       2017-09-12  159  		edid_caps->speaker_flags = sadb[0];
4562236b3bc0a2 Harry Wentland       2017-09-12  160  	else
4562236b3bc0a2 Harry Wentland       2017-09-12  161  		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
4562236b3bc0a2 Harry Wentland       2017-09-12  162  
4562236b3bc0a2 Harry Wentland       2017-09-12  163  	kfree(sads);
4562236b3bc0a2 Harry Wentland       2017-09-12  164  	kfree(sadb);
4562236b3bc0a2 Harry Wentland       2017-09-12  165  
4562236b3bc0a2 Harry Wentland       2017-09-12  166  	return result;
4562236b3bc0a2 Harry Wentland       2017-09-12  167  }
4562236b3bc0a2 Harry Wentland       2017-09-12  168  

:::::: The code at line 101 was first introduced by commit
:::::: 4562236b3bc0a28aeb6ee93b2d8a849a4c4e1c7c drm/amd/dc: Add dc display driver (v2)

:::::: TO: Harry Wentland <harry.wentland@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
