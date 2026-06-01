Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C663D8112
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327637; cv=none; b=n37n7y4ZyIRaVPCV2qp45kFTu+VhohwWbtbB/eRROnpzdPteHUDDunJRKyJqLqmz/4vOQ92YAC9bad06pnI7Ha2/MFOLw7gGqM4NIsojW6H7BWDDPB6mitqE9WF8vvlqKKsFRjZszLSyCdeg3RsM2Lmu4q7Io+atT2mfhgp6wrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327637; c=relaxed/simple;
	bh=zEXG6PuN+G4gaZu7HBhfa0OVJo6VtkON69ZC+KLZ+jA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nJxRxjk7r7yNFmJ/5jmG4MRzdTjqCADUJNepRTWpsncsjHUsSCBypF76hwt5Em5kqFbPVlz04itlo6JKGqQhHTLaRT1RePh3z40iEUXb8CzneTDH1eAA+koOYhuADdASp1GvdS0cOxOcpB8zBleTT8mQGCSLOvaZTaRgnletWac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWDooHvi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWDooHvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780327630; x=1811863630;
  h=date:from:to:cc:subject:message-id;
  bh=zEXG6PuN+G4gaZu7HBhfa0OVJo6VtkON69ZC+KLZ+jA=;
  b=XWDooHvisp2YkKtMRPrAHx/qIbbSUFTdNmSYsmpeynaKE+xd2TRJGLOZ
   y8hBToceyHw5v/wP7R9x+qOats6sV/8cB6LgXnb4MsVAnG/Ug4W/h+V1v
   tK4+rNpN9awYajd1BJmM99LUeZAWvyiZZRBbk/YHr92uWj7ApV7frSbgA
   grPoPGHJgHFq3tfo1fdoY+ov0ONCkMql9b8tDvrL1Anw+xGVL1YP4uQRs
   XN5jm3LAI0TTEOK6itxQECxvwjug8Ojx8rnXDZr7n9aTbceLT/ddH6B7V
   1/qnqoZ8Snnxj64HCttZvOZPWb62cgPQPjCDAV0j8AawPBNwwRbgKcEba
   Q==;
X-CSE-ConnectionGUID: KK/7PwYVQAOc0P1HS8Iqjg==
X-CSE-MsgGUID: nmHpEAifS4SCQDKSMgPZeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="103757328"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="103757328"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 08:27:10 -0700
X-CSE-ConnectionGUID: PQvfhJkESvqAQWwKpZptKw==
X-CSE-MsgGUID: tmSR6/8mTJa9qUFfDF+yAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243728934"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2026 08:27:08 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU4Xi-00000000AiS-0bt7;
	Mon, 01 Jun 2026 15:27:06 +0000
Date: Mon, 01 Jun 2026 23:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/spacemit/k1_i2s.c:112:40: error: implicit declaration of function
 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'?
Message-ID: <202606012315.T2yj09vP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 8be84f679bd497ac2dabc87df9f9a4737f841c0d [290/290] ASoC: soc-dai: remove snd_soc_dai_{set/get}_drvdata()
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20260601/202606012315.T2yj09vP-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606012315.T2yj09vP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606012315.T2yj09vP-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/spacemit/k1_i2s.c: In function 'spacemit_i2s_startup':
>> sound/soc/spacemit/k1_i2s.c:112:40: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Wimplicit-function-declaration]
     112 |         struct spacemit_i2s_dev *i2s = snd_soc_dai_get_drvdata(dai);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~
         |                                        snd_soc_card_get_drvdata
>> sound/soc/spacemit/k1_i2s.c:112:40: error: initialization of 'struct spacemit_i2s_dev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]


vim +112 sound/soc/spacemit/k1_i2s.c

fce217449075d5 Troy Mitchell 2025-10-17  108  
6b4afbaaa342ea Troy Mitchell 2026-04-29  109  static int spacemit_i2s_startup(struct snd_pcm_substream *substream,
6b4afbaaa342ea Troy Mitchell 2026-04-29  110  	struct snd_soc_dai *dai)
6b4afbaaa342ea Troy Mitchell 2026-04-29  111  {
6b4afbaaa342ea Troy Mitchell 2026-04-29 @112  	struct spacemit_i2s_dev *i2s = snd_soc_dai_get_drvdata(dai);
6b4afbaaa342ea Troy Mitchell 2026-04-29  113  
6b4afbaaa342ea Troy Mitchell 2026-04-29  114  	switch (i2s->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
6b4afbaaa342ea Troy Mitchell 2026-04-29  115  	case SND_SOC_DAIFMT_I2S:
6b4afbaaa342ea Troy Mitchell 2026-04-29  116  		snd_pcm_hw_constraint_minmax(substream->runtime,
6b4afbaaa342ea Troy Mitchell 2026-04-29  117  					     SNDRV_PCM_HW_PARAM_CHANNELS,
6b4afbaaa342ea Troy Mitchell 2026-04-29  118  					     2, 2);
6b4afbaaa342ea Troy Mitchell 2026-04-29  119  		snd_pcm_hw_constraint_mask64(substream->runtime,
6b4afbaaa342ea Troy Mitchell 2026-04-29  120  					     SNDRV_PCM_HW_PARAM_FORMAT,
6b4afbaaa342ea Troy Mitchell 2026-04-29  121  					     SNDRV_PCM_FMTBIT_S16_LE);
6b4afbaaa342ea Troy Mitchell 2026-04-29  122  		break;
6b4afbaaa342ea Troy Mitchell 2026-04-29  123  	case SND_SOC_DAIFMT_DSP_A:
6b4afbaaa342ea Troy Mitchell 2026-04-29  124  	case SND_SOC_DAIFMT_DSP_B:
6b4afbaaa342ea Troy Mitchell 2026-04-29  125  		snd_pcm_hw_constraint_minmax(substream->runtime,
6b4afbaaa342ea Troy Mitchell 2026-04-29  126  					     SNDRV_PCM_HW_PARAM_CHANNELS,
6b4afbaaa342ea Troy Mitchell 2026-04-29  127  					     1, 1);
6b4afbaaa342ea Troy Mitchell 2026-04-29  128  		snd_pcm_hw_constraint_mask64(substream->runtime,
6b4afbaaa342ea Troy Mitchell 2026-04-29  129  					     SNDRV_PCM_HW_PARAM_FORMAT,
6b4afbaaa342ea Troy Mitchell 2026-04-29  130  					     SNDRV_PCM_FMTBIT_S32_LE);
6b4afbaaa342ea Troy Mitchell 2026-04-29  131  		break;
6b4afbaaa342ea Troy Mitchell 2026-04-29  132  	default:
6b4afbaaa342ea Troy Mitchell 2026-04-29  133  		dev_dbg(i2s->dev, "unexpected format type");
6b4afbaaa342ea Troy Mitchell 2026-04-29  134  		return -EINVAL;
6b4afbaaa342ea Troy Mitchell 2026-04-29  135  	}
6b4afbaaa342ea Troy Mitchell 2026-04-29  136  
6b4afbaaa342ea Troy Mitchell 2026-04-29  137  	return 0;
6b4afbaaa342ea Troy Mitchell 2026-04-29  138  }
6b4afbaaa342ea Troy Mitchell 2026-04-29  139  

:::::: The code at line 112 was first introduced by commit
:::::: 6b4afbaaa342eaa52172e0be5ef8d1fcbf9ff460 ASoC: spacemit: move hw constraints from hw_params to startup

:::::: TO: Troy Mitchell <troy.mitchell@linux.spacemit.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
