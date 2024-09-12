Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDFC1E49F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726145763; cv=none; b=AxS4JaCQ6tnJKJ+AO/fGHyHo7/PneFd1LOY0j45uKgZhbMw0I+Hv401Fei9oKIaAZHlOBvPVHotvDJcEs0s3jbQhslaIZqOZPeZLQ6MIx6zSu+z+5noY4Rl2+lgGs9OZmpV86t4zerYHscTjGxY8qzc2gD1ssYkt5WkqbOx69ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726145763; c=relaxed/simple;
	bh=+ZKDzjgkJ7RFp4CDOVlFm4N73vjdQskgHrSSEa1j464=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SrjVKDMbQysvucfMQXEhMid34CqNmtGibY57GLnsD9EQgELpZvyvVtKmS2Nz5jwT0AmycpO0sLZuWLLhGhw11x/5G7Dxs76WE2wEarnedaQCS+igPQJm2dC5RG9zNfhH1sVD5yZGyHutJuvXvLTQsA12K1OZa/iaVGwULk6qIXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyIGqpwo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyIGqpwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726145761; x=1757681761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ZKDzjgkJ7RFp4CDOVlFm4N73vjdQskgHrSSEa1j464=;
  b=cyIGqpwo0WW+0VeFMts5HlcM10TkKRYUg8NlRRYNr7km1/ODlKj0rH2j
   KGY0YslHr1SNfNi4YqdPKaVcRjuUHKHiCGOqTSIS2GgIp7I+G7OgMFODS
   OkPL9FQDCEHe4FvzlVNRA04UA7A5zNUVQYEJTUFN5ziKiwU7RqGGPr7Co
   lL8Rvh/ovpdhxYfqb4yp6CSsUPKJTa5wYz0C9Mcx8ivwwg0O9h3TpMymJ
   R3NDWumqXZ70NYERxdMBt2OLK/XOgS9WjbdXRRvrRG/lgO7JUolvrgtDz
   UFOgr8WQ0gmVVZ8V27rn6Vwh+Ku7r2R/0IuV+Q7OgVHfkh7trVQWWBqxW
   g==;
X-CSE-ConnectionGUID: LOtbsp9eTIGqok8Sl2ICKw==
X-CSE-MsgGUID: 1xoVIPt4QeaNqy8U7t/pFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="47506297"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="47506297"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:56:01 -0700
X-CSE-ConnectionGUID: 20+xfXTzT1SX6VT7Z5NFEg==
X-CSE-MsgGUID: /Z2t92XrTBKfePf1uWz8gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="98523053"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Sep 2024 05:56:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sojMb-0005B6-15;
	Thu, 12 Sep 2024 12:55:57 +0000
Date: Thu, 12 Sep 2024 20:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [broonie-ci:asoc-6.12 30/49]
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:597:34: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202409122009.kVuhxMyp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-6.12
head:   32d5f79aafebb928eeb9325bb390d509f2d5c0a9
commit: 36fa259b214c37bbae3e0b7a47e7fb49cb0ab462 [30/49] ASoC: mt8365: Allow build coverage
config: arm-randconfig-r111-20240912 (https://download.01.org/0day-ci/archive/20240912/202409122009.kVuhxMyp-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce: (https://download.01.org/0day-ci/archive/20240912/202409122009.kVuhxMyp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409122009.kVuhxMyp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:597:34: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +597 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c

e1991d102bc2ab Alexandre Mergnat 2024-07-22  536  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  537  static int mt8365_afe_fe_hw_params(struct snd_pcm_substream *substream,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  538  				   struct snd_pcm_hw_params *params,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  539  				   struct snd_soc_dai *dai)
e1991d102bc2ab Alexandre Mergnat 2024-07-22  540  {
e1991d102bc2ab Alexandre Mergnat 2024-07-22  541  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  542  	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  543  	struct mt8365_afe_private *afe_priv = afe->platform_priv;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  544  	struct mt8365_control_data *ctrl_data = &afe_priv->ctrl_data;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  545  	int dai_id = snd_soc_rtd_to_cpu(rtd, 0)->id;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  546  	struct mtk_base_afe_memif *memif = &afe->memif[dai_id];
e1991d102bc2ab Alexandre Mergnat 2024-07-22  547  	struct mt8365_fe_dai_data *fe_data = &afe_priv->fe_data[dai_id];
e1991d102bc2ab Alexandre Mergnat 2024-07-22  548  	size_t request_size = params_buffer_bytes(params);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  549  	unsigned int channels = params_channels(params);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  550  	unsigned int rate = params_rate(params);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  551  	unsigned int base_end_offset = 8;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  552  	int ret, fs;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  553  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  554  	dev_info(afe->dev, "%s %s period = %d rate = %d channels = %d\n",
e1991d102bc2ab Alexandre Mergnat 2024-07-22  555  		 __func__, memif->data->name, params_period_size(params),
e1991d102bc2ab Alexandre Mergnat 2024-07-22  556  		 rate, channels);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  557  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  558  	if (dai_id == MT8365_AFE_MEMIF_VUL2) {
e1991d102bc2ab Alexandre Mergnat 2024-07-22  559  		if (!ctrl_data->bypass_cm1)
e1991d102bc2ab Alexandre Mergnat 2024-07-22  560  			/* configure cm1 */
e1991d102bc2ab Alexandre Mergnat 2024-07-22  561  			mt8365_afe_configure_cm(afe, MT8365_CM1,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  562  						channels, rate);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  563  		else
e1991d102bc2ab Alexandre Mergnat 2024-07-22  564  			regmap_update_bits(afe->regmap, AFE_CM1_CON0,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  565  					   CM_AFE_CM1_VUL_SEL,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  566  					   CM_AFE_CM1_VUL_SEL);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  567  	} else if (dai_id == MT8365_AFE_MEMIF_TDM_IN) {
e1991d102bc2ab Alexandre Mergnat 2024-07-22  568  		if (!ctrl_data->bypass_cm2)
e1991d102bc2ab Alexandre Mergnat 2024-07-22  569  			/* configure cm2 */
e1991d102bc2ab Alexandre Mergnat 2024-07-22  570  			mt8365_afe_configure_cm(afe, MT8365_CM2,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  571  						channels, rate);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  572  		else
e1991d102bc2ab Alexandre Mergnat 2024-07-22  573  			regmap_update_bits(afe->regmap, AFE_CM2_CON0,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  574  					   CM_AFE_CM2_TDM_SEL,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  575  					   ~CM_AFE_CM2_TDM_SEL);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  576  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  577  		base_end_offset = 4;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  578  	}
e1991d102bc2ab Alexandre Mergnat 2024-07-22  579  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  580  	if (request_size > fe_data->sram_size) {
e1991d102bc2ab Alexandre Mergnat 2024-07-22  581  		ret = snd_pcm_lib_malloc_pages(substream, request_size);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  582  		if (ret < 0) {
e1991d102bc2ab Alexandre Mergnat 2024-07-22  583  			dev_err(afe->dev,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  584  				"%s %s malloc pages %zu bytes failed %d\n",
e1991d102bc2ab Alexandre Mergnat 2024-07-22  585  				__func__, memif->data->name, request_size, ret);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  586  			return ret;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  587  		}
e1991d102bc2ab Alexandre Mergnat 2024-07-22  588  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  589  		fe_data->use_sram = false;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  590  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  591  		mt8365_afe_emi_clk_on(afe);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  592  	} else {
e1991d102bc2ab Alexandre Mergnat 2024-07-22  593  		struct snd_dma_buffer *dma_buf = &substream->dma_buffer;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  594  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  595  		dma_buf->dev.type = SNDRV_DMA_TYPE_DEV;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  596  		dma_buf->dev.dev = substream->pcm->card->dev;
e1991d102bc2ab Alexandre Mergnat 2024-07-22 @597  		dma_buf->area = (unsigned char *)fe_data->sram_vir_addr;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  598  		dma_buf->addr = fe_data->sram_phy_addr;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  599  		dma_buf->bytes = request_size;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  600  		snd_pcm_set_runtime_buffer(substream, dma_buf);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  601  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  602  		fe_data->use_sram = true;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  603  	}
e1991d102bc2ab Alexandre Mergnat 2024-07-22  604  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  605  	memif->phys_buf_addr = lower_32_bits(substream->runtime->dma_addr);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  606  	memif->buffer_size = substream->runtime->dma_bytes;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  607  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  608  	/* start */
e1991d102bc2ab Alexandre Mergnat 2024-07-22  609  	regmap_write(afe->regmap, memif->data->reg_ofs_base,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  610  		     memif->phys_buf_addr);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  611  	/* end */
e1991d102bc2ab Alexandre Mergnat 2024-07-22  612  	regmap_write(afe->regmap,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  613  		     memif->data->reg_ofs_base + base_end_offset,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  614  		     memif->phys_buf_addr + memif->buffer_size - 1);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  615  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  616  	/* set channel */
e1991d102bc2ab Alexandre Mergnat 2024-07-22  617  	if (memif->data->mono_shift >= 0) {
e1991d102bc2ab Alexandre Mergnat 2024-07-22  618  		unsigned int mono = (params_channels(params) == 1) ? 1 : 0;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  619  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  620  		if (memif->data->mono_reg < 0)
e1991d102bc2ab Alexandre Mergnat 2024-07-22  621  			dev_info(afe->dev, "%s mono_reg is NULL\n", __func__);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  622  		else
e1991d102bc2ab Alexandre Mergnat 2024-07-22  623  			regmap_update_bits(afe->regmap, memif->data->mono_reg,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  624  					   1 << memif->data->mono_shift,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  625  					   mono << memif->data->mono_shift);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  626  	}
e1991d102bc2ab Alexandre Mergnat 2024-07-22  627  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  628  	/* set rate */
e1991d102bc2ab Alexandre Mergnat 2024-07-22  629  	if (memif->data->fs_shift < 0)
e1991d102bc2ab Alexandre Mergnat 2024-07-22  630  		return 0;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  631  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  632  	fs = afe->memif_fs(substream, params_rate(params));
e1991d102bc2ab Alexandre Mergnat 2024-07-22  633  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  634  	if (fs < 0)
e1991d102bc2ab Alexandre Mergnat 2024-07-22  635  		return -EINVAL;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  636  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  637  	if (memif->data->fs_reg < 0)
e1991d102bc2ab Alexandre Mergnat 2024-07-22  638  		dev_info(afe->dev, "%s fs_reg is NULL\n", __func__);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  639  	else
e1991d102bc2ab Alexandre Mergnat 2024-07-22  640  		regmap_update_bits(afe->regmap, memif->data->fs_reg,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  641  				   memif->data->fs_maskbit << memif->data->fs_shift,
e1991d102bc2ab Alexandre Mergnat 2024-07-22  642  				   fs << memif->data->fs_shift);
e1991d102bc2ab Alexandre Mergnat 2024-07-22  643  
e1991d102bc2ab Alexandre Mergnat 2024-07-22  644  	return 0;
e1991d102bc2ab Alexandre Mergnat 2024-07-22  645  }
e1991d102bc2ab Alexandre Mergnat 2024-07-22  646  

:::::: The code at line 597 was first introduced by commit
:::::: e1991d102bc2abb32331c462f8f3e77059c69578 ASoC: mediatek: mt8365: Add the AFE driver support

:::::: TO: Alexandre Mergnat <amergnat@baylibre.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
