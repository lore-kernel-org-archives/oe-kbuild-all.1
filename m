Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6B511733
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 04:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708058600; cv=none; b=EJH9UHK+NYWaJKGwEvb+MzUjCSOV5unooiA60muN7TaSkuOLKQurKxp/8p1zuGOfYQTQXYcVN9n481T01bQYFflOCw3dkp4AIwaOTZGtNibl6SQc6K3co9MxG7V3CX+g5frlw1GY2GvQiFlgD0h5+P7cl8hJtiSVQ9obaQd5F/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708058600; c=relaxed/simple;
	bh=/UWc7sO/7DHhNyMjBo0/CB41XcdTTQ3OyDBL9UAyPeM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uzw3S4G9XyT+wDNV6y/OsYhUEII98edKh5/bgzz2pwmEzlgL9cra5HcVft2xCgsteJfqC67k5BSikj9NqMaAfmmrBjmuIEwX4rboQQA0oalyDwPDmHxmSLwoWdI0LH64ytXxBVR9oJaaibOA95uelfF6xKJn+MNYXfJRpJEarQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djBZhd5/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djBZhd5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708058598; x=1739594598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/UWc7sO/7DHhNyMjBo0/CB41XcdTTQ3OyDBL9UAyPeM=;
  b=djBZhd5/MY105xImDH9wTwQ9XoUPx64SoVNNVJiAmJYM7KRS4bLWoUi5
   IPWVe+Gj3IsSNHx15/THNHxtQ5bHDmREvJHimHlBA6TY4VLyWp/D4IXu9
   yZix0LqcG6mXHu0jU+en7XIEUM6oLP+gHn0lkrf8tZktBlkvnJ79/PstW
   0Q5xQF6hMdDilHuzA10kKA9kyuw+WayaDw3THpFyWK+uGOFsi47F8brXN
   S7MwSRtAHXgkDtzyFtUIWEga9YziSDmFnG7+PeVJxGABxnik6fQ2C2FFv
   gSjdFs15BS+KdF+jxCTVP/pZvLkLSg23b1Y2fdsWSKdI5BIl52oknxDcg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13283507"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="13283507"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 20:43:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="41237101"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Feb 2024 20:43:16 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raq49-000104-01;
	Fri, 16 Feb 2024 04:43:13 +0000
Date: Fri, 16 Feb 2024 12:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [agd5f:amd-staging-drm-next 1711/1757]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5258: warning:
 Function parameter or member 'is_psr_su' not described in
 'fill_dc_dirty_rects'
Message-ID: <202402161208.7MuJbqwJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   5b8f0fcae55efb93d5f8fc4c366eb06c63fe75dd
commit: 13d6b0812e5840e4dc2aeb1e1acf80b60b4e40ae [1711/1757] drm/amdgpu: make damage clips support configurable
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240216/202402161208.7MuJbqwJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402161208.7MuJbqwJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402161208.7MuJbqwJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5258: warning: Function parameter or member 'is_psr_su' not described in 'fill_dc_dirty_rects'


vim +5258 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

30ebe41582d1ea Hamza Mahfooz        2022-11-15  5228  
7cc191ee7621b7 Leo Li               2022-03-30  5229  /**
7cc191ee7621b7 Leo Li               2022-03-30  5230   * fill_dc_dirty_rects() - Fill DC dirty regions for PSR selective updates
7cc191ee7621b7 Leo Li               2022-03-30  5231   *
7cc191ee7621b7 Leo Li               2022-03-30  5232   * @plane: DRM plane containing dirty regions that need to be flushed to the eDP
7cc191ee7621b7 Leo Li               2022-03-30  5233   *         remote fb
7cc191ee7621b7 Leo Li               2022-03-30  5234   * @old_plane_state: Old state of @plane
7cc191ee7621b7 Leo Li               2022-03-30  5235   * @new_plane_state: New state of @plane
7cc191ee7621b7 Leo Li               2022-03-30  5236   * @crtc_state: New state of CRTC connected to the @plane
7cc191ee7621b7 Leo Li               2022-03-30  5237   * @flip_addrs: DC flip tracking struct, which also tracts dirty rects
d6ed6d0d2aa8f2 Tom Chung            2023-02-01  5238   * @dirty_regions_changed: dirty regions changed
7cc191ee7621b7 Leo Li               2022-03-30  5239   *
7cc191ee7621b7 Leo Li               2022-03-30  5240   * For PSR SU, DC informs the DMUB uController of dirty rectangle regions
7cc191ee7621b7 Leo Li               2022-03-30  5241   * (referred to as "damage clips" in DRM nomenclature) that require updating on
7cc191ee7621b7 Leo Li               2022-03-30  5242   * the eDP remote buffer. The responsibility of specifying the dirty regions is
7cc191ee7621b7 Leo Li               2022-03-30  5243   * amdgpu_dm's.
7cc191ee7621b7 Leo Li               2022-03-30  5244   *
7cc191ee7621b7 Leo Li               2022-03-30  5245   * A damage-aware DRM client should fill the FB_DAMAGE_CLIPS property on the
7cc191ee7621b7 Leo Li               2022-03-30  5246   * plane with regions that require flushing to the eDP remote buffer. In
7cc191ee7621b7 Leo Li               2022-03-30  5247   * addition, certain use cases - such as cursor and multi-plane overlay (MPO) -
7cc191ee7621b7 Leo Li               2022-03-30  5248   * implicitly provide damage clips without any client support via the plane
7cc191ee7621b7 Leo Li               2022-03-30  5249   * bounds.
7cc191ee7621b7 Leo Li               2022-03-30  5250   */
7cc191ee7621b7 Leo Li               2022-03-30  5251  static void fill_dc_dirty_rects(struct drm_plane *plane,
7cc191ee7621b7 Leo Li               2022-03-30  5252  				struct drm_plane_state *old_plane_state,
7cc191ee7621b7 Leo Li               2022-03-30  5253  				struct drm_plane_state *new_plane_state,
7cc191ee7621b7 Leo Li               2022-03-30  5254  				struct drm_crtc_state *crtc_state,
d6ed6d0d2aa8f2 Tom Chung            2023-02-01  5255  				struct dc_flip_addrs *flip_addrs,
13d6b0812e5840 Hamza Mahfooz        2024-02-08  5256  				bool is_psr_su,
d6ed6d0d2aa8f2 Tom Chung            2023-02-01  5257  				bool *dirty_regions_changed)
7cc191ee7621b7 Leo Li               2022-03-30 @5258  {
7cc191ee7621b7 Leo Li               2022-03-30  5259  	struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(crtc_state);
7cc191ee7621b7 Leo Li               2022-03-30  5260  	struct rect *dirty_rects = flip_addrs->dirty_rects;
ae67558be71223 Srinivasan Shanmugam 2022-12-19  5261  	u32 num_clips;
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5262  	struct drm_mode_rect *clips;
7cc191ee7621b7 Leo Li               2022-03-30  5263  	bool bb_changed;
7cc191ee7621b7 Leo Li               2022-03-30  5264  	bool fb_changed;
ae67558be71223 Srinivasan Shanmugam 2022-12-19  5265  	u32 i = 0;
d6ed6d0d2aa8f2 Tom Chung            2023-02-01  5266  	*dirty_regions_changed = false;
7cc191ee7621b7 Leo Li               2022-03-30  5267  
7cc191ee7621b7 Leo Li               2022-03-30  5268  	/*
7cc191ee7621b7 Leo Li               2022-03-30  5269  	 * Cursor plane has it's own dirty rect update interface. See
7cc191ee7621b7 Leo Li               2022-03-30  5270  	 * dcn10_dmub_update_cursor_data and dmub_cmd_update_cursor_info_data
7cc191ee7621b7 Leo Li               2022-03-30  5271  	 */
7cc191ee7621b7 Leo Li               2022-03-30  5272  	if (plane->type == DRM_PLANE_TYPE_CURSOR)
7cc191ee7621b7 Leo Li               2022-03-30  5273  		return;
7cc191ee7621b7 Leo Li               2022-03-30  5274  
0c924b8f1ff93e Hamza Mahfooz        2023-12-05  5275  	if (new_plane_state->rotation != DRM_MODE_ROTATE_0)
0c924b8f1ff93e Hamza Mahfooz        2023-12-05  5276  		goto ffu;
0c924b8f1ff93e Hamza Mahfooz        2023-12-05  5277  
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5278  	num_clips = drm_plane_get_damage_clips_count(new_plane_state);
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5279  	clips = drm_plane_get_damage_clips(new_plane_state);
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5280  
13d6b0812e5840 Hamza Mahfooz        2024-02-08  5281  	if (num_clips && (!amdgpu_damage_clips || (amdgpu_damage_clips < 0 &&
13d6b0812e5840 Hamza Mahfooz        2024-02-08  5282  						   is_psr_su)))
13d6b0812e5840 Hamza Mahfooz        2024-02-08  5283  		goto ffu;
13d6b0812e5840 Hamza Mahfooz        2024-02-08  5284  
7cc191ee7621b7 Leo Li               2022-03-30  5285  	if (!dm_crtc_state->mpo_requested) {
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5286  		if (!num_clips || num_clips > DC_MAX_DIRTY_RECTS)
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5287  			goto ffu;
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5288  
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5289  		for (; flip_addrs->dirty_rect_count < num_clips; clips++)
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5290  			fill_dc_dirty_rect(new_plane_state->plane,
566b6577849fcc Benjamin Cheng       2023-03-12  5291  					   &dirty_rects[flip_addrs->dirty_rect_count],
566b6577849fcc Benjamin Cheng       2023-03-12  5292  					   clips->x1, clips->y1,
566b6577849fcc Benjamin Cheng       2023-03-12  5293  					   clips->x2 - clips->x1, clips->y2 - clips->y1,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5294  					   &flip_addrs->dirty_rect_count,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5295  					   false);
7cc191ee7621b7 Leo Li               2022-03-30  5296  		return;
7cc191ee7621b7 Leo Li               2022-03-30  5297  	}
7cc191ee7621b7 Leo Li               2022-03-30  5298  
7cc191ee7621b7 Leo Li               2022-03-30  5299  	/*
7cc191ee7621b7 Leo Li               2022-03-30  5300  	 * MPO is requested. Add entire plane bounding box to dirty rects if
7cc191ee7621b7 Leo Li               2022-03-30  5301  	 * flipped to or damaged.
7cc191ee7621b7 Leo Li               2022-03-30  5302  	 *
7cc191ee7621b7 Leo Li               2022-03-30  5303  	 * If plane is moved or resized, also add old bounding box to dirty
7cc191ee7621b7 Leo Li               2022-03-30  5304  	 * rects.
7cc191ee7621b7 Leo Li               2022-03-30  5305  	 */
7cc191ee7621b7 Leo Li               2022-03-30  5306  	fb_changed = old_plane_state->fb->base.id !=
7cc191ee7621b7 Leo Li               2022-03-30  5307  		     new_plane_state->fb->base.id;
7cc191ee7621b7 Leo Li               2022-03-30  5308  	bb_changed = (old_plane_state->crtc_x != new_plane_state->crtc_x ||
7cc191ee7621b7 Leo Li               2022-03-30  5309  		      old_plane_state->crtc_y != new_plane_state->crtc_y ||
7cc191ee7621b7 Leo Li               2022-03-30  5310  		      old_plane_state->crtc_w != new_plane_state->crtc_w ||
7cc191ee7621b7 Leo Li               2022-03-30  5311  		      old_plane_state->crtc_h != new_plane_state->crtc_h);
7cc191ee7621b7 Leo Li               2022-03-30  5312  
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5313  	drm_dbg(plane->dev,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5314  		"[PLANE:%d] PSR bb_changed:%d fb_changed:%d num_clips:%d\n",
7cc191ee7621b7 Leo Li               2022-03-30  5315  		new_plane_state->plane->base.id,
7cc191ee7621b7 Leo Li               2022-03-30  5316  		bb_changed, fb_changed, num_clips);
7cc191ee7621b7 Leo Li               2022-03-30  5317  
d6ed6d0d2aa8f2 Tom Chung            2023-02-01  5318  	*dirty_regions_changed = bb_changed;
d6ed6d0d2aa8f2 Tom Chung            2023-02-01  5319  
af22d6a869cc26 Hamza Mahfooz        2023-06-21  5320  	if ((num_clips + (bb_changed ? 2 : 0)) > DC_MAX_DIRTY_RECTS)
af22d6a869cc26 Hamza Mahfooz        2023-06-21  5321  		goto ffu;
af22d6a869cc26 Hamza Mahfooz        2023-06-21  5322  
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5323  	if (bb_changed) {
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5324  		fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[i],
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5325  				   new_plane_state->crtc_x,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5326  				   new_plane_state->crtc_y,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5327  				   new_plane_state->crtc_w,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5328  				   new_plane_state->crtc_h, &i, false);
7cc191ee7621b7 Leo Li               2022-03-30  5329  
7cc191ee7621b7 Leo Li               2022-03-30  5330  		/* Add old plane bounding-box if plane is moved or resized */
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5331  		fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[i],
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5332  				   old_plane_state->crtc_x,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5333  				   old_plane_state->crtc_y,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5334  				   old_plane_state->crtc_w,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5335  				   old_plane_state->crtc_h, &i, false);
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5336  	}
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5337  
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5338  	if (num_clips) {
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5339  		for (; i < num_clips; clips++)
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5340  			fill_dc_dirty_rect(new_plane_state->plane,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5341  					   &dirty_rects[i], clips->x1,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5342  					   clips->y1, clips->x2 - clips->x1,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5343  					   clips->y2 - clips->y1, &i, false);
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5344  	} else if (fb_changed && !bb_changed) {
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5345  		fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[i],
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5346  				   new_plane_state->crtc_x,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5347  				   new_plane_state->crtc_y,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5348  				   new_plane_state->crtc_w,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5349  				   new_plane_state->crtc_h, &i, false);
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5350  	}
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5351  
7cc191ee7621b7 Leo Li               2022-03-30  5352  	flip_addrs->dirty_rect_count = i;
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5353  	return;
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5354  
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5355  ffu:
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5356  	fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[0], 0, 0,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5357  			   dm_crtc_state->base.mode.crtc_hdisplay,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5358  			   dm_crtc_state->base.mode.crtc_vdisplay,
30ebe41582d1ea Hamza Mahfooz        2022-11-15  5359  			   &flip_addrs->dirty_rect_count, true);
7cc191ee7621b7 Leo Li               2022-03-30  5360  }
7cc191ee7621b7 Leo Li               2022-03-30  5361  

:::::: The code at line 5258 was first introduced by commit
:::::: 7cc191ee7621b7145c6cc9c18a4e1929bb5f136e drm/amd/display: Implement MPO PSR SU

:::::: TO: Leo Li <sunpeng.li@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
