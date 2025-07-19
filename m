Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740BC19BBC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752933507; cv=none; b=lsRNEMpxUQoMOrouIgyN2ccA/XKcEcLAGBSoTMUoJn7oidfrUT+bJCmCIRKT6OiiShi9D4LsSY7/tyL47Axsx1CkcNxhaFoee8ljgmqXuj2UmzMqm9IoJn5PjZP8AgrUsnL3cwoV2hDhp3Eht0vxxz1+7u1W+zeYnJkXOLSuFCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752933507; c=relaxed/simple;
	bh=jpFTbjeGEalJENRLFRcW5hczYVfuoFcH52KfIEH8VQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WnHcKLmzJUqmTdmhwnGuhkj1vLr2UvzPygZViHuCqclkFIyYBKG1LWezgchPwTuL9OPaG2u3CdPuybsb7U3d/dGmfJobIn0UnXevGK2/du7dDHGXrgWj0FRmj8tycXcpJg4JJY76z7iV7xrAx34wxFg6E/00sm5LR3DmONHHkR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8nODFEy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8nODFEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752933505; x=1784469505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jpFTbjeGEalJENRLFRcW5hczYVfuoFcH52KfIEH8VQk=;
  b=M8nODFEyDXvrExERmw3JqNTeFKm04x8LQgyuylczUmbZRciLiJ/bE3iy
   efgfkmh0WOdBYvCse+oybSlfQEdBVr9t3esWSlkjDiJd/W3J8b2sICMVh
   HnEsDiJuRbgaBbYqi7s71F2H3o7EFyS5Y3Jw6wjITZvLVIQkaWXstQKR9
   Qtx0WANSoaRLaYWDFp+AH1kOpFYKFj+B3rfSeQFSLRAmF3y3w0ak0NCGc
   XkFoJubRtkLMqo+rr8o8D4CZB7YThmUn42bOR4+uJrgNJR7R781/7AW5V
   llu4tHmwkqTIRssbaLBmj8WeKBWNLTf8FoKiZyXd4UtIQ7j5a98yINj0G
   g==;
X-CSE-ConnectionGUID: teWIMkn2Q3GTCQFEFM8CSQ==
X-CSE-MsgGUID: m3ev3/SdS4mNU7vUAfnkew==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="55297023"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="55297023"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 06:58:25 -0700
X-CSE-ConnectionGUID: OIghxARYQs632Z6prG1y0w==
X-CSE-MsgGUID: DMBo9fxPRROqlxIMHNaWlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="162997246"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jul 2025 06:58:24 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud84y-000FX9-2o;
	Sat, 19 Jul 2025 13:58:20 +0000
Date: Sat, 19 Jul 2025 21:57:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [broonie-ci:filePV9nOl 10/10]
 sound/soc/sdw_utils/soc_sdw_utils.c:220:34: error: 'struct
 asoc_sdw_dai_info' has no member named 'component_name'
Message-ID: <202507192121.Dv2CQzKt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filePV9nOl
head:   b5ef74ca4ca8e4a4b517833fbe7c2e285944bcfb
commit: b5ef74ca4ca8e4a4b517833fbe7c2e285944bcfb [10/10] ASoC: sdw_utils: Add missed component_name strings for speaker amps
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20250719/202507192121.Dv2CQzKt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507192121.Dv2CQzKt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507192121.Dv2CQzKt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/sdw_utils/soc_sdw_utils.c:220:34: error: 'struct asoc_sdw_dai_info' has no member named 'component_name'
     220 |                                 .component_name = "rt1308",
         |                                  ^~~~~~~~~~~~~~
>> sound/soc/sdw_utils/soc_sdw_utils.c:220:51: warning: initialization of 'int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
     220 |                                 .component_name = "rt1308",
         |                                                   ^~~~~~~~
   sound/soc/sdw_utils/soc_sdw_utils.c:220:51: note: (near initialization for 'codec_info_list[7].dais[0].dai_type')
>> sound/soc/sdw_utils/soc_sdw_utils.c:220:51: error: initializer element is not computable at load time
   sound/soc/sdw_utils/soc_sdw_utils.c:220:51: note: (near initialization for 'codec_info_list[7].dais[0].dai_type')
   sound/soc/sdw_utils/soc_sdw_utils.c:241:34: error: 'struct asoc_sdw_dai_info' has no member named 'component_name'
     241 |                                 .component_name = "rt1316",
         |                                  ^~~~~~~~~~~~~~
   sound/soc/sdw_utils/soc_sdw_utils.c:241:51: warning: initialization of 'int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
     241 |                                 .component_name = "rt1316",
         |                                                   ^~~~~~~~
   sound/soc/sdw_utils/soc_sdw_utils.c:241:51: note: (near initialization for 'codec_info_list[8].dais[0].dai_type')
   sound/soc/sdw_utils/soc_sdw_utils.c:241:51: error: initializer element is not computable at load time
   sound/soc/sdw_utils/soc_sdw_utils.c:241:51: note: (near initialization for 'codec_info_list[8].dais[0].dai_type')
   sound/soc/sdw_utils/soc_sdw_utils.c:261:34: error: 'struct asoc_sdw_dai_info' has no member named 'component_name'
     261 |                                 .component_name = "rt1318",
         |                                  ^~~~~~~~~~~~~~
   sound/soc/sdw_utils/soc_sdw_utils.c:261:51: warning: initialization of 'int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
     261 |                                 .component_name = "rt1318",
         |                                                   ^~~~~~~~
   sound/soc/sdw_utils/soc_sdw_utils.c:261:51: note: (near initialization for 'codec_info_list[9].dais[0].dai_type')
   sound/soc/sdw_utils/soc_sdw_utils.c:261:51: error: initializer element is not computable at load time
   sound/soc/sdw_utils/soc_sdw_utils.c:261:51: note: (near initialization for 'codec_info_list[9].dais[0].dai_type')
   sound/soc/sdw_utils/soc_sdw_utils.c:374:34: error: 'struct asoc_sdw_dai_info' has no member named 'component_name'
     374 |                                 .component_name = "rt721",
         |                                  ^~~~~~~~~~~~~~
   sound/soc/sdw_utils/soc_sdw_utils.c:374:51: warning: initialization of 'int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
     374 |                                 .component_name = "rt721",
         |                                                   ^~~~~~~
   sound/soc/sdw_utils/soc_sdw_utils.c:374:51: note: (near initialization for 'codec_info_list[15].dais[1].dai_type')
   sound/soc/sdw_utils/soc_sdw_utils.c:374:51: error: initializer element is not computable at load time
   sound/soc/sdw_utils/soc_sdw_utils.c:374:51: note: (near initialization for 'codec_info_list[15].dais[1].dai_type')
   sound/soc/sdw_utils/soc_sdw_utils.c:596:34: error: 'struct asoc_sdw_dai_info' has no member named 'component_name'
     596 |                                 .component_name = "cs42l43",
         |                                  ^~~~~~~~~~~~~~
   sound/soc/sdw_utils/soc_sdw_utils.c:596:51: warning: initialization of 'int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
     596 |                                 .component_name = "cs42l43",
         |                                                   ^~~~~~~~~
   sound/soc/sdw_utils/soc_sdw_utils.c:596:51: note: (near initialization for 'codec_info_list[23].dais[3].dai_type')
   sound/soc/sdw_utils/soc_sdw_utils.c:596:51: error: initializer element is not computable at load time
   sound/soc/sdw_utils/soc_sdw_utils.c:596:51: note: (near initialization for 'codec_info_list[23].dais[3].dai_type')


vim +220 sound/soc/sdw_utils/soc_sdw_utils.c

    59	
    60	struct asoc_sdw_codec_info codec_info_list[] = {
    61		{
    62			.part_id = 0x700,
    63			.dais = {
    64				{
    65					.direction = {true, true},
    66					.dai_name = "rt700-aif1",
    67					.dai_type = SOC_SDW_DAI_TYPE_JACK,
    68					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
    69					.rtd_init = asoc_sdw_rt700_rtd_init,
    70					.controls = rt700_controls,
    71					.num_controls = ARRAY_SIZE(rt700_controls),
    72					.widgets = rt700_widgets,
    73					.num_widgets = ARRAY_SIZE(rt700_widgets),
    74				},
    75			},
    76			.dai_num = 1,
    77		},
    78		{
    79			.part_id = 0x711,
    80			.version_id = 3,
    81			.dais = {
    82				{
    83					.direction = {true, true},
    84					.dai_name = "rt711-sdca-aif1",
    85					.dai_type = SOC_SDW_DAI_TYPE_JACK,
    86					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
    87					.init = asoc_sdw_rt_sdca_jack_init,
    88					.exit = asoc_sdw_rt_sdca_jack_exit,
    89					.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
    90					.controls = generic_jack_controls,
    91					.num_controls = ARRAY_SIZE(generic_jack_controls),
    92					.widgets = generic_jack_widgets,
    93					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
    94				},
    95			},
    96			.dai_num = 1,
    97		},
    98		{
    99			.part_id = 0x711,
   100			.version_id = 2,
   101			.dais = {
   102				{
   103					.direction = {true, true},
   104					.dai_name = "rt711-aif1",
   105					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   106					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   107					.init = asoc_sdw_rt711_init,
   108					.exit = asoc_sdw_rt711_exit,
   109					.rtd_init = asoc_sdw_rt711_rtd_init,
   110					.controls = generic_jack_controls,
   111					.num_controls = ARRAY_SIZE(generic_jack_controls),
   112					.widgets = generic_jack_widgets,
   113					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   114				},
   115			},
   116			.dai_num = 1,
   117		},
   118		{
   119			.part_id = 0x712,
   120			.version_id = 3,
   121			.dais =	{
   122				{
   123					.direction = {true, true},
   124					.dai_name = "rt712-sdca-aif1",
   125					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   126					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   127					.init = asoc_sdw_rt_sdca_jack_init,
   128					.exit = asoc_sdw_rt_sdca_jack_exit,
   129					.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
   130					.controls = generic_jack_controls,
   131					.num_controls = ARRAY_SIZE(generic_jack_controls),
   132					.widgets = generic_jack_widgets,
   133					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   134				},
   135				{
   136					.direction = {true, false},
   137					.dai_name = "rt712-sdca-aif2",
   138					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   139					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   140					.init = asoc_sdw_rt_amp_init,
   141					.exit = asoc_sdw_rt_amp_exit,
   142					.rtd_init = asoc_sdw_rt_mf_sdca_spk_rtd_init,
   143					.controls = generic_spk_controls,
   144					.num_controls = ARRAY_SIZE(generic_spk_controls),
   145					.widgets = generic_spk_widgets,
   146					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   147				},
   148				{
   149					.direction = {false, true},
   150					.dai_name = "rt712-sdca-aif3",
   151					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   152					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   153					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   154				},
   155			},
   156			.dai_num = 3,
   157		},
   158		{
   159			.part_id = 0x1712,
   160			.version_id = 3,
   161			.dais =	{
   162				{
   163					.direction = {false, true},
   164					.dai_name = "rt712-sdca-dmic-aif1",
   165					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   166					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   167					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   168				},
   169			},
   170			.dai_num = 1,
   171		},
   172		{
   173			.part_id = 0x713,
   174			.version_id = 3,
   175			.dais =	{
   176				{
   177					.direction = {true, true},
   178					.dai_name = "rt712-sdca-aif1",
   179					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   180					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   181					.init = asoc_sdw_rt_sdca_jack_init,
   182					.exit = asoc_sdw_rt_sdca_jack_exit,
   183					.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
   184					.controls = generic_jack_controls,
   185					.num_controls = ARRAY_SIZE(generic_jack_controls),
   186					.widgets = generic_jack_widgets,
   187					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   188				},
   189				{
   190					.direction = {false, true},
   191					.dai_name = "rt712-sdca-aif3",
   192					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   193					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   194					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   195				},
   196			},
   197			.dai_num = 2,
   198		},
   199		{
   200			.part_id = 0x1713,
   201			.version_id = 3,
   202			.dais =	{
   203				{
   204					.direction = {false, true},
   205					.dai_name = "rt712-sdca-dmic-aif1",
   206					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   207					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   208					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   209				},
   210			},
   211			.dai_num = 1,
   212		},
   213		{
   214			.part_id = 0x1308,
   215			.acpi_id = "10EC1308",
   216			.dais = {
   217				{
   218					.direction = {true, false},
   219					.dai_name = "rt1308-aif",
 > 220					.component_name = "rt1308",
   221					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   222					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   223					.init = asoc_sdw_rt_amp_init,
   224					.exit = asoc_sdw_rt_amp_exit,
   225					.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
   226					.controls = generic_spk_controls,
   227					.num_controls = ARRAY_SIZE(generic_spk_controls),
   228					.widgets = generic_spk_widgets,
   229					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   230				},
   231			},
   232			.dai_num = 1,
   233			.ops = &soc_sdw_rt1308_i2s_ops,
   234		},
   235		{
   236			.part_id = 0x1316,
   237			.dais = {
   238				{
   239					.direction = {true, true},
   240					.dai_name = "rt1316-aif",
   241					.component_name = "rt1316",
   242					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   243					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
   244					.init = asoc_sdw_rt_amp_init,
   245					.exit = asoc_sdw_rt_amp_exit,
   246					.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
   247					.controls = generic_spk_controls,
   248					.num_controls = ARRAY_SIZE(generic_spk_controls),
   249					.widgets = generic_spk_widgets,
   250					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   251				},
   252			},
   253			.dai_num = 1,
   254		},
   255		{
   256			.part_id = 0x1318,
   257			.dais = {
   258				{
   259					.direction = {true, true},
   260					.dai_name = "rt1318-aif",
   261					.component_name = "rt1318",
   262					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   263					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
   264					.init = asoc_sdw_rt_amp_init,
   265					.exit = asoc_sdw_rt_amp_exit,
   266					.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
   267					.controls = generic_spk_controls,
   268					.num_controls = ARRAY_SIZE(generic_spk_controls),
   269					.widgets = generic_spk_widgets,
   270					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   271				},
   272			},
   273			.dai_num = 1,
   274		},
   275		{
   276			.part_id = 0x1320,
   277			.dais = {
   278				{
   279					.direction = {true, false},
   280					.dai_name = "rt1320-aif1",
   281					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   282					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   283					.init = asoc_sdw_rt_amp_init,
   284					.exit = asoc_sdw_rt_amp_exit,
   285					.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
   286					.controls = generic_spk_controls,
   287					.num_controls = ARRAY_SIZE(generic_spk_controls),
   288					.widgets = generic_spk_widgets,
   289					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   290				},
   291			},
   292			.dai_num = 1,
   293		},
   294		{
   295			.part_id = 0x714,
   296			.version_id = 3,
   297			.ignore_internal_dmic = true,
   298			.dais = {
   299				{
   300					.direction = {false, true},
   301					.dai_name = "rt715-sdca-aif2",
   302					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   303					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   304					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   305				},
   306			},
   307			.dai_num = 1,
   308		},
   309		{
   310			.part_id = 0x715,
   311			.version_id = 3,
   312			.ignore_internal_dmic = true,
   313			.dais = {
   314				{
   315					.direction = {false, true},
   316					.dai_name = "rt715-sdca-aif2",
   317					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   318					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   319					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   320				},
   321			},
   322			.dai_num = 1,
   323		},
   324		{
   325			.part_id = 0x714,
   326			.version_id = 2,
   327			.ignore_internal_dmic = true,
   328			.dais = {
   329				{
   330					.direction = {false, true},
   331					.dai_name = "rt715-aif2",
   332					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   333					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   334					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   335				},
   336			},
   337			.dai_num = 1,
   338		},
   339		{
   340			.part_id = 0x715,
   341			.version_id = 2,
   342			.ignore_internal_dmic = true,
   343			.dais = {
   344				{
   345					.direction = {false, true},
   346					.dai_name = "rt715-aif2",
   347					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   348					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   349					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   350				},
   351			},
   352			.dai_num = 1,
   353		},
   354		{
   355			.part_id = 0x721,
   356			.version_id = 3,
   357			.dais = {
   358				{
   359					.direction = {true, true},
   360					.dai_name = "rt721-sdca-aif1",
   361					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   362					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   363					.init = asoc_sdw_rt_sdca_jack_init,
   364					.exit = asoc_sdw_rt_sdca_jack_exit,
   365					.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
   366					.controls = generic_jack_controls,
   367					.num_controls = ARRAY_SIZE(generic_jack_controls),
   368					.widgets = generic_jack_widgets,
   369					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   370				},
   371				{
   372					.direction = {true, false},
   373					.dai_name = "rt721-sdca-aif2",
   374					.component_name = "rt721",
   375					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   376					/* No feedback capability is provided by rt721-sdca codec driver*/
   377					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   378					.init = asoc_sdw_rt_amp_init,
   379					.exit = asoc_sdw_rt_amp_exit,
   380					.rtd_init = asoc_sdw_rt_mf_sdca_spk_rtd_init,
   381					.controls = generic_spk_controls,
   382					.num_controls = ARRAY_SIZE(generic_spk_controls),
   383					.widgets = generic_spk_widgets,
   384					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   385				},
   386				{
   387					.direction = {false, true},
   388					.dai_name = "rt721-sdca-aif3",
   389					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   390					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   391					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   392				},
   393			},
   394			.dai_num = 3,
   395		},
   396		{
   397			.part_id = 0x722,
   398			.version_id = 3,
   399			.dais = {
   400				{
   401					.direction = {true, true},
   402					.dai_name = "rt722-sdca-aif1",
   403					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   404					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   405					.init = asoc_sdw_rt_sdca_jack_init,
   406					.exit = asoc_sdw_rt_sdca_jack_exit,
   407					.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
   408					.controls = generic_jack_controls,
   409					.num_controls = ARRAY_SIZE(generic_jack_controls),
   410					.widgets = generic_jack_widgets,
   411					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   412				},
   413				{
   414					.direction = {true, false},
   415					.dai_name = "rt722-sdca-aif2",
   416					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   417					/* No feedback capability is provided by rt722-sdca codec driver*/
   418					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   419					.init = asoc_sdw_rt_amp_init,
   420					.exit = asoc_sdw_rt_amp_exit,
   421					.rtd_init = asoc_sdw_rt_mf_sdca_spk_rtd_init,
   422					.controls = generic_spk_controls,
   423					.num_controls = ARRAY_SIZE(generic_spk_controls),
   424					.widgets = generic_spk_widgets,
   425					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   426					.quirk = SOC_SDW_CODEC_SPKR,
   427					.quirk_exclude = true,
   428				},
   429				{
   430					.direction = {false, true},
   431					.dai_name = "rt722-sdca-aif3",
   432					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   433					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   434					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   435				},
   436			},
   437			.dai_num = 3,
   438		},
   439		{
   440			.part_id = 0x8373,
   441			.dais = {
   442				{
   443					.direction = {true, true},
   444					.dai_name = "max98373-aif1",
   445					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   446					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
   447					.init = asoc_sdw_maxim_init,
   448					.rtd_init = asoc_sdw_maxim_spk_rtd_init,
   449					.controls = maxim_controls,
   450					.num_controls = ARRAY_SIZE(maxim_controls),
   451					.widgets = maxim_widgets,
   452					.num_widgets = ARRAY_SIZE(maxim_widgets),
   453				},
   454			},
   455			.dai_num = 1,
   456		},
   457		{
   458			.part_id = 0x8363,
   459			.dais = {
   460				{
   461					.direction = {true, false},
   462					.dai_name = "max98363-aif1",
   463					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   464					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   465					.init = asoc_sdw_maxim_init,
   466					.rtd_init = asoc_sdw_maxim_spk_rtd_init,
   467					.controls = maxim_controls,
   468					.num_controls = ARRAY_SIZE(maxim_controls),
   469					.widgets = maxim_widgets,
   470					.num_widgets = ARRAY_SIZE(maxim_widgets),
   471				},
   472			},
   473			.dai_num = 1,
   474		},
   475		{
   476			.part_id = 0x5682,
   477			.dais = {
   478				{
   479					.direction = {true, true},
   480					.dai_name = "rt5682-sdw",
   481					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   482					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   483					.rtd_init = asoc_sdw_rt5682_rtd_init,
   484					.controls = generic_jack_controls,
   485					.num_controls = ARRAY_SIZE(generic_jack_controls),
   486					.widgets = generic_jack_widgets,
   487					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   488				},
   489			},
   490			.dai_num = 1,
   491		},
   492		{
   493			.part_id = 0x3556,
   494			.dais = {
   495				{
   496					.direction = {true, false},
   497					.dai_name = "cs35l56-sdw1",
   498					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   499					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   500					.init = asoc_sdw_cs_amp_init,
   501					.rtd_init = asoc_sdw_cs_spk_rtd_init,
   502					.controls = generic_spk_controls,
   503					.num_controls = ARRAY_SIZE(generic_spk_controls),
   504					.widgets = generic_spk_widgets,
   505					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   506				},
   507				{
   508					.direction = {false, true},
   509					.dai_name = "cs35l56-sdw1c",
   510					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   511					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
   512					.rtd_init = asoc_sdw_cs_spk_feedback_rtd_init,
   513				},
   514			},
   515			.dai_num = 2,
   516		},
   517		{
   518			.part_id = 0x3563,
   519			.dais = {
   520				{
   521					.direction = {true, false},
   522					.dai_name = "cs35l56-sdw1",
   523					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   524					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   525					.init = asoc_sdw_cs_amp_init,
   526					.rtd_init = asoc_sdw_cs_spk_rtd_init,
   527					.controls = generic_spk_controls,
   528					.num_controls = ARRAY_SIZE(generic_spk_controls),
   529					.widgets = generic_spk_widgets,
   530					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   531				},
   532				{
   533					.direction = {false, true},
   534					.dai_name = "cs35l56-sdw1c",
   535					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   536					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
   537					.rtd_init = asoc_sdw_cs_spk_feedback_rtd_init,
   538				},
   539			},
   540			.dai_num = 2,
   541		},
   542		{
   543			.part_id = 0x4242,
   544			.dais = {
   545				{
   546					.direction = {true, true},
   547					.dai_name = "cs42l42-sdw",
   548					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   549					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   550					.rtd_init = asoc_sdw_cs42l42_rtd_init,
   551					.controls = generic_jack_controls,
   552					.num_controls = ARRAY_SIZE(generic_jack_controls),
   553					.widgets = generic_jack_widgets,
   554					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   555				},
   556			},
   557			.dai_num = 1,
   558		},
   559		{
   560			.part_id = 0x4243,
   561			.codec_name = "cs42l43-codec",
   562			.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
   563			.add_sidecar = asoc_sdw_bridge_cs35l56_add_sidecar,
   564			.dais = {
   565				{
   566					.direction = {true, false},
   567					.dai_name = "cs42l43-dp5",
   568					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   569					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   570					.rtd_init = asoc_sdw_cs42l43_hs_rtd_init,
   571					.controls = generic_jack_controls,
   572					.num_controls = ARRAY_SIZE(generic_jack_controls),
   573					.widgets = generic_jack_widgets,
   574					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   575				},
   576				{
   577					.direction = {false, true},
   578					.dai_name = "cs42l43-dp1",
   579					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   580					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   581					.rtd_init = asoc_sdw_cs42l43_dmic_rtd_init,
   582					.widgets = generic_dmic_widgets,
   583					.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
   584					.quirk = SOC_SDW_CODEC_MIC,
   585					.quirk_exclude = true,
   586				},
   587				{
   588					.direction = {false, true},
   589					.dai_name = "cs42l43-dp2",
   590					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   591					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   592				},
   593				{
   594					.direction = {true, false},
   595					.dai_name = "cs42l43-dp6",
   596					.component_name = "cs42l43",
   597					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   598					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   599					.init = asoc_sdw_cs42l43_spk_init,
   600					.rtd_init = asoc_sdw_cs42l43_spk_rtd_init,
   601					.controls = generic_spk_controls,
   602					.num_controls = ARRAY_SIZE(generic_spk_controls),
   603					.widgets = generic_spk_widgets,
   604					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   605					.quirk = SOC_SDW_CODEC_SPKR | SOC_SDW_SIDECAR_AMPS,
   606				},
   607			},
   608			.dai_num = 4,
   609		},
   610		{
   611			.part_id = 0xaaaa, /* generic codec mockup */
   612			.version_id = 0,
   613			.dais = {
   614				{
   615					.direction = {true, true},
   616					.dai_name = "sdw-mockup-aif1",
   617					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   618					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   619				},
   620				{
   621					.direction = {true, false},
   622					.dai_name = "sdw-mockup-aif1",
   623					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   624					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   625				},
   626				{
   627					.direction = {false, true},
   628					.dai_name = "sdw-mockup-aif1",
   629					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   630					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   631				},
   632			},
   633			.dai_num = 3,
   634		},
   635		{
   636			.part_id = 0xaa55, /* headset codec mockup */
   637			.version_id = 0,
   638			.dais = {
   639				{
   640					.direction = {true, true},
   641					.dai_name = "sdw-mockup-aif1",
   642					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   643					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   644				},
   645			},
   646			.dai_num = 1,
   647		},
   648		{
   649			.part_id = 0x55aa, /* amplifier mockup */
   650			.version_id = 0,
   651			.dais = {
   652				{
   653					.direction = {true, true},
   654					.dai_name = "sdw-mockup-aif1",
   655					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   656					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
   657				},
   658			},
   659			.dai_num = 1,
   660		},
   661		{
   662			.part_id = 0x5555,
   663			.version_id = 0,
   664			.dais = {
   665				{
   666					.dai_name = "sdw-mockup-aif1",
   667					.direction = {false, true},
   668					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   669					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   670				},
   671			},
   672			.dai_num = 1,
   673		},
   674	};
   675	EXPORT_SYMBOL_NS(codec_info_list, "SND_SOC_SDW_UTILS");
   676	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
