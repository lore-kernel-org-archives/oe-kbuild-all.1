Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAF2398F99
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 03:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764820014; cv=none; b=Y3N6rfBYMCgzULhOtDm4BDxRjSwWI+dtVPUSfu4Xx0yV7tNL9721AIPhNbTZDLt79zJnAbfQil5Ok4scSlgLJYLK21lU/Jsr/S/6YM/vq94/nETA9DX64a5+4DSyHZOn5Jze80kgE9KKcAlgFXehbJjAjoQbnFI+/auZfPhSwOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764820014; c=relaxed/simple;
	bh=daBL6Wa6fRiD+tHmkZpcxcDJn4zrIISPQPEPbmzgec0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SQDEbTPhfndhg7XhqHIMMWD7Ze9qJqJhdDMNe+7UtYtD41Q9UNNpkrfa98ynMyVXH9LP9t3M4uxQwzcgtV/Fdi/IzozdGnfk7Z1E2ZFn3153GrHVI/nPSB1XCkKCh4Bau4ALOspbXZ/mY75vrZaQaHFu6smhCEd1GXGe3Zu20Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VE5XRT9H; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VE5XRT9H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764820011; x=1796356011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=daBL6Wa6fRiD+tHmkZpcxcDJn4zrIISPQPEPbmzgec0=;
  b=VE5XRT9H6bsrFYCZ1Lt5OnUE85ZaN2Ep5nZTQm2P/ZpHpgogQJBpM3TL
   ztjVbIKwufIyjMSGLLqpyVoJn4AQWL882L/aUCsMQ5TWn5UQxXoMkgFOO
   SYv1WFBQ5nmsfSTHvKulGBpHKSSNNOb5mn38mRBO636BUM6+IpY5jUqk3
   ZJ1TEJcJMAG2dbu3lD90gwKsduAmmswMkfj5uCDh40I1QK/BTmkU5bauj
   ovm8w6PDovmX7JDqW7kkTkG9y3OvD7426S9RNCecqAZqlshY7w1oqX7bf
   HQkufYRk4nu+PD2WABtcdYSi7fMP6LnjTpHJ+yrJZ1n0hORUS6TJBR7Uc
   w==;
X-CSE-ConnectionGUID: Nej3c1P+R12m6aM+pPvymw==
X-CSE-MsgGUID: HMDiMoWORly/5MO5g20S0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78183360"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="78183360"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 19:46:47 -0800
X-CSE-ConnectionGUID: VVmXmIe4Sa6JM9za1jXhzQ==
X-CSE-MsgGUID: 0z1qGjC3R+WNhLAhVffLNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="195665204"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Dec 2025 19:46:45 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR0Il-00000000DPm-2Lax;
	Thu, 04 Dec 2025 03:46:43 +0000
Date: Thu, 4 Dec 2025 11:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-12-03 15/16]
 sound/soc/img/img-i2s-in.c:390:1: error: expected identifier or '(' before
 'static'
Message-ID: <202512041113.osJPrwoC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-12-03
head:   48371bd5c0566cfc8e9d81b48b39c9e355eafdc1
commit: bc3f6d1fbadd3a9fc48804d41967912f6a0e35f3 [15/16] hoge
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251204/202512041113.osJPrwoC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512041113.osJPrwoC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041113.osJPrwoC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/img/img-i2s-in.c:390:1: error: expected identifier or '(' before 'static'
     390 | static const struct snd_soc_dai_ops img_i2s_in_dai_ops = {
         | ^~~~~~
   sound/soc/img/img-i2s-in.c: In function 'img_i2s_in_probe':
>> sound/soc/img/img-i2s-in.c:487:32: error: 'img_i2s_in_dai_ops' undeclared (first use in this function); did you mean 'img_i2s_in_dai_probe'?
     487 |         i2s->dai_driver.ops = &img_i2s_in_dai_ops;
         |                                ^~~~~~~~~~~~~~~~~~
         |                                img_i2s_in_dai_probe
   sound/soc/img/img-i2s-in.c:487:32: note: each undeclared identifier is reported only once for each function it appears in
   At top level:
>> sound/soc/img/img-i2s-in.c:382:18: warning: 'img_i2s_in_selectable_formats' defined but not used [-Wunused-const-variable=]
     382 | static const u64 img_i2s_in_selectable_formats =
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/img/img-i2s-in.c:373:12: warning: 'img_i2s_in_dai_probe' defined but not used [-Wunused-function]
     373 | static int img_i2s_in_dai_probe(struct snd_soc_dai *dai)
         |            ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/img/img-i2s-in.c:302:12: warning: 'img_i2s_in_set_fmt' defined but not used [-Wunused-function]
     302 | static int img_i2s_in_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
         |            ^~~~~~~~~~~~~~~~~~
>> sound/soc/img/img-i2s-in.c:214:12: warning: 'img_i2s_in_hw_params' defined but not used [-Wunused-function]
     214 | static int img_i2s_in_hw_params(struct snd_pcm_substream *substream,
         |            ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/img/img-i2s-in.c:160:12: warning: 'img_i2s_in_trigger' defined but not used [-Wunused-function]
     160 | static int img_i2s_in_trigger(struct snd_pcm_substream *substream, int cmd,
         |            ^~~~~~~~~~~~~~~~~~
--
>> sound/soc/img/img-i2s-out.c:406:9: error: request for member 'auto_selectable_formats' in something not a structure or union
     406 |         .auto_selectable_formats        = &img_i2s_out_selectable_formats,
         |         ^
--
>> sound/soc/img/img-parallel-out.c:199:9: error: request for member 'auto_selectable_formats' in something not a structure or union
     199 |         .auto_selectable_formats        = &img_prl_selectable_formats,
         |         ^
--
>> sound/soc/mediatek/mt8186/mt8186-dai-pcm.c:353:44: error: 't9015_dai_selectable_formats' undeclared here (not in a function); did you mean 'ssi_dai_selectable_formats'?
     353 |         .auto_selectable_formats        = &t9015_dai_selectable_formats,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            ssi_dai_selectable_formats
>> sound/soc/mediatek/mt8186/mt8186-dai-pcm.c:340:18: warning: 'ssi_dai_selectable_formats' defined but not used [-Wunused-const-variable=]
     340 | static const u64 ssi_dai_selectable_formats =
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> sound/soc/mediatek/mt8195/mt8195-dai-etdm.c:2511:44: error: 'mtk_dai_selectable_formats' undeclared here (not in a function); did you mean 'ssi_dai_selectable_formats'?
    2511 |         .auto_selectable_formats        = &mtk_dai_selectable_formats,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            ssi_dai_selectable_formats
>> sound/soc/mediatek/mt8195/mt8195-dai-etdm.c:2493:18: warning: 'ssi_dai_selectable_formats' defined but not used [-Wunused-const-variable=]
    2493 | static const u64 ssi_dai_selectable_formats =
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +390 sound/soc/img/img-i2s-in.c

14b947d9ced4f72 Damien.Horsley      2015-11-04  213  
14b947d9ced4f72 Damien.Horsley      2015-11-04 @214  static int img_i2s_in_hw_params(struct snd_pcm_substream *substream,
14b947d9ced4f72 Damien.Horsley      2015-11-04  215  	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
14b947d9ced4f72 Damien.Horsley      2015-11-04  216  {
14b947d9ced4f72 Damien.Horsley      2015-11-04  217  	struct img_i2s_in *i2s = snd_soc_dai_get_drvdata(dai);
14b947d9ced4f72 Damien.Horsley      2015-11-04  218  	unsigned int rate, channels, i2s_channels, frame_size;
14b947d9ced4f72 Damien.Horsley      2015-11-04  219  	unsigned int bclk_filter_enable, bclk_filter_value;
14b947d9ced4f72 Damien.Horsley      2015-11-04  220  	int i, ret = 0;
14b947d9ced4f72 Damien.Horsley      2015-11-04  221  	u32 reg, control_mask, chan_control_mask;
14b947d9ced4f72 Damien.Horsley      2015-11-04  222  	u32 control_set = 0, chan_control_set = 0;
14b947d9ced4f72 Damien.Horsley      2015-11-04  223  	snd_pcm_format_t format;
14b947d9ced4f72 Damien.Horsley      2015-11-04  224  
14b947d9ced4f72 Damien.Horsley      2015-11-04  225  	rate = params_rate(params);
14b947d9ced4f72 Damien.Horsley      2015-11-04  226  	format = params_format(params);
14b947d9ced4f72 Damien.Horsley      2015-11-04  227  	channels = params_channels(params);
14b947d9ced4f72 Damien.Horsley      2015-11-04  228  	i2s_channels = channels / 2;
14b947d9ced4f72 Damien.Horsley      2015-11-04  229  
14b947d9ced4f72 Damien.Horsley      2015-11-04  230  	switch (format) {
14b947d9ced4f72 Damien.Horsley      2015-11-04  231  	case SNDRV_PCM_FORMAT_S32_LE:
14b947d9ced4f72 Damien.Horsley      2015-11-04  232  		frame_size = 64;
14b947d9ced4f72 Damien.Horsley      2015-11-04  233  		chan_control_set |= IMG_I2S_IN_CH_CTL_SW_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  234  		chan_control_set |= IMG_I2S_IN_CH_CTL_FW_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  235  		chan_control_set |= IMG_I2S_IN_CH_CTL_PACKH_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  236  		break;
14b947d9ced4f72 Damien.Horsley      2015-11-04  237  	case SNDRV_PCM_FORMAT_S24_LE:
14b947d9ced4f72 Damien.Horsley      2015-11-04  238  		frame_size = 64;
14b947d9ced4f72 Damien.Horsley      2015-11-04  239  		chan_control_set |= IMG_I2S_IN_CH_CTL_SW_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  240  		chan_control_set |= IMG_I2S_IN_CH_CTL_FW_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  241  		break;
14b947d9ced4f72 Damien.Horsley      2015-11-04  242  	case SNDRV_PCM_FORMAT_S16_LE:
14b947d9ced4f72 Damien.Horsley      2015-11-04  243  		frame_size = 32;
14b947d9ced4f72 Damien.Horsley      2015-11-04  244  		control_set |= IMG_I2S_IN_CTL_16PACK_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  245  		chan_control_set |= IMG_I2S_IN_CH_CTL_16PACK_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  246  		break;
14b947d9ced4f72 Damien.Horsley      2015-11-04  247  	default:
14b947d9ced4f72 Damien.Horsley      2015-11-04  248  		return -EINVAL;
14b947d9ced4f72 Damien.Horsley      2015-11-04  249  	}
14b947d9ced4f72 Damien.Horsley      2015-11-04  250  
14b947d9ced4f72 Damien.Horsley      2015-11-04  251  	if ((channels < 2) ||
14b947d9ced4f72 Damien.Horsley      2015-11-04  252  	    (channels > (i2s->max_i2s_chan * 2)) ||
14b947d9ced4f72 Damien.Horsley      2015-11-04  253  	    (channels % 2))
14b947d9ced4f72 Damien.Horsley      2015-11-04  254  		return -EINVAL;
14b947d9ced4f72 Damien.Horsley      2015-11-04  255  
14b947d9ced4f72 Damien.Horsley      2015-11-04  256  	control_set |= ((i2s_channels - 1) << IMG_I2S_IN_CTL_ACTIVE_CH_SHIFT);
14b947d9ced4f72 Damien.Horsley      2015-11-04  257  
14b947d9ced4f72 Damien.Horsley      2015-11-04  258  	ret = img_i2s_in_check_rate(i2s, rate, frame_size,
14b947d9ced4f72 Damien.Horsley      2015-11-04  259  			&bclk_filter_enable, &bclk_filter_value);
14b947d9ced4f72 Damien.Horsley      2015-11-04  260  	if (ret < 0)
14b947d9ced4f72 Damien.Horsley      2015-11-04  261  		return ret;
14b947d9ced4f72 Damien.Horsley      2015-11-04  262  
14b947d9ced4f72 Damien.Horsley      2015-11-04  263  	if (bclk_filter_enable)
14b947d9ced4f72 Damien.Horsley      2015-11-04  264  		chan_control_set |= IMG_I2S_IN_CH_CTL_FEN_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  265  
14b947d9ced4f72 Damien.Horsley      2015-11-04  266  	if (bclk_filter_value)
14b947d9ced4f72 Damien.Horsley      2015-11-04  267  		chan_control_set |= IMG_I2S_IN_CH_CTL_FMODE_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  268  
14b947d9ced4f72 Damien.Horsley      2015-11-04  269  	control_mask = IMG_I2S_IN_CTL_16PACK_MASK |
14b947d9ced4f72 Damien.Horsley      2015-11-04  270  		       IMG_I2S_IN_CTL_ACTIVE_CHAN_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  271  
14b947d9ced4f72 Damien.Horsley      2015-11-04  272  	chan_control_mask = IMG_I2S_IN_CH_CTL_16PACK_MASK |
14b947d9ced4f72 Damien.Horsley      2015-11-04  273  			    IMG_I2S_IN_CH_CTL_FEN_MASK |
14b947d9ced4f72 Damien.Horsley      2015-11-04  274  			    IMG_I2S_IN_CH_CTL_FMODE_MASK |
14b947d9ced4f72 Damien.Horsley      2015-11-04  275  			    IMG_I2S_IN_CH_CTL_SW_MASK |
14b947d9ced4f72 Damien.Horsley      2015-11-04  276  			    IMG_I2S_IN_CH_CTL_FW_MASK |
14b947d9ced4f72 Damien.Horsley      2015-11-04  277  			    IMG_I2S_IN_CH_CTL_PACKH_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  278  
14b947d9ced4f72 Damien.Horsley      2015-11-04  279  	reg = img_i2s_in_readl(i2s, IMG_I2S_IN_CTL);
14b947d9ced4f72 Damien.Horsley      2015-11-04  280  	reg = (reg & ~control_mask) | control_set;
14b947d9ced4f72 Damien.Horsley      2015-11-04  281  	img_i2s_in_writel(i2s, reg, IMG_I2S_IN_CTL);
14b947d9ced4f72 Damien.Horsley      2015-11-04  282  
14b947d9ced4f72 Damien.Horsley      2015-11-04  283  	for (i = 0; i < i2s->active_channels; i++)
14b947d9ced4f72 Damien.Horsley      2015-11-04  284  		img_i2s_in_ch_disable(i2s, i);
14b947d9ced4f72 Damien.Horsley      2015-11-04  285  
14b947d9ced4f72 Damien.Horsley      2015-11-04  286  	for (i = 0; i < i2s->max_i2s_chan; i++) {
14b947d9ced4f72 Damien.Horsley      2015-11-04  287  		reg = img_i2s_in_ch_readl(i2s, i, IMG_I2S_IN_CH_CTL);
14b947d9ced4f72 Damien.Horsley      2015-11-04  288  		reg = (reg & ~chan_control_mask) | chan_control_set;
14b947d9ced4f72 Damien.Horsley      2015-11-04  289  		img_i2s_in_ch_writel(i2s, i, reg, IMG_I2S_IN_CH_CTL);
14b947d9ced4f72 Damien.Horsley      2015-11-04  290  	}
14b947d9ced4f72 Damien.Horsley      2015-11-04  291  
14b947d9ced4f72 Damien.Horsley      2015-11-04  292  	i2s->active_channels = i2s_channels;
14b947d9ced4f72 Damien.Horsley      2015-11-04  293  
14b947d9ced4f72 Damien.Horsley      2015-11-04  294  	img_i2s_in_flush(i2s);
14b947d9ced4f72 Damien.Horsley      2015-11-04  295  
14b947d9ced4f72 Damien.Horsley      2015-11-04  296  	for (i = 0; i < i2s->active_channels; i++)
14b947d9ced4f72 Damien.Horsley      2015-11-04  297  		img_i2s_in_ch_enable(i2s, i);
14b947d9ced4f72 Damien.Horsley      2015-11-04  298  
14b947d9ced4f72 Damien.Horsley      2015-11-04  299  	return 0;
14b947d9ced4f72 Damien.Horsley      2015-11-04  300  }
14b947d9ced4f72 Damien.Horsley      2015-11-04  301  
14b947d9ced4f72 Damien.Horsley      2015-11-04 @302  static int img_i2s_in_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
14b947d9ced4f72 Damien.Horsley      2015-11-04  303  {
14b947d9ced4f72 Damien.Horsley      2015-11-04  304  	struct img_i2s_in *i2s = snd_soc_dai_get_drvdata(dai);
f65bb92ca12e72c Ed Blake            2017-10-06  305  	int i, ret;
14b947d9ced4f72 Damien.Horsley      2015-11-04  306  	u32 chan_control_mask, lrd_set = 0, blkp_set = 0, chan_control_set = 0;
14b947d9ced4f72 Damien.Horsley      2015-11-04  307  	u32 reg;
14b947d9ced4f72 Damien.Horsley      2015-11-04  308  
14b947d9ced4f72 Damien.Horsley      2015-11-04  309  	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
14b947d9ced4f72 Damien.Horsley      2015-11-04  310  	case SND_SOC_DAIFMT_NB_NF:
14b947d9ced4f72 Damien.Horsley      2015-11-04  311  		lrd_set |= IMG_I2S_IN_CH_CTL_LRD_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  312  		break;
14b947d9ced4f72 Damien.Horsley      2015-11-04  313  	case SND_SOC_DAIFMT_NB_IF:
14b947d9ced4f72 Damien.Horsley      2015-11-04  314  		break;
14b947d9ced4f72 Damien.Horsley      2015-11-04  315  	case SND_SOC_DAIFMT_IB_NF:
14b947d9ced4f72 Damien.Horsley      2015-11-04  316  		lrd_set |= IMG_I2S_IN_CH_CTL_LRD_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  317  		blkp_set |= IMG_I2S_IN_CH_CTL_BLKP_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  318  		break;
14b947d9ced4f72 Damien.Horsley      2015-11-04  319  	case SND_SOC_DAIFMT_IB_IF:
14b947d9ced4f72 Damien.Horsley      2015-11-04  320  		blkp_set |= IMG_I2S_IN_CH_CTL_BLKP_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  321  		break;
14b947d9ced4f72 Damien.Horsley      2015-11-04  322  	default:
14b947d9ced4f72 Damien.Horsley      2015-11-04  323  		return -EINVAL;
14b947d9ced4f72 Damien.Horsley      2015-11-04  324  	}
14b947d9ced4f72 Damien.Horsley      2015-11-04  325  
14b947d9ced4f72 Damien.Horsley      2015-11-04  326  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
14b947d9ced4f72 Damien.Horsley      2015-11-04  327  	case SND_SOC_DAIFMT_I2S:
14b947d9ced4f72 Damien.Horsley      2015-11-04  328  		chan_control_set |= IMG_I2S_IN_CH_CTL_CLK_TRANS_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  329  		break;
14b947d9ced4f72 Damien.Horsley      2015-11-04  330  	case SND_SOC_DAIFMT_LEFT_J:
14b947d9ced4f72 Damien.Horsley      2015-11-04  331  		break;
14b947d9ced4f72 Damien.Horsley      2015-11-04  332  	default:
14b947d9ced4f72 Damien.Horsley      2015-11-04  333  		return -EINVAL;
14b947d9ced4f72 Damien.Horsley      2015-11-04  334  	}
14b947d9ced4f72 Damien.Horsley      2015-11-04  335  
ed2b384082a678a Charles Keepax      2022-05-19  336  	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
ed2b384082a678a Charles Keepax      2022-05-19  337  	case SND_SOC_DAIFMT_BC_FC:
14b947d9ced4f72 Damien.Horsley      2015-11-04  338  		break;
14b947d9ced4f72 Damien.Horsley      2015-11-04  339  	default:
14b947d9ced4f72 Damien.Horsley      2015-11-04  340  		return -EINVAL;
14b947d9ced4f72 Damien.Horsley      2015-11-04  341  	}
14b947d9ced4f72 Damien.Horsley      2015-11-04  342  
14b947d9ced4f72 Damien.Horsley      2015-11-04  343  	chan_control_mask = IMG_I2S_IN_CH_CTL_CLK_TRANS_MASK;
14b947d9ced4f72 Damien.Horsley      2015-11-04  344  
e5737cceeee5c08 Minghao Chi         2022-04-14  345  	ret = pm_runtime_resume_and_get(i2s->dev);
e5737cceeee5c08 Minghao Chi         2022-04-14  346  	if (ret < 0)
f65bb92ca12e72c Ed Blake            2017-10-06  347  		return ret;
f65bb92ca12e72c Ed Blake            2017-10-06  348  
14b947d9ced4f72 Damien.Horsley      2015-11-04  349  	for (i = 0; i < i2s->active_channels; i++)
14b947d9ced4f72 Damien.Horsley      2015-11-04  350  		img_i2s_in_ch_disable(i2s, i);
14b947d9ced4f72 Damien.Horsley      2015-11-04  351  
14b947d9ced4f72 Damien.Horsley      2015-11-04  352  	/*
14b947d9ced4f72 Damien.Horsley      2015-11-04  353  	 * BLKP and LRD must be set during separate register writes
14b947d9ced4f72 Damien.Horsley      2015-11-04  354  	 */
14b947d9ced4f72 Damien.Horsley      2015-11-04  355  	for (i = 0; i < i2s->max_i2s_chan; i++) {
14b947d9ced4f72 Damien.Horsley      2015-11-04  356  		reg = img_i2s_in_ch_readl(i2s, i, IMG_I2S_IN_CH_CTL);
14b947d9ced4f72 Damien.Horsley      2015-11-04  357  		reg = (reg & ~chan_control_mask) | chan_control_set;
14b947d9ced4f72 Damien.Horsley      2015-11-04  358  		img_i2s_in_ch_writel(i2s, i, reg, IMG_I2S_IN_CH_CTL);
14b947d9ced4f72 Damien.Horsley      2015-11-04  359  		reg = (reg & ~IMG_I2S_IN_CH_CTL_BLKP_MASK) | blkp_set;
14b947d9ced4f72 Damien.Horsley      2015-11-04  360  		img_i2s_in_ch_writel(i2s, i, reg, IMG_I2S_IN_CH_CTL);
14b947d9ced4f72 Damien.Horsley      2015-11-04  361  		reg = (reg & ~IMG_I2S_IN_CH_CTL_LRD_MASK) | lrd_set;
14b947d9ced4f72 Damien.Horsley      2015-11-04  362  		img_i2s_in_ch_writel(i2s, i, reg, IMG_I2S_IN_CH_CTL);
14b947d9ced4f72 Damien.Horsley      2015-11-04  363  	}
14b947d9ced4f72 Damien.Horsley      2015-11-04  364  
14b947d9ced4f72 Damien.Horsley      2015-11-04  365  	for (i = 0; i < i2s->active_channels; i++)
14b947d9ced4f72 Damien.Horsley      2015-11-04  366  		img_i2s_in_ch_enable(i2s, i);
14b947d9ced4f72 Damien.Horsley      2015-11-04  367  
f65bb92ca12e72c Ed Blake            2017-10-06  368  	pm_runtime_put(i2s->dev);
f65bb92ca12e72c Ed Blake            2017-10-06  369  
14b947d9ced4f72 Damien.Horsley      2015-11-04  370  	return 0;
14b947d9ced4f72 Damien.Horsley      2015-11-04  371  }
14b947d9ced4f72 Damien.Horsley      2015-11-04  372  
14b947d9ced4f72 Damien.Horsley      2015-11-04 @373  static int img_i2s_in_dai_probe(struct snd_soc_dai *dai)
14b947d9ced4f72 Damien.Horsley      2015-11-04  374  {
14b947d9ced4f72 Damien.Horsley      2015-11-04  375  	struct img_i2s_in *i2s = snd_soc_dai_get_drvdata(dai);
14b947d9ced4f72 Damien.Horsley      2015-11-04  376  
14b947d9ced4f72 Damien.Horsley      2015-11-04  377  	snd_soc_dai_init_dma_data(dai, NULL, &i2s->dma_data);
14b947d9ced4f72 Damien.Horsley      2015-11-04  378  
14b947d9ced4f72 Damien.Horsley      2015-11-04  379  	return 0;
14b947d9ced4f72 Damien.Horsley      2015-11-04  380  }
14b947d9ced4f72 Damien.Horsley      2015-11-04  381  
bc3f6d1fbadd3a9 Kuninori Morimoto   2025-12-03 @382  static const u64 img_i2s_in_selectable_formats =
bc3f6d1fbadd3a9 Kuninori Morimoto   2025-12-03  383  	SND_SOC_POSSIBLE_DAIFMT_I2S	|
bc3f6d1fbadd3a9 Kuninori Morimoto   2025-12-03  384  	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
bc3f6d1fbadd3a9 Kuninori Morimoto   2025-12-03  385  	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
bc3f6d1fbadd3a9 Kuninori Morimoto   2025-12-03  386  	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
bc3f6d1fbadd3a9 Kuninori Morimoto   2025-12-03  387  	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
bc3f6d1fbadd3a9 Kuninori Morimoto   2025-12-03  388  	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
bc3f6d1fbadd3a9 Kuninori Morimoto   2025-12-03  389  
ca6b2aac2ad4910 Kuninori Morimoto   2023-08-08 @390  static const struct snd_soc_dai_ops img_i2s_in_dai_ops = {
ca6b2aac2ad4910 Kuninori Morimoto   2023-08-08  391  	.probe		= img_i2s_in_dai_probe,
ca6b2aac2ad4910 Kuninori Morimoto   2023-08-08  392  	.trigger	= img_i2s_in_trigger,
ca6b2aac2ad4910 Kuninori Morimoto   2023-08-08  393  	.hw_params	= img_i2s_in_hw_params,
ca6b2aac2ad4910 Kuninori Morimoto   2023-08-08  394  	.set_fmt	= img_i2s_in_set_fmt
bc3f6d1fbadd3a9 Kuninori Morimoto   2025-12-03  395  	.auto_selectable_formats	= &img_i2s_in_selectable_formats,
bc3f6d1fbadd3a9 Kuninori Morimoto   2025-12-03  396  	.num_auto_selectable_formats	= 1,
ca6b2aac2ad4910 Kuninori Morimoto   2023-08-08  397  };
ca6b2aac2ad4910 Kuninori Morimoto   2023-08-08  398  
14b947d9ced4f72 Damien.Horsley      2015-11-04  399  static const struct snd_soc_component_driver img_i2s_in_component = {
5f9d69986014945 Charles Keepax      2022-06-23  400  	.name = "img-i2s-in",
5f9d69986014945 Charles Keepax      2022-06-23  401  	.legacy_dai_naming = 1,
14b947d9ced4f72 Damien.Horsley      2015-11-04  402  };
14b947d9ced4f72 Damien.Horsley      2015-11-04  403  
14b947d9ced4f72 Damien.Horsley      2015-11-04  404  static int img_i2s_in_dma_prepare_slave_config(struct snd_pcm_substream *st,
14b947d9ced4f72 Damien.Horsley      2015-11-04  405  	struct snd_pcm_hw_params *params, struct dma_slave_config *sc)
14b947d9ced4f72 Damien.Horsley      2015-11-04  406  {
14b947d9ced4f72 Damien.Horsley      2015-11-04  407  	unsigned int i2s_channels = params_channels(params) / 2;
3b62178720594e0 Krzysztof Kozlowski 2024-04-30  408  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(st);
14b947d9ced4f72 Damien.Horsley      2015-11-04  409  	struct snd_dmaengine_dai_dma_data *dma_data;
14b947d9ced4f72 Damien.Horsley      2015-11-04  410  	int ret;
14b947d9ced4f72 Damien.Horsley      2015-11-04  411  
cc807acede357e2 Kuninori Morimoto   2023-09-11  412  	dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), st);
14b947d9ced4f72 Damien.Horsley      2015-11-04  413  
14b947d9ced4f72 Damien.Horsley      2015-11-04  414  	ret = snd_hwparams_to_dma_slave_config(st, params, sc);
14b947d9ced4f72 Damien.Horsley      2015-11-04  415  	if (ret)
14b947d9ced4f72 Damien.Horsley      2015-11-04  416  		return ret;
14b947d9ced4f72 Damien.Horsley      2015-11-04  417  
14b947d9ced4f72 Damien.Horsley      2015-11-04  418  	sc->src_addr = dma_data->addr;
14b947d9ced4f72 Damien.Horsley      2015-11-04  419  	sc->src_addr_width = dma_data->addr_width;
14b947d9ced4f72 Damien.Horsley      2015-11-04  420  	sc->src_maxburst = 4 * i2s_channels;
14b947d9ced4f72 Damien.Horsley      2015-11-04  421  
14b947d9ced4f72 Damien.Horsley      2015-11-04  422  	return 0;
14b947d9ced4f72 Damien.Horsley      2015-11-04  423  }
14b947d9ced4f72 Damien.Horsley      2015-11-04  424  
14b947d9ced4f72 Damien.Horsley      2015-11-04  425  static const struct snd_dmaengine_pcm_config img_i2s_in_dma_config = {
14b947d9ced4f72 Damien.Horsley      2015-11-04  426  	.prepare_slave_config = img_i2s_in_dma_prepare_slave_config
14b947d9ced4f72 Damien.Horsley      2015-11-04  427  };
14b947d9ced4f72 Damien.Horsley      2015-11-04  428  
14b947d9ced4f72 Damien.Horsley      2015-11-04  429  static int img_i2s_in_probe(struct platform_device *pdev)
14b947d9ced4f72 Damien.Horsley      2015-11-04  430  {
14b947d9ced4f72 Damien.Horsley      2015-11-04  431  	struct img_i2s_in *i2s;
14b947d9ced4f72 Damien.Horsley      2015-11-04  432  	struct resource *res;
14b947d9ced4f72 Damien.Horsley      2015-11-04  433  	void __iomem *base;
14b947d9ced4f72 Damien.Horsley      2015-11-04  434  	int ret, i;
14b947d9ced4f72 Damien.Horsley      2015-11-04  435  	struct reset_control *rst;
14b947d9ced4f72 Damien.Horsley      2015-11-04  436  	unsigned int max_i2s_chan_pow_2;
14b947d9ced4f72 Damien.Horsley      2015-11-04  437  	struct device *dev = &pdev->dev;
14b947d9ced4f72 Damien.Horsley      2015-11-04  438  
14b947d9ced4f72 Damien.Horsley      2015-11-04  439  	i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
14b947d9ced4f72 Damien.Horsley      2015-11-04  440  	if (!i2s)
14b947d9ced4f72 Damien.Horsley      2015-11-04  441  		return -ENOMEM;
14b947d9ced4f72 Damien.Horsley      2015-11-04  442  
14b947d9ced4f72 Damien.Horsley      2015-11-04  443  	platform_set_drvdata(pdev, i2s);
14b947d9ced4f72 Damien.Horsley      2015-11-04  444  
14b947d9ced4f72 Damien.Horsley      2015-11-04  445  	i2s->dev = dev;
14b947d9ced4f72 Damien.Horsley      2015-11-04  446  
e43805c28df6394 Yang Yingliang      2021-06-15  447  	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
14b947d9ced4f72 Damien.Horsley      2015-11-04  448  	if (IS_ERR(base))
14b947d9ced4f72 Damien.Horsley      2015-11-04  449  		return PTR_ERR(base);
14b947d9ced4f72 Damien.Horsley      2015-11-04  450  
14b947d9ced4f72 Damien.Horsley      2015-11-04  451  	i2s->base = base;
14b947d9ced4f72 Damien.Horsley      2015-11-04  452  
14b947d9ced4f72 Damien.Horsley      2015-11-04  453  	if (of_property_read_u32(pdev->dev.of_node, "img,i2s-channels",
14b947d9ced4f72 Damien.Horsley      2015-11-04  454  			&i2s->max_i2s_chan)) {
14b947d9ced4f72 Damien.Horsley      2015-11-04  455  		dev_err(dev, "No img,i2s-channels property\n");
14b947d9ced4f72 Damien.Horsley      2015-11-04  456  		return -EINVAL;
14b947d9ced4f72 Damien.Horsley      2015-11-04  457  	}
14b947d9ced4f72 Damien.Horsley      2015-11-04  458  
14b947d9ced4f72 Damien.Horsley      2015-11-04  459  	max_i2s_chan_pow_2 = 1 << get_count_order(i2s->max_i2s_chan);
14b947d9ced4f72 Damien.Horsley      2015-11-04  460  
14b947d9ced4f72 Damien.Horsley      2015-11-04  461  	i2s->channel_base = base + (max_i2s_chan_pow_2 * 0x20);
14b947d9ced4f72 Damien.Horsley      2015-11-04  462  
14b947d9ced4f72 Damien.Horsley      2015-11-04  463  	i2s->clk_sys = devm_clk_get(dev, "sys");
ef12f373f21d66e Kuninori Morimoto   2021-12-14  464  	if (IS_ERR(i2s->clk_sys))
ef12f373f21d66e Kuninori Morimoto   2021-12-14  465  		return dev_err_probe(dev, PTR_ERR(i2s->clk_sys),
ef12f373f21d66e Kuninori Morimoto   2021-12-14  466  				     "Failed to acquire clock 'sys'\n");
14b947d9ced4f72 Damien.Horsley      2015-11-04  467  
f65bb92ca12e72c Ed Blake            2017-10-06  468  	pm_runtime_enable(&pdev->dev);
f65bb92ca12e72c Ed Blake            2017-10-06  469  	if (!pm_runtime_enabled(&pdev->dev)) {
f65bb92ca12e72c Ed Blake            2017-10-06  470  		ret = img_i2s_in_runtime_resume(&pdev->dev);
14b947d9ced4f72 Damien.Horsley      2015-11-04  471  		if (ret)
f65bb92ca12e72c Ed Blake            2017-10-06  472  			goto err_pm_disable;
f65bb92ca12e72c Ed Blake            2017-10-06  473  	}
81aad47278539f0 Yufen Yu            2021-05-24  474  	ret = pm_runtime_resume_and_get(&pdev->dev);
f65bb92ca12e72c Ed Blake            2017-10-06  475  	if (ret < 0)
f65bb92ca12e72c Ed Blake            2017-10-06  476  		goto err_suspend;
14b947d9ced4f72 Damien.Horsley      2015-11-04  477  
14b947d9ced4f72 Damien.Horsley      2015-11-04  478  	i2s->active_channels = 1;
14b947d9ced4f72 Damien.Horsley      2015-11-04  479  	i2s->dma_data.addr = res->start + IMG_I2S_IN_RX_FIFO;
14b947d9ced4f72 Damien.Horsley      2015-11-04  480  	i2s->dma_data.addr_width = 4;
14b947d9ced4f72 Damien.Horsley      2015-11-04  481  
14b947d9ced4f72 Damien.Horsley      2015-11-04  482  	i2s->dai_driver.capture.channels_min = 2;
14b947d9ced4f72 Damien.Horsley      2015-11-04  483  	i2s->dai_driver.capture.channels_max = i2s->max_i2s_chan * 2;
14b947d9ced4f72 Damien.Horsley      2015-11-04  484  	i2s->dai_driver.capture.rates = SNDRV_PCM_RATE_8000_192000;
14b947d9ced4f72 Damien.Horsley      2015-11-04  485  	i2s->dai_driver.capture.formats = SNDRV_PCM_FMTBIT_S32_LE |
14b947d9ced4f72 Damien.Horsley      2015-11-04  486  		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S16_LE;
14b947d9ced4f72 Damien.Horsley      2015-11-04 @487  	i2s->dai_driver.ops = &img_i2s_in_dai_ops;
14b947d9ced4f72 Damien.Horsley      2015-11-04  488  
3a4e1b93110362f Philipp Zabel       2017-07-19  489  	rst = devm_reset_control_get_exclusive(dev, "rst");
14b947d9ced4f72 Damien.Horsley      2015-11-04  490  	if (IS_ERR(rst)) {
14b947d9ced4f72 Damien.Horsley      2015-11-04  491  		if (PTR_ERR(rst) == -EPROBE_DEFER) {
14b947d9ced4f72 Damien.Horsley      2015-11-04  492  			ret = -EPROBE_DEFER;
25bf943e4e7b472 Qiushi Wu           2020-05-25  493  			pm_runtime_put(&pdev->dev);
f65bb92ca12e72c Ed Blake            2017-10-06  494  			goto err_suspend;
14b947d9ced4f72 Damien.Horsley      2015-11-04  495  		}
14b947d9ced4f72 Damien.Horsley      2015-11-04  496  
14b947d9ced4f72 Damien.Horsley      2015-11-04  497  		dev_dbg(dev, "No top level reset found\n");
14b947d9ced4f72 Damien.Horsley      2015-11-04  498  
14b947d9ced4f72 Damien.Horsley      2015-11-04  499  		img_i2s_in_disable(i2s);
14b947d9ced4f72 Damien.Horsley      2015-11-04  500  
14b947d9ced4f72 Damien.Horsley      2015-11-04  501  		for (i = 0; i < i2s->max_i2s_chan; i++)
14b947d9ced4f72 Damien.Horsley      2015-11-04  502  			img_i2s_in_ch_disable(i2s, i);
14b947d9ced4f72 Damien.Horsley      2015-11-04  503  	} else {
14b947d9ced4f72 Damien.Horsley      2015-11-04  504  		reset_control_assert(rst);
14b947d9ced4f72 Damien.Horsley      2015-11-04  505  		reset_control_deassert(rst);
14b947d9ced4f72 Damien.Horsley      2015-11-04  506  	}
14b947d9ced4f72 Damien.Horsley      2015-11-04  507  
14b947d9ced4f72 Damien.Horsley      2015-11-04  508  	img_i2s_in_writel(i2s, 0, IMG_I2S_IN_CTL);
14b947d9ced4f72 Damien.Horsley      2015-11-04  509  
14b947d9ced4f72 Damien.Horsley      2015-11-04  510  	for (i = 0; i < i2s->max_i2s_chan; i++)
14b947d9ced4f72 Damien.Horsley      2015-11-04  511  		img_i2s_in_ch_writel(i2s, i,
14b947d9ced4f72 Damien.Horsley      2015-11-04  512  			(4 << IMG_I2S_IN_CH_CTL_CCDEL_SHIFT) |
14b947d9ced4f72 Damien.Horsley      2015-11-04  513  			IMG_I2S_IN_CH_CTL_JUST_MASK |
14b947d9ced4f72 Damien.Horsley      2015-11-04  514  			IMG_I2S_IN_CH_CTL_FW_MASK, IMG_I2S_IN_CH_CTL);
14b947d9ced4f72 Damien.Horsley      2015-11-04  515  
f65bb92ca12e72c Ed Blake            2017-10-06  516  	pm_runtime_put(&pdev->dev);
f65bb92ca12e72c Ed Blake            2017-10-06  517  
a86854d0c599b32 Kees Cook           2018-06-12  518  	i2s->suspend_ch_ctl = devm_kcalloc(dev,
a86854d0c599b32 Kees Cook           2018-06-12  519  		i2s->max_i2s_chan, sizeof(*i2s->suspend_ch_ctl), GFP_KERNEL);
8ab7f885da23719 Ed Blake            2017-10-06  520  	if (!i2s->suspend_ch_ctl) {
8ab7f885da23719 Ed Blake            2017-10-06  521  		ret = -ENOMEM;
f65bb92ca12e72c Ed Blake            2017-10-06  522  		goto err_suspend;
8ab7f885da23719 Ed Blake            2017-10-06  523  	}
8ab7f885da23719 Ed Blake            2017-10-06  524  
14b947d9ced4f72 Damien.Horsley      2015-11-04  525  	ret = devm_snd_soc_register_component(dev, &img_i2s_in_component,
14b947d9ced4f72 Damien.Horsley      2015-11-04  526  						&i2s->dai_driver, 1);
14b947d9ced4f72 Damien.Horsley      2015-11-04  527  	if (ret)
f65bb92ca12e72c Ed Blake            2017-10-06  528  		goto err_suspend;
14b947d9ced4f72 Damien.Horsley      2015-11-04  529  
14b947d9ced4f72 Damien.Horsley      2015-11-04  530  	ret = devm_snd_dmaengine_pcm_register(dev, &img_i2s_in_dma_config, 0);
14b947d9ced4f72 Damien.Horsley      2015-11-04  531  	if (ret)
f65bb92ca12e72c Ed Blake            2017-10-06  532  		goto err_suspend;
14b947d9ced4f72 Damien.Horsley      2015-11-04  533  
14b947d9ced4f72 Damien.Horsley      2015-11-04  534  	return 0;
14b947d9ced4f72 Damien.Horsley      2015-11-04  535  
f65bb92ca12e72c Ed Blake            2017-10-06  536  err_suspend:
f65bb92ca12e72c Ed Blake            2017-10-06  537  	if (!pm_runtime_enabled(&pdev->dev))
f65bb92ca12e72c Ed Blake            2017-10-06  538  		img_i2s_in_runtime_suspend(&pdev->dev);
f65bb92ca12e72c Ed Blake            2017-10-06  539  err_pm_disable:
f65bb92ca12e72c Ed Blake            2017-10-06  540  	pm_runtime_disable(&pdev->dev);
14b947d9ced4f72 Damien.Horsley      2015-11-04  541  
14b947d9ced4f72 Damien.Horsley      2015-11-04  542  	return ret;
14b947d9ced4f72 Damien.Horsley      2015-11-04  543  }
14b947d9ced4f72 Damien.Horsley      2015-11-04  544  

:::::: The code at line 390 was first introduced by commit
:::::: ca6b2aac2ad49101d058f8f1d5099d36fd7b5360 ASoC: img: merge DAI call back functions into ops

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
