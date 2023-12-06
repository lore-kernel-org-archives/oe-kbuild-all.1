Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDE0182C4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 23:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlVQS6Gq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701906852; x=1733442852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v7BrEwvwpZYIBg3rQ6aE/GZbv+vlZVRLXR+chxmmMUY=;
  b=YlVQS6GqspzhJtomb2sZzG0ViakBzbyUWfHAvlDIjcFoGYf3zRccDkVv
   x+yNRQaSpqZCIcqGh2gVos22mMllXvlreXMTLZb7oi/ONUJePPMxWN2oy
   YLxs4mzWm/+ZBgRQYoA86+MFvUPMKkc1Swf+tHtKZjQO51duGg8AbDkQD
   09Gxi2Xlp2CiWM3nIWMwchsza9+0YYMuqfpRLwL92yblWk1HDk1FOEkGE
   K3/EeO6znDLGVp2v93Rf+hX1lsQDYCDW5FDM0UNL0IjHk8KTzQnpCGvyN
   Bh9mArPYxwJaaq3zrgLPCC9ad+MN8H0VOFhUaV7+icnco3PXhGSGBvEiZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="379165909"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="379165909"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 15:54:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="944821999"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="944821999"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 06 Dec 2023 15:54:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB1iS-000BbN-1K;
	Wed, 06 Dec 2023 23:54:08 +0000
Date: Thu, 7 Dec 2023 07:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 63/104]
 sound/soc/apple/macaudio.c:1016:5: sparse: sparse: symbol
 'macaudio_sss_info' was not declared. Should it be static?
Message-ID: <202312070705.Br5fmO5J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   88e53b5c13659b0092bc49020fbc8ebbfc1abfa6
commit: 7cc2528565fefec88f55654e9b81e00b2e40130d [63/104] ASoC: macaudio: Add 'Speakers Up Indicator' control
config: openrisc-randconfig-r132-20231207 (https://download.01.org/0day-ci/archive/20231207/202312070705.Br5fmO5J-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070705.Br5fmO5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070705.Br5fmO5J-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/apple/macaudio.c:985:1: sparse: sparse: symbol 'macaudio_spk_mux_enum' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:995:1: sparse: sparse: symbol 'macaudio_hp_mux_enum' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1016:5: sparse: sparse: symbol 'macaudio_sss_info' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1026:5: sparse: sparse: symbol 'macaudio_sss_get' was not declared. Should it be static?

vim +/macaudio_sss_info +1016 sound/soc/apple/macaudio.c

   984	
 > 985	SOC_ENUM_SINGLE_VIRT_DECL(macaudio_spk_mux_enum, macaudio_spk_mux_texts);
   986	
   987	static const struct snd_kcontrol_new macaudio_spk_mux =
   988		SOC_DAPM_ENUM("Speaker Playback Mux", macaudio_spk_mux_enum);
   989	
   990	static const char * const macaudio_hp_mux_texts[] = {
   991		"Primary",
   992		"Secondary"
   993	};
   994	
   995	SOC_ENUM_SINGLE_VIRT_DECL(macaudio_hp_mux_enum, macaudio_hp_mux_texts);
   996	
   997	static const struct snd_kcontrol_new macaudio_hp_mux =
   998		SOC_DAPM_ENUM("Headphones Playback Mux", macaudio_hp_mux_enum);
   999	
  1000	static const struct snd_soc_dapm_widget macaudio_snd_widgets[] = {
  1001		SND_SOC_DAPM_SPK("Speaker", NULL),
  1002		SND_SOC_DAPM_SPK("Speaker (Static)", NULL),
  1003		SND_SOC_DAPM_HP("Headphone", NULL),
  1004		SND_SOC_DAPM_MIC("Headset Mic", NULL),
  1005	
  1006		SND_SOC_DAPM_MUX("Speaker Playback Mux", SND_SOC_NOPM, 0, 0, &macaudio_spk_mux),
  1007		SND_SOC_DAPM_MUX("Headphone Playback Mux", SND_SOC_NOPM, 0, 0, &macaudio_hp_mux),
  1008	
  1009		SND_SOC_DAPM_AIF_OUT("Speaker Playback", NULL, 0, SND_SOC_NOPM, 0, 0),
  1010		SND_SOC_DAPM_AIF_OUT("Headphone Playback", NULL, 0, SND_SOC_NOPM, 0, 0),
  1011	
  1012		SND_SOC_DAPM_AIF_IN("Headset Capture", NULL, 0, SND_SOC_NOPM, 0, 0),
  1013		SND_SOC_DAPM_AIF_IN("Speaker Sense Capture", NULL, 0, SND_SOC_NOPM, 0, 0),
  1014	};
  1015	
> 1016	int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
  1017	{
  1018		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
  1019		uinfo->count = 1;
  1020		uinfo->value.integer.min = 0;
  1021		uinfo->value.integer.max = 1;
  1022	
  1023		return 0;
  1024	}
  1025	
> 1026	int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
  1027	{
  1028		struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
  1029		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1030	
  1031		/*
  1032		 * TODO: Check if any locking is in order here. I would
  1033		 * assume there is some ALSA-level lock, but DAPM implementations
  1034		 * of kcontrol ops do explicit locking, so look into it.
  1035		 */
  1036		uvalue->value.integer.value[0] = ma->speakers_streaming;
  1037	
  1038		return 0;
  1039	}
  1040	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
