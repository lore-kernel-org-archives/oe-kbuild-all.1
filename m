Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BB423BD06
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Apr 2026 23:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776986146; cv=none; b=mi4GQQ7ZJWAEh3CJM6+BsiG3DpYMatWXo9QiVDiUKLoQBIRWmgifmBdvDY9y7w+AxV83lAjQbMwpkqPIqAx36JUKMEBC9PtXtZ2PmaLafyDEq3SedK33pBRIrBvBdmlEz1e+d4aKNVC/QHODLWfsitEZNFdrECaGl4sj0S035eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776986146; c=relaxed/simple;
	bh=reOiMOVnNk86PB3MY82BOuzZxaOsoOueGJY3HZY6yoA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pzVc0JapADkYcLiSAGDrCfkdhzySwQG0W7LL3a1f9F0yf7UCC395SjtO2fYG5s5kT1Ba/w3Iynr+BuD9jm2myny5dh7qceN04ohb/6HvARI14VGTpW9nRm+CyISLXerAcjCb860vne4cgeLr9HWKCMv/5DK2CXubERe7QH7ZjEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxe3X/Dc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxe3X/Dc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776986145; x=1808522145;
  h=date:from:to:cc:subject:message-id;
  bh=reOiMOVnNk86PB3MY82BOuzZxaOsoOueGJY3HZY6yoA=;
  b=mxe3X/DcT+4KeS6S/oTO/DeHssoosz5Ttyl1VWqd6x3R9pZrm1Y3EVER
   qo4beXrzHYj2FNWmSQ2h0hTump5uWzGGDB9bWOhVG5zwdEeztCxg6lsJN
   dp/LU7csOaRzYoZGWvvAMCujce2JmFCiNsvXfmZ+krDhVyGviPx7mYut2
   +DT7HQqMShdvKF1GsAm97SJAOWpG/41fyR2igSXU2WbpV9Pwjk2PDvq6e
   0uqx2XG5hJN0Fe5eRFKSSWUyDIu97wfa151HExirsbUgu0ApU/zw9vU8s
   UC9XBrjNVT6MxrGABvNlmjKIjIaG1CdcFRdVq5Po7lOn2fbQ8WItc62tg
   g==;
X-CSE-ConnectionGUID: tlnS/spRT72sQ2+t2X1B+A==
X-CSE-MsgGUID: NB7B9vSCSbaTO1Id1/kOwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77986083"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="77986083"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 16:15:44 -0700
X-CSE-ConnectionGUID: Ebl1tXGdTtGj0GSOjHDpxg==
X-CSE-MsgGUID: X++wmkYsTxiF8EmC1OmDMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="231936586"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Apr 2026 16:15:44 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wG3Gn-000000004h7-16Xg;
	Thu, 23 Apr 2026 23:15:41 +0000
Date: Fri, 24 Apr 2026 07:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-04-21 167/167]
 sound/soc/fsl/eukrea-tlv320.c:216:31: error: conflicting types for
 'eukrea_tlv320_driver'; have 'struct platform_driver'
Message-ID: <202604240755.HmSaiWzZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-04-21
head:   e532cc3ce1a670087bbbf444b59515d5e52d0c39
commit: 91455f26725d8b95591edccf587417cab67b819e [167/167] ASoC: fsl: eukrea-tlv320: use snd_soc_card_register()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260424/202604240755.HmSaiWzZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260424/202604240755.HmSaiWzZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604240755.HmSaiWzZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/fsl/eukrea-tlv320.c:216:31: error: conflicting types for 'eukrea_tlv320_driver'; have 'struct platform_driver'
     216 | static struct platform_driver eukrea_tlv320_driver = {
         |                               ^~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/eukrea-tlv320.c:78:35: note: previous definition of 'eukrea_tlv320_driver' with type 'struct snd_soc_card_driver'
      78 | static struct snd_soc_card_driver eukrea_tlv320_driver = {
         |                                   ^~~~~~~~~~~~~~~~~~~~


vim +216 sound/soc/fsl/eukrea-tlv320.c

66f232908de2f7 Denis Carikli 2014-01-15  215  
da75c924878c48 Fabio Estevam 2012-09-22 @216  static struct platform_driver eukrea_tlv320_driver = {
da75c924878c48 Fabio Estevam 2012-09-22  217  	.driver = {
da75c924878c48 Fabio Estevam 2012-09-22  218  		.name = "eukrea_tlv320",
66f232908de2f7 Denis Carikli 2014-01-15  219  		.of_match_table = imx_tlv320_dt_ids,
da75c924878c48 Fabio Estevam 2012-09-22  220  	},
da75c924878c48 Fabio Estevam 2012-09-22  221  	.probe = eukrea_tlv320_probe,
154bab12e1db82 Denis Carikli 2013-10-24  222  };
da75c924878c48 Fabio Estevam 2012-09-22  223  

:::::: The code at line 216 was first introduced by commit
:::::: da75c924878c48b3ee6ce21579bbf679f93ce40c ASoC: eukrea-tlv320: Convert it to platform driver

:::::: TO: Fabio Estevam <fabio.estevam@freescale.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
