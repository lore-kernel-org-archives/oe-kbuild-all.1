Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E442D2499
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 18:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764699530; cv=none; b=eTPTup6SkFxLfiZD/xY4VaJrdg0+T83NGpdd1DKdlSy3kcueB1tNMXfzXNoCw6Qdod7NevSu8qCdNu3Q3PCUE8vzZQFrugHb4lJkmVLnaRGnhBCxJHgdhOUf3ULpV4OUmH64k/OmnX8GyQwMHQu6ImtQFhgLHcYmZKmfA/faUwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764699530; c=relaxed/simple;
	bh=xuO8Bl0ymkY7CkyEg2CmxbUCXbdRXZ5fQ6T91kqMRmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NYSpcyj6qGd1ZY2inF2wONyk25QmPb+pzmmuV+We4yRYH/Fc59ltko8L/2ukYoKFwY/lyx4ZLMB2XtW+XQnNJIyXQeflFtu4bwu/+x0yRrc+r3tWmMjTE12v3emEIf7doht0aS/Pv6QxL4XXi4kM1u6XZRR0oQcCPxNgkCNnGPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVV09KMA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVV09KMA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764699528; x=1796235528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xuO8Bl0ymkY7CkyEg2CmxbUCXbdRXZ5fQ6T91kqMRmg=;
  b=UVV09KMACKHYrnGfVhs/M9fi2G8o2CcoVwb2wz7b9zkHUqtCM/2smmSO
   N+Jx/XqtT0Ksc+20hpKczXKMPvyWnkoLNYNjNQj2MmDZXiXuSwlLf2vyr
   sAFrsy44CbmqavNhZB+wtJMG9PHDkY2V5qdm/NtcxTvO7KEv+Tc30QVL7
   rPYlXuGmCnlTMNtmpHSOvsHTLlG6eu+wzkBRAdTtKzQvcaonitBf61sVX
   e0KVa+DqlkxGoaNOBzn+msNJlsj2B6TYXm2O8XMjcFLE3mWhAD0DIk2No
   8iwqdVoChfkiwM8LRinQgLDwkb5j1DSzFjX1fihOsGALKQWD85i2vnqAG
   w==;
X-CSE-ConnectionGUID: V1wZqbEeSZG60QRs1VvHJA==
X-CSE-MsgGUID: mAG6b8nHT0a5xVDFrZtKzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="92159373"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="92159373"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 10:18:46 -0800
X-CSE-ConnectionGUID: ArFScuR4Q76x1HJF1VxJug==
X-CSE-MsgGUID: hgI8cUuzTdOTS8q2PDJc/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194867289"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Dec 2025 10:18:44 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQUxW-00000000A6J-2zNl;
	Tue, 02 Dec 2025 18:18:42 +0000
Date: Wed, 3 Dec 2025 02:17:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-12-01 5/13]
 sound/soc/mediatek/mt8189/mt8189-nau8825.c:347:41: error: passing argument 1
 of 'snd_soc_dapm_new_controls' from incompatible pointer type
Message-ID: <202512030200.NKzLt3mZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-12-01
head:   a5568a9bacc493dbb1465f3b850acf8595553013
commit: 80cf25a8c974d41d5dec39864570b0e1a3b3b997 [5/13] ASoC: soc-dapm: add snd_soc_dapm_alloc()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251203/202512030200.NKzLt3mZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030200.NKzLt3mZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030200.NKzLt3mZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt8189/mt8189-nau8825.c: In function 'mt8189_dumb_amp_init':
>> sound/soc/mediatek/mt8189/mt8189-nau8825.c:347:41: error: passing argument 1 of 'snd_soc_dapm_new_controls' from incompatible pointer type [-Wincompatible-pointer-types]
     347 |         ret = snd_soc_dapm_new_controls(&card->dapm, mt8189_dumb_spk_widgets,
         |                                         ^~~~~~~~~~~
         |                                         |
         |                                         struct snd_soc_dapm_context **
   In file included from include/sound/soc.h:407,
                    from sound/soc/mediatek/mt8189/mt8189-nau8825.c:14:
   include/sound/soc-dapm.h:648:60: note: expected 'struct snd_soc_dapm_context *' but argument is of type 'struct snd_soc_dapm_context **'
     648 | int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/mediatek/mt8189/mt8189-nau8825.c: In function 'mt8189_headset_codec_init':
   sound/soc/mediatek/mt8189/mt8189-nau8825.c:424:41: error: passing argument 1 of 'snd_soc_dapm_new_controls' from incompatible pointer type [-Wincompatible-pointer-types]
     424 |         ret = snd_soc_dapm_new_controls(&card->dapm, mt8189_headset_widgets,
         |                                         ^~~~~~~~~~~
         |                                         |
         |                                         struct snd_soc_dapm_context **
   include/sound/soc-dapm.h:648:60: note: expected 'struct snd_soc_dapm_context *' but argument is of type 'struct snd_soc_dapm_context **'
     648 | int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~


vim +/snd_soc_dapm_new_controls +347 sound/soc/mediatek/mt8189/mt8189-nau8825.c

d218ea171430e4 Cyril Chao 2025-10-31  341  
d218ea171430e4 Cyril Chao 2025-10-31  342  static int mt8189_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
d218ea171430e4 Cyril Chao 2025-10-31  343  {
d218ea171430e4 Cyril Chao 2025-10-31  344  	struct snd_soc_card *card = rtd->card;
d218ea171430e4 Cyril Chao 2025-10-31  345  	int ret;
d218ea171430e4 Cyril Chao 2025-10-31  346  
d218ea171430e4 Cyril Chao 2025-10-31 @347  	ret = snd_soc_dapm_new_controls(&card->dapm, mt8189_dumb_spk_widgets,
d218ea171430e4 Cyril Chao 2025-10-31  348  					ARRAY_SIZE(mt8189_dumb_spk_widgets));
d218ea171430e4 Cyril Chao 2025-10-31  349  	if (ret) {
d218ea171430e4 Cyril Chao 2025-10-31  350  		dev_err(rtd->dev, "unable to add Dumb Speaker dapm, ret %d\n", ret);
d218ea171430e4 Cyril Chao 2025-10-31  351  		return ret;
d218ea171430e4 Cyril Chao 2025-10-31  352  	}
d218ea171430e4 Cyril Chao 2025-10-31  353  
d218ea171430e4 Cyril Chao 2025-10-31  354  	ret = snd_soc_add_card_controls(card, mt8189_dumb_spk_controls,
d218ea171430e4 Cyril Chao 2025-10-31  355  					ARRAY_SIZE(mt8189_dumb_spk_controls));
d218ea171430e4 Cyril Chao 2025-10-31  356  	if (ret) {
d218ea171430e4 Cyril Chao 2025-10-31  357  		dev_err(rtd->dev, "unable to add Dumb card controls, ret %d\n", ret);
d218ea171430e4 Cyril Chao 2025-10-31  358  		return ret;
d218ea171430e4 Cyril Chao 2025-10-31  359  	}
d218ea171430e4 Cyril Chao 2025-10-31  360  
d218ea171430e4 Cyril Chao 2025-10-31  361  	return 0;
d218ea171430e4 Cyril Chao 2025-10-31  362  }
d218ea171430e4 Cyril Chao 2025-10-31  363  

:::::: The code at line 347 was first introduced by commit
:::::: d218ea171430e49412804efb794942dd121a8032 ASoC: mediatek: mt8189: add machine driver with nau8825

:::::: TO: Cyril Chao <Cyril.Chao@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
