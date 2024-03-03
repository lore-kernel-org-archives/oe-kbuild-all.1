Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1243659150
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 13:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709473554; cv=none; b=AqAYhMEjw3sR58U46TgEhZ3HOGmrjrCtcQHV6+GvbiMwXWHhaHPU3koXbzwiWA6hnd8tu5d2m22CjovoIVOffLRDOUj/hZ0D31VPBqyKzTnAtu1bwG70AIyYpmXfQGA2Qa0lYMBM7Nc+B3LAhifmTpgJ2osJW79W+NBCBq8J+qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709473554; c=relaxed/simple;
	bh=IWKRE9rTwq66mvoUd2HVdFJPa0iXUH5Aenk3rDj2aYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nZ8bDvy55wYodGW0rdFigg5NMu34KDPVtfijxIzn5CKqEhvORIbQJ+2Ms8L3DeL25atD9E4cK9grAyDskfHEaoMrppWy5ScVXHeaGDJJ6b6FZDK2kbwnOp7anueiribLf30+yUXyQhG+Rd7lh7fHiQcGOnHnyxJH3ogI5sFSQy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0M2Pqtn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0M2Pqtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709473552; x=1741009552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IWKRE9rTwq66mvoUd2HVdFJPa0iXUH5Aenk3rDj2aYw=;
  b=Z0M2PqtnHfIUiroWkq5BbSwoj+VonhRu/o9BJqm5Q5g/jNTW1f6z9pDS
   OH+m4ZFIyYUTGGEh0N1wmuP6/S0C5kIUxSkcBIIKoHxeXNqfoz4kyyQYL
   9J8wOozRcFo+TcsHBQWVXB/x7irCE5n64P6+TviKESEJ2kMYPLBO/uDQL
   zTfvSf2FRKBgMrvyivY38vrl07+EBuoANTUYYueqlLtzZG8Zti7E8M3MJ
   4/q5U1G5JJBSdakyZbJlrHPX8PSek/YSe2idrV/+p/x1k4IxPsW7N4iVJ
   VzDUi+HZt/LEWsz2NWkD33TZdAFYwOyAGSwKwBXW7zbBXRJnWfjhqJX77
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="14545096"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="14545096"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 05:45:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="8650879"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2024 05:45:49 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgm9z-0001oO-0Z;
	Sun, 03 Mar 2024 13:45:47 +0000
Date: Sun, 3 Mar 2024 21:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 7098/27938]
 sound/soc/sof/imx/imx8ulp.c:277:9: error: implicit declaration of function
 'arm_smccc_smc'
Message-ID: <202403032111.Z2bCGsLh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pierre-Louis,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   d761b18f6bc83bce94251467e3c0974243318456
commit: 48ccb52d8cadf2e6f934edd993d36f13c255a16d [7098/27938] LF-5144-2 ASoC: SOF: i.MX: simplify Kconfig
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240303/202403032111.Z2bCGsLh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403032111.Z2bCGsLh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403032111.Z2bCGsLh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/sof/imx/imx8.c:466:5: warning: no previous prototype for 'imx8_suspend' [-Wmissing-prototypes]
     466 | int imx8_suspend(struct snd_sof_dev *sdev)
         |     ^~~~~~~~~~~~
>> sound/soc/sof/imx/imx8.c:479:5: warning: no previous prototype for 'imx8_resume' [-Wmissing-prototypes]
     479 | int imx8_resume(struct snd_sof_dev *sdev)
         |     ^~~~~~~~~~~
>> sound/soc/sof/imx/imx8.c:492:5: warning: no previous prototype for 'imx8_dsp_runtime_resume' [-Wmissing-prototypes]
     492 | int imx8_dsp_runtime_resume(struct snd_sof_dev *sdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sof/imx/imx8.c:504:5: warning: no previous prototype for 'imx8_dsp_runtime_suspend' [-Wmissing-prototypes]
     504 | int imx8_dsp_runtime_suspend(struct snd_sof_dev *sdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sof/imx/imx8.c:517:5: warning: no previous prototype for 'imx8_dsp_suspend' [-Wmissing-prototypes]
     517 | int imx8_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
         |     ^~~~~~~~~~~~~~~~
>> sound/soc/sof/imx/imx8.c:530:5: warning: no previous prototype for 'imx8_dsp_resume' [-Wmissing-prototypes]
     530 | int imx8_dsp_resume(struct snd_sof_dev *sdev)
         |     ^~~~~~~~~~~~~~~
>> sound/soc/sof/imx/imx8.c:575:5: warning: no previous prototype for 'imx8_dsp_set_power_state' [-Wmissing-prototypes]
     575 | int imx8_dsp_set_power_state(struct snd_sof_dev *sdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> sound/soc/sof/imx/imx8m.c:417:5: warning: no previous prototype for 'imx8m_dsp_set_power_state' [-Wmissing-prototypes]
     417 | int imx8m_dsp_set_power_state(struct snd_sof_dev *sdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sof/imx/imx8m.c:425:5: warning: no previous prototype for 'imx8m_resume' [-Wmissing-prototypes]
     425 | int imx8m_resume(struct snd_sof_dev *sdev)
         |     ^~~~~~~~~~~~
>> sound/soc/sof/imx/imx8m.c:438:5: warning: no previous prototype for 'imx8m_suspend' [-Wmissing-prototypes]
     438 | int imx8m_suspend(struct snd_sof_dev *sdev)
         |     ^~~~~~~~~~~~~
--
   sound/soc/sof/imx/imx8ulp.c:80:5: warning: no previous prototype for 'imx8ulp_configure_sim_lpav' [-Wmissing-prototypes]
      80 | int imx8ulp_configure_sim_lpav(struct imx8ulp_priv *priv)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/imx/imx8ulp.c: In function 'imx8ulp_reset':
>> sound/soc/sof/imx/imx8ulp.c:277:9: error: implicit declaration of function 'arm_smccc_smc' [-Werror=implicit-function-declaration]
     277 |         arm_smccc_smc(FSL_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &smc_resource);
         |         ^~~~~~~~~~~~~
   sound/soc/sof/imx/imx8ulp.c: At top level:
   sound/soc/sof/imx/imx8ulp.c:435:5: warning: no previous prototype for 'imx8ulp_suspend' [-Wmissing-prototypes]
     435 | int imx8ulp_suspend(struct snd_sof_dev *sdev)
         |     ^~~~~~~~~~~~~~~
   sound/soc/sof/imx/imx8ulp.c:450:5: warning: no previous prototype for 'imx8ulp_resume' [-Wmissing-prototypes]
     450 | int imx8ulp_resume(struct snd_sof_dev *sdev)
         |     ^~~~~~~~~~~~~~
   sound/soc/sof/imx/imx8ulp.c:463:5: warning: no previous prototype for 'imx8ulp_dsp_runtime_resume' [-Wmissing-prototypes]
     463 | int imx8ulp_dsp_runtime_resume(struct snd_sof_dev *sdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/imx/imx8ulp.c:475:5: warning: no previous prototype for 'imx8ulp_dsp_runtime_suspend' [-Wmissing-prototypes]
     475 | int imx8ulp_dsp_runtime_suspend(struct snd_sof_dev *sdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/imx/imx8ulp.c:488:5: warning: no previous prototype for 'imx8ulp_dsp_suspend' [-Wmissing-prototypes]
     488 | int imx8ulp_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
         |     ^~~~~~~~~~~~~~~~~~~
   sound/soc/sof/imx/imx8ulp.c:501:5: warning: no previous prototype for 'imx8ulp_dsp_resume' [-Wmissing-prototypes]
     501 | int imx8ulp_dsp_resume(struct snd_sof_dev *sdev)
         |     ^~~~~~~~~~~~~~~~~~
   sound/soc/sof/imx/imx8ulp.c:535:5: warning: no previous prototype for 'imx8ulp_dsp_set_power_state' [-Wmissing-prototypes]
     535 | int imx8ulp_dsp_set_power_state(struct snd_sof_dev *sdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/sound/asound.h:24,
                    from include/sound/pcm.h:11,
                    from include/sound/soc.h:23,
                    from include/sound/sof.h:15,
                    from sound/soc/sof/imx/imx8ulp.c:19:
   include/uapi/sound/asound.h:281:41: warning: initialized field overwritten [-Woverride-init]
     281 | #define SNDRV_PCM_INFO_MMAP             0x00000001      /* hardware supports mmap */
         |                                         ^~~~~~~~~~
   sound/soc/sof/imx/imx8ulp.c:603:25: note: in expansion of macro 'SNDRV_PCM_INFO_MMAP'
     603 |         .hw_info =      SNDRV_PCM_INFO_MMAP |
         |                         ^~~~~~~~~~~~~~~~~~~
   include/uapi/sound/asound.h:281:41: note: (near initialization for 'sof_imx8ulp_ops.hw_info')
     281 | #define SNDRV_PCM_INFO_MMAP             0x00000001      /* hardware supports mmap */
         |                                         ^~~~~~~~~~
   sound/soc/sof/imx/imx8ulp.c:603:25: note: in expansion of macro 'SNDRV_PCM_INFO_MMAP'
     603 |         .hw_info =      SNDRV_PCM_INFO_MMAP |
         |                         ^~~~~~~~~~~~~~~~~~~
>> sound/soc/sof/imx/imx8ulp.c:31:22: error: storage size of 'smc_resource' isn't known
      31 | struct arm_smccc_res smc_resource;
         |                      ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/arm_smccc_smc +277 sound/soc/sof/imx/imx8ulp.c

2df5369d345df3 Zhang Peng 2021-07-21  259  
2df5369d345df3 Zhang Peng 2021-07-21  260  static int imx8ulp_reset(struct snd_sof_dev *sdev)
2df5369d345df3 Zhang Peng 2021-07-21  261  {
2df5369d345df3 Zhang Peng 2021-07-21  262  	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
2df5369d345df3 Zhang Peng 2021-07-21  263  
2df5369d345df3 Zhang Peng 2021-07-21  264  	/* HiFi4 Platform Clock Enable: 1 enabled, 0 disabled */
2df5369d345df3 Zhang Peng 2021-07-21  265  	regmap_update_bits(priv->regmap_sim, SYSCTRL0, PLAT_CLK_BIT, PLAT_CLK_BIT);
2df5369d345df3 Zhang Peng 2021-07-21  266  	/* HiFi4 PBCLK clock enable: 1 enabled, 0 disabled */
2df5369d345df3 Zhang Peng 2021-07-21  267  	regmap_update_bits(priv->regmap_sim, SYSCTRL0, PB_CLK_BIT, PB_CLK_BIT);
2df5369d345df3 Zhang Peng 2021-07-21  268  	/* HiFi4 Clock Enable: 1 enabled, 0 disabled */
2df5369d345df3 Zhang Peng 2021-07-21  269  	regmap_update_bits(priv->regmap_sim, SYSCTRL0, HIFI4_CLK_BIT, HIFI4_CLK_BIT);
2df5369d345df3 Zhang Peng 2021-07-21  270  
2df5369d345df3 Zhang Peng 2021-07-21  271  	regmap_update_bits(priv->regmap_sim, SYSCTRL0, RESET_BIT, RESET_BIT);
2df5369d345df3 Zhang Peng 2021-07-21  272  	usleep_range(1, 2);
2df5369d345df3 Zhang Peng 2021-07-21  273  	/* Stall HIFI4 DSP Execution: 1 stall, 0 not stall */
2df5369d345df3 Zhang Peng 2021-07-21  274  	regmap_update_bits(priv->regmap_sim, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
2df5369d345df3 Zhang Peng 2021-07-21  275  	usleep_range(1, 2);
2df5369d345df3 Zhang Peng 2021-07-21  276  
2df5369d345df3 Zhang Peng 2021-07-21 @277  	arm_smccc_smc(FSL_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &smc_resource);
2df5369d345df3 Zhang Peng 2021-07-21  278  
2df5369d345df3 Zhang Peng 2021-07-21  279  	return 0;
2df5369d345df3 Zhang Peng 2021-07-21  280  }
2df5369d345df3 Zhang Peng 2021-07-21  281  

:::::: The code at line 277 was first introduced by commit
:::::: 2df5369d345df34108fc9c4c3ed5581ccd918115 LF-4230-1: ASoC: SOF: Support SOF on 8ULP platform

:::::: TO: Zhang Peng <peng.zhang_8@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
