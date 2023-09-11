Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3AD1FA0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 04:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694406561; x=1725942561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qEj0wJV/Ns2iwRKkj7pAxY20rB/GiV0Illsj6iqvCwM=;
  b=buN6VwKF7BXEYPLGXBNnWx9nvBhJBBG4YvxwWJ49EZ/BT61J82q+47Cw
   xS3pwEh0NiWg0hFIS18oOMY/RrL8L6ucHYg400Pc8xRSrMOEW6tDgzIUI
   JmlH2y6k2d/4XxfrHyubBB5GfqcWFY+jaVr45NN8VXxbqyxYU5SPDSk2o
   4mbDlHhFmCYOSZbZIBNLJrzjiTKpsEFhSlEAPKc5i7FiRoOh3do43+pH9
   Hq2T92XCHT7E2681wVGKCFRInvpL42pSPOvk7cqUUxh/c0bFBcHEEcYk6
   +7M9xbhdI7ex/O+prUvhMxlY+auHAD0+PjjtgTPpyO+Vh/HWhkcZPtqCz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="380691085"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="380691085"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 21:23:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="858163596"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="858163596"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Sep 2023 21:23:32 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfYSQ-0005mx-2v;
	Mon, 11 Sep 2023 04:23:30 +0000
Date: Mon, 11 Sep 2023 12:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Walker Chen <walker.chen@starfivetech.com>
Subject: [broonie-ci:v3_20230814_hal_feng_add_pwm_dac_audio_support_for_starfive_jh7110_risc_v_soc
 2/2] sound/soc/starfive/jh7110_pwmdac.c:372:27: warning: initialization of
 'unsigned int' from 'int (*)(struct snd_soc_dai *)' makes integer from
 pointer without a cast
Message-ID: <202309111234.VBrrOfC9-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230911/202309111234.VBrrOfC9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111234.VBrrOfC9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111234.VBrrOfC9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/starfive/jh7110_pwmdac.c:372:10: error: 'struct snd_soc_dai_driver' has no member named 'probe'
     372 |         .probe          = jh7110_pwmdac_dai_probe,
         |          ^~~~~
>> sound/soc/starfive/jh7110_pwmdac.c:372:27: warning: initialization of 'unsigned int' from 'int (*)(struct snd_soc_dai *)' makes integer from pointer without a cast [-Wint-conversion]
     372 |         .probe          = jh7110_pwmdac_dai_probe,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/starfive/jh7110_pwmdac.c:372:27: note: (near initialization for 'jh7110_pwmdac_dai.base')
   sound/soc/starfive/jh7110_pwmdac.c:372:27: error: initializer element is not computable at load time
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
