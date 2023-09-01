Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33840881F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693561595; x=1725097595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xSfpeaZ3y1pMOVsQIlJcfIMNSO4DTwoB22TuNF/jC7s=;
  b=iZlVo/PHAjo2NrIuFEcurh//xQ8g/piAw1j/RXMT8WJanlNQlqaZxqgU
   Mcao1AShmo/9i39NNj1qrWLOhyzXX4DH82GS1JUaE9Eg/lwuITzxMOYQY
   Mcz4Bp7VlRMgm6S++opdP2rvUk4DoLFdMQ5m6XRnwHssyTTEBWAGnPbVK
   08Wtp2HsqN+JMkVZGXmZH+Gzo93SYxRGVneUFzvA0btK7p0IKJF7A3R0X
   jX4Ab2HU0VEdyuOHN/Apr4iWIuTRHQVcPDolVENVDzaJu3q2LuJDWKrpZ
   q6ToKvdP7hx+hwrilCkNB7eFPztWpuoZF9j2M9/X2k6i42Pn4Gl2GDke9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366406687"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="366406687"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 02:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="733468235"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="733468235"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Sep 2023 02:46:33 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc0jX-00019n-1D;
	Fri, 01 Sep 2023 09:46:31 +0000
Date: Fri, 1 Sep 2023 17:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6060/24603]
 sound/soc/fsl/fsl-asoc-card.c:123: warning: Function parameter or member
 'card_type' not described in 'fsl_asoc_card_priv'
Message-ID: <202309011700.FXAGTGlO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: f6acec54eed5343b7c8066c398391dddc109bf6f [6060/24603] Merge remote-tracking branch 'origin/audio/esai' into audio/next
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230901/202309011700.FXAGTGlO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011700.FXAGTGlO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011700.FXAGTGlO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/fsl/fsl-asoc-card.c:123: warning: Function parameter or member 'card_type' not described in 'fsl_asoc_card_priv'
>> sound/soc/fsl/fsl-asoc-card.c:123: warning: Function parameter or member 'is_stream_tdm' not described in 'fsl_asoc_card_priv'
>> sound/soc/fsl/fsl-asoc-card.c:123: warning: Function parameter or member 'is_codec_master' not described in 'fsl_asoc_card_priv'
>> sound/soc/fsl/fsl-asoc-card.c:123: warning: Function parameter or member 'is_playback_only' not described in 'fsl_asoc_card_priv'
>> sound/soc/fsl/fsl-asoc-card.c:123: warning: Function parameter or member 'is_capture_only' not described in 'fsl_asoc_card_priv'


vim +123 sound/soc/fsl/fsl-asoc-card.c

708b4351f08c08e Nicolin Chen         2014-07-30   84  
708b4351f08c08e Nicolin Chen         2014-07-30   85  /**
31deacffcdba10a Pierre-Louis Bossart 2020-07-02   86   * struct fsl_asoc_card_priv - Freescale Generic ASOC card private data
31deacffcdba10a Pierre-Louis Bossart 2020-07-02   87   * @dai_link: DAI link structure including normal one and DPCM link
3b171194493c5f7 Shengjiu Wang        2020-07-15   88   * @hp_jack: Headphone Jack structure
3b171194493c5f7 Shengjiu Wang        2020-07-15   89   * @mic_jack: Microphone Jack structure
708b4351f08c08e Nicolin Chen         2014-07-30   90   * @pdev: platform device pointer
708b4351f08c08e Nicolin Chen         2014-07-30   91   * @codec_priv: CODEC private data
708b4351f08c08e Nicolin Chen         2014-07-30   92   * @cpu_priv: CPU private data
708b4351f08c08e Nicolin Chen         2014-07-30   93   * @card: ASoC card structure
f36e8edb95734c0 Shengjiu Wang        2020-08-03   94   * @streams: Mask of current active streams
708b4351f08c08e Nicolin Chen         2014-07-30   95   * @sample_rate: Current sample rate
708b4351f08c08e Nicolin Chen         2014-07-30   96   * @sample_format: Current sample format
708b4351f08c08e Nicolin Chen         2014-07-30   97   * @asrc_rate: ASRC sample rate used by Back-Ends
708b4351f08c08e Nicolin Chen         2014-07-30   98   * @asrc_format: ASRC sample format used by Back-Ends
708b4351f08c08e Nicolin Chen         2014-07-30   99   * @dai_fmt: DAI format between CPU and CODEC
708b4351f08c08e Nicolin Chen         2014-07-30  100   * @name: Card name
708b4351f08c08e Nicolin Chen         2014-07-30  101   */
708b4351f08c08e Nicolin Chen         2014-07-30  102  
708b4351f08c08e Nicolin Chen         2014-07-30  103  struct fsl_asoc_card_priv {
708b4351f08c08e Nicolin Chen         2014-07-30  104  	struct snd_soc_dai_link dai_link[3];
3b171194493c5f7 Shengjiu Wang        2020-07-15  105  	struct asoc_simple_jack hp_jack;
3b171194493c5f7 Shengjiu Wang        2020-07-15  106  	struct asoc_simple_jack mic_jack;
708b4351f08c08e Nicolin Chen         2014-07-30  107  	struct platform_device *pdev;
708b4351f08c08e Nicolin Chen         2014-07-30  108  	struct codec_priv codec_priv;
708b4351f08c08e Nicolin Chen         2014-07-30  109  	struct cpu_priv cpu_priv;
708b4351f08c08e Nicolin Chen         2014-07-30  110  	struct snd_soc_card card;
f36e8edb95734c0 Shengjiu Wang        2020-08-03  111  	u8 streams;
708b4351f08c08e Nicolin Chen         2014-07-30  112  	u32 sample_rate;
fc734c244ab5bad Fabio Estevam        2018-02-11  113  	snd_pcm_format_t sample_format;
708b4351f08c08e Nicolin Chen         2014-07-30  114  	u32 asrc_rate;
fc734c244ab5bad Fabio Estevam        2018-02-11  115  	snd_pcm_format_t asrc_format;
708b4351f08c08e Nicolin Chen         2014-07-30  116  	u32 dai_fmt;
553cec3979dfca5 Shengjiu Wang        2020-06-02  117  	u32 card_type;
553cec3979dfca5 Shengjiu Wang        2020-06-02  118  	bool is_stream_tdm[2];
553cec3979dfca5 Shengjiu Wang        2020-06-02  119  	bool is_codec_master;
553cec3979dfca5 Shengjiu Wang        2020-06-02  120  	bool is_playback_only;
553cec3979dfca5 Shengjiu Wang        2020-06-02  121  	bool is_capture_only;
708b4351f08c08e Nicolin Chen         2014-07-30  122  	char name[32];
708b4351f08c08e Nicolin Chen         2014-07-30 @123  };
708b4351f08c08e Nicolin Chen         2014-07-30  124  

:::::: The code at line 123 was first introduced by commit
:::::: 708b4351f08c08ea93f773fb9197bdd3f3b08273 ASoC: fsl: Add Freescale Generic ASoC Sound Card with ASRC support

:::::: TO: Nicolin Chen <nicoleotsuka@gmail.com>
:::::: CC: Mark Brown <broonie@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
