Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3324E12B93
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 00:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739319447; cv=none; b=nl+FCV2DfA8nkw326s9kMxsJFqBUk6Pa1KF/PDag8XgUE/kKJwN4anoIptvxZSJa6bTMZrZyuDkxeVX7NBR5pZdoaV/Prns7kGMpgZhvPC0hodfcUjSlS54N7m3bg3lIVrjBydOcguvyoJw4bIQFxBoZL5qUDJ3cfI2polZEqI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739319447; c=relaxed/simple;
	bh=y8M8I1KMNRJE0Hr0l6LgGWIcNrH3fxuH3EqwtEqDxWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D/EUfhbkVEU629Y9jBQKaGNLouqo6FgWVmJSe5ViBTEHrw8qdmdcLgIMfHtASc5vTRIXXy/i0XiB6boGePt7LiOSlSdfvuhsm+zkXcnEIYmpCkBZzMzeBZFRnhOdYT6wOyBM/BxLlC5GfjUC0IOfuAvWA7wVCgQCXuJ+vSiWPkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMdTMRm0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMdTMRm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739319445; x=1770855445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y8M8I1KMNRJE0Hr0l6LgGWIcNrH3fxuH3EqwtEqDxWg=;
  b=YMdTMRm016eengIthL1WlSNK1fZQ5487j88I2DCZrNS3SO/wTf2zLvcc
   o7ds73uN/dNE/BX5sEyxFx23b8O5G0KbXYLfoOb9F5f6aMSqW73lKjkqD
   VQBsaMjYc7GvLm45J4tCBHEtiofctPNlCKFNyMp5iil1unBJXcVsG+Ec6
   iLtbn0jXEuiYYaPj8ZKlOW1HjRt92GjQEKdKt4flXyPoR6DMdkt/1KLwJ
   PJgaXvyflf6w2yd0yWc46yWbkJ/ZQFXW4ylknIkzBIFUncbMyF+T07bS8
   h0mWJe3m65q+BCEMIxfbTfFw1LybCpz+PeoNr9bU4gML6wtJWooB8q3Tb
   g==;
X-CSE-ConnectionGUID: K7KcXddnTtCbuXgTqdi5IA==
X-CSE-MsgGUID: hHFXnrQmQ+6fCb2mTfGUag==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57495848"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="57495848"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 16:17:24 -0800
X-CSE-ConnectionGUID: hD7xu2/FT7CTehonFqZr2w==
X-CSE-MsgGUID: GOjIDkJRSnKJBVQCcqvZDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="112488940"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Feb 2025 16:17:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti0RN-0014s3-1H;
	Wed, 12 Feb 2025 00:17:21 +0000
Date: Wed, 12 Feb 2025 08:16:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 229/229]
 drivers/gpu/drm/mediatek/mtk_dp_dsc.c:140:6: warning: no previous prototype
 for 'mtk_dsc_start'
Message-ID: <202502120854.JqnBRR8c-lkp@intel.com>
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
config: arm64-randconfig-001-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120854.JqnBRR8c-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120854.JqnBRR8c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120854.JqnBRR8c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_dp_dsc.c:140:6: warning: no previous prototype for 'mtk_dsc_start' [-Wmissing-prototypes]
     140 | void mtk_dsc_start(struct device *dev)
         |      ^~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp_dsc.c:149:6: warning: no previous prototype for 'mtk_dsc_stop' [-Wmissing-prototypes]
     149 | void mtk_dsc_stop(struct device *dev)
         |      ^~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp_dsc.c:156:6: warning: no previous prototype for 'mtk_dsc_set_dsc_info' [-Wmissing-prototypes]
     156 | void mtk_dsc_set_dsc_info(struct device *dev, const struct dsc_info *dsc_info)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp_dsc.c:168:6: warning: no previous prototype for 'mtk_dsc_config' [-Wmissing-prototypes]
     168 | void mtk_dsc_config(struct device *dev, unsigned int w, unsigned int h,
         |      ^~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp_dsc.c:404:5: warning: no previous prototype for 'mtk_dsc_clk_enable' [-Wmissing-prototypes]
     404 | int mtk_dsc_clk_enable(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp_dsc.c:416:6: warning: no previous prototype for 'mtk_dsc_clk_disable' [-Wmissing-prototypes]
     416 | void mtk_dsc_clk_disable(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2587:6: warning: no previous prototype for 'mtk_dp_dsc_support_v2' [-Wmissing-prototypes]
    2587 | void mtk_dp_dsc_support_v2(struct mtk_dp *mtk_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2595:6: warning: no previous prototype for 'mtk_dp_dsc_enable_v2' [-Wmissing-prototypes]
    2595 | void mtk_dp_dsc_enable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2625:6: warning: no previous prototype for 'mtk_dp_dsc_disable_v2' [-Wmissing-prototypes]
    2625 | void mtk_dp_dsc_disable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2655:6: warning: no previous prototype for 'mtk_dp_set_chunk_size_v2' [-Wmissing-prototypes]
    2655 | void mtk_dp_set_chunk_size_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2674:6: warning: no previous prototype for 'mtk_dp_dsc_set_param_v2' [-Wmissing-prototypes]
    2674 | void mtk_dp_dsc_set_param_v2(struct mtk_dp *mtk_dp,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2700:6: warning: no previous prototype for 'mtk_dp_dsc_set_pps_v2' [-Wmissing-prototypes]
    2700 | void mtk_dp_dsc_set_pps_v2(struct mtk_dp *mtk_dp,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2719:6: warning: no previous prototype for 'mtk_dp_dsc_pps_send_v2' [-Wmissing-prototypes]
    2719 | void mtk_dp_dsc_pps_send_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:2725:6: warning: no previous prototype for 'mtk_dp_dsc_parse_pps_param_v2' [-Wmissing-prototypes]
    2725 | void mtk_dp_dsc_parse_pps_param_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id, u8 *pps)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c: In function 'mtk_dp_video_config_v2':
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3699:12: warning: variable 'data' set but not used [-Wunused-but-set-variable]
    3699 |         u8 data;
         |            ^~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c: At top level:
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4259:6: warning: no previous prototype for 'mtk_dp_hdcp_enable' [-Wmissing-prototypes]
    4259 | void mtk_dp_hdcp_enable(struct mtk_dp *mtk_dp)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4632:18: warning: initialized field overwritten [-Woverride-init]
    4632 |         .reset = drm_atomic_helper_connector_reset,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4632:18: note: (near initialization for 'mtk_dp_con_funcs.reset')
--
>> drivers/gpu/drm/mediatek/mtk_dpi_v2.c:181: warning: Function parameter or member 'dsc_support' not described in 'mtk_dpi_conf'
   drivers/gpu/drm/mediatek/mtk_dpi_v2.c:181: warning: Function parameter or member 'use_version_2' not described in 'mtk_dpi_conf'


vim +/mtk_dsc_start +140 drivers/gpu/drm/mediatek/mtk_dp_dsc.c

   139	
 > 140	void mtk_dsc_start(struct device *dev)
   141	{
   142		struct mtk_dsc *dsc = dev_get_drvdata(dev);
   143	
   144		mtk_dsc_write_mask(dsc, DISP_REG_DSC_CON, DSC_EN, DSC_EN);
   145	
   146		dev_dbg(dsc->dev, "DSC_CON:0x%x", mtk_dsc_read(dsc, DISP_REG_DSC_CON));
   147	}
   148	
 > 149	void mtk_dsc_stop(struct device *dev)
   150	{
   151		struct mtk_dsc *dsc = dev_get_drvdata(dev);
   152	
   153		mtk_dsc_write_mask(dsc, DISP_REG_DSC_CON, 0x0, DSC_EN);
   154	}
   155	
 > 156	void mtk_dsc_set_dsc_info(struct device *dev, const struct dsc_info *dsc_info)
   157	{
   158		struct mtk_dsc *mtk_dsc = dev_get_drvdata(dev);
   159	
   160		if (dsc_info) {
   161			mtk_dsc->compression_enable = dsc_info->compression_enable;
   162			memcpy(&mtk_dsc->dsc_cfg, &dsc_info->dsc_config, sizeof(struct drm_dsc_config));
   163		}
   164	
   165		dev_dbg(dev, "set dsc info, compression_enable:%d\n", mtk_dsc->compression_enable);
   166	}
   167	
 > 168	void mtk_dsc_config(struct device *dev, unsigned int w, unsigned int h,
   169			unsigned int vrefresh, unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
   170	{
   171		struct mtk_dsc *dsc = dev_get_drvdata(dev);
   172		unsigned int init_delay_limit, init_delay_height_min, init_delay_height;
   173		unsigned int pic_group_width, pic_height_ext_num;
   174		unsigned int slice_group_width;
   175		unsigned int pad_num;
   176		unsigned int bp_enable;
   177		unsigned int slice_mode;
   178		unsigned int rgb_swap = 0;
   179		unsigned int dsc_cfg = 0xb687d82b;
   180	
   181		dev_dbg(dsc->dev, "w:%d, h:%d, compression_enable:%d\n", w, h, dsc->compression_enable);
   182	
   183		if(dsc->data->dsc_bypass_enable) {
   184			mtk_dsc_write_mask(dsc, DISP_REG_DSC_CON, DSC_BYPASS , DSC_BYPASS);
   185			mtk_dsc_write_mask(dsc, DISP_REG_DSC_CON, DSC_UFOE_SEL , DSC_UFOE_SEL);
   186			mtk_dsc_write_mask(dsc, DISP_REG_DSC_CON, DSC_DUAL_INOUT , DSC_DUAL_INOUT);
   187			return;
   188		}
   189	
   190		if (!dsc->compression_enable) {
   191			mtk_dsc_write_mask(dsc, DISP_REG_DSC_CON, DSC_RELAY, DSC_RELAY);
   192			mtk_dsc_write_mask(dsc, DISP_REG_DSC_CHUNK_SIZE, w << 16, GENMASK(31, 16));
   193			mtk_dsc_write_mask(dsc, DISP_REG_DSC_PIC_W, w, GENMASK(15, 0));
   194			mtk_dsc_write_mask(dsc, DISP_REG_DSC_PIC_H, h, GENMASK(15, 0));
   195			return;
   196		}
   197	
   198		bp_enable = dsc->dsc_cfg.block_pred_enable ? 1 : 0;
   199		slice_mode = dsc->dsc_cfg.pic_width / dsc->dsc_cfg.slice_width - 1;
   200		pic_group_width = (dsc->dsc_cfg.pic_width + 2) / 3;
   201		pic_height_ext_num = (h + dsc->dsc_cfg.slice_height - 1) / dsc->dsc_cfg.slice_height;
   202		slice_group_width = (dsc->dsc_cfg.slice_width + 2) / 3;
   203		pad_num = (dsc->dsc_cfg.slice_chunk_size * (slice_mode + 1) + 2) / 3 * 3
   204			- dsc->dsc_cfg.slice_chunk_size * (slice_mode + 1);
   205		init_delay_limit = ((128 + (dsc->dsc_cfg.initial_xmit_delay + 2) / 3) * 3
   206			+ dsc->dsc_cfg.slice_width - 1) / dsc->dsc_cfg.slice_width;
   207		init_delay_height_min = (init_delay_limit > 15) ? 15 : init_delay_limit;
   208		init_delay_height = init_delay_height_min;
   209	
   210		mtk_dsc_write_mask(dsc, DISP_REG_DSC_CON, 0, DSC_EN);
   211		mtk_dsc_write_mask(dsc, DISP_REG_DSC_CON, 0, DSC_DUAL_INOUT);
   212		mtk_dsc_write_mask(dsc, DISP_REG_DSC_CON, 0, DSC_IN_SRC_SEL);
   213		mtk_dsc_write_mask(dsc, DISP_REG_DSC_CON, 0, DSC_BYPASS);
   214		mtk_dsc_write_mask(dsc, DISP_REG_DSC_CON, 0, DSC_RELAY);
   215		mtk_dsc_write_mask(dsc, DISP_REG_DSC_CON, DSC_PT_MEM_EN, DSC_PT_MEM_EN);
   216		mtk_dsc_write_mask(dsc, DISP_REG_DSC_CON, DSC_EMPTY_FLAG_ALWAYS_LOW, DSC_EMPTY_FLAG_SEL);
   217		mtk_dsc_write_mask(dsc, DISP_REG_DSC_CON, DSC_UFOE_SEL, DSC_UFOE_SEL);
   218		mtk_dsc_write_mask(dsc, DISP_REG_DSC_CON, DSC_ZERO_FIFO_STALL_DISABLE,
   219			DSC_ZERO_FIFO_STALL_DISABLE);
   220	
   221		mtk_dsc_write_mask(dsc, DISP_REG_DSC_INTEN, 0x7F, DSC_INTEN_SEL);
   222	
   223		mtk_dsc_write_mask(dsc, DISP_REG_DSC_INTACK, DSC_INTACK_BUF_UNDERFLOW, DSC_INTACK_SEL);
   224	
   225		mtk_dsc_write_mask(dsc, DISP_REG_DSC_INTACK, DSC_INTACK_BUF_UNDERFLOW, DSC_INTACK_SEL);
   226	
   227		mtk_dsc_write(dsc, DISP_REG_DSC_SPR, 0x0);
   228	
   229		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PIC_W, w, GENMASK(15, 0));
   230		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PIC_W, (pic_group_width - 1) << 16, GENMASK(31, 16));
   231	
   232		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PIC_H, (h - 1), GENMASK(15, 0));
   233		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PIC_H,
   234			(pic_height_ext_num * dsc->dsc_cfg.slice_height - 1) << 16, GENMASK(31, 16));
   235	
   236		mtk_dsc_write_mask(dsc, DISP_REG_DSC_SLICE_W, dsc->dsc_cfg.slice_width, GENMASK(15, 0));
   237		mtk_dsc_write_mask(dsc, DISP_REG_DSC_SLICE_W, (slice_group_width - 1) << 16, GENMASK(31, 16));
   238	
   239		mtk_dsc_write_mask(dsc, DISP_REG_DSC_SLICE_H, (dsc->dsc_cfg.slice_height - 1), GENMASK(15, 0));
   240		mtk_dsc_write_mask(dsc, DISP_REG_DSC_SLICE_H, (pic_height_ext_num - 1) << 16, GENMASK(29, 16));
   241		mtk_dsc_write_mask(dsc, DISP_REG_DSC_SLICE_H,
   242			(dsc->dsc_cfg.slice_width % 3) << 30, GENMASK(31, 30));
   243	
   244		mtk_dsc_write_mask(dsc, DISP_REG_DSC_CHUNK_SIZE, dsc->dsc_cfg.slice_chunk_size, GENMASK(15, 0));
   245		mtk_dsc_write_mask(dsc, DISP_REG_DSC_CHUNK_SIZE,
   246			(((dsc->dsc_cfg.slice_chunk_size << slice_mode) + 2) / 3) << 16, GENMASK(31, 16));
   247	
   248		mtk_dsc_write_mask(dsc, DISP_REG_DSC_BUF_SIZE,
   249			dsc->dsc_cfg.slice_chunk_size * dsc->dsc_cfg.slice_height, GENMASK(23, 0));
   250	
   251		mtk_dsc_write_mask(dsc, DISP_REG_DSC_MODE, slice_mode, BIT(0));
   252		mtk_dsc_write_mask(dsc, DISP_REG_DSC_MODE, rgb_swap << 2, BIT(2));
   253		mtk_dsc_write_mask(dsc, DISP_REG_DSC_MODE, init_delay_height << 8, GENMASK(11, 8));
   254	
   255		mtk_dsc_write(dsc, DISP_REG_DSC_CFG, dsc_cfg);
   256	
   257		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PAD, pad_num, GENMASK(2, 0));
   258	
   259		mtk_dsc_write_mask(dsc, DISP_REG_DSC_ENC_WIDTH, dsc->dsc_cfg.pic_width << 16, GENMASK(31, 16));
   260		mtk_dsc_write_mask(dsc, DISP_REG_DSC_ENC_WIDTH, dsc->dsc_cfg.slice_width, GENMASK(15, 0));
   261	
   262		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PIC_PRE_PAD_SIZE, h, DSC_PIC_PREPAD_HEIGHT_SEL);
   263		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PIC_PRE_PAD_SIZE, w << 16, DSC_PIC_PREPAD_WIDTH_SEL);
   264	
   265		mtk_dsc_write_mask(dsc, DISP_REG_DSC_DBG_CON, BIT(9), BIT(9));
   266	
   267		mtk_dsc_write(dsc, DISP_REG_DSC_OBUF, 0x410);
   268	
   269		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS0, (dsc->dsc_cfg.line_buf_depth == 0) ?
   270			0x9 : dsc->dsc_cfg.line_buf_depth, GENMASK(3, 0));
   271	
   272		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS0, (dsc->dsc_cfg.bits_per_component == 0) ?
   273			0x8 << 4 : dsc->dsc_cfg.bits_per_component << 4, GENMASK(7, 4));
   274	
   275		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS0, (dsc->dsc_cfg.bits_per_pixel == 0) ?
   276			0x80 << 8 : dsc->dsc_cfg.bits_per_pixel << 8, GENMASK(17, 8));
   277	
   278		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS0, (dsc->dsc_cfg.convert_rgb == 0) ?
   279			BIT(18) : dsc->dsc_cfg.convert_rgb << 18, BIT(18));
   280	
   281		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS0, bp_enable << 19, BIT(19));
   282	
   283		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS1, (dsc->dsc_cfg.initial_dec_delay == 0) ?
   284			0x268 << 16 : dsc->dsc_cfg.initial_dec_delay << 16, GENMASK(31, 16));
   285	
   286		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS1, (dsc->dsc_cfg.initial_xmit_delay == 0) ?
   287			0x200 : dsc->dsc_cfg.initial_xmit_delay, GENMASK(15, 0));
   288	
   289		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS2, (dsc->dsc_cfg.initial_scale_value == 0) ?
   290			0x20 : dsc->dsc_cfg.initial_scale_value, GENMASK(15, 0));
   291	
   292		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS2, (dsc->dsc_cfg.scale_increment_interval == 0) ?
   293			0x387 << 16 : dsc->dsc_cfg.scale_increment_interval << 16, GENMASK(31, 16));
   294	
   295		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS3, (dsc->dsc_cfg.first_line_bpg_offset == 0) ?
   296			0xc << 16 : dsc->dsc_cfg.first_line_bpg_offset << 16, GENMASK(31, 16));
   297	
   298		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS3, (dsc->dsc_cfg.scale_decrement_interval == 0) ?
   299			0xa : dsc->dsc_cfg.scale_decrement_interval, GENMASK(15, 0));
   300	
   301		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS4, (dsc->dsc_cfg.nfl_bpg_offset == 0) ?
   302			0x319 : dsc->dsc_cfg.nfl_bpg_offset, GENMASK(15, 0));
   303	
   304		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS4, (dsc->dsc_cfg.slice_bpg_offset == 0) ?
   305			0x263 << 16 : dsc->dsc_cfg.slice_bpg_offset << 16, GENMASK(31, 16));
   306	
   307		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS5, (dsc->dsc_cfg.initial_offset == 0) ?
   308			0x1800 : dsc->dsc_cfg.initial_offset, GENMASK(15, 0));
   309	
   310		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS5, (dsc->dsc_cfg.final_offset == 0) ?
   311			0x10f0 << 16 : dsc->dsc_cfg.final_offset << 16, GENMASK(31, 16));
   312	
   313		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS6, (dsc->dsc_cfg.flatness_min_qp == 0) ?
   314			0x3 : dsc->dsc_cfg.flatness_min_qp, GENMASK(4, 0));
   315	
   316		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS6, (dsc->dsc_cfg.flatness_max_qp == 0) ?
   317			0xc << 8 : dsc->dsc_cfg.flatness_max_qp << 8, GENMASK(12, 8));
   318	
   319		mtk_dsc_write_mask(dsc, DISP_REG_DSC_PPS6, (dsc->dsc_cfg.rc_model_size == 0) ?
   320			0x2000 << 16 : dsc->dsc_cfg.rc_model_size << 16, GENMASK(31, 16));
   321	
   322		mtk_dsc_write(dsc, DISP_REG_DSC_PPS7, dsc->dsc_cfg.rc_tgt_offset_low << 28 |
   323			dsc->dsc_cfg.rc_tgt_offset_high << 24 |
   324			dsc->dsc_cfg.rc_quant_incr_limit1 << 16 |
   325			dsc->dsc_cfg.rc_quant_incr_limit0 << 8 |
   326			dsc->dsc_cfg.rc_edge_factor);
   327	
   328		mtk_dsc_write(dsc, DISP_REG_DSC_PPS8, dsc->dsc_cfg.rc_buf_thresh[3] << 24 |
   329			dsc->dsc_cfg.rc_buf_thresh[2] << 16 |
   330			dsc->dsc_cfg.rc_buf_thresh[1] << 8 |
   331			dsc->dsc_cfg.rc_buf_thresh[0]);
   332		mtk_dsc_write(dsc, DISP_REG_DSC_PPS9, dsc->dsc_cfg.rc_buf_thresh[7] << 24 |
   333			dsc->dsc_cfg.rc_buf_thresh[6] << 16 |
   334			dsc->dsc_cfg.rc_buf_thresh[5] << 8 |
   335			dsc->dsc_cfg.rc_buf_thresh[4]);
   336		mtk_dsc_write(dsc, DISP_REG_DSC_PPS10, dsc->dsc_cfg.rc_buf_thresh[11] << 24 |
   337			dsc->dsc_cfg.rc_buf_thresh[10] << 16 |
   338			dsc->dsc_cfg.rc_buf_thresh[9] << 8 |
   339			dsc->dsc_cfg.rc_buf_thresh[8]);
   340		mtk_dsc_write(dsc, DISP_REG_DSC_PPS11, dsc->dsc_cfg.rc_buf_thresh[13] << 8 |
   341			dsc->dsc_cfg.rc_buf_thresh[12]);
   342		mtk_dsc_write(dsc, DISP_REG_DSC_PPS12,
   343			dsc->dsc_cfg.rc_range_params[1].range_bpg_offset << 26 |
   344			dsc->dsc_cfg.rc_range_params[1].range_max_qp << 21 |
   345			dsc->dsc_cfg.rc_range_params[1].range_min_qp << 16 |
   346			dsc->dsc_cfg.rc_range_params[0].range_bpg_offset << 10 |
   347			dsc->dsc_cfg.rc_range_params[0].range_max_qp << 5 |
   348			dsc->dsc_cfg.rc_range_params[0].range_min_qp);
   349		mtk_dsc_write(dsc, DISP_REG_DSC_PPS13,
   350			dsc->dsc_cfg.rc_range_params[3].range_bpg_offset << 26 |
   351			dsc->dsc_cfg.rc_range_params[3].range_max_qp << 21 |
   352			dsc->dsc_cfg.rc_range_params[3].range_min_qp << 16 |
   353			dsc->dsc_cfg.rc_range_params[2].range_bpg_offset << 10 |
   354			dsc->dsc_cfg.rc_range_params[2].range_max_qp << 5 |
   355			dsc->dsc_cfg.rc_range_params[2].range_min_qp);
   356		mtk_dsc_write(dsc, DISP_REG_DSC_PPS14,
   357			dsc->dsc_cfg.rc_range_params[5].range_bpg_offset << 26 |
   358			dsc->dsc_cfg.rc_range_params[5].range_max_qp << 21 |
   359			dsc->dsc_cfg.rc_range_params[5].range_min_qp << 16 |
   360			dsc->dsc_cfg.rc_range_params[4].range_bpg_offset << 10 |
   361			dsc->dsc_cfg.rc_range_params[4].range_max_qp << 5 |
   362			dsc->dsc_cfg.rc_range_params[4].range_min_qp);
   363		mtk_dsc_write(dsc, DISP_REG_DSC_PPS15,
   364			dsc->dsc_cfg.rc_range_params[7].range_bpg_offset << 26 |
   365			dsc->dsc_cfg.rc_range_params[7].range_max_qp << 21 |
   366			dsc->dsc_cfg.rc_range_params[7].range_min_qp << 16 |
   367			dsc->dsc_cfg.rc_range_params[6].range_bpg_offset << 10 |
   368			dsc->dsc_cfg.rc_range_params[6].range_max_qp << 5 |
   369			dsc->dsc_cfg.rc_range_params[6].range_min_qp);
   370		mtk_dsc_write(dsc, DISP_REG_DSC_PPS16,
   371			dsc->dsc_cfg.rc_range_params[9].range_bpg_offset << 26 |
   372			dsc->dsc_cfg.rc_range_params[9].range_max_qp << 21 |
   373			dsc->dsc_cfg.rc_range_params[9].range_min_qp << 16 |
   374			dsc->dsc_cfg.rc_range_params[8].range_bpg_offset << 10 |
   375			dsc->dsc_cfg.rc_range_params[8].range_max_qp << 5 |
   376			dsc->dsc_cfg.rc_range_params[8].range_min_qp);
   377		mtk_dsc_write(dsc, DISP_REG_DSC_PPS17,
   378			dsc->dsc_cfg.rc_range_params[11].range_bpg_offset << 26 |
   379			dsc->dsc_cfg.rc_range_params[11].range_max_qp << 21 |
   380			dsc->dsc_cfg.rc_range_params[11].range_min_qp << 16 |
   381			dsc->dsc_cfg.rc_range_params[10].range_bpg_offset << 10 |
   382			dsc->dsc_cfg.rc_range_params[10].range_max_qp << 5 |
   383			dsc->dsc_cfg.rc_range_params[10].range_min_qp);
   384		mtk_dsc_write(dsc, DISP_REG_DSC_PPS18,
   385			dsc->dsc_cfg.rc_range_params[13].range_bpg_offset << 26 |
   386			dsc->dsc_cfg.rc_range_params[13].range_max_qp << 21 |
   387			dsc->dsc_cfg.rc_range_params[13].range_min_qp << 16 |
   388			dsc->dsc_cfg.rc_range_params[12].range_bpg_offset << 10 |
   389			dsc->dsc_cfg.rc_range_params[12].range_max_qp << 5 |
   390			dsc->dsc_cfg.rc_range_params[12].range_min_qp);
   391		mtk_dsc_write(dsc, DISP_REG_DSC_PPS19,
   392			dsc->dsc_cfg.rc_range_params[14].range_bpg_offset << 10 |
   393			dsc->dsc_cfg.rc_range_params[14].range_max_qp << 5 |
   394			dsc->dsc_cfg.rc_range_params[14].range_min_qp);
   395	
   396		if (dsc->dsc_cfg.dsc_version_minor == 1)
   397			mtk_dsc_write(dsc, DISP_REG_DSC_SHADOW, 0x20);
   398		else if (dsc->dsc_cfg.dsc_version_minor == 2)
   399			mtk_dsc_write(dsc, DISP_REG_DSC_SHADOW, 0x40);
   400		else
   401			dev_dbg(dev, "wrong version minor:%d", dsc->dsc_cfg.dsc_version_minor);
   402	}
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
