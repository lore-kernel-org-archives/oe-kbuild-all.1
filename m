Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E85F143C40
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 06:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726210421; cv=none; b=KwHTEzoDuqqy+H5iFNyyQxCv6mxsThGvcLSYhpf/KT7omR486Ppmtxkbv0hVQUS5kMqP2+tv0xyDIeIbE51bIJvLpTp9tRSKV3ocDmzx4LeuQ7RABItEXWzxRiIZu7OEmIjmTFdkobsTZMXiYEeoLMbLQDp3y45UIGACKg2ZiVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726210421; c=relaxed/simple;
	bh=WQk93mvnqjwm1/DvfLTddNKhO9HDwv0Lpnz3AEqjNHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T/4Oqy4XVJYMwduaiGPjv4tNRPG4nAMvt8/P0Q//urp9oc0AYm+28JmC1w2pPUu0ENsmtPceoS0oz+LEgdkKOi4Ndq6AS6uGNhbA0N2nZhjfKkA9Ah2qxfGveG2ToPU5fe3whulwiGnZixhKleX+e0fdv9g/gLKIDD8hKLlL1pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQJ60+MD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQJ60+MD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726210419; x=1757746419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WQk93mvnqjwm1/DvfLTddNKhO9HDwv0Lpnz3AEqjNHo=;
  b=YQJ60+MDAsvvZPiyMlqSD242/MEV82pJlJoqWWTvD0Ssb/bCN7+0jMU+
   GsNEH7ep7Vd81t64cSraLpoEdFbPjEbthRjH7FaaGlTNzy+arxeO0bx7q
   ylEtsvm9MEj0exeic3PQXiPnUpEtVLBNx5RGyQJYK7nDR0ChxGgJ0GNBQ
   qItqtHjulouhnXoS3Vrxv13HM6Ro/Q9SMX/NuuLk3Im/tSUCbo1QzALCV
   g4lHl70cwKKVhgAYs1EgbVABtmAF72J0l3LNL3XnAp30YuPoCVXyeEy6B
   BMECWy9PO6YzxNBds6n89SbVFVavRC19YxgIyIq0HrSz9eg1NcZiz9oIy
   g==;
X-CSE-ConnectionGUID: p6zwi5RaSa+n/4c7HNKb/g==
X-CSE-MsgGUID: N7fYoOWkRFyU4LRz1AO09Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28994326"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="28994326"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 23:53:38 -0700
X-CSE-ConnectionGUID: 9xtt+rlpSmCJzrjJQx7n4w==
X-CSE-MsgGUID: UVkpFAytT4GfRfcPilUbUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="67586527"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Sep 2024 23:53:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp0BT-000670-0v;
	Fri, 13 Sep 2024 06:53:35 +0000
Date: Fri, 13 Sep 2024 14:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-error-cleanup-2024-09-10 28/31]
 sound/soc/samsung/bells.c:60:13: warning: variable 'ret' set but not used
Message-ID: <202409131447.FLvWJUpQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-error-cleanup-2024-09-10
head:   df81764a514843b316e76c4bc95d2f97a31297f5
commit: 48eb712d3ed80d1d9f8968a16b721418cdfdf188 [28/31] snd_soc_component_set_pll
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240913/202409131447.FLvWJUpQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131447.FLvWJUpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131447.FLvWJUpQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/samsung/bells.c: In function 'bells_set_bias_level':
>> sound/soc/samsung/bells.c:60:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      60 |         int ret;
         |             ^~~


vim +/ret +60 sound/soc/samsung/bells.c

b1387078747294 Mark Brown        2012-10-02  51  
b545dd924b4ffa Mark Brown        2012-08-07  52  static int bells_set_bias_level(struct snd_soc_card *card,
b545dd924b4ffa Mark Brown        2012-08-07  53  				struct snd_soc_dapm_context *dapm,
b545dd924b4ffa Mark Brown        2012-08-07  54  				enum snd_soc_bias_level level)
b545dd924b4ffa Mark Brown        2012-08-07  55  {
5015920a1732ca Mengdong Lin      2015-11-18  56  	struct snd_soc_pcm_runtime *rtd;
5015920a1732ca Mengdong Lin      2015-11-18  57  	struct snd_soc_dai *codec_dai;
f4a2be1c559e53 Kuninori Morimoto 2017-12-05  58  	struct snd_soc_component *component;
b1387078747294 Mark Brown        2012-10-02  59  	struct bells_drvdata *bells = card->drvdata;
b545dd924b4ffa Mark Brown        2012-08-07 @60  	int ret;
b545dd924b4ffa Mark Brown        2012-08-07  61  
4468189ff307f2 Kuninori Morimoto 2019-12-10  62  	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_DSP_CODEC]);
21b6cd54c98efe Kuninori Morimoto 2023-09-11  63  	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
f4a2be1c559e53 Kuninori Morimoto 2017-12-05  64  	component = codec_dai->component;
5015920a1732ca Mengdong Lin      2015-11-18  65  
b545dd924b4ffa Mark Brown        2012-08-07  66  	if (dapm->dev != codec_dai->dev)
b545dd924b4ffa Mark Brown        2012-08-07  67  		return 0;
b545dd924b4ffa Mark Brown        2012-08-07  68  
b545dd924b4ffa Mark Brown        2012-08-07  69  	switch (level) {
b545dd924b4ffa Mark Brown        2012-08-07  70  	case SND_SOC_BIAS_PREPARE:
b1387078747294 Mark Brown        2012-10-02  71  		if (dapm->bias_level != SND_SOC_BIAS_STANDBY)
b1387078747294 Mark Brown        2012-10-02  72  			break;
b1387078747294 Mark Brown        2012-10-02  73  
f4a2be1c559e53 Kuninori Morimoto 2017-12-05  74  		ret = snd_soc_component_set_pll(component, WM5102_FLL1,
b545dd924b4ffa Mark Brown        2012-08-07  75  					    ARIZONA_FLL_SRC_MCLK1,
b545dd924b4ffa Mark Brown        2012-08-07  76  					    MCLK_RATE,
b1387078747294 Mark Brown        2012-10-02  77  					    bells->sysclk_rate);
b545dd924b4ffa Mark Brown        2012-08-07  78  
b1387078747294 Mark Brown        2012-10-02  79  		if (bells->asyncclk_rate) {
f4a2be1c559e53 Kuninori Morimoto 2017-12-05  80  			ret = snd_soc_component_set_pll(component, WM5102_FLL2,
b545dd924b4ffa Mark Brown        2012-08-07  81  						    ARIZONA_FLL_SRC_AIF2BCLK,
b545dd924b4ffa Mark Brown        2012-08-07  82  						    BCLK2_RATE,
b1387078747294 Mark Brown        2012-10-02  83  						    bells->asyncclk_rate);
b545dd924b4ffa Mark Brown        2012-08-07  84  		}
b545dd924b4ffa Mark Brown        2012-08-07  85  		break;
b545dd924b4ffa Mark Brown        2012-08-07  86  
b545dd924b4ffa Mark Brown        2012-08-07  87  	default:
b545dd924b4ffa Mark Brown        2012-08-07  88  		break;
b545dd924b4ffa Mark Brown        2012-08-07  89  	}
b545dd924b4ffa Mark Brown        2012-08-07  90  
b545dd924b4ffa Mark Brown        2012-08-07  91  	return 0;
b545dd924b4ffa Mark Brown        2012-08-07  92  }
b545dd924b4ffa Mark Brown        2012-08-07  93  

:::::: The code at line 60 was first introduced by commit
:::::: b545dd924b4ffaf1e4fdd73fe7e9b6eb01e45aea ASoC: bells: Add machine driver for Wolfson Bells boards

:::::: TO: Mark Brown <broonie@opensource.wolfsonmicro.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
