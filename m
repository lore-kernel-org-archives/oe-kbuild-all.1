Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621C07080D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 02:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774663249; cv=none; b=kUsoH1mh8lFZvJNxSDpWIAa+Nc6aU8VNAvKtjqXZJK/5SX+KbWGqLFi46uQGo0zbqtMoDBPc4q6j6LLdcWiK/140Da2CAjnD6/B/PXujMnKsS5lsOWenWT7g2dyyjfYtg/O9lsH3VBPcQtiAiQGyB0TicjkyNvqBIZxBNeHFxvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774663249; c=relaxed/simple;
	bh=Z/5pA6B8zrYccftifeUlcpKBLXsPPla5T/McDA8rigA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hSN637tpYnp6vEcDklkHnyJTKPiojoI6QHZ0WXnECJuuIgOBOKjvGACU4TA1PdFSvCMfsnhnE4eQxfl9emIC7U5LiMsSZ+7nKp0jZQVs7VjOpCMhVicB9kDHqIhTnSsHzD/X6I5Z9QfBrhcS1yZxhp6bW5ZTNQEpRLrBwXvJo8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUSnWFej; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUSnWFej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774663246; x=1806199246;
  h=date:from:to:cc:subject:message-id;
  bh=Z/5pA6B8zrYccftifeUlcpKBLXsPPla5T/McDA8rigA=;
  b=AUSnWFejr0sjUYQGveCdHtOBAkYU0ZgHy0WGsvrvbudtfSl+B5WcCwXu
   SXWXeelxtMS5CA2S1x+aUk7kV1+t25IobHInPqfJAierlIVBUvWWepo9C
   D1+RQlxMPodvBwOIsqZjAQbvsd4t9FewQCTG8Bw5Xj8iEbPDaC1RyNmlS
   eU10Jv4RYqvDzZneugjb/6JrBMKXbsYNzApZVK391+BVtR03w3SGdjR6o
   71Tp+EnjinkMgu7Cy9VkmD63OTp/10dczrjDjOYLamkqDj0s0G4F009++
   TwBJ+2qzuXF0G0uoKe66AIWr0yaMPcgCG3Ilmi88V3pbT1sK2F8BlaU+Q
   w==;
X-CSE-ConnectionGUID: I1OB9TlARoW+9DqEMMoBYA==
X-CSE-MsgGUID: k9Rt2/GASJWBhXTeqD8rAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="74922140"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="74922140"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 19:00:46 -0700
X-CSE-ConnectionGUID: +Pl99TmnRV+0T1c7qf135A==
X-CSE-MsgGUID: 1d5z3xUMTUecxcZ2wZmTyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="224679398"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Mar 2026 19:00:44 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Iyf-00000000Azl-2Qum;
	Sat, 28 Mar 2026 02:00:41 +0000
Date: Sat, 28 Mar 2026 10:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 101/106]
 sound/soc/pxa/mmp-sspa.c:86:27: warning: initialization of 'struct sspa_priv
 *' from 'int' makes pointer from integer without a cast
Message-ID: <202603280937.IGUTLytF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: feccc3fa86242c4532cc238e50998046b7ba39f6 [101/106] ASoC: soc-dai: remove snd_soc_dai_{set/get}_drvdata()
config: arm64-randconfig-004-20260328 (https://download.01.org/0day-ci/archive/20260328/202603280937.IGUTLytF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280937.IGUTLytF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280937.IGUTLytF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_startup':
   sound/soc/pxa/mmp-sspa.c:86:27: error: implicit declaration of function 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Werror=implicit-function-declaration]
     struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
                              ^~~~~~~~~~~~~~~~~~~~~~~
                              snd_soc_card_get_drvdata
>> sound/soc/pxa/mmp-sspa.c:86:27: warning: initialization of 'struct sspa_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_shutdown':
   sound/soc/pxa/mmp-sspa.c:97:27: warning: initialization of 'struct sspa_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
                              ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_set_dai_sysclk':
   sound/soc/pxa/mmp-sspa.c:109:27: warning: initialization of 'struct sspa_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
                              ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:110:23: error: implicit declaration of function 'snd_soc_dai_to_dev'; did you mean 'snd_soc_dapm_to_dev'? [-Werror=implicit-function-declaration]
     struct device *dev = snd_soc_dai_to_dev(cpu_dai);
                          ^~~~~~~~~~~~~~~~~~
                          snd_soc_dapm_to_dev
   sound/soc/pxa/mmp-sspa.c:110:23: warning: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_set_dai_pll':
   sound/soc/pxa/mmp-sspa.c:137:27: warning: initialization of 'struct sspa_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
                              ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:138:23: warning: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct device *dev = snd_soc_dai_to_dev(cpu_dai);
                          ^~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_set_dai_fmt':
   sound/soc/pxa/mmp-sspa.c:168:27: warning: initialization of 'struct sspa_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
                              ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_hw_params':
   sound/soc/pxa/mmp-sspa.c:215:27: warning: initialization of 'struct sspa_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
                              ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:216:23: warning: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct device *dev = snd_soc_dai_to_dev(dai);
                          ^~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_trigger':
   sound/soc/pxa/mmp-sspa.c:283:27: warning: initialization of 'struct sspa_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
                              ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_probe':
   sound/soc/pxa/mmp-sspa.c:327:23: warning: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct device *dev = snd_soc_dai_to_dev(dai);
                          ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +86 sound/soc/pxa/mmp-sspa.c

fa375d42f0e531 Zhangfei Gao   2012-06-11  82  
fa375d42f0e531 Zhangfei Gao   2012-06-11  83  static int mmp_sspa_startup(struct snd_pcm_substream *substream,
fa375d42f0e531 Zhangfei Gao   2012-06-11  84  	struct snd_soc_dai *dai)
fa375d42f0e531 Zhangfei Gao   2012-06-11  85  {
3c4e89df3b4534 Lubomir Rintel 2020-05-11 @86  	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
fa375d42f0e531 Zhangfei Gao   2012-06-11  87  
8ecdcac8792b67 Lubomir Rintel 2020-05-11  88  	clk_prepare_enable(sspa->sysclk);
8ecdcac8792b67 Lubomir Rintel 2020-05-11  89  	clk_prepare_enable(sspa->clk);
fa375d42f0e531 Zhangfei Gao   2012-06-11  90  
fa375d42f0e531 Zhangfei Gao   2012-06-11  91  	return 0;
fa375d42f0e531 Zhangfei Gao   2012-06-11  92  }
fa375d42f0e531 Zhangfei Gao   2012-06-11  93  

:::::: The code at line 86 was first introduced by commit
:::::: 3c4e89df3b45348dc0ee01a2ef1be710f7424ff7 ASoC: mmp-sspa: Remove the embedded struct ssp_device

:::::: TO: Lubomir Rintel <lkundrak@v3.sk>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
