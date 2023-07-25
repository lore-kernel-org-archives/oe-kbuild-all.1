Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16B54C71
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 03:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690255508; x=1721791508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+4ozc+U3TQTZyGswsmiq6YCwMpcrUjycnPQF1yMfYGQ=;
  b=a+hyOc1fs/pElpQ8R+vpVmkMg0cJ+FkuQMGS/fuXc77pdoA+BW2O64Kd
   E1fu9DvST+X2Dvxk68q3Qf7i/kDtcLkkmiGFmJKz1j7IK55hmO1hFiv02
   qC2p+QtOXbTcQf+lRatKDonki6eqwUfVIpwlEtlXmSY6mugffoBn70V70
   etDuusOOJPbdgzOgvD92Xi/mqUZLbZ/gyvflkgkhTC8KJnh6+Jdf7gUnT
   ECdXZAGN4SimDEYdCrLNLYpvpVwVXmRi8mEDWV1XSdM4yu02No7AAns+6
   S6/aXvE7m64PvY6rWXZ0KMuA/MPzwQZMajlDhK8R2ZM8LgHyKDUMwtX+G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="370276120"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="370276120"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 20:25:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="816091338"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="816091338"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jul 2023 20:25:05 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO8fQ-000AGr-0W;
	Tue, 25 Jul 2023 03:24:59 +0000
Date: Tue, 25 Jul 2023 11:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 3/4]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3707:6: warning: no
 previous prototype for 'dc_update_planes_and_stream'
Message-ID: <202307251119.tW9SbGzw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   c33f6e5d4168f1082422249876e2335f6322e740
commit: 54e8cb9e85e90f5f133622cda5717946f6e2b8d7 [3/4] Revert "drm/amd/display: Add minimal pipe split transition state"
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230725/202307251119.tW9SbGzw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251119.tW9SbGzw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251119.tW9SbGzw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3707:6: warning: no previous prototype for 'dc_update_planes_and_stream' [-Wmissing-prototypes]
    3707 | bool dc_update_planes_and_stream(struct dc *dc,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:30:
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


vim +/dc_update_planes_and_stream +3707 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c

806f5633926597e Rodrigo Siqueira 2022-06-20  3706  
806f5633926597e Rodrigo Siqueira 2022-06-20 @3707  bool dc_update_planes_and_stream(struct dc *dc,
806f5633926597e Rodrigo Siqueira 2022-06-20  3708  		struct dc_surface_update *srf_updates, int surface_count,
806f5633926597e Rodrigo Siqueira 2022-06-20  3709  		struct dc_stream_state *stream,
806f5633926597e Rodrigo Siqueira 2022-06-20  3710  		struct dc_stream_update *stream_update)
806f5633926597e Rodrigo Siqueira 2022-06-20  3711  {
806f5633926597e Rodrigo Siqueira 2022-06-20  3712  	struct dc_state *context;
806f5633926597e Rodrigo Siqueira 2022-06-20  3713  	enum surface_update_type update_type;
806f5633926597e Rodrigo Siqueira 2022-06-20  3714  	int i;
806f5633926597e Rodrigo Siqueira 2022-06-20  3715  
806f5633926597e Rodrigo Siqueira 2022-06-20  3716  	/* In cases where MPO and split or ODM are used transitions can
806f5633926597e Rodrigo Siqueira 2022-06-20  3717  	 * cause underflow. Apply stream configuration with minimal pipe
806f5633926597e Rodrigo Siqueira 2022-06-20  3718  	 * split first to avoid unsupported transitions for active pipes.
806f5633926597e Rodrigo Siqueira 2022-06-20  3719  	 */
b3c14ef1989fead Dillon Varone    2022-09-09  3720  	bool force_minimal_pipe_splitting;
b3c14ef1989fead Dillon Varone    2022-09-09  3721  	bool is_plane_addition;
806f5633926597e Rodrigo Siqueira 2022-06-20  3722  
b3c14ef1989fead Dillon Varone    2022-09-09  3723  	force_minimal_pipe_splitting = could_mpcc_tree_change_for_active_pipes(
b3c14ef1989fead Dillon Varone    2022-09-09  3724  			dc,
b3c14ef1989fead Dillon Varone    2022-09-09  3725  			stream,
b3c14ef1989fead Dillon Varone    2022-09-09  3726  			surface_count,
b3c14ef1989fead Dillon Varone    2022-09-09  3727  			&is_plane_addition);
806f5633926597e Rodrigo Siqueira 2022-06-20  3728  
806f5633926597e Rodrigo Siqueira 2022-06-20  3729  	/* on plane addition, minimal state is the current one */
806f5633926597e Rodrigo Siqueira 2022-06-20  3730  	if (force_minimal_pipe_splitting && is_plane_addition &&
806f5633926597e Rodrigo Siqueira 2022-06-20  3731  		!commit_minimal_transition_state(dc, dc->current_state))
806f5633926597e Rodrigo Siqueira 2022-06-20  3732  				return false;
806f5633926597e Rodrigo Siqueira 2022-06-20  3733  
806f5633926597e Rodrigo Siqueira 2022-06-20  3734  	if (!update_planes_and_stream_state(
806f5633926597e Rodrigo Siqueira 2022-06-20  3735  			dc,
806f5633926597e Rodrigo Siqueira 2022-06-20  3736  			srf_updates,
806f5633926597e Rodrigo Siqueira 2022-06-20  3737  			surface_count,
806f5633926597e Rodrigo Siqueira 2022-06-20  3738  			stream,
806f5633926597e Rodrigo Siqueira 2022-06-20  3739  			stream_update,
806f5633926597e Rodrigo Siqueira 2022-06-20  3740  			&update_type,
806f5633926597e Rodrigo Siqueira 2022-06-20  3741  			&context))
806f5633926597e Rodrigo Siqueira 2022-06-20  3742  		return false;
806f5633926597e Rodrigo Siqueira 2022-06-20  3743  
b3c14ef1989fead Dillon Varone    2022-09-09  3744  	/* on plane removal, minimal state is the new one */
806f5633926597e Rodrigo Siqueira 2022-06-20  3745  	if (force_minimal_pipe_splitting && !is_plane_addition) {
806f5633926597e Rodrigo Siqueira 2022-06-20  3746  		if (!commit_minimal_transition_state(dc, context)) {
806f5633926597e Rodrigo Siqueira 2022-06-20  3747  			dc_release_state(context);
806f5633926597e Rodrigo Siqueira 2022-06-20  3748  			return false;
806f5633926597e Rodrigo Siqueira 2022-06-20  3749  		}
806f5633926597e Rodrigo Siqueira 2022-06-20  3750  
806f5633926597e Rodrigo Siqueira 2022-06-20  3751  		update_type = UPDATE_TYPE_FULL;
806f5633926597e Rodrigo Siqueira 2022-06-20  3752  	}
806f5633926597e Rodrigo Siqueira 2022-06-20  3753  
806f5633926597e Rodrigo Siqueira 2022-06-20  3754  	commit_planes_for_stream(
806f5633926597e Rodrigo Siqueira 2022-06-20  3755  			dc,
806f5633926597e Rodrigo Siqueira 2022-06-20  3756  			srf_updates,
806f5633926597e Rodrigo Siqueira 2022-06-20  3757  			surface_count,
806f5633926597e Rodrigo Siqueira 2022-06-20  3758  			stream,
806f5633926597e Rodrigo Siqueira 2022-06-20  3759  			stream_update,
806f5633926597e Rodrigo Siqueira 2022-06-20  3760  			update_type,
806f5633926597e Rodrigo Siqueira 2022-06-20  3761  			context);
806f5633926597e Rodrigo Siqueira 2022-06-20  3762  
806f5633926597e Rodrigo Siqueira 2022-06-20  3763  	if (dc->current_state != context) {
806f5633926597e Rodrigo Siqueira 2022-06-20  3764  
806f5633926597e Rodrigo Siqueira 2022-06-20  3765  		/* Since memory free requires elevated IRQL, an interrupt
806f5633926597e Rodrigo Siqueira 2022-06-20  3766  		 * request is generated by mem free. If this happens
806f5633926597e Rodrigo Siqueira 2022-06-20  3767  		 * between freeing and reassigning the context, our vsync
806f5633926597e Rodrigo Siqueira 2022-06-20  3768  		 * interrupt will call into dc and cause a memory
806f5633926597e Rodrigo Siqueira 2022-06-20  3769  		 * corruption BSOD. Hence, we first reassign the context,
806f5633926597e Rodrigo Siqueira 2022-06-20  3770  		 * then free the old context.
806f5633926597e Rodrigo Siqueira 2022-06-20  3771  		 */
806f5633926597e Rodrigo Siqueira 2022-06-20  3772  
806f5633926597e Rodrigo Siqueira 2022-06-20  3773  		struct dc_state *old = dc->current_state;
806f5633926597e Rodrigo Siqueira 2022-06-20  3774  
806f5633926597e Rodrigo Siqueira 2022-06-20  3775  		dc->current_state = context;
806f5633926597e Rodrigo Siqueira 2022-06-20  3776  		dc_release_state(old);
806f5633926597e Rodrigo Siqueira 2022-06-20  3777  
806f5633926597e Rodrigo Siqueira 2022-06-20  3778  		// clear any forced full updates
806f5633926597e Rodrigo Siqueira 2022-06-20  3779  		for (i = 0; i < dc->res_pool->pipe_count; i++) {
806f5633926597e Rodrigo Siqueira 2022-06-20  3780  			struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
806f5633926597e Rodrigo Siqueira 2022-06-20  3781  
806f5633926597e Rodrigo Siqueira 2022-06-20  3782  			if (pipe_ctx->plane_state && pipe_ctx->stream == stream)
806f5633926597e Rodrigo Siqueira 2022-06-20  3783  				pipe_ctx->plane_state->force_full_update = false;
806f5633926597e Rodrigo Siqueira 2022-06-20  3784  		}
806f5633926597e Rodrigo Siqueira 2022-06-20  3785  	}
806f5633926597e Rodrigo Siqueira 2022-06-20  3786  	return true;
806f5633926597e Rodrigo Siqueira 2022-06-20  3787  }
806f5633926597e Rodrigo Siqueira 2022-06-20  3788  

:::::: The code at line 3707 was first introduced by commit
:::::: 806f5633926597e1c90460e91d578bb6d634465a UPSTREAM: drm/amd/display: Add minimal pipe split transition state

:::::: TO: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
:::::: CC: Drew Davenport <ddavenport@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
