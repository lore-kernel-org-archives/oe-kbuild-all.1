Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915875;
	b=P2AnopYd2hvpPUYhGaciKyUoR3z/kc7WRcEcLtUwt99CTFOL2hMu1OcdT1SwJEutYW3T
	 9+piohWX9LdrnD0izomBdaBgp4raFxkDajuKW64D91e6GtMCE31CYPeVisgA+iXEEzFAe
	 yrgZTsLRlYRDBvt1yCNuH//NvojasPoK2yclsWyEEv/u2MDc7jBJ3ApRiF4szENEsz6Iu
	 A8Vm+cLy3Z8g+clcBbAu+/9VoBu+iTWD1rG4SSH6kehcWqp2X79LuG9+NcWRFGRE9Eo4+
	 h+FWReyjDAOA5AbTGpDWpQf2nIZXZrGS02sGBCJUJBlF1sA03+AKNp8hpLbQ/2Vz4kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915875;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UhdZIN9xyZ/fqQYb0doeBPsAW7/D4XIFsub4mcNOaIM=;
	b=utHktSqa8B/PXen3f49PLsWN2kaEcyYtfgE4IdMTgSa5oHDMt5+Wz3vcRsMtnqHTztHH
	 LXtC3qhi/WYKeUAvQqIqBvrJmjgJGOwc+2qV8vEu7uNA31MDsNA9BY51m0IG6XElKOiia
	 dyqKQDLlQ5nPnn6CvzcL5b9EU8nGHa+S+R4r3/XJTjIH4/RSGsy+s8u+Xaomp/dlHmHxg
	 YHxXlEwPIIc+W1IaT9/LcwOJOVoYFygHgpMu4B3303lh3jXmMyUWJ4TunEDAfcjtSHUsZ
	 zgbSRo9GU92kzjSdnBuTGRouSJ10MIjGJeXoxORPLJMcApcF9QPJhOMFQloH/JKFIaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="DU/TPpFo";
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E3F606A326
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 21:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80E3F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DU/TPpFo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793915874; x=1825451874;
  h=date:from:to:cc:subject:message-id;
  bh=q+wzcR+CyBgpCIM0TnkHYcADrKt/i/8R2e4lo8rfLDo=;
  b=DU/TPpFocm1Ac0Q4Xhu3jliQdyVj3j5SUEAT+N/45UOoy2xsvKIwt5I5
   nSgLEtQiLuOiqyBDrwJOlBe/V6VcT6eVa6M9synsY0A1GUpe5sd/sU/2t
   WFlaVJcnOb/Jl0xUEoIKheuko0twv2hTsck9nBmbfmhdoKQkTvXpy+r46
   PQMNkYSRUvTnhAs1OFwOjFuCqdb48UH8IVnTjc3LvxIIWWbNyxLkdWJLa
   MANwpCa3H3In39IXKC4W3INcfniK4RLu+6iNkFJlBVnV9s7lgy7SUHbeq
   BdPEVVZ1BvSyJQ00LWaa0l60sEBJYHGfwolJy/4Yp4vCGPyvT0DvMS23N
   w==;
X-CSE-ConnectionGUID: 5MJgbu4SSju38DRRLidTzA==
X-CSE-MsgGUID: p2RNDyBtTj2T155GAiY91g==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2599385"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2599385"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 13:57:53 -0800
X-CSE-ConnectionGUID: HSBZ50TST8Wt3EXSkDWAWw==
X-CSE-MsgGUID: n41KY6XdRDivJ06Jo1TqQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7026372"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 05 Nov 2026 13:57:52 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP5Sv-000000009oo-2ZVI;
	Thu, 05 Nov 2026 21:57:49 +0000
Date: Thu, 05 Nov 2026 22:57:14 +0100
From: kernel test robot <lkp@intel.com>
To: Aary Patil <aary.patil@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [thesofproject:topic/sof-dev-rebase 20/67]
 sound/soc/sof/mediatek/mt8365/mt8365.c:360:2-9: line 360 is redundant because
 platform_get_irq() already prints an error
Message-ID: <202611052232.wNl1DpfA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   ac4b3737f8be2d5b6dbcd49a7d5d633d2e480b0b
commit: 8a478baa4cfb83b3399d8e96b3cfd9798cabbc25 [20/67] ASoC: SOF: mediatek: Add mt8365 support
config: powerpc-randconfig-r2103-20261105 (https://download.01.org/0day-ci/archive/20261105/202611052232.wNl1DpfA-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611052232.wNl1DpfA-lkp@intel.com/

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
