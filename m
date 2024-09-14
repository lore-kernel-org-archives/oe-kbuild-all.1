Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739EF208DA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 06:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726297012; cv=none; b=kHS0D5OPoghNqcwh9gq5L42sEgwvYV0vFo9k8o78SKtcv683v5GIDZzZqL/sQrenzoCcmkqOakycjJVIjmMtYffS+RKA4HJQ+yZFJECLD7V071YKwApGmLJTWcr7j3mpxuD65YK/C7n7X5x/5JfhQs9b1MTrhzSekLYUioHh+XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726297012; c=relaxed/simple;
	bh=eDBaGqKU2dCsIXwBlQSOjlGc3Zg1J1YjjX4P6XgENM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dxsbXq2G0jqHZRr8zhTx0ooyqx+sqgpS4IwC3LDCj1pK2GE5TKH3A21Xo4MLpwmgCH/n91KRYXSCCw5fUj45HfaEikZp2nW4VXsYQk/uKn745Wu2viu9dtjTfyqLSekEgNqPy3fJyU9sHMf1gql3Ud6j/pyVvDQF4Bn9deAC8ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSYwVjoN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSYwVjoN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726297009; x=1757833009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eDBaGqKU2dCsIXwBlQSOjlGc3Zg1J1YjjX4P6XgENM8=;
  b=QSYwVjoNnsSfmQgSfT4ePvwdw/7WwDciF6azVVhzJpP0RQKRx8GOQ+E4
   VlnddzgzmAOwkUMA99Yrdzh4ckhBJYeF9Q1OU4S4fsTVDSEPtwVXx6VPY
   crdmAHjm2famHopVBWK2Zp6fTt6Rq4rXCT8i7HNPHDPYNaAki55tf23+V
   O80krxHeKioarNEs7wWAr3PSL85dMwx3Pva3SqHfGV6HfDg53DUBJw0gR
   8YFWhCOH1gtSK5K00B3JNhX33Eu+ycSrwzE3Qbx981HO2qXtS9BVdtMVx
   RKL8rz+gNQnhW/+e8YIUguIJ0d0mLgaUw7J+AtHNDwNv6XengA5bpPTBl
   Q==;
X-CSE-ConnectionGUID: CikIHm+1QlSOMQ4+Ub8o7A==
X-CSE-MsgGUID: CQwU+GghTXe1yoqsVkIiHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35878463"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="35878463"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 23:56:48 -0700
X-CSE-ConnectionGUID: 7s4ZThTKT36znQnYvJrZuA==
X-CSE-MsgGUID: sW+SAfjqSoezGwRJFgRdcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68320762"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Sep 2024 23:56:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spMi5-0007TT-0c;
	Sat, 14 Sep 2024 06:56:45 +0000
Date: Sat, 14 Sep 2024 14:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-error-cleanup-2024-09-13 40/53]
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:67:30: warning:
 unused variable 'card'
Message-ID: <202409141419.aSGOvZxE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-error-cleanup-2024-09-13
head:   5e445c6c5142f8af742d327d3dc06bdadff2b0fa
commit: 3f4b948e884c0e0712c65c96cca438e6d0ea83b8 [40/53] ASoC: mediatek: don't indicate duplicate error message
config: arm64-randconfig-001-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141419.aSGOvZxE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141419.aSGOvZxE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141419.aSGOvZxE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c: In function 'mt8183_mt6358_rt1015_i2s_hw_params':
>> sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:67:30: warning: unused variable 'card' [-Wunused-variable]
      67 |         struct snd_soc_card *card = rtd->card;
         |                              ^~~~


vim +/card +67 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c

11c0269017b212 Shunli Wang       2019-03-29  58  
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  59  static int
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  60  mt8183_mt6358_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  61  				   struct snd_pcm_hw_params *params)
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  62  {
de9e70137f0068 Kuninori Morimoto 2023-09-26  63  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  64  	unsigned int rate = params_rate(params);
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  65  	unsigned int mclk_fs_ratio = 128;
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  66  	unsigned int mclk_fs = rate * mclk_fs_ratio;
f4fb4fef49664e Tzung-Bi Shih     2020-07-08 @67  	struct snd_soc_card *card = rtd->card;
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  68  	struct snd_soc_dai *codec_dai;
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  69  	int ret, i;
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  70  
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  71  	for_each_rtd_codec_dais(rtd, i, codec_dai) {
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  72  		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  73  				rate * 64, rate * 256);
3f4b948e884c0e Kuninori Morimoto 2024-09-11  74  		if (ret < 0)
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  75  			return ret;
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  76  
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  77  		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL,
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  78  				rate * 256, SND_SOC_CLOCK_IN);
3f4b948e884c0e Kuninori Morimoto 2024-09-11  79  		if (ret < 0)
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  80  			return ret;
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  81  	}
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  82  
de9e70137f0068 Kuninori Morimoto 2023-09-26  83  	return snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0),
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  84  				      0, mclk_fs, SND_SOC_CLOCK_OUT);
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  85  }
f4fb4fef49664e Tzung-Bi Shih     2020-07-08  86  

:::::: The code at line 67 was first introduced by commit
:::::: f4fb4fef49664e64f4f40e9e8db11f785fbc79a4 ASoC: mediatek: mt8183: support machine driver with rt1015

:::::: TO: Tzung-Bi Shih <tzungbi@google.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
