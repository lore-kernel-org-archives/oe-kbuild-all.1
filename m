Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FBB125D0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 11:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690543593; x=1722079593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rzZjsYgybMb/ud4RPC4GjJPJ82b8K56I3SUhmhsLoQ4=;
  b=SPpCn9eltcleU+B1mKXG/JDprMg0ONlF0waNXZ0XFynY7s3kVEACSymu
   690UCsPRy+nUvfcQIVTyTGRdndYu9H6SLZCyjR5Vrug6esRZMXkvUl88m
   bKUoLTYl1uqoCMVKUeDPVWyv6Jfcx8vi0DmEoaONuRpUoT93VxoxfwL+G
   Aw/1Zexmvwk/bBhiVXrVGe2gbIe8om8jcIoB5FsBe9VI6Ge/o/GAupndQ
   xYbrczOWfFnlwghKw4hVhhGFCczshlFVh5fa4bATHsG3epaNE3eek4/Oi
   up6awB9oRDBRJgscg9l6bYL2Qjfiwb8mY0XRONXleikroeu79/BQr/L59
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348171881"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="348171881"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 04:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="704527266"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="704527266"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Jul 2023 04:26:30 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPLby-000381-1O;
	Fri, 28 Jul 2023 11:26:23 +0000
Date: Fri, 28 Jul 2023 19:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 3/4]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3707:6: warning: no
 previous prototype for function 'dc_update_planes_and_stream'
Message-ID: <202307281934.S2lynyQ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   1ceca2d225395d7793bf699197d7b9816e6f93a7
commit: 54e8cb9e85e90f5f133622cda5717946f6e2b8d7 [3/4] Revert "drm/amd/display: Add minimal pipe split transition state"
config: arm64-randconfig-r032-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281934.S2lynyQ7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281934.S2lynyQ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281934.S2lynyQ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3707:6: warning: no previous prototype for function 'dc_update_planes_and_stream' [-Wmissing-prototypes]
    3707 | bool dc_update_planes_and_stream(struct dc *dc,
         |      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3707:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3707 | bool dc_update_planes_and_stream(struct dc *dc,
         | ^
         | static 
   1 warning generated.


vim +/dc_update_planes_and_stream +3707 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c

806f5633926597 Rodrigo Siqueira 2022-06-20  3706  
806f5633926597 Rodrigo Siqueira 2022-06-20 @3707  bool dc_update_planes_and_stream(struct dc *dc,
806f5633926597 Rodrigo Siqueira 2022-06-20  3708  		struct dc_surface_update *srf_updates, int surface_count,
806f5633926597 Rodrigo Siqueira 2022-06-20  3709  		struct dc_stream_state *stream,
806f5633926597 Rodrigo Siqueira 2022-06-20  3710  		struct dc_stream_update *stream_update)
806f5633926597 Rodrigo Siqueira 2022-06-20  3711  {
806f5633926597 Rodrigo Siqueira 2022-06-20  3712  	struct dc_state *context;
806f5633926597 Rodrigo Siqueira 2022-06-20  3713  	enum surface_update_type update_type;
806f5633926597 Rodrigo Siqueira 2022-06-20  3714  	int i;
806f5633926597 Rodrigo Siqueira 2022-06-20  3715  
806f5633926597 Rodrigo Siqueira 2022-06-20  3716  	/* In cases where MPO and split or ODM are used transitions can
806f5633926597 Rodrigo Siqueira 2022-06-20  3717  	 * cause underflow. Apply stream configuration with minimal pipe
806f5633926597 Rodrigo Siqueira 2022-06-20  3718  	 * split first to avoid unsupported transitions for active pipes.
806f5633926597 Rodrigo Siqueira 2022-06-20  3719  	 */
b3c14ef1989fea Dillon Varone    2022-09-09  3720  	bool force_minimal_pipe_splitting;
b3c14ef1989fea Dillon Varone    2022-09-09  3721  	bool is_plane_addition;
806f5633926597 Rodrigo Siqueira 2022-06-20  3722  
b3c14ef1989fea Dillon Varone    2022-09-09  3723  	force_minimal_pipe_splitting = could_mpcc_tree_change_for_active_pipes(
b3c14ef1989fea Dillon Varone    2022-09-09  3724  			dc,
b3c14ef1989fea Dillon Varone    2022-09-09  3725  			stream,
b3c14ef1989fea Dillon Varone    2022-09-09  3726  			surface_count,
b3c14ef1989fea Dillon Varone    2022-09-09  3727  			&is_plane_addition);
806f5633926597 Rodrigo Siqueira 2022-06-20  3728  
806f5633926597 Rodrigo Siqueira 2022-06-20  3729  	/* on plane addition, minimal state is the current one */
806f5633926597 Rodrigo Siqueira 2022-06-20  3730  	if (force_minimal_pipe_splitting && is_plane_addition &&
806f5633926597 Rodrigo Siqueira 2022-06-20  3731  		!commit_minimal_transition_state(dc, dc->current_state))
806f5633926597 Rodrigo Siqueira 2022-06-20  3732  				return false;
806f5633926597 Rodrigo Siqueira 2022-06-20  3733  
806f5633926597 Rodrigo Siqueira 2022-06-20  3734  	if (!update_planes_and_stream_state(
806f5633926597 Rodrigo Siqueira 2022-06-20  3735  			dc,
806f5633926597 Rodrigo Siqueira 2022-06-20  3736  			srf_updates,
806f5633926597 Rodrigo Siqueira 2022-06-20  3737  			surface_count,
806f5633926597 Rodrigo Siqueira 2022-06-20  3738  			stream,
806f5633926597 Rodrigo Siqueira 2022-06-20  3739  			stream_update,
806f5633926597 Rodrigo Siqueira 2022-06-20  3740  			&update_type,
806f5633926597 Rodrigo Siqueira 2022-06-20  3741  			&context))
806f5633926597 Rodrigo Siqueira 2022-06-20  3742  		return false;
806f5633926597 Rodrigo Siqueira 2022-06-20  3743  
b3c14ef1989fea Dillon Varone    2022-09-09  3744  	/* on plane removal, minimal state is the new one */
806f5633926597 Rodrigo Siqueira 2022-06-20  3745  	if (force_minimal_pipe_splitting && !is_plane_addition) {
806f5633926597 Rodrigo Siqueira 2022-06-20  3746  		if (!commit_minimal_transition_state(dc, context)) {
806f5633926597 Rodrigo Siqueira 2022-06-20  3747  			dc_release_state(context);
806f5633926597 Rodrigo Siqueira 2022-06-20  3748  			return false;
806f5633926597 Rodrigo Siqueira 2022-06-20  3749  		}
806f5633926597 Rodrigo Siqueira 2022-06-20  3750  
806f5633926597 Rodrigo Siqueira 2022-06-20  3751  		update_type = UPDATE_TYPE_FULL;
806f5633926597 Rodrigo Siqueira 2022-06-20  3752  	}
806f5633926597 Rodrigo Siqueira 2022-06-20  3753  
806f5633926597 Rodrigo Siqueira 2022-06-20  3754  	commit_planes_for_stream(
806f5633926597 Rodrigo Siqueira 2022-06-20  3755  			dc,
806f5633926597 Rodrigo Siqueira 2022-06-20  3756  			srf_updates,
806f5633926597 Rodrigo Siqueira 2022-06-20  3757  			surface_count,
806f5633926597 Rodrigo Siqueira 2022-06-20  3758  			stream,
806f5633926597 Rodrigo Siqueira 2022-06-20  3759  			stream_update,
806f5633926597 Rodrigo Siqueira 2022-06-20  3760  			update_type,
806f5633926597 Rodrigo Siqueira 2022-06-20  3761  			context);
806f5633926597 Rodrigo Siqueira 2022-06-20  3762  
806f5633926597 Rodrigo Siqueira 2022-06-20  3763  	if (dc->current_state != context) {
806f5633926597 Rodrigo Siqueira 2022-06-20  3764  
806f5633926597 Rodrigo Siqueira 2022-06-20  3765  		/* Since memory free requires elevated IRQL, an interrupt
806f5633926597 Rodrigo Siqueira 2022-06-20  3766  		 * request is generated by mem free. If this happens
806f5633926597 Rodrigo Siqueira 2022-06-20  3767  		 * between freeing and reassigning the context, our vsync
806f5633926597 Rodrigo Siqueira 2022-06-20  3768  		 * interrupt will call into dc and cause a memory
806f5633926597 Rodrigo Siqueira 2022-06-20  3769  		 * corruption BSOD. Hence, we first reassign the context,
806f5633926597 Rodrigo Siqueira 2022-06-20  3770  		 * then free the old context.
806f5633926597 Rodrigo Siqueira 2022-06-20  3771  		 */
806f5633926597 Rodrigo Siqueira 2022-06-20  3772  
806f5633926597 Rodrigo Siqueira 2022-06-20  3773  		struct dc_state *old = dc->current_state;
806f5633926597 Rodrigo Siqueira 2022-06-20  3774  
806f5633926597 Rodrigo Siqueira 2022-06-20  3775  		dc->current_state = context;
806f5633926597 Rodrigo Siqueira 2022-06-20  3776  		dc_release_state(old);
806f5633926597 Rodrigo Siqueira 2022-06-20  3777  
806f5633926597 Rodrigo Siqueira 2022-06-20  3778  		// clear any forced full updates
806f5633926597 Rodrigo Siqueira 2022-06-20  3779  		for (i = 0; i < dc->res_pool->pipe_count; i++) {
806f5633926597 Rodrigo Siqueira 2022-06-20  3780  			struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
806f5633926597 Rodrigo Siqueira 2022-06-20  3781  
806f5633926597 Rodrigo Siqueira 2022-06-20  3782  			if (pipe_ctx->plane_state && pipe_ctx->stream == stream)
806f5633926597 Rodrigo Siqueira 2022-06-20  3783  				pipe_ctx->plane_state->force_full_update = false;
806f5633926597 Rodrigo Siqueira 2022-06-20  3784  		}
806f5633926597 Rodrigo Siqueira 2022-06-20  3785  	}
806f5633926597 Rodrigo Siqueira 2022-06-20  3786  	return true;
806f5633926597 Rodrigo Siqueira 2022-06-20  3787  }
806f5633926597 Rodrigo Siqueira 2022-06-20  3788  

:::::: The code at line 3707 was first introduced by commit
:::::: 806f5633926597e1c90460e91d578bb6d634465a UPSTREAM: drm/amd/display: Add minimal pipe split transition state

:::::: TO: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
:::::: CC: Drew Davenport <ddavenport@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
