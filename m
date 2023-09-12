Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BC79463
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 18:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694542754; x=1726078754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2UxA+Q69PrniCtjPt83bV3fajFiXntUEtjTUOXUhCeU=;
  b=bZa3ZVyZFhrao+tjy5YdIwjXeQ1CrWPtDiKCSbjd3DHxjKYZToDifsNq
   tLTxoPj+Ks8e9EysCK5/K3yRHQ8FelpCpUkl2rPArNLrvAKlegixH90J5
   ZpzttcrI8nsTFVieCG/Z5FOe9whxSeM+bMFz0jGMC6CIjSEoqvL9el7c+
   1JyZrHyFhN7gwFvSGwEIXytdfBtCN/bjj2ejdA00+i0SeaQh8ZJ7WHL0b
   uVD/oukDiCv+NnXFV1fQyCuGIxkZrmYLdA7+f6KnA0uX9I7qbBXE3bljG
   kFkQB9eV8kSSgCkob4wuYFUffpEPyhSl7Y7Y1RRq69o0kTjePW41td1Yd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="378365206"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="378365206"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 11:19:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="743805471"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="743805471"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 12 Sep 2023 11:19:11 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg7yf-00006c-2Q;
	Tue, 12 Sep 2023 18:19:09 +0000
Date: Wed, 13 Sep 2023 02:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: Wenjing Liu <wenjing.liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Dillon Varone <dillon.varone@amd.com>
Subject: [linux-next:master 4250/4552]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3887: warning: Function
 parameter or member 'srf_updates' not described in
 'could_mpcc_tree_change_for_active_pipes'
Message-ID: <202309130213.mSR7X2jZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3c13c772fc233a10342c8e1605ff0855dfdf0c89
commit: 77aac4c2801f44dd9124713832727dcca13ce75e [4250/4552] drm/amd/display: only allow ODM power optimization if surface is within guaranteed viewport size
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230913/202309130213.mSR7X2jZ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130213.mSR7X2jZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130213.mSR7X2jZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3887: warning: Function parameter or member 'srf_updates' not described in 'could_mpcc_tree_change_for_active_pipes'


vim +3887 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c

4562236b3bc0a2 Harry Wentland   2017-09-12  3862  
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3863  /**
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3864   * could_mpcc_tree_change_for_active_pipes - Check if an OPP associated with MPCC might change
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3865   *
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3866   * @dc: Used to get the current state status
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3867   * @stream: Target stream, which we want to remove the attached planes
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3868   * @surface_count: Number of surface update
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3869   * @is_plane_addition: [in] Fill out with true if it is a plane addition case
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3870   *
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3871   * DCN32x and newer support a feature named Dynamic ODM which can conflict with
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3872   * the MPO if used simultaneously in some specific configurations (e.g.,
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3873   * 4k@144). This function checks if the incoming context requires applying a
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3874   * transition state with unnecessary pipe splitting and ODM disabled to
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3875   * circumvent our hardware limitations to prevent this edge case. If the OPP
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3876   * associated with an MPCC might change due to plane additions, this function
1e939ea1bf4917 Dillon Varone    2022-09-09  3877   * returns true.
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3878   *
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3879   * Return:
6a0114e0e31cdf Rodrigo Siqueira 2022-10-20  3880   * Return true if OPP and MPCC might change, otherwise, return false.
1e939ea1bf4917 Dillon Varone    2022-09-09  3881   */
1e939ea1bf4917 Dillon Varone    2022-09-09  3882  static bool could_mpcc_tree_change_for_active_pipes(struct dc *dc,
1e939ea1bf4917 Dillon Varone    2022-09-09  3883  		struct dc_stream_state *stream,
77aac4c2801f44 Wenjing Liu      2023-08-23  3884  		struct dc_surface_update *srf_updates,
1e939ea1bf4917 Dillon Varone    2022-09-09  3885  		int surface_count,
1e939ea1bf4917 Dillon Varone    2022-09-09  3886  		bool *is_plane_addition)
1e939ea1bf4917 Dillon Varone    2022-09-09 @3887  {
1e939ea1bf4917 Dillon Varone    2022-09-09  3888  
1e939ea1bf4917 Dillon Varone    2022-09-09  3889  	struct dc_stream_status *cur_stream_status = stream_get_status(dc->current_state, stream);
1e939ea1bf4917 Dillon Varone    2022-09-09  3890  	bool force_minimal_pipe_splitting = false;
ae7169a9a2edf9 Alvin Lee        2022-11-07  3891  	bool subvp_active = false;
ae7169a9a2edf9 Alvin Lee        2022-11-07  3892  	uint32_t i;
1e939ea1bf4917 Dillon Varone    2022-09-09  3893  
1e939ea1bf4917 Dillon Varone    2022-09-09  3894  	*is_plane_addition = false;
1e939ea1bf4917 Dillon Varone    2022-09-09  3895  
1e939ea1bf4917 Dillon Varone    2022-09-09  3896  	if (cur_stream_status &&
1e939ea1bf4917 Dillon Varone    2022-09-09  3897  			dc->current_state->stream_count > 0 &&
1e939ea1bf4917 Dillon Varone    2022-09-09  3898  			dc->debug.pipe_split_policy != MPC_SPLIT_AVOID) {
1e939ea1bf4917 Dillon Varone    2022-09-09  3899  		/* determine if minimal transition is required due to MPC*/
1e939ea1bf4917 Dillon Varone    2022-09-09  3900  		if (surface_count > 0) {
1e939ea1bf4917 Dillon Varone    2022-09-09  3901  			if (cur_stream_status->plane_count > surface_count) {
1e939ea1bf4917 Dillon Varone    2022-09-09  3902  				force_minimal_pipe_splitting = true;
1e939ea1bf4917 Dillon Varone    2022-09-09  3903  			} else if (cur_stream_status->plane_count < surface_count) {
1e939ea1bf4917 Dillon Varone    2022-09-09  3904  				force_minimal_pipe_splitting = true;
1e939ea1bf4917 Dillon Varone    2022-09-09  3905  				*is_plane_addition = true;
1e939ea1bf4917 Dillon Varone    2022-09-09  3906  			}
1e939ea1bf4917 Dillon Varone    2022-09-09  3907  		}
1e939ea1bf4917 Dillon Varone    2022-09-09  3908  	}
1e939ea1bf4917 Dillon Varone    2022-09-09  3909  
1e939ea1bf4917 Dillon Varone    2022-09-09  3910  	if (cur_stream_status &&
1e939ea1bf4917 Dillon Varone    2022-09-09  3911  			dc->current_state->stream_count == 1 &&
1e939ea1bf4917 Dillon Varone    2022-09-09  3912  			dc->debug.enable_single_display_2to1_odm_policy) {
1e939ea1bf4917 Dillon Varone    2022-09-09  3913  		/* determine if minimal transition is required due to dynamic ODM*/
1e939ea1bf4917 Dillon Varone    2022-09-09  3914  		if (surface_count > 0) {
1e939ea1bf4917 Dillon Varone    2022-09-09  3915  			if (cur_stream_status->plane_count > 2 && cur_stream_status->plane_count > surface_count) {
1e939ea1bf4917 Dillon Varone    2022-09-09  3916  				force_minimal_pipe_splitting = true;
1e939ea1bf4917 Dillon Varone    2022-09-09  3917  			} else if (surface_count > 2 && cur_stream_status->plane_count < surface_count) {
1e939ea1bf4917 Dillon Varone    2022-09-09  3918  				force_minimal_pipe_splitting = true;
1e939ea1bf4917 Dillon Varone    2022-09-09  3919  				*is_plane_addition = true;
1e939ea1bf4917 Dillon Varone    2022-09-09  3920  			}
1e939ea1bf4917 Dillon Varone    2022-09-09  3921  		}
77aac4c2801f44 Wenjing Liu      2023-08-23  3922  		if (dc->config.enable_windowed_mpo_odm) {
77aac4c2801f44 Wenjing Liu      2023-08-23  3923  			const struct rect *guaranteed_viewport = &stream->src;
77aac4c2801f44 Wenjing Liu      2023-08-23  3924  			const struct rect *surface_src, *surface_dst;
77aac4c2801f44 Wenjing Liu      2023-08-23  3925  			bool are_cur_planes_guaranteed = true;
77aac4c2801f44 Wenjing Liu      2023-08-23  3926  			bool are_new_planes_guaranteed = true;
77aac4c2801f44 Wenjing Liu      2023-08-23  3927  
77aac4c2801f44 Wenjing Liu      2023-08-23  3928  			for (i = 0; i < cur_stream_status->plane_count; i++) {
77aac4c2801f44 Wenjing Liu      2023-08-23  3929  				surface_src = &cur_stream_status->plane_states[i]->src_rect;
77aac4c2801f44 Wenjing Liu      2023-08-23  3930  				surface_dst = &cur_stream_status->plane_states[i]->dst_rect;
77aac4c2801f44 Wenjing Liu      2023-08-23  3931  				if ((surface_src->height > surface_dst->height && surface_src->height > guaranteed_viewport->height) ||
77aac4c2801f44 Wenjing Liu      2023-08-23  3932  						(surface_src->width > surface_dst->width && surface_src->width > guaranteed_viewport->width))
77aac4c2801f44 Wenjing Liu      2023-08-23  3933  					are_cur_planes_guaranteed = false;
77aac4c2801f44 Wenjing Liu      2023-08-23  3934  			}
77aac4c2801f44 Wenjing Liu      2023-08-23  3935  
77aac4c2801f44 Wenjing Liu      2023-08-23  3936  			for (i = 0; i < surface_count; i++) {
77aac4c2801f44 Wenjing Liu      2023-08-23  3937  				if (srf_updates[i].scaling_info) {
77aac4c2801f44 Wenjing Liu      2023-08-23  3938  					surface_src = &srf_updates[i].scaling_info->src_rect;
77aac4c2801f44 Wenjing Liu      2023-08-23  3939  					surface_dst = &srf_updates[i].scaling_info->dst_rect;
77aac4c2801f44 Wenjing Liu      2023-08-23  3940  				} else {
77aac4c2801f44 Wenjing Liu      2023-08-23  3941  					surface_src = &srf_updates[i].surface->src_rect;
77aac4c2801f44 Wenjing Liu      2023-08-23  3942  					surface_dst = &srf_updates[i].surface->dst_rect;
77aac4c2801f44 Wenjing Liu      2023-08-23  3943  				}
77aac4c2801f44 Wenjing Liu      2023-08-23  3944  				if ((surface_src->height > surface_dst->height && surface_src->height > guaranteed_viewport->height) ||
77aac4c2801f44 Wenjing Liu      2023-08-23  3945  						(surface_src->width > surface_dst->width && surface_src->width > guaranteed_viewport->width))
77aac4c2801f44 Wenjing Liu      2023-08-23  3946  					are_new_planes_guaranteed = false;
77aac4c2801f44 Wenjing Liu      2023-08-23  3947  			}
77aac4c2801f44 Wenjing Liu      2023-08-23  3948  
77aac4c2801f44 Wenjing Liu      2023-08-23  3949  			if (are_cur_planes_guaranteed && !are_new_planes_guaranteed) {
77aac4c2801f44 Wenjing Liu      2023-08-23  3950  				force_minimal_pipe_splitting = true;
77aac4c2801f44 Wenjing Liu      2023-08-23  3951  				*is_plane_addition = true;
77aac4c2801f44 Wenjing Liu      2023-08-23  3952  			} else if (!are_cur_planes_guaranteed && are_new_planes_guaranteed) {
77aac4c2801f44 Wenjing Liu      2023-08-23  3953  				force_minimal_pipe_splitting = true;
77aac4c2801f44 Wenjing Liu      2023-08-23  3954  			}
77aac4c2801f44 Wenjing Liu      2023-08-23  3955  		}
1e939ea1bf4917 Dillon Varone    2022-09-09  3956  	}
1e939ea1bf4917 Dillon Varone    2022-09-09  3957  
ae7169a9a2edf9 Alvin Lee        2022-11-07  3958  	for (i = 0; i < dc->res_pool->pipe_count; i++) {
ae7169a9a2edf9 Alvin Lee        2022-11-07  3959  		struct pipe_ctx *pipe = &dc->current_state->res_ctx.pipe_ctx[i];
ae7169a9a2edf9 Alvin Lee        2022-11-07  3960  
ae7169a9a2edf9 Alvin Lee        2022-11-07  3961  		if (pipe->stream && pipe->stream->mall_stream_config.type != SUBVP_NONE) {
ae7169a9a2edf9 Alvin Lee        2022-11-07  3962  			subvp_active = true;
ae7169a9a2edf9 Alvin Lee        2022-11-07  3963  			break;
ae7169a9a2edf9 Alvin Lee        2022-11-07  3964  		}
ae7169a9a2edf9 Alvin Lee        2022-11-07  3965  	}
ae7169a9a2edf9 Alvin Lee        2022-11-07  3966  
e4c1b01bc35b04 Alvin Lee        2022-11-02  3967  	/* For SubVP when adding or removing planes we need to add a minimal transition
e4c1b01bc35b04 Alvin Lee        2022-11-02  3968  	 * (even when disabling all planes). Whenever disabling a phantom pipe, we
e4c1b01bc35b04 Alvin Lee        2022-11-02  3969  	 * must use the minimal transition path to disable the pipe correctly.
ae7169a9a2edf9 Alvin Lee        2022-11-07  3970  	 *
ae7169a9a2edf9 Alvin Lee        2022-11-07  3971  	 * We want to use the minimal transition whenever subvp is active, not only if
ae7169a9a2edf9 Alvin Lee        2022-11-07  3972  	 * a plane is being added / removed from a subvp stream (MPO plane can be added
ae7169a9a2edf9 Alvin Lee        2022-11-07  3973  	 * to a DRR pipe of SubVP + DRR config, in which case we still want to run through
ae7169a9a2edf9 Alvin Lee        2022-11-07  3974  	 * a min transition to disable subvp.
380202c84454e8 Alvin Lee        2022-09-21  3975  	 */
ae7169a9a2edf9 Alvin Lee        2022-11-07  3976  	if (cur_stream_status && subvp_active) {
380202c84454e8 Alvin Lee        2022-09-21  3977  		/* determine if minimal transition is required due to SubVP*/
380202c84454e8 Alvin Lee        2022-09-21  3978  		if (cur_stream_status->plane_count > surface_count) {
380202c84454e8 Alvin Lee        2022-09-21  3979  			force_minimal_pipe_splitting = true;
380202c84454e8 Alvin Lee        2022-09-21  3980  		} else if (cur_stream_status->plane_count < surface_count) {
380202c84454e8 Alvin Lee        2022-09-21  3981  			force_minimal_pipe_splitting = true;
380202c84454e8 Alvin Lee        2022-09-21  3982  			*is_plane_addition = true;
380202c84454e8 Alvin Lee        2022-09-21  3983  		}
380202c84454e8 Alvin Lee        2022-09-21  3984  	}
380202c84454e8 Alvin Lee        2022-09-21  3985  
1e939ea1bf4917 Dillon Varone    2022-09-09  3986  	return force_minimal_pipe_splitting;
1e939ea1bf4917 Dillon Varone    2022-09-09  3987  }
1e939ea1bf4917 Dillon Varone    2022-09-09  3988  

:::::: The code at line 3887 was first introduced by commit
:::::: 1e939ea1bf4917095575fe4ff1a42578ff234605 drm/amd/display: Fix various dynamic ODM transitions on DCN32

:::::: TO: Dillon Varone <Dillon.Varone@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
