Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CD439EB5B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 19:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780427782; cv=none; b=br9Dff4aslizFNs7RFWVkWKyFmNIrw//CW0347vZHaQXrwV46CDCw+IiLmwMfi4zJQg7NOgZXCNtWoa690RzvJSrIK3BkGhIgdRuYR+O3c7efKyCqDUp2ktkC4s1R35215Dh5Ls3bE6TMM/DZhKrrsbAT0ZJKe+ZL3QXq1Rpjr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780427782; c=relaxed/simple;
	bh=eSkRKNZ1YHH+/u3XcIhtn0eXuAGH8S3EU2YHiX9/Jtk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oLPJZPyXFabCN3j6OZovI4YndDp9U/r5JUDsuMIkUTte4i/WqmPWwxJggXHtm3wVmxxXM429TcSCuhAaf4JzIQLUDGnuFVwX59qOKAyci9YUM8rocNtk9t8sf3sb2nnjDuvLVPkwb0Umk20WZPQCsihUQxgmLWeCjsvN8ETEeFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1kyXVub; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1kyXVub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780427781; x=1811963781;
  h=date:from:to:cc:subject:message-id;
  bh=eSkRKNZ1YHH+/u3XcIhtn0eXuAGH8S3EU2YHiX9/Jtk=;
  b=f1kyXVubtEhVeLJSZDdbT30O3p3V3UpU7/f0M3MSmseqNTPmfpFk64FD
   bpKetlFCbVG/mfToJb3k4BUsHJHuw9Yiq3hBd7PdoeIwhU2z4jBc1x2Rs
   3Txn/2U9Wst5x+n/T/sauDmUmVT88aTjt3Lug080Eqnlhfi1lYlC1GiMh
   0IWVxr4hY+t+2V7YhUl+JfozdhysnSw52AQ03+hRRUb4ZU2U1swzQcNFZ
   9cPnuLpb+pMAS34w+5/r7K+jFhD5hJzSUXn4B8AVEg1NlHoaocHjJ41pK
   ddsygXN5mHuqqd04O9e4a+eiK49SmtZKZI0MvhD/zGP3VvsGBS3C1scst
   g==;
X-CSE-ConnectionGUID: ufymE2tBTPa/KvAxx0CPVg==
X-CSE-MsgGUID: PqmA193EQHy44zKbn/sHvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="83807420"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="83807420"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 12:16:21 -0700
X-CSE-ConnectionGUID: F89mL/nVTSOU0F3HzE8jMQ==
X-CSE-MsgGUID: dGHMm1/QTLq2zcOqAcnbeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="237645372"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jun 2026 12:16:19 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUUb3-00000000CRA-1Kcw;
	Tue, 02 Jun 2026 19:16:17 +0000
Date: Wed, 03 Jun 2026 03:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/intel/boards/skl_hda_dsp_generic.c:147:16: error: too many
 arguments to function 'devm_snd_soc_card_alloc'; expected 2, have 6
Message-ID: <202606030338.ytQ8a09R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: b9692079ff7862be72856b5db574a06b03299af2 [290/290] ASoC: intel: sof_*: use snd_soc_card_register()
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260603/202606030338.ytQ8a09R-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030338.ytQ8a09R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030338.ytQ8a09R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/parisc/include/asm/alternative.h:18,
                    from arch/parisc/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from sound/soc/intel/boards/skl_hda_dsp_generic.c:8:
   sound/soc/intel/boards/skl_hda_dsp_generic.c: In function 'skl_hda_audio_probe':
   include/linux/init.h:176:21: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Wincompatible-pointer-types]
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     struct module *
   sound/soc/intel/boards/skl_hda_dsp_generic.c:147:52: note: in expansion of macro 'THIS_MODULE'
     147 |         card = devm_snd_soc_card_alloc(&pdev->dev, THIS_MODULE, card_driver,
         |                                                    ^~~~~~~~~~~
   In file included from include/sound/soc.h:1318,
                    from sound/soc/intel/boards/skl_hda_dsp_generic.c:15:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct module *'
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> sound/soc/intel/boards/skl_hda_dsp_generic.c:147:16: error: too many arguments to function 'devm_snd_soc_card_alloc'; expected 2, have 6
     147 |         card = devm_snd_soc_card_alloc(&pdev->dev, THIS_MODULE, card_driver,
         |                ^~~~~~~~~~~~~~~~~~~~~~~                          ~~~~~~~~~~~
   include/sound/soc-card.h:90:22: note: declared here
      90 | struct snd_soc_card *devm_snd_soc_card_alloc(struct device *dev,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/devm_snd_soc_card_alloc +147 sound/soc/intel/boards/skl_hda_dsp_generic.c

    99	
   100	static int skl_hda_audio_probe(struct platform_device *pdev)
   101	{
   102		struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
   103		struct sof_card_private *ctx;
   104		struct snd_soc_card_driver *card_driver;
   105		struct snd_soc_card *card;
   106		char *components = NULL;
   107		unsigned long board_quirk = skl_hda_get_board_quirk(&mach->mach_params);
   108		int ret;
   109	
   110		card_driver = devm_kzalloc(&pdev->dev, sizeof(*card_driver), GFP_KERNEL);
   111		if (!card_driver)
   112			return -ENOMEM;
   113	
   114		card_driver->fully_routed = true;
   115		card_driver->late_probe = skl_hda_card_late_probe;
   116		card_driver->add_dai_link = skl_hda_add_dai_link;
   117	
   118		dev_dbg(&pdev->dev, "board_quirk = %lx\n", board_quirk);
   119	
   120		/* initialize ctx with board quirk */
   121		ctx = sof_intel_board_get_ctx(&pdev->dev, board_quirk);
   122		if (!ctx)
   123			return -ENOMEM;
   124	
   125		if (HDA_EXT_CODEC(mach->mach_params.codec_mask))
   126			ctx->hda_codec_present = true;
   127	
   128		if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
   129			ctx->hdmi.idisp_codec = true;
   130	
   131		ctx->link_order_overwrite = HDA_LINK_ORDER;
   132		ctx->link_id_overwrite = HDA_LINK_IDS;
   133	
   134		/* update dai_link */
   135		ret = sof_intel_board_set_dai_link(&pdev->dev, card_driver, ctx);
   136		if (ret)
   137			return ret;
   138	
   139		if (mach->mach_params.dmic_num > 0) {
   140			components = devm_kasprintf(card->dev, GFP_KERNEL,
   141							  "cfg-dmics:%d",
   142							  mach->mach_params.dmic_num);
   143			if (!components)
   144				return -ENOMEM;
   145		}
   146	
 > 147		card = devm_snd_soc_card_alloc(&pdev->dev, THIS_MODULE, card_driver,
   148					       "hda-dsp", NULL, components);
   149		if (!card)
   150			return -ENOMEM;
   151	
   152		ret = snd_soc_fixup_dai_links_platform_name(card, mach->mach_params.platform);
   153		if (ret)
   154			return ret;
   155	
   156		snd_soc_card_set_drvdata(card, ctx);
   157	
   158		ret = devm_snd_soc_card_register(card);
   159		if (!ret)
   160			skl_set_hda_codec_autosuspend_delay(card);
   161	
   162		return ret;
   163	}
   164	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
