Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DBC17F7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 07:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692170579; x=1723706579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=No9iNtzvtvxsFitjPMpOUpXYFmc+ntwmLspJCceCnhM=;
  b=eM0bI2kphWoqUr5/uMUesBuP65OfQ5QpaUfMY9T6t1+O1vQW5LHI9mYi
   TogKWH4eMH4jHd9wuosqw0sDiSmXOYSCXMVz2k/o9bI7mLXayx1h7Xmm6
   XfYAgdK8ofzkj3mSGt6I9wYf5wFVtMB5S91yxGhvd1/UIPiluGn8E+J9e
   dFzTVIqzqUmcgo0ODT7RnxYxeq4Ak+AC3xANvUTDs5uF1lbfYkjFTHTsY
   ANqXot0mWNGmNuex6EwYeRYDmBEcHrFKs4NOwTKlWBlJ6UpgQ03IM3yVU
   Z3C/qzV3DYKtwMU7zYgsN3sT8vnIJC/auHU7IghuYQj0vrPbEaBG8gb3s
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="438809000"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="438809000"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 00:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="857704888"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="857704888"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Aug 2023 00:22:57 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWArh-00005j-2X;
	Wed, 16 Aug 2023 07:22:51 +0000
Date: Wed, 16 Aug 2023 15:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 76/86]
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1172:15: error: implicit
 declaration of function 'snd_soc_component_initialize'; did you mean
 'snd_soc_component_is_active'?
Message-ID: <202308161539.oC1jD88a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   3c9b1cd23f26ebece806d92b8b99b79ed108cbc1
commit: fafce6a2035c1a9b29a47b6a0d86981f8dab086b [76/86] ASoC: mediatek: mt8173: Fix debugfs registration for components
config: arm64-randconfig-r022-20230816 (https://download.01.org/0day-ci/archive/20230816/202308161539.oC1jD88a-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161539.oC1jD88a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161539.oC1jD88a-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_pcm_dev_probe':
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1172:15: error: implicit declaration of function 'snd_soc_component_initialize'; did you mean 'snd_soc_component_is_active'? [-Werror=implicit-function-declaration]
    1172 |         ret = snd_soc_component_initialize(comp_pcm,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               snd_soc_component_is_active
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1182:37: error: passing argument 1 of 'snd_soc_add_component' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1182 |         ret = snd_soc_add_component(comp_pcm,
         |                                     ^~~~~~~~
         |                                     |
         |                                     struct snd_soc_component *
   In file included from sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:18:
   include/sound/soc.h:444:42: note: expected 'struct device *' but argument is of type 'struct snd_soc_component *'
     444 | int snd_soc_add_component(struct device *dev,
         |                           ~~~~~~~~~~~~~~~^~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1183:37: error: passing argument 2 of 'snd_soc_add_component' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1183 |                                     mt8173_afe_pcm_dais,
         |                                     ^~~~~~~~~~~~~~~~~~~
         |                                     |
         |                                     struct snd_soc_dai_driver *
   include/sound/soc.h:445:43: note: expected 'struct snd_soc_component *' but argument is of type 'struct snd_soc_dai_driver *'
     445 |                 struct snd_soc_component *component,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   In file included from include/linux/delay.h:22,
                    from sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:12:
>> include/linux/kernel.h:72:25: warning: passing argument 3 of 'snd_soc_add_component' makes pointer from integer without a cast [-Wint-conversion]
      72 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         |
         |                         long unsigned int
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1184:37: note: in expansion of macro 'ARRAY_SIZE'
    1184 |                                     ARRAY_SIZE(mt8173_afe_pcm_dais));
         |                                     ^~~~~~~~~~
   include/sound/soc.h:446:56: note: expected 'const struct snd_soc_component_driver *' but argument is of type 'long unsigned int'
     446 |                 const struct snd_soc_component_driver *component_driver,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1182:15: error: too few arguments to function 'snd_soc_add_component'
    1182 |         ret = snd_soc_add_component(comp_pcm,
         |               ^~~~~~~~~~~~~~~~~~~~~
   include/sound/soc.h:444:5: note: declared here
     444 | int snd_soc_add_component(struct device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1204:37: error: passing argument 1 of 'snd_soc_add_component' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1204 |         ret = snd_soc_add_component(comp_hdmi,
         |                                     ^~~~~~~~~
         |                                     |
         |                                     struct snd_soc_component *
   include/sound/soc.h:444:42: note: expected 'struct device *' but argument is of type 'struct snd_soc_component *'
     444 | int snd_soc_add_component(struct device *dev,
         |                           ~~~~~~~~~~~~~~~^~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1205:37: error: passing argument 2 of 'snd_soc_add_component' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1205 |                                     mt8173_afe_hdmi_dais,
         |                                     ^~~~~~~~~~~~~~~~~~~~
         |                                     |
         |                                     struct snd_soc_dai_driver *
   include/sound/soc.h:445:43: note: expected 'struct snd_soc_component *' but argument is of type 'struct snd_soc_dai_driver *'
     445 |                 struct snd_soc_component *component,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>> include/linux/kernel.h:72:25: warning: passing argument 3 of 'snd_soc_add_component' makes pointer from integer without a cast [-Wint-conversion]
      72 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         |
         |                         long unsigned int
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1206:37: note: in expansion of macro 'ARRAY_SIZE'
    1206 |                                     ARRAY_SIZE(mt8173_afe_hdmi_dais));
         |                                     ^~~~~~~~~~
   include/sound/soc.h:446:56: note: expected 'const struct snd_soc_component_driver *' but argument is of type 'long unsigned int'
     446 |                 const struct snd_soc_component_driver *component_driver,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1204:15: error: too few arguments to function 'snd_soc_add_component'
    1204 |         ret = snd_soc_add_component(comp_hdmi,
         |               ^~~~~~~~~~~~~~~~~~~~~
   include/sound/soc.h:444:5: note: declared here
     444 | int snd_soc_add_component(struct device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1172 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c

  1068	
  1069	static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
  1070	{
  1071		int ret, i;
  1072		int irq_id;
  1073		struct mtk_base_afe *afe;
  1074		struct mt8173_afe_private *afe_priv;
  1075		struct snd_soc_component *comp_pcm, *comp_hdmi;
  1076	
  1077		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(33));
  1078		if (ret)
  1079			return ret;
  1080	
  1081		afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
  1082		if (!afe)
  1083			return -ENOMEM;
  1084	
  1085		afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
  1086						  GFP_KERNEL);
  1087		afe_priv = afe->platform_priv;
  1088		if (!afe_priv)
  1089			return -ENOMEM;
  1090	
  1091		afe->dev = &pdev->dev;
  1092	
  1093		irq_id = platform_get_irq(pdev, 0);
  1094		if (irq_id <= 0) {
  1095			dev_err(afe->dev, "np %s no irq\n", afe->dev->of_node->name);
  1096			return irq_id < 0 ? irq_id : -ENXIO;
  1097		}
  1098		ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
  1099				       0, "Afe_ISR_Handle", (void *)afe);
  1100		if (ret) {
  1101			dev_err(afe->dev, "could not request_irq\n");
  1102			return ret;
  1103		}
  1104	
  1105		afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
  1106		if (IS_ERR(afe->base_addr))
  1107			return PTR_ERR(afe->base_addr);
  1108	
  1109		afe->regmap = devm_regmap_init_mmio(&pdev->dev, afe->base_addr,
  1110			&mt8173_afe_regmap_config);
  1111		if (IS_ERR(afe->regmap))
  1112			return PTR_ERR(afe->regmap);
  1113	
  1114		/* initial audio related clock */
  1115		ret = mt8173_afe_init_audio_clk(afe);
  1116		if (ret) {
  1117			dev_err(afe->dev, "mt8173_afe_init_audio_clk fail\n");
  1118			return ret;
  1119		}
  1120	
  1121		/* memif % irq initialize*/
  1122		afe->memif_size = MT8173_AFE_MEMIF_NUM;
  1123		afe->memif = devm_kcalloc(afe->dev, afe->memif_size,
  1124					  sizeof(*afe->memif), GFP_KERNEL);
  1125		if (!afe->memif)
  1126			return -ENOMEM;
  1127	
  1128		afe->irqs_size = MT8173_AFE_IRQ_NUM;
  1129		afe->irqs = devm_kcalloc(afe->dev, afe->irqs_size,
  1130					 sizeof(*afe->irqs), GFP_KERNEL);
  1131		if (!afe->irqs)
  1132			return -ENOMEM;
  1133	
  1134		for (i = 0; i < afe->irqs_size; i++) {
  1135			afe->memif[i].data = &memif_data[i];
  1136			afe->irqs[i].irq_data = &irq_data[i];
  1137			afe->irqs[i].irq_occupyed = true;
  1138			afe->memif[i].irq_usage = i;
  1139			afe->memif[i].const_irq = 1;
  1140		}
  1141	
  1142		afe->mtk_afe_hardware = &mt8173_afe_hardware;
  1143		afe->memif_fs = mt8173_memif_fs;
  1144		afe->irq_fs = mt8173_irq_fs;
  1145	
  1146		platform_set_drvdata(pdev, afe);
  1147	
  1148		pm_runtime_enable(&pdev->dev);
  1149		if (!pm_runtime_enabled(&pdev->dev)) {
  1150			ret = mt8173_afe_runtime_resume(&pdev->dev);
  1151			if (ret)
  1152				goto err_pm_disable;
  1153		}
  1154	
  1155		afe->reg_back_up_list = mt8173_afe_backup_list;
  1156		afe->reg_back_up_list_num = ARRAY_SIZE(mt8173_afe_backup_list);
  1157		afe->runtime_resume = mt8173_afe_runtime_resume;
  1158		afe->runtime_suspend = mt8173_afe_runtime_suspend;
  1159	
  1160		ret = devm_snd_soc_register_component(&pdev->dev,
  1161						 &mtk_afe_pcm_platform,
  1162						 NULL, 0);
  1163		if (ret)
  1164			goto err_pm_disable;
  1165	
  1166		comp_pcm = devm_kzalloc(&pdev->dev, sizeof(*comp_pcm), GFP_KERNEL);
  1167		if (!comp_pcm) {
  1168			ret = -ENOMEM;
  1169			goto err_pm_disable;
  1170		}
  1171	
> 1172		ret = snd_soc_component_initialize(comp_pcm,
  1173						   &mt8173_afe_pcm_dai_component,
  1174						   &pdev->dev);
  1175		if (ret)
  1176			goto err_pm_disable;
  1177	
  1178	#ifdef CONFIG_DEBUG_FS
  1179		comp_pcm->debugfs_prefix = "pcm";
  1180	#endif
  1181	
> 1182		ret = snd_soc_add_component(comp_pcm,
  1183					    mt8173_afe_pcm_dais,
  1184					    ARRAY_SIZE(mt8173_afe_pcm_dais));
  1185		if (ret)
  1186			goto err_pm_disable;
  1187	
  1188		comp_hdmi = devm_kzalloc(&pdev->dev, sizeof(*comp_hdmi), GFP_KERNEL);
  1189		if (!comp_hdmi) {
  1190			ret = -ENOMEM;
  1191			goto err_pm_disable;
  1192		}
  1193	
  1194		ret = snd_soc_component_initialize(comp_hdmi,
  1195						   &mt8173_afe_hdmi_dai_component,
  1196						   &pdev->dev);
  1197		if (ret)
  1198			goto err_pm_disable;
  1199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
