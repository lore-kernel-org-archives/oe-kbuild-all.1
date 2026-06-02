Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A76364057
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412417; cv=none; b=hRVNIOcoOG4rB7K70pLKre62k4uhmtP6QQU9Gbfrtr/ORtyJsv5RnzcWD5xfbdbX/UlwqLMEXsiofFbvOY2YxRLhmo3LpL5uxXXhbXyAKWNhGVtqNsy5DNiIk0zToeYqpiBAOioQHbTpWyeaqLV4TlybcOpobs4XhvC406iUkBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412417; c=relaxed/simple;
	bh=+TxXPCE/eqkvTO1i0ubYLaE6JPPC6jt7Rx+g6B4CRB4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=epTfws21lXYoK+s0kG4kenUyJeIahEnqhezvr+xVN3RdC0LG323Mu5SVD1z4QWThhpNM8u5rdN4xG2AxbWzmFL69LLfw1QJVvJ7hDXqwSE92ANJtEEI34E1E3sdNxlaqhbk7fR0cpdc3Hely2O/Mh4kggkfk2gh4vmChmRhfcGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emWyfNq/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emWyfNq/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780412416; x=1811948416;
  h=date:from:to:cc:subject:message-id;
  bh=+TxXPCE/eqkvTO1i0ubYLaE6JPPC6jt7Rx+g6B4CRB4=;
  b=emWyfNq/iNpfMqZ+b0KDPGxyCzEy0SX7kVE4mMMw4YE2rL4CHZdxYv8M
   5B0DGZrEn3uwKsLLF5v+ZNy5SuURdX3IMrFyxM1eoDQFF6u6yIo9uR5tz
   NYSwt08fM37qWochpVqhGS3GN2EiWGAAoTykCj6g1txl16lPoaFXbkBAJ
   PiFceTcXmoaapRwpWlUDR8sBE5neOVDh8fCa4IezBJ9Ev5gRL+86pMkis
   1NtrgRnXKC7v+K4JbvFFl5EA9JRRVdByk6LB8+xTTzh+oP6PQp3lFP8ov
   wW4pY8+j9E84pKr9eltgNv38BwUgW7qaHN9vWBYsBlzwJPTSUmiZLPjIV
   A==;
X-CSE-ConnectionGUID: dxM6Ts6gS86d2SW/DlL4OA==
X-CSE-MsgGUID: XXVhvQCvQF+tjBQldd5lLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81195170"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81195170"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 08:00:15 -0700
X-CSE-ConnectionGUID: 4bKVMAuyS0GahdnXtp+kQA==
X-CSE-MsgGUID: W1Az7HtmRK+t+vdpSAucIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="239756893"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jun 2026 08:00:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUQbC-00000000C9K-2F9F;
	Tue, 02 Jun 2026 15:00:10 +0000
Date: Tue, 02 Jun 2026 22:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/codecs/cx20442.c:250:17: warning: assignment to 'struct
 cx20442_priv *' from 'int' makes pointer from integer without a cast
Message-ID: <202606022245.BxegzKrA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: be2dfcdd460ff025011f95257876a89883815cda [290/290] ASoC: soc-component: remove snd_soc_component_{set/get}_drvdata()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260602/202606022245.BxegzKrA-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606022245.BxegzKrA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606022245.BxegzKrA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/cx20442.c: In function 'v253_close':
   sound/soc/codecs/cx20442.c:250:19: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Werror=implicit-function-declaration]
     250 |         cx20442 = snd_soc_component_get_drvdata(component);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                   snd_soc_component_set_jack
>> sound/soc/codecs/cx20442.c:250:17: warning: assignment to 'struct cx20442_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     250 |         cx20442 = snd_soc_component_get_drvdata(component);
         |                 ^
   sound/soc/codecs/cx20442.c: In function 'cx20442_component_probe':
   sound/soc/codecs/cx20442.c:355:30: warning: unused variable 'card' [-Wunused-variable]
     355 |         struct snd_soc_card *card = snd_soc_component_to_card(component);
         |                              ^~~~
   cc1: some warnings being treated as errors
--
   sound/soc/codecs/rt722-sdca.c: In function 'rt722_cae_update_put':
   sound/soc/codecs/rt722-sdca.c:579:41: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Werror=implicit-function-declaration]
     579 |         struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         snd_soc_component_set_jack
>> sound/soc/codecs/rt722-sdca.c:579:41: warning: initialization of 'struct rt722_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/rt722-sdca.c: In function 'rt722_cae_update_get':
   sound/soc/codecs/rt722-sdca.c:617:41: warning: initialization of 'struct rt722_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     617 |         struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/rt722-sdca.c: In function 'rt722_sdca_fu06_playback_get':
   sound/soc/codecs/rt722-sdca.c:829:41: warning: initialization of 'struct rt722_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     829 |         struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/rt722-sdca.c: In function 'rt722_sdca_fu06_playback_put':
   sound/soc/codecs/rt722-sdca.c:840:41: warning: initialization of 'struct rt722_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     840 |         struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   sound/soc/codecs/tas675x.c: In function 'tas675x_set_rtldg_thresh':
   sound/soc/codecs/tas675x.c:324:36: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Werror=implicit-function-declaration]
     324 |         struct tas675x_priv *tas = snd_soc_component_get_drvdata(comp);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_component_set_jack
>> sound/soc/codecs/tas675x.c:324:36: warning: initialization of 'struct tas675x_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/tas675x.c: In function 'tas675x_get_rtldg_thresh':
   sound/soc/codecs/tas675x.c:353:36: warning: initialization of 'struct tas675x_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     353 |         struct tas675x_priv *tas = snd_soc_component_get_drvdata(comp);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas675x.c: In function 'tas675x_set_dcldg_trigger':
   sound/soc/codecs/tas675x.c:379:36: warning: initialization of 'struct tas675x_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     379 |         struct tas675x_priv *tas = snd_soc_component_get_drvdata(comp);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas675x.c: In function 'tas675x_set_acldg_trigger':
   sound/soc/codecs/tas675x.c:495:36: warning: initialization of 'struct tas675x_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     495 |         struct tas675x_priv *tas = snd_soc_component_get_drvdata(comp);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas675x.c: In function 'tas675x_get_rtldg_impedance':
   sound/soc/codecs/tas675x.c:577:36: warning: initialization of 'struct tas675x_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     577 |         struct tas675x_priv *tas = snd_soc_component_get_drvdata(comp);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas675x.c: In function 'tas675x_get_dc_resistance':
   sound/soc/codecs/tas675x.c:605:36: warning: initialization of 'struct tas675x_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     605 |         struct tas675x_priv *tas = snd_soc_component_get_drvdata(comp);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas675x.c: In function 'tas675x_hw_params':
   sound/soc/codecs/tas675x.c:1127:50: error: invalid use of undefined type 'struct snd_soc_dai'
    1127 |         struct snd_soc_component *component = dai->component;
         |                                                  ^~
   sound/soc/codecs/tas675x.c:1128:36: warning: initialization of 'struct tas675x_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1128 |         struct tas675x_priv *tas = snd_soc_component_get_drvdata(component);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas675x.c:1214:46: error: invalid use of undefined type 'struct snd_soc_dai'
    1214 |         tas675x_program_slot_offsets(tas, dai->id,
         |                                              ^~
   sound/soc/codecs/tas675x.c: In function 'tas675x_set_fmt':
   sound/soc/codecs/tas675x.c:1224:50: error: invalid use of undefined type 'struct snd_soc_dai'
    1224 |         struct snd_soc_component *component = dai->component;
         |                                                  ^~
   sound/soc/codecs/tas675x.c:1225:36: warning: initialization of 'struct tas675x_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1225 |         struct tas675x_priv *tas = snd_soc_component_get_drvdata(component);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas675x.c:1315:16: error: invalid use of undefined type 'struct snd_soc_dai'
    1315 |         if (dai->id == 2) {
         |                ^~
   sound/soc/codecs/tas675x.c: In function 'tas675x_set_tdm_slot':
   sound/soc/codecs/tas675x.c:1360:69: error: invalid use of undefined type 'struct snd_soc_dai'
    1360 |         struct tas675x_priv *tas = snd_soc_component_get_drvdata(dai->component);
         |                                                                     ^~
   sound/soc/codecs/tas675x.c: In function 'tas675x_mute_stream':
   sound/soc/codecs/tas675x.c:1376:50: error: invalid use of undefined type 'struct snd_soc_dai'
    1376 |         struct snd_soc_component *component = dai->component;
         |                                                  ^~
   sound/soc/codecs/tas675x.c:1377:36: warning: initialization of 'struct tas675x_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1377 |         struct tas675x_priv *tas = snd_soc_component_get_drvdata(component);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas675x.c:1383:38: error: invalid use of undefined type 'struct snd_soc_dai'
    1383 |                         clear_bit(dai->id, &tas->active_capture_dais);
         |                                      ^~
   sound/soc/codecs/tas675x.c:1385:36: error: invalid use of undefined type 'struct snd_soc_dai'
    1385 |                         set_bit(dai->id, &tas->active_capture_dais);
         |                                    ^~
   sound/soc/codecs/tas675x.c:1395:30: error: invalid use of undefined type 'struct snd_soc_dai'
    1395 |                 clear_bit(dai->id, &tas->active_playback_dais);
         |                              ^~
   sound/soc/codecs/tas675x.c:1397:28: error: invalid use of undefined type 'struct snd_soc_dai'
    1397 |                 set_bit(dai->id, &tas->active_playback_dais);
         |                            ^~
   cc1: some warnings being treated as errors
--
   sound/soc/sof/ipc3-topology.c: In function 'sof_ipc3_widget_setup_comp_pipeline':
   sound/soc/sof/ipc3-topology.c:527:36: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Werror=implicit-function-declaration]
     527 |         struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    snd_soc_component_set_jack
>> sound/soc/sof/ipc3-topology.c:527:36: warning: initialization of 'struct snd_sof_dev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors
--
   sound/soc/tegra/tegra210_mixer.c: In function 'tegra210_mixer_get_fade_duration':
   sound/soc/tegra/tegra210_mixer.c:202:40: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Werror=implicit-function-declaration]
     202 |         struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                        snd_soc_component_set_jack
>> sound/soc/tegra/tegra210_mixer.c:202:40: warning: initialization of 'struct tegra210_mixer *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/tegra/tegra210_mixer.c: In function 'tegra210_mixer_put_fade_duration':
   sound/soc/tegra/tegra210_mixer.c:215:40: warning: initialization of 'struct tegra210_mixer *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     215 |         struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/tegra/tegra210_mixer.c: In function 'tegra210_mixer_get_fade_gain':
   sound/soc/tegra/tegra210_mixer.c:238:40: warning: initialization of 'struct tegra210_mixer *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     238 |         struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/tegra/tegra210_mixer.c: In function 'tegra210_mixer_put_fade_gain':
   sound/soc/tegra/tegra210_mixer.c:251:40: warning: initialization of 'struct tegra210_mixer *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     251 |         struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/tegra/tegra210_mixer.c: In function 'tegra210_mixer_put_fade_switch':
   sound/soc/tegra/tegra210_mixer.c:279:40: warning: initialization of 'struct tegra210_mixer *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     279 |         struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/tegra/tegra210_mixer.c: In function 'tegra210_mixer_get_fade_status':
   sound/soc/tegra/tegra210_mixer.c:366:40: warning: initialization of 'struct tegra210_mixer *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     366 |         struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +250 sound/soc/codecs/cx20442.c

ad120dae127f5c Janusz Krzysztofik 2009-07-29  237  
ad120dae127f5c Janusz Krzysztofik 2009-07-29  238  /* Line discipline .close() */
ad120dae127f5c Janusz Krzysztofik 2009-07-29  239  static void v253_close(struct tty_struct *tty)
ad120dae127f5c Janusz Krzysztofik 2009-07-29  240  {
446c921ecedc6a Janusz Krzysztofik 2026-05-12  241  	struct cx20442_codec *codec = tty->disc_data;
446c921ecedc6a Janusz Krzysztofik 2026-05-12  242  	struct snd_soc_component *component = codec->component;
f0fba2ad1b6b53 Liam Girdwood      2010-03-17  243  	struct cx20442_priv *cx20442;
ad120dae127f5c Janusz Krzysztofik 2009-07-29  244  
ad120dae127f5c Janusz Krzysztofik 2009-07-29  245  	tty->disc_data = NULL;
ad120dae127f5c Janusz Krzysztofik 2009-07-29  246  
d0fdfe34080c64 Kuninori Morimoto  2018-01-29  247  	if (!component)
ad120dae127f5c Janusz Krzysztofik 2009-07-29  248  		return;
ad120dae127f5c Janusz Krzysztofik 2009-07-29  249  
d0fdfe34080c64 Kuninori Morimoto  2018-01-29 @250  	cx20442 = snd_soc_component_get_drvdata(component);
f0fba2ad1b6b53 Liam Girdwood      2010-03-17  251  
ad120dae127f5c Janusz Krzysztofik 2009-07-29  252  	/* Prevent the codec driver from further accessing the modem */
fac3f5e20dcecc Kuninori Morimoto  2017-11-09  253  	cx20442->tty = NULL;
446c921ecedc6a Janusz Krzysztofik 2026-05-12  254  	codec->ready = false;
ad120dae127f5c Janusz Krzysztofik 2009-07-29  255  }
ad120dae127f5c Janusz Krzysztofik 2009-07-29  256  

:::::: The code at line 250 was first introduced by commit
:::::: d0fdfe34080c64127b2e57525a84e3fb3cc29d87 ASoC: cx20442: replace codec to component

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
