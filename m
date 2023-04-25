Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FED7B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 09:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682413590; x=1713949590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZmiF+lus1Z1KXO/YY1q78Duq5vgEhohC6XKdocsOywA=;
  b=clBuj2AZ3VqXGDwnhFA3Ks6Qn+tMfj1XeEttdyUAuNZ2xc5qGJ2Ot2wT
   TYElzvnrQICELxe2pczvqp9x6u0t++rLb5iq4cVEt/g3jhsEqbu062E0G
   wUVLbcPf2bqWIarNDWY4gstFjsA0z0+++g4oqRNqKpyVA70+BQMZ91SFZ
   IYhpkhC6xHhQYHF6ueIKLCrx7eYmQCDNZj3hvFdRfhwdaOvcRFg5sfZnE
   Bmj4F9CD/powujkeNZPSoXYmHLZkLXtcVkpUpdQUt2Xvw5jEXGMjKYuWc
   hx9tV7z0cJy/LqpzwT3kRBb1vdo5D1CvwETCOJKncx6PLL3cqxnbOUxtK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="327013074"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="327013074"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 02:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="817597112"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="817597112"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Apr 2023 02:06:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prEd1-000jFj-2W;
	Tue, 25 Apr 2023 09:06:27 +0000
Date: Tue, 25 Apr 2023 17:05:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-dai-ops-2023-04-25-v2 58/58]
 sound/soc/cirrus/ep93xx-i2s.c:421:10: error: 'struct snd_soc_dai_driver' has
 no member named 'probe'
Message-ID: <202304251727.PZi8AATt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-dai-ops-2023-04-25-v2
head:   95707df62ebc8850d4cc2a5fd9b2674d218e1c93
commit: 95707df62ebc8850d4cc2a5fd9b2674d218e1c93 [58/58] ASoC: soc-dai.h: remove unused call back functions
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230425/202304251727.PZi8AATt-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/morimoto/linux/commit/95707df62ebc8850d4cc2a5fd9b2674d218e1c93
        git remote add morimoto https://github.com/morimoto/linux
        git fetch --no-tags morimoto sound-dai-ops-2023-04-25-v2
        git checkout 95707df62ebc8850d4cc2a5fd9b2674d218e1c93
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251727.PZi8AATt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/cirrus/ep93xx-i2s.c:421:10: error: 'struct snd_soc_dai_driver' has no member named 'probe'
     421 |         .probe          = ep93xx_i2s_dai_probe,
         |          ^~~~~
>> sound/soc/cirrus/ep93xx-i2s.c:421:27: warning: initialization of 'unsigned char:1' from 'int (*)(struct snd_soc_dai *)' makes integer from pointer without a cast [-Wint-conversion]
     421 |         .probe          = ep93xx_i2s_dai_probe,
         |                           ^~~~~~~~~~~~~~~~~~~~
   sound/soc/cirrus/ep93xx-i2s.c:421:27: note: (near initialization for 'ep93xx_i2s_dai.symmetric_channels')
>> sound/soc/cirrus/ep93xx-i2s.c:421:27: error: initializer element is not computable at load time
   sound/soc/cirrus/ep93xx-i2s.c:421:27: note: (near initialization for 'ep93xx_i2s_dai.symmetric_channels')


vim +421 sound/soc/cirrus/ep93xx-i2s.c

db5bf412baf8df sound/soc/ep93xx/ep93xx-i2s.c Ryan Mallon        2010-06-04  418  
f0fba2ad1b6b53 sound/soc/ep93xx/ep93xx-i2s.c Liam Girdwood      2010-03-17  419  static struct snd_soc_dai_driver ep93xx_i2s_dai = {
f1e6b04baba690 sound/soc/cirrus/ep93xx-i2s.c Kuninori Morimoto  2021-01-15  420  	.symmetric_rate	= 1,
785d81e29bd237 sound/soc/cirrus/ep93xx-i2s.c Lars-Peter Clausen 2013-04-20 @421  	.probe		= ep93xx_i2s_dai_probe,
db5bf412baf8df sound/soc/ep93xx/ep93xx-i2s.c Ryan Mallon        2010-06-04  422  	.playback	= {
db5bf412baf8df sound/soc/ep93xx/ep93xx-i2s.c Ryan Mallon        2010-06-04  423  		.channels_min	= 2,
db5bf412baf8df sound/soc/ep93xx/ep93xx-i2s.c Ryan Mallon        2010-06-04  424  		.channels_max	= 2,
4cfeb695e29d69 sound/soc/ep93xx/ep93xx-i2s.c Alexander Sverdlin 2011-03-07  425  		.rates		= SNDRV_PCM_RATE_8000_192000,
db5bf412baf8df sound/soc/ep93xx/ep93xx-i2s.c Ryan Mallon        2010-06-04  426  		.formats	= EP93XX_I2S_FORMATS,
db5bf412baf8df sound/soc/ep93xx/ep93xx-i2s.c Ryan Mallon        2010-06-04  427  	},
db5bf412baf8df sound/soc/ep93xx/ep93xx-i2s.c Ryan Mallon        2010-06-04  428  	.capture	= {
db5bf412baf8df sound/soc/ep93xx/ep93xx-i2s.c Ryan Mallon        2010-06-04  429  		 .channels_min	= 2,
db5bf412baf8df sound/soc/ep93xx/ep93xx-i2s.c Ryan Mallon        2010-06-04  430  		 .channels_max	= 2,
4cfeb695e29d69 sound/soc/ep93xx/ep93xx-i2s.c Alexander Sverdlin 2011-03-07  431  		 .rates		= SNDRV_PCM_RATE_8000_192000,
db5bf412baf8df sound/soc/ep93xx/ep93xx-i2s.c Ryan Mallon        2010-06-04  432  		 .formats	= EP93XX_I2S_FORMATS,
db5bf412baf8df sound/soc/ep93xx/ep93xx-i2s.c Ryan Mallon        2010-06-04  433  	},
db5bf412baf8df sound/soc/ep93xx/ep93xx-i2s.c Ryan Mallon        2010-06-04  434  	.ops		= &ep93xx_i2s_dai_ops,
db5bf412baf8df sound/soc/ep93xx/ep93xx-i2s.c Ryan Mallon        2010-06-04  435  };
db5bf412baf8df sound/soc/ep93xx/ep93xx-i2s.c Ryan Mallon        2010-06-04  436  

:::::: The code at line 421 was first introduced by commit
:::::: 785d81e29bd237b4e76ca27c3ebcc3281e663596 ASoC: ep93xx: Setup dma data in DAI probe

:::::: TO: Lars-Peter Clausen <lars@metafoo.de>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
