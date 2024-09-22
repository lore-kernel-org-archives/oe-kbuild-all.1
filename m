Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884E036AF8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 17:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727027711; cv=none; b=Bs2ETFUTNKzJCVzaFq6a2NNc8dNfBlBU0YVSpY20ZUm6JC5h6lkYLDCxyhVo+MaVz4KloVy5KQJBfv8eqCC9MPoL05ydaego5WgEn2we5eFnQJqJGZCfCZW03GHooOmsbx7EEOlRDpVoFlCpmIg5FnhRWj8t0JYtL93Od5wwDoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727027711; c=relaxed/simple;
	bh=PdkA802NpNBnTD20leSPLBYIxx5jSb3NRVdmagnKDvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kh+Y5NS2DmAhBXmMEvGggUZ48OwPLjKt8IOzGD9HSnkDoO1al1Puz8Leij5W3nA003QW8c6JwEWdrFjpZn1X9jTFTeQJGrVUIlrpBbbE8GjR7PZ7o6uHd+bG3bPyGvWrqemkFgT8dPnkbYk8hGdxgYVIbWwINUfIA/Eae8ytZ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoUOSzA7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoUOSzA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727027708; x=1758563708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PdkA802NpNBnTD20leSPLBYIxx5jSb3NRVdmagnKDvI=;
  b=HoUOSzA7iu8St8kbO8GfcEqcpyY4oqQfMGUaojy0m4GvB64ho8mR6yve
   y8yTKAn3ec4S2FusnfGX2flPzspmYPX3f4wKymieYSeblU9hoOYR6bfn5
   eM04BMJsf0u0v3MBF3dlHVX87DDK+z3SgzADmpXTGiU3Jk00IziD/xlbh
   JIaOxJDN+1r6xPqSCdcJoZrKzA13HWr8uQjAgUsOv8rnsODdMel7DrDzG
   kUY04Jed+enGz3JGmZ7QRqW1Nr2H6W16YqeewEXshPMO31V/L2er1x/pg
   K6vVM6wkKj93VG/LUKYmduaVSsP9nhKlNq4Us5D0vyySseP/3Ngv5+s65
   g==;
X-CSE-ConnectionGUID: CSwPE9tVRH+02K4qdlQxng==
X-CSE-MsgGUID: AjfLTNzuRieukT6AwlqVjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="48498511"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="48498511"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 10:55:07 -0700
X-CSE-ConnectionGUID: bBlP36JdRReBAKrKgZKFsQ==
X-CSE-MsgGUID: mxDf9Vd5QqaOtmqqD72LrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="75225689"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Sep 2024 10:55:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssQnX-000GYk-2M;
	Sun, 22 Sep 2024 17:55:03 +0000
Date: Mon, 23 Sep 2024 01:54:51 +0800
From: kernel test robot <lkp@intel.com>
To: Brent Lu <brent.lu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, sys_oak <sys_oak@intel.com>
Subject: [intel-lts:6.1/linux 16/20] sound/soc/intel/boards/sof_rt5682.c:322:
 undefined reference to `rt5645_sel_asrc_clk_src'
Message-ID: <202409230131.0glYVebU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   5404e6dd8524e9cc698099c8780a6889e24ecbfd
commit: 32a0a5f85ad4357ef63044cffbdddc12cdaaabf3 [16/20] ASoC: Intel: sof_rt5682: add jsl_rt5650 board config
config: i386-randconfig-006-20240922 (https://download.01.org/0day-ci/archive/20240923/202409230131.0glYVebU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409230131.0glYVebU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409230131.0glYVebU-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/intel/boards/sof_rt5682.o: in function `sof_rt5682_codec_init':
>> sound/soc/intel/boards/sof_rt5682.c:322: undefined reference to `rt5645_sel_asrc_clk_src'
>> ld: sound/soc/intel/boards/sof_rt5682.c:326: undefined reference to `rt5645_sel_asrc_clk_src'


vim +322 sound/soc/intel/boards/sof_rt5682.c

   304	
   305	static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
   306	{
   307		struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
   308		struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
   309		struct snd_soc_jack *jack;
   310		int extra_jack_data;
   311		int ret;
   312	
   313		/* need to enable ASRC function for 24MHz mclk rate */
   314		if ((sof_rt5682_quirk & SOF_RT5682_MCLK_EN) &&
   315		    (sof_rt5682_quirk & SOF_RT5682_MCLK_24MHZ)) {
   316			if (sof_rt5682_quirk & SOF_RT5682S_HEADPHONE_CODEC_PRESENT)
   317				rt5682s_sel_asrc_clk_src(component,
   318							 RT5682S_DA_STEREO1_FILTER |
   319							 RT5682S_AD_STEREO1_FILTER,
   320							 RT5682S_CLK_SEL_I2S1_ASRC);
   321			else if (sof_rt5682_quirk & SOF_RT5650_HEADPHONE_CODEC_PRESENT) {
 > 322				rt5645_sel_asrc_clk_src(component,
   323							RT5645_DA_STEREO_FILTER |
   324							RT5645_AD_STEREO_FILTER,
   325							RT5645_CLK_SEL_I2S1_ASRC);
 > 326				rt5645_sel_asrc_clk_src(component,
   327							RT5645_DA_MONO_L_FILTER |
   328							RT5645_DA_MONO_R_FILTER,
   329							RT5645_CLK_SEL_I2S2_ASRC);
   330			} else
   331				rt5682_sel_asrc_clk_src(component,
   332							RT5682_DA_STEREO1_FILTER |
   333							RT5682_AD_STEREO1_FILTER,
   334							RT5682_CLK_SEL_I2S1_ASRC);
   335		}
   336	
   337		if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
   338			/*
   339			 * The firmware might enable the clock at
   340			 * boot (this information may or may not
   341			 * be reflected in the enable clock register).
   342			 * To change the rate we must disable the clock
   343			 * first to cover these cases. Due to common
   344			 * clock framework restrictions that do not allow
   345			 * to disable a clock that has not been enabled,
   346			 * we need to enable the clock first.
   347			 */
   348			ret = clk_prepare_enable(ctx->mclk);
   349			if (!ret)
   350				clk_disable_unprepare(ctx->mclk);
   351	
   352			ret = clk_set_rate(ctx->mclk, 19200000);
   353	
   354			if (ret)
   355				dev_err(rtd->dev, "unable to set MCLK rate\n");
   356		}
   357	
   358		/*
   359		 * Headset buttons map to the google Reference headset.
   360		 * These can be configured by userspace.
   361		 */
   362		ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
   363						 SND_JACK_HEADSET | SND_JACK_BTN_0 |
   364						 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
   365						 SND_JACK_BTN_3,
   366						 &ctx->sof_headset,
   367						 jack_pins,
   368						 ARRAY_SIZE(jack_pins));
   369		if (ret) {
   370			dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
   371			return ret;
   372		}
   373	
   374		jack = &ctx->sof_headset;
   375	
   376		snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
   377		snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
   378		snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
   379		snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
   380	
   381		if (sof_rt5682_quirk & SOF_RT5650_HEADPHONE_CODEC_PRESENT) {
   382			extra_jack_data = SND_JACK_MICROPHONE | SND_JACK_BTN_0;
   383			ret = snd_soc_component_set_jack(component, jack, &extra_jack_data);
   384		} else
   385			ret = snd_soc_component_set_jack(component, jack, NULL);
   386	
   387		if (ret) {
   388			dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
   389			return ret;
   390		}
   391	
   392		return ret;
   393	};
   394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
