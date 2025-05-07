Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E761D432D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 06:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600203; cv=none; b=pswMidPrhsKUASJJvwQBK+eQPEIb3j7eqMiH4z+5T11V2KUhu5dbc34B8xjykMAFieSs1iKkLz+3gunWN7tq5ycDYv+uE/IFxwwKKw//GVe7KAvdtI7JTfqZKhDgcoSOvnP76Ns5AAN8My/Tsn+GfyYhCwGiQS2gphhMKWjM9pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600203; c=relaxed/simple;
	bh=aZ25T64gNdwGf+J8TumcC4kj9Ns1Wvy5ddf/2JTmftM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ODTPWcxvi87SDxmgwDXyqwUwIHFx4WJ1Dw/G4mu9FkXiAK+oYYIRQjd2qcjEqcb1LIEadxFPPCio+zOhAGR1Dc/cnj4l6EfVWi1yqI3CMRANmbuQSgO1fSg9j51QIqnaa82VqAyMbkp3bJOPGGwcnm8FrQDDfuNYKF3i1o72LOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bxpqoilR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxpqoilR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746600201; x=1778136201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aZ25T64gNdwGf+J8TumcC4kj9Ns1Wvy5ddf/2JTmftM=;
  b=bxpqoilRrOZn7NncE9jAXWh5w9y+DOU73710m9U+6tPipmlSjqNgCmXv
   t4s6B8NWkCvP0Kn9Ewizgvo2JU1bWXpYuM8O1ISrRdcBVFMuUZd1z4SGG
   T0FAuWbyEnCP42GauPBd/EtSyEE+FmTDzEqcriRUgHw5oTbK/VoltFU6W
   3+uCp6zkd57O7sl5obV72CJahTOalpxwc1UereCYipe06iXQvojQ+7N+t
   QWyjer7p/oCXH34jCx0e90w4XgUOJ8p4CBCZju3yV6Spg/F/kb+aDrAPO
   3nUyQC5rMb9MOgNGhpnzDwzq1SM2Ima9YEH8uliMYjt4BIAuStHAWXavR
   w==;
X-CSE-ConnectionGUID: I0duxSC6S8SaQ38htJXtgw==
X-CSE-MsgGUID: hdQeGbeKTGinL1EHHWuc6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48458738"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48458738"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:43:16 -0700
X-CSE-ConnectionGUID: hwoaBaAuQfOlMZn4vt1Ang==
X-CSE-MsgGUID: 5HIPjZuiS1ioshFeIHkcig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136380771"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 May 2025 23:43:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYUq-0007Dn-0d;
	Wed, 07 May 2025 06:43:12 +0000
Date: Wed, 7 May 2025 14:42:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-25 110/117]
 sound/soc/samsung/bells.c:68:3: error: a label can only be part of a
 statement and a declaration is not a statement
Message-ID: <202505071440.fFaM403K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-04-25
head:   bcd2a7ee0c9370920de5da1ddb86cc7e2a6cda92
commit: 9a7c9456dadfed656475b96bc7270ca91474e2c6 [110/117] CONVERT: hoge
config: arm64-randconfig-001-20250501 (https://download.01.org/0day-ci/archive/20250507/202505071440.fFaM403K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071440.fFaM403K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071440.fFaM403K-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/samsung/bells.c: In function 'bells_set_bias_level':
>> sound/soc/samsung/bells.c:68:3: error: a label can only be part of a statement and a declaration is not a statement
      68 |   struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
         |   ^~~~~~


vim +68 sound/soc/samsung/bells.c

    50	
    51	static int bells_set_bias_level(struct snd_soc_card *card,
    52					struct snd_soc_component *component,
    53					enum snd_soc_bias_level level)
    54	{
    55		struct snd_soc_pcm_runtime *rtd;
    56		struct snd_soc_dai *codec_dai;
    57		struct bells_drvdata *bells = card->drvdata;
    58		int ret;
    59	
    60		rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_DSP_CODEC]);
    61		codec_dai = snd_soc_rtd_to_codec(rtd, 0);
    62	
    63		if (component != codec_dai->component)
    64			return 0;
    65	
    66		switch (level) {
    67		case SND_SOC_BIAS_PREPARE:
  > 68			struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
    69	
    70			if (snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_STANDBY)
    71				break;
    72	
    73			ret = snd_soc_component_set_pll(component, WM5102_FLL1,
    74						    ARIZONA_FLL_SRC_MCLK1,
    75						    MCLK_RATE,
    76						    bells->sysclk_rate);
    77			if (ret < 0)
    78				pr_err("Failed to start FLL: %d\n", ret);
    79	
    80			if (bells->asyncclk_rate) {
    81				ret = snd_soc_component_set_pll(component, WM5102_FLL2,
    82							    ARIZONA_FLL_SRC_AIF2BCLK,
    83							    BCLK2_RATE,
    84							    bells->asyncclk_rate);
    85				if (ret < 0)
    86					pr_err("Failed to start FLL: %d\n", ret);
    87			}
    88			break;
    89	
    90		default:
    91			break;
    92		}
    93	
    94		return 0;
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
