Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3FF3D5237
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 02:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786673879; cv=none; b=bHNmTOYb7IctC7scyTkDAUQRcbb2NQ8rvkkRpXntS3YAkIfv7SbkrvGWKp/7L+4K9p19YaBChLfizvlP94xYVMlo3GTce52iTN9StEXc3QchvQGN7i2IzxJ7dJQcGPANlQeRLp/mOjmHsRKekVaSEYpi8nt392wcKm/3WPhyhiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786673879; c=relaxed/simple;
	bh=GyCaToAGkuUGS/G0qBrdMD5pONLH6QyerF18q4uEHak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PlfU7egDeCyZNf2jiI5x8M2Kpi4JfR7voeVpq+guHWZHolWdS0l0Q2EI5bMLv9Q4PHU+FG9nABMFiXMWRUkvNkl33HoEkrSsD9vX7ZaTmGRBVJ2yRascxogGGhmhtNmu2jg/FnPF/hyOXs4Q6kxlSs8gvusw/kmlu0wnJSJrYFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIccpDPb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIccpDPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786673877; x=1818209877;
  h=date:from:to:cc:subject:message-id;
  bh=GyCaToAGkuUGS/G0qBrdMD5pONLH6QyerF18q4uEHak=;
  b=FIccpDPb5RtiE13T/aQGDo6k4sX8UNziXGTBwLXi8LiN8CdPjVUQip/L
   58FMVYCED/oRQ3TmVpMw9++yj32pvetRcoHc+RqsSr+cZ5wYfQLECWtuf
   XoFz0nEGFf0ODgcdAzSeR12HUVyH99qbnE405wlhGEOIOgAf7PRoviz+M
   xxTKkEf2IC/IY2bidew3VJWSlCOgltziZlO2ryIdV8Xu/T6Dx5MFVRqCt
   W5boA+REgdyMMAvX4l2ML5uGJrMYQpaqZi+pzu2nK8js2kuEEHUs9lJYF
   gDsn6vFpw0A8BNla9o5xINEyIhrl8elnSX0vugocQLDLRbEU4wXh6c46p
   g==;
X-CSE-ConnectionGUID: LloFc9WMQtSxsd6czGHaEQ==
X-CSE-MsgGUID: PNORdP6aSK6y+D3ivsag5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87117591"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87117591"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 19:17:55 -0700
X-CSE-ConnectionGUID: 1L2U243ASlec1lJhosgMzQ==
X-CSE-MsgGUID: 5hUuT8+2RzWDArxicW+qIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="257880422"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Aug 2026 19:17:53 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuhUU-00000000XPo-22ST;
	Fri, 14 Aug 2026 02:17:50 +0000
Date: Fri, 14 Aug 2026 10:17:04 +0800
From: kernel test robot <lkp@intel.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Roman Li <Roman.Li@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>
Subject: [agd5f:drm-next-7.3 244/308]
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn60/dcn60_clk_mgr.c:1626
 dcn60_clk_mgr_construct() warn: inconsistent indenting
Message-ID: <202608141039.V6EpZTVd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Aurabindo,

First bad commit (maybe != root cause):

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.3
head:   0d710af8e4abdd1fa500bddbab7c0ee47fc98143
commit: 992694ad28584188725751f695a85661e8e3797a [244/308] drm/amd/display: Enable DCN6 sources compilation
config: x86_64-randconfig-161-20260810 (https://download.01.org/0day-ci/archive/20260814/202608141039.V6EpZTVd-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141039.V6EpZTVd-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn60/dcn60_clk_mgr.c:1626 dcn60_clk_mgr_construct() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:3493 dce110_enable_tmds_link_output() warn: variable dereferenced before check 'link->link_enc' (see line 3483)
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn50/dcn50_hwseq.c:424 dcn50_update_mpcc_sequence() warn: variable dereferenced before check 'pipe_ctx->plane_state' (see line 418)
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn50/dcn50_hwseq.c:756 dcn50_init_hw() error: we previously assumed 'dc->res_pool->funcs->update_bw_bounding_box' could be null (see line 752)
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hwseq.c:352 dcn401_init_hw() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1592 hubbub60_perfmon_get_in_order_bandwidth_mbps() warn: variable dereferenced before check 'duration_ns' (see line 1576)
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:146 compute_pre_rec_first_hdl() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:298 calculate_alt_copy_time_us() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:716 dcn6_rq_dlg_get_dlg_reg() error: testing array offset 'l->plane_idx' after use.
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn60/dcn60_resource.c:963 dcn60_program_mcache_pipe_config() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn60/dcn60_resource.c:1045 dcn60_i2c_hw_create() warn: curly braces intended?
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn60/dcn60_resource.c:1048 dcn60_i2c_hw_create() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn60/dcn60_resource.c:1144 dcn60_hubp_create() warn: curly braces intended?
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn60/dcn60_resource.c:1149 dcn60_hubp_create() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn60/dcn60_resource.c:1977 dcn60_resource_construct() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_funcs_mode_support.c:647 dcn5_ms_calculate_odm_mode_per_plane() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_calcs_dchub.c:917 dcn5_calculate_swath_and_det_configuration() warn: variable dereferenced before check 'p->UnboundedRequestEnabled' (see line 773)
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1012 hwss_build_post_unlock_full_sequence() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:1250 dce110_disable_stream() warn: if statement not indented
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:3498 dce110_enable_tmds_link_output() warn: variable dereferenced before check 'link->link_enc' (see line 3483)
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hwseq.c:2017 dcn401_wait_for_det_buffer_update_under_otg_master() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:152 compute_pre_rec_first_hdl() warn: inconsistent indenting

vim +1626 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn60/dcn60_clk_mgr.c

7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1592  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1593  struct clk_mgr_internal *dcn60_clk_mgr_construct(
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1594  		struct dc_context *ctx,
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1595  		struct dccg *dccg)
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1596  {
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1597  	struct clk_log_info log_info = {0};
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1598  	struct dcn60_clk_mgr *clk_mgr60 = kzalloc(sizeof(struct dcn60_clk_mgr), GFP_KERNEL);
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1599  	struct clk_mgr_internal *clk_mgr;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1600  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1601  	if (!clk_mgr60)
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1602  		return NULL;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1603  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1604  	clk_mgr = &clk_mgr60->base;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1605  	clk_mgr->base.ctx = ctx;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1606  	clk_mgr->base.funcs = &dcn60_funcs;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1607  	clk_mgr->regs = &clk_mgr_regs_dcn60;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1608  	clk_mgr->clk_mgr_shift = &clk_mgr_shift_dcn60;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1609  	clk_mgr->clk_mgr_mask = &clk_mgr_mask_dcn60;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1610  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1611  	clk_mgr->dccg = dccg;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1612  	clk_mgr->dfs_bypass_disp_clk = 0;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1613  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1614  	clk_mgr->dprefclk_ss_percentage = 0;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1615  	clk_mgr->dprefclk_ss_divider = 1000;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1616  	clk_mgr->ss_on_dprefclk = false;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1617  	clk_mgr->dfs_ref_freq_khz = 100000;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1618  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1619  	/* Changed from DCN3.2_clock_frequency doc to match
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1620  	 * dcn60_dump_clk_registers from 4 * dentist_vco_freq_khz /
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1621  	 * dprefclk DID divider
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1622  	 */
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1623  	clk_mgr->base.dprefclk_khz = 720000;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1624  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1625  		/* integer part is now VCO frequency in kHz */
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22 @1626  		clk_mgr->base.dentist_vco_freq_khz = dcn60_get_vco_frequency_from_reg(clk_mgr);
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1627  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1628  		/* in case we don't get a value from the register, use default */
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1629  		if (clk_mgr->base.dentist_vco_freq_khz == 0)
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1630  			clk_mgr->base.dentist_vco_freq_khz = 4500000;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1631  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1632  		dcn60_dump_clk_registers(&clk_mgr->base.boot_snapshot, &clk_mgr->base, &log_info);
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1633  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1634  		if (ctx->dc->debug.disable_dtb_ref_clk_switch &&
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1635  				clk_mgr->base.clks.ref_dtbclk_khz != clk_mgr->base.boot_snapshot.dtbclk) {
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1636  			clk_mgr->base.clks.ref_dtbclk_khz = clk_mgr->base.boot_snapshot.dtbclk;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1637  		}
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1638  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1639  		if (clk_mgr->base.boot_snapshot.dprefclk != 0)
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1640  			clk_mgr->base.dprefclk_khz = clk_mgr->base.boot_snapshot.dprefclk;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1641  		dcn60_clock_read_ss_info(clk_mgr);
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1642  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1643  	clk_mgr->dfs_bypass_enabled = false;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1644  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1645  	clk_mgr->smu_present = false;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1646  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1647  	clk_mgr->base.bw_params = kzalloc(sizeof(*clk_mgr->base.bw_params), GFP_KERNEL);
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1648  	if (!clk_mgr->base.bw_params)
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1649  		goto fail;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1650  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1651  	clk_mgr->dal_init_table = dm_helpers_allocate_gpu_mem(clk_mgr->base.ctx,
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1652  			DC_MEM_ALLOC_TYPE_GART, sizeof(DalInitTable_t),
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1653  			&clk_mgr->dal_init_table_addr);
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1654  	if (!clk_mgr->dal_init_table)
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1655  		goto fail;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1656  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1657  	return &clk_mgr60->base;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1658  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1659  fail:
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1660  	BREAK_TO_DEBUGGER();
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1661  	dcn60_clk_mgr_destroy(clk_mgr);
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1662  	kfree(clk_mgr60);
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1663  	return NULL;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1664  }
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  1665  

:::::: The code at line 1626 was first introduced by commit
:::::: 7f7d7ea1fa515157162d0d21245925551ed103a1 drm/amd/display: Add new sources for DCN6

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
