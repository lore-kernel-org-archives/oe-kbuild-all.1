Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642F023CC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 06:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694414501; x=1725950501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3cK3+eh9idHpFdLkiFNTY8AnPVnAN5bksmMqNFC2P/Q=;
  b=EQmMTQfVhZ0FOCV3QW6VRI+eRsfE4A6Vlki9yDv6NqUl8qX7YXUo0mvw
   D6rjFcuqZZ57RL3mjVstRlu7/+xQ8W0lLqgeQJ7Vi4tKUZiZUkm8iDyaT
   dLYTnbazPUYxfrFSH3jkC9aYbrMSJzBuXFMKv8W0mKFIZOCMDByqa8RFE
   R7XxopFYxcOdFHcgX63/ZGvV1pl4IchcwjVGM7zhVlsnJh+phzWPYOw0V
   9P4y1OXez+8lHOmWdxGTpbp7yKfQMhoXsLfEY4gQpv/pMfMjggpW+KlAH
   y7wAIoQaomf7w2KOZFjNdrUp2foweq+dXut+/7tNBdyO+mkW2XoS1doA9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="381809425"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="381809425"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 23:41:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="692981429"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="692981429"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Sep 2023 23:41:37 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfac3-0005u8-2M;
	Mon, 11 Sep 2023 06:41:35 +0000
Date: Mon, 11 Sep 2023 14:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Walker Chen <walker.chen@starfivetech.com>
Subject: [broonie-ci:v3_20230814_hal_feng_add_pwm_dac_audio_support_for_starfive_jh7110_risc_v_soc
 2/2] sound/soc/starfive/jh7110_pwmdac.c:372:10: error: 'struct
 snd_soc_dai_driver' has no member named 'probe'
Message-ID: <202309111401.JHKZ2QAT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_20230814_hal_feng_add_pwm_dac_audio_support_for_starfive_jh7110_risc_v_soc
head:   d1802d59ab533f5d5fdfa3483c11ca77c5b21fdd
commit: d1802d59ab533f5d5fdfa3483c11ca77c5b21fdd [2/2] ASoC: starfive: Add JH7110 PWM-DAC driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230911/202309111401.JHKZ2QAT-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111401.JHKZ2QAT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111401.JHKZ2QAT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/starfive/jh7110_pwmdac.c:372:10: error: 'struct snd_soc_dai_driver' has no member named 'probe'
     372 |         .probe          = jh7110_pwmdac_dai_probe,
         |          ^~~~~
   sound/soc/starfive/jh7110_pwmdac.c:372:27: warning: initialization of 'unsigned int' from 'int (*)(struct snd_soc_dai *)' makes integer from pointer without a cast [-Wint-conversion]
     372 |         .probe          = jh7110_pwmdac_dai_probe,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/starfive/jh7110_pwmdac.c:372:27: note: (near initialization for 'jh7110_pwmdac_dai.base')
>> sound/soc/starfive/jh7110_pwmdac.c:372:27: error: initializer element is not computable at load time
   sound/soc/starfive/jh7110_pwmdac.c:372:27: note: (near initialization for 'jh7110_pwmdac_dai.base')


vim +372 sound/soc/starfive/jh7110_pwmdac.c

   368	
   369	static struct snd_soc_dai_driver jh7110_pwmdac_dai = {
   370		.name		= "jh7110-pwmdac",
   371		.id		= 0,
 > 372		.probe		= jh7110_pwmdac_dai_probe,
   373		.playback = {
   374			.channels_min = 1,
   375			.channels_max = 2,
   376			.rates = SNDRV_PCM_RATE_8000_48000,
   377			.formats = SNDRV_PCM_FMTBIT_S16_LE,
   378		},
   379		.ops = &jh7110_pwmdac_dai_ops,
   380	};
   381	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
