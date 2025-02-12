Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D5F9C1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 01:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739323896; cv=none; b=dwL8MpLiR2b+EG0cLXBLplPEHWbQj+o+fovHYdDalrYM0p3xVmL9fZo0o3UrgSbp+caGkpkFl6LNjOW0rerC4E7tIpWYss959rx9CGcspqSKB4ZtIdmb515MKcJaLgCo6QrG0FPDEtBkHtIX3E0bhln6PPN0MU9cX2lPsEOIUuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739323896; c=relaxed/simple;
	bh=ZuJg3X/qySAGh1axKjEbUTy73TIgo+SA0h8J4hQ3y+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ksIw8UiQ/9NNqGotQ1CGJ4MTnq5scIIK4BhTq6An8sgD9Ty3F+7DqvIlkDqKuuTyPco68W+i3L0mDnMiZN3Wue63LgGKZjaE/Qle2YuirSgt9AFolebuofCfCp3GduNCTnxs6m2Ro1dM2BjleAZwGTk/gynXv8B03rgcqvpLzdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9f3yB4v; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9f3yB4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739323894; x=1770859894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZuJg3X/qySAGh1axKjEbUTy73TIgo+SA0h8J4hQ3y+0=;
  b=I9f3yB4vddoRFBi3wgYsmAVQ/KQHl1AatLI7mWka5m0utow7USqMR3Zr
   1SdgU46tvJy7/PmFHT+8zEFxGazWktd9at3VMlp5N11I5eusm0ZqOpiSR
   XHN2jz8kjjxW4E1Pkwre0zk9DmvV4elLCSwZfzgm8BZ9v/FfsuHoFlAIm
   ZOVn8Cb0Fva059m9UpNhGMrUGIskIfGT8bApmaQNxfZuzq8JJkwmaC6wD
   owfJ9fyWAhXxcJSjUXbaE1CMhAjLAmIpypXkv0Gh2QN8xvcWasMBq8dHN
   DtD84MbbnjlR9IdQ2HWbrK+I3PQ56cLbF56ix73EzDGbQK79Di3fD8VIl
   g==;
X-CSE-ConnectionGUID: 1rM/H1n5Q9Cewu+FSyDjnw==
X-CSE-MsgGUID: vNMXqrLgTs2AeFaEBI7OPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57373631"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="57373631"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 17:31:34 -0800
X-CSE-ConnectionGUID: pZ1DzCyOTC2JtfNGTWaMBg==
X-CSE-MsgGUID: 7DL8n2IhR1y5whkcBrn4tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="112430139"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2025 17:31:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti1b7-0014wV-19;
	Wed, 12 Feb 2025 01:31:29 +0000
Date: Wed, 12 Feb 2025 09:31:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 229/229]
 drivers/gpu/drm/mediatek/mtk_dp_v2.c:2587:6: warning: no previous prototype
 for function 'mtk_dp_dsc_support_v2'
Message-ID: <202502120952.lovK7Mo4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   69fc64873274f4b1c5a6c4617cc39b8d59fafbdf
commit: 85764b2d1983291b79a488b14f21f1a4baaa83f8 [229/229] CHROMIUM: drm/mediatek: add DSC support to DP
config: arm64-randconfig-003-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120952.lovK7Mo4-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120952.lovK7Mo4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120952.lovK7Mo4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2587:6: warning: no previous prototype for function 'mtk_dp_dsc_support_v2' [-Wmissing-prototypes]
   void mtk_dp_dsc_support_v2(struct mtk_dp *mtk_dp)
        ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2587:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_dp_dsc_support_v2(struct mtk_dp *mtk_dp)
   ^
   static 
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2595:6: warning: no previous prototype for function 'mtk_dp_dsc_enable_v2' [-Wmissing-prototypes]
   void mtk_dp_dsc_enable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
        ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2595:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_dp_dsc_enable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
   ^
   static 
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2625:6: warning: no previous prototype for function 'mtk_dp_dsc_disable_v2' [-Wmissing-prototypes]
   void mtk_dp_dsc_disable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
        ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2625:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_dp_dsc_disable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
   ^
   static 
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2655:6: warning: no previous prototype for function 'mtk_dp_set_chunk_size_v2' [-Wmissing-prototypes]
   void mtk_dp_set_chunk_size_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id,
        ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2655:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_dp_set_chunk_size_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id,
   ^
   static 
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2674:6: warning: no previous prototype for function 'mtk_dp_dsc_set_param_v2' [-Wmissing-prototypes]
   void mtk_dp_dsc_set_param_v2(struct mtk_dp *mtk_dp,
        ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2674:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_dp_dsc_set_param_v2(struct mtk_dp *mtk_dp,
   ^
   static 
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2700:6: warning: no previous prototype for function 'mtk_dp_dsc_set_pps_v2' [-Wmissing-prototypes]
   void mtk_dp_dsc_set_pps_v2(struct mtk_dp *mtk_dp,
        ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2700:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_dp_dsc_set_pps_v2(struct mtk_dp *mtk_dp,
   ^
   static 
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2719:6: warning: no previous prototype for function 'mtk_dp_dsc_pps_send_v2' [-Wmissing-prototypes]
   void mtk_dp_dsc_pps_send_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
        ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2719:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_dp_dsc_pps_send_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
   ^
   static 
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2725:6: warning: no previous prototype for function 'mtk_dp_dsc_parse_pps_param_v2' [-Wmissing-prototypes]
   void mtk_dp_dsc_parse_pps_param_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id, u8 *pps)
        ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2725:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_dp_dsc_parse_pps_param_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id, u8 *pps)
   ^
   static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3699:5: warning: variable 'data' set but not used [-Wunused-but-set-variable]
           u8 data;
              ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4259:6: warning: no previous prototype for function 'mtk_dp_hdcp_enable' [-Wmissing-prototypes]
   void mtk_dp_hdcp_enable(struct mtk_dp *mtk_dp)
        ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4259:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_dp_hdcp_enable(struct mtk_dp *mtk_dp)
   ^
   static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:6066:3: error: call to undeclared function 'mtk_dp_suspend_v2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   mtk_dp_suspend_v2(dev);
                   ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:6069:3: error: call to undeclared function 'mtk_dp_resume_v2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   mtk_dp_resume_v2(dev);
                   ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:6069:3: note: did you mean 'mtk_dp_read_v2'?
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:319:5: note: 'mtk_dp_read_v2' declared here
   u32 mtk_dp_read_v2(struct mtk_dp *mtk_dp, u32 offset)
       ^
   10 warnings and 2 errors generated.
--
>> drivers/gpu/drm/mediatek/mtk_dp_dsc.c:140:6: warning: no previous prototype for function 'mtk_dsc_start' [-Wmissing-prototypes]
   void mtk_dsc_start(struct device *dev)
        ^
   drivers/gpu/drm/mediatek/mtk_dp_dsc.c:140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_dsc_start(struct device *dev)
   ^
   static 
>> drivers/gpu/drm/mediatek/mtk_dp_dsc.c:149:6: warning: no previous prototype for function 'mtk_dsc_stop' [-Wmissing-prototypes]
   void mtk_dsc_stop(struct device *dev)
        ^
   drivers/gpu/drm/mediatek/mtk_dp_dsc.c:149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_dsc_stop(struct device *dev)
   ^
   static 
>> drivers/gpu/drm/mediatek/mtk_dp_dsc.c:156:6: warning: no previous prototype for function 'mtk_dsc_set_dsc_info' [-Wmissing-prototypes]
   void mtk_dsc_set_dsc_info(struct device *dev, const struct dsc_info *dsc_info)
        ^
   drivers/gpu/drm/mediatek/mtk_dp_dsc.c:156:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_dsc_set_dsc_info(struct device *dev, const struct dsc_info *dsc_info)
   ^
   static 
>> drivers/gpu/drm/mediatek/mtk_dp_dsc.c:168:6: warning: no previous prototype for function 'mtk_dsc_config' [-Wmissing-prototypes]
   void mtk_dsc_config(struct device *dev, unsigned int w, unsigned int h,
        ^
   drivers/gpu/drm/mediatek/mtk_dp_dsc.c:168:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_dsc_config(struct device *dev, unsigned int w, unsigned int h,
   ^
   static 
>> drivers/gpu/drm/mediatek/mtk_dp_dsc.c:404:5: warning: no previous prototype for function 'mtk_dsc_clk_enable' [-Wmissing-prototypes]
   int mtk_dsc_clk_enable(struct device *dev)
       ^
   drivers/gpu/drm/mediatek/mtk_dp_dsc.c:404:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mtk_dsc_clk_enable(struct device *dev)
   ^
   static 
>> drivers/gpu/drm/mediatek/mtk_dp_dsc.c:416:6: warning: no previous prototype for function 'mtk_dsc_clk_disable' [-Wmissing-prototypes]
   void mtk_dsc_clk_disable(struct device *dev)
        ^
   drivers/gpu/drm/mediatek/mtk_dp_dsc.c:416:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_dsc_clk_disable(struct device *dev)
   ^
   static 
   6 warnings generated.


vim +/mtk_dp_dsc_support_v2 +2587 drivers/gpu/drm/mediatek/mtk_dp_v2.c

  2586	
> 2587	void mtk_dp_dsc_support_v2(struct mtk_dp *mtk_dp)
  2588	{
  2589		mtk_dsc_read_dsc_dpcd_v2(mtk_dp, &mtk_dp->aux, mtk_dp->mtk_con[DP_FIRST_CON]->dsc_dpcd);
  2590	
  2591		dev_dbg(mtk_dp->dev, "sink dsc capable:%d\n",
  2592			drm_dp_sink_supports_dsc(mtk_dp->mtk_con[DP_FIRST_CON]->dsc_dpcd));
  2593	}
  2594	
> 2595	void mtk_dp_dsc_enable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
  2596	{
  2597		u32 reg_offset = DP_REG_OFFSET(encoder_id);
  2598	
  2599		dev_dbg(mtk_dp->dev, "DSC enable\n");
  2600	
  2601		WRITE_2BYTE_MASK(mtk_dp, REG_31C4_DP_ENCODER0_P0 + reg_offset,
  2602				 0,
  2603				 PPS_HW_BYPASS_MASK_DP_ENCODER0_P0_FLDMASK);
  2604	
  2605		/* [0] : DSC Enable */
  2606		WRITE_BYTE_MASK(mtk_dp,
  2607				REG_336C_DP_ENCODER1_P0 + reg_offset, BIT(0), BIT(0));
  2608		/* 300C [9] : VB-ID[6] DSC enable */
  2609		WRITE_BYTE_MASK(mtk_dp,
  2610				REG_300C_DP_ENCODER0_P0 + 1 + reg_offset, BIT(1), BIT(1));
  2611		/* 303C[10 : 8] : DSC color depth */
  2612		WRITE_BYTE_MASK(mtk_dp,
  2613				REG_303C_DP_ENCODER0_P0 + 1 + reg_offset,
  2614				0x7, GENMASK(2, 0));
  2615		/* 303C[14 : 12] : DSC color format */
  2616		WRITE_BYTE_MASK(mtk_dp,
  2617				REG_303C_DP_ENCODER0_P0 + 1 + reg_offset,
  2618				0x7 << 4, GENMASK(6, 4));
  2619		/* 31FC[12] : HDE last num control */
  2620		WRITE_2BYTE_MASK(mtk_dp, REG_31FC_DP_ENCODER0_P0 + reg_offset,
  2621				 0x2 << DE_LAST_NUM_SW_DP_ENCODER0_P0_FLDMASK_POS,
  2622				 DE_LAST_NUM_SW_DP_ENCODER0_P0_FLDMASK);
  2623	}
  2624	
> 2625	void mtk_dp_dsc_disable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
  2626	{
  2627		u32 reg_offset = DP_REG_OFFSET(encoder_id);
  2628	
  2629		dev_dbg(mtk_dp->dev, "DSC disable\n");
  2630	
  2631		WRITE_2BYTE_MASK(mtk_dp, REG_31C4_DP_ENCODER0_P0 + reg_offset,
  2632				 0,
  2633				 PPS_HW_BYPASS_MASK_DP_ENCODER0_P0_FLDMASK);
  2634	
  2635		/* DSC Disable */
  2636		WRITE_BYTE_MASK(mtk_dp,
  2637				REG_336C_DP_ENCODER1_P0 + reg_offset, 0, BIT(0));
  2638		WRITE_BYTE_MASK(mtk_dp,
  2639				REG_300C_DP_ENCODER0_P0 + 1 + reg_offset, 0, BIT(1));
  2640		/* default 8bit */
  2641		WRITE_BYTE_MASK(mtk_dp,
  2642				REG_303C_DP_ENCODER0_P0 + 1 + reg_offset,
  2643				0x3, GENMASK(2, 0));
  2644		/* default RGB */
  2645		WRITE_BYTE_MASK(mtk_dp,
  2646				REG_303C_DP_ENCODER0_P0 + 1 + reg_offset,
  2647				0x0, GENMASK(6, 4));
  2648	
  2649		/* 31FC[12] : HDE last num control */
  2650		/* 31FC[12] : HDE last num control */
  2651		WRITE_2BYTE_MASK(mtk_dp, REG_31FC_DP_ENCODER0_P0 + reg_offset,
  2652				 0, DE_LAST_NUM_SW_DP_ENCODER0_P0_FLDMASK);
  2653	}
  2654	
> 2655	void mtk_dp_set_chunk_size_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id,
  2656			u8 slice_num, u16 chunk_num, u8 remainder,
  2657			u8 lane_count, u32 hde_last_num, u8 hde_num_even)
  2658	{
  2659		u32 reg_offset = DP_REG_OFFSET(encoder_id);
  2660	
  2661		WRITE_BYTE_MASK(mtk_dp,
  2662				REG_336C_DP_ENCODER1_P0 + reg_offset,
  2663				slice_num << 4, GENMASK(7, 4));
  2664		WRITE_BYTE_MASK(mtk_dp,
  2665				REG_336C_DP_ENCODER1_P0 + 1 + reg_offset,
  2666				remainder, GENMASK(3, 0));
  2667		WRITE_2BYTE(mtk_dp,
  2668			    REG_3370_DP_ENCODER1_P0 + reg_offset, chunk_num - 1); /* set chunk_num */
  2669	
  2670		/* 0x31FC replaced by 0x3064 */
  2671		WRITE_2BYTE(mtk_dp, REG_3064_DP_ENCODER0_P0 + reg_offset, hde_last_num);
  2672	}
  2673	
> 2674	void mtk_dp_dsc_set_param_v2(struct mtk_dp *mtk_dp,
  2675			const enum dp_encoder_id encoder_id, union dp_pps *pps)
  2676	{
  2677		u16 chunk_num = pps->pps_raw[14] << 8 | pps->pps_raw[15];
  2678		u8 slice_num = (pps->pps_raw[8] << 8 | pps->pps_raw[9]) /
  2679						(pps->pps_raw[12] << 8 | pps->pps_raw[13]);
  2680		u32 hde_last_num = 0;
  2681		u32 hde_num_even = 0;
  2682		u8 lane_count = mtk_dp->training_info.link_lane_count;
  2683	
  2684		hde_last_num = (chunk_num % lane_count);
  2685		hde_num_even = chunk_num + (hde_last_num ? (lane_count - hde_last_num) : 0);
  2686		hde_last_num = ((hde_num_even + lane_count) * slice_num);
  2687		hde_last_num = DIV_ROUND_UP(hde_last_num,3);
  2688	
  2689		dev_dbg(mtk_dp->dev, "encoder_id = %d\n", encoder_id);
  2690		dev_dbg(mtk_dp->dev, "slice_num = %d\n", slice_num);
  2691		dev_dbg(mtk_dp->dev, "chunk_size = %d\n", chunk_num);
  2692		dev_dbg(mtk_dp->dev, "lane count = %d\n", lane_count);
  2693		dev_dbg(mtk_dp->dev, "hde_last_num = %d\n", hde_last_num);
  2694		dev_dbg(mtk_dp->dev, "hde_num_even = %d\n", hde_num_even);
  2695	
  2696		mtk_dp_set_chunk_size_v2(mtk_dp, encoder_id, slice_num - 1, chunk_num, chunk_num % 12,
  2697					 lane_count, hde_last_num, hde_num_even);
  2698	}
  2699	
> 2700	void mtk_dp_dsc_set_pps_v2(struct mtk_dp *mtk_dp,
  2701			const enum dp_encoder_id encoder_id, union dp_pps *pps, bool enable)
  2702	{
  2703		u8 hb[4] = {0x0, 0x10, 0x7F, 0x0};
  2704		int i;
  2705	
  2706		for (i = 0; i < 128; i += 8)
  2707			dev_dbg(mtk_dp->dev, "0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x\n",
  2708				pps->pps_raw[i + 0], pps->pps_raw[i + 1],
  2709				pps->pps_raw[i + 2], pps->pps_raw[i + 3],
  2710				pps->pps_raw[i + 4], pps->pps_raw[i + 5],
  2711				pps->pps_raw[i + 6], pps->pps_raw[i + 7]);
  2712	
  2713		mtk_dp_spkg_sdp_v2(mtk_dp, encoder_id, enable, DP_SDP_PKG_PPS0, hb, pps->pps_raw +  0);
  2714		mtk_dp_spkg_sdp_v2(mtk_dp, encoder_id, enable, DP_SDP_PKG_PPS1, hb, pps->pps_raw + 32);
  2715		mtk_dp_spkg_sdp_v2(mtk_dp, encoder_id, enable, DP_SDP_PKG_PPS2, hb, pps->pps_raw + 64);
  2716		mtk_dp_spkg_sdp_v2(mtk_dp, encoder_id, enable, DP_SDP_PKG_PPS3, hb, pps->pps_raw + 96);
  2717	}
  2718	
> 2719	void mtk_dp_dsc_pps_send_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
  2720	{
  2721		mtk_dp_dsc_set_pps_v2(mtk_dp, encoder_id, &mtk_dp->info[encoder_id].pps, true);
  2722		mtk_dp_dsc_set_param_v2(mtk_dp, encoder_id, &mtk_dp->info[encoder_id].pps);
  2723	}
  2724	
> 2725	void mtk_dp_dsc_parse_pps_param_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id, u8 *pps)
  2726	{
  2727		union dp_pps pps_struct;
  2728		u8 bpp;
  2729	
  2730		pps_struct.pps.major = (pps[0] >> 4) & 0xF;
  2731		dev_dbg(mtk_dp->dev, "major:%d\n", pps_struct.pps.major);
  2732		pps_struct.pps.minor = pps[0] & 0xF;
  2733		dev_dbg(mtk_dp->dev, "minor:%d\n", pps_struct.pps.minor);
  2734	
  2735		pps_struct.pps.color_depth = (pps[3] >> 4) & 0xF;
  2736		dev_dbg(mtk_dp->dev, "color_depth:%d\n", pps_struct.pps.color_depth);
  2737		pps_struct.pps.buffer_depth = pps[3] & 0xF;
  2738		dev_dbg(mtk_dp->dev, "buffer_depth:%d\n", pps_struct.pps.buffer_depth);
  2739	
  2740		pps_struct.pps.bp_enable = (pps[4] >> 5) & 0x1;
  2741		dev_dbg(mtk_dp->dev, "bp_enable:%d\n", pps_struct.pps.bp_enable);
  2742		pps_struct.pps.convert_rgb = (pps[4] >> 4) & 0x1;
  2743		dev_dbg(mtk_dp->dev, "convert_rgb:%d\n", pps_struct.pps.convert_rgb);
  2744		pps_struct.pps.simple_422 = (pps[4] >> 3) & 0x1;
  2745		dev_dbg(mtk_dp->dev, "simple_422:%d\n", pps_struct.pps.simple_422);
  2746		pps_struct.pps.vbr_enable = (pps[4] >> 1) & 0x1;
  2747		dev_dbg(mtk_dp->dev, "vbr_enable:%d\n", pps_struct.pps.vbr_enable);
  2748	
  2749		pps_struct.pps.bit_per_pixel = ((pps[4] & 0x3) << 4) |
  2750							(pps[5]  >> 4);
  2751		dev_dbg(mtk_dp->dev, "bit_per_pixel:%d\n", pps_struct.pps.bit_per_pixel);
  2752	
  2753		pps_struct.pps.pic_height = (pps[6] << 8) | pps[7];
  2754		dev_dbg(mtk_dp->dev, "pic_height:%d\n", pps_struct.pps.pic_height);
  2755		pps_struct.pps.pic_width = (pps[8] << 8) | pps[9];
  2756		dev_dbg(mtk_dp->dev, "pic_width:%d\n", pps_struct.pps.pic_width);
  2757		pps_struct.pps.slice_height = (pps[10] << 8) | pps[11];
  2758		dev_dbg(mtk_dp->dev, "slice_height:%d\n", pps_struct.pps.slice_height);
  2759		pps_struct.pps.slice_width = (pps[12] << 8) | pps[13];
  2760		dev_dbg(mtk_dp->dev, "slice_width:%d\n", pps_struct.pps.slice_width);
  2761		pps_struct.pps.chunk_size = (pps[14] << 8) | pps[15];
  2762		dev_dbg(mtk_dp->dev, "chunk_size:%d\n", pps_struct.pps.chunk_size);
  2763	
  2764		pps_struct.pps.native_420 = (pps[88] >> 1) & 0x1;
  2765		dev_dbg(mtk_dp->dev, "native_420:%d\n", pps_struct.pps.native_420);
  2766		pps_struct.pps.native_422 = pps[88] & 0x1;
  2767		dev_dbg(mtk_dp->dev, "native_422:%d\n", pps_struct.pps.native_422);
  2768	
  2769		bpp = ((pps[4] & 0x3) << 4) | (pps[5]  >> 4);
  2770		dev_dbg(mtk_dp->dev, "bpp:%d\n", bpp);
  2771	
  2772		memcpy(&mtk_dp->info[encoder_id].pps.pps_raw, pps, 128);
  2773	}
  2774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
