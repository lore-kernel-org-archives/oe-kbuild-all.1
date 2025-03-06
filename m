Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594F5199FA2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 03:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741233277; cv=none; b=akJgovoaMe2tWKBaJqwJPyASSLu6ZF+c8358v+qplpRHeiHJ6tEEGjuayxv/QZdaPlEAtdnq1x+pCNv72zaZagadGN2UvhJ2Io13jYCJbXgdHTyCNUAY2S5PZ2eUluNU+PFr1HDtKjRNuqG0ddVXvcj04vTjE/L4c6MARRzD7vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741233277; c=relaxed/simple;
	bh=ChvtOFg0dvhJ2ophXAF+Pq6klTdUTkOIoE1U7VKF6zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syQOtB6+ltYFg+ONzw7m339gK27UV3OoDNcNf9ZLDapLKNCe8/sAX3p061RBjEESn1pLGKrGwAYu8l6UW3W9pFTdX0QeyrMwyR0IlGdQtGZWEMis+rX7vg9JdT4i/9zRTVB31TO+Zg9hyAWNS8nqCTlY16JyM1Yi2V16mgs1lLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVouxcwE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVouxcwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741233276; x=1772769276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ChvtOFg0dvhJ2ophXAF+Pq6klTdUTkOIoE1U7VKF6zY=;
  b=AVouxcwEM3+Aer0GYHQezaGsvYi8+AYzy4qAaOi1Xp8cDZXZ3tp8wtWW
   0vJKDq8s8L8DWGNm3u8bZ1Xisq0pivTQAaZ7DprjBGAVa9XgHgb3nHAeZ
   vP975njqd2DKOpDBVlX18RZuAbyFB+e/98wYzbVkIqgJqWs9qXsklIi9j
   l5RFKLYT5VDLd4hCJWueBVkIC7l3Eq67aT+B8fdSJbX6SRhACwdAUJyzh
   58UzO21FS5GZIaUYCYM3m/SNQo7louHQGb6UUUEHWbBRFMEnlxFLSphnI
   6pBWSChzPyYOwuNpqRxVnZwqGAJ3SyXEqWXhc90mQOusDVhzi3CPamq7j
   Q==;
X-CSE-ConnectionGUID: KI5KCuctSMyl5fyQ6mcVUA==
X-CSE-MsgGUID: 8xnIkGGIRX2v8WsWI7YRMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42361538"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="42361538"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 19:54:35 -0800
X-CSE-ConnectionGUID: I8FJwNvdQTWNuW7wEflyig==
X-CSE-MsgGUID: XcwVzRZGRDacQKe36paGWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="123981455"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2025 19:54:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq2Jb-000MV8-1o;
	Thu, 06 Mar 2025 03:54:31 +0000
Date: Thu, 6 Mar 2025 11:53:35 +0800
From: kernel test robot <lkp@intel.com>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
Message-ID: <202503061140.CyNu642W-lkp@intel.com>
References: <20250304-sm8750_llcc_master-v2-2-ae4e1949546e@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_llcc_master-v2-2-ae4e1949546e@quicinc.com>

Hi Melody,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 20d5c66e1810e6e8805ec0d01373afb2dba9f51a]

url:    https://github.com/intel-lab-lkp/linux/commits/Melody-Olvera/dt-bindings-cache-qcom-llcc-Document-SM8750-LLCC-block/20250305-062702
base:   20d5c66e1810e6e8805ec0d01373afb2dba9f51a
patch link:    https://lore.kernel.org/r/20250304-sm8750_llcc_master-v2-2-ae4e1949546e%40quicinc.com
patch subject: [PATCH v2 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
config: arc-randconfig-001-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061140.CyNu642W-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061140.CyNu642W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061140.CyNu642W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/qcom/llcc-qcom.c: In function '_qcom_llcc_cfg_program_v6':
>> drivers/soc/qcom/llcc-qcom.c:3950:13: warning: unused variable 'disable_cap_alloc' [-Wunused-variable]
    3950 |         u32 disable_cap_alloc, wren, wr_cache_en;
         |             ^~~~~~~~~~~~~~~~~
   drivers/soc/qcom/llcc-qcom.c: At top level:
   drivers/soc/qcom/llcc-qcom.c:3227:18: warning: 'llcc_v6_reg_offset' defined but not used [-Wunused-const-variable=]
    3227 | static const u32 llcc_v6_reg_offset[] = {
         |                  ^~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/llcc-qcom.c:3187:42: warning: 'llcc_v6_edac_reg_offset' defined but not used [-Wunused-const-variable=]
    3187 | static const struct llcc_edac_reg_offset llcc_v6_edac_reg_offset = {
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~


vim +/disable_cap_alloc +3950 drivers/soc/qcom/llcc-qcom.c

  3942	
  3943	static int _qcom_llcc_cfg_program_v6(const struct llcc_slice_config *config,
  3944					  const struct qcom_llcc_config *cfg)
  3945	{
  3946		u32 stale_en, stale_cap_en, mru_uncap_en, mru_rollover;
  3947		u32 alloc_oneway_en, ovcap_en, ovcap_prio, vict_prio;
  3948		u32 attr0_cfg, attr1_cfg, attr2_cfg, attr3_cfg;
  3949		u32 attr0_val, attr1_val, attr2_val, attr3_val;
> 3950		u32 disable_cap_alloc, wren, wr_cache_en;
  3951		u32 slice_offset, reg_offset;
  3952		struct llcc_slice_desc *desc;
  3953		int ret;
  3954	
  3955		attr0_cfg = LLCC_V6_TRP_ATTR0_CFGn(config->slice_id);
  3956		attr1_cfg = LLCC_V6_TRP_ATTR1_CFGn(config->slice_id);
  3957		attr2_cfg = LLCC_V6_TRP_ATTR2_CFGn(config->slice_id);
  3958		attr3_cfg = LLCC_V6_TRP_ATTR3_CFGn(config->slice_id);
  3959	
  3960		attr0_val = config->res_ways;
  3961		attr1_val = config->bonus_ways;
  3962		attr2_val = config->cache_mode;
  3963		attr2_val |= FIELD_PREP(ATTR2_PROBE_TARGET_WAYS_MASK, config->probe_target_ways);
  3964		attr2_val |= FIELD_PREP(ATTR2_FIXED_SIZE_MASK, config->fixed_size);
  3965		attr2_val |= FIELD_PREP(ATTR2_PRIORITY_MASK, config->priority);
  3966	
  3967		attr3_val = MAX_CAP_TO_BYTES(config->max_cap);
  3968		attr3_val /= drv_data->num_banks;
  3969		attr3_val >>= CACHE_LINE_SIZE_SHIFT;
  3970	
  3971		ret = regmap_write(drv_data->bcast_regmap, attr0_cfg, attr0_val);
  3972		if (ret)
  3973			return ret;
  3974	
  3975		ret = regmap_write(drv_data->bcast_regmap, attr1_cfg, attr1_val);
  3976		if (ret)
  3977			return ret;
  3978	
  3979		ret = regmap_write(drv_data->bcast_regmap, attr2_cfg, attr2_val);
  3980		if (ret)
  3981			return ret;
  3982	
  3983		ret = regmap_write(drv_data->bcast_regmap, attr3_cfg, attr3_val);
  3984		if (ret)
  3985			return ret;
  3986	
  3987		slice_offset = config->slice_id % 32;
  3988		reg_offset = (config->slice_id / 32) * 4;
  3989	
  3990		wren = config->write_scid_en << slice_offset;
  3991		ret = regmap_update_bits(drv_data->bcast_regmap,
  3992				cfg->reg_offset[LLCC_TRP_WRS_EN] + reg_offset,
  3993				BIT(slice_offset), wren);
  3994		if (ret)
  3995			return ret;
  3996	
  3997		wr_cache_en = config->write_scid_cacheable_en << slice_offset;
  3998		ret = regmap_update_bits(drv_data->bcast_regmap,
  3999				cfg->reg_offset[LLCC_TRP_WRS_CACHEABLE_EN] + reg_offset,
  4000				BIT(slice_offset), wr_cache_en);
  4001		if (ret)
  4002			return ret;
  4003	
  4004		stale_en = config->stale_en << slice_offset;
  4005		ret = regmap_update_bits(drv_data->bcast_regmap,
  4006				cfg->reg_offset[LLCC_TRP_ALGO_STALE_EN] + reg_offset,
  4007				BIT(slice_offset), stale_en);
  4008		if (ret)
  4009			return ret;
  4010	
  4011		stale_cap_en = config->stale_cap_en << slice_offset;
  4012		ret = regmap_update_bits(drv_data->bcast_regmap,
  4013				cfg->reg_offset[LLCC_TRP_ALGO_STALE_CAP_EN] + reg_offset,
  4014				BIT(slice_offset), stale_cap_en);
  4015		if (ret)
  4016			return ret;
  4017	
  4018		mru_uncap_en = config->mru_uncap_en << slice_offset;
  4019		ret = regmap_update_bits(drv_data->bcast_regmap,
  4020				cfg->reg_offset[LLCC_TRP_ALGO_MRU0] + reg_offset,
  4021				BIT(slice_offset), mru_uncap_en);
  4022		if (ret)
  4023			return ret;
  4024	
  4025		mru_rollover = config->mru_rollover << slice_offset;
  4026		ret = regmap_update_bits(drv_data->bcast_regmap,
  4027				cfg->reg_offset[LLCC_TRP_ALGO_MRU1] + reg_offset,
  4028				BIT(slice_offset), mru_rollover);
  4029		if (ret)
  4030			return ret;
  4031	
  4032		alloc_oneway_en = config->alloc_oneway_en << slice_offset;
  4033		ret = regmap_update_bits(drv_data->bcast_regmap,
  4034				cfg->reg_offset[LLCC_TRP_ALGO_ALLOC0] + reg_offset,
  4035				BIT(slice_offset), alloc_oneway_en);
  4036		if (ret)
  4037			return ret;
  4038	
  4039		ovcap_en = config->ovcap_en << slice_offset;
  4040		ret = regmap_update_bits(drv_data->bcast_regmap,
  4041				cfg->reg_offset[LLCC_TRP_ALGO_ALLOC1] + reg_offset,
  4042				BIT(slice_offset), ovcap_en);
  4043		if (ret)
  4044			return ret;
  4045	
  4046		ovcap_prio = config->ovcap_prio << slice_offset;
  4047		ret = regmap_update_bits(drv_data->bcast_regmap,
  4048				cfg->reg_offset[LLCC_TRP_ALGO_ALLOC2] + reg_offset,
  4049				BIT(slice_offset), ovcap_prio);
  4050		if (ret)
  4051			return ret;
  4052	
  4053		vict_prio = config->vict_prio << slice_offset;
  4054		ret = regmap_update_bits(drv_data->bcast_regmap,
  4055				cfg->reg_offset[LLCC_TRP_ALGO_ALLOC3] + reg_offset,
  4056				BIT(slice_offset), vict_prio);
  4057		if (ret)
  4058			return ret;
  4059	
  4060		if (config->activate_on_init) {
  4061			desc = llcc_slice_getd(config->usecase_id);
  4062			if (PTR_ERR_OR_ZERO(desc))
  4063				return -EINVAL;
  4064	
  4065			ret = llcc_slice_activate(desc);
  4066		}
  4067	
  4068		return ret;
  4069	}
  4070	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
