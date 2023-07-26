Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637A0C12E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 10:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690367586; x=1721903586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xjgElmNl/SK8Md7YqUQtckRg3szNaT1UDfKjET0pfkg=;
  b=Wwt5J1gFSTQeVdwMYm4aeotMe/RpJutqj5JOCyU7+CSu0UDpMqZMYQzU
   ZV9IWPPpCVnJFuQOxWf/fJQwWJ8/lrbR51dhmYenzEGRtndcGlixWdLNZ
   vadKGDyA/B5CLVhvpgvEkC9JFiHl+xtYG6kIdPaHQlNnXGRSr8qjs3hGv
   vY0jBgBBCSQqqu5VGzAkpqRZOvmVSRWZ+nxEuFq6wpqoRPGoKDcl2rB3e
   GrQwIgrM1YRugDXE32Y4/urdznchByhu02OTElxPP1ugHnohbs5nj9Kzj
   uJaQUpE+ZxSOPizwe85Urvxi3sTtCFV5dq6R4cRfR2iTQmeyLFCIfOQ1r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="454354086"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="454354086"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 03:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="726490340"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="726490340"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 26 Jul 2023 03:33:04 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qObpH-0000tY-16;
	Wed, 26 Jul 2023 10:33:03 +0000
Date: Wed, 26 Jul 2023 18:32:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 209/244]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:2314:31:
 error: 'struct hwseq_private_funcs' has no member named
 'resync_fifo_dccg_dio'
Message-ID: <202307261827.O73vUs1N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   d93c12687a7e61eb154b84d965a63d2e1d36f01a
commit: a3abf90e6c527448904dd39e1c64cd6d8cbfa2b9 [209/244] drm/amd/display: Trigger DIO FIFO resync on commit streams
config: microblaze-randconfig-r031-20230726 (https://download.01.org/0day-ci/archive/20230726/202307261827.O73vUs1N-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261827.O73vUs1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261827.O73vUs1N-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:35,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:26:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c: In function 'dce110_apply_ctx_to_hw':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:2314:31: error: 'struct hwseq_private_funcs' has no member named 'resync_fifo_dccg_dio'
    2314 |                 if (hws->funcs.resync_fifo_dccg_dio)
         |                               ^
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:2314:17: note: in expansion of macro 'if'
    2314 |                 if (hws->funcs.resync_fifo_dccg_dio)
         |                 ^~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:2314:31: error: 'struct hwseq_private_funcs' has no member named 'resync_fifo_dccg_dio'
    2314 |                 if (hws->funcs.resync_fifo_dccg_dio)
         |                               ^
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:2314:17: note: in expansion of macro 'if'
    2314 |                 if (hws->funcs.resync_fifo_dccg_dio)
         |                 ^~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:2314:31: error: 'struct hwseq_private_funcs' has no member named 'resync_fifo_dccg_dio'
    2314 |                 if (hws->funcs.resync_fifo_dccg_dio)
         |                               ^
   include/linux/compiler.h:69:10: note: in definition of macro '__trace_if_value'
      69 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:2314:17: note: in expansion of macro 'if'
    2314 |                 if (hws->funcs.resync_fifo_dccg_dio)
         |                 ^~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:2315:35: error: 'struct hwseq_private_funcs' has no member named 'resync_fifo_dccg_dio'
    2315 |                         hws->funcs.resync_fifo_dccg_dio(hws, dc, context);
         |                                   ^
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:29:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h: At top level:
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


vim +2314 drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c

  2236	
  2237	enum dc_status dce110_apply_ctx_to_hw(
  2238			struct dc *dc,
  2239			struct dc_state *context)
  2240	{
  2241		struct dce_hwseq *hws = dc->hwseq;
  2242		struct dc_bios *dcb = dc->ctx->dc_bios;
  2243		enum dc_status status;
  2244		int i;
  2245	
  2246		/* reset syncd pipes from disabled pipes */
  2247		if (dc->config.use_pipe_ctx_sync_logic)
  2248			reset_syncd_pipes_from_disabled_pipes(dc, context);
  2249	
  2250		/* Reset old context */
  2251		/* look up the targets that have been removed since last commit */
  2252		hws->funcs.reset_hw_ctx_wrap(dc, context);
  2253	
  2254		/* Skip applying if no targets */
  2255		if (context->stream_count <= 0)
  2256			return DC_OK;
  2257	
  2258		/* Apply new context */
  2259		dcb->funcs->set_scratch_critical_state(dcb, true);
  2260	
  2261		/* below is for real asic only */
  2262		for (i = 0; i < dc->res_pool->pipe_count; i++) {
  2263			struct pipe_ctx *pipe_ctx_old =
  2264						&dc->current_state->res_ctx.pipe_ctx[i];
  2265			struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
  2266	
  2267			if (pipe_ctx->stream == NULL || pipe_ctx->top_pipe)
  2268				continue;
  2269	
  2270			if (pipe_ctx->stream == pipe_ctx_old->stream) {
  2271				if (pipe_ctx_old->clock_source != pipe_ctx->clock_source)
  2272					dce_crtc_switch_to_clk_src(dc->hwseq,
  2273							pipe_ctx->clock_source, i);
  2274				continue;
  2275			}
  2276	
  2277			hws->funcs.enable_display_power_gating(
  2278					dc, i, dc->ctx->dc_bios,
  2279					PIPE_GATING_CONTROL_DISABLE);
  2280		}
  2281	
  2282		if (dc->fbc_compressor)
  2283			dc->fbc_compressor->funcs->disable_fbc(dc->fbc_compressor);
  2284	
  2285		dce110_setup_audio_dto(dc, context);
  2286	
  2287		for (i = 0; i < dc->res_pool->pipe_count; i++) {
  2288			struct pipe_ctx *pipe_ctx_old =
  2289						&dc->current_state->res_ctx.pipe_ctx[i];
  2290			struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
  2291	
  2292			if (pipe_ctx->stream == NULL)
  2293				continue;
  2294	
  2295			if (pipe_ctx->stream == pipe_ctx_old->stream &&
  2296				pipe_ctx->stream->link->link_state_valid) {
  2297				continue;
  2298			}
  2299	
  2300			if (pipe_ctx_old->stream && !pipe_need_reprogram(pipe_ctx_old, pipe_ctx))
  2301				continue;
  2302	
  2303			if (pipe_ctx->top_pipe || pipe_ctx->prev_odm_pipe)
  2304				continue;
  2305	
  2306			status = apply_single_controller_ctx_to_hw(
  2307					pipe_ctx,
  2308					context,
  2309					dc);
  2310	
  2311			if (DC_OK != status)
  2312				return status;
  2313	
> 2314			if (hws->funcs.resync_fifo_dccg_dio)
  2315				hws->funcs.resync_fifo_dccg_dio(hws, dc, context);
  2316		}
  2317	
  2318		if (dc->fbc_compressor)
  2319			enable_fbc(dc, dc->current_state);
  2320	
  2321		dcb->funcs->set_scratch_critical_state(dcb, false);
  2322	
  2323		return DC_OK;
  2324	}
  2325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
