Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199327;
	b=Fh6yLme+V873N8P5mcY7MquGC2+qHxbYgDOz8dvIFVH+GNV32wiRI+Dy5sugaUZUKX1m
	 pSm5OpqdfDzet978Q4J2PA4a1Jf0rReQC2+NS54/FpFD7428hbWYvh0xDas2LI3u2mkcs
	 5OXjvl9d488X+5TMq2PpXIzUwWzf5NhhTkOLRvM3xn9ixk/Ge/qkVLF0KpG1kLWotUJ66
	 Yx4FOPnq5WQhD3K2CaEa3Q/izbfvmKH/Gz8IqFEdED9EE1yeuNoqby9n7Qt+CZoAgucj6
	 fRksX/tklqtnRSwsVAzS3DrARB/aJR7GQY6vP8zEndVNY2voQHLjyyYV2ZHc60dv8Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199327;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5k+PmQwevCxCaWesObDHUa2/49zrXtRcFtU2bKdSmzw=;
	b=v9r6ODtqLjVB5DDN0GUl9yRhEzXscV++muRHKbTUaEnGf5LEVw8BZR73hx4PvzHzcW5I
	 nsyBJffqTtn+IWGwUGy6YBAkr4xkwSH1QedLyWkL+7pAclbjIL53CxBxt17D1WxcyrIUm
	 BfscRwLZLj0diJwhPl0Z0GY0SDeednOJgTS4bNoXQllAp3WJCK/vV8HbeeXOhiioy95V1
	 6e5nVvEeJXhpPuJB4SYg12/iJBKqdAUmhbnXLYWmJu1OOu6WcA8Sbqd8cp3y2D+42aVZ3
	 YbQyBX9a3/gps2Rg4N8w3SvONruPxkWdkvlvc96KNOo2NnAf12sJ/RPEaV6AnUl3jcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gapvm7cl;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2DF606A32A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 14:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B2DF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gapvm7cl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793199327; x=1824735327;
  h=date:from:to:cc:subject:message-id;
  bh=eUKsssK2xluttIApNjRGIzISUUdsGoDcLpmOZ20oywA=;
  b=Gapvm7cliRWHddhTo62IXCW+jtPbrux3u+nGwqlyffpNvgYpMsQvyEfG
   GDUQqSBGIfDc9GyTXBWolV9KvlASKSDUx5X/2OYonUI6lWGMz1SgtIKE9
   jAUlo7Ll2f9y54oREwgG/zSYomI35pr5S0thfJPy/xcsFUMqfFfjN4H5d
   HMHNQO/jSVBLAltRRoCATo8Fjyx9LVtYhNWPIAPhGe9q9GtAIwtqgEWM+
   GQ0kRtVXiVOlk2+3SXuYOhTN5SC0TXCTpsWMFstxqAbt6ZmlkjJB3zbA8
   iZi8+Cef5xMD4R0knrX+WhgJuRYZH5ir/vZkhiN5o0Z2yV0Wl8KFmUNBJ
   Q==;
X-CSE-ConnectionGUID: /9Npki+ORH+MW0CA/Prbdw==
X-CSE-MsgGUID: ZXCJEpVBRkOi3pStDOMJ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1826288"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1826288"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 07:55:00 -0700
X-CSE-ConnectionGUID: acAntiejQg2oGzX9elU3Og==
X-CSE-MsgGUID: P3q6PUZ1TtWAoV5Sw30GNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4964380"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2026 07:54:58 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM53H-000000004tT-3stG;
	Wed, 28 Oct 2026 14:54:55 +0000
Date: Wed, 28 Oct 2026 15:53:57 +0100
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-10-28-2 221/344]
 sound/soc/fsl/fsl_qmc_audio.c:949:8: error: call to undeclared function
 'devm_snd_soc_component_register'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202610281518.xR2oFWmy-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-28-2
head:   3274ffa4355111331c471a7987c5f2af43fac128
commit: 592354536672710721edee383c2afc05ba49ddbb [221/344] dai
config: powerpc-randconfig-r2310-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281518.xR2oFWmy-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281518.xR2oFWmy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281518.xR2oFWmy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/fsl/fsl_qmc_audio.c:949:8: error: call to undeclared function 'devm_snd_soc_component_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     949 |         ret = devm_snd_soc_component_register(qmc_audio->dev,
         |               ^
   sound/soc/fsl/fsl_qmc_audio.c:949:8: note: did you mean 'snd_soc_component_register'?
   include/sound/soc-component.h:281:5: note: 'snd_soc_component_register' declared here
     281 | int snd_soc_component_register(struct snd_soc_component *component,
         |     ^
   1 error generated.


vim +/devm_snd_soc_component_register +949 sound/soc/fsl/fsl_qmc_audio.c

   908	
   909	static int qmc_audio_probe(struct platform_device *pdev)
   910	{
   911		struct device_node *np = pdev->dev.of_node;
   912		struct qmc_audio *qmc_audio;
   913		unsigned int i;
   914		int ret;
   915	
   916		qmc_audio = devm_kzalloc(&pdev->dev, sizeof(*qmc_audio), GFP_KERNEL);
   917		if (!qmc_audio)
   918			return -ENOMEM;
   919	
   920		qmc_audio->dev = &pdev->dev;
   921	
   922		qmc_audio->num_dais = of_get_available_child_count(np);
   923		if (qmc_audio->num_dais) {
   924			qmc_audio->dais = devm_kcalloc(&pdev->dev, qmc_audio->num_dais,
   925						       sizeof(*qmc_audio->dais),
   926						       GFP_KERNEL);
   927			if (!qmc_audio->dais)
   928				return -ENOMEM;
   929	
   930			qmc_audio->dai_drivers = devm_kcalloc(&pdev->dev, qmc_audio->num_dais,
   931							      sizeof(*qmc_audio->dai_drivers),
   932							      GFP_KERNEL);
   933			if (!qmc_audio->dai_drivers)
   934				return -ENOMEM;
   935		}
   936	
   937		i = 0;
   938		for_each_available_child_of_node_scoped(np, child) {
   939			ret = qmc_audio_dai_parse(qmc_audio, child,
   940						  qmc_audio->dais + i,
   941						  qmc_audio->dai_drivers + i);
   942			if (ret)
   943				return ret;
   944			i++;
   945		}
   946	
   947		platform_set_drvdata(pdev, qmc_audio);
   948	
 > 949		ret = devm_snd_soc_component_register(qmc_audio->dev,
   950						      &qmc_audio_soc_platform,
   951						      qmc_audio->dai_drivers,
   952						      qmc_audio->num_dais);
   953		if (ret)
   954			return ret;
   955	
   956		return 0;
   957	}
   958	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
