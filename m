Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEED2FF178
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 07:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764054615; cv=none; b=eBL1nHfgVJfT2gGY7FurB7rCjJq8Z3REi+PWJG36zpOkFA7V2M20pk7xtXS6tcksmYo9vNtdDDHtRESj8eEKFVJjc1W5ROeiuu15p7IjLd5JEVUK3L4oHE18ZauBYdOKBeniMA/8PpqHSbf6vLZyzVU24xbdGI2cE9JH+qMt0zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764054615; c=relaxed/simple;
	bh=FFysWkKqVQjMXLY2xts8OruEtKjhYwxUuLwRBTCZxlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZJW+j3nEX+nNaBFkQCAw+eNfA8UcqPqJQBpgU5yg6UUFnOYdDj0fhDne318pYgGNLMqYz1PTUJpgMHmiDGcU1TMN9UzHnjob/VofCDsN6GNLBsVkTgN66DXnBaaHINgrfcEkUcCGLGptWEeAqNARSSM5wDxkgRA4TMi52bABa0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEYdGlrs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEYdGlrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764054614; x=1795590614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FFysWkKqVQjMXLY2xts8OruEtKjhYwxUuLwRBTCZxlI=;
  b=AEYdGlrssI+zu6cKaJDTiWASYv3atFUTRQgAtRfcSO/XsQ2XtCdsTXEn
   3KwI+5PYbdmravPHERG5g5GTuff5XBxo4xL85E0Lb7TIqgdLSo84niqL2
   9FCwQhZc9wz/J7kGkkah3cP3EZpQa7OMXY7qSUacAlwWsB16wI+JXEQ59
   u4BF7NL3qNYQS+2+SV2jS0sQpizk9U8gwJil8KlnBsJPpBu+sQ9tBkBXZ
   RTBk/rwb/o3ZhZ1QUXrBSbZbNaIAhlIGEh6dKiPBOs+sNlpCNPhhNClMb
   pVujtnr9tw993Kr1fv430lKIL8U3OZ6pn88tj9yf3H2qn3Z2cQPSmURmk
   A==;
X-CSE-ConnectionGUID: csHCj5CMT5iISqbQjbjreA==
X-CSE-MsgGUID: 6MR/tPc5RhaMm8Uy0aMxxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77540030"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="77540030"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 23:10:14 -0800
X-CSE-ConnectionGUID: keMjqWxuRv6HYSZg6ImR8g==
X-CSE-MsgGUID: jtT6Z3iXT/WjYTsKhPzbXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="196855437"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Nov 2025 23:10:12 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNnBi-000000001SP-0MaU;
	Tue, 25 Nov 2025 07:10:10 +0000
Date: Tue, 25 Nov 2025 15:09:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 307/307]
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:156:9: error: implicit declaration
 of function 'mtk_crtc_read_crc'; did you mean 'mtk_crtc_create'?
Message-ID: <202511251540.7VyOJk46-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   13ad121dbd1ffa7b86e262f1154015f2d9cf9062
commit: e18eca47e1989175dd741bb9e4a60757afd9352d [307/307] CHROMIUM: drm/mediatek: Add CRC support for MT8189
config: arm64-randconfig-002-20251125 (https://download.01.org/0day-ci/archive/20251125/202511251540.7VyOJk46-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251540.7VyOJk46-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251540.7VyOJk46-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_disp_rdma.c: In function 'mtk_rdma_crc_read':
>> drivers/gpu/drm/mediatek/mtk_disp_rdma.c:156:9: error: implicit declaration of function 'mtk_crtc_read_crc'; did you mean 'mtk_crtc_create'? [-Werror=implicit-function-declaration]
     156 |         mtk_crtc_read_crc(&priv->crc);
         |         ^~~~~~~~~~~~~~~~~
         |         mtk_crtc_create
   drivers/gpu/drm/mediatek/mtk_disp_rdma.c: In function 'mtk_rdma_start':
>> drivers/gpu/drm/mediatek/mtk_disp_rdma.c:223:39: error: 'struct mtk_crtc_crc' has no member named 'crc_sel'
     223 |         if (priv->crc.cnt && priv->crc.crc_sel && priv->crc.crc_out) {
         |                                       ^
>> drivers/gpu/drm/mediatek/mtk_disp_rdma.c:223:60: error: 'struct mtk_crtc_crc' has no member named 'crc_out'
     223 |         if (priv->crc.cnt && priv->crc.crc_sel && priv->crc.crc_out) {
         |                                                            ^
   drivers/gpu/drm/mediatek/mtk_disp_rdma.c:225:34: error: 'struct mtk_crtc_crc' has no member named 'crc_sel'
     225 |                         priv->crc.crc_sel + DEBUG_OUT_SEL, RDMA_CRC_MASK, DISP_REG_RDMA_SEL);
         |                                  ^
   drivers/gpu/drm/mediatek/mtk_disp_rdma.c:227:34: error: 'struct mtk_crtc_crc' has no member named 'crc_out'
     227 |                         priv->crc.crc_out + DEBUG_OUT_SEL, RDMA_CRC_MASK, DISP_REG_RDMA_DATA_SEL);
         |                                  ^
   drivers/gpu/drm/mediatek/mtk_disp_rdma.c: In function 'mtk_rdma_stop':
>> drivers/gpu/drm/mediatek/mtk_disp_rdma.c:237:31: warning: unused variable 'priv' [-Wunused-variable]
     237 |         struct mtk_disp_rdma *priv = dev_get_drvdata(dev);
         |                               ^~~~
   drivers/gpu/drm/mediatek/mtk_disp_rdma.c: In function 'mtk_disp_rdma_probe':
>> drivers/gpu/drm/mediatek/mtk_disp_rdma.c:450:18: error: 'struct mtk_crtc_crc' has no member named 'to_mminfra_out'
     450 |         priv->crc.to_mminfra_out = priv->data->to_mminfra_out;
         |                  ^
   drivers/gpu/drm/mediatek/mtk_disp_rdma.c:460:26: error: 'struct mtk_crtc_crc' has no member named 'crc_out'
     460 |                 priv->crc.crc_out = crc_res.start;
         |                          ^
   drivers/gpu/drm/mediatek/mtk_disp_rdma.c:475:26: error: 'struct mtk_crtc_crc' has no member named 'crc_sel'
     475 |                 priv->crc.crc_sel = crc_res.start;
         |                          ^
>> drivers/gpu/drm/mediatek/mtk_disp_rdma.c:493:58: error: 'struct mtk_crtc_crc' has no member named 'cmdq_event'
     493 |                                                &priv->crc.cmdq_event)) {
         |                                                          ^
>> drivers/gpu/drm/mediatek/mtk_disp_rdma.c:499:26: error: 'struct mtk_crtc_crc' has no member named 'cmdq_reg'
     499 |                 priv->crc.cmdq_reg = &priv->cmdq_reg;
         |                          ^
>> drivers/gpu/drm/mediatek/mtk_disp_rdma.c:500:17: error: implicit declaration of function 'mtk_crtc_create_crc_cmdq' [-Werror=implicit-function-declaration]
     500 |                 mtk_crtc_create_crc_cmdq(dev, &priv->crc);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +156 drivers/gpu/drm/mediatek/mtk_disp_rdma.c

   151	
   152	void mtk_rdma_crc_read(struct device *dev)
   153	{
   154		struct mtk_disp_rdma *priv = dev_get_drvdata(dev);
   155	
 > 156		mtk_crtc_read_crc(&priv->crc);
   157	}
   158	
   159	void mtk_rdma_register_vblank_cb(struct device *dev,
   160					 void (*vblank_cb)(void *),
   161					 void *vblank_cb_data)
   162	{
   163		struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
   164	
   165		rdma->vblank_cb = vblank_cb;
   166		rdma->vblank_cb_data = vblank_cb_data;
   167	}
   168	
   169	void mtk_rdma_unregister_vblank_cb(struct device *dev)
   170	{
   171		struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
   172	
   173		rdma->vblank_cb = NULL;
   174		rdma->vblank_cb_data = NULL;
   175	}
   176	
   177	void mtk_rdma_enable_vblank(struct device *dev)
   178	{
   179		rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT,
   180				 RDMA_FRAME_END_INT);
   181	}
   182	
   183	void mtk_rdma_disable_vblank(struct device *dev)
   184	{
   185		rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT, 0);
   186	}
   187	
   188	const u32 *mtk_rdma_get_formats(struct device *dev)
   189	{
   190		struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
   191	
   192		return rdma->data->formats;
   193	}
   194	
   195	size_t mtk_rdma_get_num_formats(struct device *dev)
   196	{
   197		struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
   198	
   199		return rdma->data->num_formats;
   200	}
   201	
   202	int mtk_rdma_clk_enable(struct device *dev)
   203	{
   204		struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
   205	
   206		return clk_prepare_enable(rdma->clk);
   207	}
   208	
   209	void mtk_rdma_clk_disable(struct device *dev)
   210	{
   211		struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
   212	
   213		clk_disable_unprepare(rdma->clk);
   214	}
   215	
   216	void mtk_rdma_start(struct device *dev)
   217	{
   218		struct mtk_disp_rdma *priv = dev_get_drvdata(dev);
   219	
   220		rdma_update_bits(dev, DISP_REG_RDMA_GLOBAL_CON, RDMA_ENGINE_EN,
   221				 RDMA_ENGINE_EN);
   222	
 > 223		if (priv->crc.cnt && priv->crc.crc_sel && priv->crc.crc_out) {
   224			regmap_update_bits(priv->mminfra_reg,
   225				priv->crc.crc_sel + DEBUG_OUT_SEL, RDMA_CRC_MASK, DISP_REG_RDMA_SEL);
   226			regmap_update_bits(priv->dispsys_reg,
   227				priv->crc.crc_out + DEBUG_OUT_SEL, RDMA_CRC_MASK, DISP_REG_RDMA_DATA_SEL);
   228	
   229	#if IS_REACHABLE(CONFIG_MTK_CMDQ)
   230			mtk_crtc_start_crc_cmdq(&priv->crc);
   231	#endif
   232		}
   233	}
   234	
   235	void mtk_rdma_stop(struct device *dev)
   236	{
 > 237		struct mtk_disp_rdma *priv = dev_get_drvdata(dev);
   238	
   239		rdma_update_bits(dev, DISP_REG_RDMA_GLOBAL_CON, RDMA_ENGINE_EN, 0);
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
