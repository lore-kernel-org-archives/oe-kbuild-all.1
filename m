Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE6C6FA9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 12:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692103915; x=1723639915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DF3c3FlBjN2B7MHlrb3MwttNJsj7DtYQu63RGdmXd04=;
  b=iw1MIh7a4uAWjjUW5wnsMldH3nGHI4iucCspUgS76S79xZomhfzzVY6X
   DQ6ahYjSbGRZgEI6BWIAHJ09PjWZ++OSGvefNurRBQG1BrZvGIX3byrPv
   H/2XC7uhlVipfxZTI+822sDiE5LVuGAuy/YAfC/vmXB6Xv+QjGDJbJAbk
   jOKfZqJPyIwG8R3mozFpjGPYSQSrxZRcl/UOK5T6DuDIw+QrWfxzK9akt
   JqzotxXfSGb6UWdfyjk4Lp8ljCX4k98RNqvF8M/7jSw/AKm5VbgNjOGBh
   EV6KnD9JEJv22tDcGMmfyfFE+MM/nkva84Yjr9PfecsqnXDxw7bBgdlkb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371176289"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="371176289"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 05:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="823840815"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="823840815"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2023 05:51:53 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVtWa-0000yd-1Y;
	Tue, 15 Aug 2023 12:51:52 +0000
Date: Tue, 15 Aug 2023 20:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-6.6 218/221]
 sound/soc/fsl/mpc5200_psc_ac97.c:236:10: error: 'struct snd_soc_dai_driver'
 has no member named 'probe'
Message-ID: <202308152047.psX1QNDh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.6
head:   56f6ee6d5373406df9f60a870f470ab4b3e6d967
commit: 446b31e894935ebbcf84302061a4e0e2efb2368f [218/221] ASoC: soc-dai.h: remove unused call back functions
config: powerpc-randconfig-r092-20230815 (https://download.01.org/0day-ci/archive/20230815/202308152047.psX1QNDh-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308152047.psX1QNDh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308152047.psX1QNDh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/fsl/mpc5200_psc_ac97.c:236:10: error: 'struct snd_soc_dai_driver' has no member named 'probe'
     236 |         .probe  = psc_ac97_probe,
         |          ^~~~~
>> sound/soc/fsl/mpc5200_psc_ac97.c:236:19: warning: initialization of 'unsigned int' from 'int (*)(struct snd_soc_dai *)' makes integer from pointer without a cast [-Wint-conversion]
     236 |         .probe  = psc_ac97_probe,
         |                   ^~~~~~~~~~~~~~
   sound/soc/fsl/mpc5200_psc_ac97.c:236:19: note: (near initialization for 'psc_ac97_dai[0].id')

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
   Selected by [y]:
   - SND_MPC52xx_SOC_PCM030 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC5200_SIMPLE [=y]
   WARNING: unmet direct dependencies detected for SND_SOC_WM9712
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && (SND_SOC_AC97_BUS [=n] || AC97_BUS_NEW [=n])
   Selected by [y]:
   - SND_MPC52xx_SOC_PCM030 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC5200_SIMPLE [=y]


vim +236 sound/soc/fsl/mpc5200_psc_ac97.c

20d0e1520ed1ba Jon Smirl       2009-05-26  232  
f0fba2ad1b6b53 Liam Girdwood   2010-03-17  233  static struct snd_soc_dai_driver psc_ac97_dai[] = {
20d0e1520ed1ba Jon Smirl       2009-05-26  234  {
a4f7b70dc73d61 Eric Millbrandt 2012-09-13  235  	.name = "mpc5200-psc-ac97.0",
20d0e1520ed1ba Jon Smirl       2009-05-26 @236  	.probe	= psc_ac97_probe,
20d0e1520ed1ba Jon Smirl       2009-05-26  237  	.playback = {
a4f7b70dc73d61 Eric Millbrandt 2012-09-13  238  		.stream_name	= "AC97 Playback",
20d0e1520ed1ba Jon Smirl       2009-05-26  239  		.channels_min   = 1,
20d0e1520ed1ba Jon Smirl       2009-05-26  240  		.channels_max   = 6,
20d0e1520ed1ba Jon Smirl       2009-05-26  241  		.rates          = SNDRV_PCM_RATE_8000_48000,
20d0e1520ed1ba Jon Smirl       2009-05-26  242  		.formats = SNDRV_PCM_FMTBIT_S32_BE,
20d0e1520ed1ba Jon Smirl       2009-05-26  243  	},
20d0e1520ed1ba Jon Smirl       2009-05-26  244  	.capture = {
a4f7b70dc73d61 Eric Millbrandt 2012-09-13  245  		.stream_name	= "AC97 Capture",
20d0e1520ed1ba Jon Smirl       2009-05-26  246  		.channels_min   = 1,
20d0e1520ed1ba Jon Smirl       2009-05-26  247  		.channels_max   = 2,
20d0e1520ed1ba Jon Smirl       2009-05-26  248  		.rates          = SNDRV_PCM_RATE_8000_48000,
20d0e1520ed1ba Jon Smirl       2009-05-26  249  		.formats = SNDRV_PCM_FMTBIT_S32_BE,
20d0e1520ed1ba Jon Smirl       2009-05-26  250  	},
20d0e1520ed1ba Jon Smirl       2009-05-26  251  	.ops = &psc_ac97_analog_ops,
20d0e1520ed1ba Jon Smirl       2009-05-26  252  },
20d0e1520ed1ba Jon Smirl       2009-05-26  253  {
a4f7b70dc73d61 Eric Millbrandt 2012-09-13  254  	.name = "mpc5200-psc-ac97.1",
20d0e1520ed1ba Jon Smirl       2009-05-26  255  	.playback = {
a4f7b70dc73d61 Eric Millbrandt 2012-09-13  256  		.stream_name	= "AC97 SPDIF",
20d0e1520ed1ba Jon Smirl       2009-05-26  257  		.channels_min   = 1,
20d0e1520ed1ba Jon Smirl       2009-05-26  258  		.channels_max   = 2,
20d0e1520ed1ba Jon Smirl       2009-05-26  259  		.rates          = SNDRV_PCM_RATE_32000 | \
20d0e1520ed1ba Jon Smirl       2009-05-26  260  			SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000,
20d0e1520ed1ba Jon Smirl       2009-05-26  261  		.formats = SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_BE,
20d0e1520ed1ba Jon Smirl       2009-05-26  262  	},
20d0e1520ed1ba Jon Smirl       2009-05-26  263  	.ops = &psc_ac97_digital_ops,
20d0e1520ed1ba Jon Smirl       2009-05-26  264  } };
20d0e1520ed1ba Jon Smirl       2009-05-26  265  

:::::: The code at line 236 was first introduced by commit
:::::: 20d0e1520ed1ba8aad05f416245446de0f7ec4bb ASoC: AC97 driver for mpc5200

:::::: TO: Jon Smirl <jonsmirl@gmail.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
