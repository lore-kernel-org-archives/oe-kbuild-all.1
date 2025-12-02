Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022CE21322F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 02:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764644097; cv=none; b=aFOGGSV74yM+cMkTQd5OR98KU+X87RsoYRLeETNOGJwc7Vx3hXQ6MJabP5RutEbOefWF3FdpbBri2IkKMkaKv465JbfaeGxA7M1Hrm65/7nG7I8VUN86oMEHCK+LgMsCiZgb4EGEiabi71VFbFAySVnBTmIcv7VgKFBwK5YVpjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764644097; c=relaxed/simple;
	bh=yNpKgqIj9oYnTYxSDW4u8Z91YYV8VPLQNWxfxkzIxys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iQWJcQsGIe8UvmCoxTD1PhG0sKsQwJznOhhoFhIahCOul3Lwo8Gui5MwZowYRtl2qymWCwOTAqIYFBRGb3sez3aeJe13baAHrm9fD+p25cMvg2G5847obp/nNVJodhW59qA97D0AZlJ66kHbfIlHO8NNUEGMygAe3mObp95dDMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LeZp2fkb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LeZp2fkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764644094; x=1796180094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yNpKgqIj9oYnTYxSDW4u8Z91YYV8VPLQNWxfxkzIxys=;
  b=LeZp2fkbi/jzGLhWwEpzhVy1SOl9bzcRJTYjoMG3JOiBViB2fdTFXEbw
   29RP6OEn3eVYnyq9up601LetvtmR+J7eOULJuvlB8BqJbuiy+e5mm2BIq
   qhosi/Bp2cr628bb6z21zONJPUtJGldB70UR1u0/e/j+Nl2Cvh/UA0CQt
   HULgij2k/zoupIs+Py4Zf/Yd/XPoysOTWR8E2rLAEzfuF9FdbedNjHbd5
   Dy4EMAnK4P8GnTK7TLz/AvT41oKTGwQPs2NEViNWHCEkmFIzPU2cwiMrN
   lKysMsn/DWtIhQVE6IKiGgVm2s4Y4ZeKcf0fWEVukM1c9u1wGLSclXXfF
   g==;
X-CSE-ConnectionGUID: 0M2iKkH2Q7Cr6/+nQ+L7gg==
X-CSE-MsgGUID: fstfPqnQSS+zPPOuVbvy6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66767101"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66767101"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:54:53 -0800
X-CSE-ConnectionGUID: q3ssrGV9TmGzief0wDwg1w==
X-CSE-MsgGUID: QviaqsSZTruvjo/Xu7AqFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194451225"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Dec 2025 18:54:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQGXR-000000009Ll-3krQ;
	Tue, 02 Dec 2025 02:54:49 +0000
Date: Tue, 2 Dec 2025 10:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-12-01 12/13]
 sound/soc/rockchip/rockchip_pdm.c:388:1: error: expected expression before
 'static'
Message-ID: <202512021013.QmO9glpr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-12-01
head:   a5568a9bacc493dbb1465f3b850acf8595553013
commit: 37f1f58e36152e534fc127762820579e3a28ea85 [12/13] hoge
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251202/202512021013.QmO9glpr-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021013.QmO9glpr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021013.QmO9glpr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/rockchip/rockchip_pdm.c:388:1: error: expected expression before 'static'
     388 | static const struct snd_soc_dai_ops rockchip_pdm_dai_ops = {
         | ^~~~~~
>> sound/soc/rockchip/rockchip_pdm.c:411:17: error: 'rockchip_pdm_dai_ops' undeclared here (not in a function); did you mean 'rockchip_pdm_dai'?
     411 |         .ops = &rockchip_pdm_dai_ops,
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 rockchip_pdm_dai
>> sound/soc/rockchip/rockchip_pdm.c:384:18: warning: 'rockchip_pdm_selectable_formats' defined but not used [-Wunused-const-variable=]
     384 | static const u64 rockchip_pdm_selectable_formats =
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/rockchip/rockchip_pdm.c:371:12: warning: 'rockchip_pdm_dai_probe' defined but not used [-Wunused-function]
     371 | static int rockchip_pdm_dai_probe(struct snd_soc_dai *dai)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/rockchip/rockchip_pdm.c:344:12: warning: 'rockchip_pdm_trigger' defined but not used [-Wunused-function]
     344 | static int rockchip_pdm_trigger(struct snd_pcm_substream *substream, int cmd,
         |            ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/rockchip/rockchip_pdm.c:319:12: warning: 'rockchip_pdm_set_fmt' defined but not used [-Wunused-function]
     319 | static int rockchip_pdm_set_fmt(struct snd_soc_dai *cpu_dai,
         |            ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/rockchip/rockchip_pdm.c:195:12: warning: 'rockchip_pdm_hw_params' defined but not used [-Wunused-function]
     195 | static int rockchip_pdm_hw_params(struct snd_pcm_substream *substream,
         |            ^~~~~~~~~~~~~~~~~~~~~~
--
>> sound/soc/sti/uniperif_player.c:1060:9: error: request for member 'auto_selectable_formats' in something not a structure or union
    1060 |         .auto_selectable_formats        = &uni_selectable_formats,
         |         ^
--
>> sound/soc/sti/uniperif_reader.c:422:9: error: request for member 'auto_selectable_formats' in something not a structure or union
     422 |         .auto_selectable_formats        = &uni_selectable_formats,
         |         ^
>> sound/soc/sti/uniperif_reader.c:422:44: error: 'uni_selectable_formats' undeclared here (not in a function); did you mean 'ui_selectable_formats'?
     422 |         .auto_selectable_formats        = &uni_selectable_formats,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~
         |                                            ui_selectable_formats
>> sound/soc/sti/uniperif_reader.c:404:18: warning: 'ui_selectable_formats' defined but not used [-Wunused-const-variable=]
     404 | static const u64 ui_selectable_formats =
         |                  ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/sound/soc.h:1401,
                    from include/sound/dmaengine_pcm.h:11,
                    from sound/soc/sunxi/sun4i-i2s.c:19:
>> include/sound/soc-dai.h:47:49: error: invalid initializer
      47 | #define SND_SOC_POSSIBLE_DAIFMT_I2S             (1 << SND_SOC_DAI_FORMAT_I2S)
         |                                                 ^
   sound/soc/sunxi/sun4i-i2s.c:1115:9: note: in expansion of macro 'SND_SOC_POSSIBLE_DAIFMT_I2S'
    1115 |         SND_SOC_POSSIBLE_DAIFMT_I2S     |
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/sound/soc-dai.h:50:50: error: expected identifier or '(' before numeric constant
      50 | #define SND_SOC_POSSIBLE_DAIFMT_DSP_A           (1 << SND_SOC_DAI_FORMAT_DSP_A)
         |                                                  ^
   sound/soc/sunxi/sun4i-i2s.c:1123:9: note: in expansion of macro 'SND_SOC_POSSIBLE_DAIFMT_DSP_A'
    1123 |         SND_SOC_POSSIBLE_DAIFMT_DSP_A   |
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> sound/soc/uniphier/aio-cpu.c:464:44: error: 'uniphier_dai_selectable_formats' undeclared here (not in a function); did you mean 'uniphier_aio_selectable_formats'?
     464 |         .auto_selectable_formats        = &uniphier_dai_selectable_formats,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            uniphier_aio_selectable_formats
--
   In file included from include/sound/soc.h:1401,
                    from include/sound/dmaengine_pcm.h:11,
                    from sun4i-i2s.c:19:
>> include/sound/soc-dai.h:47:49: error: invalid initializer
      47 | #define SND_SOC_POSSIBLE_DAIFMT_I2S             (1 << SND_SOC_DAI_FORMAT_I2S)
         |                                                 ^
   sun4i-i2s.c:1115:9: note: in expansion of macro 'SND_SOC_POSSIBLE_DAIFMT_I2S'
    1115 |         SND_SOC_POSSIBLE_DAIFMT_I2S     |
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/sound/soc-dai.h:50:50: error: expected identifier or '(' before numeric constant
      50 | #define SND_SOC_POSSIBLE_DAIFMT_DSP_A           (1 << SND_SOC_DAI_FORMAT_DSP_A)
         |                                                  ^
   sun4i-i2s.c:1123:9: note: in expansion of macro 'SND_SOC_POSSIBLE_DAIFMT_DSP_A'
    1123 |         SND_SOC_POSSIBLE_DAIFMT_DSP_A   |
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/static +388 sound/soc/rockchip/rockchip_pdm.c

fc05a5b2225306 Sugar Zhang         2017-06-13  194  
fc05a5b2225306 Sugar Zhang         2017-06-13 @195  static int rockchip_pdm_hw_params(struct snd_pcm_substream *substream,
fc05a5b2225306 Sugar Zhang         2017-06-13  196  				  struct snd_pcm_hw_params *params,
fc05a5b2225306 Sugar Zhang         2017-06-13  197  				  struct snd_soc_dai *dai)
fc05a5b2225306 Sugar Zhang         2017-06-13  198  {
fc05a5b2225306 Sugar Zhang         2017-06-13  199  	struct rk_pdm_dev *pdm = to_info(dai);
fc05a5b2225306 Sugar Zhang         2017-06-13  200  	unsigned int val = 0;
fc05a5b2225306 Sugar Zhang         2017-06-13  201  	unsigned int clk_rate, clk_div, samplerate;
f153bf49ddf616 Takashi Iwai        2019-05-06  202  	unsigned int clk_src, clk_out = 0;
624e8e00acafe3 Sugar Zhang         2019-04-04  203  	unsigned long m, n;
624e8e00acafe3 Sugar Zhang         2019-04-04  204  	bool change;
fc05a5b2225306 Sugar Zhang         2017-06-13  205  	int ret;
fc05a5b2225306 Sugar Zhang         2017-06-13  206  
624e8e00acafe3 Sugar Zhang         2019-04-04  207  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
624e8e00acafe3 Sugar Zhang         2019-04-04  208  		return 0;
624e8e00acafe3 Sugar Zhang         2019-04-04  209  
fc05a5b2225306 Sugar Zhang         2017-06-13  210  	samplerate = params_rate(params);
624e8e00acafe3 Sugar Zhang         2019-04-04  211  	clk_rate = get_pdm_clk(pdm, samplerate, &clk_src, &clk_out);
fc05a5b2225306 Sugar Zhang         2017-06-13  212  	if (!clk_rate)
fc05a5b2225306 Sugar Zhang         2017-06-13  213  		return -EINVAL;
fc05a5b2225306 Sugar Zhang         2017-06-13  214  
624e8e00acafe3 Sugar Zhang         2019-04-04  215  	ret = clk_set_rate(pdm->clk, clk_src);
fc05a5b2225306 Sugar Zhang         2017-06-13  216  	if (ret)
fc05a5b2225306 Sugar Zhang         2017-06-13  217  		return -EINVAL;
fc05a5b2225306 Sugar Zhang         2017-06-13  218  
d269aa2ab97580 Sugar Zhang         2021-09-03  219  	if (pdm->version == RK_PDM_RK3308 ||
d269aa2ab97580 Sugar Zhang         2021-09-03  220  	    pdm->version == RK_PDM_RV1126) {
624e8e00acafe3 Sugar Zhang         2019-04-04  221  		rational_best_approximation(clk_out, clk_src,
624e8e00acafe3 Sugar Zhang         2019-04-04  222  					    GENMASK(16 - 1, 0),
624e8e00acafe3 Sugar Zhang         2019-04-04  223  					    GENMASK(16 - 1, 0),
624e8e00acafe3 Sugar Zhang         2019-04-04  224  					    &m, &n);
624e8e00acafe3 Sugar Zhang         2019-04-04  225  
624e8e00acafe3 Sugar Zhang         2019-04-04  226  		val = (m << PDM_FD_NUMERATOR_SFT) |
624e8e00acafe3 Sugar Zhang         2019-04-04  227  			(n << PDM_FD_DENOMINATOR_SFT);
624e8e00acafe3 Sugar Zhang         2019-04-04  228  		regmap_update_bits_check(pdm->regmap, PDM_CTRL1,
624e8e00acafe3 Sugar Zhang         2019-04-04  229  					 PDM_FD_NUMERATOR_MSK |
624e8e00acafe3 Sugar Zhang         2019-04-04  230  					 PDM_FD_DENOMINATOR_MSK,
624e8e00acafe3 Sugar Zhang         2019-04-04  231  					 val, &change);
624e8e00acafe3 Sugar Zhang         2019-04-04  232  		if (change) {
624e8e00acafe3 Sugar Zhang         2019-04-04  233  			reset_control_assert(pdm->reset);
624e8e00acafe3 Sugar Zhang         2019-04-04  234  			reset_control_deassert(pdm->reset);
624e8e00acafe3 Sugar Zhang         2019-04-04  235  			rockchip_pdm_rxctrl(pdm, 0);
624e8e00acafe3 Sugar Zhang         2019-04-04  236  		}
624e8e00acafe3 Sugar Zhang         2019-04-04  237  		clk_div = n / m;
624e8e00acafe3 Sugar Zhang         2019-04-04  238  		if (clk_div >= 40)
624e8e00acafe3 Sugar Zhang         2019-04-04  239  			val = PDM_CLK_FD_RATIO_40;
624e8e00acafe3 Sugar Zhang         2019-04-04  240  		else if (clk_div <= 35)
624e8e00acafe3 Sugar Zhang         2019-04-04  241  			val = PDM_CLK_FD_RATIO_35;
624e8e00acafe3 Sugar Zhang         2019-04-04  242  		else
fc05a5b2225306 Sugar Zhang         2017-06-13  243  			return -EINVAL;
624e8e00acafe3 Sugar Zhang         2019-04-04  244  		regmap_update_bits(pdm->regmap, PDM_CLK_CTRL,
624e8e00acafe3 Sugar Zhang         2019-04-04  245  				   PDM_CLK_FD_RATIO_MSK,
624e8e00acafe3 Sugar Zhang         2019-04-04  246  				   val);
fc05a5b2225306 Sugar Zhang         2017-06-13  247  	}
d269aa2ab97580 Sugar Zhang         2021-09-03  248  
d269aa2ab97580 Sugar Zhang         2021-09-03  249  	if (pdm->version == RK_PDM_RV1126) {
d269aa2ab97580 Sugar Zhang         2021-09-03  250  		val = get_pdm_cic_ratio(clk_out);
d269aa2ab97580 Sugar Zhang         2021-09-03  251  		regmap_update_bits(pdm->regmap, PDM_CLK_CTRL, PDM_CIC_RATIO_MSK, val);
d269aa2ab97580 Sugar Zhang         2021-09-03  252  		val = samplerate_to_bit(samplerate);
d269aa2ab97580 Sugar Zhang         2021-09-03  253  		regmap_update_bits(pdm->regmap, PDM_CTRL0,
d269aa2ab97580 Sugar Zhang         2021-09-03  254  				   PDM_SAMPLERATE_MSK, PDM_SAMPLERATE(val));
d269aa2ab97580 Sugar Zhang         2021-09-03  255  	} else {
624e8e00acafe3 Sugar Zhang         2019-04-04  256  		val = get_pdm_ds_ratio(samplerate);
fc05a5b2225306 Sugar Zhang         2017-06-13  257  		regmap_update_bits(pdm->regmap, PDM_CLK_CTRL, PDM_DS_RATIO_MSK, val);
d269aa2ab97580 Sugar Zhang         2021-09-03  258  	}
d269aa2ab97580 Sugar Zhang         2021-09-03  259  
fc05a5b2225306 Sugar Zhang         2017-06-13  260  	regmap_update_bits(pdm->regmap, PDM_HPF_CTRL,
fc05a5b2225306 Sugar Zhang         2017-06-13  261  			   PDM_HPF_CF_MSK, PDM_HPF_60HZ);
fc05a5b2225306 Sugar Zhang         2017-06-13  262  	regmap_update_bits(pdm->regmap, PDM_HPF_CTRL,
fc05a5b2225306 Sugar Zhang         2017-06-13  263  			   PDM_HPF_LE | PDM_HPF_RE, PDM_HPF_LE | PDM_HPF_RE);
fc05a5b2225306 Sugar Zhang         2017-06-13  264  	regmap_update_bits(pdm->regmap, PDM_CLK_CTRL, PDM_CLK_EN, PDM_CLK_EN);
54cd97cfe02e9b Sugar Zhang         2019-04-04  265  	if (pdm->version != RK_PDM_RK3229)
54cd97cfe02e9b Sugar Zhang         2019-04-04  266  		regmap_update_bits(pdm->regmap, PDM_CTRL0,
54cd97cfe02e9b Sugar Zhang         2019-04-04  267  				   PDM_MODE_MSK, PDM_MODE_LJ);
fc05a5b2225306 Sugar Zhang         2017-06-13  268  
fc05a5b2225306 Sugar Zhang         2017-06-13  269  	val = 0;
fc05a5b2225306 Sugar Zhang         2017-06-13  270  	switch (params_format(params)) {
fc05a5b2225306 Sugar Zhang         2017-06-13  271  	case SNDRV_PCM_FORMAT_S8:
fc05a5b2225306 Sugar Zhang         2017-06-13  272  		val |= PDM_VDW(8);
fc05a5b2225306 Sugar Zhang         2017-06-13  273  		break;
fc05a5b2225306 Sugar Zhang         2017-06-13  274  	case SNDRV_PCM_FORMAT_S16_LE:
fc05a5b2225306 Sugar Zhang         2017-06-13  275  		val |= PDM_VDW(16);
fc05a5b2225306 Sugar Zhang         2017-06-13  276  		break;
fc05a5b2225306 Sugar Zhang         2017-06-13  277  	case SNDRV_PCM_FORMAT_S20_3LE:
fc05a5b2225306 Sugar Zhang         2017-06-13  278  		val |= PDM_VDW(20);
fc05a5b2225306 Sugar Zhang         2017-06-13  279  		break;
fc05a5b2225306 Sugar Zhang         2017-06-13  280  	case SNDRV_PCM_FORMAT_S24_LE:
fc05a5b2225306 Sugar Zhang         2017-06-13  281  		val |= PDM_VDW(24);
fc05a5b2225306 Sugar Zhang         2017-06-13  282  		break;
fc05a5b2225306 Sugar Zhang         2017-06-13  283  	case SNDRV_PCM_FORMAT_S32_LE:
fc05a5b2225306 Sugar Zhang         2017-06-13  284  		val |= PDM_VDW(32);
fc05a5b2225306 Sugar Zhang         2017-06-13  285  		break;
fc05a5b2225306 Sugar Zhang         2017-06-13  286  	default:
fc05a5b2225306 Sugar Zhang         2017-06-13  287  		return -EINVAL;
fc05a5b2225306 Sugar Zhang         2017-06-13  288  	}
fc05a5b2225306 Sugar Zhang         2017-06-13  289  
fc05a5b2225306 Sugar Zhang         2017-06-13  290  	switch (params_channels(params)) {
fc05a5b2225306 Sugar Zhang         2017-06-13  291  	case 8:
fc05a5b2225306 Sugar Zhang         2017-06-13  292  		val |= PDM_PATH3_EN;
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  293  		fallthrough;
fc05a5b2225306 Sugar Zhang         2017-06-13  294  	case 6:
fc05a5b2225306 Sugar Zhang         2017-06-13  295  		val |= PDM_PATH2_EN;
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  296  		fallthrough;
fc05a5b2225306 Sugar Zhang         2017-06-13  297  	case 4:
fc05a5b2225306 Sugar Zhang         2017-06-13  298  		val |= PDM_PATH1_EN;
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  299  		fallthrough;
fc05a5b2225306 Sugar Zhang         2017-06-13  300  	case 2:
fc05a5b2225306 Sugar Zhang         2017-06-13  301  		val |= PDM_PATH0_EN;
fc05a5b2225306 Sugar Zhang         2017-06-13  302  		break;
fc05a5b2225306 Sugar Zhang         2017-06-13  303  	default:
fc05a5b2225306 Sugar Zhang         2017-06-13  304  		dev_err(pdm->dev, "invalid channel: %d\n",
fc05a5b2225306 Sugar Zhang         2017-06-13  305  			params_channels(params));
fc05a5b2225306 Sugar Zhang         2017-06-13  306  		return -EINVAL;
fc05a5b2225306 Sugar Zhang         2017-06-13  307  	}
fc05a5b2225306 Sugar Zhang         2017-06-13  308  
fc05a5b2225306 Sugar Zhang         2017-06-13  309  	regmap_update_bits(pdm->regmap, PDM_CTRL0,
fc05a5b2225306 Sugar Zhang         2017-06-13  310  			   PDM_PATH_MSK | PDM_VDW_MSK,
fc05a5b2225306 Sugar Zhang         2017-06-13  311  			   val);
430f5da69b9323 Sugar Zhang         2019-04-04  312  	/* all channels share the single FIFO */
fc05a5b2225306 Sugar Zhang         2017-06-13  313  	regmap_update_bits(pdm->regmap, PDM_DMA_CTRL, PDM_DMA_RDL_MSK,
430f5da69b9323 Sugar Zhang         2019-04-04  314  			   PDM_DMA_RDL(8 * params_channels(params)));
fc05a5b2225306 Sugar Zhang         2017-06-13  315  
fc05a5b2225306 Sugar Zhang         2017-06-13  316  	return 0;
fc05a5b2225306 Sugar Zhang         2017-06-13  317  }
fc05a5b2225306 Sugar Zhang         2017-06-13  318  
fc05a5b2225306 Sugar Zhang         2017-06-13 @319  static int rockchip_pdm_set_fmt(struct snd_soc_dai *cpu_dai,
fc05a5b2225306 Sugar Zhang         2017-06-13  320  				unsigned int fmt)
fc05a5b2225306 Sugar Zhang         2017-06-13  321  {
fc05a5b2225306 Sugar Zhang         2017-06-13  322  	struct rk_pdm_dev *pdm = to_info(cpu_dai);
fc05a5b2225306 Sugar Zhang         2017-06-13  323  	unsigned int mask = 0, val = 0;
fc05a5b2225306 Sugar Zhang         2017-06-13  324  
fc05a5b2225306 Sugar Zhang         2017-06-13  325  	mask = PDM_CKP_MSK;
fc05a5b2225306 Sugar Zhang         2017-06-13  326  	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
fc05a5b2225306 Sugar Zhang         2017-06-13  327  	case SND_SOC_DAIFMT_NB_NF:
fc05a5b2225306 Sugar Zhang         2017-06-13  328  		val = PDM_CKP_NORMAL;
fc05a5b2225306 Sugar Zhang         2017-06-13  329  		break;
fc05a5b2225306 Sugar Zhang         2017-06-13  330  	case SND_SOC_DAIFMT_IB_NF:
fc05a5b2225306 Sugar Zhang         2017-06-13  331  		val = PDM_CKP_INVERTED;
fc05a5b2225306 Sugar Zhang         2017-06-13  332  		break;
fc05a5b2225306 Sugar Zhang         2017-06-13  333  	default:
fc05a5b2225306 Sugar Zhang         2017-06-13  334  		return -EINVAL;
fc05a5b2225306 Sugar Zhang         2017-06-13  335  	}
fc05a5b2225306 Sugar Zhang         2017-06-13  336  
c85064435fe7a2 Sugar Zhang         2019-04-03  337  	pm_runtime_get_sync(cpu_dai->dev);
fc05a5b2225306 Sugar Zhang         2017-06-13  338  	regmap_update_bits(pdm->regmap, PDM_CLK_CTRL, mask, val);
c85064435fe7a2 Sugar Zhang         2019-04-03  339  	pm_runtime_put(cpu_dai->dev);
fc05a5b2225306 Sugar Zhang         2017-06-13  340  
fc05a5b2225306 Sugar Zhang         2017-06-13  341  	return 0;
fc05a5b2225306 Sugar Zhang         2017-06-13  342  }
fc05a5b2225306 Sugar Zhang         2017-06-13  343  
fc05a5b2225306 Sugar Zhang         2017-06-13 @344  static int rockchip_pdm_trigger(struct snd_pcm_substream *substream, int cmd,
fc05a5b2225306 Sugar Zhang         2017-06-13  345  				struct snd_soc_dai *dai)
fc05a5b2225306 Sugar Zhang         2017-06-13  346  {
fc05a5b2225306 Sugar Zhang         2017-06-13  347  	struct rk_pdm_dev *pdm = to_info(dai);
fc05a5b2225306 Sugar Zhang         2017-06-13  348  	int ret = 0;
fc05a5b2225306 Sugar Zhang         2017-06-13  349  
fc05a5b2225306 Sugar Zhang         2017-06-13  350  	switch (cmd) {
fc05a5b2225306 Sugar Zhang         2017-06-13  351  	case SNDRV_PCM_TRIGGER_START:
fc05a5b2225306 Sugar Zhang         2017-06-13  352  	case SNDRV_PCM_TRIGGER_RESUME:
fc05a5b2225306 Sugar Zhang         2017-06-13  353  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
fc05a5b2225306 Sugar Zhang         2017-06-13  354  		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
fc05a5b2225306 Sugar Zhang         2017-06-13  355  			rockchip_pdm_rxctrl(pdm, 1);
fc05a5b2225306 Sugar Zhang         2017-06-13  356  		break;
fc05a5b2225306 Sugar Zhang         2017-06-13  357  	case SNDRV_PCM_TRIGGER_SUSPEND:
fc05a5b2225306 Sugar Zhang         2017-06-13  358  	case SNDRV_PCM_TRIGGER_STOP:
fc05a5b2225306 Sugar Zhang         2017-06-13  359  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
fc05a5b2225306 Sugar Zhang         2017-06-13  360  		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
fc05a5b2225306 Sugar Zhang         2017-06-13  361  			rockchip_pdm_rxctrl(pdm, 0);
fc05a5b2225306 Sugar Zhang         2017-06-13  362  		break;
fc05a5b2225306 Sugar Zhang         2017-06-13  363  	default:
fc05a5b2225306 Sugar Zhang         2017-06-13  364  		ret = -EINVAL;
fc05a5b2225306 Sugar Zhang         2017-06-13  365  		break;
fc05a5b2225306 Sugar Zhang         2017-06-13  366  	}
fc05a5b2225306 Sugar Zhang         2017-06-13  367  
fc05a5b2225306 Sugar Zhang         2017-06-13  368  	return ret;
fc05a5b2225306 Sugar Zhang         2017-06-13  369  }
fc05a5b2225306 Sugar Zhang         2017-06-13  370  
fc05a5b2225306 Sugar Zhang         2017-06-13 @371  static int rockchip_pdm_dai_probe(struct snd_soc_dai *dai)
fc05a5b2225306 Sugar Zhang         2017-06-13  372  {
fc05a5b2225306 Sugar Zhang         2017-06-13  373  	struct rk_pdm_dev *pdm = to_info(dai);
fc05a5b2225306 Sugar Zhang         2017-06-13  374  
67cc242679b106 Kuninori Morimoto   2023-01-31  375  	snd_soc_dai_dma_data_set_capture(dai, &pdm->capture_dma_data);
fc05a5b2225306 Sugar Zhang         2017-06-13  376  
fc05a5b2225306 Sugar Zhang         2017-06-13  377  	return 0;
fc05a5b2225306 Sugar Zhang         2017-06-13  378  }
fc05a5b2225306 Sugar Zhang         2017-06-13  379  
37f1f58e36152e Kuninori Morimoto   2025-11-28  380  /*
37f1f58e36152e Kuninori Morimoto   2025-11-28  381   * Select below from Sound Card, not Auto
37f1f58e36152e Kuninori Morimoto   2025-11-28  382   *	SND_SOC_DAIFMT_CBx_CFx
37f1f58e36152e Kuninori Morimoto   2025-11-28  383   */
37f1f58e36152e Kuninori Morimoto   2025-11-28 @384  static const u64 rockchip_pdm_selectable_formats =
37f1f58e36152e Kuninori Morimoto   2025-11-28  385  	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
37f1f58e36152e Kuninori Morimoto   2025-11-28  386  	SND_SOC_POSSIBLE_DAIFMT_IB_NF/
37f1f58e36152e Kuninori Morimoto   2025-11-28  387  
0966a2588779d0 Julia Lawall        2017-08-15 @388  static const struct snd_soc_dai_ops rockchip_pdm_dai_ops = {
bd6af1bc86014f Kuninori Morimoto   2023-08-08  389  	.probe				= rockchip_pdm_dai_probe,
fc05a5b2225306 Sugar Zhang         2017-06-13  390  	.set_fmt			= rockchip_pdm_set_fmt,
fc05a5b2225306 Sugar Zhang         2017-06-13  391  	.trigger			= rockchip_pdm_trigger,
fc05a5b2225306 Sugar Zhang         2017-06-13  392  	.hw_params			= rockchip_pdm_hw_params,
37f1f58e36152e Kuninori Morimoto   2025-11-28  393  	.auto_selectable_formats	= &rockchip_pdm_selectable_formats,
37f1f58e36152e Kuninori Morimoto   2025-11-28  394  	.num_auto_selectable_formats	= 1,
fc05a5b2225306 Sugar Zhang         2017-06-13  395  };
fc05a5b2225306 Sugar Zhang         2017-06-13  396  
fc05a5b2225306 Sugar Zhang         2017-06-13  397  #define ROCKCHIP_PDM_RATES SNDRV_PCM_RATE_8000_192000
fc05a5b2225306 Sugar Zhang         2017-06-13  398  #define ROCKCHIP_PDM_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
fc05a5b2225306 Sugar Zhang         2017-06-13  399  			      SNDRV_PCM_FMTBIT_S20_3LE | \
fc05a5b2225306 Sugar Zhang         2017-06-13  400  			      SNDRV_PCM_FMTBIT_S24_LE | \
fc05a5b2225306 Sugar Zhang         2017-06-13  401  			      SNDRV_PCM_FMTBIT_S32_LE)
fc05a5b2225306 Sugar Zhang         2017-06-13  402  
fc05a5b2225306 Sugar Zhang         2017-06-13  403  static struct snd_soc_dai_driver rockchip_pdm_dai = {
fc05a5b2225306 Sugar Zhang         2017-06-13  404  	.capture = {
fc05a5b2225306 Sugar Zhang         2017-06-13  405  		.stream_name = "Capture",
fc05a5b2225306 Sugar Zhang         2017-06-13  406  		.channels_min = 2,
fc05a5b2225306 Sugar Zhang         2017-06-13  407  		.channels_max = 8,
fc05a5b2225306 Sugar Zhang         2017-06-13  408  		.rates = ROCKCHIP_PDM_RATES,
fc05a5b2225306 Sugar Zhang         2017-06-13  409  		.formats = ROCKCHIP_PDM_FORMATS,
fc05a5b2225306 Sugar Zhang         2017-06-13  410  	},
fc05a5b2225306 Sugar Zhang         2017-06-13 @411  	.ops = &rockchip_pdm_dai_ops,
fadaed30231381 Kuninori Morimoto   2021-01-15  412  	.symmetric_rate = 1,
fc05a5b2225306 Sugar Zhang         2017-06-13  413  };
fc05a5b2225306 Sugar Zhang         2017-06-13  414  

:::::: The code at line 388 was first introduced by commit
:::::: 0966a2588779d0d44706f973c1e8ff240be43017 ASoC: rockchip: constify snd_soc_dai_ops structures

:::::: TO: Julia Lawall <Julia.Lawall@lip6.fr>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
