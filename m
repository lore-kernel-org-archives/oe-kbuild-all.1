Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1033C107A1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 08:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KssD9++9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697186827; x=1728722827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qDWtZ1DGvddQkzij3TawQOdFmqL5e5L/chNdB/NZeVI=;
  b=KssD9++9YPgqltQOUP+rO6ilNxnECDQ86y1ufVatcOJTZ+Lmkf2yDKgT
   CmP1LDS946Mlh2CZ2r42wjJKIGscAF5w2rQRs46yFx1DVtdXCX+gp873k
   5U4F5nf2V4qbIuIGKgkkHLBhPzhDP2IeqLwGtTonFCRh2xxXFoa6z99b0
   4EZUxSRoTNwShmvbGZRLKFRqzC0IoqYIGQ0wpv96+k49mnu9LUO+eqWq8
   HILqIpHFp9jNsOyAcJyUWGF1bHLUFgSWHZZ9piixd4XxNBSnFRRtuAca9
   xYB8jNTAGfaI9534lFUeCm0HqISX6LpiuT3Yt8O3u7QX3xVrnYdU/e4PJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387985636"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="387985636"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 01:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928335356"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="928335356"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2023 01:46:58 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrDou-0004XH-0C;
	Fri, 13 Oct 2023 08:46:56 +0000
Date: Fri, 13 Oct 2023 16:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 453/12130]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.c:260
 dcn35_update_bw_bounding_box_fpu() warn: inconsistent indenting
Message-ID: <202310131636.TuqEyQOu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9a6bea131849702d591d18d5c8b8a0eda6f62b3
commit: 69cc1864c99a35ba4133877b3170b87e74cd0202 [453/12130] drm/amd/display: Add DCN35 DML
config: i386-randconfig-141-20230905 (https://download.01.org/0day-ci/archive/20231013/202310131636.TuqEyQOu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310131636.TuqEyQOu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131636.TuqEyQOu-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.c:260 dcn35_update_bw_bounding_box_fpu() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.c:351 dcn35_update_bw_bounding_box_fpu() warn: inconsistent indenting

vim +260 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.c

   206	
   207	void dcn35_patch_dpm_table(struct clk_bw_params *bw_params)
   208	{
   209		int i;
   210		unsigned int max_dcfclk_mhz = 0, max_dispclk_mhz = 0, max_dppclk_mhz = 0,
   211				max_phyclk_mhz = 0, max_dtbclk_mhz = 0, max_fclk_mhz = 0, max_uclk_mhz = 0;
   212	
   213		for (i = 0; i < MAX_NUM_DPM_LVL; i++) {
   214			if (bw_params->clk_table.entries[i].dcfclk_mhz > max_dcfclk_mhz)
   215				max_dcfclk_mhz = bw_params->clk_table.entries[i].dcfclk_mhz;
   216			if (bw_params->clk_table.entries[i].fclk_mhz > max_fclk_mhz)
   217				max_fclk_mhz = bw_params->clk_table.entries[i].fclk_mhz;
   218			if (bw_params->clk_table.entries[i].memclk_mhz > max_uclk_mhz)
   219				max_uclk_mhz = bw_params->clk_table.entries[i].memclk_mhz;
   220			if (bw_params->clk_table.entries[i].dispclk_mhz > max_dispclk_mhz)
   221				max_dispclk_mhz = bw_params->clk_table.entries[i].dispclk_mhz;
   222			if (bw_params->clk_table.entries[i].dppclk_mhz > max_dppclk_mhz)
   223				max_dppclk_mhz = bw_params->clk_table.entries[i].dppclk_mhz;
   224			if (bw_params->clk_table.entries[i].phyclk_mhz > max_phyclk_mhz)
   225				max_phyclk_mhz = bw_params->clk_table.entries[i].phyclk_mhz;
   226			if (bw_params->clk_table.entries[i].dtbclk_mhz > max_dtbclk_mhz)
   227				max_dtbclk_mhz = bw_params->clk_table.entries[i].dtbclk_mhz;
   228		}
   229	}
   230	/*
   231	 * dcn35_update_bw_bounding_box
   232	 *
   233	 * This would override some dcn3_5 ip_or_soc initial parameters hardcoded from
   234	 * spreadsheet with actual values as per dGPU SKU:
   235	 * - with passed few options from dc->config
   236	 * - with dentist_vco_frequency from Clk Mgr (currently hardcoded, but might
   237	 *   need to get it from PM FW)
   238	 * - with passed latency values (passed in ns units) in dc-> bb override for
   239	 *   debugging purposes
   240	 * - with passed latencies from VBIOS (in 100_ns units) if available for
   241	 *   certain dGPU SKU
   242	 * - with number of DRAM channels from VBIOS (which differ for certain dGPU SKU
   243	 *   of the same ASIC)
   244	 * - clocks levels with passed clk_table entries from Clk Mgr as reported by PM
   245	 *   FW for different clocks (which might differ for certain dGPU SKU of the
   246	 *   same ASIC)
   247	 */
   248	void dcn35_update_bw_bounding_box_fpu(struct dc *dc,
   249					      struct clk_bw_params *bw_params)
   250	{
   251		unsigned int i, closest_clk_lvl;
   252		int j;
   253		struct clk_limit_table *clk_table = &bw_params->clk_table;
   254		struct _vcs_dpi_voltage_scaling_st *clock_limits =
   255			dc->scratch.update_bw_bounding_box.clock_limits;
   256		int max_dispclk_mhz = 0, max_dppclk_mhz = 0;
   257	
   258		dc_assert_fp_enabled();
   259	
 > 260			dcn3_5_ip.max_num_otg =
   261				dc->res_pool->res_cap->num_timing_generator;
   262			dcn3_5_ip.max_num_dpp = dc->res_pool->pipe_count;
   263			dcn3_5_soc.num_chans = bw_params->num_channels;
   264	
   265			ASSERT(clk_table->num_entries);
   266	
   267			/* Prepass to find max clocks independent of voltage level. */
   268			for (i = 0; i < clk_table->num_entries; ++i) {
   269				if (clk_table->entries[i].dispclk_mhz > max_dispclk_mhz)
   270					max_dispclk_mhz = clk_table->entries[i].dispclk_mhz;
   271				if (clk_table->entries[i].dppclk_mhz > max_dppclk_mhz)
   272					max_dppclk_mhz = clk_table->entries[i].dppclk_mhz;
   273			}
   274	
   275			for (i = 0; i < clk_table->num_entries; i++) {
   276				/* loop backwards*/
   277				for (closest_clk_lvl = 0, j = dcn3_5_soc.num_states - 1;
   278				     j >= 0; j--) {
   279					if (dcn3_5_soc.clock_limits[j].dcfclk_mhz <=
   280					    clk_table->entries[i].dcfclk_mhz) {
   281						closest_clk_lvl = j;
   282						break;
   283					}
   284				}
   285				if (clk_table->num_entries == 1) {
   286					/*smu gives one DPM level, let's take the highest one*/
   287					closest_clk_lvl = dcn3_5_soc.num_states - 1;
   288				}
   289	
   290				clock_limits[i].state = i;
   291	
   292				/* Clocks dependent on voltage level. */
   293				clock_limits[i].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
   294				if (clk_table->num_entries == 1 &&
   295				    clock_limits[i].dcfclk_mhz <
   296				    dcn3_5_soc.clock_limits[closest_clk_lvl].dcfclk_mhz) {
   297					/*SMU fix not released yet*/
   298					clock_limits[i].dcfclk_mhz =
   299						dcn3_5_soc.clock_limits[closest_clk_lvl].dcfclk_mhz;
   300				}
   301	
   302				clock_limits[i].fabricclk_mhz =
   303					clk_table->entries[i].fclk_mhz;
   304				clock_limits[i].socclk_mhz =
   305					clk_table->entries[i].socclk_mhz;
   306	
   307				if (clk_table->entries[i].memclk_mhz &&
   308				    clk_table->entries[i].wck_ratio)
   309					clock_limits[i].dram_speed_mts =
   310						clk_table->entries[i].memclk_mhz * 2 *
   311						clk_table->entries[i].wck_ratio;
   312	
   313				/* Clocks independent of voltage level. */
   314				clock_limits[i].dispclk_mhz = max_dispclk_mhz ?
   315					max_dispclk_mhz :
   316					dcn3_5_soc.clock_limits[closest_clk_lvl].dispclk_mhz;
   317	
   318				clock_limits[i].dppclk_mhz = max_dppclk_mhz ?
   319					max_dppclk_mhz :
   320					dcn3_5_soc.clock_limits[closest_clk_lvl].dppclk_mhz;
   321	
   322				clock_limits[i].dram_bw_per_chan_gbps =
   323					dcn3_5_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
   324				clock_limits[i].dscclk_mhz =
   325					dcn3_5_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
   326				clock_limits[i].dtbclk_mhz =
   327					dcn3_5_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
   328				clock_limits[i].phyclk_d18_mhz =
   329					dcn3_5_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
   330				clock_limits[i].phyclk_mhz =
   331					dcn3_5_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
   332			}
   333	
   334			memcpy(dcn3_5_soc.clock_limits, clock_limits,
   335			       sizeof(dcn3_5_soc.clock_limits));
   336	
   337			if (clk_table->num_entries)
   338				dcn3_5_soc.num_states = clk_table->num_entries;
   339	
   340		if (max_dispclk_mhz) {
   341			dcn3_5_soc.dispclk_dppclk_vco_speed_mhz = max_dispclk_mhz * 2;
   342			dc->dml.soc.dispclk_dppclk_vco_speed_mhz = max_dispclk_mhz * 2;
   343		}
   344		if ((int)(dcn3_5_soc.dram_clock_change_latency_us * 1000)
   345					!= dc->debug.dram_clock_change_latency_ns
   346				&& dc->debug.dram_clock_change_latency_ns) {
   347			dcn3_5_soc.dram_clock_change_latency_us =
   348				dc->debug.dram_clock_change_latency_ns / 1000.0;
   349		}
   350		/*temp till dml2 fully work without dml1*/
   351			dml_init_instance(&dc->dml, &dcn3_5_soc, &dcn3_5_ip,
   352					  DML_PROJECT_DCN31);
   353	}
   354	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
