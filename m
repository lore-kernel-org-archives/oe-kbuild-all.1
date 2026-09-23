Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE16A3F0A85
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 08:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151162; cv=none; b=HBEfEwkT9V7H3eVr2auIUkzJMf2+WxxL7SPr563WCEzbxuJccCzGEynYi8bIaBL45OHGu/TSN6dRvPaZM/ltZPMTuYY8uYhrgkwVS0ppFoxWqgwQ3kaxdiB8aDg69lgeBN2cpogrSnmz6IG9D2XwvaxG+sZTa5Z+z74FWbqs8JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151162; c=relaxed/simple;
	bh=phJPnnj+OAn1AbXThDHr0slGGCEysM0n7apn4UaqE3w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XkArHEcGlXjpisFySwy8xCHaJLF3dQEY0bdi8SZwL5J3kTz0zSJj6i3RKyVxx7rpCn0XCwDX6HILaN/zkI3SHonnrOi4u5ts4rDyQ9BWqVqTSHSgxLjOOEAN/cC2nk2C3McFbQndjmeHLuKN1O6LaXytRaFwWf537ozPaQE5ViE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXco6E0d; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXco6E0d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790151160; x=1821687160;
  h=date:from:to:cc:subject:message-id;
  bh=phJPnnj+OAn1AbXThDHr0slGGCEysM0n7apn4UaqE3w=;
  b=gXco6E0dmW7Ed1Hfc7J1BFvWck4ZokCvGDJxYPFy7HD1Z8E+584NVT7j
   yeWw9f4CS+562anln9grK2PRA7BeKnitcV22YsJ6tTcaK6UVPFM/yQHWU
   Sl6gINZ97DYq9iBdNogprjq9kc70L70pIve1/bSzkziZ4mHtlhK71SRvi
   vJhgzw4q7dY7CFEiiNRsJHBxwIPgBx87eJt9iR9xk4cBKxCmxV+Lb+XaL
   hJrcMLUz3O2gZtTJlJ4YPSiu11UIx+B1FARVYYECmf89EDexWiIq3zSvj
   EN24fpZvvX2DekM6fysxHqvR3ozVlroXqf46kRgF684EeBXH/AYOF2o+T
   w==;
X-CSE-ConnectionGUID: uvkLAYPhSeivWbtslOc3OA==
X-CSE-MsgGUID: sq4Qf+O3RyeDkuTzYcLD4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="89954422"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="89954422"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 01:12:36 -0700
X-CSE-ConnectionGUID: r6EM80B9RbumRXXRs0gSQg==
X-CSE-MsgGUID: d15U6sEVQ5Om4BOjzCrhHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272710060"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2026 01:12:35 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9I5g-000000000Zj-2FuN;
	Wed, 23 Sep 2026 08:12:32 +0000
Date: Wed, 23 Sep 2026 10:11:40 +0200
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/gpu/drm/mediatek/mtk_disp_dsc.c:161:16: error:
 implicit declaration of function 'FIELD_PREP'
Message-ID: <202609231011.atHABTCC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-dsc-Add-MT8196-compatible/20260916-130813
head:   3c22fbab525978f915acc148875de1c4b7c78f5d
commit: 3d42094c53aebd08d6d4c0fd2539de44f28421c2 drm/mediatek: Implement Display Stream Compression support
date:   7 days ago
config: loongarch-randconfig-r2105-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231011.atHABTCC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231011.atHABTCC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231011.atHABTCC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_disp_dsc.c: In function 'mtk_dsc_pps_setup':
>> drivers/gpu/drm/mediatek/mtk_disp_dsc.c:161:16: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     161 |         data = FIELD_PREP(DSC_P0_UP_LINE_BUF_DEPTH, dsc_cfg->line_buf_depth);
         |                ^~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_disp_dsc.c: In function 'mtk_dsc_setup':
>> drivers/gpu/drm/mediatek/mtk_disp_dsc.c:305:33: error: implicit declaration of function 'FIELD_PREP_CONST' [-Wimplicit-function-declaration]
     305 |                 dsc_cfg_rval |= FIELD_PREP_CONST(DSC_CFG_FLATNESS_DET_THRES,
         |                                 ^~~~~~~~~~~~~~~~


vim +/FIELD_PREP +161 drivers/gpu/drm/mediatek/mtk_disp_dsc.c

   152	
   153	static void mtk_dsc_pps_setup(struct mtk_dsc *disp_dsc, struct drm_dsc_config *dsc_cfg)
   154	{
   155		struct drm_dsc_rc_range_parameters *rcrp = dsc_cfg->rc_range_params;
   156		u16 *rbt = dsc_cfg->rc_buf_thresh;
   157		u32 data;
   158		int i, j;
   159	
   160		/* PPS 0 - Note: Fractional BPP is not supported! */
 > 161		data = FIELD_PREP(DSC_P0_UP_LINE_BUF_DEPTH, dsc_cfg->line_buf_depth);
   162		data |= FIELD_PREP(DSC_P0_BPC, dsc_cfg->bits_per_component);
   163		data |= FIELD_PREP(DSC_P0_BPP, dsc_cfg->bits_per_pixel);
   164		data |= DSC_P0_RCT_ON | DSC_P0_BLOCK_PRED_EN;
   165		writel(data, disp_dsc->reg + DISP_REG_DSC_PPS(0));
   166	
   167		/* PPS 1 */
   168		data = FIELD_PREP(DSC_P1_INITIAL_XMIT_DELAY, dsc_cfg->initial_xmit_delay);
   169		data |= FIELD_PREP(DSC_P1_INITIAL_DEC_DELAY, dsc_cfg->initial_dec_delay);
   170		writel(data, disp_dsc->reg + DISP_REG_DSC_PPS(1));
   171	
   172		/* PPS 2 */
   173		data = FIELD_PREP(DSC_P2_INITIAL_SCALE_VALUE, dsc_cfg->initial_scale_value);
   174		data |= FIELD_PREP(DSC_P2_SCALE_INCR_INTERVAL, dsc_cfg->scale_increment_interval);
   175		writel(data, disp_dsc->reg + DISP_REG_DSC_PPS(2));
   176	
   177		/* PPS 3 */
   178		data = FIELD_PREP(DSC_P3_SCALE_DECR_INTERVAL, dsc_cfg->scale_decrement_interval);
   179		data |= FIELD_PREP(DSC_P3_FIRST_LINE_BPG_OFFSET, dsc_cfg->first_line_bpg_offset);
   180		writel(data, disp_dsc->reg + DISP_REG_DSC_PPS(3));
   181	
   182		/* PPS 4 */
   183		data = FIELD_PREP(DSC_P4_NFL_BPG_OFFSET, dsc_cfg->nfl_bpg_offset);
   184		data |= FIELD_PREP(DSC_P4_SLICE_BPG_OFFSET, dsc_cfg->slice_bpg_offset);
   185		writel(data, disp_dsc->reg + DISP_REG_DSC_PPS(4));
   186	
   187		/* PPS 5 */
   188		data = FIELD_PREP(DSC_P5_INITIAL_OFFSET, dsc_cfg->initial_offset);
   189		data |= FIELD_PREP(DSC_P5_FINAL_OFFSET, dsc_cfg->final_offset);
   190		writel(data, disp_dsc->reg + DISP_REG_DSC_PPS(5));
   191	
   192		/* PPS 6 */
   193		data = FIELD_PREP(DSC_P6_FLATNESS_MIN_QP, dsc_cfg->flatness_min_qp);
   194		data |= FIELD_PREP(DSC_P6_FLATNESS_MAX_QP, dsc_cfg->flatness_max_qp);
   195		data |= FIELD_PREP(DSC_P6_RC_MODEL_SIZE, dsc_cfg->rc_model_size);
   196		writel(data, disp_dsc->reg + DISP_REG_DSC_PPS(6));
   197	
   198		/* PPS 7 */
   199		data = FIELD_PREP(DSC_P7_RC_EDGE_FACTOR, dsc_cfg->rc_edge_factor);
   200		data |= FIELD_PREP(DSC_P7_RC_QUANT_INCR_LIMIT0, dsc_cfg->rc_quant_incr_limit0);
   201		data |= FIELD_PREP(DSC_P7_RC_QUANT_INCR_LIMIT1, dsc_cfg->rc_quant_incr_limit1);
   202		data |= FIELD_PREP(DSC_P7_RC_TGT_OFFSET_HI, dsc_cfg->rc_tgt_offset_high);
   203		data |= FIELD_PREP(DSC_P7_RC_TGT_OFFSET_LO, dsc_cfg->rc_tgt_offset_low);
   204		writel(data, disp_dsc->reg + DISP_REG_DSC_PPS(7));
   205	
   206		/* PPS 8..11 - Each register holds 4 RC buffer thresholds (PPS 11 has two) */
   207		for (i = 0; i < 4; i++) {
   208			u8 block_num = i * 4;
   209			data = 0;
   210	
   211			for (j = 0; j < 4; j++) {
   212				u8 buf_index = block_num + j;
   213				u8 data_shift = j * 8;
   214	
   215				/* rc_buf_thresh holds 14 elements in total */
   216				if (buf_index > 13)
   217					break;
   218	
   219				data |= (rbt[buf_index] & DSC_P8_RC_BUF_THR_X) << data_shift;
   220			}
   221			writel(data, disp_dsc->reg + DISP_REG_DSC_PPS(8 + i));
   222		}
   223	
   224		/* PPS 12..18 - Each register holds two sets of RC range parameters */
   225		for (i = 0; i < 7; i++) {
   226			u8 block_num = i * 2;
   227			data = 0;
   228	
   229			for (j = 0; j < 2; j++) {
   230				u8 buf_index = block_num + j;
   231				u8 data_shift = j * 16;
   232				u32 range_data;
   233	
   234				range_data = FIELD_PREP(DSC_P12_RC_RANGE_MIN_QP,
   235							 rcrp[buf_index].range_min_qp);
   236				range_data |= FIELD_PREP(DSC_P12_RC_RANGE_MAX_QP,
   237							 rcrp[buf_index].range_max_qp);
   238				range_data |= FIELD_PREP(DSC_P12_RC_RANGE_BPG_OFFSET,
   239							 rcrp[buf_index].range_bpg_offset);
   240				data |= range_data << data_shift;
   241	
   242				/* rc_range_params holds 15 elements in total */
   243				if (buf_index == 13)
   244					break;
   245			}
   246			writel(data, disp_dsc->reg + DISP_REG_DSC_PPS(12 + i));
   247		}
   248	
   249		/* PPS 19 - Last RC range register, holds only one set of parameters */
   250		writel(FIELD_PREP(DSC_P12_RC_RANGE_MIN_QP, rcrp[14].range_min_qp) |
   251		       FIELD_PREP(DSC_P12_RC_RANGE_MAX_QP, rcrp[14].range_max_qp) |
   252		       FIELD_PREP(DSC_P12_RC_RANGE_BPG_OFFSET, rcrp[14].range_bpg_offset),
   253		       disp_dsc->reg + DISP_REG_DSC_PPS(19));
   254	}
   255	
   256	void mtk_dsc_setup(struct device *dev, struct drm_dsc_config *dsc_cfg)
   257	{
   258		struct mtk_dsc *disp_dsc = dev_get_drvdata(dev);
   259		u32 dsc_slice_w, dsc_slice_h, dsc_mode, dsc_cfg_rval, dsc_shadow;
   260		u32 dsc_dbg_con, dsc_con, dsc_enc_width, dsc_pic_w, dsc_pic_h;
   261		u32 pic_group_width, pic_height_ext_num, slice_group_width;
   262		u32 chunk_size, dsc_pad_num, dsc_pre_pad_sz;
   263		bool dsc_en_bit;
   264	
   265		pic_height_ext_num = dsc_cfg->pic_height + dsc_cfg->slice_height - 1;
   266		pic_group_width = (dsc_cfg->slice_width * 4) / 3;
   267		slice_group_width = (dsc_cfg->slice_width + 2) / 3;
   268	
   269		if (dsc_cfg->slice_chunk_size)
   270			chunk_size = dsc_cfg->slice_chunk_size;
   271		else
   272			chunk_size = dsc_cfg->slice_width * dsc_cfg->bits_per_pixel / 8 / 16;
   273	
   274		dsc_enc_width = FIELD_PREP(DSC_ENC_WIDTH_PIC, dsc_cfg->pic_width) |
   275				FIELD_PREP(DSC_ENC_WIDTH_SLICE, dsc_cfg->slice_width);
   276	
   277		dsc_pic_w = FIELD_PREP(DSC_PIC_GROUP_WIDTH_M1, pic_group_width - 1);
   278		dsc_pic_w |= FIELD_PREP(DSC_PIC_WIDTH, dsc_cfg->pic_width);
   279		dsc_pic_h = FIELD_PREP(DSC_PIC_HEIGHT_EXT_M1, pic_height_ext_num - 1);
   280		dsc_pic_h |= FIELD_PREP(DSC_PIC_HEIGHT, dsc_cfg->pic_height - 1);
   281	
   282		dsc_slice_w = FIELD_PREP(DSC_SLICE_GROUP_WIDTH_M1, slice_group_width - 1);
   283		dsc_slice_w |= FIELD_PREP(DSC_SLICE_WIDTH, dsc_cfg->slice_width);
   284		dsc_slice_h = FIELD_PREP(DSC_SLICE_WIDTH_MOD3, dsc_cfg->slice_width % 3);
   285		dsc_slice_h |= FIELD_PREP(DSC_SLICE_NUM_M1,
   286					  (pic_height_ext_num / dsc_cfg->slice_height) - 1);
   287		dsc_slice_h |= FIELD_PREP(DSC_SLICE_HEIGHT_M1, dsc_cfg->slice_height - 1);
   288	
   289		dsc_pad_num = (3 - ((chunk_size * 2) % 3)) % 3;
   290		dsc_pad_num = FIELD_PREP(DSC_PAD_NUMBER, dsc_pad_num);
   291	
   292		dsc_pre_pad_sz = FIELD_PREP(DSC_PIC_PREPAD_HEIGHT, dsc_cfg->pic_height);
   293		dsc_pre_pad_sz |= FIELD_PREP(DSC_PIC_PREPAD_WIDTH, dsc_cfg->pic_width);
   294	
   295		dsc_mode = FIELD_PREP(DSC_INIT_DELAY_HEIGHT, 4);
   296		dsc_mode |= FIELD_PREP(DSC_RGB_SWAP, 0);
   297		dsc_mode |= FIELD_PREP(DSC_TWO_SLICE_MODE, (dsc_cfg->slice_count == 2));
   298	
   299		/* Must enable checksum calc in DBG if enabling core checksum in CFG */
   300		dsc_cfg_rval = DSC_CFG_ICH_EN | DSC_CFG_CRC_EN | DSC_CFG_DSC12_BUGFIX |
   301			       DSC_CFG_CORE_CHECKSUM;
   302		dsc_dbg_con = DSC_CKSM_CAL_EN;
   303	
   304		if (dsc_cfg->bits_per_component == 8)
 > 305			dsc_cfg_rval |= FIELD_PREP_CONST(DSC_CFG_FLATNESS_DET_THRES,
   306							 DSC_CFG_FLATNESS_8BITS);
   307		else
   308			dsc_cfg_rval |= FIELD_PREP_CONST(DSC_CFG_FLATNESS_DET_THRES,
   309							 DSC_CFG_FLATNESS_10BITS);
   310	
   311		dsc_shadow = FIELD_PREP(DSC_SHADOW_DSC_VERSION_MINOR,
   312					dsc_cfg->dsc_version_minor);
   313		dsc_shadow |= DSC_FORCE_COMMIT | DSC_BYPASS_SHADOW;
   314	
   315		/* If DSC is currently enabled, disable it before setup and re-enable after */
   316		dsc_con = readl(disp_dsc->reg + DISP_REG_DSC_CON);
   317		if (dsc_con & DSC_EN) {
   318			dsc_en_bit = true;
   319			writel(dsc_con & ~DSC_EN, disp_dsc->reg + DISP_REG_DSC_CON);
   320		} else {
   321			dsc_en_bit = false;
   322		}
   323	
   324		writel(0, disp_dsc->reg + DISP_REG_DSC_SPR);
   325		writel(dsc_enc_width, disp_dsc->reg + DISP_REG_DSC_ENC_WIDTH);
   326		writel(dsc_pic_w, disp_dsc->reg + DISP_REG_DSC_PIC_W);
   327		writel(dsc_pic_h, disp_dsc->reg + DISP_REG_DSC_PIC_H);
   328		writel(dsc_slice_w, disp_dsc->reg + DISP_REG_DSC_SLICE_W);
   329		writel(dsc_slice_h, disp_dsc->reg + DISP_REG_DSC_SLICE_H);
   330		writel(((chunk_size * 4) / 3) << 16 | chunk_size,
   331		       disp_dsc->reg + DISP_REG_DSC_CHUNK_SIZE);
   332		writel(dsc_pre_pad_sz, disp_dsc->reg + DISP_REG_DSC_PIC_PRE_PAD_SIZE);
   333		writel(dsc_pad_num, disp_dsc->reg + DISP_REG_DSC_PAD);
   334		writel(FIELD_PREP(DISP_DSC_BUF_SIZE_MASK, chunk_size * dsc_cfg->slice_height),
   335		       disp_dsc->reg + DISP_REG_DSC_BUF_SIZE);
   336		writel(dsc_mode, disp_dsc->reg + DISP_REG_DSC_MODE);
   337		writel(dsc_cfg_rval, disp_dsc->reg + DISP_REG_DSC_CFG);
   338		writel(dsc_dbg_con, disp_dsc->reg + DISP_REG_DSC_DBG_CON);
   339		writel(FIELD_PREP_CONST(DSC_OBUF_SIZE, 1040), disp_dsc->reg + DISP_REG_DSC_OUTBUF);
   340		writel(dsc_shadow, disp_dsc->reg + DISP_REG_DSC_SHADOW);
   341	
   342		/* Set PPS registers configuration */
   343		mtk_dsc_pps_setup(disp_dsc, dsc_cfg);
   344	
   345		dsc_con = FIELD_PREP_CONST(DSC_EMPTY_FLAG_SEL, DSC_EMPTY_FLAG_ALWAYS_LOW);
   346		dsc_con |= DSC_V1_1_EXT | DSC_UFOE_SEL | DSC_PT_MEM_EN;
   347		dsc_con |= DSC_ZERO_FIFO_STALL_DISABLE;
   348	
   349		if (dsc_en_bit)
   350			dsc_con |= DSC_EN;
   351	
   352		writel(dsc_con, disp_dsc->reg + DISP_REG_DSC_CON);
   353	
   354		disp_dsc->dsc_config_done = true;
   355	}
   356	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
