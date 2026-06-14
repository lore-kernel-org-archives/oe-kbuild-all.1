Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D4C17BEBF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 19:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781464065; cv=none; b=nLqp/7fWTk3nQlDDX3S9cLyY4q8DU8fZ1S5u+ptteLUgqQyA33AZ7HgFM4PWqD894cFPpkb6zRCdicGz0veVwFwdqY+OkdW1tvsSvu6Y65VHW7OmJxy+BjJ2N+e8Bph0sIRjQWlKVQC/YwLK5YNT0ZRum3wqRs5huhpyU5tp8yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781464065; c=relaxed/simple;
	bh=NLbgxFgLq8EPaJkECMtXbnONf6NhSiSsF5tb393+a/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lW6Gif9lPdbdgOcO98K7LTPSonLmQcyGogwNDUAFU+o054LP2zNAiEw85BKpsvl1gz0g9FnagU0Kf/alz1taMyLeV4GqLTNDp7wHBBnXkMohWhs4N6NqO3MEY/7jYc2suv7ykai7Q3l6PfPukjjrJPU3OPYNhuQJMwwGkoo18Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1prkfSD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1prkfSD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781464063; x=1813000063;
  h=date:from:to:cc:subject:message-id;
  bh=NLbgxFgLq8EPaJkECMtXbnONf6NhSiSsF5tb393+a/I=;
  b=P1prkfSDMaXbSzlGahT21zPCr+gpzGsILhlJ4sUMlPozu5sQ0hYJIQb0
   Pmz3DCYzStEORF3oPQoJXsPJmkOSCf2WgvlTXW1u+ydUn/wvW4i5gbIwR
   NlX0BWmfJo8I8Y+S6BlMCA+Vd7iBGVOGk+0wlBDvKUz5sWdM/r9Fx8M8K
   z08Ou6wPoAmDzAHxQH4ZDLhV7RLvhCSk9R/zlaiQKjrmKZmHc+ay8Muku
   kuYr/eYLfsZBJL5SLvxUwDaJJIBKI4KbyVX7jwP4GEuD7oRF2bMy37sX7
   Ah1LeKmxYw9HOL+ZaZcl0l0KFD6aXa3WZ8QFB/x2H36PKaEnnkdi/JeXP
   Q==;
X-CSE-ConnectionGUID: nj0PIMzvSQuOZ8sofZdueA==
X-CSE-MsgGUID: s+gxZBSjQy+kyR9kGotDHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="92773512"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="92773512"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 12:07:43 -0700
X-CSE-ConnectionGUID: qL9vmVXsT3Kh+Ca66A8B1w==
X-CSE-MsgGUID: e+KR71l5TQ2uuZle1MUWtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="242918846"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jun 2026 12:07:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYqBH-00000000R8u-1wgu;
	Sun, 14 Jun 2026 19:07:39 +0000
Date: Mon, 15 Jun 2026 03:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: [linux-next:master 9856/13763]
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:235
 dcn35_disable_otg_wa() warn: inconsistent indenting
Message-ID: <202606150344.QdCtner8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: 76a2db58e95e328007043f54ac3c7336ccbee440 [9856/13763] drm/amd/display: Add FRL support to clk_mgr, dsc, hdcp
config: i386-randconfig-141-20260611 (https://download.01.org/0day-ci/archive/20260615/202606150344.QdCtner8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150344.QdCtner8-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:235 dcn35_disable_otg_wa() warn: inconsistent indenting

vim +235 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c

   152	
   153	#define TO_CLK_MGR_DCN35(clk_mgr)\
   154		container_of(clk_mgr, struct clk_mgr_dcn35, base)
   155	
   156	static int dcn35_get_active_display_cnt_wa(
   157			struct dc *dc,
   158			struct dc_state *context,
   159			int *all_active_disps)
   160	{
   161		int i, display_count = 0;
   162		bool tmds_present = false;
   163	
   164		for (i = 0; i < context->stream_count; i++) {
   165			const struct dc_stream_state *stream = context->streams[i];
   166	
   167			if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A ||
   168					stream->signal == SIGNAL_TYPE_DVI_SINGLE_LINK ||
   169					stream->signal == SIGNAL_TYPE_DVI_DUAL_LINK)
   170				tmds_present = true;
   171		}
   172	
   173		for (i = 0; i < dc->link_count; i++) {
   174			const struct dc_link *link = dc->links[i];
   175	
   176			/* abusing the fact that the dig and phy are coupled to see if the phy is enabled */
   177			if (link->link_enc && link->link_enc->funcs->is_dig_enabled &&
   178					link->link_enc->funcs->is_dig_enabled(link->link_enc))
   179				display_count++;
   180		}
   181		if (all_active_disps != NULL)
   182			*all_active_disps = display_count;
   183		/* WA for hang on HDMI after display off back on*/
   184		if (display_count == 0 && tmds_present)
   185			display_count = 1;
   186	
   187		return display_count;
   188	}
   189	void dcn35_disable_otg_wa(struct clk_mgr *clk_mgr_base, struct dc_state *context,
   190			bool safe_to_lower, bool disable)
   191	{
   192		struct dc *dc = clk_mgr_base->ctx->dc;
   193		uint8_t i;
   194	
   195		if (dc->ctx->dce_environment == DCE_ENV_DIAG)
   196			return;
   197	
   198		for (i = 0; i < dc->res_pool->pipe_count; ++i) {
   199			struct pipe_ctx *old_pipe = &dc->current_state->res_ctx.pipe_ctx[i];
   200			struct pipe_ctx *new_pipe = &context->res_ctx.pipe_ctx[i];
   201			struct clk_mgr_internal *clk_mgr_internal = TO_CLK_MGR_INTERNAL(clk_mgr_base);
   202			struct dccg *dccg = clk_mgr_internal->dccg;
   203			struct pipe_ctx *pipe = safe_to_lower
   204				? &context->res_ctx.pipe_ctx[i]
   205				: &dc->current_state->res_ctx.pipe_ctx[i];
   206			struct link_encoder *new_pipe_link_enc = new_pipe->link_res.dio_link_enc;
   207			struct link_encoder *pipe_link_enc = pipe->link_res.dio_link_enc;
   208			bool stream_changed_otg_dig_on = false;
   209			bool has_active_hpo = false;
   210	
   211			if (pipe->top_pipe || pipe->prev_odm_pipe)
   212				continue;
   213	
   214			if (!dc->config.unify_link_enc_assignment) {
   215				if (new_pipe->stream)
   216					new_pipe_link_enc = new_pipe->stream->link_enc;
   217				if (pipe->stream)
   218					pipe_link_enc = pipe->stream->link_enc;
   219			}
   220	
   221			stream_changed_otg_dig_on = old_pipe->stream && new_pipe->stream &&
   222			old_pipe->stream != new_pipe->stream &&
   223			old_pipe->stream_res.tg == new_pipe->stream_res.tg &&
   224			new_pipe_link_enc && !new_pipe->stream->dpms_off &&
   225			new_pipe_link_enc->funcs->is_dig_enabled &&
   226			new_pipe_link_enc->funcs->is_dig_enabled(
   227			new_pipe_link_enc) &&
   228			new_pipe->stream_res.stream_enc &&
   229			new_pipe->stream_res.stream_enc->funcs->is_fifo_enabled &&
   230			new_pipe->stream_res.stream_enc->funcs->is_fifo_enabled(new_pipe->stream_res.stream_enc);
   231	
   232			if (old_pipe->stream && new_pipe->stream && old_pipe->stream == new_pipe->stream) {
   233				has_active_hpo =  dccg->ctx->dc->link_srv->dp_is_128b_132b_signal(old_pipe) &&
   234				dccg->ctx->dc->link_srv->dp_is_128b_132b_signal(new_pipe);
 > 235					has_active_hpo = has_active_hpo || (old_pipe->stream->signal == SIGNAL_TYPE_HDMI_FRL &&
   236					new_pipe->stream->signal == SIGNAL_TYPE_HDMI_FRL);
   237	
   238			}
   239	
   240			if (!has_active_hpo && !stream_changed_otg_dig_on && pipe->stream &&
   241			    (pipe->stream->dpms_off || dc_is_virtual_signal(pipe->stream->signal) || !pipe_link_enc) &&
   242			    !dccg->ctx->dc->link_srv->dp_is_128b_132b_signal(pipe)) {
   243				/* This w/a should not trigger when we have a dig active */
   244				if (disable) {
   245					if (pipe->stream_res.tg && pipe->stream_res.tg->funcs->immediate_disable_crtc)
   246						pipe->stream_res.tg->funcs->immediate_disable_crtc(pipe->stream_res.tg);
   247	
   248					reset_sync_context_for_pipe(dc, context, i);
   249				} else {
   250					pipe->stream_res.tg->funcs->enable_crtc(pipe->stream_res.tg);
   251				}
   252			}
   253		}
   254	}
   255	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
