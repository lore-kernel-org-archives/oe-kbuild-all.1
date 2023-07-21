Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0964A3D75
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689941856; x=1721477856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BEnnr6nZuFgqq2GqQQ+OHdNOLzTeW+GrlYuUow4BjVA=;
  b=LqpTvZuWbuslZ6p+tkisAta02acVRzV4IWxLW24N19+GqNuiGxeFstDa
   Xd1goq+0HpXzM5A5trLKvWhFh5p0T7rFIVhs/fe3utcXYYOB1+SGh+Jnv
   OBsvt/09iiz0DDioEnz/xwGukCvujhaS1elksE24PZNodAyo9N2cr6OO1
   9Yfb00wogNxZWRE2TJNLWGb4WgB9c2Wt44jaqq3ZEHS+GCSvDS8tFFYPJ
   6i0gS3ng13l5dN7GbnCdxxRAGOTyh2U1aQFz7txnnMs4zG5OU7OUuw9pW
   R8flUKmmzKwU8Z5qijyPTxV5jxK/v/2y+V0pHoT0TRVHpRgMhqKvPtlPC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="430802097"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="430802097"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 05:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="728072645"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="728072645"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jul 2023 05:17:16 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMp4J-0007H7-1Z;
	Fri, 21 Jul 2023 12:17:12 +0000
Date: Fri, 21 Jul 2023 20:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Ribalda Delgado <ribalda@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-stable-rc:linux-5.4.y 9088/9151]
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1159:17: error: label
 'err_cleanup_components' used but not defined
Message-ID: <202307212026.qT6xvHPU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
head:   7cc6d24483006221e3d5f3a9353738ef5bab2d56
commit: afd4a3e6233602cecf986ff82cb25b5ff52094dc [9088/9151] ASoC: mediatek: mt8173: Fix irq error path
config: arm64-randconfig-r026-20230720 (https://download.01.org/0day-ci/archive/20230721/202307212026.qT6xvHPU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307212026.qT6xvHPU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307212026.qT6xvHPU-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_pcm_dev_probe':
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1159:17: error: label 'err_cleanup_components' used but not defined
    1159 |                 goto err_cleanup_components;
         |                 ^~~~


vim +/err_cleanup_components +1159 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c

  1052	
  1053	static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
  1054	{
  1055		int ret, i;
  1056		int irq_id;
  1057		struct mtk_base_afe *afe;
  1058		struct mt8173_afe_private *afe_priv;
  1059	
  1060		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(33));
  1061		if (ret)
  1062			return ret;
  1063	
  1064		afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
  1065		if (!afe)
  1066			return -ENOMEM;
  1067	
  1068		afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
  1069						  GFP_KERNEL);
  1070		afe_priv = afe->platform_priv;
  1071		if (!afe_priv)
  1072			return -ENOMEM;
  1073	
  1074		afe->dev = &pdev->dev;
  1075	
  1076		irq_id = platform_get_irq(pdev, 0);
  1077		if (irq_id <= 0)
  1078			return irq_id < 0 ? irq_id : -ENXIO;
  1079	
  1080		afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
  1081		if (IS_ERR(afe->base_addr))
  1082			return PTR_ERR(afe->base_addr);
  1083	
  1084		afe->regmap = devm_regmap_init_mmio(&pdev->dev, afe->base_addr,
  1085			&mt8173_afe_regmap_config);
  1086		if (IS_ERR(afe->regmap))
  1087			return PTR_ERR(afe->regmap);
  1088	
  1089		/* initial audio related clock */
  1090		ret = mt8173_afe_init_audio_clk(afe);
  1091		if (ret) {
  1092			dev_err(afe->dev, "mt8173_afe_init_audio_clk fail\n");
  1093			return ret;
  1094		}
  1095	
  1096		/* memif % irq initialize*/
  1097		afe->memif_size = MT8173_AFE_MEMIF_NUM;
  1098		afe->memif = devm_kcalloc(afe->dev, afe->memif_size,
  1099					  sizeof(*afe->memif), GFP_KERNEL);
  1100		if (!afe->memif)
  1101			return -ENOMEM;
  1102	
  1103		afe->irqs_size = MT8173_AFE_IRQ_NUM;
  1104		afe->irqs = devm_kcalloc(afe->dev, afe->irqs_size,
  1105					 sizeof(*afe->irqs), GFP_KERNEL);
  1106		if (!afe->irqs)
  1107			return -ENOMEM;
  1108	
  1109		for (i = 0; i < afe->irqs_size; i++) {
  1110			afe->memif[i].data = &memif_data[i];
  1111			afe->irqs[i].irq_data = &irq_data[i];
  1112			afe->irqs[i].irq_occupyed = true;
  1113			afe->memif[i].irq_usage = i;
  1114			afe->memif[i].const_irq = 1;
  1115		}
  1116	
  1117		afe->mtk_afe_hardware = &mt8173_afe_hardware;
  1118		afe->memif_fs = mt8173_memif_fs;
  1119		afe->irq_fs = mt8173_irq_fs;
  1120	
  1121		platform_set_drvdata(pdev, afe);
  1122	
  1123		pm_runtime_enable(&pdev->dev);
  1124		if (!pm_runtime_enabled(&pdev->dev)) {
  1125			ret = mt8173_afe_runtime_resume(&pdev->dev);
  1126			if (ret)
  1127				goto err_pm_disable;
  1128		}
  1129	
  1130		afe->reg_back_up_list = mt8173_afe_backup_list;
  1131		afe->reg_back_up_list_num = ARRAY_SIZE(mt8173_afe_backup_list);
  1132		afe->runtime_resume = mt8173_afe_runtime_resume;
  1133		afe->runtime_suspend = mt8173_afe_runtime_suspend;
  1134	
  1135		ret = devm_snd_soc_register_component(&pdev->dev,
  1136						 &mtk_afe_pcm_platform,
  1137						 NULL, 0);
  1138		if (ret)
  1139			goto err_pm_disable;
  1140	
  1141		ret = devm_snd_soc_register_component(&pdev->dev,
  1142						 &mt8173_afe_pcm_dai_component,
  1143						 mt8173_afe_pcm_dais,
  1144						 ARRAY_SIZE(mt8173_afe_pcm_dais));
  1145		if (ret)
  1146			goto err_pm_disable;
  1147	
  1148		ret = devm_snd_soc_register_component(&pdev->dev,
  1149						 &mt8173_afe_hdmi_dai_component,
  1150						 mt8173_afe_hdmi_dais,
  1151						 ARRAY_SIZE(mt8173_afe_hdmi_dais));
  1152		if (ret)
  1153			goto err_pm_disable;
  1154	
  1155		ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
  1156				       0, "Afe_ISR_Handle", (void *)afe);
  1157		if (ret) {
  1158			dev_err(afe->dev, "could not request_irq\n");
> 1159			goto err_cleanup_components;
  1160		}
  1161	
  1162		dev_info(&pdev->dev, "MT8173 AFE driver initialized.\n");
  1163		return 0;
  1164	
  1165	err_pm_disable:
  1166		pm_runtime_disable(&pdev->dev);
  1167		return ret;
  1168	}
  1169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
