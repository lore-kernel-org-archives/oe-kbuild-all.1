Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE06E1C6A1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727519417; cv=none; b=tb757uxU6nQm1rSwBtErqNJPIpdATnrzqjmFUnPUj9rWAHUhHcsNzeFA8ndD22fRFnBb2AUePtfLlGUIVN0Fq7JiWwx0VJqnUbt59Ch5YBVHS8qtJ+Nkd1Yycejr2jEDbyAOAFVT6eOwGIdvPeO3IXvbrYMBd5uYV2fvMou+cvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727519417; c=relaxed/simple;
	bh=K9zcq7IOsNETebB7ZCeexm/zzyluyX4Avgs+oaFz9wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F786hL1HMn4d4zAdAaaO3FC5TUpgZGBGpZ4JJKoC4oqc82+nCQwUZa2CwcZ9Cx1KzHxEQ1PzPo+8WfCVPQW7Acygc5NdX6TapRJ7fVgobWmKNptAVBMGtzgQN5/5gY+1fitUo8SAdA4zcu507RZHpFGvg46aWW+QdQZR9sWeLvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJDVeTb4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJDVeTb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727519416; x=1759055416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K9zcq7IOsNETebB7ZCeexm/zzyluyX4Avgs+oaFz9wo=;
  b=iJDVeTb4LThmT9U5eSIlzuGqcQjJtEcG8H3EefQQgcUoY/ktLpz9unwg
   A7WuNvlaA1/YC1zchMW+J37FC5Evbr7KoO4trOweGFI0pfsCeTQOQoB1j
   96Z3XrVj0s83nhIvoejfmvHiBRkvPAQ6traNGwYMJzwTTPITJ0mQa1mqC
   5JfsHv+e9T+X1PHhKaSOY771L7u2AbQYvgGin74wfgtplDOy+SPhq4YEf
   sRbVFd57+5yImhUUg9im6Vd8VWj6+05oLp2PPhKvy0HufKyGjgkdGXZPy
   AUAxQ+MCH1re9Jvuf3rfV4BgRjq/WVhvmmf5LggBGs2hXWQB7J47s/9UV
   A==;
X-CSE-ConnectionGUID: JguUNaADQnSZd0sBBHQzpg==
X-CSE-MsgGUID: efbYQ9IYTwmGbRpxRB4DdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="44127409"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="44127409"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 03:30:13 -0700
X-CSE-ConnectionGUID: EfKT3VmSS9ObMw4w5u6ezA==
X-CSE-MsgGUID: jW3LghuURtGv51k/FFnJcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77312100"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2024 03:30:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suUiH-000NA7-0B;
	Sat, 28 Sep 2024 10:30:09 +0000
Date: Sat, 28 Sep 2024 18:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2024-09-26 3/13]
 sound/soc/sof/nocodec.c:59:25: error: invalid type argument of '->' (have
 'struct snd_soc_dai_link')
Message-ID: <202409281801.heWC9u13-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2024-09-26
head:   cb3800adeb6986766b0b964bab095945d71295dc
commit: 88975977f45cbfa257894c9367179ce2bce9d2b7 [3/13] ASoC: sof: remove dpcm_xxx flags
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20240928/202409281801.heWC9u13-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281801.heWC9u13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281801.heWC9u13-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sof/nocodec.c: In function 'sof_nocodec_bes_setup':
>> sound/soc/sof/nocodec.c:59:25: error: invalid type argument of '->' (have 'struct snd_soc_dai_link')
      59 |                 links[i]->playback_only =  drv[i].playback.channels_min && !drv[i].capture.channels_min;
         |                         ^~
   sound/soc/sof/nocodec.c:60:25: error: invalid type argument of '->' (have 'struct snd_soc_dai_link')
      60 |                 links[i]->capture_only  = !drv[i].playback.channels_min &&  drv[i].capture.channels_min;
         |                         ^~


vim +59 sound/soc/sof/nocodec.c

    21	
    22	static int sof_nocodec_bes_setup(struct device *dev,
    23					 struct snd_soc_dai_driver *drv,
    24					 struct snd_soc_dai_link *links,
    25					 int link_num, struct snd_soc_card *card)
    26	{
    27		struct snd_soc_dai_link_component *dlc;
    28		int i;
    29	
    30		if (!drv || !links || !card)
    31			return -EINVAL;
    32	
    33		/* set up BE dai_links */
    34		for (i = 0; i < link_num; i++) {
    35			dlc = devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
    36			if (!dlc)
    37				return -ENOMEM;
    38	
    39			links[i].name = devm_kasprintf(dev, GFP_KERNEL,
    40						       "NoCodec-%d", i);
    41			if (!links[i].name)
    42				return -ENOMEM;
    43	
    44			links[i].stream_name = links[i].name;
    45	
    46			links[i].cpus = &dlc[0];
    47			links[i].codecs = &snd_soc_dummy_dlc;
    48			links[i].platforms = &dlc[1];
    49	
    50			links[i].num_cpus = 1;
    51			links[i].num_codecs = 1;
    52			links[i].num_platforms = 1;
    53	
    54			links[i].id = i;
    55			links[i].no_pcm = 1;
    56			links[i].cpus->dai_name = drv[i].name;
    57			links[i].platforms->name = dev_name(dev->parent);
    58	
  > 59			links[i]->playback_only =  drv[i].playback.channels_min && !drv[i].capture.channels_min;
    60			links[i]->capture_only  = !drv[i].playback.channels_min &&  drv[i].capture.channels_min;
    61	
    62			links[i].be_hw_params_fixup = sof_pcm_dai_link_fixup;
    63		}
    64	
    65		card->dai_link = links;
    66		card->num_links = link_num;
    67	
    68		return 0;
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
