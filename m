Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61813421239
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 09:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155019; cv=none; b=lib0vkREET9EIl+s6MuUT5ZmVUiz8RYQI1BgsUCo7RPhhScl5Ea7He/kpGytt2IL+XHJ3mTBDKuR4Lvtdqvzi0dYLPYIupGkOLbD6Ba6L59spZBs2NJwXC1c/bNUONxry9mhpHuTTmS7OlxB7wLnz42dyScGvmT7EEIND+ku3PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155019; c=relaxed/simple;
	bh=H6E3v78gNPOL/L5EfC73UQqr/mhZZhhGahHi6/lRyAU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ffw0dqyxDzsGAsCoa1nhECcfIdOyFMrJTDG0WsqvaSFhS21NcuElaJ3Y8pAbJmlxu67YOxM+1DegNXCEg9/c//L73ejLGFWetAV6g5hmai7o6JSHRNHnlaTpY5MNTknlupOE5XSB7jXakKlTOkRjrLf62NCmqY6zodKZ2XcP8O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BkOk5b16; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkOk5b16"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790155016; x=1821691016;
  h=date:from:to:cc:subject:message-id;
  bh=H6E3v78gNPOL/L5EfC73UQqr/mhZZhhGahHi6/lRyAU=;
  b=BkOk5b16Bz8XnrEiYBAEsMhziRnRY7f79Vkl7xKKKJLLUkId01F5ise9
   Z9HIiTdOBJgTVIvQexgjqoRUXFcl1PinNuD/YTBTxjqX/jaYXHVQAeJ1F
   kMTJ12O4ZI5KvitSgF6MP1os00qq+4GcFy92xyWVwfgh5rHAbQZwzf914
   6NJhlN3Wp87HjURUCsXtp/MOJvrnrt36wOREwdAisPfrop+do4fxskmws
   9VQOxFdpqg8SRDzzswVyKV1D9CV7gsUZcxmjKbYU/6fwKidDgMp+WXIQN
   Fw04wjfiY5qA0GqD8jaNSvGrFNG0lA2GCLvsEJ4f8mqncfUk9YbKP55C9
   g==;
X-CSE-ConnectionGUID: ZbzPjxtbToidrUxd42RYvQ==
X-CSE-MsgGUID: LnJpVGWnTpaMmx3tAiotiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1324064"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1324064"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 02:16:55 -0700
X-CSE-ConnectionGUID: v6XXbQHCQNyNWtHZsXagGg==
X-CSE-MsgGUID: jNRdedmiQUeydmPauihQSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4605374"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 23 Sep 2026 02:16:55 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9J5w-000000000b7-0Q53;
	Wed, 23 Sep 2026 09:16:52 +0000
Date: Wed, 23 Sep 2026 11:16:04 +0200
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/gpu/drm/mediatek/mtk_disp_wdma.c:237:24: error:
 implicit declaration of function 'FIELD_PREP'
Message-ID: <202609231140.1j7EXJwe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-dsc-Add-MT8196-compatible/20260916-130813
head:   3c22fbab525978f915acc148875de1c4b7c78f5d
commit: 3c22fbab525978f915acc148875de1c4b7c78f5d drm/mediatek: Add Write DMA (WDMA) Engine for Writeback support
date:   7 days ago
config: loongarch-randconfig-r2105-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231140.1j7EXJwe-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231140.1j7EXJwe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231140.1j7EXJwe-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_disp_wdma.c: In function 'wdma_fmt_convert':
>> drivers/gpu/drm/mediatek/mtk_disp_wdma.c:237:24: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     237 |                 return FIELD_PREP(WDMA_CFG_OUT_FMT, WDMA_OUT_FMT_RGB565);
         |                        ^~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_disp_wdma.c: In function 'mtk_wdma_format_config':
>> drivers/gpu/drm/mediatek/mtk_disp_wdma.c:333:15: error: implicit declaration of function 'FIELD_PREP_CONST' [-Wimplicit-function-declaration]
     333 |         val = FIELD_PREP_CONST(WDMA_INT_MTX_SEL, WDMA_CT_COEF_JPEG_TO_RGB);
         |               ^~~~~~~~~~~~~~~~


vim +/FIELD_PREP +237 drivers/gpu/drm/mediatek/mtk_disp_wdma.c

   231	
   232	static u32 wdma_fmt_convert(unsigned int fmt)
   233	{
   234		switch (fmt) {
   235		default:
   236		case DRM_FORMAT_RGB565:
 > 237			return FIELD_PREP(WDMA_CFG_OUT_FMT, WDMA_OUT_FMT_RGB565);
   238		case DRM_FORMAT_BGR565:
   239			return FIELD_PREP(WDMA_CFG_OUT_FMT, WDMA_OUT_FMT_RGB565) | WDMA_CFG_SWAP;
   240		case DRM_FORMAT_RGB888:
   241			return FIELD_PREP(WDMA_CFG_OUT_FMT, WDMA_OUT_FMT_RGB888);
   242		case DRM_FORMAT_BGR888:
   243			return FIELD_PREP(WDMA_CFG_OUT_FMT, WDMA_OUT_FMT_RGB888) | WDMA_CFG_SWAP;
   244		case DRM_FORMAT_RGBX8888:
   245		case DRM_FORMAT_RGBA8888:
   246			return FIELD_PREP(WDMA_CFG_OUT_FMT, WDMA_OUT_FMT_RGBA8888);
   247		case DRM_FORMAT_BGRX8888:
   248		case DRM_FORMAT_BGRA8888:
   249			return FIELD_PREP(WDMA_CFG_OUT_FMT, WDMA_OUT_FMT_RGBA8888) | WDMA_CFG_SWAP;
   250		case DRM_FORMAT_XRGB8888:
   251		case DRM_FORMAT_ARGB8888:
   252			return FIELD_PREP(WDMA_CFG_OUT_FMT, WDMA_OUT_FMT_ARGB8888);
   253		case DRM_FORMAT_XBGR8888:
   254		case DRM_FORMAT_ABGR8888:
   255			return FIELD_PREP(WDMA_CFG_OUT_FMT, WDMA_OUT_FMT_ARGB8888) | WDMA_CFG_SWAP;
   256		case DRM_FORMAT_UYVY:
   257			return FIELD_PREP(WDMA_CFG_OUT_FMT, WDMA_OUT_FMT_UYVY);
   258		case DRM_FORMAT_YUYV:
   259			return FIELD_PREP(WDMA_CFG_OUT_FMT, WDMA_OUT_FMT_YUY2);
   260		case DRM_FORMAT_YUV420:
   261			return FIELD_PREP(WDMA_CFG_OUT_FMT, WDMA_OUT_FMT_I420);
   262		case DRM_FORMAT_YVU420:
   263			return FIELD_PREP(WDMA_CFG_OUT_FMT, WDMA_OUT_FMT_I420) | WDMA_CFG_SWAP;
   264		}
   265	}
   266	
   267	unsigned int mtk_wdma_layer_nr(struct device *dev)
   268	{
   269		return 1;
   270	}
   271	
   272	static void mtk_wdma_ddp_write_dst_addr(struct cmdq_pkt *cmdq_pkt, u64 val,
   273						u8 reg_id, struct mtk_disp_wdma *wdma)
   274	{
   275		mtk_ddp_write(cmdq_pkt, lower_32_bits(val), &wdma->cmdq_reg, wdma->regs,
   276			      DISP_REG_WDMA_DST_ADDRX(DISP_REG_WDMA_DST_ADDR_LSB, reg_id));
   277	
   278		if (wdma->data->reg_wdma_dst_addr0_msb == 0)
   279			return;
   280	
   281		mtk_ddp_write(cmdq_pkt, upper_32_bits(val), &wdma->cmdq_reg, wdma->regs,
   282			      DISP_REG_WDMA_DST_ADDRX(wdma->data->reg_wdma_dst_addr0_msb, reg_id));
   283	}
   284	
   285	static void mtk_wdma_format_config(struct mtk_disp_wdma *wdma,
   286					   struct mtk_plane_pending_state *pending,
   287					   const struct drm_format_info *fmt_info,
   288					   struct cmdq_pkt *cmdq_pkt)
   289	{
   290		unsigned int u_off, u_stride, u_size, v_off;
   291		u32 val;
   292	
   293		/*
   294		 * For RGB formats, this sets the image destination address;
   295		 * For YUV formats, this sets the Y component destination address.
   296		 */
   297		mtk_wdma_ddp_write_dst_addr(cmdq_pkt, pending->addr, 0, wdma);
   298	
   299		if (!fmt_info->is_yuv) {
   300			/* Disable color transform matrix and data compression */
   301			mtk_ddp_write_mask(cmdq_pkt, 0, &wdma->cmdq_reg, wdma->regs,
   302					   DISP_REG_WDMA_CFG,
   303					   WDMA_UFO_DCP_ENABLE | WDMA_CT_EN);
   304			return;
   305		}
   306	
   307		/* Additional format config required only for 420 sampling */
   308		if (!drm_format_info_is_yuv_sampling_420(fmt_info))
   309			return;
   310	
   311		u_off = pending->pitch * pending->height;
   312		u_stride = pending->pitch / 2;
   313	
   314		if (drm_format_info_is_yuv_planar(fmt_info)) {
   315			/* YUV420 or YVU420 */
   316			u_stride = ALIGN(u_stride, 16);
   317			u_size = u_stride * pending->height / 2;
   318			v_off = u_off + u_size;
   319		} else {
   320			/* NV12 or NV21 */
   321			u_size = u_stride * pending->height / 2;
   322			v_off = 0;
   323		}
   324	
   325		/* Set U and V components destination addresses */
   326		mtk_wdma_ddp_write_dst_addr(cmdq_pkt, pending->addr + u_off, 1, wdma);
   327		mtk_wdma_ddp_write_dst_addr(cmdq_pkt, pending->addr + v_off, 2, wdma);
   328	
   329		mtk_ddp_write(cmdq_pkt, FIELD_PREP(WDMA_UV_DST_W_IN_BYTE, u_stride),
   330			      &wdma->cmdq_reg, wdma->regs, DISP_REG_WDMA_DST_UV_PITCH);
   331	
   332		/* Color transform coefficient selection */
 > 333		val = FIELD_PREP_CONST(WDMA_INT_MTX_SEL, WDMA_CT_COEF_JPEG_TO_RGB);
   334		mtk_ddp_write_mask(cmdq_pkt, val, &wdma->cmdq_reg, wdma->regs,
   335				   DISP_REG_WDMA_CFG, WDMA_INT_MTX_SEL);
   336	
   337		/* Enable color transform matrix, disable data compression */
   338		mtk_ddp_write_mask(cmdq_pkt, WDMA_CT_EN, &wdma->cmdq_reg, wdma->regs,
   339				   DISP_REG_WDMA_CFG, WDMA_UFO_DCP_ENABLE | WDMA_CT_EN);
   340	}
   341	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
