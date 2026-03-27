Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A79D32A3EC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 23:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774655620; cv=none; b=aZp31o+R+p9plXDu2LXsprvMCWl/FcRG8IYyY0SR/H2wHETmeojgC1lFqyH35YQKTpBxh1MnFB6BLKNBWo9jIfxv4Pz8BIHpan0zYBmglKwy55Ej2M7PELp2tdJvM+D9/3sE/lJMDJZ5VbqKcoyW1WnJqtBXOAuWf1UDwj50YVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774655620; c=relaxed/simple;
	bh=JxqxpCtQxrQ9llftSAzCkNbdiJnG0nuZ64cx8DqyiJk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c8laOv2pD+uuKJV5Bczv9eXPPwd7fOODzCZIspUyJu6xhO1pS50ZCCWpJaHlWKgvKj4VV1/a3LoSURnfdnPoBS6vOxYwFnN2txdH03uGnkCRJuoQhFm47bxDn75VBeZ1Afgmz0OOAEObDkAGVI2vQNU0B4RYmXlFf1HnkExkTQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9J3NGID; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9J3NGID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774655618; x=1806191618;
  h=date:from:to:cc:subject:message-id;
  bh=JxqxpCtQxrQ9llftSAzCkNbdiJnG0nuZ64cx8DqyiJk=;
  b=A9J3NGID7UVJsXn1hTSDXujIWJQanzzTGhh159O13M+fXHUNrrWj4AcB
   w8cWawXmA0cIHO1tDB9VpQze2sgkuOwHQFymbvhO03UXiJ0DPi0ObbbzB
   hr7VatjKm/u++OL5z/l0pVhMpOC33/bHa+YgGiX0wZ8EBqN/FZhFhHdzR
   lBcYPk2NPYfsHZr8LrZwrE1E+Ym30UYStMPmp32X+zm2yj0blP2XBnJ9K
   eR466+Z0eCMxqkO7yJ3U+b6GDhsLjFnclPUSj2XXfKtS6dnAGIItE1Snj
   RLDgtQq21IWNM8hE1kTv5yfe8FC8YUK5V8Z1jHy1CZkNtHAxAHBJ1Rwz/
   g==;
X-CSE-ConnectionGUID: nzOCe1OcS9W7VRipS2b0iQ==
X-CSE-MsgGUID: 4xiwaZiLT3G6VUOZqA5viw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="63288664"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="63288664"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 16:53:38 -0700
X-CSE-ConnectionGUID: MCrORBUyQzGteWqMCFLsKQ==
X-CSE-MsgGUID: bVWHrccDSFedHI+Um65qjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="230238700"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2026 16:53:36 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Gze-00000000Atz-08Nh;
	Fri, 27 Mar 2026 23:53:34 +0000
Date: Sat, 28 Mar 2026 07:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 95/106]
 sound/soc/pxa/mmp-sspa.c:110:23: warning: initialization of 'struct device *'
 from 'int' makes pointer from integer without a cast
Message-ID: <202603280752.qonDQ5vF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: 09f6604cc02792c7e69777d60b23ac6314ee428c [95/106] dai
config: arm64-randconfig-004-20260328 (https://download.01.org/0day-ci/archive/20260328/202603280752.qonDQ5vF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280752.qonDQ5vF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280752.qonDQ5vF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_set_dai_sysclk':
   sound/soc/pxa/mmp-sspa.c:110:23: error: implicit declaration of function 'snd_soc_dai_to_dev'; did you mean 'snd_soc_dapm_to_dev'? [-Werror=implicit-function-declaration]
     struct device *dev = snd_soc_dai_to_dev(cpu_dai);
                          ^~~~~~~~~~~~~~~~~~
                          snd_soc_dapm_to_dev
>> sound/soc/pxa/mmp-sspa.c:110:23: warning: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_set_dai_pll':
   sound/soc/pxa/mmp-sspa.c:138:23: warning: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct device *dev = snd_soc_dai_to_dev(cpu_dai);
                          ^~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_hw_params':
   sound/soc/pxa/mmp-sspa.c:216:23: warning: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct device *dev = snd_soc_dai_to_dev(dai);
                          ^~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_probe':
   sound/soc/pxa/mmp-sspa.c:327:23: warning: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct device *dev = snd_soc_dai_to_dev(dai);
                          ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
