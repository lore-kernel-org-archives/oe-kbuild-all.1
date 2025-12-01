Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B59533342E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 17:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764610300; cv=none; b=PibbLbQuCjQTdCfQ3YPZaHMp/5Dx6JWS8nLWFUijyNllJwANutgdYZ1z2f9XL6ci/OVyMGGskbbD4JqA+2HZT5qz4fgNm1vcjYTLBAjiwDJ4ELYttFUxYBiNEqq5lhEeJ0rfrbXJdHR/3B67DM2AvODL0dho/VEulpqabi74xv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764610300; c=relaxed/simple;
	bh=6Jq+S0YkKCsJ62KNqvcGaXarDaBUxNfzFryloYoyvbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s5qio54t+fOtpNzN8T4pMKfwkWW5OH1OLBjsEScSx8oKdRK2pZlDtdpuq/IGYmelgqe2hqY916Aw9Ixo+HLAk63QHdYq69rPavHDWP6A+oEZ8Eu74nwEYD4X1MLvZlPn3tYfaFjo+5nD3MNyxjhTQFT0D3eKmlsOH475yUJ/iX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inuMy0TG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inuMy0TG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764610298; x=1796146298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Jq+S0YkKCsJ62KNqvcGaXarDaBUxNfzFryloYoyvbc=;
  b=inuMy0TGQhy5FeS+GU5A/j+6G/Q1TBiOoA5Fg7NaK+SJvmLE4KqOSPRS
   938vIcY8uUyuxT1oDcerxYsbPMHPBaSD8cX0O0ZgJOMsvnKapj+c77qLh
   gMPiosg27LJlM/OJeGMLplAar//swB1zbF5odBSHLOWi83JRHF6gEJxYo
   t/42fbx/ei0bb2KuKAY67MF5aFdoZvVrCoAQpUIFaTtyBVR6gBOPxgtXF
   vULsTgWWeC0nQwcwy3WoicZnQUk6gCQreYNN1yP8DmCSIg4HI2QvtwB6u
   DnWO2clvZs9y9keg7R6qrkOim+REPGWAMs0wyTGeETVFm8pE+I90PFa+H
   Q==;
X-CSE-ConnectionGUID: sYQCTpAiQOaUs1QTcpiRWg==
X-CSE-MsgGUID: 2j8+jDZLTpOhuWfVuhdQOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70172761"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="70172761"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 09:31:25 -0800
X-CSE-ConnectionGUID: Et48ChzEQQqUpUXeThIJDQ==
X-CSE-MsgGUID: zb/jLIkASvK7pyPCTY0xPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="199070264"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Dec 2025 09:31:23 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ7k9-000000008zL-1TEd;
	Mon, 01 Dec 2025 17:31:21 +0000
Date: Tue, 2 Dec 2025 01:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: Aary Patil <aary.patil@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [thesofproject:topic/sof-dev-rebase 24/94]
 sound/soc/sof/mediatek/mt8365/mt8365.c:360:2-9: line 360 is redundant
 because platform_get_irq() already prints an error
Message-ID: <202512020134.Zxven4d7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   4ca6276b4ddb27ef143f7e84817b6e8a2fdb8372
commit: 622c43e416a1c8b7ce2e145f2f1d22db3d4cdc50 [24/94] ASoC: SOF: mediatek: Add mt8365 support
config: xtensa-randconfig-r053-20251201 (https://download.01.org/0day-ci/archive/20251202/202512020134.Zxven4d7-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020134.Zxven4d7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/sof/mediatek/mt8365/mt8365.c:360:2-9: line 360 is redundant because platform_get_irq() already prints an error
--
>> sound/soc/sof/mediatek/mt8365/mt8365-clk.c:151:36-42: opportunity for str_on_off(enable)

vim +360 sound/soc/sof/mediatek/mt8365/mt8365.c

   280	
   281	static int mt8365_dsp_probe(struct snd_sof_dev *sdev)
   282	{
   283		struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
   284		struct adsp_priv *priv;
   285		int ret, irq;
   286	
   287		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
   288		if (!priv)
   289			return -ENOMEM;
   290	
   291		sdev->pdata->hw_pdata = priv;
   292		priv->dev = sdev->dev;
   293		priv->sdev = sdev;
   294	
   295		priv->adsp = devm_kzalloc(&pdev->dev, sizeof(struct mtk_adsp_chip_info), GFP_KERNEL);
   296		if (!priv->adsp)
   297			return -ENOMEM;
   298	
   299		ret = platform_parse_resource(pdev, priv->adsp);
   300		if (ret)
   301			return ret;
   302	
   303		ret = mt8365_adsp_init_clock(sdev);
   304		if (ret) {
   305			dev_err(sdev->dev, "mt8365_adsp_init_clock failed\n");
   306			return -EINVAL;
   307		}
   308	
   309		ret = mt8365_adsp_clock_on(sdev);
   310		if (ret) {
   311			dev_err(sdev->dev, "mt8365_adsp_clock_on fail!\n");
   312			return -EINVAL;
   313		}
   314	
   315		ret = adsp_sram_power_on(sdev->dev, true);
   316		if (ret) {
   317			dev_err(sdev->dev, "adsp_sram_power_on fail!\n");
   318			goto exit_clk_disable;
   319		}
   320	
   321		ret = adsp_memory_remap_init(&pdev->dev, priv->adsp);
   322		if (ret) {
   323			dev_err(sdev->dev, "adsp_memory_remap_init fail!\n");
   324			goto err_adsp_sram_power_off;
   325		}
   326	
   327		sdev->bar[SOF_FW_BLK_TYPE_IRAM] = devm_ioremap(sdev->dev,
   328							       priv->adsp->pa_sram,
   329							       priv->adsp->sramsize);
   330		if (!sdev->bar[SOF_FW_BLK_TYPE_IRAM]) {
   331			dev_err(sdev->dev, "failed to ioremap base %pa size %#x\n",
   332				&priv->adsp->pa_sram, priv->adsp->sramsize);
   333			ret = -EINVAL;
   334			goto err_adsp_sram_power_off;
   335		}
   336	
   337		priv->adsp->va_sram = sdev->bar[SOF_FW_BLK_TYPE_IRAM];
   338	
   339		sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap(sdev->dev,
   340							       priv->adsp->pa_dram,
   341							       priv->adsp->dramsize);
   342		if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
   343			dev_err(sdev->dev, "failed to ioremap base %pa size %#x\n",
   344				&priv->adsp->pa_dram, priv->adsp->dramsize);
   345			ret = -ENOMEM;
   346			goto err_adsp_sram_power_off;
   347		}
   348		priv->adsp->va_dram = sdev->bar[SOF_FW_BLK_TYPE_SRAM];
   349	
   350		sdev->bar[DSP_REG_BAR] = priv->adsp->va_cfgreg;
   351	
   352		sdev->mmio_bar = SOF_FW_BLK_TYPE_SRAM;
   353		sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
   354	
   355		/* set default mailbox offset for FW ready message */
   356		sdev->dsp_box.offset = mt8365_get_mailbox_offset(sdev);
   357	
   358		irq = platform_get_irq(pdev, 0);
   359		if (irq < 0) {
 > 360			dev_err(sdev->dev, "platform_get_irq failed: %d\n", irq);
   361			ret = irq;
   362			goto err_adsp_sram_power_off;
   363		}
   364	
   365		ret = devm_request_threaded_irq(sdev->dev, irq, mt8365_dsp_ipi_irq,
   366						mt8365_dsp_ipi_isr, IRQF_TRIGGER_NONE,
   367						dev_name(sdev->dev), sdev);
   368		if (ret < 0) {
   369			dev_err(sdev->dev, "devm_request_threaded_irq failed: %d\n", ret);
   370			goto err_adsp_sram_power_off;
   371		}
   372	
   373		return 0;
   374	
   375	err_adsp_sram_power_off:
   376		adsp_sram_power_on(&pdev->dev, false);
   377	exit_clk_disable:
   378		mt8365_adsp_clock_off(sdev);
   379	
   380		return ret;
   381	}
   382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
