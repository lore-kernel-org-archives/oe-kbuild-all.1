Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A88125B8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 22:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694040492; x=1725576492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EwBTCl2rW/HEUEQJh4EryYAmUmCAtFT42N2ATuXVpnE=;
  b=d1vgUKFIPEd/rZiLrGMuDKAgLJ/ksEFeVYW5W6e4YVj4+HSpxkUgue4B
   otokHvY0PVXgsdFx5s4he+oEhqTntsc13ijAZGCfiXs7Yb1SGnliwfZtW
   UrlJUIpGTJ6+VZMt/zLLElFfWGpb4u42hYu6g575GGbdcu1DaoBoLNFLG
   tLmAfObjqTi29tx77sejNu7w8H5EQ9HFGnrcCPZ6D2pIf3dALqg4iMmPh
   K/8Ybi9Ch0IjrZ7Q0rdpqxC4N0hnIOZI/DDmffa70zw59I9HtonEDnslc
   lHuAxF83UZg3Ao1qFife3wr6VEHjdTuZ27nkRrNu183lhwPXfgdKQyr+l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="376103968"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="376103968"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 15:48:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="856650668"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="856650668"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2023 15:48:07 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe1Jd-0000er-10;
	Wed, 06 Sep 2023 22:48:05 +0000
Date: Thu, 7 Sep 2023 06:47:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 7098/24606]
 sound/soc/sof/imx/imx8ulp.c:277:2: error: implicit declaration of function
 'arm_smccc_smc'
Message-ID: <202309070615.ix06RjzC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   c099d7415137daf904adcd5fdd73a25024627587
commit: 48ccb52d8cadf2e6f934edd993d36f13c255a16d [7098/24606] LF-5144-2 ASoC: SOF: i.MX: simplify Kconfig
config: mips-randconfig-r033-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070615.ix06RjzC-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070615.ix06RjzC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070615.ix06RjzC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/sof/imx/imx8m.c:417:5: warning: no previous prototype for function 'imx8m_dsp_set_power_state' [-Wmissing-prototypes]
   int imx8m_dsp_set_power_state(struct snd_sof_dev *sdev,
       ^
   sound/soc/sof/imx/imx8m.c:417:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx8m_dsp_set_power_state(struct snd_sof_dev *sdev,
   ^
   static 
>> sound/soc/sof/imx/imx8m.c:425:5: warning: no previous prototype for function 'imx8m_resume' [-Wmissing-prototypes]
   int imx8m_resume(struct snd_sof_dev *sdev)
       ^
   sound/soc/sof/imx/imx8m.c:425:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx8m_resume(struct snd_sof_dev *sdev)
   ^
   static 
>> sound/soc/sof/imx/imx8m.c:438:5: warning: no previous prototype for function 'imx8m_suspend' [-Wmissing-prototypes]
   int imx8m_suspend(struct snd_sof_dev *sdev)
       ^
   sound/soc/sof/imx/imx8m.c:438:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx8m_suspend(struct snd_sof_dev *sdev)
   ^
   static 
   3 warnings generated.
--
>> sound/soc/sof/imx/imx8ulp.c:80:5: warning: no previous prototype for function 'imx8ulp_configure_sim_lpav' [-Wmissing-prototypes]
   int imx8ulp_configure_sim_lpav(struct imx8ulp_priv *priv)
       ^
   sound/soc/sof/imx/imx8ulp.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx8ulp_configure_sim_lpav(struct imx8ulp_priv *priv)
   ^
   static 
>> sound/soc/sof/imx/imx8ulp.c:277:2: error: implicit declaration of function 'arm_smccc_smc' [-Werror,-Wimplicit-function-declaration]
           arm_smccc_smc(FSL_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &smc_resource);
           ^
   sound/soc/sof/imx/imx8ulp.c:386:11: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
           while (--i >= 0) {
                    ^
   sound/soc/sof/imx/imx8ulp.c:293:7: note: initialize the variable 'i' to silence this warning
           int i;
                ^
                 = 0
>> sound/soc/sof/imx/imx8ulp.c:435:5: warning: no previous prototype for function 'imx8ulp_suspend' [-Wmissing-prototypes]
   int imx8ulp_suspend(struct snd_sof_dev *sdev)
       ^
   sound/soc/sof/imx/imx8ulp.c:435:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx8ulp_suspend(struct snd_sof_dev *sdev)
   ^
   static 
>> sound/soc/sof/imx/imx8ulp.c:450:5: warning: no previous prototype for function 'imx8ulp_resume' [-Wmissing-prototypes]
   int imx8ulp_resume(struct snd_sof_dev *sdev)
       ^
   sound/soc/sof/imx/imx8ulp.c:450:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx8ulp_resume(struct snd_sof_dev *sdev)
   ^
   static 
>> sound/soc/sof/imx/imx8ulp.c:463:5: warning: no previous prototype for function 'imx8ulp_dsp_runtime_resume' [-Wmissing-prototypes]
   int imx8ulp_dsp_runtime_resume(struct snd_sof_dev *sdev)
       ^
   sound/soc/sof/imx/imx8ulp.c:463:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx8ulp_dsp_runtime_resume(struct snd_sof_dev *sdev)
   ^
   static 
>> sound/soc/sof/imx/imx8ulp.c:475:5: warning: no previous prototype for function 'imx8ulp_dsp_runtime_suspend' [-Wmissing-prototypes]
   int imx8ulp_dsp_runtime_suspend(struct snd_sof_dev *sdev)
       ^
   sound/soc/sof/imx/imx8ulp.c:475:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx8ulp_dsp_runtime_suspend(struct snd_sof_dev *sdev)
   ^
   static 
>> sound/soc/sof/imx/imx8ulp.c:488:5: warning: no previous prototype for function 'imx8ulp_dsp_suspend' [-Wmissing-prototypes]
   int imx8ulp_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
       ^
   sound/soc/sof/imx/imx8ulp.c:488:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx8ulp_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
   ^
   static 
>> sound/soc/sof/imx/imx8ulp.c:501:5: warning: no previous prototype for function 'imx8ulp_dsp_resume' [-Wmissing-prototypes]
   int imx8ulp_dsp_resume(struct snd_sof_dev *sdev)
       ^
   sound/soc/sof/imx/imx8ulp.c:501:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx8ulp_dsp_resume(struct snd_sof_dev *sdev)
   ^
   static 
>> sound/soc/sof/imx/imx8ulp.c:535:5: warning: no previous prototype for function 'imx8ulp_dsp_set_power_state' [-Wmissing-prototypes]
   int imx8ulp_dsp_set_power_state(struct snd_sof_dev *sdev,
       ^
   sound/soc/sof/imx/imx8ulp.c:535:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx8ulp_dsp_set_power_state(struct snd_sof_dev *sdev,
   ^
   static 
   sound/soc/sof/imx/imx8ulp.c:603:13: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           .hw_info =      SNDRV_PCM_INFO_MMAP |
                           ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/sound/asound.h:281:30: note: expanded from macro 'SNDRV_PCM_INFO_MMAP'
   #define SNDRV_PCM_INFO_MMAP             0x00000001      /* hardware supports mmap */
                                           ^
   sound/soc/sof/imx/imx8ulp.c:588:13: note: previous initialization is here
           .hw_info =      SNDRV_PCM_INFO_MMAP |
                           ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/sound/asound.h:281:30: note: expanded from macro 'SNDRV_PCM_INFO_MMAP'
   #define SNDRV_PCM_INFO_MMAP             0x00000001      /* hardware supports mmap */
                                           ^
>> sound/soc/sof/imx/imx8ulp.c:31:22: error: tentative definition has type 'struct arm_smccc_res' that is never completed
   struct arm_smccc_res smc_resource;
                        ^
   sound/soc/sof/imx/imx8ulp.c:31:8: note: forward declaration of 'struct arm_smccc_res'
   struct arm_smccc_res smc_resource;
          ^
   10 warnings and 2 errors generated.


vim +/arm_smccc_smc +277 sound/soc/sof/imx/imx8ulp.c

2df5369d345df3 Zhang Peng 2021-07-21   78  
2df5369d345df3 Zhang Peng 2021-07-21   79  /* System integration module(SIM) control dsp configurtion */
2df5369d345df3 Zhang Peng 2021-07-21  @80  int imx8ulp_configure_sim_lpav(struct imx8ulp_priv *priv)
2df5369d345df3 Zhang Peng 2021-07-21   81  {
2df5369d345df3 Zhang Peng 2021-07-21   82  	priv->regmap_sim = syscon_regmap_lookup_by_compatible("nxp,imx8ulp-avd-sim");
2df5369d345df3 Zhang Peng 2021-07-21   83  	if (IS_ERR(priv->regmap_sim))
2df5369d345df3 Zhang Peng 2021-07-21   84  		return -EPROBE_DEFER;
2df5369d345df3 Zhang Peng 2021-07-21   85  	return 0;
2df5369d345df3 Zhang Peng 2021-07-21   86  }
2df5369d345df3 Zhang Peng 2021-07-21   87  
2df5369d345df3 Zhang Peng 2021-07-21   88  static void imx8ulp_sim_lpav_start(struct imx8ulp_priv *priv)
2df5369d345df3 Zhang Peng 2021-07-21   89  {
2df5369d345df3 Zhang Peng 2021-07-21   90  	/* Controls the HiFi4 DSP Reset: 1 in reset, 0 out of reset */
2df5369d345df3 Zhang Peng 2021-07-21   91  	regmap_update_bits(priv->regmap_sim, SYSCTRL0, RESET_BIT, 0);
2df5369d345df3 Zhang Peng 2021-07-21   92  	/* Reset HiFi4 DSP Debug logic: 1 reset, 0 not set */
2df5369d345df3 Zhang Peng 2021-07-21   93  	regmap_update_bits(priv->regmap_sim, SYSCTRL0, DEBUG_LOGIC_BIT, 0);
2df5369d345df3 Zhang Peng 2021-07-21   94  	/* Stall HIFI4 DSP Execution: 1 stall, 0 not stall */
2df5369d345df3 Zhang Peng 2021-07-21   95  	regmap_update_bits(priv->regmap_sim, SYSCTRL0, EXECUTE_BIT, 0);
2df5369d345df3 Zhang Peng 2021-07-21   96  }
2df5369d345df3 Zhang Peng 2021-07-21   97  
2df5369d345df3 Zhang Peng 2021-07-21   98  static int imx8ulp_init_clocks(struct snd_sof_dev *sdev)
2df5369d345df3 Zhang Peng 2021-07-21   99  {
2df5369d345df3 Zhang Peng 2021-07-21  100  	int i;
2df5369d345df3 Zhang Peng 2021-07-21  101  	struct imx8ulp_priv *priv = (struct imx8ulp_priv *)sdev->pdata->hw_pdata;
2df5369d345df3 Zhang Peng 2021-07-21  102  
2df5369d345df3 Zhang Peng 2021-07-21  103  	for (i = 0; i < IMX8ULP_DSP_CLK_NUM; i++) {
2df5369d345df3 Zhang Peng 2021-07-21  104  		priv->dsp_clks[i] = devm_clk_get(priv->dev, imx8ulp_dsp_clks_names[i]);
2df5369d345df3 Zhang Peng 2021-07-21  105  		if (IS_ERR(priv->dsp_clks[i]))
2df5369d345df3 Zhang Peng 2021-07-21  106  			return PTR_ERR(priv->dsp_clks[i]);
2df5369d345df3 Zhang Peng 2021-07-21  107  	}
2df5369d345df3 Zhang Peng 2021-07-21  108  
2df5369d345df3 Zhang Peng 2021-07-21  109  	for (i = 0; i < IMX8ULP_DAI_CLK_NUM; i++)
2df5369d345df3 Zhang Peng 2021-07-21  110  		priv->dai_clks[i] = devm_clk_get_optional(priv->dev, imx8ulp_dai_clks_names[i]);
2df5369d345df3 Zhang Peng 2021-07-21  111  
2df5369d345df3 Zhang Peng 2021-07-21  112  	return 0;
2df5369d345df3 Zhang Peng 2021-07-21  113  }
2df5369d345df3 Zhang Peng 2021-07-21  114  
2df5369d345df3 Zhang Peng 2021-07-21  115  static int imx8ulp_prepare_clocks(struct snd_sof_dev *sdev)
2df5369d345df3 Zhang Peng 2021-07-21  116  {
2df5369d345df3 Zhang Peng 2021-07-21  117  	int i, j, ret;
2df5369d345df3 Zhang Peng 2021-07-21  118  	struct imx8ulp_priv *priv = (struct imx8ulp_priv *)sdev->pdata->hw_pdata;
2df5369d345df3 Zhang Peng 2021-07-21  119  
2df5369d345df3 Zhang Peng 2021-07-21  120  	for (i = 0; i < IMX8ULP_DSP_CLK_NUM; i++) {
2df5369d345df3 Zhang Peng 2021-07-21  121  		ret = clk_prepare_enable(priv->dsp_clks[i]);
2df5369d345df3 Zhang Peng 2021-07-21  122  		if (ret < 0) {
2df5369d345df3 Zhang Peng 2021-07-21  123  			dev_err(priv->dev, "Failed to enable clk %s\n",
2df5369d345df3 Zhang Peng 2021-07-21  124  				imx8ulp_dsp_clks_names[i]);
2df5369d345df3 Zhang Peng 2021-07-21  125  			goto err_dsp_clks;
2df5369d345df3 Zhang Peng 2021-07-21  126  		}
2df5369d345df3 Zhang Peng 2021-07-21  127  	}
2df5369d345df3 Zhang Peng 2021-07-21  128  
2df5369d345df3 Zhang Peng 2021-07-21  129  	for (j = 0; j < IMX8ULP_DAI_CLK_NUM; j++) {
2df5369d345df3 Zhang Peng 2021-07-21  130  		ret = clk_prepare_enable(priv->dai_clks[j]);
2df5369d345df3 Zhang Peng 2021-07-21  131  		if (ret < 0) {
2df5369d345df3 Zhang Peng 2021-07-21  132  			dev_err(priv->dev, "Failed to enable clk %s\n",
2df5369d345df3 Zhang Peng 2021-07-21  133  				imx8ulp_dai_clks_names[j]);
2df5369d345df3 Zhang Peng 2021-07-21  134  			goto err_dai_clks;
2df5369d345df3 Zhang Peng 2021-07-21  135  		}
2df5369d345df3 Zhang Peng 2021-07-21  136  	}
2df5369d345df3 Zhang Peng 2021-07-21  137  
2df5369d345df3 Zhang Peng 2021-07-21  138  	return 0;
2df5369d345df3 Zhang Peng 2021-07-21  139  
2df5369d345df3 Zhang Peng 2021-07-21  140  err_dai_clks:
2df5369d345df3 Zhang Peng 2021-07-21  141  	while (--j >= 0)
2df5369d345df3 Zhang Peng 2021-07-21  142  		clk_disable_unprepare(priv->dai_clks[j]);
2df5369d345df3 Zhang Peng 2021-07-21  143  
2df5369d345df3 Zhang Peng 2021-07-21  144  err_dsp_clks:
2df5369d345df3 Zhang Peng 2021-07-21  145  	while (--i >= 0)
2df5369d345df3 Zhang Peng 2021-07-21  146  		clk_disable_unprepare(priv->dsp_clks[i]);
2df5369d345df3 Zhang Peng 2021-07-21  147  
2df5369d345df3 Zhang Peng 2021-07-21  148  	return ret;
2df5369d345df3 Zhang Peng 2021-07-21  149  }
2df5369d345df3 Zhang Peng 2021-07-21  150  
2df5369d345df3 Zhang Peng 2021-07-21  151  static void imx8ulp_disable_clocks(struct snd_sof_dev *sdev)
2df5369d345df3 Zhang Peng 2021-07-21  152  {
2df5369d345df3 Zhang Peng 2021-07-21  153  	int i;
2df5369d345df3 Zhang Peng 2021-07-21  154  	struct imx8ulp_priv *priv = (struct imx8ulp_priv *)sdev->pdata->hw_pdata;
2df5369d345df3 Zhang Peng 2021-07-21  155  
2df5369d345df3 Zhang Peng 2021-07-21  156  	for (i = 0; i < IMX8ULP_DSP_CLK_NUM; i++)
2df5369d345df3 Zhang Peng 2021-07-21  157  		clk_disable_unprepare(priv->dsp_clks[i]);
2df5369d345df3 Zhang Peng 2021-07-21  158  
2df5369d345df3 Zhang Peng 2021-07-21  159  	for (i = 0; i < IMX8ULP_DAI_CLK_NUM; i++)
2df5369d345df3 Zhang Peng 2021-07-21  160  		clk_disable_unprepare(priv->dai_clks[i]);
2df5369d345df3 Zhang Peng 2021-07-21  161  }
2df5369d345df3 Zhang Peng 2021-07-21  162  
2df5369d345df3 Zhang Peng 2021-07-21  163  static void imx8ulp_get_reply(struct snd_sof_dev *sdev)
2df5369d345df3 Zhang Peng 2021-07-21  164  {
2df5369d345df3 Zhang Peng 2021-07-21  165  	struct snd_sof_ipc_msg *msg = sdev->msg;
2df5369d345df3 Zhang Peng 2021-07-21  166  	struct sof_ipc_reply reply;
2df5369d345df3 Zhang Peng 2021-07-21  167  	int ret = 0;
2df5369d345df3 Zhang Peng 2021-07-21  168  
2df5369d345df3 Zhang Peng 2021-07-21  169  	if (!msg) {
2df5369d345df3 Zhang Peng 2021-07-21  170  		dev_warn(sdev->dev, "unexpected ipc interrupt\n");
2df5369d345df3 Zhang Peng 2021-07-21  171  		return;
2df5369d345df3 Zhang Peng 2021-07-21  172  	}
2df5369d345df3 Zhang Peng 2021-07-21  173  
2df5369d345df3 Zhang Peng 2021-07-21  174  	/* get reply */
2df5369d345df3 Zhang Peng 2021-07-21  175  	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
2df5369d345df3 Zhang Peng 2021-07-21  176  
2df5369d345df3 Zhang Peng 2021-07-21  177  	if (reply.error < 0) {
2df5369d345df3 Zhang Peng 2021-07-21  178  		memcpy(msg->reply_data, &reply, sizeof(reply));
2df5369d345df3 Zhang Peng 2021-07-21  179  		ret = reply.error;
2df5369d345df3 Zhang Peng 2021-07-21  180  	} else {
2df5369d345df3 Zhang Peng 2021-07-21  181  		/* reply has correct size? */
2df5369d345df3 Zhang Peng 2021-07-21  182  		if (reply.hdr.size != msg->reply_size) {
2df5369d345df3 Zhang Peng 2021-07-21  183  			dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
2df5369d345df3 Zhang Peng 2021-07-21  184  				msg->reply_size, reply.hdr.size);
2df5369d345df3 Zhang Peng 2021-07-21  185  			ret = -EINVAL;
2df5369d345df3 Zhang Peng 2021-07-21  186  		}
2df5369d345df3 Zhang Peng 2021-07-21  187  
2df5369d345df3 Zhang Peng 2021-07-21  188  		/* read the message */
2df5369d345df3 Zhang Peng 2021-07-21  189  		if (msg->reply_size > 0)
2df5369d345df3 Zhang Peng 2021-07-21  190  			sof_mailbox_read(sdev, sdev->host_box.offset,
2df5369d345df3 Zhang Peng 2021-07-21  191  					 msg->reply_data, msg->reply_size);
2df5369d345df3 Zhang Peng 2021-07-21  192  	}
2df5369d345df3 Zhang Peng 2021-07-21  193  
2df5369d345df3 Zhang Peng 2021-07-21  194  	msg->reply_error = ret;
2df5369d345df3 Zhang Peng 2021-07-21  195  }
2df5369d345df3 Zhang Peng 2021-07-21  196  
2df5369d345df3 Zhang Peng 2021-07-21  197  static int imx8ulp_get_mailbox_offset(struct snd_sof_dev *sdev)
2df5369d345df3 Zhang Peng 2021-07-21  198  {
2df5369d345df3 Zhang Peng 2021-07-21  199  	return MBOX_OFFSET;
2df5369d345df3 Zhang Peng 2021-07-21  200  }
2df5369d345df3 Zhang Peng 2021-07-21  201  
2df5369d345df3 Zhang Peng 2021-07-21  202  static int imx8ulp_get_window_offset(struct snd_sof_dev *sdev, u32 id)
2df5369d345df3 Zhang Peng 2021-07-21  203  {
2df5369d345df3 Zhang Peng 2021-07-21  204  	return MBOX_OFFSET;
2df5369d345df3 Zhang Peng 2021-07-21  205  }
2df5369d345df3 Zhang Peng 2021-07-21  206  
2df5369d345df3 Zhang Peng 2021-07-21  207  static void imx8ulp_dsp_handle_reply(struct imx_dsp_ipc *ipc)
2df5369d345df3 Zhang Peng 2021-07-21  208  {
2df5369d345df3 Zhang Peng 2021-07-21  209  	struct imx8ulp_priv *priv = imx_dsp_get_data(ipc);
2df5369d345df3 Zhang Peng 2021-07-21  210  	unsigned long flags;
2df5369d345df3 Zhang Peng 2021-07-21  211  
2df5369d345df3 Zhang Peng 2021-07-21  212  	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
2df5369d345df3 Zhang Peng 2021-07-21  213  
2df5369d345df3 Zhang Peng 2021-07-21  214  	imx8ulp_get_reply(priv->sdev);
2df5369d345df3 Zhang Peng 2021-07-21  215  	snd_sof_ipc_reply(priv->sdev, 0);
2df5369d345df3 Zhang Peng 2021-07-21  216  	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
2df5369d345df3 Zhang Peng 2021-07-21  217  }
2df5369d345df3 Zhang Peng 2021-07-21  218  
2df5369d345df3 Zhang Peng 2021-07-21  219  static void imx8ulp_dsp_handle_request(struct imx_dsp_ipc *ipc)
2df5369d345df3 Zhang Peng 2021-07-21  220  {
2df5369d345df3 Zhang Peng 2021-07-21  221  	struct imx8ulp_priv *priv = imx_dsp_get_data(ipc);
2df5369d345df3 Zhang Peng 2021-07-21  222  	u32 p; /* panic code */
2df5369d345df3 Zhang Peng 2021-07-21  223  
2df5369d345df3 Zhang Peng 2021-07-21  224  	/* Read the message from the debug box. */
2df5369d345df3 Zhang Peng 2021-07-21  225  	sof_mailbox_read(priv->sdev, priv->sdev->debug_box.offset + 4, &p, sizeof(p));
2df5369d345df3 Zhang Peng 2021-07-21  226  
2df5369d345df3 Zhang Peng 2021-07-21  227  	/* Check to see if the message is a panic code (0x0dead***) */
2df5369d345df3 Zhang Peng 2021-07-21  228  	if ((p & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC)
2df5369d345df3 Zhang Peng 2021-07-21  229  		snd_sof_dsp_panic(priv->sdev, p);
2df5369d345df3 Zhang Peng 2021-07-21  230  	else
2df5369d345df3 Zhang Peng 2021-07-21  231  		snd_sof_ipc_msgs_rx(priv->sdev);
2df5369d345df3 Zhang Peng 2021-07-21  232  }
2df5369d345df3 Zhang Peng 2021-07-21  233  
2df5369d345df3 Zhang Peng 2021-07-21  234  static struct imx_dsp_ops dsp_ops = {
2df5369d345df3 Zhang Peng 2021-07-21  235  	.handle_reply		= imx8ulp_dsp_handle_reply,
2df5369d345df3 Zhang Peng 2021-07-21  236  	.handle_request		= imx8ulp_dsp_handle_request,
2df5369d345df3 Zhang Peng 2021-07-21  237  };
2df5369d345df3 Zhang Peng 2021-07-21  238  
2df5369d345df3 Zhang Peng 2021-07-21  239  static int imx8ulp_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
2df5369d345df3 Zhang Peng 2021-07-21  240  {
2df5369d345df3 Zhang Peng 2021-07-21  241  	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
2df5369d345df3 Zhang Peng 2021-07-21  242  
2df5369d345df3 Zhang Peng 2021-07-21  243  	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
2df5369d345df3 Zhang Peng 2021-07-21  244  			  msg->msg_size);
2df5369d345df3 Zhang Peng 2021-07-21  245  	imx_dsp_ring_doorbell(priv->dsp_ipc, 0);
2df5369d345df3 Zhang Peng 2021-07-21  246  
2df5369d345df3 Zhang Peng 2021-07-21  247  	return 0;
2df5369d345df3 Zhang Peng 2021-07-21  248  }
2df5369d345df3 Zhang Peng 2021-07-21  249  
2df5369d345df3 Zhang Peng 2021-07-21  250  /* config sc firmware */
2df5369d345df3 Zhang Peng 2021-07-21  251  static int imx8ulp_run(struct snd_sof_dev *sdev)
2df5369d345df3 Zhang Peng 2021-07-21  252  {
2df5369d345df3 Zhang Peng 2021-07-21  253  	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
2df5369d345df3 Zhang Peng 2021-07-21  254  
2df5369d345df3 Zhang Peng 2021-07-21  255  	imx8ulp_sim_lpav_start(priv);
2df5369d345df3 Zhang Peng 2021-07-21  256  
2df5369d345df3 Zhang Peng 2021-07-21  257  	return 0;
2df5369d345df3 Zhang Peng 2021-07-21  258  }
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
2df5369d345df3 Zhang Peng 2021-07-21  282  static int imx8ulp_probe(struct snd_sof_dev *sdev)
2df5369d345df3 Zhang Peng 2021-07-21  283  {
2df5369d345df3 Zhang Peng 2021-07-21  284  	struct platform_device *pdev =
2df5369d345df3 Zhang Peng 2021-07-21  285  		container_of(sdev->dev, struct platform_device, dev);
2df5369d345df3 Zhang Peng 2021-07-21  286  	struct device_node *np = pdev->dev.of_node;
2df5369d345df3 Zhang Peng 2021-07-21  287  	struct device_node *res_node;
2df5369d345df3 Zhang Peng 2021-07-21  288  	struct resource *mmio;
2df5369d345df3 Zhang Peng 2021-07-21  289  	struct imx8ulp_priv *priv;
2df5369d345df3 Zhang Peng 2021-07-21  290  	struct resource res;
2df5369d345df3 Zhang Peng 2021-07-21  291  	u32 base, size;
2df5369d345df3 Zhang Peng 2021-07-21  292  	int ret = 0;
2df5369d345df3 Zhang Peng 2021-07-21  293  	int i;
2df5369d345df3 Zhang Peng 2021-07-21  294  
2df5369d345df3 Zhang Peng 2021-07-21  295  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
2df5369d345df3 Zhang Peng 2021-07-21  296  	if (!priv)
2df5369d345df3 Zhang Peng 2021-07-21  297  		return -ENOMEM;
2df5369d345df3 Zhang Peng 2021-07-21  298  
2df5369d345df3 Zhang Peng 2021-07-21  299  	sdev->pdata->hw_pdata = priv;
2df5369d345df3 Zhang Peng 2021-07-21  300  	priv->dev = sdev->dev;
2df5369d345df3 Zhang Peng 2021-07-21  301  	priv->sdev = sdev;
2df5369d345df3 Zhang Peng 2021-07-21  302  
2df5369d345df3 Zhang Peng 2021-07-21  303  	ret = imx8ulp_configure_sim_lpav(priv);
2df5369d345df3 Zhang Peng 2021-07-21  304  	if (ret)
2df5369d345df3 Zhang Peng 2021-07-21  305  		return -EPROBE_DEFER;
2df5369d345df3 Zhang Peng 2021-07-21  306  
2df5369d345df3 Zhang Peng 2021-07-21  307  	priv->ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
2df5369d345df3 Zhang Peng 2021-07-21  308  						      PLATFORM_DEVID_NONE,
2df5369d345df3 Zhang Peng 2021-07-21  309  						      pdev, sizeof(*pdev));
2df5369d345df3 Zhang Peng 2021-07-21  310  	if (IS_ERR(priv->ipc_dev)) {
2df5369d345df3 Zhang Peng 2021-07-21  311  		ret = PTR_ERR(priv->ipc_dev);
2df5369d345df3 Zhang Peng 2021-07-21  312  		goto exit_unroll_pm;
2df5369d345df3 Zhang Peng 2021-07-21  313  	}
2df5369d345df3 Zhang Peng 2021-07-21  314  
2df5369d345df3 Zhang Peng 2021-07-21  315  	priv->dsp_ipc = dev_get_drvdata(&priv->ipc_dev->dev);
2df5369d345df3 Zhang Peng 2021-07-21  316  	if (!priv->dsp_ipc) {
2df5369d345df3 Zhang Peng 2021-07-21  317  		/* DSP IPC driver not probed yet, try later */
2df5369d345df3 Zhang Peng 2021-07-21  318  		ret = -EPROBE_DEFER;
2df5369d345df3 Zhang Peng 2021-07-21  319  		dev_err(sdev->dev, "Failed to get drvdata\n");
2df5369d345df3 Zhang Peng 2021-07-21  320  		goto exit_pdev_unregister;
2df5369d345df3 Zhang Peng 2021-07-21  321  	}
2df5369d345df3 Zhang Peng 2021-07-21  322  
2df5369d345df3 Zhang Peng 2021-07-21  323  	imx_dsp_set_data(priv->dsp_ipc, priv);
2df5369d345df3 Zhang Peng 2021-07-21  324  	priv->dsp_ipc->ops = &dsp_ops;
2df5369d345df3 Zhang Peng 2021-07-21  325  
2df5369d345df3 Zhang Peng 2021-07-21  326  	/* DSP base */
2df5369d345df3 Zhang Peng 2021-07-21  327  	mmio = platform_get_resource(pdev, IORESOURCE_MEM, 0);
2df5369d345df3 Zhang Peng 2021-07-21  328  	if (mmio) {
2df5369d345df3 Zhang Peng 2021-07-21  329  		base = mmio->start;
2df5369d345df3 Zhang Peng 2021-07-21  330  		size = resource_size(mmio);
2df5369d345df3 Zhang Peng 2021-07-21  331  	} else {
2df5369d345df3 Zhang Peng 2021-07-21  332  		dev_err(sdev->dev, "error: failed to get DSP base at idx 0\n");
2df5369d345df3 Zhang Peng 2021-07-21  333  		ret = -EINVAL;
2df5369d345df3 Zhang Peng 2021-07-21  334  		goto exit_pdev_unregister;
2df5369d345df3 Zhang Peng 2021-07-21  335  	}
2df5369d345df3 Zhang Peng 2021-07-21  336  
2df5369d345df3 Zhang Peng 2021-07-21  337  	sdev->bar[SOF_FW_BLK_TYPE_IRAM] = devm_ioremap(sdev->dev, base, size);
2df5369d345df3 Zhang Peng 2021-07-21  338  	if (!sdev->bar[SOF_FW_BLK_TYPE_IRAM]) {
2df5369d345df3 Zhang Peng 2021-07-21  339  		dev_err(sdev->dev, "failed to ioremap base 0x%x size 0x%x\n",
2df5369d345df3 Zhang Peng 2021-07-21  340  			base, size);
2df5369d345df3 Zhang Peng 2021-07-21  341  		ret = -ENODEV;
2df5369d345df3 Zhang Peng 2021-07-21  342  		goto exit_pdev_unregister;
2df5369d345df3 Zhang Peng 2021-07-21  343  	}
2df5369d345df3 Zhang Peng 2021-07-21  344  	sdev->mmio_bar = SOF_FW_BLK_TYPE_IRAM;
2df5369d345df3 Zhang Peng 2021-07-21  345  
2df5369d345df3 Zhang Peng 2021-07-21  346  	res_node = of_parse_phandle(np, "memory-reserved", 0);
2df5369d345df3 Zhang Peng 2021-07-21  347  	if (!res_node) {
2df5369d345df3 Zhang Peng 2021-07-21  348  		dev_err(&pdev->dev, "failed to get memory region node\n");
2df5369d345df3 Zhang Peng 2021-07-21  349  		ret = -ENODEV;
2df5369d345df3 Zhang Peng 2021-07-21  350  		goto exit_pdev_unregister;
2df5369d345df3 Zhang Peng 2021-07-21  351  	}
2df5369d345df3 Zhang Peng 2021-07-21  352  
2df5369d345df3 Zhang Peng 2021-07-21  353  	ret = of_address_to_resource(res_node, 0, &res);
2df5369d345df3 Zhang Peng 2021-07-21  354  	if (ret) {
2df5369d345df3 Zhang Peng 2021-07-21  355  		dev_err(&pdev->dev, "failed to get reserved region address\n");
2df5369d345df3 Zhang Peng 2021-07-21  356  		goto exit_pdev_unregister;
2df5369d345df3 Zhang Peng 2021-07-21  357  	}
2df5369d345df3 Zhang Peng 2021-07-21  358  
2df5369d345df3 Zhang Peng 2021-07-21  359  	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev, res.start,
2df5369d345df3 Zhang Peng 2021-07-21  360  							  resource_size(&res));
2df5369d345df3 Zhang Peng 2021-07-21  361  	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
2df5369d345df3 Zhang Peng 2021-07-21  362  		dev_err(sdev->dev, "failed to ioremap mem 0x%x size 0x%x\n",
2df5369d345df3 Zhang Peng 2021-07-21  363  			base, size);
2df5369d345df3 Zhang Peng 2021-07-21  364  		ret = -ENOMEM;
2df5369d345df3 Zhang Peng 2021-07-21  365  		goto exit_pdev_unregister;
2df5369d345df3 Zhang Peng 2021-07-21  366  	}
2df5369d345df3 Zhang Peng 2021-07-21  367  	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
2df5369d345df3 Zhang Peng 2021-07-21  368  
2df5369d345df3 Zhang Peng 2021-07-21  369  	/* set default mailbox offset for FW ready message */
2df5369d345df3 Zhang Peng 2021-07-21  370  	sdev->dsp_box.offset = MBOX_OFFSET;
2df5369d345df3 Zhang Peng 2021-07-21  371  
2df5369d345df3 Zhang Peng 2021-07-21  372  	ret = of_reserved_mem_device_init(sdev->dev);
2df5369d345df3 Zhang Peng 2021-07-21  373  	if (ret) {
2df5369d345df3 Zhang Peng 2021-07-21  374  		dev_err(&pdev->dev, "failed to init reserved memory region %d\n", ret);
2df5369d345df3 Zhang Peng 2021-07-21  375  		goto exit_pdev_unregister;
2df5369d345df3 Zhang Peng 2021-07-21  376  	}
2df5369d345df3 Zhang Peng 2021-07-21  377  
2df5369d345df3 Zhang Peng 2021-07-21  378  	imx8ulp_init_clocks(sdev);
2df5369d345df3 Zhang Peng 2021-07-21  379  	imx8ulp_prepare_clocks(sdev);
2df5369d345df3 Zhang Peng 2021-07-21  380  
2df5369d345df3 Zhang Peng 2021-07-21  381  	return 0;
2df5369d345df3 Zhang Peng 2021-07-21  382  
2df5369d345df3 Zhang Peng 2021-07-21  383  exit_pdev_unregister:
2df5369d345df3 Zhang Peng 2021-07-21  384  	platform_device_unregister(priv->ipc_dev);
2df5369d345df3 Zhang Peng 2021-07-21  385  exit_unroll_pm:
2df5369d345df3 Zhang Peng 2021-07-21  386  	while (--i >= 0) {
2df5369d345df3 Zhang Peng 2021-07-21  387  		device_link_del(priv->link[i]);
2df5369d345df3 Zhang Peng 2021-07-21  388  		dev_pm_domain_detach(priv->pd_dev[i], false);
2df5369d345df3 Zhang Peng 2021-07-21  389  	}
2df5369d345df3 Zhang Peng 2021-07-21  390  
2df5369d345df3 Zhang Peng 2021-07-21  391  	return ret;
2df5369d345df3 Zhang Peng 2021-07-21  392  }
2df5369d345df3 Zhang Peng 2021-07-21  393  
2df5369d345df3 Zhang Peng 2021-07-21  394  static int imx8ulp_remove(struct snd_sof_dev *sdev)
2df5369d345df3 Zhang Peng 2021-07-21  395  {
2df5369d345df3 Zhang Peng 2021-07-21  396  	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
2df5369d345df3 Zhang Peng 2021-07-21  397  	int i;
2df5369d345df3 Zhang Peng 2021-07-21  398  
2df5369d345df3 Zhang Peng 2021-07-21  399  	platform_device_unregister(priv->ipc_dev);
2df5369d345df3 Zhang Peng 2021-07-21  400  
2df5369d345df3 Zhang Peng 2021-07-21  401  	for (i = 0; i < priv->num_domains; i++) {
2df5369d345df3 Zhang Peng 2021-07-21  402  		device_link_del(priv->link[i]);
2df5369d345df3 Zhang Peng 2021-07-21  403  		dev_pm_domain_detach(priv->pd_dev[i], false);
2df5369d345df3 Zhang Peng 2021-07-21  404  	}
2df5369d345df3 Zhang Peng 2021-07-21  405  
2df5369d345df3 Zhang Peng 2021-07-21  406  	return 0;
2df5369d345df3 Zhang Peng 2021-07-21  407  }
2df5369d345df3 Zhang Peng 2021-07-21  408  
2df5369d345df3 Zhang Peng 2021-07-21  409  /* on i.MX8 there is 1 to 1 match between type and BAR idx */
2df5369d345df3 Zhang Peng 2021-07-21  410  static int imx8ulp_get_bar_index(struct snd_sof_dev *sdev, u32 type)
2df5369d345df3 Zhang Peng 2021-07-21  411  {
2df5369d345df3 Zhang Peng 2021-07-21  412  	return type;
2df5369d345df3 Zhang Peng 2021-07-21  413  }
2df5369d345df3 Zhang Peng 2021-07-21  414  
2df5369d345df3 Zhang Peng 2021-07-21  415  static void imx8ulp_ipc_msg_data(struct snd_sof_dev *sdev,
2df5369d345df3 Zhang Peng 2021-07-21  416  			      struct snd_sof_pcm_stream *sps,
2df5369d345df3 Zhang Peng 2021-07-21  417  			      void *p, size_t sz)
2df5369d345df3 Zhang Peng 2021-07-21  418  {
2df5369d345df3 Zhang Peng 2021-07-21  419  	sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
2df5369d345df3 Zhang Peng 2021-07-21  420  }
2df5369d345df3 Zhang Peng 2021-07-21  421  
2df5369d345df3 Zhang Peng 2021-07-21  422  static int imx8ulp_ipc_pcm_params(struct snd_sof_dev *sdev,
2df5369d345df3 Zhang Peng 2021-07-21  423  			       struct snd_pcm_substream *substream,
2df5369d345df3 Zhang Peng 2021-07-21  424  			       const struct sof_ipc_pcm_params_reply *reply)
2df5369d345df3 Zhang Peng 2021-07-21  425  {
2df5369d345df3 Zhang Peng 2021-07-21  426  	return 0;
2df5369d345df3 Zhang Peng 2021-07-21  427  }
2df5369d345df3 Zhang Peng 2021-07-21  428  
2df5369d345df3 Zhang Peng 2021-07-21  429  static int imx8ulp_pcm_open(struct snd_sof_dev *sdev,
2df5369d345df3 Zhang Peng 2021-07-21  430  			  struct snd_pcm_substream *substream)
2df5369d345df3 Zhang Peng 2021-07-21  431  {
2df5369d345df3 Zhang Peng 2021-07-21  432  	return 0;
2df5369d345df3 Zhang Peng 2021-07-21  433  }
2df5369d345df3 Zhang Peng 2021-07-21  434  
2df5369d345df3 Zhang Peng 2021-07-21 @435  int imx8ulp_suspend(struct snd_sof_dev *sdev)
2df5369d345df3 Zhang Peng 2021-07-21  436  {
2df5369d345df3 Zhang Peng 2021-07-21  437  	int i;
2df5369d345df3 Zhang Peng 2021-07-21  438  	struct imx8ulp_priv *priv = (struct imx8ulp_priv *)sdev->pdata->hw_pdata;
2df5369d345df3 Zhang Peng 2021-07-21  439  
62c47623e87f12 Zhang Peng 2021-10-27  440  	regmap_update_bits(priv->regmap_sim, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
62c47623e87f12 Zhang Peng 2021-10-27  441  
2df5369d345df3 Zhang Peng 2021-07-21  442  	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
2df5369d345df3 Zhang Peng 2021-07-21  443  		imx_dsp_free_channel(priv->dsp_ipc, i);
2df5369d345df3 Zhang Peng 2021-07-21  444  
2df5369d345df3 Zhang Peng 2021-07-21  445  	imx8ulp_disable_clocks(priv->sdev);
2df5369d345df3 Zhang Peng 2021-07-21  446  
2df5369d345df3 Zhang Peng 2021-07-21  447  	return 0;
2df5369d345df3 Zhang Peng 2021-07-21  448  }
2df5369d345df3 Zhang Peng 2021-07-21  449  
2df5369d345df3 Zhang Peng 2021-07-21 @450  int imx8ulp_resume(struct snd_sof_dev *sdev)
2df5369d345df3 Zhang Peng 2021-07-21  451  {
2df5369d345df3 Zhang Peng 2021-07-21  452  	struct imx8ulp_priv *priv = (struct imx8ulp_priv *)sdev->pdata->hw_pdata;
2df5369d345df3 Zhang Peng 2021-07-21  453  	int i;
2df5369d345df3 Zhang Peng 2021-07-21  454  
2df5369d345df3 Zhang Peng 2021-07-21  455  	imx8ulp_prepare_clocks(sdev);
2df5369d345df3 Zhang Peng 2021-07-21  456  
2df5369d345df3 Zhang Peng 2021-07-21  457  	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
2df5369d345df3 Zhang Peng 2021-07-21  458  		imx_dsp_request_channel(priv->dsp_ipc, i);
2df5369d345df3 Zhang Peng 2021-07-21  459  
2df5369d345df3 Zhang Peng 2021-07-21  460  	return 0;
2df5369d345df3 Zhang Peng 2021-07-21  461  }
2df5369d345df3 Zhang Peng 2021-07-21  462  
2df5369d345df3 Zhang Peng 2021-07-21 @463  int imx8ulp_dsp_runtime_resume(struct snd_sof_dev *sdev)
2df5369d345df3 Zhang Peng 2021-07-21  464  {
2df5369d345df3 Zhang Peng 2021-07-21  465  	const struct sof_dsp_power_state target_dsp_state = {
2df5369d345df3 Zhang Peng 2021-07-21  466  		.state = SOF_DSP_PM_D0,
2df5369d345df3 Zhang Peng 2021-07-21  467  		.substate = 0,
2df5369d345df3 Zhang Peng 2021-07-21  468  	};
2df5369d345df3 Zhang Peng 2021-07-21  469  
2df5369d345df3 Zhang Peng 2021-07-21  470  	imx8ulp_resume(sdev);
2df5369d345df3 Zhang Peng 2021-07-21  471  
2df5369d345df3 Zhang Peng 2021-07-21  472  	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
2df5369d345df3 Zhang Peng 2021-07-21  473  }
2df5369d345df3 Zhang Peng 2021-07-21  474  
2df5369d345df3 Zhang Peng 2021-07-21 @475  int imx8ulp_dsp_runtime_suspend(struct snd_sof_dev *sdev)
2df5369d345df3 Zhang Peng 2021-07-21  476  {
2df5369d345df3 Zhang Peng 2021-07-21  477  	const struct sof_dsp_power_state target_dsp_state = {
2df5369d345df3 Zhang Peng 2021-07-21  478  		.state = SOF_DSP_PM_D3,
2df5369d345df3 Zhang Peng 2021-07-21  479  		.substate = 0,
2df5369d345df3 Zhang Peng 2021-07-21  480  	};
2df5369d345df3 Zhang Peng 2021-07-21  481  
2df5369d345df3 Zhang Peng 2021-07-21  482  	imx8ulp_suspend(sdev);
2df5369d345df3 Zhang Peng 2021-07-21  483  
2df5369d345df3 Zhang Peng 2021-07-21  484  	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
2df5369d345df3 Zhang Peng 2021-07-21  485  }
2df5369d345df3 Zhang Peng 2021-07-21  486  

:::::: The code at line 277 was first introduced by commit
:::::: 2df5369d345df34108fc9c4c3ed5581ccd918115 LF-4230-1: ASoC: SOF: Support SOF on 8ULP platform

:::::: TO: Zhang Peng <peng.zhang_8@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
