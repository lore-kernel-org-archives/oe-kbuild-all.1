Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D539139B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455578; cv=none; b=Nz+kZhpkovMh7SWBJgkPdKIVgDgMj5cndih9PJsMTOkxKrA96Xjp2h2SQnmCTMb2qyBSabsVOIlRUgVuJvsX5t4GEsNVaexaleHng3h9OE2MLccmksbvWdRexmwIXDpuz+csOFfT48wsRo83PK0j1v/Yw3nnu31AzYU7CURveG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455578; c=relaxed/simple;
	bh=arzStT3lCgc/kj/RRZB1I+SVk7AZsVq0x3525rIOjYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ue4XaPd/vMvpN2+P0bYlS+t6UaONBB6E6upnWl8TFEm6z14CQSx946BPnOxjxlRDOo94ayCl+JL0yUH1c9lfhrDIIH9ZIjksOwkDRF4CQUIX9CN+fyh0h31jYVRbF19Nqi5KZf1LfuLTDAhNy2fbkb2GwNDqGEkJkxkfq9kJ4ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHpyLHyW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHpyLHyW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737455576; x=1768991576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=arzStT3lCgc/kj/RRZB1I+SVk7AZsVq0x3525rIOjYU=;
  b=nHpyLHyWRj10l3Id3GbeU1r+zgwoNDQ1kBE+cY9CbnDgb7HTsbYLmVBQ
   A131pN927nefUJtKzlL+Q8ZBqXT8f+mp1wSRVmPbWZo//mVgdiCJrwqdu
   3kwQ9jPDwvDCiVuGVpJIEvwX35Nm40yIaxIlTjn0atuW1kZvg+xJauoMY
   B7vcqwvy158zRhtddjRg/iNPYiwdjms82y/4Ebe4CKGsLzxLM6JJIkZyL
   fV+Fsy31GTug2gFJuzBerNMp9S3KWj23usaPWcwHQCLfyghJ4PYrhVM7i
   u1jsRVndys2WU4LHdMZDdr9QWCHDCLHfGSsqCyaYu2HDUjCVTWFtEMeoa
   w==;
X-CSE-ConnectionGUID: A5grQnKUTXq17CgovcmMYA==
X-CSE-MsgGUID: EZayafwLQTe+Xh2ANL8l0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37074894"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="37074894"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 02:32:55 -0800
X-CSE-ConnectionGUID: Ar5NMuMfQ7Ky9PY8NEyRDA==
X-CSE-MsgGUID: vL9gCI6uRwGn6wg5tKyGPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111863533"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jan 2025 02:32:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taBYx-000Xvz-12;
	Tue, 21 Jan 2025 10:32:51 +0000
Date: Tue, 21 Jan 2025 18:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 337/337]
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:89:6: warning: no previous
 prototype for 'mt8196_fe_shutdown'
Message-ID: <202501211846.7439Tdmg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   bbce9440852e4893e548b019d4773655399519f7
commit: bbce9440852e4893e548b019d4773655399519f7 [337/337] CHROMIUM: sound: soc/mediatek: Use udelay instead of mt8196_aud_delay
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250121/202501211846.7439Tdmg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211846.7439Tdmg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211846.7439Tdmg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: drivers/misc/mediatek/audio_ipi/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: sound/soc/mediatek/audio_dsp: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/adsp/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/base/power/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/pbm: No such file or directory [-Wmissing-include-dirs]
>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:89:6: warning: no previous prototype for 'mt8196_fe_shutdown' [-Wmissing-prototypes]
      89 | void mt8196_fe_shutdown(struct snd_pcm_substream *substream,
         |      ^~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:113:5: warning: no previous prototype for 'mt8196_fe_trigger' [-Wmissing-prototypes]
     113 | int mt8196_fe_trigger(struct snd_pcm_substream *substream, int cmd,
         |     ^~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:268:5: warning: no previous prototype for 'mt8196_get_memif_pbuf_size' [-Wmissing-prototypes]
     268 | int mt8196_get_memif_pbuf_size(struct snd_pcm_substream *substream)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c: In function 'mt8196_afe_component_probe':
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:4820:26: warning: variable 'card' set but not used [-Wunused-but-set-variable]
    4820 |         struct snd_card *card = NULL;
         |                          ^~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:4818:30: warning: variable 'afe' set but not used [-Wunused-but-set-variable]
    4818 |         struct mtk_base_afe *afe = NULL;
         |                              ^~~
--
>> cc1: warning: drivers/misc/mediatek/audio_ipi/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: sound/soc/mediatek/audio_dsp: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/adsp/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/base/power/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/pbm: No such file or directory [-Wmissing-include-dirs]
>> sound/soc/mediatek/mt8196/mt8196-afe-clk.c:275:5: warning: no previous prototype for 'mt8196_afe_apll_init' [-Wmissing-prototypes]
     275 | int mt8196_afe_apll_init(struct mtk_base_afe *afe)
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> cc1: warning: drivers/misc/mediatek/audio_ipi/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: sound/soc/mediatek/audio_dsp: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/adsp/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/base/power/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/pbm: No such file or directory [-Wmissing-include-dirs]
--
>> cc1: warning: drivers/misc/mediatek/audio_ipi/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: sound/soc/mediatek/audio_dsp: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/adsp/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/base/power/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/pbm: No such file or directory [-Wmissing-include-dirs]
>> sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:4296:5: warning: no previous prototype for 'mt8196_dai_i2s_get_share' [-Wmissing-prototypes]
    4296 | int mt8196_dai_i2s_get_share(struct mtk_base_afe *afe)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:4315:5: warning: no previous prototype for 'mt8196_dai_i2s_set_priv' [-Wmissing-prototypes]
    4315 | int mt8196_dai_i2s_set_priv(struct mtk_base_afe *afe)
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/mt8196_fe_shutdown +89 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c

fb5fd2c643575c Darren Ye    2024-12-21   88  
fb5fd2c643575c Darren Ye    2024-12-21  @89  void mt8196_fe_shutdown(struct snd_pcm_substream *substream,
fb5fd2c643575c Darren Ye    2024-12-21   90  			struct snd_soc_dai *dai)
fb5fd2c643575c Darren Ye    2024-12-21   91  {
fb5fd2c643575c Darren Ye    2024-12-21   92  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
fb5fd2c643575c Darren Ye    2024-12-21   93  	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
fb5fd2c643575c Darren Ye    2024-12-21   94  	struct mt8196_afe_private *afe_priv = afe->platform_priv;
fb5fd2c643575c Darren Ye    2024-12-21   95  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
fb5fd2c643575c Darren Ye    2024-12-21   96  	int memif_num = cpu_dai->id;
fb5fd2c643575c Darren Ye    2024-12-21   97  	struct mtk_base_afe_memif *memif = &afe->memif[memif_num];
fb5fd2c643575c Darren Ye    2024-12-21   98  	int irq_id = memif->irq_usage;
fb5fd2c643575c Darren Ye    2024-12-21   99  
fb5fd2c643575c Darren Ye    2024-12-21  100  	dev_dbg(afe->dev, "%s(), memif_num: %d.\n", __func__, memif_num);
fb5fd2c643575c Darren Ye    2024-12-21  101  
fb5fd2c643575c Darren Ye    2024-12-21  102  	memif->substream = NULL;
fb5fd2c643575c Darren Ye    2024-12-21  103  	afe_priv->irq_cnt[memif_num] = 0;
fb5fd2c643575c Darren Ye    2024-12-21  104  	afe_priv->xrun_assert[memif_num] = 0;
fb5fd2c643575c Darren Ye    2024-12-21  105  
fb5fd2c643575c Darren Ye    2024-12-21  106  	if (!memif->const_irq) {
fb5fd2c643575c Darren Ye    2024-12-21  107  		mtk_dynamic_irq_release(afe, irq_id);
fb5fd2c643575c Darren Ye    2024-12-21  108  		memif->irq_usage = -1;
fb5fd2c643575c Darren Ye    2024-12-21  109  		memif->substream = NULL;
fb5fd2c643575c Darren Ye    2024-12-21  110  	}
fb5fd2c643575c Darren Ye    2024-12-21  111  }
fb5fd2c643575c Darren Ye    2024-12-21  112  
fb5fd2c643575c Darren Ye    2024-12-21 @113  int mt8196_fe_trigger(struct snd_pcm_substream *substream, int cmd,
fb5fd2c643575c Darren Ye    2024-12-21  114  				struct snd_soc_dai *dai)
fb5fd2c643575c Darren Ye    2024-12-21  115  {
fb5fd2c643575c Darren Ye    2024-12-21  116  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
fb5fd2c643575c Darren Ye    2024-12-21  117  	struct snd_pcm_runtime *const runtime = substream->runtime;
fb5fd2c643575c Darren Ye    2024-12-21  118  	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
fb5fd2c643575c Darren Ye    2024-12-21  119  	struct mt8196_afe_private *afe_priv = afe->platform_priv;
fb5fd2c643575c Darren Ye    2024-12-21  120  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
fb5fd2c643575c Darren Ye    2024-12-21  121  	int id = cpu_dai->id;
fb5fd2c643575c Darren Ye    2024-12-21  122  	struct mtk_base_afe_memif *memif = &afe->memif[id];
fb5fd2c643575c Darren Ye    2024-12-21  123  	int irq_id = memif->irq_usage;
fb5fd2c643575c Darren Ye    2024-12-21  124  	struct mtk_base_afe_irq *irqs = &afe->irqs[irq_id];
fb5fd2c643575c Darren Ye    2024-12-21  125  	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
fb5fd2c643575c Darren Ye    2024-12-21  126  	unsigned int counter = runtime->period_size;
fb5fd2c643575c Darren Ye    2024-12-21  127  	unsigned int rate = runtime->rate;
fb5fd2c643575c Darren Ye    2024-12-21  128  	int fs;
fb5fd2c643575c Darren Ye    2024-12-21  129  	int ret = 0;
fb5fd2c643575c Darren Ye    2024-12-21  130  	unsigned int tmp_reg = 0;
fb5fd2c643575c Darren Ye    2024-12-21  131  
fb5fd2c643575c Darren Ye    2024-12-21  132  	dev_info(afe->dev, "%s(), %s cmd %d, irq_id %d\n", __func__,
fb5fd2c643575c Darren Ye    2024-12-21  133  		memif->data->name, cmd, irq_id);
fb5fd2c643575c Darren Ye    2024-12-21  134  
fb5fd2c643575c Darren Ye    2024-12-21  135  	switch (cmd) {
fb5fd2c643575c Darren Ye    2024-12-21  136  	case SNDRV_PCM_TRIGGER_START:
fb5fd2c643575c Darren Ye    2024-12-21  137  	case SNDRV_PCM_TRIGGER_RESUME:
fb5fd2c643575c Darren Ye    2024-12-21  138  		dev_info(afe->dev, "%s(), %s cmd %d, id %d\n", __func__,
fb5fd2c643575c Darren Ye    2024-12-21  139  			memif->data->name, cmd, id);
fb5fd2c643575c Darren Ye    2024-12-21  140  		ret = mtk_memif_set_enable(afe, id);
fb5fd2c643575c Darren Ye    2024-12-21  141  		if (ret) {
fb5fd2c643575c Darren Ye    2024-12-21  142  			dev_err(afe->dev, "%s(), error, id %d, memif enable, ret %d\n",
fb5fd2c643575c Darren Ye    2024-12-21  143  				__func__, id, ret);
fb5fd2c643575c Darren Ye    2024-12-21  144  			return ret;
fb5fd2c643575c Darren Ye    2024-12-21  145  		}
fb5fd2c643575c Darren Ye    2024-12-21  146  
fb5fd2c643575c Darren Ye    2024-12-21  147  		/*
fb5fd2c643575c Darren Ye    2024-12-21  148  		 * for small latency record
fb5fd2c643575c Darren Ye    2024-12-21  149  		 * ul memif need read some data before irq enable
fb5fd2c643575c Darren Ye    2024-12-21  150  		 */
fb5fd2c643575c Darren Ye    2024-12-21  151  		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
fb5fd2c643575c Darren Ye    2024-12-21  152  			if ((runtime->period_size * 1000) / rate <= 10)
bbce9440852e48 Hsin-Te Yuan 2025-01-18  153  				udelay(300);
fb5fd2c643575c Darren Ye    2024-12-21  154  		}
fb5fd2c643575c Darren Ye    2024-12-21  155  
fb5fd2c643575c Darren Ye    2024-12-21  156  		/* set irq counter */
fb5fd2c643575c Darren Ye    2024-12-21  157  		if (afe_priv->irq_cnt[id] > 0)
fb5fd2c643575c Darren Ye    2024-12-21  158  			counter = afe_priv->irq_cnt[id];
fb5fd2c643575c Darren Ye    2024-12-21  159  
fb5fd2c643575c Darren Ye    2024-12-21  160  		mtk_regmap_update_bits(afe->regmap, irq_data->irq_cnt_reg,
fb5fd2c643575c Darren Ye    2024-12-21  161  				   irq_data->irq_cnt_maskbit,
fb5fd2c643575c Darren Ye    2024-12-21  162  				   counter, irq_data->irq_cnt_shift);
fb5fd2c643575c Darren Ye    2024-12-21  163  
fb5fd2c643575c Darren Ye    2024-12-21  164  		/* set irq fs */
fb5fd2c643575c Darren Ye    2024-12-21  165  		fs = afe->irq_fs(substream, runtime->rate);
fb5fd2c643575c Darren Ye    2024-12-21  166  		if (fs < 0)
fb5fd2c643575c Darren Ye    2024-12-21  167  			return -EINVAL;
fb5fd2c643575c Darren Ye    2024-12-21  168  
fb5fd2c643575c Darren Ye    2024-12-21  169  		if (irq_data->irq_fs_reg >= 0)
fb5fd2c643575c Darren Ye    2024-12-21  170  			mtk_regmap_update_bits(afe->regmap, irq_data->irq_fs_reg,
fb5fd2c643575c Darren Ye    2024-12-21  171  				   irq_data->irq_fs_maskbit,
fb5fd2c643575c Darren Ye    2024-12-21  172  				   fs, irq_data->irq_fs_shift);
fb5fd2c643575c Darren Ye    2024-12-21  173  
fb5fd2c643575c Darren Ye    2024-12-21  174  		/* enable interrupt */
fb5fd2c643575c Darren Ye    2024-12-21  175  		mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
fb5fd2c643575c Darren Ye    2024-12-21  176  				       1, 1, irq_data->irq_en_shift);
fb5fd2c643575c Darren Ye    2024-12-21  177  
fb5fd2c643575c Darren Ye    2024-12-21  178  		return 0;
fb5fd2c643575c Darren Ye    2024-12-21  179  	case SNDRV_PCM_TRIGGER_STOP:
fb5fd2c643575c Darren Ye    2024-12-21  180  	case SNDRV_PCM_TRIGGER_SUSPEND:
fb5fd2c643575c Darren Ye    2024-12-21  181  		ret = mtk_memif_set_disable(afe, id);
fb5fd2c643575c Darren Ye    2024-12-21  182  		if (ret) {
fb5fd2c643575c Darren Ye    2024-12-21  183  			dev_info(afe->dev,
fb5fd2c643575c Darren Ye    2024-12-21  184  				"%s(), error, id %d, memif enable, ret %d\n",
fb5fd2c643575c Darren Ye    2024-12-21  185  				__func__, id, ret);
fb5fd2c643575c Darren Ye    2024-12-21  186  		}
fb5fd2c643575c Darren Ye    2024-12-21  187  
fb5fd2c643575c Darren Ye    2024-12-21  188  		/* disable interrupt */
fb5fd2c643575c Darren Ye    2024-12-21  189  		mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
fb5fd2c643575c Darren Ye    2024-12-21  190  			       1, 0, irq_data->irq_en_shift);
fb5fd2c643575c Darren Ye    2024-12-21  191  
fb5fd2c643575c Darren Ye    2024-12-21  192  		/* clear pending IRQ */
fb5fd2c643575c Darren Ye    2024-12-21  193  		regmap_read(afe->regmap, irq_data->irq_clr_reg, &tmp_reg);
fb5fd2c643575c Darren Ye    2024-12-21  194  		regmap_update_bits(afe->regmap, irq_data->irq_clr_reg,
fb5fd2c643575c Darren Ye    2024-12-21  195  			   AFE_IRQ_CLR_CFG_MASK_SFT | AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT,
fb5fd2c643575c Darren Ye    2024-12-21  196  			   tmp_reg^(AFE_IRQ_CLR_CFG_MASK_SFT | AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT));
fb5fd2c643575c Darren Ye    2024-12-21  197  
fb5fd2c643575c Darren Ye    2024-12-21  198  		return ret;
fb5fd2c643575c Darren Ye    2024-12-21  199  	default:
fb5fd2c643575c Darren Ye    2024-12-21  200  		return -EINVAL;
fb5fd2c643575c Darren Ye    2024-12-21  201  	}
fb5fd2c643575c Darren Ye    2024-12-21  202  }
fb5fd2c643575c Darren Ye    2024-12-21  203  
fb5fd2c643575c Darren Ye    2024-12-21  204  static int mt8196_memif_fs(struct snd_pcm_substream *substream,
fb5fd2c643575c Darren Ye    2024-12-21  205  			   unsigned int rate)
fb5fd2c643575c Darren Ye    2024-12-21  206  {
fb5fd2c643575c Darren Ye    2024-12-21  207  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
fb5fd2c643575c Darren Ye    2024-12-21  208  	struct snd_soc_component *component =
fb5fd2c643575c Darren Ye    2024-12-21  209  		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
fb5fd2c643575c Darren Ye    2024-12-21  210  	struct mtk_base_afe *afe = NULL;
fb5fd2c643575c Darren Ye    2024-12-21  211  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
fb5fd2c643575c Darren Ye    2024-12-21  212  	int id = cpu_dai->id;
fb5fd2c643575c Darren Ye    2024-12-21  213  	unsigned int rate_reg = 0;
fb5fd2c643575c Darren Ye    2024-12-21  214  	int cm = 0;
fb5fd2c643575c Darren Ye    2024-12-21  215  
fb5fd2c643575c Darren Ye    2024-12-21  216  	if (!component)
fb5fd2c643575c Darren Ye    2024-12-21  217  		return -EINVAL;
fb5fd2c643575c Darren Ye    2024-12-21  218  
fb5fd2c643575c Darren Ye    2024-12-21  219  	afe = snd_soc_component_get_drvdata(component);
fb5fd2c643575c Darren Ye    2024-12-21  220  
fb5fd2c643575c Darren Ye    2024-12-21  221  	if (!afe)
fb5fd2c643575c Darren Ye    2024-12-21  222  		return -EINVAL;
fb5fd2c643575c Darren Ye    2024-12-21  223  
fb5fd2c643575c Darren Ye    2024-12-21  224  	rate_reg = mt8196_rate_transform(afe->dev, rate, id);
fb5fd2c643575c Darren Ye    2024-12-21  225  
fb5fd2c643575c Darren Ye    2024-12-21  226  	switch (id) {
fb5fd2c643575c Darren Ye    2024-12-21  227  	case MT8196_MEMIF_VUL8:
fb5fd2c643575c Darren Ye    2024-12-21  228  	case MT8196_MEMIF_VUL_CM0:
fb5fd2c643575c Darren Ye    2024-12-21  229  		cm = CM0;
fb5fd2c643575c Darren Ye    2024-12-21  230  		break;
fb5fd2c643575c Darren Ye    2024-12-21  231  	case MT8196_MEMIF_VUL9:
fb5fd2c643575c Darren Ye    2024-12-21  232  	case MT8196_MEMIF_VUL_CM1:
fb5fd2c643575c Darren Ye    2024-12-21  233  		cm = CM1;
fb5fd2c643575c Darren Ye    2024-12-21  234  		break;
fb5fd2c643575c Darren Ye    2024-12-21  235  	case MT8196_MEMIF_VUL10:
fb5fd2c643575c Darren Ye    2024-12-21  236  	case MT8196_MEMIF_VUL_CM2:
fb5fd2c643575c Darren Ye    2024-12-21  237  		cm = CM2;
fb5fd2c643575c Darren Ye    2024-12-21  238  		break;
fb5fd2c643575c Darren Ye    2024-12-21  239  	default:
fb5fd2c643575c Darren Ye    2024-12-21  240  		cm = CM0;
fb5fd2c643575c Darren Ye    2024-12-21  241  		break;
fb5fd2c643575c Darren Ye    2024-12-21  242  	}
fb5fd2c643575c Darren Ye    2024-12-21  243  
fb5fd2c643575c Darren Ye    2024-12-21  244  	mt8196_set_cm_rate(afe, cm, rate_reg);
fb5fd2c643575c Darren Ye    2024-12-21  245  
fb5fd2c643575c Darren Ye    2024-12-21  246  	return rate_reg;
fb5fd2c643575c Darren Ye    2024-12-21  247  }
fb5fd2c643575c Darren Ye    2024-12-21  248  
fb5fd2c643575c Darren Ye    2024-12-21  249  static int mt8196_get_dai_fs(struct mtk_base_afe *afe,
fb5fd2c643575c Darren Ye    2024-12-21  250  			     int dai_id, unsigned int rate)
fb5fd2c643575c Darren Ye    2024-12-21  251  {
fb5fd2c643575c Darren Ye    2024-12-21  252  	return mt8196_rate_transform(afe->dev, rate, dai_id);
fb5fd2c643575c Darren Ye    2024-12-21  253  }
fb5fd2c643575c Darren Ye    2024-12-21  254  
fb5fd2c643575c Darren Ye    2024-12-21  255  static int mt8196_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
fb5fd2c643575c Darren Ye    2024-12-21  256  {
fb5fd2c643575c Darren Ye    2024-12-21  257  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
fb5fd2c643575c Darren Ye    2024-12-21  258  	struct snd_soc_component *component =
fb5fd2c643575c Darren Ye    2024-12-21  259  		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
fb5fd2c643575c Darren Ye    2024-12-21  260  	struct mtk_base_afe *afe = NULL;
fb5fd2c643575c Darren Ye    2024-12-21  261  
fb5fd2c643575c Darren Ye    2024-12-21  262  	if (!component)
fb5fd2c643575c Darren Ye    2024-12-21  263  		return -EINVAL;
fb5fd2c643575c Darren Ye    2024-12-21  264  	afe = snd_soc_component_get_drvdata(component);
fb5fd2c643575c Darren Ye    2024-12-21  265  	return mt8196_general_rate_transform(afe->dev, rate);
fb5fd2c643575c Darren Ye    2024-12-21  266  }
fb5fd2c643575c Darren Ye    2024-12-21  267  
fb5fd2c643575c Darren Ye    2024-12-21 @268  int mt8196_get_memif_pbuf_size(struct snd_pcm_substream *substream)
fb5fd2c643575c Darren Ye    2024-12-21  269  {
fb5fd2c643575c Darren Ye    2024-12-21  270  	struct snd_pcm_runtime *runtime = substream->runtime;
fb5fd2c643575c Darren Ye    2024-12-21  271  
fb5fd2c643575c Darren Ye    2024-12-21  272  	if ((runtime->period_size * 1000) / runtime->rate > 10)
fb5fd2c643575c Darren Ye    2024-12-21  273  		return MT8196_MEMIF_PBUF_SIZE_256_BYTES;
fb5fd2c643575c Darren Ye    2024-12-21  274  	else
fb5fd2c643575c Darren Ye    2024-12-21  275  		return MT8196_MEMIF_PBUF_SIZE_32_BYTES;
fb5fd2c643575c Darren Ye    2024-12-21  276  }
fb5fd2c643575c Darren Ye    2024-12-21  277  

:::::: The code at line 89 was first introduced by commit
:::::: fb5fd2c643575ce7373a230f0f909805c64d1155 CHROMIUM: sound: soc/mediatek: add audio driver base for kernel-v6.6

:::::: TO: Darren Ye <darren.ye@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
