Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFCA1FC1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 15:00:28 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1b730eb017bso4952007fac.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 08:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689778827; x=1692370827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MMDLdRUuv1rQK6Txd/ufnlOhufvdEBznxyHTrIjBwRs=;
        b=UPd5Y/nkVrWYrLKm38DFnI4aacfmTUvO7+vHYBtvY/tq/ivmHsLG1CrkCuTWK6k91T
         nGNWCqlQTKQ8EhpqvEyDdtK1XmrKRVA3DaavhR17oZCEBrSc7B0pjYs+B4xBK4j875Ts
         MXPnUQZ46MhOWBIfaShm/8Map3D36nG+6vY0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689778827; x=1692370827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMDLdRUuv1rQK6Txd/ufnlOhufvdEBznxyHTrIjBwRs=;
        b=JZIdhMhidfu5qGtPMyPAuCvbqTUDA/bKwATBetC4B47h4vM1o46Be03zMJlUDq+HCJ
         UCeK+vXJy0BWEDqZOpdy809leDS0FAaFBi+K5iRDZulsOVQ7U0rUyfHUiFYcifaeJYh/
         AGta1YL+Jp4KtdU58Pl6PJ/y9sKoouVxdjB4SlJM4uVesPQxDJHbqa9X3q17udV9eZd5
         3CDNEhbjbbE7LSFAEszmU+OjmPLJrGG+AO2BHpylX6pLy/TLM8pFr2duoOCDZ0XsF3jR
         dnBGRyZYtweWtejnvW4GGk9Hv/rsrNsKN8k72DKjdEGDQK2cKFMPijTy+IiXShlN0yS0
         V20Q==
X-Gm-Message-State: ABy/qLbC2x3TTq2K0Y2p/X+XWih0aNocz5JAC0LIv4bEHyKVoQsgR2Tw
	noksekmHQpZp2fJGyfUHvOuSDXHlG1dC+azeWuYw7Q==
X-Google-Smtp-Source: APBJJlHmvu5efXCA5G9MY/YFEeUfPDuivcl6Usf0XUpRWy65tmrMAwhpug7neZSmWbdlnK6ePLGglQ==
X-Received: by 2002:a05:6870:7393:b0:1a9:f219:d2c with SMTP id z19-20020a056870739300b001a9f2190d2cmr3219292oam.17.1689778827495;
        Wed, 19 Jul 2023 08:00:27 -0700 (PDT)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id r2-20020a056870878200b001aa02b7bfabsm2013057oam.33.2023.07.19.08.00.26
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 08:00:27 -0700 (PDT)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-56584266c41so4009507eaf.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 08:00:26 -0700 (PDT)
X-Received: by 2002:aca:1c14:0:b0:3a0:492b:f07b with SMTP id
 c20-20020aca1c14000000b003a0492bf07bmr2613019oic.26.1689778825877; Wed, 19
 Jul 2023 08:00:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307170454.7nYQFRx1-lkp@intel.com>
In-Reply-To: <202307170454.7nYQFRx1-lkp@intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 19 Jul 2023 17:00:13 +0200
X-Gmail-Original-Message-ID: <CANiDSCv4qLmnLbE2qmx_XcHBzDmGrzD_r6uiJo9AihPnLpoz-g@mail.gmail.com>
Message-ID: <CANiDSCv4qLmnLbE2qmx_XcHBzDmGrzD_r6uiJo9AihPnLpoz-g@mail.gmail.com>
Subject: Re: [linux-stable-rc:linux-5.4.y 9090/9095] sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1159:17:
 error: label 'err_cleanup_components' used but not defined
To: kernel test robot <lkp@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Greg

What is preferred in this case? A follow-up patch? or a new patch?

Regards!

On Sun, 16 Jul 2023 at 22:10, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> head:   79dde2ea800d791a8118548feb231713ed35a09f
> commit: ba3522e10fdf6bd46bb1d6de43a2a79b2b82392a [9090/9095] ASoC: mediatek: mt8173: Fix irq error path
> config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230717/202307170454.7nYQFRx1-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230717/202307170454.7nYQFRx1-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307170454.7nYQFRx1-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    sound/soc/mediatek/mt8173/mt8173-afe-pcm.c: In function 'mt8173_afe_pcm_dev_probe':
> >> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1159:17: error: label 'err_cleanup_components' used but not defined
>     1159 |                 goto err_cleanup_components;
>          |                 ^~~~
>
>
> vim +/err_cleanup_components +1159 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
>
>   1052
>   1053  static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
>   1054  {
>   1055          int ret, i;
>   1056          int irq_id;
>   1057          struct mtk_base_afe *afe;
>   1058          struct mt8173_afe_private *afe_priv;
>   1059
>   1060          ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(33));
>   1061          if (ret)
>   1062                  return ret;
>   1063
>   1064          afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
>   1065          if (!afe)
>   1066                  return -ENOMEM;
>   1067
>   1068          afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
>   1069                                            GFP_KERNEL);
>   1070          afe_priv = afe->platform_priv;
>   1071          if (!afe_priv)
>   1072                  return -ENOMEM;
>   1073
>   1074          afe->dev = &pdev->dev;
>   1075
>   1076          irq_id = platform_get_irq(pdev, 0);
>   1077          if (irq_id <= 0)
>   1078                  return irq_id < 0 ? irq_id : -ENXIO;
>   1079
>   1080          afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
>   1081          if (IS_ERR(afe->base_addr))
>   1082                  return PTR_ERR(afe->base_addr);
>   1083
>   1084          afe->regmap = devm_regmap_init_mmio(&pdev->dev, afe->base_addr,
>   1085                  &mt8173_afe_regmap_config);
>   1086          if (IS_ERR(afe->regmap))
>   1087                  return PTR_ERR(afe->regmap);
>   1088
>   1089          /* initial audio related clock */
>   1090          ret = mt8173_afe_init_audio_clk(afe);
>   1091          if (ret) {
>   1092                  dev_err(afe->dev, "mt8173_afe_init_audio_clk fail\n");
>   1093                  return ret;
>   1094          }
>   1095
>   1096          /* memif % irq initialize*/
>   1097          afe->memif_size = MT8173_AFE_MEMIF_NUM;
>   1098          afe->memif = devm_kcalloc(afe->dev, afe->memif_size,
>   1099                                    sizeof(*afe->memif), GFP_KERNEL);
>   1100          if (!afe->memif)
>   1101                  return -ENOMEM;
>   1102
>   1103          afe->irqs_size = MT8173_AFE_IRQ_NUM;
>   1104          afe->irqs = devm_kcalloc(afe->dev, afe->irqs_size,
>   1105                                   sizeof(*afe->irqs), GFP_KERNEL);
>   1106          if (!afe->irqs)
>   1107                  return -ENOMEM;
>   1108
>   1109          for (i = 0; i < afe->irqs_size; i++) {
>   1110                  afe->memif[i].data = &memif_data[i];
>   1111                  afe->irqs[i].irq_data = &irq_data[i];
>   1112                  afe->irqs[i].irq_occupyed = true;
>   1113                  afe->memif[i].irq_usage = i;
>   1114                  afe->memif[i].const_irq = 1;
>   1115          }
>   1116
>   1117          afe->mtk_afe_hardware = &mt8173_afe_hardware;
>   1118          afe->memif_fs = mt8173_memif_fs;
>   1119          afe->irq_fs = mt8173_irq_fs;
>   1120
>   1121          platform_set_drvdata(pdev, afe);
>   1122
>   1123          pm_runtime_enable(&pdev->dev);
>   1124          if (!pm_runtime_enabled(&pdev->dev)) {
>   1125                  ret = mt8173_afe_runtime_resume(&pdev->dev);
>   1126                  if (ret)
>   1127                          goto err_pm_disable;
>   1128          }
>   1129
>   1130          afe->reg_back_up_list = mt8173_afe_backup_list;
>   1131          afe->reg_back_up_list_num = ARRAY_SIZE(mt8173_afe_backup_list);
>   1132          afe->runtime_resume = mt8173_afe_runtime_resume;
>   1133          afe->runtime_suspend = mt8173_afe_runtime_suspend;
>   1134
>   1135          ret = devm_snd_soc_register_component(&pdev->dev,
>   1136                                           &mtk_afe_pcm_platform,
>   1137                                           NULL, 0);
>   1138          if (ret)
>   1139                  goto err_pm_disable;
>   1140
>   1141          ret = devm_snd_soc_register_component(&pdev->dev,
>   1142                                           &mt8173_afe_pcm_dai_component,
>   1143                                           mt8173_afe_pcm_dais,
>   1144                                           ARRAY_SIZE(mt8173_afe_pcm_dais));
>   1145          if (ret)
>   1146                  goto err_pm_disable;
>   1147
>   1148          ret = devm_snd_soc_register_component(&pdev->dev,
>   1149                                           &mt8173_afe_hdmi_dai_component,
>   1150                                           mt8173_afe_hdmi_dais,
>   1151                                           ARRAY_SIZE(mt8173_afe_hdmi_dais));
>   1152          if (ret)
>   1153                  goto err_pm_disable;
>   1154
>   1155          ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
>   1156                                 0, "Afe_ISR_Handle", (void *)afe);
>   1157          if (ret) {
>   1158                  dev_err(afe->dev, "could not request_irq\n");
> > 1159                  goto err_cleanup_components;
>   1160          }
>   1161
>   1162          dev_info(&pdev->dev, "MT8173 AFE driver initialized.\n");
>   1163          return 0;
>   1164
>   1165  err_pm_disable:
>   1166          pm_runtime_disable(&pdev->dev);
>   1167          return ret;
>   1168  }
>   1169
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



-- 
Ricardo Ribalda
