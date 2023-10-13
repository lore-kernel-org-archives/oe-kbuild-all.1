Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1325F7462
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 06:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCyMdfMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697178524; x=1728714524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kgeqXPj86kxHV3ppGtZ84+hdq0VkC7YTr4wYSYXajHM=;
  b=cCyMdfMfWNYpnS/1CP7pnqTIw5Eqi/RbJIygsn0a2pt8JGHIHxVk9eNW
   xZd07MCNTysvk3T8x83WB7hmPsc771UCGtP1skwarnXLGA5+kjv5Ft05Q
   atRL/q0DYFViE1WxBpdTCYlCF0A0D8tooxBXQfMbMTrtA91PqW4hX/HnQ
   Ir4WUc3UphnxGbOAkUuC+Z6TEpvEKZW1AoTh1b2b/2GW9zhYGGt9c2UzI
   JSHeJurt7EA/H8Z10JGkun3qUfZZ9CkMULZUFkKfSil7EsEoVIr6jaIQH
   7n+ruswG9dhhfcon/kdYkZoyJbG+IBi5crDXEdc1YBCWClCue1ePnmQLU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="365371903"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="365371903"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 23:28:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1086016271"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="1086016271"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Oct 2023 23:28:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrBej-0004Q3-1y;
	Fri, 13 Oct 2023 06:28:17 +0000
Date: Fri, 13 Oct 2023 14:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4725/15768]
 sound/soc/fsl/fsl-asoc-card.c:124: warning: Function parameter or member
 'card_type' not described in 'fsl_asoc_card_priv'
Message-ID: <202310131457.Ixbv7Did-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 370dd28487b6791cd8d9feabd87ee77a7bcf4d7d [4725/15768] Merge remote-tracking branch 'origin/audio/esai' into audio/next
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310131457.Ixbv7Did-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131457.Ixbv7Did-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131457.Ixbv7Did-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/fsl/fsl-asoc-card.c:124: warning: Function parameter or member 'card_type' not described in 'fsl_asoc_card_priv'
>> sound/soc/fsl/fsl-asoc-card.c:124: warning: Function parameter or member 'is_stream_tdm' not described in 'fsl_asoc_card_priv'
>> sound/soc/fsl/fsl-asoc-card.c:124: warning: Function parameter or member 'is_codec_master' not described in 'fsl_asoc_card_priv'
>> sound/soc/fsl/fsl-asoc-card.c:124: warning: Function parameter or member 'is_playback_only' not described in 'fsl_asoc_card_priv'
>> sound/soc/fsl/fsl-asoc-card.c:124: warning: Function parameter or member 'is_capture_only' not described in 'fsl_asoc_card_priv'


vim +124 sound/soc/fsl/fsl-asoc-card.c

708b4351f08c08 Nicolin Chen         2014-07-30   85  
708b4351f08c08 Nicolin Chen         2014-07-30   86  /**
31deacffcdba10 Pierre-Louis Bossart 2020-07-02   87   * struct fsl_asoc_card_priv - Freescale Generic ASOC card private data
31deacffcdba10 Pierre-Louis Bossart 2020-07-02   88   * @dai_link: DAI link structure including normal one and DPCM link
3b171194493c5f Shengjiu Wang        2020-07-15   89   * @hp_jack: Headphone Jack structure
3b171194493c5f Shengjiu Wang        2020-07-15   90   * @mic_jack: Microphone Jack structure
708b4351f08c08 Nicolin Chen         2014-07-30   91   * @pdev: platform device pointer
708b4351f08c08 Nicolin Chen         2014-07-30   92   * @codec_priv: CODEC private data
708b4351f08c08 Nicolin Chen         2014-07-30   93   * @cpu_priv: CPU private data
708b4351f08c08 Nicolin Chen         2014-07-30   94   * @card: ASoC card structure
f36e8edb95734c Shengjiu Wang        2020-08-03   95   * @streams: Mask of current active streams
708b4351f08c08 Nicolin Chen         2014-07-30   96   * @sample_rate: Current sample rate
708b4351f08c08 Nicolin Chen         2014-07-30   97   * @sample_format: Current sample format
708b4351f08c08 Nicolin Chen         2014-07-30   98   * @asrc_rate: ASRC sample rate used by Back-Ends
708b4351f08c08 Nicolin Chen         2014-07-30   99   * @asrc_format: ASRC sample format used by Back-Ends
708b4351f08c08 Nicolin Chen         2014-07-30  100   * @dai_fmt: DAI format between CPU and CODEC
708b4351f08c08 Nicolin Chen         2014-07-30  101   * @name: Card name
708b4351f08c08 Nicolin Chen         2014-07-30  102   */
708b4351f08c08 Nicolin Chen         2014-07-30  103  
708b4351f08c08 Nicolin Chen         2014-07-30  104  struct fsl_asoc_card_priv {
708b4351f08c08 Nicolin Chen         2014-07-30  105  	struct snd_soc_dai_link dai_link[3];
3b171194493c5f Shengjiu Wang        2020-07-15  106  	struct asoc_simple_jack hp_jack;
3b171194493c5f Shengjiu Wang        2020-07-15  107  	struct asoc_simple_jack mic_jack;
708b4351f08c08 Nicolin Chen         2014-07-30  108  	struct platform_device *pdev;
708b4351f08c08 Nicolin Chen         2014-07-30  109  	struct codec_priv codec_priv;
708b4351f08c08 Nicolin Chen         2014-07-30  110  	struct cpu_priv cpu_priv;
708b4351f08c08 Nicolin Chen         2014-07-30  111  	struct snd_soc_card card;
f36e8edb95734c Shengjiu Wang        2020-08-03  112  	u8 streams;
708b4351f08c08 Nicolin Chen         2014-07-30  113  	u32 sample_rate;
fc734c244ab5ba Fabio Estevam        2018-02-11  114  	snd_pcm_format_t sample_format;
708b4351f08c08 Nicolin Chen         2014-07-30  115  	u32 asrc_rate;
fc734c244ab5ba Fabio Estevam        2018-02-11  116  	snd_pcm_format_t asrc_format;
708b4351f08c08 Nicolin Chen         2014-07-30  117  	u32 dai_fmt;
3f32e9bc370556 Shengjiu Wang        2020-06-02  118  	u32 card_type;
3f32e9bc370556 Shengjiu Wang        2020-06-02  119  	bool is_stream_tdm[2];
3f32e9bc370556 Shengjiu Wang        2020-06-02  120  	bool is_codec_master;
3f32e9bc370556 Shengjiu Wang        2020-06-02  121  	bool is_playback_only;
3f32e9bc370556 Shengjiu Wang        2020-06-02  122  	bool is_capture_only;
708b4351f08c08 Nicolin Chen         2014-07-30  123  	char name[32];
708b4351f08c08 Nicolin Chen         2014-07-30 @124  };
708b4351f08c08 Nicolin Chen         2014-07-30  125  

:::::: The code at line 124 was first introduced by commit
:::::: 708b4351f08c08ea93f773fb9197bdd3f3b08273 ASoC: fsl: Add Freescale Generic ASoC Sound Card with ASRC support

:::::: TO: Nicolin Chen <nicoleotsuka@gmail.com>
:::::: CC: Mark Brown <broonie@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
