Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6EB101C8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727625698; cv=none; b=Uu05pwY9/ID92sKZ0oiYnStYGuy/70699KwvB1GCvEKT31OcGSk8osWWRybg3DDR+SSAkxWIIlFCRTkiSc90dW2aiMrnIzIrsXMd5JMVxuSqDDUWCJa5w/44Jp+Rkae9JvEZIec/BQcps7RNGzuwnCTgksG6h7l4Nex3phyJYEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727625698; c=relaxed/simple;
	bh=hKqaFZhqUuvJIeVTsLp1gxFr9L1cwBHFxNJ+euEDmUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=osnEiR8pGHtUgtQWjNCNopUk6KILoznuykrPkZ5q+LwLqzg1xlBymMVKsMj8ZXWoGU/hichWNlfYKv25QAwrQMD3sgIxenUITdvXCCvHjixLxnm0Np467m/xI78VFLiM+UylZH2IHB1OWMQnE/9MaynMEyd9BTNBL357Brtbj34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eG9aNSgN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eG9aNSgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727625697; x=1759161697;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hKqaFZhqUuvJIeVTsLp1gxFr9L1cwBHFxNJ+euEDmUQ=;
  b=eG9aNSgNWhsaQcl35INiJcV52xGZg9X1f0ruqLn+LJ8MYpUuBPD4Poy6
   qCaGfEviJ9NOfYjAWHaJnPI/8C/fKUNRUQ06eyenvuf7sUJHWa2OxYvvb
   huDGU9Gqq6EtbZrWkZTYdROLjPxhXlDCLo52UL5urU/D3JrAZiaR6hbJa
   /mrERZ4sVPLEFmt8FJA6KpsfnIAPl38n/jOgC0qXpmhEgs+uBVBMneX3o
   PnC5zQ0svpxztaxhU7trFN6AqukvnmCWNqUDM4USuV/76aHmKndW13uIV
   tRDhENMu3sHkkNTmRwOsWc6ESsB+4YjDooKKZrRhABwRiyUiaBs7Q1skc
   g==;
X-CSE-ConnectionGUID: dIk5pAYEQK2O+iU4vusr0w==
X-CSE-MsgGUID: 3lsh52ciSuOVDsiV0uzljw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26807522"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26807522"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 09:01:36 -0700
X-CSE-ConnectionGUID: bEgnRxa3SAiNdiS6qeof1w==
X-CSE-MsgGUID: DS2NpUcmTvKhHijZsDh8yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="72628802"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 09:01:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suwMW-000OPb-0i;
	Sun, 29 Sep 2024 16:01:32 +0000
Date: Mon, 30 Sep 2024 00:01:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-error-cleanup-2024-09-25 52/68]
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:65:30: warning:
 unused variable 'card'
Message-ID: <202409292340.8ncHg5Cb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/morimoto/linux sound-error-cleanup-2024-09-25
head:   bacff4357282f2214245fbe247ea5bda645fa045
commit: 979669a4a46d8e171b8e126793457c5bd5096202 [52/68] ASoC: mediatek: don't indicate duplicate error message
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240929/202409292340.8ncHg5Cb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409292340.8ncHg5Cb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292340.8ncHg5Cb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c: In function 'mt8192_rt1015_i2s_hw_params':
>> sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:65:30: warning: unused variable 'card' [-Wunused-variable]
      65 |         struct snd_soc_card *card = rtd->card;
         |                              ^~~~


vim +/card +65 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c

194ff8db03782d Nícolas F. R. A. Prado 2022-09-22  60  
18b13ff23fab34 Jiaxin Yu              2020-11-03  61  static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
18b13ff23fab34 Jiaxin Yu              2020-11-03  62  				       struct snd_pcm_hw_params *params)
18b13ff23fab34 Jiaxin Yu              2020-11-03  63  {
de9e70137f0068 Kuninori Morimoto      2023-09-26  64  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
18b13ff23fab34 Jiaxin Yu              2020-11-03 @65  	struct snd_soc_card *card = rtd->card;
de9e70137f0068 Kuninori Morimoto      2023-09-26  66  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
18b13ff23fab34 Jiaxin Yu              2020-11-03  67  	struct snd_soc_dai *codec_dai;
18b13ff23fab34 Jiaxin Yu              2020-11-03  68  	unsigned int rate = params_rate(params);
18b13ff23fab34 Jiaxin Yu              2020-11-03  69  	unsigned int mclk_fs_ratio = 128;
18b13ff23fab34 Jiaxin Yu              2020-11-03  70  	unsigned int mclk_fs = rate * mclk_fs_ratio;
18b13ff23fab34 Jiaxin Yu              2020-11-03  71  	int ret, i;
18b13ff23fab34 Jiaxin Yu              2020-11-03  72  
18b13ff23fab34 Jiaxin Yu              2020-11-03  73  	for_each_rtd_codec_dais(rtd, i, codec_dai) {
18b13ff23fab34 Jiaxin Yu              2020-11-03  74  		ret = snd_soc_dai_set_pll(codec_dai, 0,
18b13ff23fab34 Jiaxin Yu              2020-11-03  75  					  RT1015_PLL_S_BCLK,
18b13ff23fab34 Jiaxin Yu              2020-11-03  76  					  params_rate(params) * 64,
18b13ff23fab34 Jiaxin Yu              2020-11-03  77  					  params_rate(params) * 256);
979669a4a46d8e Kuninori Morimoto      2024-09-11  78  		if (ret)
18b13ff23fab34 Jiaxin Yu              2020-11-03  79  			return ret;
18b13ff23fab34 Jiaxin Yu              2020-11-03  80  
18b13ff23fab34 Jiaxin Yu              2020-11-03  81  		ret = snd_soc_dai_set_sysclk(codec_dai,
18b13ff23fab34 Jiaxin Yu              2020-11-03  82  					     RT1015_SCLK_S_PLL,
18b13ff23fab34 Jiaxin Yu              2020-11-03  83  					     params_rate(params) * 256,
18b13ff23fab34 Jiaxin Yu              2020-11-03  84  					     SND_SOC_CLOCK_IN);
979669a4a46d8e Kuninori Morimoto      2024-09-11  85  		if (ret)
18b13ff23fab34 Jiaxin Yu              2020-11-03  86  			return ret;
18b13ff23fab34 Jiaxin Yu              2020-11-03  87  	}
18b13ff23fab34 Jiaxin Yu              2020-11-03  88  
18b13ff23fab34 Jiaxin Yu              2020-11-03  89  	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs, SND_SOC_CLOCK_OUT);
18b13ff23fab34 Jiaxin Yu              2020-11-03  90  }
18b13ff23fab34 Jiaxin Yu              2020-11-03  91  

:::::: The code at line 65 was first introduced by commit
:::::: 18b13ff23fab34a9d35cec60ed19aceab61dc3f9 ASoC: mediatek: mt8192: add machine driver with mt6359, rt1015 and rt5682

:::::: TO: Jiaxin Yu <jiaxin.yu@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
