Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B6E13AC1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 16:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761497542; cv=none; b=VoYXfcc/bAEKCSeCJf89ZotpShYIemuNtluRP7e8IIQOE+NBFZwRS401cjVujSjP179MDitx1KutGfXhW6Ql0PANbxUSnw7gnajB2p4dfg3272ZXd0UdCShAC1g2xIzu9MLUJ+TmJj3cZWIdiiWBbAzeF/PgnzGP2RUD/iEsfx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761497542; c=relaxed/simple;
	bh=fiiNjRPsDpqYeYsdPVxNWeOUnCh4/kOHUOo2fgrW4x0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iFQpRI/6vMsfiojt0pUUmr1WhCJnfM8iIsmLUAzcgHsCBOEvCm/UUNZaqDCbVLhyRXmh1wc++h+RIl1Q7E4seysAjeWaDBD7q7meCKj7eJ+AFRabaUubj3KNrjoaybhjvFg1+VNZw9SjCGWCJNhX6ulvOOxJVismnnVw92Z8kVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buZlcxU8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buZlcxU8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761497541; x=1793033541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fiiNjRPsDpqYeYsdPVxNWeOUnCh4/kOHUOo2fgrW4x0=;
  b=buZlcxU8oTQjyHZKePl43k4BMx5pmK8pXI8hRvSQiq2mBBL2Oz3x6x7q
   X0bPJV/tRYyu34heraBdIC+ThBCf78q/MPWJw8n9OPUP2w+qkPgtP8n0E
   P1pJNRtdtlcatmZRoCG/BhWDeghxOdbUF0wQNBZUxFeJlrN6cRChSId7L
   u5ledmcyMhuRL0aIFFwRPr5EW4xxMCPQOgH2rMRguAwCV3kFklnA2q9Ec
   kWNcN72J0WeGLG8Av5Cpf7AKZcsiRE3aVMRvxQssp+9SRIMjscGwv/bwX
   UZxw6Cal29Qb3TzgRv0PvtpnfluBTOwetiVaQ2fwdjmrsxr87si39K91w
   w==;
X-CSE-ConnectionGUID: b8E8Ib80TnSbHwtjsscVNw==
X-CSE-MsgGUID: p7UaYJG4T/20WEI8wS1Riw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63743200"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="63743200"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 09:52:21 -0700
X-CSE-ConnectionGUID: KMZJb9WaSY+N3QqZW7SM7w==
X-CSE-MsgGUID: Z2fu9RDiTvSArqrH5T2MOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="222053168"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Oct 2025 09:52:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vD3ya-000GEz-0r;
	Sun, 26 Oct 2025 16:52:16 +0000
Date: Mon, 27 Oct 2025 00:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: Shuming Fan <shumingf@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [linux-next:master 3366/4098]
 sound/soc/sdw_utils/soc_sdw_utils.c:316:18: error: 'struct
 asoc_sdw_codec_info' has no member named 'name_prefix'
Message-ID: <202510270009.sJuK50dV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   72fb0170ef1f45addf726319c52a0562b6913707
commit: 3293d3d7b08872cf174bb768b890655f1b22526a [3366/4098] ASoC: sdw_utils: add name_prefix for rt1321 part id
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251027/202510270009.sJuK50dV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270009.sJuK50dV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510270009.sJuK50dV-lkp@intel.com/

Note: the linux-next/master HEAD 72fb0170ef1f45addf726319c52a0562b6913707 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> sound/soc/sdw_utils/soc_sdw_utils.c:316:18: error: 'struct asoc_sdw_codec_info' has no member named 'name_prefix'
     316 |                 .name_prefix = "rt1320",
         |                  ^~~~~~~~~~~
>> sound/soc/sdw_utils/soc_sdw_utils.c:316:32: error: initialization of 'int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
     316 |                 .name_prefix = "rt1320",
         |                                ^~~~~~~~
   sound/soc/sdw_utils/soc_sdw_utils.c:316:32: note: (near initialization for 'codec_info_list[12].version_id')
   sound/soc/sdw_utils/soc_sdw_utils.c:316:32: error: initializer element is not computable at load time
   sound/soc/sdw_utils/soc_sdw_utils.c:316:32: note: (near initialization for 'codec_info_list[12].version_id')


vim +316 sound/soc/sdw_utils/soc_sdw_utils.c

    59	
    60	struct asoc_sdw_codec_info codec_info_list[] = {
    61		{
    62			.part_id = 0x0000, /* TAS2783A */
    63			.dais = {
    64				{
    65					.direction = {true, true},
    66					.dai_name = "tas2783-codec",
    67					.dai_type = SOC_SDW_DAI_TYPE_AMP,
    68					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
    69					.init = asoc_sdw_ti_amp_init,
    70					.rtd_init = asoc_sdw_ti_spk_rtd_init,
    71					.controls = lr_spk_controls,
    72					.num_controls = ARRAY_SIZE(lr_spk_controls),
    73					.widgets = lr_spk_widgets,
    74					.num_widgets = ARRAY_SIZE(lr_spk_widgets),
    75				},
    76			},
    77			.dai_num = 1,
    78		},
    79		{
    80			.part_id = 0x700,
    81			.dais = {
    82				{
    83					.direction = {true, true},
    84					.dai_name = "rt700-aif1",
    85					.dai_type = SOC_SDW_DAI_TYPE_JACK,
    86					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
    87					.rtd_init = asoc_sdw_rt700_rtd_init,
    88					.controls = rt700_controls,
    89					.num_controls = ARRAY_SIZE(rt700_controls),
    90					.widgets = rt700_widgets,
    91					.num_widgets = ARRAY_SIZE(rt700_widgets),
    92				},
    93			},
    94			.dai_num = 1,
    95		},
    96		{
    97			.part_id = 0x711,
    98			.version_id = 3,
    99			.dais = {
   100				{
   101					.direction = {true, true},
   102					.dai_name = "rt711-sdca-aif1",
   103					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   104					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   105					.init = asoc_sdw_rt_sdca_jack_init,
   106					.exit = asoc_sdw_rt_sdca_jack_exit,
   107					.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
   108					.controls = generic_jack_controls,
   109					.num_controls = ARRAY_SIZE(generic_jack_controls),
   110					.widgets = generic_jack_widgets,
   111					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   112				},
   113			},
   114			.dai_num = 1,
   115		},
   116		{
   117			.part_id = 0x711,
   118			.version_id = 2,
   119			.dais = {
   120				{
   121					.direction = {true, true},
   122					.dai_name = "rt711-aif1",
   123					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   124					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   125					.init = asoc_sdw_rt711_init,
   126					.exit = asoc_sdw_rt711_exit,
   127					.rtd_init = asoc_sdw_rt711_rtd_init,
   128					.controls = generic_jack_controls,
   129					.num_controls = ARRAY_SIZE(generic_jack_controls),
   130					.widgets = generic_jack_widgets,
   131					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   132				},
   133			},
   134			.dai_num = 1,
   135		},
   136		{
   137			.part_id = 0x712,
   138			.version_id = 3,
   139			.dais =	{
   140				{
   141					.direction = {true, true},
   142					.dai_name = "rt712-sdca-aif1",
   143					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   144					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   145					.init = asoc_sdw_rt_sdca_jack_init,
   146					.exit = asoc_sdw_rt_sdca_jack_exit,
   147					.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
   148					.controls = generic_jack_controls,
   149					.num_controls = ARRAY_SIZE(generic_jack_controls),
   150					.widgets = generic_jack_widgets,
   151					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   152				},
   153				{
   154					.direction = {true, false},
   155					.dai_name = "rt712-sdca-aif2",
   156					.component_name = "rt712",
   157					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   158					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   159					.init = asoc_sdw_rt_amp_init,
   160					.exit = asoc_sdw_rt_amp_exit,
   161					.rtd_init = asoc_sdw_rt_mf_sdca_spk_rtd_init,
   162					.controls = generic_spk_controls,
   163					.num_controls = ARRAY_SIZE(generic_spk_controls),
   164					.widgets = generic_spk_widgets,
   165					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   166				},
   167				{
   168					.direction = {false, true},
   169					.dai_name = "rt712-sdca-aif3",
   170					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   171					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   172					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   173				},
   174			},
   175			.dai_num = 3,
   176		},
   177		{
   178			.part_id = 0x1712,
   179			.version_id = 3,
   180			.dais =	{
   181				{
   182					.direction = {false, true},
   183					.dai_name = "rt712-sdca-dmic-aif1",
   184					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   185					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   186					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   187				},
   188			},
   189			.dai_num = 1,
   190		},
   191		{
   192			.part_id = 0x713,
   193			.version_id = 3,
   194			.dais =	{
   195				{
   196					.direction = {true, true},
   197					.dai_name = "rt712-sdca-aif1",
   198					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   199					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   200					.init = asoc_sdw_rt_sdca_jack_init,
   201					.exit = asoc_sdw_rt_sdca_jack_exit,
   202					.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
   203					.controls = generic_jack_controls,
   204					.num_controls = ARRAY_SIZE(generic_jack_controls),
   205					.widgets = generic_jack_widgets,
   206					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   207				},
   208				{
   209					.direction = {false, true},
   210					.dai_name = "rt712-sdca-aif3",
   211					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   212					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   213					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   214				},
   215			},
   216			.dai_num = 2,
   217		},
   218		{
   219			.part_id = 0x1713,
   220			.version_id = 3,
   221			.dais =	{
   222				{
   223					.direction = {false, true},
   224					.dai_name = "rt712-sdca-dmic-aif1",
   225					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   226					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   227					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   228				},
   229			},
   230			.dai_num = 1,
   231		},
   232		{
   233			.part_id = 0x1308,
   234			.acpi_id = "10EC1308",
   235			.dais = {
   236				{
   237					.direction = {true, false},
   238					.dai_name = "rt1308-aif",
   239					.component_name = "rt1308",
   240					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   241					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   242					.init = asoc_sdw_rt_amp_init,
   243					.exit = asoc_sdw_rt_amp_exit,
   244					.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
   245					.controls = generic_spk_controls,
   246					.num_controls = ARRAY_SIZE(generic_spk_controls),
   247					.widgets = generic_spk_widgets,
   248					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   249				},
   250			},
   251			.dai_num = 1,
   252			.ops = &soc_sdw_rt1308_i2s_ops,
   253		},
   254		{
   255			.part_id = 0x1316,
   256			.dais = {
   257				{
   258					.direction = {true, true},
   259					.dai_name = "rt1316-aif",
   260					.component_name = "rt1316",
   261					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   262					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
   263					.init = asoc_sdw_rt_amp_init,
   264					.exit = asoc_sdw_rt_amp_exit,
   265					.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
   266					.controls = generic_spk_controls,
   267					.num_controls = ARRAY_SIZE(generic_spk_controls),
   268					.widgets = generic_spk_widgets,
   269					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   270				},
   271			},
   272			.dai_num = 1,
   273		},
   274		{
   275			.part_id = 0x1318,
   276			.dais = {
   277				{
   278					.direction = {true, true},
   279					.dai_name = "rt1318-aif",
   280					.component_name = "rt1318",
   281					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   282					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
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
   295			.part_id = 0x1320,
   296			.dais = {
   297				{
   298					.direction = {true, false},
   299					.dai_name = "rt1320-aif1",
   300					.component_name = "rt1320",
   301					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   302					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   303					.init = asoc_sdw_rt_amp_init,
   304					.exit = asoc_sdw_rt_amp_exit,
   305					.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
   306					.controls = generic_spk_controls,
   307					.num_controls = ARRAY_SIZE(generic_spk_controls),
   308					.widgets = generic_spk_widgets,
   309					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   310				},
   311			},
   312			.dai_num = 1,
   313		},
   314		{
   315			.part_id = 0x1321,
 > 316			.name_prefix = "rt1320",
   317			.dais = {
   318				{
   319					.direction = {true, false},
   320					.dai_name = "rt1320-aif1",
   321					.component_name = "rt1320",
   322					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   323					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   324					.init = asoc_sdw_rt_amp_init,
   325					.exit = asoc_sdw_rt_amp_exit,
   326					.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
   327					.controls = generic_spk_controls,
   328					.num_controls = ARRAY_SIZE(generic_spk_controls),
   329					.widgets = generic_spk_widgets,
   330					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   331				},
   332			},
   333			.dai_num = 1,
   334		},
   335		{
   336			.part_id = 0x714,
   337			.version_id = 3,
   338			.ignore_internal_dmic = true,
   339			.dais = {
   340				{
   341					.direction = {false, true},
   342					.dai_name = "rt715-sdca-aif2",
   343					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   344					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   345					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   346				},
   347			},
   348			.dai_num = 1,
   349		},
   350		{
   351			.part_id = 0x715,
   352			.version_id = 3,
   353			.ignore_internal_dmic = true,
   354			.dais = {
   355				{
   356					.direction = {false, true},
   357					.dai_name = "rt715-sdca-aif2",
   358					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   359					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   360					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   361				},
   362			},
   363			.dai_num = 1,
   364		},
   365		{
   366			.part_id = 0x714,
   367			.version_id = 2,
   368			.ignore_internal_dmic = true,
   369			.dais = {
   370				{
   371					.direction = {false, true},
   372					.dai_name = "rt715-aif2",
   373					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   374					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   375					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   376				},
   377			},
   378			.dai_num = 1,
   379		},
   380		{
   381			.part_id = 0x715,
   382			.version_id = 2,
   383			.ignore_internal_dmic = true,
   384			.dais = {
   385				{
   386					.direction = {false, true},
   387					.dai_name = "rt715-aif2",
   388					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   389					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   390					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   391				},
   392			},
   393			.dai_num = 1,
   394		},
   395		{
   396			.part_id = 0x721,
   397			.version_id = 3,
   398			.dais = {
   399				{
   400					.direction = {true, true},
   401					.dai_name = "rt721-sdca-aif1",
   402					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   403					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   404					.init = asoc_sdw_rt_sdca_jack_init,
   405					.exit = asoc_sdw_rt_sdca_jack_exit,
   406					.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
   407					.controls = generic_jack_controls,
   408					.num_controls = ARRAY_SIZE(generic_jack_controls),
   409					.widgets = generic_jack_widgets,
   410					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   411				},
   412				{
   413					.direction = {true, false},
   414					.dai_name = "rt721-sdca-aif2",
   415					.component_name = "rt721",
   416					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   417					/* No feedback capability is provided by rt721-sdca codec driver*/
   418					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   419					.init = asoc_sdw_rt_amp_init,
   420					.exit = asoc_sdw_rt_amp_exit,
   421					.rtd_init = asoc_sdw_rt_mf_sdca_spk_rtd_init,
   422					.controls = generic_spk_controls,
   423					.num_controls = ARRAY_SIZE(generic_spk_controls),
   424					.widgets = generic_spk_widgets,
   425					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   426				},
   427				{
   428					.direction = {false, true},
   429					.dai_name = "rt721-sdca-aif3",
   430					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   431					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   432					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   433				},
   434			},
   435			.dai_num = 3,
   436		},
   437		{
   438			.part_id = 0x722,
   439			.version_id = 3,
   440			.dais = {
   441				{
   442					.direction = {true, true},
   443					.dai_name = "rt722-sdca-aif1",
   444					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   445					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   446					.init = asoc_sdw_rt_sdca_jack_init,
   447					.exit = asoc_sdw_rt_sdca_jack_exit,
   448					.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
   449					.controls = generic_jack_controls,
   450					.num_controls = ARRAY_SIZE(generic_jack_controls),
   451					.widgets = generic_jack_widgets,
   452					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   453				},
   454				{
   455					.direction = {true, false},
   456					.dai_name = "rt722-sdca-aif2",
   457					.component_name = "rt722",
   458					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   459					/* No feedback capability is provided by rt722-sdca codec driver*/
   460					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   461					.init = asoc_sdw_rt_amp_init,
   462					.exit = asoc_sdw_rt_amp_exit,
   463					.rtd_init = asoc_sdw_rt_mf_sdca_spk_rtd_init,
   464					.controls = generic_spk_controls,
   465					.num_controls = ARRAY_SIZE(generic_spk_controls),
   466					.widgets = generic_spk_widgets,
   467					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   468					.quirk = SOC_SDW_CODEC_SPKR,
   469					.quirk_exclude = true,
   470				},
   471				{
   472					.direction = {false, true},
   473					.dai_name = "rt722-sdca-aif3",
   474					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   475					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   476					.rtd_init = asoc_sdw_rt_dmic_rtd_init,
   477				},
   478			},
   479			.dai_num = 3,
   480		},
   481		{
   482			.part_id = 0x8373,
   483			.dais = {
   484				{
   485					.direction = {true, true},
   486					.dai_name = "max98373-aif1",
   487					.component_name = "mx8373",
   488					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   489					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
   490					.init = asoc_sdw_maxim_init,
   491					.rtd_init = asoc_sdw_maxim_spk_rtd_init,
   492					.controls = lr_spk_controls,
   493					.num_controls = ARRAY_SIZE(lr_spk_controls),
   494					.widgets = lr_spk_widgets,
   495					.num_widgets = ARRAY_SIZE(lr_spk_widgets),
   496				},
   497			},
   498			.dai_num = 1,
   499		},
   500		{
   501			.part_id = 0x8363,
   502			.dais = {
   503				{
   504					.direction = {true, false},
   505					.dai_name = "max98363-aif1",
   506					.component_name = "mx8363",
   507					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   508					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   509					.init = asoc_sdw_maxim_init,
   510					.rtd_init = asoc_sdw_maxim_spk_rtd_init,
   511					.controls = lr_spk_controls,
   512					.num_controls = ARRAY_SIZE(lr_spk_controls),
   513					.widgets = lr_spk_widgets,
   514					.num_widgets = ARRAY_SIZE(lr_spk_widgets),
   515				},
   516			},
   517			.dai_num = 1,
   518		},
   519		{
   520			.part_id = 0x5682,
   521			.dais = {
   522				{
   523					.direction = {true, true},
   524					.dai_name = "rt5682-sdw",
   525					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   526					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   527					.rtd_init = asoc_sdw_rt5682_rtd_init,
   528					.controls = generic_jack_controls,
   529					.num_controls = ARRAY_SIZE(generic_jack_controls),
   530					.widgets = generic_jack_widgets,
   531					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   532				},
   533			},
   534			.dai_num = 1,
   535		},
   536		{
   537			.part_id = 0x3556,
   538			.dais = {
   539				{
   540					.direction = {true, false},
   541					.dai_name = "cs35l56-sdw1",
   542					.component_name = "cs35l56",
   543					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   544					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   545					.init = asoc_sdw_cs_amp_init,
   546					.rtd_init = asoc_sdw_cs_spk_rtd_init,
   547					.controls = generic_spk_controls,
   548					.num_controls = ARRAY_SIZE(generic_spk_controls),
   549					.widgets = generic_spk_widgets,
   550					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   551				},
   552				{
   553					.direction = {false, true},
   554					.dai_name = "cs35l56-sdw1c",
   555					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   556					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
   557					.rtd_init = asoc_sdw_cs_spk_feedback_rtd_init,
   558				},
   559			},
   560			.dai_num = 2,
   561		},
   562		{
   563			.part_id = 0x3563,
   564			.dais = {
   565				{
   566					.direction = {true, false},
   567					.dai_name = "cs35l56-sdw1",
   568					.component_name = "cs35l56",
   569					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   570					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   571					.init = asoc_sdw_cs_amp_init,
   572					.rtd_init = asoc_sdw_cs_spk_rtd_init,
   573					.controls = generic_spk_controls,
   574					.num_controls = ARRAY_SIZE(generic_spk_controls),
   575					.widgets = generic_spk_widgets,
   576					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   577				},
   578				{
   579					.direction = {false, true},
   580					.dai_name = "cs35l56-sdw1c",
   581					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   582					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
   583					.rtd_init = asoc_sdw_cs_spk_feedback_rtd_init,
   584				},
   585			},
   586			.dai_num = 2,
   587		},
   588		{
   589			.part_id = 0x4242,
   590			.dais = {
   591				{
   592					.direction = {true, true},
   593					.dai_name = "cs42l42-sdw",
   594					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   595					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   596					.rtd_init = asoc_sdw_cs42l42_rtd_init,
   597					.controls = generic_jack_controls,
   598					.num_controls = ARRAY_SIZE(generic_jack_controls),
   599					.widgets = generic_jack_widgets,
   600					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   601				},
   602			},
   603			.dai_num = 1,
   604		},
   605		{
   606			.part_id = 0x4243,
   607			.codec_name = "cs42l43-codec",
   608			.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
   609			.add_sidecar = asoc_sdw_bridge_cs35l56_add_sidecar,
   610			.dais = {
   611				{
   612					.direction = {true, false},
   613					.dai_name = "cs42l43-dp5",
   614					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   615					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   616					.rtd_init = asoc_sdw_cs42l43_hs_rtd_init,
   617					.controls = generic_jack_controls,
   618					.num_controls = ARRAY_SIZE(generic_jack_controls),
   619					.widgets = generic_jack_widgets,
   620					.num_widgets = ARRAY_SIZE(generic_jack_widgets),
   621				},
   622				{
   623					.direction = {false, true},
   624					.dai_name = "cs42l43-dp1",
   625					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   626					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   627					.rtd_init = asoc_sdw_cs42l43_dmic_rtd_init,
   628					.widgets = generic_dmic_widgets,
   629					.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
   630					.quirk = SOC_SDW_CODEC_MIC,
   631					.quirk_exclude = true,
   632				},
   633				{
   634					.direction = {false, true},
   635					.dai_name = "cs42l43-dp2",
   636					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   637					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   638				},
   639				{
   640					.direction = {true, false},
   641					.dai_name = "cs42l43-dp6",
   642					.component_name = "cs42l43",
   643					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   644					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   645					.init = asoc_sdw_cs42l43_spk_init,
   646					.rtd_init = asoc_sdw_cs42l43_spk_rtd_init,
   647					.controls = generic_spk_controls,
   648					.num_controls = ARRAY_SIZE(generic_spk_controls),
   649					.widgets = generic_spk_widgets,
   650					.num_widgets = ARRAY_SIZE(generic_spk_widgets),
   651					.quirk = SOC_SDW_CODEC_SPKR | SOC_SDW_SIDECAR_AMPS,
   652				},
   653			},
   654			.dai_num = 4,
   655		},
   656		{
   657			.part_id = 0xaaaa, /* generic codec mockup */
   658			.version_id = 0,
   659			.dais = {
   660				{
   661					.direction = {true, true},
   662					.dai_name = "sdw-mockup-aif1",
   663					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   664					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   665				},
   666				{
   667					.direction = {true, false},
   668					.dai_name = "sdw-mockup-aif1",
   669					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   670					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
   671				},
   672				{
   673					.direction = {false, true},
   674					.dai_name = "sdw-mockup-aif1",
   675					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   676					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   677				},
   678			},
   679			.dai_num = 3,
   680		},
   681		{
   682			.part_id = 0xaa55, /* headset codec mockup */
   683			.version_id = 0,
   684			.dais = {
   685				{
   686					.direction = {true, true},
   687					.dai_name = "sdw-mockup-aif1",
   688					.dai_type = SOC_SDW_DAI_TYPE_JACK,
   689					.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
   690				},
   691			},
   692			.dai_num = 1,
   693		},
   694		{
   695			.part_id = 0x55aa, /* amplifier mockup */
   696			.version_id = 0,
   697			.dais = {
   698				{
   699					.direction = {true, true},
   700					.dai_name = "sdw-mockup-aif1",
   701					.dai_type = SOC_SDW_DAI_TYPE_AMP,
   702					.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
   703				},
   704			},
   705			.dai_num = 1,
   706		},
   707		{
   708			.part_id = 0x5555,
   709			.version_id = 0,
   710			.dais = {
   711				{
   712					.dai_name = "sdw-mockup-aif1",
   713					.direction = {false, true},
   714					.dai_type = SOC_SDW_DAI_TYPE_MIC,
   715					.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
   716				},
   717			},
   718			.dai_num = 1,
   719		},
   720	};
   721	EXPORT_SYMBOL_NS(codec_info_list, "SND_SOC_SDW_UTILS");
   722	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
