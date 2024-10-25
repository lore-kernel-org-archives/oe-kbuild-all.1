Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDF51F8F0E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 10:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853887; cv=none; b=hRraiMR9slcT/yKVGSDqEJ07JJ1xhugmeg9aq9P/qaWkqp2LCeKEHD13cr0n1OJZekTbKbmH5WanEgB7WHX/DQBVLodHREhRJvq8KA4eXjkLVnvPyoegoRYs35LsXleOl10p87ehiYUNAr/5ktDaFNyM9f3ghaxl24lwr/wxly8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853887; c=relaxed/simple;
	bh=91I8XU+uq2JmK6CydRpMWErGl/W4i0CArW181UtzP2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CmOmMb07TjYkRFMh5KGRO98sCQihX6bXUUSDcbkVbHcSFn0J0SPUXJxPeCwQKeqwVH6zECEAXZjSSVPOJ/B43PxZ2sDzLHDaSTPriuoRZo/1bGgU/UU2L72UTg5uZFrgtDZYZkNBJuJniH4W/AF1CBethXSVEd5O00SKto2ZDQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EO2CLLcX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EO2CLLcX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729853884; x=1761389884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=91I8XU+uq2JmK6CydRpMWErGl/W4i0CArW181UtzP2A=;
  b=EO2CLLcXHDVPNqH8GNvJOruaU70CCDwJ6t9VUf8Kt5QUhbSyQsOsyVxs
   oT3h1zA68fHuhDW00gEUzrXCLAruybNuuXnEJfR9rvKYAaK4bG+RlZEC3
   SPvtUuzg7+MXN+XBp+nIlHfSIOR8wJ6XJsukrYB8b7UxU/jnhiFfyCyyP
   k5Bb/V1arakk4cWPwNzsbNE+dsfZUfhqa555NpIAGqIN8qC4OCHHkE27S
   yV6xJ2mMoiCRYJtsoW3mWYS+Y/q83s/0BpqycFDTDsKW/RDvc8g7spLMA
   W0RhUTkZxE0yIXqs3vKE/OFGnxLj4GfNxJtgrqoImohi764To1hORBA7C
   g==;
X-CSE-ConnectionGUID: YmQocjmrSwGMkZH5v+LxhA==
X-CSE-MsgGUID: SImQ6/+QSXSMkBTdhwwDDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46982905"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46982905"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 03:58:03 -0700
X-CSE-ConnectionGUID: DSY4qDCmTIataCQUlbec1Q==
X-CSE-MsgGUID: BWantV6sSB+NfsGo6HdTQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85650452"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Oct 2024 03:57:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4I0x-000Y4s-1Q;
	Fri, 25 Oct 2024 10:57:55 +0000
Date: Fri, 25 Oct 2024 18:57:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-pcmv2-2024-10-22 3/3] sound/soc/soc-dapm.c:1088:55:
 error: initialization of 'struct snd_soc_dai_link1 *' from 'int' makes
 pointer from integer without a cast
Message-ID: <202410251815.pQzhYUm3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-pcmv2-2024-10-22
head:   ad08834668b453f25c4d160e515f18b8f3d5fd39
commit: ad08834668b453f25c4d160e515f18b8f3d5fd39 [3/3] rtd1 / dai_link1
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241025/202410251815.pQzhYUm3-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251815.pQzhYUm3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251815.pQzhYUm3-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-dapm.c: In function 'dapm_new_dai_link':
   sound/soc/soc-dapm.c:1086:20: error: 'struct snd_soc_pcm_runtime' has no member named 'version'
    1086 |         switch (rtd->version) {
         |                    ^~
   sound/soc/soc-dapm.c:1088:55: error: implicit declaration of function 'snd_soc_dai_link_to_link1'; did you mean 'snd_soc_link_to_codec'? [-Wimplicit-function-declaration]
    1088 |                 struct snd_soc_dai_link1 *dai_link1 = snd_soc_dai_link_to_link1(rtd->dai_link);
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                       snd_soc_link_to_codec
>> sound/soc/soc-dapm.c:1088:55: error: initialization of 'struct snd_soc_dai_link1 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/soc-dapm.c:1090:34: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
    1090 |                 if (rtd->dai_link->num_c2c_params <= 1)
         |                                  ^~
   sound/soc/soc-dapm.c:1088:43: warning: unused variable 'dai_link1' [-Wunused-variable]
    1088 |                 struct snd_soc_dai_link1 *dai_link1 = snd_soc_dai_link_to_link1(rtd->dai_link);
         |                                           ^~~~~~~~~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_mux_update_power':
   sound/soc/soc-dapm.c:2381:17: error: implicit declaration of function 'snd_soc_dpcm_runtime_update' [-Wimplicit-function-declaration]
    2381 |                 snd_soc_dpcm_runtime_update(card);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_dai_link_get':
   sound/soc/soc-dapm.c:3984:45: error: implicit declaration of function 'snd_soc_rtd_to_rtd1'; did you mean 'snd_soc_rtd_to_cpu'? [-Wimplicit-function-declaration]
    3984 |         struct snd_soc_pcm_runtime1 *rtd1 = snd_soc_rtd_to_rtd1(rtd);
         |                                             ^~~~~~~~~~~~~~~~~~~
         |                                             snd_soc_rtd_to_cpu
>> sound/soc/soc-dapm.c:3984:45: error: initialization of 'struct snd_soc_pcm_runtime1 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/soc-dapm.c:3986:50: error: invalid use of undefined type 'struct snd_soc_pcm_runtime1'
    3986 |         ucontrol->value.enumerated.item[0] = rtd1->c2c_params_select;
         |                                                  ^~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_dai_link_put':
   sound/soc/soc-dapm.c:3996:45: error: initialization of 'struct snd_soc_pcm_runtime1 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    3996 |         struct snd_soc_pcm_runtime1 *rtd1 = snd_soc_rtd_to_rtd1(rtd);
         |                                             ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c:3997:47: error: initialization of 'struct snd_soc_dai_link1 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    3997 |         struct snd_soc_dai_link1 *dai_link1 = snd_soc_dai_link_to_link1(rtd->dai_link);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c:4003:55: error: invalid use of undefined type 'struct snd_soc_pcm_runtime1'
    4003 |         if (ucontrol->value.enumerated.item[0] == rtd1->c2c_params_select)
         |                                                       ^~
   sound/soc/soc-dapm.c:4006:60: error: invalid use of undefined type 'struct snd_soc_dai_link1'
    4006 |         if (ucontrol->value.enumerated.item[0] >= dai_link1->num_c2c_params)
         |                                                            ^~
   sound/soc/soc-dapm.c:4009:13: error: invalid use of undefined type 'struct snd_soc_pcm_runtime1'
    4009 |         rtd1->c2c_params_select = ucontrol->value.enumerated.item[0];
         |             ^~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_new_dai':
   sound/soc/soc-dapm.c:4106:73: error: 'dai_link' undeclared (first use in this function); did you mean 'dai_link1'?
    4106 |         struct snd_soc_dai_link1 *dai_link1 = snd_soc_dai_link_to_link1(dai_link);
         |                                                                         ^~~~~~~~
         |                                                                         dai_link1
   sound/soc/soc-dapm.c:4106:73: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/soc-dapm.c:4125:26: error: 'struct snd_soc_dai_link' has no member named 'num_c2c_params'
    4125 |         if (rtd->dai_link->num_c2c_params > 1) {
         |                          ^~
   sound/soc/soc-dapm.c:4127:54: error: invalid use of undefined type 'struct snd_soc_dai_link1'
    4127 |                                             dai_link1->num_c2c_params,
         |                                                      ^~
   sound/soc/soc-dapm.c:4134:70: error: invalid use of undefined type 'struct snd_soc_dai_link1'
    4134 |                                                             dai_link1->c2c_params,
         |                                                                      ^~
   sound/soc/soc-dapm.c:4135:70: error: invalid use of undefined type 'struct snd_soc_dai_link1'
    4135 |                                                             dai_link1->num_c2c_params,
         |                                                                      ^~
   sound/soc/soc-dapm.c:4166:45: error: invalid use of undefined type 'struct snd_soc_dai_link1'
    4166 |                                    dai_link1->num_c2c_params, w_param_text);
         |                                             ^~
   sound/soc/soc-dapm.c: In function 'dapm_connect_dai_pair':
   sound/soc/soc-dapm.c:4310:47: error: initialization of 'struct snd_soc_dai_link1 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    4310 |         struct snd_soc_dai_link1 *dai_link1 = snd_soc_dai_link_to_link1(dai_link);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c:4311:45: error: initialization of 'struct snd_soc_pcm_runtime1 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    4311 |         struct snd_soc_pcm_runtime1 *rtd1 = snd_soc_rtd_to_rtd1(rtd);
         |                                             ^~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c:4334:30: error: invalid use of undefined type 'struct snd_soc_dai_link1'
    4334 |                 if (dai_link1->c2c_params && !rtd1->c2c_widget[stream]) {
         |                              ^~
   sound/soc/soc-dapm.c:4334:51: error: invalid use of undefined type 'struct snd_soc_pcm_runtime1'
    4334 |                 if (dai_link1->c2c_params && !rtd1->c2c_widget[stream]) {
         |                                                   ^~
   sound/soc/soc-dapm.c:4342:29: error: invalid use of undefined type 'struct snd_soc_pcm_runtime1'
    4342 |                         rtd1->c2c_widget[stream] = dai;
         |                             ^~
   sound/soc/soc-dapm.c:4346:45: error: invalid use of undefined type 'struct snd_soc_pcm_runtime1'
    4346 |                                         rtd1->c2c_widget[stream],
         |                                             ^~
   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_connect_dai_link_widgets':
   sound/soc/soc-dapm.c:4404:34: error: 'struct snd_soc_dai_link' has no member named 'dynamic'
    4404 |                 if (rtd->dai_link->dynamic)
         |                                  ^~
--
   sound/soc/fsl/fsl-asoc-card.c:320:18: error: 'const struct snd_soc_dai_link' has no member named 'dpcm_playback'
     320 |                 .dpcm_playback = 1,
         |                  ^~~~~~~~~~~~~
   sound/soc/fsl/fsl-asoc-card.c:321:18: error: 'const struct snd_soc_dai_link' has no member named 'dpcm_capture'
     321 |                 .dpcm_capture = 1,
         |                  ^~~~~~~~~~~~
>> sound/soc/fsl/fsl-asoc-card.c:321:33: error: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     321 |                 .dpcm_capture = 1,
         |                                 ^
   sound/soc/fsl/fsl-asoc-card.c:321:33: note: (near initialization for 'fsl_asoc_card_dai[1].version_data')
   sound/soc/fsl/fsl-asoc-card.c:322:18: error: 'const struct snd_soc_dai_link' has no member named 'dynamic'
     322 |                 .dynamic = 1,
         |                  ^~~~~~~
   sound/soc/fsl/fsl-asoc-card.c:322:28: error: initialization of 'struct snd_soc_dai_link_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     322 |                 .dynamic = 1,
         |                            ^
   sound/soc/fsl/fsl-asoc-card.c:322:28: note: (near initialization for 'fsl_asoc_card_dai[1].cpus')
   sound/soc/fsl/fsl-asoc-card.c:329:18: error: 'const struct snd_soc_dai_link' has no member named 'dpcm_playback'
     329 |                 .dpcm_playback = 1,
         |                  ^~~~~~~~~~~~~
   sound/soc/fsl/fsl-asoc-card.c:330:18: error: 'const struct snd_soc_dai_link' has no member named 'dpcm_capture'
     330 |                 .dpcm_capture = 1,
         |                  ^~~~~~~~~~~~
   sound/soc/fsl/fsl-asoc-card.c:331:18: error: 'const struct snd_soc_dai_link' has no member named 'no_pcm'
     331 |                 .no_pcm = 1,
         |                  ^~~~~~
   sound/soc/fsl/fsl-asoc-card.c: In function 'fsl_asoc_card_spdif_init':
   sound/soc/fsl/fsl-asoc-card.c:507:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     507 |                 priv->dai_link[1].dpcm_capture = false;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:508:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     508 |                 priv->dai_link[2].dpcm_capture = false;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:512:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
     512 |                 priv->dai_link[1].dpcm_playback = false;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:513:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
     513 |                 priv->dai_link[2].dpcm_playback = false;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c: In function 'fsl_asoc_card_probe':
   sound/soc/fsl/fsl-asoc-card.c:767:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     767 |                 priv->dai_link[1].dpcm_capture = 0;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:768:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     768 |                 priv->dai_link[2].dpcm_capture = 0;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:794:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     794 |                 priv->dai_link[1].dpcm_capture = 0;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:795:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     795 |                 priv->dai_link[2].dpcm_capture = 0;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:801:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     801 |                 priv->dai_link[1].dpcm_capture = 0;
         |                                  ^
   sound/soc/fsl/fsl-asoc-card.c:802:34: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     802 |                 priv->dai_link[2].dpcm_capture = 0;
         |                                  ^
--
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:647:18: error: 'struct snd_soc_dai_link' has no member named 'trigger'
     647 |                 .trigger = {SND_SOC_DPCM_TRIGGER_PRE,
         |                  ^~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:647:17: warning: braces around scalar initializer
     647 |                 .trigger = {SND_SOC_DPCM_TRIGGER_PRE,
         |                 ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:647:17: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_dai_links[0].version')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:647:29: error: 'SND_SOC_DPCM_TRIGGER_PRE' undeclared here (not in a function); did you mean 'SND_SOC_DAPM_MIXER_E'?
     647 |                 .trigger = {SND_SOC_DPCM_TRIGGER_PRE,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~
         |                             SND_SOC_DAPM_MIXER_E
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:648:29: warning: excess elements in scalar initializer
     648 |                             SND_SOC_DPCM_TRIGGER_PRE},
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:648:29: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_dai_links[0].version')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:649:18: error: 'struct snd_soc_dai_link' has no member named 'dynamic'
     649 |                 .dynamic = 1,
         |                  ^~~~~~~
>> sound/soc/mediatek/mt8186/mt8186-mt6366.c:649:28: error: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     649 |                 .dynamic = 1,
         |                            ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:649:28: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_dai_links[0].version_data')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:650:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
     650 |                 .dpcm_playback = 1,
         |                  ^~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:650:34: error: initialization of 'struct snd_soc_dai_link_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     650 |                 .dpcm_playback = 1,
         |                                  ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:650:34: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_dai_links[0].cpus')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:651:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_merged_format'
     651 |                 .dpcm_merged_format = 1,
         |                  ^~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:652:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_merged_chan'
     652 |                 .dpcm_merged_chan = 1,
         |                  ^~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:652:37: error: initialization of 'struct snd_soc_dai_link_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     652 |                 .dpcm_merged_chan = 1,
         |                                     ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:652:37: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_dai_links[0].codecs')
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:653:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_merged_rate'
     653 |                 .dpcm_merged_rate = 1,
         |                  ^~~~~~~~~~~~~~~~
   In file included from sound/soc/mediatek/mt8186/mt8186-mt6366.c:20:
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:655:37: warning: initialized field overwritten [-Woverride-init]
     655 |                 SND_SOC_DAILINK_REG(playback1),
         |                                     ^~~~~~~~~
   include/sound/soc.h:921:27: note: in definition of macro 'SND_SOC_DAILINK_REG3'
     921 |         .cpus           = cpu,                          \
         |                           ^~~
   include/linux/args.h:25:24: note: in expansion of macro 'SND_SOC_DAILINK_REG1'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:655:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     655 |                 SND_SOC_DAILINK_REG(playback1),
         |                 ^~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:655:37: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_dai_links[0].cpus')
     655 |                 SND_SOC_DAILINK_REG(playback1),
         |                                     ^~~~~~~~~
   include/sound/soc.h:921:27: note: in definition of macro 'SND_SOC_DAILINK_REG3'
     921 |         .cpus           = cpu,                          \
         |                           ^~~
   include/linux/args.h:25:24: note: in expansion of macro 'SND_SOC_DAILINK_REG1'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:655:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     655 |                 SND_SOC_DAILINK_REG(playback1),
         |                 ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:16,
                    from include/linux/cpumask.h:11,
                    from arch/loongarch/include/asm/processor.h:9,
                    from arch/loongarch/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:6,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/input.h:19,
                    from sound/soc/mediatek/mt8186/mt8186-mt6366.c:14:
   include/linux/array_size.h:11:25: warning: initialized field overwritten [-Woverride-init]
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                         ^
   include/sound/soc.h:922:27: note: in expansion of macro 'ARRAY_SIZE'
     922 |         .num_cpus       = ARRAY_SIZE(cpu),              \
         |                           ^~~~~~~~~~
   include/sound/soc.h:918:42: note: in expansion of macro 'SND_SOC_DAILINK_REG3'
     918 | #define SND_SOC_DAILINK_REG1(name)       SND_SOC_DAILINK_REG3(name##_cpus, name##_codecs, name##_platforms)
         |                                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro 'SND_SOC_DAILINK_REG1'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/sound/soc.h:929:9: note: in expansion of macro 'CONCATENATE'
     929 |         CONCATENATE(SND_SOC_DAILINK_REG, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
         |         ^~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366.c:655:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     655 |                 SND_SOC_DAILINK_REG(playback1),
         |                 ^~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:25: note: (near initialization for 'mt8186_mt6366_rt1019_rt5682s_dai_links[0].num_cpus')
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                         ^
   include/sound/soc.h:922:27: note: in expansion of macro 'ARRAY_SIZE'
     922 |         .num_cpus       = ARRAY_SIZE(cpu),              \
         |                           ^~~~~~~~~~
   include/sound/soc.h:918:42: note: in expansion of macro 'SND_SOC_DAILINK_REG3'
     918 | #define SND_SOC_DAILINK_REG1(name)       SND_SOC_DAILINK_REG3(name##_cpus, name##_codecs, name##_platforms)
         |                                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro 'SND_SOC_DAILINK_REG1'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/sound/soc.h:929:9: note: in expansion of macro 'CONCATENATE'
     929 |         CONCATENATE(SND_SOC_DAILINK_REG, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
         |         ^~~~~~~~~~~
--
   sound/soc/intel/boards/bdw_rt286.c:133:18: error: 'struct snd_soc_dai_link' has no member named 'nonatomic'
     133 |                 .nonatomic = 1,
         |                  ^~~~~~~~~
   sound/soc/intel/boards/bdw_rt286.c:134:18: error: 'struct snd_soc_dai_link' has no member named 'dynamic'
     134 |                 .dynamic = 1,
         |                  ^~~~~~~
>> sound/soc/intel/boards/bdw_rt286.c:134:28: error: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     134 |                 .dynamic = 1,
         |                            ^
   sound/soc/intel/boards/bdw_rt286.c:134:28: note: (near initialization for 'card_dai_links[0].version_data')
   sound/soc/intel/boards/bdw_rt286.c:135:18: error: 'struct snd_soc_dai_link' has no member named 'trigger'
     135 |                 .trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
         |                  ^~~~~~~
   sound/soc/intel/boards/bdw_rt286.c:135:17: warning: braces around scalar initializer
     135 |                 .trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
         |                 ^
   sound/soc/intel/boards/bdw_rt286.c:135:17: note: (near initialization for 'card_dai_links[0].cpus')
   sound/soc/intel/boards/bdw_rt286.c:135:29: error: 'SND_SOC_DPCM_TRIGGER_POST' undeclared here (not in a function); did you mean 'SND_SOC_DAPM_DIR_OUT'?
     135 |                 .trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                             SND_SOC_DAPM_DIR_OUT
   sound/soc/intel/boards/bdw_rt286.c:135:56: warning: excess elements in scalar initializer
     135 |                 .trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/bdw_rt286.c:135:56: note: (near initialization for 'card_dai_links[0].cpus')
   sound/soc/intel/boards/bdw_rt286.c:136:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_playback'
     136 |                 .dpcm_playback = 1,
         |                  ^~~~~~~~~~~~~
   sound/soc/intel/boards/bdw_rt286.c:137:18: error: 'struct snd_soc_dai_link' has no member named 'dpcm_capture'
     137 |                 .dpcm_capture = 1,
         |                  ^~~~~~~~~~~~
   sound/soc/intel/boards/bdw_rt286.c:137:33: error: initialization of 'struct snd_soc_dai_link_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     137 |                 .dpcm_capture = 1,
         |                                 ^
   sound/soc/intel/boards/bdw_rt286.c:137:33: note: (near initialization for 'card_dai_links[0].codecs')
   In file included from include/linux/kernel.h:16,
                    from include/linux/cpumask.h:11,
                    from arch/loongarch/include/asm/processor.h:9,
                    from arch/loongarch/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/loongarch/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from sound/soc/intel/boards/bdw_rt286.c:8:
   include/linux/array_size.h:11:25: warning: initialized field overwritten [-Woverride-init]
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                         ^
   include/sound/soc.h:922:27: note: in expansion of macro 'ARRAY_SIZE'
     922 |         .num_cpus       = ARRAY_SIZE(cpu),              \
         |                           ^~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro 'SND_SOC_DAILINK_REG3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/sound/soc.h:929:9: note: in expansion of macro 'CONCATENATE'
     929 |         CONCATENATE(SND_SOC_DAILINK_REG, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
         |         ^~~~~~~~~~~
   sound/soc/intel/boards/bdw_rt286.c:138:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     138 |                 SND_SOC_DAILINK_REG(system, dummy, platform),
         |                 ^~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:25: note: (near initialization for 'card_dai_links[0].num_cpus')
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                         ^
   include/sound/soc.h:922:27: note: in expansion of macro 'ARRAY_SIZE'
     922 |         .num_cpus       = ARRAY_SIZE(cpu),              \
         |                           ^~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro 'SND_SOC_DAILINK_REG3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/sound/soc.h:929:9: note: in expansion of macro 'CONCATENATE'
     929 |         CONCATENATE(SND_SOC_DAILINK_REG, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
         |         ^~~~~~~~~~~
   sound/soc/intel/boards/bdw_rt286.c:138:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     138 |                 SND_SOC_DAILINK_REG(system, dummy, platform),
         |                 ^~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/intel/boards/bdw_rt286.c:14:
   sound/soc/intel/boards/bdw_rt286.c:138:45: warning: initialized field overwritten [-Woverride-init]
     138 |                 SND_SOC_DAILINK_REG(system, dummy, platform),
         |                                             ^~~~~
   include/sound/soc.h:923:27: note: in definition of macro 'SND_SOC_DAILINK_REG3'
     923 |         .codecs         = codec,                        \
         |                           ^~~~~
   sound/soc/intel/boards/bdw_rt286.c:138:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     138 |                 SND_SOC_DAILINK_REG(system, dummy, platform),
         |                 ^~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/bdw_rt286.c:138:45: note: (near initialization for 'card_dai_links[0].codecs')
     138 |                 SND_SOC_DAILINK_REG(system, dummy, platform),
         |                                             ^~~~~
   include/sound/soc.h:923:27: note: in definition of macro 'SND_SOC_DAILINK_REG3'
     923 |         .codecs         = codec,                        \
         |                           ^~~~~
   sound/soc/intel/boards/bdw_rt286.c:138:17: note: in expansion of macro 'SND_SOC_DAILINK_REG'
     138 |                 SND_SOC_DAILINK_REG(system, dummy, platform),
         |                 ^~~~~~~~~~~~~~~~~~~
   sound/soc/intel/boards/bdw_rt286.c:143:18: error: 'struct snd_soc_dai_link' has no member named 'nonatomic'
     143 |                 .nonatomic = 1,
..


vim +1088 sound/soc/soc-dapm.c

  1078	
  1079	/* create new dapm dai link control */
  1080	static int dapm_new_dai_link(struct snd_soc_dapm_widget *w)
  1081	{
  1082		int i;
  1083		struct snd_soc_pcm_runtime *rtd = w->priv;
  1084	
  1085		/* create control for links with > 1 config */
  1086		switch (rtd->version) {
  1087		case SND_SOC_LINK_VER1:
> 1088			struct snd_soc_dai_link1 *dai_link1 = snd_soc_dai_link_to_link1(rtd->dai_link);
  1089	
  1090			if (rtd->dai_link->num_c2c_params <= 1)
  1091				return 0;
  1092			break;
  1093		default:
  1094			/* do nothing */
  1095		}
  1096	
  1097		/* add kcontrol */
  1098		for (i = 0; i < w->num_kcontrols; i++) {
  1099			struct snd_soc_dapm_context *dapm = w->dapm;
  1100			struct snd_card *card = dapm->card->snd_card;
  1101			struct snd_kcontrol *kcontrol = snd_soc_cnew(&w->kcontrol_news[i],
  1102								     w, w->name, NULL);
  1103			int ret = snd_ctl_add(card, kcontrol);
  1104	
  1105			if (ret < 0) {
  1106				dev_err(dapm->dev,
  1107					"ASoC: failed to add widget %s dapm kcontrol %s: %d\n",
  1108					w->name, w->kcontrol_news[i].name, ret);
  1109				return ret;
  1110			}
  1111			kcontrol->private_data = w;
  1112			w->kcontrols[i] = kcontrol;
  1113		}
  1114	
  1115		return 0;
  1116	}
  1117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
