Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4CA1C2DC1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 04:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726202260; cv=none; b=TZvfdQoY+VyYwDYBnhQpFhWQO+7gU69NC7PsfYEuMMTnCtqokG3+Rs1U9X49OzFXqiILE2MO6e1ZmWBV2KQtNP163Z4UFbuhBb2Jc15H/5G/sd5nvP/qt9jEXNxdS+Dp/zZI6UGnKlPZiS4cVXksbRb7uIIWJAnXCGh/e6UvQKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726202260; c=relaxed/simple;
	bh=KJSAmJp7son0p5Mlgj0g/qZ7KTE4AGtW1lnuGPyzvGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kgcx51mDyGppr10zMvDMGAV2rLZr6vKouEkF9JFQVVviXUarBh3oF5M3oOwk7YuNRMlj6VZHeutuyZa3jMPIRmHsFEqCp25bMZokkwrs13X0Up2RRkQ7s+wQQ4KqXdDsoC3KOx7brrGw1X7O6z5I/Br4FLXot8FsTLir0ppfjUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4xlnWMR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4xlnWMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726202258; x=1757738258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KJSAmJp7son0p5Mlgj0g/qZ7KTE4AGtW1lnuGPyzvGw=;
  b=N4xlnWMRTmajepK/mK1Ks6h9l8CuNew9pzCi8wW0kuXSxedfDt3p+oIm
   c2beRKwOWoU6vklwtY8XwwsQcsHkN89vz8DtipuzhUulK0WR67UOpagx1
   q83kPchn0ZkU5Y+gkVwhv+92SOlAJqxMPoNlBA0Owzr3Yt1sn765Vb3Y4
   dHoMs5E7jOyjMz+MlG9SsxI2NBBftoHsVJ7wfYYbe2eHo+6IbXtO7RxHp
   ulADO41uUvuQpBUsXCJUwEjz7IeB2z9yqauVVdpNbyccUIySWnerAPz9r
   2JTN7gB5xsM70yZ1YRyKdJ1bJ9xsvU98cfRZ3mc3cLN5tH/dbpoYFXZQP
   A==;
X-CSE-ConnectionGUID: V8o5GX5xTuqO63ocRsg3Lw==
X-CSE-MsgGUID: HvXfRUa1SF+7Y0mJpCSEDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24960707"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="24960707"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 21:37:37 -0700
X-CSE-ConnectionGUID: ixpYaG+jQ66UYzhnyu5wOg==
X-CSE-MsgGUID: LkTO/e3KTeWCV+YQpMx5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72736216"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Sep 2024 21:37:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soy3n-00061C-2q;
	Fri, 13 Sep 2024 04:37:31 +0000
Date: Fri, 13 Sep 2024 12:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-error-cleanup-2024-09-10 20/31]
 sound/soc/atmel/mikroe-proto.c:23:30: warning: unused variable 'card'
Message-ID: <202409131248.0FrTvExQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-error-cleanup-2024-09-10
head:   df81764a514843b316e76c4bc95d2f97a31297f5
commit: c0ba340282eabd3b687386030a1972e46f73e44c [20/31] snd_soc_dai_set_sysclk
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240913/202409131248.0FrTvExQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131248.0FrTvExQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131248.0FrTvExQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/atmel/mikroe-proto.c: In function 'snd_proto_init':
>> sound/soc/atmel/mikroe-proto.c:23:30: warning: unused variable 'card' [-Wunused-variable]
      23 |         struct snd_soc_card *card = rtd->card;
         |                              ^~~~
--
   sound/soc/fsl/fsl-asoc-card.c: In function 'fsl_asoc_card_hw_params':
>> sound/soc/fsl/fsl-asoc-card.c:178:24: warning: unused variable 'dev' [-Wunused-variable]
     178 |         struct device *dev = rtd->card->dev;
         |                        ^~~
   sound/soc/fsl/fsl-asoc-card.c: In function 'fsl_asoc_card_hw_free':
   sound/soc/fsl/fsl-asoc-card.c:247:24: warning: unused variable 'dev' [-Wunused-variable]
     247 |         struct device *dev = rtd->card->dev;
         |                        ^~~
   sound/soc/fsl/fsl-asoc-card.c: In function 'fsl_asoc_card_late_probe':
   sound/soc/fsl/fsl-asoc-card.c:561:24: warning: unused variable 'dev' [-Wunused-variable]
     561 |         struct device *dev = card->dev;
         |                        ^~~
--
   sound/soc/fsl/imx-sgtl5000.c: In function 'imx_sgtl5000_dai_init':
>> sound/soc/fsl/imx-sgtl5000.c:30:24: warning: unused variable 'dev' [-Wunused-variable]
      30 |         struct device *dev = rtd->card->dev;
         |                        ^~~
--
   sound/soc/fsl/imx-hdmi.c: In function 'imx_hdmi_hw_params':
>> sound/soc/fsl/imx-hdmi.c:40:24: warning: unused variable 'dev' [-Wunused-variable]
      40 |         struct device *dev = card->dev;
         |                        ^~~
--
   sound/soc/fsl/imx-rpmsg.c: In function 'imx_rpmsg_late_probe':
>> sound/soc/fsl/imx-rpmsg.c:39:24: warning: unused variable 'dev' [-Wunused-variable]
      39 |         struct device *dev = card->dev;
         |                        ^~~
--
   sound/soc/fsl/imx-card.c: In function 'imx_aif_hw_params':
>> sound/soc/fsl/imx-card.c:298:24: warning: unused variable 'dev' [-Wunused-variable]
     298 |         struct device *dev = card->dev;
         |                        ^~~
--
   sound/soc/sdw_utils/soc_sdw_rt_amp.c: In function 'rt1308_i2s_hw_params':
>> sound/soc/sdw_utils/soc_sdw_rt_amp.c:219:30: warning: unused variable 'card' [-Wunused-variable]
     219 |         struct snd_soc_card *card = rtd->card;
         |                              ^~~~
--
   sound/soc/intel/boards/sof_realtek_common.c: In function 'rt1308_hw_params':
>> sound/soc/intel/boards/sof_realtek_common.c:550:30: warning: unused variable 'card' [-Wunused-variable]
     550 |         struct snd_soc_card *card = rtd->card;
         |                              ^~~~
--
   sound/soc/mediatek/mt8195/mt8195-mt6359.c: In function 'mt8195_rt1011_etdm_hw_params':
>> sound/soc/mediatek/mt8195/mt8195-mt6359.c:472:30: warning: unused variable 'card' [-Wunused-variable]
     472 |         struct snd_soc_card *card = rtd->card;
         |                              ^~~~


vim +/card +23 sound/soc/atmel/mikroe-proto.c

a45f8853a5f95e Codrin Ciubotariu 2018-08-31  20  
a45f8853a5f95e Codrin Ciubotariu 2018-08-31  21  static int snd_proto_init(struct snd_soc_pcm_runtime *rtd)
a45f8853a5f95e Codrin Ciubotariu 2018-08-31  22  {
a45f8853a5f95e Codrin Ciubotariu 2018-08-31 @23  	struct snd_soc_card *card = rtd->card;
6547effc3aea50 Kuninori Morimoto 2023-09-11  24  	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
a45f8853a5f95e Codrin Ciubotariu 2018-08-31  25  
a45f8853a5f95e Codrin Ciubotariu 2018-08-31  26  	/* Set proto sysclk */
c0ba340282eabd Kuninori Morimoto 2024-09-10  27  	return snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_XTAL,
a45f8853a5f95e Codrin Ciubotariu 2018-08-31  28  					 XTAL_RATE, SND_SOC_CLOCK_IN);
a45f8853a5f95e Codrin Ciubotariu 2018-08-31  29  }
a45f8853a5f95e Codrin Ciubotariu 2018-08-31  30  

:::::: The code at line 23 was first introduced by commit
:::::: a45f8853a5f95e3760dfbd7ba09d3d597d247040 ASoC: Add driver for PROTO Audio CODEC (with a WM8731)

:::::: TO: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
