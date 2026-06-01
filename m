Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C282C36F903
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 20:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345111; cv=none; b=DDrFmyjt5Wc8Imf3qlnmqNEH9aDwoUNEmVw3Xdaa4GhElu+7mVWTGgM/6U0toe6jYAvvgmrDPGNIdXov144sP6G1barkOfg5iqFlM1eoe0EA2uhVeQmnFQXT6AOqEZZPo/HqVkw9q/s5+ji1HiZ2lDRNxW3i2l0oMbomsRQbwak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345111; c=relaxed/simple;
	bh=qLzFj1WnAtYdbQcZQk6v4C+29AARSrAjGOXutBgM1PE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cEZ1KBGd2naeJK5BS9UUa1eqIsUVMIK9WLgQVVLY1sYq9sScoBwnOCezwxRV+SqF6/WFDrrRkyNwbTwravZPoYh1w7fx5paRTMQdr+N0qzLLW8ta4+2h3YINmBMjN0rjnRaSDlSh+5+QLkblkBIFb4O9KfAdULtaVCz6fI0ZtVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTt0T87P; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTt0T87P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780345110; x=1811881110;
  h=date:from:to:cc:subject:message-id;
  bh=qLzFj1WnAtYdbQcZQk6v4C+29AARSrAjGOXutBgM1PE=;
  b=YTt0T87PRfYPinc5n2mCOZNAZlNK9YzynQ16DFtXfkFktCq9sZ0W8alt
   69MbDzItFg987N4k6qWyZnTxcJ6/voWZvn6Iu3SWBhZm413YBOkrGf8kw
   7HK2WWVQOlsHnQz4zmf2EDxI5bMzymr7iACzS6gXMSS56AdRSqXWLGm5C
   RcPjxEOKuP+B4ejMdbzJZ64in2Sl41xWqBN03LQWC5KFiynrBe0RHZ68A
   wOpnb9WLLPZIu+1vHH9+MlRa4C9TBbPMAS3VlDZzrOWMryTAwtfbUYTVw
   e3kXIZYb59vmSSez/mftW6PNio4zlbSKAORVvAXDrh9IjiHD8RwYBs2er
   g==;
X-CSE-ConnectionGUID: CPwiFPvYSlaPh4o7db11FA==
X-CSE-MsgGUID: Ng899B2CRpmJGkLH7cyByQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68651168"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="68651168"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 13:18:28 -0700
X-CSE-ConnectionGUID: bb20cAbHQWm1xEitIj9WKg==
X-CSE-MsgGUID: dlpkWvlSQeWVSV8Ez6t5gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="248603902"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Jun 2026 13:18:27 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU95c-00000000B3S-0uvT;
	Mon, 01 Jun 2026 20:18:24 +0000
Date: Tue, 02 Jun 2026 04:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/samsung/bells.c:406:37: warning: 'bells_card_platforms' defined but
 not used
Message-ID: <202606020406.mEAdpwLr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: b2341c51698481e99cbe34f1a5a3b573d1b8f0a0 [290/290] ASoC: samsung: bells: use snd_soc_card_register()
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260602/202606020406.mEAdpwLr-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020406.mEAdpwLr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020406.mEAdpwLr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/samsung/bells.c:406:37: error: array type has incomplete element type 'struct snd_soc_card_platform'
     406 | static struct snd_soc_card_platform bells_card_platforms[] = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/samsung/bells.c:406:37: warning: 'bells_card_platforms' defined but not used [-Wunused-variable]


vim +/bells_card_platforms +406 sound/soc/samsung/bells.c

   405	
 > 406	static struct snd_soc_card_platform bells_card_platforms[] = {
   407		{
   408			.name = "Bells WM2200",
   409			.owner = THIS_MODULE,
   410			.priv = &wm2200_drvdata,
   411			.driver = {
   412				.dai_link = bells_dai_wm2200,
   413				.num_links = ARRAY_SIZE(bells_dai_wm2200),
   414				.codec_conf = bells_codec_conf,
   415				.num_configs = ARRAY_SIZE(bells_codec_conf),
   416	
   417				.late_probe = bells_late_probe,
   418	
   419				.dapm_widgets = bells_widgets,
   420				.num_dapm_widgets = ARRAY_SIZE(bells_widgets),
   421				.dapm_routes = bells_routes,
   422				.num_dapm_routes = ARRAY_SIZE(bells_routes),
   423	
   424				.set_bias_level = bells_set_bias_level,
   425				.set_bias_level_post = bells_set_bias_level_post,
   426			},
   427		},
   428		{
   429			.name = "Bells WM5102",
   430			.owner = THIS_MODULE,
   431			.priv = &wm5102_drvdata,
   432			.driver = {
   433				.dai_link = bells_dai_wm5102,
   434				.num_links = ARRAY_SIZE(bells_dai_wm5102),
   435				.codec_conf = bells_codec_conf,
   436				.num_configs = ARRAY_SIZE(bells_codec_conf),
   437	
   438				.late_probe = bells_late_probe,
   439	
   440				.dapm_widgets = bells_widgets,
   441				.num_dapm_widgets = ARRAY_SIZE(bells_widgets),
   442				.dapm_routes = bells_routes,
   443				.num_dapm_routes = ARRAY_SIZE(bells_routes),
   444	
   445				.set_bias_level = bells_set_bias_level,
   446				.set_bias_level_post = bells_set_bias_level_post,
   447			},
   448		},
   449		{
   450			.name = "Bells WM5110",
   451			.owner = THIS_MODULE,
   452			.priv = &wm5110_drvdata,
   453			.driver = {
   454				.dai_link = bells_dai_wm5110,
   455				.num_links = ARRAY_SIZE(bells_dai_wm5110),
   456				.codec_conf = bells_codec_conf,
   457				.num_configs = ARRAY_SIZE(bells_codec_conf),
   458	
   459				.late_probe = bells_late_probe,
   460	
   461				.dapm_widgets = bells_widgets,
   462				.num_dapm_widgets = ARRAY_SIZE(bells_widgets),
   463				.dapm_routes = bells_routes,
   464				.num_dapm_routes = ARRAY_SIZE(bells_routes),
   465	
   466				.set_bias_level = bells_set_bias_level,
   467				.set_bias_level_post = bells_set_bias_level_post,
   468			},
   469		},
   470	};
   471	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
