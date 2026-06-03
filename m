Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C9E3D75A6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 02:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780454637; cv=none; b=WeK2mm2fjgtaDuVCvPVHWo850+PAeQSMq9coj6+9cSOhghbEK9OOkXtG+AGxglmcHLw3LzPU6ljBj9cu3kUZV2QerHsMa7qNXaj3QNjofGjyAZa2bO5VK/B6wl08JSgsdYG6C/qeBMfxkU4xLJBOvUk7hspA6/VtAAWHsEMekSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780454637; c=relaxed/simple;
	bh=GmTdc6a05RM4oKf158Lx+OdHHJ78gSfQmPLjrhcIBwg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SYGNARnxc/HTrcaj7AFp5YizCX90VVLAfuSgO6YGxygBNRgNuRsatqCD2FEUf2HB2w5FIKXpGvJNHyCSVYtzwcRc2sLe+p5Ume0b0KQ1nLYBR4hz7oPFPo32FXYSz8cn2G+XGjI303selS3O3V6ikzkM1HkrkuQI0xFf4lid0pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgtiF8co; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgtiF8co"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780454635; x=1811990635;
  h=date:from:to:cc:subject:message-id;
  bh=GmTdc6a05RM4oKf158Lx+OdHHJ78gSfQmPLjrhcIBwg=;
  b=mgtiF8colWXJQHLLlGSh/yATCjpGcxu9P7Q6z438Dp0TGMm+CE25SXAK
   7lDRYkZ9R4Vy0hXAYOO9Z4YrWHTZpqQyuYkXfiTU68x6qfTn63eHpFn1x
   GYonCVTfoupGnITk6II8YqI4nJWE3oCCFIf4kpNHHDXEWYnbYxC/Zo6w9
   4BNDF0mIz3OUW1elcQwfhDHDyudh1kOYZcsi+9gArYJJvo7boWqkvuuGf
   HbhoFc4cP/7svIznBJiXb7tK1kBPgOxSuYQKtM7Gk1QlOp5DRPVIkQugF
   adppe6TKsJsoKqe/djnblGMHLjzHdpqLtRM+lfBS6DVw+I0EivLjNoXKf
   g==;
X-CSE-ConnectionGUID: a9yKmPfuRfmHCozPbKwM2Q==
X-CSE-MsgGUID: hrv4mEBwT2qzor+i5o+cLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="84878420"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="84878420"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:43:55 -0700
X-CSE-ConnectionGUID: c69aSu/sRQaYQOVXA9E30Q==
X-CSE-MsgGUID: xSFrB7RnR9eTFRyKXoYMCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="245900141"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jun 2026 19:43:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUbaA-00000000CqA-2R4b;
	Wed, 03 Jun 2026 02:43:50 +0000
Date: Wed, 03 Jun 2026 10:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/mxs/mxs-sgtl5000.c:101:15: error: variable 'mxs_sgtl5000' has
 initializer but incomplete type
Message-ID: <202606031033.LjwDsnPV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: faf09df1f71dc5b7b2631559a9eec5d5a8e94eee [290/290] ASoC: mxs: mxs-sgtl5000: use snd_soc_card_register()
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260603/202606031033.LjwDsnPV-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031033.LjwDsnPV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031033.LjwDsnPV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mxs/mxs-sgtl5000.c:101:15: error: variable 'mxs_sgtl5000' has initializer but incomplete type
     101 | static struct snd_soc_card_platform mxs_sgtl5000 = {
         |               ^~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mxs/mxs-sgtl5000.c:102:10: error: 'struct snd_soc_card_platform' has no member named 'name'
     102 |         .name           = "mxs_sgtl5000",
         |          ^~~~
   sound/soc/mxs/mxs-sgtl5000.c:102:27: warning: excess elements in struct initializer
     102 |         .name           = "mxs_sgtl5000",
         |                           ^~~~~~~~~~~~~~
   sound/soc/mxs/mxs-sgtl5000.c:102:27: note: (near initialization for 'mxs_sgtl5000')
>> sound/soc/mxs/mxs-sgtl5000.c:103:10: error: 'struct snd_soc_card_platform' has no member named 'owner'
     103 |         .owner          = THIS_MODULE,
         |          ^~~~~
   In file included from arch/parisc/include/asm/alternative.h:18,
                    from arch/parisc/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from sound/soc/mxs/mxs-sgtl5000.c:6:
   include/linux/init.h:176:21: warning: excess elements in struct initializer
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/mxs/mxs-sgtl5000.c:103:27: note: in expansion of macro 'THIS_MODULE'
     103 |         .owner          = THIS_MODULE,
         |                           ^~~~~~~~~~~
   include/linux/init.h:176:21: note: (near initialization for 'mxs_sgtl5000')
     176 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   sound/soc/mxs/mxs-sgtl5000.c:103:27: note: in expansion of macro 'THIS_MODULE'
     103 |         .owner          = THIS_MODULE,
         |                           ^~~~~~~~~~~
>> sound/soc/mxs/mxs-sgtl5000.c:104:10: error: 'struct snd_soc_card_platform' has no member named 'driver'
     104 |         .driver = {
         |          ^~~~~~
>> sound/soc/mxs/mxs-sgtl5000.c:104:19: error: extra brace group at end of initializer
     104 |         .driver = {
         |                   ^
   sound/soc/mxs/mxs-sgtl5000.c:104:19: note: (near initialization for 'mxs_sgtl5000')
   sound/soc/mxs/mxs-sgtl5000.c:104:19: warning: excess elements in struct initializer
   sound/soc/mxs/mxs-sgtl5000.c:104:19: note: (near initialization for 'mxs_sgtl5000')
   sound/soc/mxs/mxs-sgtl5000.c: In function 'mxs_sgtl5000_probe':
>> sound/soc/mxs/mxs-sgtl5000.c:117:52: error: passing argument 2 of 'devm_snd_soc_card_alloc' from incompatible pointer type [-Wincompatible-pointer-types]
     117 |         card = devm_snd_soc_card_alloc(&pdev->dev, &mxs_sgtl5000);
         |                                                    ^~~~~~~~~~~~~
         |                                                    |
         |                                                    struct snd_soc_card_platform *
   In file included from include/sound/soc.h:1318,
                    from sound/soc/mxs/mxs-sgtl5000.c:11:
   include/sound/soc-card.h:91:74: note: expected 'struct snd_soc_card_driver *' but argument is of type 'struct snd_soc_card_platform *'
      91 |                                              struct snd_soc_card_driver *driver);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> sound/soc/mxs/mxs-sgtl5000.c:157:29: error: invalid use of undefined type 'struct snd_soc_card_platform'
     157 |                 mxs_sgtl5000.driver.dapm_widgets = mxs_sgtl5000_dapm_widgets;
         |                             ^
   sound/soc/mxs/mxs-sgtl5000.c:158:29: error: invalid use of undefined type 'struct snd_soc_card_platform'
     158 |                 mxs_sgtl5000.driver.num_dapm_widgets = ARRAY_SIZE(mxs_sgtl5000_dapm_widgets);
         |                             ^
   sound/soc/mxs/mxs-sgtl5000.c: At top level:
>> sound/soc/mxs/mxs-sgtl5000.c:101:37: error: storage size of 'mxs_sgtl5000' isn't known
     101 | static struct snd_soc_card_platform mxs_sgtl5000 = {
         |                                     ^~~~~~~~~~~~


vim +/mxs_sgtl5000 +101 sound/soc/mxs/mxs-sgtl5000.c

  > 11	#include <sound/soc.h>
    12	#include <sound/jack.h>
    13	#include <sound/soc-dapm.h>
    14	
    15	#include "../codecs/sgtl5000.h"
    16	#include "mxs-saif.h"
    17	
    18	static int mxs_sgtl5000_hw_params(struct snd_pcm_substream *substream,
    19		struct snd_pcm_hw_params *params)
    20	{
    21		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
    22		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
    23		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
    24		unsigned int rate = params_rate(params);
    25		u32 mclk;
    26		int ret;
    27	
    28		/* sgtl5000 does not support 512*rate when in 96000 fs */
    29		switch (rate) {
    30		case 96000:
    31			mclk = 256 * rate;
    32			break;
    33		default:
    34			mclk = 512 * rate;
    35			break;
    36		}
    37	
    38		/* Set SGTL5000's SYSCLK (provided by SAIF MCLK) */
    39		ret = snd_soc_dai_set_sysclk(codec_dai, SGTL5000_SYSCLK, mclk, 0);
    40		if (ret) {
    41			dev_err(codec_dai->dev, "Failed to set sysclk to %u.%03uMHz\n",
    42				mclk / 1000000, mclk / 1000 % 1000);
    43			return ret;
    44		}
    45	
    46		/* The SAIF MCLK should be the same as SGTL5000_SYSCLK */
    47		ret = snd_soc_dai_set_sysclk(cpu_dai, MXS_SAIF_MCLK, mclk, 0);
    48		if (ret) {
    49			dev_err(cpu_dai->dev, "Failed to set sysclk to %u.%03uMHz\n",
    50				mclk / 1000000, mclk / 1000 % 1000);
    51			return ret;
    52		}
    53	
    54		return 0;
    55	}
    56	
    57	static const struct snd_soc_ops mxs_sgtl5000_hifi_ops = {
    58		.hw_params = mxs_sgtl5000_hw_params,
    59	};
    60	
    61	#define MXS_SGTL5000_DAI_FMT (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | \
    62		SND_SOC_DAIFMT_CBC_CFC)
    63	
    64	
    65	SND_SOC_DAILINK_DEFS(hifi_tx,
    66		DAILINK_COMP_ARRAY(COMP_EMPTY()),
    67		DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "sgtl5000")),
    68		DAILINK_COMP_ARRAY(COMP_EMPTY()));
    69	
    70	SND_SOC_DAILINK_DEFS(hifi_rx,
    71		DAILINK_COMP_ARRAY(COMP_EMPTY()),
    72		DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "sgtl5000")),
    73		DAILINK_COMP_ARRAY(COMP_EMPTY()));
    74	
    75	static struct snd_soc_dai_link mxs_sgtl5000_dai[] = {
    76		{
    77			.name		= "HiFi Tx",
    78			.stream_name	= "HiFi Playback",
    79			.dai_fmt	= MXS_SGTL5000_DAI_FMT,
    80			.ops		= &mxs_sgtl5000_hifi_ops,
    81			.playback_only	= true,
    82			SND_SOC_DAILINK_REG(hifi_tx),
    83		}, {
    84			.name		= "HiFi Rx",
    85			.stream_name	= "HiFi Capture",
    86			.dai_fmt	= MXS_SGTL5000_DAI_FMT,
    87			.ops		= &mxs_sgtl5000_hifi_ops,
    88			.capture_only	= true,
    89			SND_SOC_DAILINK_REG(hifi_rx),
    90		},
    91	};
    92	
    93	static const struct snd_soc_dapm_widget mxs_sgtl5000_dapm_widgets[] = {
    94		SND_SOC_DAPM_MIC("Mic Jack", NULL),
    95		SND_SOC_DAPM_LINE("Line In Jack", NULL),
    96		SND_SOC_DAPM_HP("Headphone Jack", NULL),
    97		SND_SOC_DAPM_SPK("Line Out Jack", NULL),
    98		SND_SOC_DAPM_SPK("Ext Spk", NULL),
    99	};
   100	
 > 101	static struct snd_soc_card_platform mxs_sgtl5000 = {
 > 102		.name		= "mxs_sgtl5000",
 > 103		.owner		= THIS_MODULE,
 > 104		.driver = {
   105			.dai_link	= mxs_sgtl5000_dai,
   106			.num_links	= ARRAY_SIZE(mxs_sgtl5000_dai),
   107		},
   108	};
   109	
   110	static int mxs_sgtl5000_probe(struct platform_device *pdev)
   111	{
   112		struct snd_soc_card *card;
   113		int ret, i;
   114		struct device_node *np = pdev->dev.of_node;
   115		struct device_node *saif_np[2], *codec_np;
   116	
 > 117		card = devm_snd_soc_card_alloc(&pdev->dev, &mxs_sgtl5000);
   118		if (!card)
   119			return -ENOMEM;
   120	
   121		saif_np[0] = of_parse_phandle(np, "saif-controllers", 0);
   122		saif_np[1] = of_parse_phandle(np, "saif-controllers", 1);
   123		codec_np = of_parse_phandle(np, "audio-codec", 0);
   124		if (!saif_np[0] || !saif_np[1] || !codec_np) {
   125			dev_err(&pdev->dev, "phandle missing or invalid\n");
   126			of_node_put(codec_np);
   127			of_node_put(saif_np[0]);
   128			of_node_put(saif_np[1]);
   129			return -EINVAL;
   130		}
   131	
   132		for (i = 0; i < 2; i++) {
   133			mxs_sgtl5000_dai[i].codecs->name = NULL;
   134			mxs_sgtl5000_dai[i].codecs->of_node = codec_np;
   135			mxs_sgtl5000_dai[i].cpus->dai_name = NULL;
   136			mxs_sgtl5000_dai[i].cpus->of_node = saif_np[i];
   137			mxs_sgtl5000_dai[i].platforms->name = NULL;
   138			mxs_sgtl5000_dai[i].platforms->of_node = saif_np[i];
   139		}
   140	
   141		of_node_put(codec_np);
   142		of_node_put(saif_np[0]);
   143		of_node_put(saif_np[1]);
   144	
   145		/*
   146		 * Set an init clock(11.28Mhz) for sgtl5000 initialization(i2c r/w).
   147		 * The Sgtl5000 sysclk is derived from saif0 mclk and it's range
   148		 * should be >= 8MHz and <= 27M.
   149		 */
   150		ret = mxs_saif_get_mclk(0, 44100 * 256, 44100);
   151		if (ret) {
   152			dev_err(&pdev->dev, "failed to get mclk\n");
   153			return ret;
   154		}
   155	
   156		if (of_property_present(np, "audio-routing")) {
 > 157			mxs_sgtl5000.driver.dapm_widgets = mxs_sgtl5000_dapm_widgets;
   158			mxs_sgtl5000.driver.num_dapm_widgets = ARRAY_SIZE(mxs_sgtl5000_dapm_widgets);
   159	
   160			ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
   161			if (ret) {
   162				dev_err(&pdev->dev, "failed to parse audio-routing (%d)\n",
   163					ret);
   164				mxs_saif_put_mclk(0);
   165				return ret;
   166			}
   167		}
   168	
   169		ret = devm_snd_soc_card_register(card);
   170		if (ret) {
   171			mxs_saif_put_mclk(0);
   172			return dev_err_probe(&pdev->dev, ret, "snd_soc_card_register() failed\n");
   173		}
   174	
   175		return 0;
   176	}
   177	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
