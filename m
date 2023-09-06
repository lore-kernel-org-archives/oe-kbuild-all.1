Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA4C376
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 00:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693960538; x=1725496538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5qySARsvlZosY4P9OJqFFblEpNcfQm1UzmvRTfu8Fus=;
  b=du4Cv3acL/GZnhmTNk4OBwYktf6MwAhOzRCYA+AsZVXKPHC2Xaz0+a8r
   YqfJSU3b5hy7kZBBUYdyddRJFi6Uiuocr11epXtH8qZNKJP1i3NQNbkSP
   uFBgTfAO1hSnHI8xzk6xNiC1Wq3yFGOcFcHL1rV8huBAz1qwLu4SjI+Zz
   xOu2Dy4ju4LYHyBRjvbK9zG+5n4Opu/GHGjDIRoBeCnox3o6ZFjSAivg5
   NhWG+ntVzixKc1clOHjHGO2attUegE+Kg553bsFWCM5PJNnJNulI3CQm2
   GREU6R1jCpYfI/5wd1haO/38FocSUWjfzAKEGPDx7wGvIo/cxie6Aa5ez
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="379652607"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="379652607"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 17:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="915066869"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="915066869"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Sep 2023 17:35:36 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdgW1-0002Gk-1r;
	Wed, 06 Sep 2023 00:35:30 +0000
Date: Wed, 6 Sep 2023 08:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 13320/13985]
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:292
 dcn35_update_clocks() warn: inconsistent indenting
Message-ID: <202309060824.qUfQMteL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c50216cfa084d5eb67dc10e646a3283da1595bb6
commit: 8774029f76b9806f2f3586bb0502408076767fd5 [13320/13985] drm/amd/display: Add DCN35 CLK_MGR
config: i386-randconfig-141-20230905 (https://download.01.org/0day-ci/archive/20230906/202309060824.qUfQMteL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230906/202309060824.qUfQMteL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060824.qUfQMteL-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:292 dcn35_update_clocks() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:919 dcn35_clk_mgr_construct() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:980 dcn35_clk_mgr_construct() warn: variable dereferenced before check 'ctx->dc_bios' (see line 913)
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:980 dcn35_clk_mgr_construct() warn: variable dereferenced before check 'ctx->dc_bios->integrated_info' (see line 913)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:921 dcn35_clk_mgr_construct() warn: inconsistent indenting

vim +292 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c

   213	
   214	void dcn35_update_clocks(struct clk_mgr *clk_mgr_base,
   215				struct dc_state *context,
   216				bool safe_to_lower)
   217	{
   218		union dmub_rb_cmd cmd;
   219		struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
   220		struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
   221		struct dc *dc = clk_mgr_base->ctx->dc;
   222		int display_count;
   223		bool update_dppclk = false;
   224		bool update_dispclk = false;
   225		bool dpp_clock_lowered = false;
   226	
   227		if (dc->work_arounds.skip_clock_update)
   228			return;
   229	
   230		/*
   231		 * if it is safe to lower, but we are already in the lower state, we don't have to do anything
   232		 * also if safe to lower is false, we just go in the higher state
   233		 */
   234		if (safe_to_lower) {
   235			if (new_clocks->zstate_support != DCN_ZSTATE_SUPPORT_DISALLOW &&
   236					new_clocks->zstate_support != clk_mgr_base->clks.zstate_support) {
   237				dcn35_smu_set_zstate_support(clk_mgr, new_clocks->zstate_support);
   238				dm_helpers_enable_periodic_detection(clk_mgr_base->ctx, true);
   239				clk_mgr_base->clks.zstate_support = new_clocks->zstate_support;
   240			}
   241	
   242			if (clk_mgr_base->clks.dtbclk_en && !new_clocks->dtbclk_en) {
   243				dcn35_smu_set_dtbclk(clk_mgr, false);
   244				clk_mgr_base->clks.dtbclk_en = new_clocks->dtbclk_en;
   245			}
   246			/* check that we're not already in lower */
   247			if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_LOW_POWER) {
   248				display_count = dcn35_get_active_display_cnt_wa(dc, context);
   249				/* if we can go lower, go lower */
   250				if (display_count == 0)
   251					clk_mgr_base->clks.pwr_state = DCN_PWR_STATE_LOW_POWER;
   252			}
   253		} else {
   254			if (new_clocks->zstate_support == DCN_ZSTATE_SUPPORT_DISALLOW &&
   255					new_clocks->zstate_support != clk_mgr_base->clks.zstate_support) {
   256				dcn35_smu_set_zstate_support(clk_mgr, DCN_ZSTATE_SUPPORT_DISALLOW);
   257				dm_helpers_enable_periodic_detection(clk_mgr_base->ctx, false);
   258				clk_mgr_base->clks.zstate_support = new_clocks->zstate_support;
   259			}
   260	
   261			if (!clk_mgr_base->clks.dtbclk_en && new_clocks->dtbclk_en) {
   262				dcn35_smu_set_dtbclk(clk_mgr, true);
   263				dcn35_update_clocks_update_dtb_dto(clk_mgr, context, clk_mgr_base->clks.ref_dtbclk_khz);
   264				clk_mgr_base->clks.dtbclk_en = new_clocks->dtbclk_en;
   265			}
   266	
   267			/* check that we're not already in D0 */
   268			if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_MISSION_MODE) {
   269				union display_idle_optimization_u idle_info = { 0 };
   270	
   271				dcn35_smu_set_display_idle_optimization(clk_mgr, idle_info.data);
   272				/* update power state */
   273				clk_mgr_base->clks.pwr_state = DCN_PWR_STATE_MISSION_MODE;
   274			}
   275		}
   276		if (dc->debug.force_min_dcfclk_mhz > 0)
   277			new_clocks->dcfclk_khz = (new_clocks->dcfclk_khz > (dc->debug.force_min_dcfclk_mhz * 1000)) ?
   278					new_clocks->dcfclk_khz : (dc->debug.force_min_dcfclk_mhz * 1000);
   279	
   280		if (should_set_clock(safe_to_lower, new_clocks->dcfclk_khz, clk_mgr_base->clks.dcfclk_khz)) {
   281			clk_mgr_base->clks.dcfclk_khz = new_clocks->dcfclk_khz;
   282			dcn35_smu_set_hard_min_dcfclk(clk_mgr, clk_mgr_base->clks.dcfclk_khz);
   283		}
   284	
   285		if (should_set_clock(safe_to_lower,
   286				new_clocks->dcfclk_deep_sleep_khz, clk_mgr_base->clks.dcfclk_deep_sleep_khz)) {
   287			clk_mgr_base->clks.dcfclk_deep_sleep_khz = new_clocks->dcfclk_deep_sleep_khz;
   288			dcn35_smu_set_min_deep_sleep_dcfclk(clk_mgr, clk_mgr_base->clks.dcfclk_deep_sleep_khz);
   289		}
   290	
   291		// workaround: Limit dppclk to 100Mhz to avoid lower eDP panel switch to plus 4K monitor underflow.
 > 292			if (new_clocks->dppclk_khz < 100000)
   293				new_clocks->dppclk_khz = 100000;
   294	
   295		if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr->base.clks.dppclk_khz)) {
   296			if (clk_mgr->base.clks.dppclk_khz > new_clocks->dppclk_khz)
   297				dpp_clock_lowered = true;
   298			clk_mgr_base->clks.dppclk_khz = new_clocks->dppclk_khz;
   299			update_dppclk = true;
   300		}
   301	
   302		if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz)) {
   303			dcn35_disable_otg_wa(clk_mgr_base, context, true);
   304	
   305			clk_mgr_base->clks.dispclk_khz = new_clocks->dispclk_khz;
   306			dcn35_smu_set_dispclk(clk_mgr, clk_mgr_base->clks.dispclk_khz);
   307			dcn35_disable_otg_wa(clk_mgr_base, context, false);
   308	
   309			update_dispclk = true;
   310		}
   311	
   312		if (!new_clocks->dtbclk_en) {
   313			new_clocks->ref_dtbclk_khz = 600000;
   314		}
   315	
   316		/* clock limits are received with MHz precision, divide by 1000 to prevent setting clocks at every call */
   317		if (!dc->debug.disable_dtb_ref_clk_switch &&
   318				should_set_clock(safe_to_lower, new_clocks->ref_dtbclk_khz / 1000, clk_mgr_base->clks.ref_dtbclk_khz / 1000)) {
   319			/* DCCG requires KHz precision for DTBCLK */
   320			dcn35_smu_set_dtbclk(clk_mgr, true);
   321	
   322			dcn35_update_clocks_update_dtb_dto(clk_mgr, context, clk_mgr_base->clks.ref_dtbclk_khz);
   323		}
   324	
   325		if (dpp_clock_lowered) {
   326			// increase per DPP DTO before lowering global dppclk
   327			dcn35_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
   328			dcn35_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
   329		} else {
   330			// increase global DPPCLK before lowering per DPP DTO
   331			if (update_dppclk || update_dispclk)
   332				dcn35_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
   333			dcn35_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
   334		}
   335	
   336		// notify DMCUB of latest clocks
   337		memset(&cmd, 0, sizeof(cmd));
   338		cmd.notify_clocks.header.type = DMUB_CMD__CLK_MGR;
   339		cmd.notify_clocks.header.sub_type = DMUB_CMD__CLK_MGR_NOTIFY_CLOCKS;
   340		cmd.notify_clocks.clocks.dcfclk_khz = clk_mgr_base->clks.dcfclk_khz;
   341		cmd.notify_clocks.clocks.dcfclk_deep_sleep_khz =
   342			clk_mgr_base->clks.dcfclk_deep_sleep_khz;
   343		cmd.notify_clocks.clocks.dispclk_khz = clk_mgr_base->clks.dispclk_khz;
   344		cmd.notify_clocks.clocks.dppclk_khz = clk_mgr_base->clks.dppclk_khz;
   345	
   346		dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
