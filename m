Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3DA38E8DF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781341826; cv=none; b=UjnuU57SGTiEeIptVwV2iCvvU8yDixLuzDenDfqiVJQQ7aKoXYunGkZ88YbRZ9gznzu0VyUBtJLDnpQZmWxNHk3eCBM3emBViihWcbIFYc0fswvb1cajoWk/NH31Le/xJ/XPxZ3EDpu3pQPQy/kMecJW9YIv/TFj0IdP82dBWdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781341826; c=relaxed/simple;
	bh=dDwG04ibxjQXVpgPpEZs+Y30Z70h2ZUEQxPwKUfb+HA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mnmT1xM2GOM7ETzEtPhIVHCXymYEZ8+gu8eM7Ll7+IYan4BthbBufDafAb4M/G5R8n1PhWz9/axnqsC8Bnqb5ceen7zSTpGQaneBsBNpK78E9bwMuVQeYxQm+HX2aPGPuo+kzSY2adymeS2lT02z/UG0YI/XR4sbNzedb6pqnJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igaJsuan; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igaJsuan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781341825; x=1812877825;
  h=date:from:to:cc:subject:message-id;
  bh=dDwG04ibxjQXVpgPpEZs+Y30Z70h2ZUEQxPwKUfb+HA=;
  b=igaJsuan8uKDMck0nL139q22Rx2ztV3XE+92q7ka09+U9RVtQfwNopAL
   cY2HFYpan5d+6G7+4P8KaC6DWYFLLhHYkqPhKZpIKGNJzXhQBkAwyF3cD
   /hS9UwnuWEbqkfwyqKJeWKjLUGVwG8YcIn9vavip/mm/wu7Cymw/H04xx
   ewMNOyyofTVNFOcBJhfp6lGTcptsA0wyZFVpUWz4lMYrASw7gUBDS5WG4
   bqOfKAt3eZp+jc4L1Pg6JlehM0xTbbDEqWkvrOFQCguHEJ60ZHu6kpvNR
   Q+SjDPhEuoTWPbxBa0wz48laGXWXy8YC2l20F0Wik3YCDgD2qQACUQHmZ
   Q==;
X-CSE-ConnectionGUID: KO6enGHuQwCAZ4NT5XmP0A==
X-CSE-MsgGUID: OczKsKhQT7W34yNq2dqH3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="99582151"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="99582151"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 02:10:24 -0700
X-CSE-ConnectionGUID: RKE7PJX+S9Kn6FNCw2XuWA==
X-CSE-MsgGUID: EHc0rFeyQGODqHiT5nwY8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="244609449"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2026 02:10:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYKNf-00000000PpO-46lE;
	Sat, 13 Jun 2026 09:10:19 +0000
Date: Sat, 13 Jun 2026 17:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [superna9999:topic/sm8650/ayaneo-pocket-s2/pmos-v4 24/31]
 sound/soc/qcom/sc8280xp.c:176:48: error: 'LPAIF_MI2S_MCLK' undeclared; did
 you mean 'LPAIF_DIG_CLK'?
Message-ID: <202606131748.RtozIxJD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/superna9999/linux topic/sm8650/ayaneo-pocket-s2/pmos-v4
head:   2990bb85e68d401720ce49038f3e512d7eb1a389
commit: 82a9dc5108c057c67137a9d9bcab231d4989eccf [24/31] ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp: enhance machine driver for board-specific config
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260613/202606131748.RtozIxJD-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131748.RtozIxJD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131748.RtozIxJD-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/qcom/sc8280xp.c: In function 'sc8280xp_snd_hw_params':
>> sound/soc/qcom/sc8280xp.c:176:48: error: 'LPAIF_MI2S_MCLK' undeclared (first use in this function); did you mean 'LPAIF_DIG_CLK'?
     176 |                                                LPAIF_MI2S_MCLK, mclk_freq,
         |                                                ^~~~~~~~~~~~~~~
         |                                                LPAIF_DIG_CLK
   sound/soc/qcom/sc8280xp.c:176:48: note: each undeclared identifier is reported only once for each function it appears in
>> sound/soc/qcom/sc8280xp.c:181:48: error: 'LPAIF_MI2S_BCLK' undeclared (first use in this function); did you mean 'LPAIF_DIG_CLK'?
     181 |                                                LPAIF_MI2S_BCLK, bclk_freq,
         |                                                ^~~~~~~~~~~~~~~
         |                                                LPAIF_DIG_CLK


vim +176 sound/soc/qcom/sc8280xp.c

   154	
   155	static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
   156					  struct snd_pcm_hw_params *params)
   157	{
   158		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
   159		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
   160		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
   161		struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
   162		int mclk_freq = sc8280xp_get_mclk_freq(params);
   163		int bclk_freq = sc8280xp_get_bclk_freq(params);
   164	
   165		switch (cpu_dai->id) {
   166		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
   167		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
   168			snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
   169	
   170			if (data->snd_soc_common_priv->codec_dai_fmt)
   171				snd_soc_dai_set_fmt(codec_dai,
   172						    data->snd_soc_common_priv->codec_dai_fmt);
   173	
   174			if (data->snd_soc_common_priv->mi2s_mclk_enable)
   175				snd_soc_dai_set_sysclk(cpu_dai,
 > 176						       LPAIF_MI2S_MCLK, mclk_freq,
   177						       SND_SOC_CLOCK_IN);
   178	
   179			if (data->snd_soc_common_priv->mi2s_bclk_enable)
   180				snd_soc_dai_set_sysclk(cpu_dai,
 > 181						       LPAIF_MI2S_BCLK, bclk_freq,
   182						       SND_SOC_CLOCK_IN);
   183	
   184			if (data->snd_soc_common_priv->codec_sysclk_set)
   185				snd_soc_dai_set_sysclk(cpu_dai,
   186						       0, mclk_freq,
   187						       SND_SOC_CLOCK_IN);
   188			break;
   189		default:
   190			break;
   191		}
   192	
   193		return 0;
   194	}
   195	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
