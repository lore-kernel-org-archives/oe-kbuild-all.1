Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793215301;
	b=AmZSZruYWSUJTb8QLCLWiemawiBEM3DPdV/OIs+Ge7u81fyHF5fz0Gnz92TJcpwsYwXq
	 CIRkYo9MByGpGiP1PHrKAgbHRYZS0hnVh7AJAburf5AkRLSjM3aFsHyPwluRWcuMP08Il
	 aIL7ESDBeFpjYgSEWYfRX8NkO7TVzYFd7YsAA/iY/wsEDkqmuahM8qxEnNdDu2j2QcoOi
	 s73ALvUNB1trsujTEaIpoXZ1i3+2EFixNDxkOofJq4eDqzqAsO75PxVIwMxATfY1o+61T
	 qVhySqu/3qX1C6ujmDHhEo2iweKwfjxU+fA8HR32UJ/X63t4Ja6AzBPixSntuOzsALw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215301;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZJqzsscGMYt4EgVQYd05xuBH7kz3JXNw+rRpzl0db6o=;
	b=rfAZxTbQZiEfLAxbw7gmNyK+Pvw/Xq8Vs7NfS+8UVpSJTIIoPyaBNZki0lM61cp23VP/
	 pt2HV4ZDdXMVKbKyXVWrqF3Nft8iMbnLzG+p1MU+V5WjXHQCy9ejOdlpDJ3FVO9dr6U3d
	 5MFTwiskfzb6lmMUrjLsSE1m9+UMYd+Z7n2BbCp7r+gcnZVGVzjNHFHSC++ZSGe9kBJ4w
	 rQw2PEq5XgPNffaa2q921AEtWPWfTD/pym0M69b5J6E9RmzPThFN2Oo84EKB4z0x5l6ee
	 QH7SW4hmtDsorHNxchfQNd8AGwh1TsE+Uoq6THloKUWEGHDKi+RnN6DHTyfwGJVhjUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OLAfcJcr;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9135C606A31E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 19:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9135C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OLAfcJcr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793215300; x=1824751300;
  h=date:from:to:cc:subject:message-id;
  bh=LqafQCqooz0zHq36KFgPR8VgjN+nX4Kjh5zIGxuIqqE=;
  b=OLAfcJcrBtpNryH8qM/UrQg+L2/eTU3n90WoPGlRJzERrOUXYGOZeGxd
   dMwakyXBVsqoNqgFHqPhSoUzTHo+fk4T5h/MZ1cV7vMK68LhKJmcG1Lut
   tW0PY63she/qPY2cFgbZeaCr5pLxCo992674/0Qsgl8TEtv2siKJMjM3+
   JxVciGjDOq1sM2b/UK8NgBGqbmRdnX/g+Ouqo6mCw3uuPwRfTW42LtgrU
   9TUQJ2NHaLMPRcZbm74RQ2qdPIA2fNEI0xaWDL09xA/u/9VBjeNa3Bt4Q
   utzZJjFzWthzY7sE92CFzYox7EXbYIwVq+/AyM9NGnN/kptWb1MntKkch
   Q==;
X-CSE-ConnectionGUID: eUu7hvJOSz+P2wSX9ykiLA==
X-CSE-MsgGUID: UPvJmqE1QxWJIcZaREVpNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1833984"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1833984"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 12:21:39 -0700
X-CSE-ConnectionGUID: 7Yd2XodwSfKKNwkLvqN1Vg==
X-CSE-MsgGUID: 685CVpCgSTyBs47p8ZElFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5451020"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 28 Oct 2026 12:21:37 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM9DI-000000004xh-3zEj;
	Wed, 28 Oct 2026 19:21:32 +0000
Date: Wed, 28 Oct 2026 20:21:08 +0100
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-10-28-2 244/344]
 sound/soc/fsl/fsl_qmc_audio.c:60:35: error: incomplete definition of type
 'struct snd_soc_card'
Message-ID: <202610282017.Fu8yrydb-lkp@intel.com>
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
commit: 009214cc279a0efdc46fca31937145c681105755 [244/344] ASoC: move struct snd_soc_card/snd_soc_card_driver to soc-card.[hc]
config: powerpc-randconfig-r2310-20261028 (https://download.01.org/0day-ci/archive/20261028/202610282017.Fu8yrydb-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282017.Fu8yrydb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282017.Fu8yrydb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/fsl/fsl_qmc_audio.c:60:35: error: incomplete definition of type 'struct snd_soc_card'
      60 |         struct snd_card *card = rtd->card->snd_card;
         |                                 ~~~~~~~~~^
   include/sound/soc.h:417:8: note: forward declaration of 'struct snd_soc_card'
     417 | struct snd_soc_card;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:206:20: error: incomplete definition of type 'struct snd_soc_component'
     206 |                 dev_err(component->dev, "qmc_dai is not set\n");
         |                         ~~~~~~~~~^
   include/sound/soc.h:422:8: note: forward declaration of 'struct snd_soc_component'
     422 | struct snd_soc_component;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:354:12: error: incomplete definition of type 'struct snd_soc_dai'
     354 |         return dai->driver - qmc_audio->dai_drivers;
         |                ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:560:14: error: incomplete definition of type 'struct snd_soc_dai'
     560 |                 dev_err(dai->dev, "Invalid dai\n");
         |                         ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:583:14: error: incomplete definition of type 'struct snd_soc_dai'
     583 |                 dev_err(dai->dev, "Invalid dai\n");
         |                         ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:596:14: error: incomplete definition of type 'struct snd_soc_dai'
     596 |                 dev_err(dai->dev, "Not enough qmc_chans. Need %u, avail %u\n",
         |                         ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:607:16: error: incomplete definition of type 'struct snd_soc_dai'
     607 |                                 dev_err(dai->dev, "qmc_chans[%u], set param failed %d\n",
         |                                         ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:632:14: error: incomplete definition of type 'struct snd_soc_dai'
     632 |                 dev_err(dai->dev, "Invalid dai\n");
         |                         ~~~^
   include/sound/soc.h:419:8: note: forward declaration of 'struct snd_soc_dai'
     419 | struct snd_soc_dai;
         |        ^
   sound/soc/fsl/fsl_qmc_audio.c:949:8: error: call to undeclared function 'devm_snd_soc_component_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     949 |         ret = devm_snd_soc_component_register(qmc_audio->dev,
         |               ^
   sound/soc/fsl/fsl_qmc_audio.c:949:8: note: did you mean 'snd_soc_component_register'?
   include/sound/soc-component.h:230:5: note: 'snd_soc_component_register' declared here
     230 | int snd_soc_component_register(struct snd_soc_component *component,
         |     ^
   9 errors generated.


vim +60 sound/soc/fsl/fsl_qmc_audio.c

075c7125b11c72 Herve Codina      2023-02-17  56  
fe8112d6d2a62e Kuninori Morimoto 2026-03-16  57  static int qmc_audio_pcm_new(struct snd_soc_component *component,
075c7125b11c72 Herve Codina      2023-02-17  58  			     struct snd_soc_pcm_runtime *rtd)
075c7125b11c72 Herve Codina      2023-02-17  59  {
075c7125b11c72 Herve Codina      2023-02-17 @60  	struct snd_card *card = rtd->card->snd_card;
075c7125b11c72 Herve Codina      2023-02-17  61  	int ret;
075c7125b11c72 Herve Codina      2023-02-17  62  
075c7125b11c72 Herve Codina      2023-02-17  63  	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
075c7125b11c72 Herve Codina      2023-02-17  64  	if (ret)
075c7125b11c72 Herve Codina      2023-02-17  65  		return ret;
075c7125b11c72 Herve Codina      2023-02-17  66  
075c7125b11c72 Herve Codina      2023-02-17  67  	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV, card->dev,
075c7125b11c72 Herve Codina      2023-02-17  68  				       64 * 1024, 64 * 1024);
075c7125b11c72 Herve Codina      2023-02-17  69  	return 0;
075c7125b11c72 Herve Codina      2023-02-17  70  }
075c7125b11c72 Herve Codina      2023-02-17  71  

:::::: The code at line 60 was first introduced by commit
:::::: 075c7125b11c72e7933401d73000d6d151196072 ASoC: fsl: Add support for QMC audio

:::::: TO: Herve Codina <herve.codina@bootlin.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
