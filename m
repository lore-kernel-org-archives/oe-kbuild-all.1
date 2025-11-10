Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C31D2ECD14
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 20:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762806879; cv=none; b=RBrb3wX8f08LrI3TQ9tdcblDqMUtz0yUfQTu5OrhaqusrZ54vzw5HlzfgT+x8+pctiXUL19AalJ+8rSJmob0Mndm0jKAut17NRjuw4ciXX1oUYR/JrThvZg7ByQOWWPM1Al2AdympaL+/3bvwz1xROMmWGEYtLQfvDUq6Z5dZkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762806879; c=relaxed/simple;
	bh=tnT9n0VNjvk4JRSbwkTDe5DHoKRXu8oT1fn8zY7ry+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pxjwBct4JgPUISBw3ltGN4lsLp47tLeXOzV08p9LCR2ptT27yRO1iWxh69fF8XOk5eBN/UcXEgRJDNUrN9/6RaULyxI2v8vHpXu5EDpGi2z9w6rnRaT0GY8CqguU0tZIiypyJrpmXgj71nIg/PKboeYHN/+sj8VxCQdRbHO6Gas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ppj9LC/+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ppj9LC/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762806877; x=1794342877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tnT9n0VNjvk4JRSbwkTDe5DHoKRXu8oT1fn8zY7ry+M=;
  b=Ppj9LC/+ZT/hnnZZDgAuAvoc5jHKZZHlIYQNQ0b5S/13RgVefu9ilXgK
   YpDYeXKPmv1B1FQlEE+LBMFjG5lRqZNjLfKo/YKcRhsq/Qzf5fJvztlrL
   5dnviGrbD6eeAtbhnLdMPGhJfxvS8Jhg2ibNoRZ9W469wQa/kyOTjtfrs
   IhuAxf2BqDkVkFOsSZVupHQ9RuGOBJaU5H14/QAr13tS8kZXNwmQ0tA/2
   MCLidmeUrnwNMpwpOGoJihN3kO1cIjtV5P1RSYdF+b+7PlJ2mInlG9bNd
   AHzlmvhPo9ITV40nPGyFhlTBS24qvW5G8G0RDec78pICVwAUOnyX8gZEF
   A==;
X-CSE-ConnectionGUID: 1Z+YGqFGSOuSbqVuEyPYGA==
X-CSE-MsgGUID: AJcT9S+ZTvGTcpVuO6XlUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68722257"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="68722257"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 12:34:36 -0800
X-CSE-ConnectionGUID: SpimWYqGSJeLP/RruwYhKg==
X-CSE-MsgGUID: AJUKapn5QXKY81RhhvSPYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="188725979"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Nov 2025 12:34:35 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIYau-0000yK-31;
	Mon, 10 Nov 2025 20:34:32 +0000
Date: Tue, 11 Nov 2025 04:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-lts/v6.18-rc5-2025-11-10-sparrow-hawk 27/29]
 drivers/media/platform/dreamchip/rppx1/rppx1_bd.c:205:1: warning: control
 reaches end of non-void function
Message-ID: <202511110405.kK4U5oCn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc5-2025-11-10-sparrow-hawk
head:   14a3f460905b5d9be43ad2bab030625085a52423
commit: b51f2331665d7a9a5f69fbac3022f2685f926904 [27/29] media: rppx1: Add support for Bilateral Denoising
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20251111/202511110405.kK4U5oCn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511110405.kK4U5oCn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110405.kK4U5oCn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/dreamchip/rppx1/rppx1_bd.c: In function 'rppx1_bd_probe':
   drivers/media/platform/dreamchip/rppx1/rppx1_bd.c:45:25: error: 'EINVAL' undeclared (first use in this function)
      45 |                 return -EINVAL;
         |                         ^~~~~~
   drivers/media/platform/dreamchip/rppx1/rppx1_bd.c:45:25: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/platform/dreamchip/rppx1/rppx1_bd.c: In function 'rppx1_bd_param_rkisp1':
   drivers/media/platform/dreamchip/rppx1/rppx1_bd.c:204:17: error: 'EINVAL' undeclared (first use in this function)
     204 |         return -EINVAL;
         |                 ^~~~~~
>> drivers/media/platform/dreamchip/rppx1/rppx1_bd.c:205:1: warning: control reaches end of non-void function [-Wreturn-type]
     205 | }
         | ^


vim +205 drivers/media/platform/dreamchip/rppx1/rppx1_bd.c

    40	
    41	static int rppx1_bd_probe(struct rpp_module *mod)
    42	{
    43		/* Version check. */
    44		if (rpp_module_read(mod, DPF_VERSION_REG) != 5)
  > 45			return -EINVAL;
    46	
    47		return 0;
    48	}
    49	
    50	static int
    51	rppx1_bd_param_rkisp1_main(struct rpp_module *mod,
    52				   const union rppx1_params_rkisp1_config *block,
    53				   rppx1_reg_write write, void *priv)
    54	{
    55		const struct rkisp1_ext_params_dpf_config *cfg = &block->dpf;
    56		unsigned int isp_dpf_mode, spatial_coeff;
    57	
    58		/* If the modules is disabled, simply bypass it. */
    59		if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
    60			write(priv, mod->base + DPF_MODE_REG, 0);
    61			return 0;
    62		}
    63	
    64		/*
    65		 * RkISP1 have an extra hardware flag AWB_GAIN_COMP which was removed
    66		 * in RPP DB module version 4 and later. If the bit is set the
    67		 * programmed gains will be processed, if it's not set a default value
    68		 * of 1 (0x100) will be used. From the RPP documentation for DB version
    69		 * 4 changelog.
    70		 *
    71		 *   Removed RPP_DPF_MODE::awb_gain_comp. Always use programmed
    72		 *   nf-gains for gain compensation.
    73		 *
    74		 * We can emulate this behavior if we keep track of when the RkISP1 do
    75		 * set the flag.
    76		 */
    77		bool awb_gain_comp = false;
    78	
    79		switch (cfg->config.gain.mode) {
    80		case RKISP1_CIF_ISP_DPF_GAIN_USAGE_NF_GAINS:
    81			awb_gain_comp = true;
    82			isp_dpf_mode = DPF_MODE_USE_NF_GAIN;
    83			break;
    84		case RKISP1_CIF_ISP_DPF_GAIN_USAGE_LSC_GAINS:
    85			isp_dpf_mode = DPF_MODE_LSC_GAIN_COMP;
    86			break;
    87		case RKISP1_CIF_ISP_DPF_GAIN_USAGE_NF_LSC_GAINS:
    88			awb_gain_comp = true;
    89			isp_dpf_mode = DPF_MODE_USE_NF_GAIN | DPF_MODE_LSC_GAIN_COMP;
    90			break;
    91		case RKISP1_CIF_ISP_DPF_GAIN_USAGE_AWB_GAINS:
    92			awb_gain_comp = true;
    93			isp_dpf_mode = 0;
    94			break;
    95		case RKISP1_CIF_ISP_DPF_GAIN_USAGE_AWB_LSC_GAINS:
    96			awb_gain_comp = true;
    97			isp_dpf_mode = DPF_MODE_LSC_GAIN_COMP;
    98			break;
    99		case RKISP1_CIF_ISP_DPF_GAIN_USAGE_DISABLED:
   100		default:
   101			isp_dpf_mode = 0;
   102			break;
   103		}
   104	
   105		/* NOTE: Hardware bit for scale_mode is inverted compared to RkISP1. */
   106		if (cfg->config.nll.scale_mode == RKISP1_CIF_ISP_NLL_SCALE_LINEAR)
   107			isp_dpf_mode |= DPF_MODE_NLL_SEGMENTATION;
   108		if (cfg->config.rb_flt.fltsize == RKISP1_CIF_ISP_DPF_RB_FILTERSIZE_9x9)
   109			isp_dpf_mode |= DPF_MODE_RB_FILTER_SIZE;
   110		if (!cfg->config.rb_flt.r_enable)
   111			isp_dpf_mode |= DPF_MODE_R_FILTER_OFF;
   112		if (!cfg->config.rb_flt.b_enable)
   113			isp_dpf_mode |= DPF_MODE_B_FILTER_OFF;
   114		if (!cfg->config.g_flt.gb_enable)
   115			isp_dpf_mode |= DPF_MODE_GB_FILTER_OFF;
   116		if (!cfg->config.g_flt.gr_enable)
   117			isp_dpf_mode |= DPF_MODE_GR_FILTER_OFF;
   118	
   119		isp_dpf_mode |= DPF_MODE_DPF_ENABLE;
   120	
   121		if (awb_gain_comp) {
   122			write(priv, mod->base + DPF_NF_GAIN_B_REG, cfg->config.gain.nf_b_gain);
   123			write(priv, mod->base + DPF_NF_GAIN_R_REG, cfg->config.gain.nf_r_gain);
   124			write(priv, mod->base + DPF_NF_GAIN_GB_REG, cfg->config.gain.nf_gb_gain);
   125			write(priv, mod->base + DPF_NF_GAIN_GR_REG, cfg->config.gain.nf_gr_gain);
   126		} else {
   127			write(priv, mod->base + DPF_NF_GAIN_B_REG, 0x100);
   128			write(priv, mod->base + DPF_NF_GAIN_R_REG, 0x100);
   129			write(priv, mod->base + DPF_NF_GAIN_GB_REG, 0x100);
   130			write(priv, mod->base + DPF_NF_GAIN_GR_REG, 0x100);
   131		}
   132	
   133		/* The RkISP1 hardware have a single register for all components. */
   134		for (unsigned int i = 0; i < RKISP1_CIF_ISP_DPF_MAX_NLF_COEFFS; i++) {
   135			write(priv, mod->base + DPF_NLL_G_COEFF_REG(i), cfg->config.nll.coeff[i]);
   136			write(priv, mod->base + DPF_NLL_RB_COEFF_REG(i), cfg->config.nll.coeff[i]);
   137		}
   138	
   139		spatial_coeff = cfg->config.g_flt.spatial_coeff[0] |
   140				(cfg->config.g_flt.spatial_coeff[1] << 8) |
   141				(cfg->config.g_flt.spatial_coeff[2] << 16) |
   142				(cfg->config.g_flt.spatial_coeff[3] << 24);
   143		write(priv, mod->base + DPF_S_WEIGHT_G_1_4_REG, spatial_coeff);
   144	
   145		spatial_coeff = cfg->config.g_flt.spatial_coeff[4] |
   146				(cfg->config.g_flt.spatial_coeff[5] << 8);
   147		write(priv, mod->base + DPF_S_WEIGHT_G_5_6_REG, spatial_coeff);
   148	
   149		spatial_coeff = cfg->config.rb_flt.spatial_coeff[0] |
   150				(cfg->config.rb_flt.spatial_coeff[1] << 8) |
   151				(cfg->config.rb_flt.spatial_coeff[2] << 16) |
   152				(cfg->config.rb_flt.spatial_coeff[3] << 24);
   153		write(priv, mod->base + DPF_S_WEIGHT_RB_1_4_REG, spatial_coeff);
   154	
   155		spatial_coeff = cfg->config.rb_flt.spatial_coeff[4] |
   156				(cfg->config.rb_flt.spatial_coeff[5] << 8);
   157		write(priv, mod->base + DPF_S_WEIGHT_RB_5_6_REG, spatial_coeff);
   158	
   159		/*
   160		 * Bilateral Denoising does not react on RPP_HDR_UPD::regs_gen_cfg_upd
   161		 * (see Table 25). A change in configuration needs write of 1 to
   162		 * RPP_HDR_UPD::regs_cfg_upd.
   163		 */
   164		write(priv, 4, 1);
   165	
   166		write(priv, mod->base + DPF_MODE_REG, isp_dpf_mode);
   167	
   168		return 0;
   169	}
   170	
   171	static int
   172	rppx1_bd_param_rkisp1_strength(struct rpp_module *mod,
   173				       const union rppx1_params_rkisp1_config *block,
   174				       rppx1_reg_write write, void *priv)
   175	{
   176		const struct rkisp1_ext_params_dpf_strength_config *cfg = &block->dpfs;
   177	
   178		/* If the modules is disabled, simply bypass it. */
   179		if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
   180			write(priv, mod->base + DPF_MODE_REG, 0);
   181			return 0;
   182		}
   183	
   184		/* Module version 5 adds shadowing for mode and spatial weights. */
   185		write(priv, mod->base + DPF_STRENGTH_R_REG, cfg->config.r);
   186		write(priv, mod->base + DPF_STRENGTH_G_REG, cfg->config.g);
   187		write(priv, mod->base + DPF_STRENGTH_B_REG, cfg->config.b);
   188	
   189		return 0;
   190	}
   191	
   192	static int
   193	rppx1_bd_param_rkisp1(struct rpp_module *mod,
   194			      const union rppx1_params_rkisp1_config *block,
   195			      rppx1_reg_write write, void *priv)
   196	{
   197		switch (block->header.type) {
   198		case RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF:
   199			return rppx1_bd_param_rkisp1_main(mod, block, write, priv);
   200		case RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH:
   201			return rppx1_bd_param_rkisp1_strength(mod, block, write, priv);
   202		}
   203	
   204		return -EINVAL;
 > 205	}
   206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
