Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088BA37F755
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774692981; cv=none; b=iTVL3pKU29sMwvGjusLXag5hZBI8NRAuUdlNuVnzYtOChURUhnG1MxOLIhE2CgiwgStx3TsEtIY5Pww2OmDQAlw2LEfvyM1A0MoNC9W1a26EGCYzTEGX0UE0XMZcffRlqhRZhDZPMStASN76LGWB4vUqB0B6R7T6HGeg5yBShyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774692981; c=relaxed/simple;
	bh=JDHeCx45wllcuCtK2/SWmCPF6ih567YS5Hg4ni3mQU0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pUc4PAsE43sFp4wdalLJxL6lxEo4oBadmPyZi+4X7aFP/CkRDERq346U4tNug29OoV7Nod5etJtkqQq2nj1cUhROJH1yUAhvnPMfBVx+qoczClRk5Em+KIP0dM28VnrFAD8FTeLtrcN953eZsLJ1kxdzb62kzUIeNMnQM2xJXlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JS6C2A2C; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JS6C2A2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774692979; x=1806228979;
  h=date:from:to:cc:subject:message-id;
  bh=JDHeCx45wllcuCtK2/SWmCPF6ih567YS5Hg4ni3mQU0=;
  b=JS6C2A2C10r95+nPs0j3xjMe7gX0ejXj6AkdzTCeProtOnR05PqF5M8H
   QxKgU/3nZ3errU3X3/uo5uKVz9TElN1jpEdX23B9tMZV1dLJQOvSu/180
   tuKtm5pYfL0yMSgfALpemtr/0WTBbRC0F1SBb4PzG3gmeIHhWBwHmaLCD
   Na5gk8LJifbCa0HQ22gjMpKaicauuPzRlaR2J8ZNH4/Uf3IO2AGY5GEu6
   Onc7r8xM+7n1+jkV3JXDQN981torUkGTT5/A+xEqPpI6cwlMu5uklq2Mh
   TSxpKzFRIqwtimc8PSs2c/pg/MK2PBRHusYheuTPr69olGyMj7DAEuQWF
   A==;
X-CSE-ConnectionGUID: OKWsj71HRpqVktBg5H2Irg==
X-CSE-MsgGUID: PIQo/YY6THCkhu3O6WUOtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86371331"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="86371331"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 03:16:18 -0700
X-CSE-ConnectionGUID: 2NTSQ0sNRKq0b8jQtjJxEQ==
X-CSE-MsgGUID: ewzyiWloSa6W0y9fDnO+WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="230472271"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Mar 2026 03:16:16 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6QiD-00000000BJB-2Xcm;
	Sat, 28 Mar 2026 10:16:13 +0000
Date: Sat, 28 Mar 2026 18:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 95/106]
 sound/soc/pxa/mmp-sspa.c:110:30: error: implicit declaration of function
 'snd_soc_dai_to_dev'; did you mean 'snd_soc_dapm_to_dev'?
Message-ID: <202603281805.TeCGLWjL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: 09f6604cc02792c7e69777d60b23ac6314ee428c [95/106] dai
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260328/202603281805.TeCGLWjL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603281805.TeCGLWjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603281805.TeCGLWjL-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_set_dai_sysclk':
>> sound/soc/pxa/mmp-sspa.c:110:30: error: implicit declaration of function 'snd_soc_dai_to_dev'; did you mean 'snd_soc_dapm_to_dev'? [-Wimplicit-function-declaration]
     110 |         struct device *dev = snd_soc_dai_to_dev(cpu_dai);
         |                              ^~~~~~~~~~~~~~~~~~
         |                              snd_soc_dapm_to_dev
>> sound/soc/pxa/mmp-sspa.c:110:30: error: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_set_dai_pll':
   sound/soc/pxa/mmp-sspa.c:138:30: error: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     138 |         struct device *dev = snd_soc_dai_to_dev(cpu_dai);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_hw_params':
   sound/soc/pxa/mmp-sspa.c:216:30: error: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     216 |         struct device *dev = snd_soc_dai_to_dev(dai);
         |                              ^~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_probe':
   sound/soc/pxa/mmp-sspa.c:327:30: error: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     327 |         struct device *dev = snd_soc_dai_to_dev(dai);
         |                              ^~~~~~~~~~~~~~~~~~


vim +110 sound/soc/pxa/mmp-sspa.c

   102	
   103	/*
   104	 * Set the SSP ports SYSCLK.
   105	 */
   106	static int mmp_sspa_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
   107					    int clk_id, unsigned int freq, int dir)
   108	{
   109		struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
 > 110		struct device *dev = snd_soc_dai_to_dev(cpu_dai);
   111		int ret = 0;
   112	
   113		if (dev->of_node)
   114			return -ENOTSUPP;
   115	
   116		switch (clk_id) {
   117		case MMP_SSPA_CLK_AUDIO:
   118			ret = clk_set_rate(sspa->audio_clk, freq);
   119			if (ret)
   120				return ret;
   121			break;
   122		case MMP_SSPA_CLK_PLL:
   123		case MMP_SSPA_CLK_VCXO:
   124			/* not support yet */
   125			return -EINVAL;
   126		default:
   127			return -EINVAL;
   128		}
   129	
   130		return 0;
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
