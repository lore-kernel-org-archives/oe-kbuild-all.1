Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D9837A82E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 05:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846304; cv=none; b=nWiiLowUIAFkPv1yjJeqSXNOL3CL49kSihBy0RSgWMxveN36dUrdG4OR7sI69Whls7D+OAlSqMfCDuOZFc99e2IBtKskqBN+fpBOPijl6x5dQttHWW1Kaoa2npl58+hxBkpRA5O0Z+rk/W4E0lxLmx7eVv+YpU2X7brTL9ea5Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846304; c=relaxed/simple;
	bh=KC0QiPzx3Q9pGK+KMLzD23oPYzdgCtrvWnOVa1cl8yc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J8wKJJEWoVU3823n3A6dAyrA05OTNJUvYeRlbuMH2r8B/e8KWS/IXKlZUVO3Trwf8uv4S/df0jj4ZfRYw3pWtqh82/QpNq4dobObcdnjMOhW4oLRM7OYIoDHU6pXyLttMoIz6nMlVnleBnzw37xdsWc/axge9GoTHx8U/iSSInI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQpqD8sN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQpqD8sN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788846302; x=1820382302;
  h=date:from:to:cc:subject:message-id;
  bh=KC0QiPzx3Q9pGK+KMLzD23oPYzdgCtrvWnOVa1cl8yc=;
  b=MQpqD8sNhNhQKUUWJdIOiWSJY1ptjl6FhhRGlA2MRlI0PBqleXfSEB2T
   0IRZXUDVlbJ3Y2UZBysh4+6xd2hdItKleZ6c09Y82439L5RW7j7Yxd7n3
   QpgR/miBaNoXuj4pbvDfT7a7pxJNG2UpXgK1/8sul8E8Je1QLtUqiL1Tz
   QZorZD84RsJp9s1RXYjyH6VY9BylZav22iMfzAPNBMggWBmQwd7ZFObwC
   A2/vBSXY75SjX4oE/60EbgEKK523CnmTwDUjheRADZ0GnW/HNDK0DgI/j
   6MUY9r8eKeSiEj6Np3IxkSgdaxuHjQZP14wT1UWImeU91iUZ3Dot721el
   Q==;
X-CSE-ConnectionGUID: HEFNgFiuRHGNfn551gBVow==
X-CSE-MsgGUID: xVKrI037Q4m2p+m1Kbw21w==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89255826"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89255826"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 22:44:58 -0700
X-CSE-ConnectionGUID: l+ZaLf9bRtqF4ZJw2fj7sw==
X-CSE-MsgGUID: rs7sQAhuTKu1N9mYdpL+Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="276150292"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Sep 2026 22:44:57 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3oda-000000001it-1vTn;
	Tue, 08 Sep 2026 05:44:54 +0000
Date: Tue, 08 Sep 2026 13:44:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-09-04 265/343]
 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:79:43: error: implicit
 declaration of function 'snd_soc_card_get_drvdata'; did you mean
 'snd_soc_card_set_priv'?
Message-ID: <202609081307.Al1r1h8o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-09-04
head:   dfa282dfe99643be782149d948208f3d514ebb99
commit: 9d6fae1badfb21786797586c01016e4413a98c3a [265/343] ASoC: soc-card.h: remove compatible definition
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260908/202609081307.Al1r1h8o-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081307.Al1r1h8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081307.Al1r1h8o-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c: In function 'asoc_sdw_senary_sdca_jack_rtd_init':
>> sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:79:43: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
      79 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           snd_soc_card_set_priv
>> sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:79:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:85:24: error: invalid use of undefined type 'struct snd_soc_dai'
      85 |         component = dai->component;
         |                        ^~
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:88:70: error: invalid use of undefined type 'struct snd_soc_component'
      88 |                                           card->components, component->name_prefix);
         |                                                                      ^~
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:93:38: error: invalid use of undefined type 'struct snd_soc_component'
      93 |                 if (!strstr(component->name_prefix, need_sdca_suffix[i]))
         |                                      ^~
   In file included from include/linux/device.h:15,
                    from sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:6:
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:112:70: error: invalid use of undefined type 'struct snd_soc_component'
     112 |                 dev_err(card->dev, "%s is not supported\n", component->name_prefix);
         |                                                                      ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:112:17: note: in expansion of macro 'dev_err'
     112 |                 dev_err(card->dev, "%s is not supported\n", component->name_prefix);
         |                 ^~~~~~~
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c: In function 'asoc_sdw_senary_sdca_jack_exit':
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:148:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     148 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c: In function 'asoc_sdw_senary_sdca_jack_init':
   sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c:173:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     173 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/sdw_utils/soc_sdw_senary_amp.c: In function 'asoc_sdw_senary_amp_exit':
>> sound/soc/sdw_utils/soc_sdw_senary_amp.c:23:43: error: implicit declaration of function 'snd_soc_card_get_drvdata'; did you mean 'snd_soc_card_set_priv'? [-Wimplicit-function-declaration]
      23 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                           snd_soc_card_set_priv
>> sound/soc/sdw_utils/soc_sdw_senary_amp.c:23:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/sdw_utils/soc_sdw_senary_amp.c: In function 'asoc_sdw_senary_amp_init':
   sound/soc/sdw_utils/soc_sdw_senary_amp.c:44:43: error: initialization of 'struct asoc_sdw_mc_private *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      44 |         struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~


vim +79 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c

77272ecd96d73a Qianghua Wang 2026-09-01   74  
77272ecd96d73a Qianghua Wang 2026-09-01   75  int asoc_sdw_senary_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
77272ecd96d73a Qianghua Wang 2026-09-01   76  {
77272ecd96d73a Qianghua Wang 2026-09-01   77  	struct snd_soc_card *card = rtd->card;
77272ecd96d73a Qianghua Wang 2026-09-01   78  	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
77272ecd96d73a Qianghua Wang 2026-09-01  @79  	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
77272ecd96d73a Qianghua Wang 2026-09-01   80  	struct snd_soc_component *component;
77272ecd96d73a Qianghua Wang 2026-09-01   81  	struct snd_soc_jack *jack;
77272ecd96d73a Qianghua Wang 2026-09-01   82  	int ret;
77272ecd96d73a Qianghua Wang 2026-09-01   83  	int i;
77272ecd96d73a Qianghua Wang 2026-09-01   84  
77272ecd96d73a Qianghua Wang 2026-09-01   85  	component = dai->component;
77272ecd96d73a Qianghua Wang 2026-09-01   86  	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
77272ecd96d73a Qianghua Wang 2026-09-01   87  					  "%s hs:%s",
77272ecd96d73a Qianghua Wang 2026-09-01   88  					  card->components, component->name_prefix);
77272ecd96d73a Qianghua Wang 2026-09-01   89  	if (!card->components)
77272ecd96d73a Qianghua Wang 2026-09-01   90  		return -ENOMEM;
77272ecd96d73a Qianghua Wang 2026-09-01   91  
77272ecd96d73a Qianghua Wang 2026-09-01   92  	for (i = 0; i < ARRAY_SIZE(need_sdca_suffix); i++) {
77272ecd96d73a Qianghua Wang 2026-09-01   93  		if (!strstr(component->name_prefix, need_sdca_suffix[i]))
77272ecd96d73a Qianghua Wang 2026-09-01   94  			continue;
77272ecd96d73a Qianghua Wang 2026-09-01   95  
77272ecd96d73a Qianghua Wang 2026-09-01   96  		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
77272ecd96d73a Qianghua Wang 2026-09-01   97  						  "%s-sdca", card->components);
77272ecd96d73a Qianghua Wang 2026-09-01   98  		if (!card->components)
77272ecd96d73a Qianghua Wang 2026-09-01   99  			return -ENOMEM;
77272ecd96d73a Qianghua Wang 2026-09-01  100  
77272ecd96d73a Qianghua Wang 2026-09-01  101  		ret = snd_soc_dapm_add_routes(dapm, senary_sdca_jack_map,
77272ecd96d73a Qianghua Wang 2026-09-01  102  					      ARRAY_SIZE(senary_sdca_jack_map));
77272ecd96d73a Qianghua Wang 2026-09-01  103  		if (ret) {
77272ecd96d73a Qianghua Wang 2026-09-01  104  			dev_err(card->dev,
77272ecd96d73a Qianghua Wang 2026-09-01  105  				"senary sdca jack map addition failed: %d\n", ret);
77272ecd96d73a Qianghua Wang 2026-09-01  106  			return ret;
77272ecd96d73a Qianghua Wang 2026-09-01  107  		}
77272ecd96d73a Qianghua Wang 2026-09-01  108  		break;
77272ecd96d73a Qianghua Wang 2026-09-01  109  	}
77272ecd96d73a Qianghua Wang 2026-09-01  110  
77272ecd96d73a Qianghua Wang 2026-09-01  111  	if (i == ARRAY_SIZE(need_sdca_suffix)) {
77272ecd96d73a Qianghua Wang 2026-09-01  112  		dev_err(card->dev, "%s is not supported\n", component->name_prefix);
77272ecd96d73a Qianghua Wang 2026-09-01  113  		return -EINVAL;
77272ecd96d73a Qianghua Wang 2026-09-01  114  	}
77272ecd96d73a Qianghua Wang 2026-09-01  115  
77272ecd96d73a Qianghua Wang 2026-09-01  116  	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
77272ecd96d73a Qianghua Wang 2026-09-01  117  					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
77272ecd96d73a Qianghua Wang 2026-09-01  118  					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
77272ecd96d73a Qianghua Wang 2026-09-01  119  					 SND_JACK_BTN_3,
77272ecd96d73a Qianghua Wang 2026-09-01  120  					 &ctx->sdw_headset,
77272ecd96d73a Qianghua Wang 2026-09-01  121  					 senary_sdca_jack_pins,
77272ecd96d73a Qianghua Wang 2026-09-01  122  					 ARRAY_SIZE(senary_sdca_jack_pins));
77272ecd96d73a Qianghua Wang 2026-09-01  123  	if (ret) {
77272ecd96d73a Qianghua Wang 2026-09-01  124  		dev_err(rtd->card->dev, "Headset Jack creation failed: %d\n",
77272ecd96d73a Qianghua Wang 2026-09-01  125  			ret);
77272ecd96d73a Qianghua Wang 2026-09-01  126  		return ret;
77272ecd96d73a Qianghua Wang 2026-09-01  127  	}
77272ecd96d73a Qianghua Wang 2026-09-01  128  
77272ecd96d73a Qianghua Wang 2026-09-01  129  	jack = &ctx->sdw_headset;
77272ecd96d73a Qianghua Wang 2026-09-01  130  
77272ecd96d73a Qianghua Wang 2026-09-01  131  	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
77272ecd96d73a Qianghua Wang 2026-09-01  132  	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
77272ecd96d73a Qianghua Wang 2026-09-01  133  	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
77272ecd96d73a Qianghua Wang 2026-09-01  134  	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
77272ecd96d73a Qianghua Wang 2026-09-01  135  
77272ecd96d73a Qianghua Wang 2026-09-01  136  	ret = snd_soc_component_set_jack(component, jack, NULL);
77272ecd96d73a Qianghua Wang 2026-09-01  137  
77272ecd96d73a Qianghua Wang 2026-09-01  138  	if (ret)
77272ecd96d73a Qianghua Wang 2026-09-01  139  		dev_err(rtd->card->dev, "Headset Jack call-back failed: %d\n",
77272ecd96d73a Qianghua Wang 2026-09-01  140  			ret);
77272ecd96d73a Qianghua Wang 2026-09-01  141  
77272ecd96d73a Qianghua Wang 2026-09-01  142  	return ret;
77272ecd96d73a Qianghua Wang 2026-09-01  143  }
77272ecd96d73a Qianghua Wang 2026-09-01  144  EXPORT_SYMBOL_NS(asoc_sdw_senary_sdca_jack_rtd_init, "SND_SOC_SDW_UTILS");
77272ecd96d73a Qianghua Wang 2026-09-01  145  

:::::: The code at line 79 was first introduced by commit
:::::: 77272ecd96d73a90ffc6d4f7939d16ce45303f5b ASoC: sdw_utils: add Senary SN624x helpers and codec_info

:::::: TO: Qianghua Wang <qianghua.wang@senarytech.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
