Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CC718FC7B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737212185; cv=none; b=eX6+XtIZjcD6o8+CozxHI1TKSBOBQykxTqaboSpVCFSkZZWRLzTmYF8kZeqzsJ1okP7uv7B7fwVjmzDWj2uo8fgF9KjFQox/A7HwL3J9968tEaQJf0ToWTNHBtaXwtPd3sPA5EoAQTHZMe0zCvQGt/Vx/M4JnwyoH8PJiKyS7q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737212185; c=relaxed/simple;
	bh=Ed/vEELPGGcUZik+sGArS4IvX1rtjQtkcxu7KeY3sD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVPLLLwLfpnKMLFRj3YXTopXK9fRMkAREgqxneQPh8g/G20Xv5xVR0cePiV2FCqWvk+xAvMt1HcYl7jSp5NohI9RZ4d77prbJL5+/2UfMgoDHzfH/Xt/ykikJEmgkw/ek8T0PDAE4DjDL5V/aoLVz382nFyc89nHw+xV6c/9UCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDgTMpql; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDgTMpql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737212184; x=1768748184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ed/vEELPGGcUZik+sGArS4IvX1rtjQtkcxu7KeY3sD4=;
  b=fDgTMpqlXBTe5SIkmbLruMUyIwEnXc19GbOAqc1ZS9+4cKaT8uBP4Bc2
   KHrGDbaebslPpKQReDxMT6HvBnEcmCQyzZE4WzOEro0mHYk9BILkRufxF
   EZbheykBgR9c6ogvnDMqiVJQCGctu2obcfLb5VqcYovcx6XnP346wT5Lb
   xgigqft+1T9MiR1XDtXo+9V/i3YRBwNZVs1JErpslJ4SVNZO5fnAOMNGS
   gEx1OXfS7yCVQPcbUcX70xsDQc/m9J7sj52gLtMv5QFI43CE7Mwi8E+u3
   zcwehz1V7ia6RNleJYsyVSZvuyS0SBTt725/hOLYEBki6TjAFcn/GJt5V
   g==;
X-CSE-ConnectionGUID: RHZSDLxfTvCJqyKP7x+fcg==
X-CSE-MsgGUID: iqqqXn4BRxmzZRTyEUiiDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="40441338"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="40441338"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 06:56:22 -0800
X-CSE-ConnectionGUID: RZq+PfOJRzK/Urn15lp8GA==
X-CSE-MsgGUID: 7wISWs1nQ/yHjGbwv4EB7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="105872987"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jan 2025 06:56:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZAFG-000UX4-1c;
	Sat, 18 Jan 2025 14:56:18 +0000
Date: Sat, 18 Jan 2025 22:55:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 324/324]
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:55:6: warning: no previous
 prototype for function 'mt8196_aud_delay'
Message-ID: <202501182211.qV4Ttefm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c5c75fa9e727eeea4f1aac71a5838a1bdc76d0dd
commit: fb5fd2c643575ce7373a230f0f909805c64d1155 [324/324] CHROMIUM: sound: soc/mediatek: add audio driver base for kernel-v6.6
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250118/202501182211.qV4Ttefm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501182211.qV4Ttefm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501182211.qV4Ttefm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:55:6: warning: no previous prototype for function 'mt8196_aud_delay' [-Wmissing-prototypes]
      55 | void mt8196_aud_delay(unsigned long usecs)
         |      ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:55:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      55 | void mt8196_aud_delay(unsigned long usecs)
         | ^
         | static 
>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:108:6: warning: no previous prototype for function 'mt8196_fe_shutdown' [-Wmissing-prototypes]
     108 | void mt8196_fe_shutdown(struct snd_pcm_substream *substream,
         |      ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     108 | void mt8196_fe_shutdown(struct snd_pcm_substream *substream,
         | ^
         | static 
>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:132:5: warning: no previous prototype for function 'mt8196_fe_trigger' [-Wmissing-prototypes]
     132 | int mt8196_fe_trigger(struct snd_pcm_substream *substream, int cmd,
         |     ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:132:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     132 | int mt8196_fe_trigger(struct snd_pcm_substream *substream, int cmd,
         | ^
         | static 
>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:287:5: warning: no previous prototype for function 'mt8196_get_memif_pbuf_size' [-Wmissing-prototypes]
     287 | int mt8196_get_memif_pbuf_size(struct snd_pcm_substream *substream)
         |     ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:287:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     287 | int mt8196_get_memif_pbuf_size(struct snd_pcm_substream *substream)
         | ^
         | static 
>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:4837:23: warning: variable 'afe' set but not used [-Wunused-but-set-variable]
    4837 |         struct mtk_base_afe *afe = NULL;
         |                              ^
>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:4839:19: warning: variable 'card' set but not used [-Wunused-but-set-variable]
    4839 |         struct snd_card *card = NULL;
         |                          ^
   6 warnings generated.
--
>> sound/soc/mediatek/mt8196/mt8196-afe-clk.c:275:5: warning: no previous prototype for function 'mt8196_afe_apll_init' [-Wmissing-prototypes]
     275 | int mt8196_afe_apll_init(struct mtk_base_afe *afe)
         |     ^
   sound/soc/mediatek/mt8196/mt8196-afe-clk.c:275:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     275 | int mt8196_afe_apll_init(struct mtk_base_afe *afe)
         | ^
         | static 
   1 warning generated.
--
>> sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:4296:5: warning: no previous prototype for function 'mt8196_dai_i2s_get_share' [-Wmissing-prototypes]
    4296 | int mt8196_dai_i2s_get_share(struct mtk_base_afe *afe)
         |     ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:4296:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4296 | int mt8196_dai_i2s_get_share(struct mtk_base_afe *afe)
         | ^
         | static 
>> sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:4315:5: warning: no previous prototype for function 'mt8196_dai_i2s_set_priv' [-Wmissing-prototypes]
    4315 | int mt8196_dai_i2s_set_priv(struct mtk_base_afe *afe)
         |     ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:4315:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4315 | int mt8196_dai_i2s_set_priv(struct mtk_base_afe *afe)
         | ^
         | static 
   2 warnings generated.


vim +/mt8196_aud_delay +55 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c

    54	
  > 55	void mt8196_aud_delay(unsigned long usecs)
    56	{
    57		unsigned long cycles = 0;
    58		cycles_t start = get_cycles();
    59	
    60		cycles = USECS_TO_CYCLES(usecs);
    61	
    62		while ((get_cycles() - start) < cycles)
    63			cpu_relax();
    64	}
    65	
    66	static int mt8196_fe_startup(struct snd_pcm_substream *substream,
    67				     struct snd_soc_dai *dai)
    68	{
    69		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
    70		struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
    71		struct snd_pcm_runtime *runtime = substream->runtime;
    72		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
    73		int memif_num = cpu_dai->id;
    74		struct mtk_base_afe_memif *memif = &afe->memif[memif_num];
    75		const struct snd_pcm_hardware *mtk_afe_hardware = afe->mtk_afe_hardware;
    76		int ret;
    77	
    78		dev_dbg(afe->dev, "%s(), memif_num: %d.\n", __func__, memif_num);
    79	
    80		memif->substream = substream;
    81	
    82		snd_pcm_hw_constraint_step(substream->runtime, 0,
    83						SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 16);
    84	
    85		snd_soc_set_runtime_hwparams(substream, mtk_afe_hardware);
    86	
    87		ret = snd_pcm_hw_constraint_integer(runtime,
    88							SNDRV_PCM_HW_PARAM_PERIODS);
    89		if (ret < 0)
    90			dev_info(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
    91	
    92		/* dynamic allocate irq to memif */
    93		if (memif->irq_usage < 0) {
    94			int irq_id = mtk_dynamic_irq_acquire(afe);
    95	
    96			if (irq_id != afe->irqs_size) {
    97				/* link */
    98				memif->irq_usage = irq_id;
    99			} else {
   100				dev_info(afe->dev, "%s() error: no more asys irq\n",
   101					__func__);
   102				ret = -EBUSY;
   103			}
   104		}
   105		return ret;
   106	}
   107	
 > 108	void mt8196_fe_shutdown(struct snd_pcm_substream *substream,
   109				struct snd_soc_dai *dai)
   110	{
   111		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
   112		struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
   113		struct mt8196_afe_private *afe_priv = afe->platform_priv;
   114		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
   115		int memif_num = cpu_dai->id;
   116		struct mtk_base_afe_memif *memif = &afe->memif[memif_num];
   117		int irq_id = memif->irq_usage;
   118	
   119		dev_dbg(afe->dev, "%s(), memif_num: %d.\n", __func__, memif_num);
   120	
   121		memif->substream = NULL;
   122		afe_priv->irq_cnt[memif_num] = 0;
   123		afe_priv->xrun_assert[memif_num] = 0;
   124	
   125		if (!memif->const_irq) {
   126			mtk_dynamic_irq_release(afe, irq_id);
   127			memif->irq_usage = -1;
   128			memif->substream = NULL;
   129		}
   130	}
   131	
 > 132	int mt8196_fe_trigger(struct snd_pcm_substream *substream, int cmd,
   133					struct snd_soc_dai *dai)
   134	{
   135		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
   136		struct snd_pcm_runtime *const runtime = substream->runtime;
   137		struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
   138		struct mt8196_afe_private *afe_priv = afe->platform_priv;
   139		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
   140		int id = cpu_dai->id;
   141		struct mtk_base_afe_memif *memif = &afe->memif[id];
   142		int irq_id = memif->irq_usage;
   143		struct mtk_base_afe_irq *irqs = &afe->irqs[irq_id];
   144		const struct mtk_base_irq_data *irq_data = irqs->irq_data;
   145		unsigned int counter = runtime->period_size;
   146		unsigned int rate = runtime->rate;
   147		int fs;
   148		int ret = 0;
   149		unsigned int tmp_reg = 0;
   150	
   151		dev_info(afe->dev, "%s(), %s cmd %d, irq_id %d\n", __func__,
   152			memif->data->name, cmd, irq_id);
   153	
   154		switch (cmd) {
   155		case SNDRV_PCM_TRIGGER_START:
   156		case SNDRV_PCM_TRIGGER_RESUME:
   157			dev_info(afe->dev, "%s(), %s cmd %d, id %d\n", __func__,
   158				memif->data->name, cmd, id);
   159			ret = mtk_memif_set_enable(afe, id);
   160			if (ret) {
   161				dev_err(afe->dev, "%s(), error, id %d, memif enable, ret %d\n",
   162					__func__, id, ret);
   163				return ret;
   164			}
   165	
   166			/*
   167			 * for small latency record
   168			 * ul memif need read some data before irq enable
   169			 */
   170			if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
   171				if ((runtime->period_size * 1000) / rate <= 10)
   172					mt8196_aud_delay(300);
   173			}
   174	
   175			/* set irq counter */
   176			if (afe_priv->irq_cnt[id] > 0)
   177				counter = afe_priv->irq_cnt[id];
   178	
   179			mtk_regmap_update_bits(afe->regmap, irq_data->irq_cnt_reg,
   180					   irq_data->irq_cnt_maskbit,
   181					   counter, irq_data->irq_cnt_shift);
   182	
   183			/* set irq fs */
   184			fs = afe->irq_fs(substream, runtime->rate);
   185			if (fs < 0)
   186				return -EINVAL;
   187	
   188			if (irq_data->irq_fs_reg >= 0)
   189				mtk_regmap_update_bits(afe->regmap, irq_data->irq_fs_reg,
   190					   irq_data->irq_fs_maskbit,
   191					   fs, irq_data->irq_fs_shift);
   192	
   193			/* enable interrupt */
   194			mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
   195					       1, 1, irq_data->irq_en_shift);
   196	
   197			return 0;
   198		case SNDRV_PCM_TRIGGER_STOP:
   199		case SNDRV_PCM_TRIGGER_SUSPEND:
   200			ret = mtk_memif_set_disable(afe, id);
   201			if (ret) {
   202				dev_info(afe->dev,
   203					"%s(), error, id %d, memif enable, ret %d\n",
   204					__func__, id, ret);
   205			}
   206	
   207			/* disable interrupt */
   208			mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
   209				       1, 0, irq_data->irq_en_shift);
   210	
   211			/* clear pending IRQ */
   212			regmap_read(afe->regmap, irq_data->irq_clr_reg, &tmp_reg);
   213			regmap_update_bits(afe->regmap, irq_data->irq_clr_reg,
   214				   AFE_IRQ_CLR_CFG_MASK_SFT | AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT,
   215				   tmp_reg^(AFE_IRQ_CLR_CFG_MASK_SFT | AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT));
   216	
   217			return ret;
   218		default:
   219			return -EINVAL;
   220		}
   221	}
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
