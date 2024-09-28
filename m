Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B691C287
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727535803; cv=none; b=TXCkUOOdUEwkCTeb0bT3qa2sX+v/dXriiMJ1yAkvZQshgC29COoMTteXqfyLmg14OW+IoZSviv6j95sH7HLOQkYpe+Mr0PmphylzoDG9lVE952n0WrYWAmwIjAFYLE2lT7lyA/cgZfgZE1i8HbAP0M9Tc4eoQBVjUabZ+pnTHM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727535803; c=relaxed/simple;
	bh=Q+rpuR+FcpV62g4Z6nf/O1RCLkmLQUYSvUvn64bSZoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cchX7t8YAkdhTHdDjT7qY5xD82QskRbFqZKYyYWc9032xqNIZ1nqpOh8vTurIHXaAx0W9IROUY95NtZF0uhS8/yw8hkt8Ok97Z3duc+G016iOH9VOD8heab4L+37dNLp6tR5ymeVm1pBsr2wsIDibqU6Rf7Dzh8zDGp2gJA0xBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHTpuKQe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHTpuKQe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727535801; x=1759071801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q+rpuR+FcpV62g4Z6nf/O1RCLkmLQUYSvUvn64bSZoM=;
  b=lHTpuKQevBHF+myJPfgQC+AcaZgpcMZZHwE1RBIvEwRJjS5wLTfwvBau
   cH7eidbYPt9Rq4hl1CkNgqo1ciyNuCrhLmFAzhQ1tprgyS6a1H36kXycv
   NmfLojhVmX94qIY9or6nqjpNjHjT1Ok0gCvrE/fWjQC2kzNmx2gSJcOZW
   tODQU6Tcsy2SEJb4QzGJGK/QNnvqS9p2nEXmVwL5+HsCaJMpSRLvmMXb6
   4hoMAo4TA3ZMOtNdYGwp1CUca7/r4yNeefg5rBUcJBRuuzdH8sPmFcZP5
   y0wcrNh4BRkTa+kAk+G28KhiqYBlDRhYFPKwZ5J8Zxl0AD9SNIShQa8qY
   g==;
X-CSE-ConnectionGUID: w2AGtSUCSkmzY2CQ+emfxg==
X-CSE-MsgGUID: vjNJTwALRHSfF0pRtf8DhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="37344378"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="37344378"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 08:03:19 -0700
X-CSE-ConnectionGUID: 6UTeLoWLSsKJk9Nsgf7umQ==
X-CSE-MsgGUID: RMgq+dUlR1GEAdaYhjCt5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72502126"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Sep 2024 08:03:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suYyZ-000NLt-2B;
	Sat, 28 Sep 2024 15:03:15 +0000
Date: Sat, 28 Sep 2024 23:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3860/16788]
 sound/soc/fsl/fsl-asoc-card.c:171:40: warning: 'audio_map_esai' defined but
 not used
Message-ID: <202409282259.dhyG96Er-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 0eeef8490e3bdaa062e9b42b802e102f6d3463da [3860/16788] LF-2511-3: ASoC: fsl-asoc-card: Merge some features to this common driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240928/202409282259.dhyG96Er-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282259.dhyG96Er-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282259.dhyG96Er-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/fsl/fsl-asoc-card.c:171:40: warning: 'audio_map_esai' defined but not used [-Wunused-const-variable=]
     171 | static const struct snd_soc_dapm_route audio_map_esai[] = {
         |                                        ^~~~~~~~~~~~~~
--
   sound/soc/fsl/fsl-asoc-card.c:72: warning: Function parameter or member 'mclk' not described in 'codec_priv'
>> sound/soc/fsl/fsl-asoc-card.c:130: warning: Function parameter or member 'card_type' not described in 'fsl_asoc_card_priv'
>> sound/soc/fsl/fsl-asoc-card.c:130: warning: Function parameter or member 'is_stream_tdm' not described in 'fsl_asoc_card_priv'
>> sound/soc/fsl/fsl-asoc-card.c:130: warning: Function parameter or member 'is_codec_master' not described in 'fsl_asoc_card_priv'
>> sound/soc/fsl/fsl-asoc-card.c:130: warning: Function parameter or member 'is_playback_only' not described in 'fsl_asoc_card_priv'
>> sound/soc/fsl/fsl-asoc-card.c:130: warning: Function parameter or member 'is_capture_only' not described in 'fsl_asoc_card_priv'


vim +/audio_map_esai +171 sound/soc/fsl/fsl-asoc-card.c

    91	
    92	/**
    93	 * struct fsl_asoc_card_priv - Freescale Generic ASOC card private data
    94	 * @dai_link: DAI link structure including normal one and DPCM link
    95	 * @hp_jack: Headphone Jack structure
    96	 * @mic_jack: Microphone Jack structure
    97	 * @pdev: platform device pointer
    98	 * @codec_priv: CODEC private data
    99	 * @cpu_priv: CPU private data
   100	 * @card: ASoC card structure
   101	 * @streams: Mask of current active streams
   102	 * @sample_rate: Current sample rate
   103	 * @sample_format: Current sample format
   104	 * @asrc_rate: ASRC sample rate used by Back-Ends
   105	 * @asrc_format: ASRC sample format used by Back-Ends
   106	 * @dai_fmt: DAI format between CPU and CODEC
   107	 * @name: Card name
   108	 */
   109	
   110	struct fsl_asoc_card_priv {
   111		struct snd_soc_dai_link dai_link[3];
   112		struct asoc_simple_jack hp_jack;
   113		struct asoc_simple_jack mic_jack;
   114		struct platform_device *pdev;
   115		struct codec_priv codec_priv;
   116		struct cpu_priv cpu_priv;
   117		struct snd_soc_card card;
   118		u8 streams;
   119		u32 sample_rate;
   120		snd_pcm_format_t sample_format;
   121		u32 asrc_rate;
   122		snd_pcm_format_t asrc_format;
   123		u32 dai_fmt;
   124		u32 card_type;
   125		bool is_stream_tdm[2];
   126		bool is_codec_master;
   127		bool is_playback_only;
   128		bool is_capture_only;
   129		char name[32];
 > 130	};
   131	
   132	/*
   133	 * This dapm route map exists for DPCM link only.
   134	 * The other routes shall go through Device Tree.
   135	 *
   136	 * Note: keep all ASRC routes in the second half
   137	 *	 to drop them easily for non-ASRC cases.
   138	 */
   139	static const struct snd_soc_dapm_route audio_map[] = {
   140		/* 1st half -- Normal DAPM routes */
   141		{"Playback",  NULL, "CPU-Playback"},
   142		{"CPU-Capture",  NULL, "Capture"},
   143		/* 2nd half -- ASRC DAPM routes */
   144		{"CPU-Playback",  NULL, "ASRC-Playback"},
   145		{"ASRC-Capture",  NULL, "CPU-Capture"},
   146	};
   147	
   148	static const struct snd_soc_dapm_route audio_map_ac97[] = {
   149		/* 1st half -- Normal DAPM routes */
   150		{"AC97 Playback",  NULL, "CPU AC97 Playback"},
   151		{"CPU AC97 Capture",  NULL, "AC97 Capture"},
   152		/* 2nd half -- ASRC DAPM routes */
   153		{"CPU AC97 Playback",  NULL, "ASRC-Playback"},
   154		{"ASRC-Capture",  NULL, "CPU AC97 Capture"},
   155	};
   156	
   157	static const struct snd_soc_dapm_route audio_map_tx[] = {
   158		/* 1st half -- Normal DAPM routes */
   159		{"Playback",  NULL, "CPU-Playback"},
   160		/* 2nd half -- ASRC DAPM routes */
   161		{"CPU-Playback",  NULL, "ASRC-Playback"},
   162	};
   163	
   164	static const struct snd_soc_dapm_route audio_map_rx[] = {
   165		/* 1st half -- Normal DAPM routes */
   166		{"CPU-Capture",  NULL, "Capture"},
   167		/* 2nd half -- ASRC DAPM routes */
   168		{"ASRC-Capture",  NULL, "CPU-Capture"},
   169	};
   170	
 > 171	static const struct snd_soc_dapm_route audio_map_esai[] = {
   172		{"Playback",  NULL, "CPU-Playback"},/* dai route for be and fe */
   173		{"CPU-Capture",  NULL, "Capture"},
   174		{"CPU-Playback",  NULL, "CLIENT0-Playback"},
   175		{"CLIENT0-Capture",  NULL, "CPU-Capture"},
   176		{"CPU-Playback",  NULL, "CLIENT1-Playback"},
   177		{"CLIENT1-Capture",  NULL, "CPU-Capture"},
   178	};
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
