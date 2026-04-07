Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B4B375F87
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534195; cv=none; b=CgpMa7yG/KEsVuZQUIDsAA5g5nOyzUc2y2WPwN2uZgUWz+vLUfgQUAqGY2ufc2jUsN1t1zjPReZpy17/EHi/PEye8vYnby5WDyQvPJ1KXdqy6Rv/woUgKqlQMigUhtFlcwwqIW0xnHWhkYcugD5Zl2PbyA6Qkic9gW3sUJBoU+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534195; c=relaxed/simple;
	bh=zSk7vzihA2wGzyLQHa34/U5NBI8o1en8/cgR7BoLNDg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QR48Az30C5Fub/ddvxARdxNVfKuNkMjpdk2uFbWRUgHiujei0Sn1nrVfKG++iwTkBdgsJCBEpVKb6z3DzazaVMLMIzTh3CnOaVJvmwntbZavvTYhPS4l86rdzuNyHk452reaij64GbVVHWFjwzVQQ4CBjJqKaxzB9Wf00qEAUV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FK9sHjMb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FK9sHjMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534193; x=1807070193;
  h=date:from:to:cc:subject:message-id;
  bh=zSk7vzihA2wGzyLQHa34/U5NBI8o1en8/cgR7BoLNDg=;
  b=FK9sHjMb+k5N94Nrv+TipgaRkl7Ob6ctJcOb+14LlK+QOcTOSaHion50
   Ou2CBHkwkVOzj21k5catXG9VArQabG7YsD1hfvcje78kd7Uv7rdaJdjUW
   AKXiftrUn6NsJ3OE4GUOFqpBvYGusaXO7wYJoglYFHLqLc9NoAJ0/QQPN
   gKeS0e+lCUG5J7+MJ93yRGhYL46OZ9LDyr/KsbxcNkN9hitdY7JnNGJWD
   eF3cKDDRKvpYPKiSeCY0FsDta4NVXNuB1KNsvpNqRB3dOuhLGi7PC/YVV
   Y8LO0lMfSdS6AEoY9uJwbc7bgRACzGB43KQkshiIcKbBBdWAyzs+E+Nfb
   A==;
X-CSE-ConnectionGUID: apTKjFPbTZGCmH9BxnkGUA==
X-CSE-MsgGUID: FTiU7Gx2SVq6pW5AsBb+7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87563839"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87563839"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:56:31 -0700
X-CSE-ConnectionGUID: RhyNaLANQe2fPBy/15YL/w==
X-CSE-MsgGUID: pjOZnVWTR6qfuwyq0/PI0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232926708"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Apr 2026 20:56:29 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xY8-0000000004p-0YQ7;
	Tue, 07 Apr 2026 03:56:24 +0000
Date: Tue, 07 Apr 2026 11:55:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 105/106]
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1150:15: error: implicit
 declaration of function 'snd_soc_component_initialize'; did you mean
 'snd_soc_component_init'?
Message-ID: <202604042043.cNe9pmOE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: 875ce5ef9fec2ed41005eac865ef96e1da800d57 [105/106] ASoC: soc-component: remove compatible definition
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260404/202604042043.cNe9pmOE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604042043.cNe9pmOE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604042043.cNe9pmOE-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_i2s_startup':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:297:36: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
     297 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_card_get_drvdata
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:297:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_i2s_shutdown':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:310:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     310 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_i2s_prepare':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:325:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     325 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_hdmi_startup':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:346:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     346 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_hdmi_shutdown':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:360:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     360 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_hdmi_prepare':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:374:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     374 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_hdmi_trigger':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:436:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     436 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/of_reserved_mem.h:5,
                    from sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:16:
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:438:64: error: invalid use of undefined type 'struct snd_soc_dai'
     438 |         dev_info(afe->dev, "%s cmd=%d %s\n", __func__, cmd, dai->name);
         |                                                                ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:438:9: note: in expansion of macro 'dev_info'
     438 |         dev_info(afe->dev, "%s cmd=%d %s\n", __func__, cmd, dai->name);
         |         ^~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_memif_fs':
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:486:36: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Wimplicit-function-declaration]
     486 |         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_component_set_jack
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:486:36: error: initialization of 'struct mtk_base_afe *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:487:82: error: invalid use of undefined type 'struct snd_soc_dai'
     487 |         struct mtk_base_afe_memif *memif = &afe->memif[snd_soc_rtd_to_cpu(rtd, 0)->id];
         |                                                                                  ^~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_pcm_dev_probe':
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1150:15: error: implicit declaration of function 'snd_soc_component_initialize'; did you mean 'snd_soc_component_init'? [-Wimplicit-function-declaration]
    1150 |         ret = snd_soc_component_initialize(comp_pcm,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               snd_soc_component_init
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1160:15: error: implicit declaration of function 'snd_soc_add_component'; did you mean 'snd_soc_dai_to_component'? [-Wimplicit-function-declaration]
    1160 |         ret = snd_soc_add_component(comp_pcm,
         |               ^~~~~~~~~~~~~~~~~~~~~
         |               snd_soc_dai_to_component


vim +1150 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c

ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1049  
0d1d7a664288f9 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1050  static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1051  {
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1052  	int ret, i;
d6e2c4ffdf67de sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Arvind Yadav               2017-11-29  1053  	int irq_id;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1054  	struct mtk_base_afe *afe;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1055  	struct mt8173_afe_private *afe_priv;
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1056  	struct snd_soc_component *comp_pcm, *comp_hdmi;
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1057  	struct device *dev = &pdev->dev;
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1058  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1059  	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(33));
fcde5a7eca1a28 sound/soc/mediatek/mtk-afe-pcm.c           PC Liao                    2016-01-12  1060  	if (ret)
fcde5a7eca1a28 sound/soc/mediatek/mtk-afe-pcm.c           PC Liao                    2016-01-12  1061  		return ret;
fcde5a7eca1a28 sound/soc/mediatek/mtk-afe-pcm.c           PC Liao                    2016-01-12  1062  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1063  	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1064  	if (!afe)
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1065  		return -ENOMEM;
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1066  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1067  	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv), GFP_KERNEL);
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1068  	afe_priv = afe->platform_priv;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1069  	if (!afe_priv)
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1070  		return -ENOMEM;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1071  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1072  	afe->dev = dev;
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1073  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1074  	ret = of_reserved_mem_device_init(dev);
ec4a10ca4a68ec sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1075  	if (ret) {
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1076  		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
ec4a10ca4a68ec sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1077  		afe->preallocate_buffers = true;
ec4a10ca4a68ec sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1078  	}
ec4a10ca4a68ec sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1079  
f9c058d14f4fe2 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda Delgado    2023-06-12  1080  	irq_id = platform_get_irq(pdev, 0);
f9c058d14f4fe2 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda Delgado    2023-06-12  1081  	if (irq_id <= 0)
f9c058d14f4fe2 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda Delgado    2023-06-12  1082  		return irq_id < 0 ? irq_id : -ENXIO;
f9c058d14f4fe2 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda Delgado    2023-06-12  1083  
fceef72b68d635 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c YueHaibing                 2019-07-27  1084  	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1085  	if (IS_ERR(afe->base_addr))
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1086  		return PTR_ERR(afe->base_addr);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1087  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1088  	afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
0d1d7a664288f9 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1089  					    &mt8173_afe_regmap_config);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1090  	if (IS_ERR(afe->regmap))
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1091  		return PTR_ERR(afe->regmap);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1092  
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1093  	/* initial audio related clock */
0d1d7a664288f9 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1094  	ret = mt8173_afe_init_audio_clk(afe);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1095  	if (ret) {
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1096  		dev_err(dev, "mt8173_afe_init_audio_clk fail\n");
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1097  		return ret;
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1098  	}
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1099  
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1100  	/* memif % irq initialize*/
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1101  	afe->memif_size = MT8173_AFE_MEMIF_NUM;
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1102  	afe->memif = devm_kcalloc(dev, afe->memif_size,
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1103  				  sizeof(*afe->memif), GFP_KERNEL);
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1104  	if (!afe->memif)
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1105  		return -ENOMEM;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1106  
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1107  	afe->irqs_size = MT8173_AFE_IRQ_NUM;
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1108  	afe->irqs = devm_kcalloc(dev, afe->irqs_size,
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1109  				 sizeof(*afe->irqs), GFP_KERNEL);
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1110  	if (!afe->irqs)
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1111  		return -ENOMEM;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1112  
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1113  	for (i = 0; i < afe->irqs_size; i++) {
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1114  		afe->memif[i].data = &memif_data[i];
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1115  		afe->irqs[i].irq_data = &irq_data[i];
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1116  		afe->irqs[i].irq_occupyed = true;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1117  		afe->memif[i].irq_usage = i;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1118  		afe->memif[i].const_irq = 1;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1119  	}
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1120  
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1121  	afe->mtk_afe_hardware = &mt8173_afe_hardware;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1122  	afe->memif_fs = mt8173_memif_fs;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1123  	afe->irq_fs = mt8173_irq_fs;
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1124  
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1125  	platform_set_drvdata(pdev, afe);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1126  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1127  	pm_runtime_enable(dev);
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1128  	if (!pm_runtime_enabled(dev)) {
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1129  		ret = mt8173_afe_runtime_resume(dev);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1130  		if (ret)
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1131  			goto err_pm_disable;
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1132  	}
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1133  
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1134  	afe->reg_back_up_list = mt8173_afe_backup_list;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1135  	afe->reg_back_up_list_num = ARRAY_SIZE(mt8173_afe_backup_list);
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1136  	afe->runtime_resume = mt8173_afe_runtime_resume;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1137  	afe->runtime_suspend = mt8173_afe_runtime_suspend;
6b1e19d91d0bf3 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1138  
61c94a63000ef8 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Kuninori Morimoto          2026-03-27  1139  	ret = devm_snd_soc_component_register(dev, &mtk_afe_pcm_platform,
f1b5bf07365d4d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Kuninori Morimoto          2018-01-29  1140  					      NULL, 0);
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1141  	if (ret)
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1142  		goto err_pm_disable;
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1143  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1144  	comp_pcm = devm_kzalloc(dev, sizeof(*comp_pcm), GFP_KERNEL);
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1145  	if (!comp_pcm) {
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1146  		ret = -ENOMEM;
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1147  		goto err_pm_disable;
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1148  	}
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1149  
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11 @1150  	ret = snd_soc_component_initialize(comp_pcm,
0d1d7a664288f9 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1151  					   &mt8173_afe_pcm_dai_component,
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1152  					   dev);
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1153  	if (ret)
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1154  		goto err_pm_disable;
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1155  
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1156  #ifdef CONFIG_DEBUG_FS
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1157  	comp_pcm->debugfs_prefix = "pcm";
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1158  #endif
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1159  
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11 @1160  	ret = snd_soc_add_component(comp_pcm,
0d1d7a664288f9 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1161  				    mt8173_afe_pcm_dais,
0d1d7a664288f9 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1162  				    ARRAY_SIZE(mt8173_afe_pcm_dais));
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1163  	if (ret)
f1b5bf07365d4d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Kuninori Morimoto          2018-01-29  1164  		goto err_pm_disable;
ee0bcaff109f36 sound/soc/mediatek/mtk-afe-pcm.c           Koro Chen                  2015-06-15  1165  
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1166  	comp_hdmi = devm_kzalloc(dev, sizeof(*comp_hdmi), GFP_KERNEL);
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1167  	if (!comp_hdmi) {
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1168  		ret = -ENOMEM;
a46d37012a5be1 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda Delgado    2023-06-12  1169  		goto err_cleanup_components;
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1170  	}
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1171  
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1172  	ret = snd_soc_component_initialize(comp_hdmi,
0d1d7a664288f9 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Garlic Tseng               2016-06-17  1173  					   &mt8173_afe_hdmi_dai_component,
b2c090c9f6aa9d sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Chen-Yu Tsai               2025-06-12  1174  					   dev);
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1175  	if (ret)
a46d37012a5be1 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c Ricardo Ribalda Delgado    2023-06-12  1176  		goto err_cleanup_components;
8c32984bc7da29 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c AngeloGioacchino Del Regno 2021-11-11  1177  

:::::: The code at line 1150 was first introduced by commit
:::::: 8c32984bc7da29828260ac514d5d4967f7e8f62d ASoC: mediatek: mt8173: Fix debugfs registration for components

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
