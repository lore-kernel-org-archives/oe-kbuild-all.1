Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF2D3101A6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 May 2026 19:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779737906; cv=none; b=WOBvJUtO0h0OZ5CLssWN1KsQ+ox0ohTwSUpXc7iVfTx2S4jRzhaFFpbM0938+Zj3hs9Ldu5TfcILrdNeVqxf+KBJ9tR9mZoAwO0tNoXCeZjEZY1YgbDsq6G1nQXek89NWtcXlBOgEdEukNt0lXr41JAh0Fy9LsP5olecfamDlWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779737906; c=relaxed/simple;
	bh=sgJQVZkbOP3RVmsCcyX3B43RdpzT++WW1078tb22Da0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T4ppj6TTnx77E3Y3/VfOWv5FVS6O4s4HBlwojblH3ElVxETTbkz/bIUSavlPlgEH2VrdznZP3e66PYOIUDs17Wp/qEYP47EtAue6lhub7w2GYQ0BuCqXHjwIAcLy9eU9Ktbs+DFwPsN44KcIFFQBX9XRMYqF2lo+6yTd+vBe65o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ahhfq0QF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ahhfq0QF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779737905; x=1811273905;
  h=date:from:to:cc:subject:message-id;
  bh=sgJQVZkbOP3RVmsCcyX3B43RdpzT++WW1078tb22Da0=;
  b=Ahhfq0QF49S5ii8I0jEX0vC7uJbs7eOBHdUSYiD0Ae6uZWXYtPhPYlBU
   HrQA1/Dqpjj8h6KDFF7U/qhi0tY1x5aHo6ez+Dgs6NiUjvvbY21f3xaZx
   BbjEd91ISxlgq9Y+PRf0BHhog/e6wkoYT1P6G4MDfSN3V2pMoQcPwT03Z
   E0uOFB5QgDdxOXKnePy4UW0lddObe6NJDy87jZ//ys6hGRG3YwDC3UddZ
   JAmxgq6sAoNAVq0yc2YR0Ki6FTqonbDnFt3tLN7cw4J6R8iGiLn7jZjYc
   VECdhXYZ/1+kgIaDTHeZeuwss54TWt9md3nmGJjATVgpWRa72IHdqe77g
   A==;
X-CSE-ConnectionGUID: 54XgZOsvTpKYfKStZ8+72A==
X-CSE-MsgGUID: 5YH8pCU6ShSZmlLGzfI0vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="83135983"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="83135983"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 12:38:24 -0700
X-CSE-ConnectionGUID: GlKFjZljSkqMILOgXksvYw==
X-CSE-MsgGUID: XKYbI3IhS9uVoGAoTSOjzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="279802864"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 May 2026 12:38:23 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRb80-000000001lu-1Lt9;
	Mon, 25 May 2026 19:38:20 +0000
Date: Tue, 26 May 2026 03:38:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-05-22-2 254/254]
 sound/soc/pxa/pxa2xx-ac97.c:103:9: error: implicit declaration of function
 'snd_soc_dai_set_dma_data'; did you mean 'snd_soc_dai_set_tristate'?
Message-ID: <202605260340.EpSYQPfZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-05-22-2
head:   7f5e6579901e0a1f3ff8bb45002dc226961a56ce
commit: ebc969f7c168a7d2782716a38e407ed8cebce4b6 [254/254] ASoC: soc-dai: remove compatible definition
config: sh-randconfig-001-20260525 (https://download.01.org/0day-ci/archive/20260526/202605260340.EpSYQPfZ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605260340.EpSYQPfZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605260340.EpSYQPfZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/pxa/pxa2xx-ac97.c: In function 'pxa2xx_ac97_hifi_startup':
>> sound/soc/pxa/pxa2xx-ac97.c:103:9: error: implicit declaration of function 'snd_soc_dai_set_dma_data'; did you mean 'snd_soc_dai_set_tristate'? [-Wimplicit-function-declaration]
     103 |         snd_soc_dai_set_dma_data(cpu_dai, substream, dma_data);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_dai_set_tristate


vim +103 sound/soc/pxa/pxa2xx-ac97.c

75b41027662e29 Liam Girdwood 2006-10-12   92  
58ceb57ec1be92 Daniel Mack   2015-09-30   93  static int pxa2xx_ac97_hifi_startup(struct snd_pcm_substream *substream,
f0fba2ad1b6b53 Liam Girdwood 2010-03-17   94  				    struct snd_soc_dai *cpu_dai)
75b41027662e29 Liam Girdwood 2006-10-12   95  {
d65a14587a9be8 Daniel Mack   2013-08-12   96  	struct snd_dmaengine_dai_dma_data *dma_data;
75b41027662e29 Liam Girdwood 2006-10-12   97  
75b41027662e29 Liam Girdwood 2006-10-12   98  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
5f712b2b73a9fc Daniel Mack   2010-03-22   99  		dma_data = &pxa2xx_ac97_pcm_stereo_out;
75b41027662e29 Liam Girdwood 2006-10-12  100  	else
5f712b2b73a9fc Daniel Mack   2010-03-22  101  		dma_data = &pxa2xx_ac97_pcm_stereo_in;
5f712b2b73a9fc Daniel Mack   2010-03-22  102  
5f712b2b73a9fc Daniel Mack   2010-03-22 @103  	snd_soc_dai_set_dma_data(cpu_dai, substream, dma_data);
75b41027662e29 Liam Girdwood 2006-10-12  104  
75b41027662e29 Liam Girdwood 2006-10-12  105  	return 0;
75b41027662e29 Liam Girdwood 2006-10-12  106  }
75b41027662e29 Liam Girdwood 2006-10-12  107  

:::::: The code at line 103 was first introduced by commit
:::::: 5f712b2b73a9fc87fcc52124cfe8adefaa0c92f5 ALSA: ASoC: move dma_data from snd_soc_dai to snd_soc_pcm_stream

:::::: TO: Daniel Mack <daniel@caiaq.de>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
