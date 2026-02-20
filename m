Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA13451A6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 13:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771594936; cv=none; b=cNDqub45cmyTLWRdWW/yfPMhzcnGxl8Xpo6XTQySJtH5p1uat4oG9DM4/WwDFIkp7efmvXfHdCjKt9p/YDboE2o/QaMql/vvkAhBDZ9A05m4QMA9VxUoFMbaS1TO2RV3cbZp2EF4GGf10i65QtWCwAHh3QlKSF5kWCAfmctWXhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771594936; c=relaxed/simple;
	bh=HVGbyQ/5nnEJNHbv7vf78T5FxW9uCDrAvea/wWtD9og=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VkYeANd4rCfDiMv6UqRjaQlWA3S5QlJqT7Wdcbu66pjN2HFbF+OyHWiJLZxOYa8qqZqoEKPZyxcRcyyV8oJatujF933Po/2Y/eZzt6t8PxSZcpgJ6S1sEEy3VayE1ogCWmKi7tgz3GiXDp5D3rH9o0S/8Szk1IbLTEq2gPYmQxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eVTNnb5Z; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eVTNnb5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771594935; x=1803130935;
  h=date:from:to:cc:subject:message-id;
  bh=HVGbyQ/5nnEJNHbv7vf78T5FxW9uCDrAvea/wWtD9og=;
  b=eVTNnb5Z4w+KYTvwZbg8x6mH3cOJh2yW5rVt6M6TLSje98W7hoWfRGG7
   tH3L6yyOMKY3LtKGUEtIbCneXja4x59FHnZXrVQD+jQ3uv76ZzrLQLchp
   YypA4tR3RRRy1Z4hh+IzPcNk4Bq3yjJ2Ysza2XCuP49mPXb1MvTXLLu5s
   dmnCZ0MnqyCAoOW5vK86Ucj+qmwbTCruWx/FszctRvfE6xzMOtjuSo3Wm
   9o7wuI7/DNt630y7qwDmvqo20iZ1FYYgntMFAU5JQ8A5209ACo2r+xsDe
   F6lKPE7HVkjJ9rrt3pAlSxj587F3Vn+Ewd7B5LWmBsJ/YcMLby02x8ZzS
   A==;
X-CSE-ConnectionGUID: Jf8+kpqoQjePwGxV3NzVEg==
X-CSE-MsgGUID: CnpmGAXpQKSeH80Iz2QpUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="71711554"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="71711554"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 05:42:14 -0800
X-CSE-ConnectionGUID: KdMyKHyTRgydHyUoobvvYQ==
X-CSE-MsgGUID: v4qMBswDTSKOYayApH5+QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="213400644"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Feb 2026 05:42:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtQln-0000000148Q-1KO2;
	Fri, 20 Feb 2026 13:42:11 +0000
Date: Fri, 20 Feb 2026 21:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-02-20 64/66]
 sound/soc/pxa/mmp-sspa.c:110:30: error: dereferencing pointer to incomplete
 type 'struct snd_soc_dai'
Message-ID: <202602202110.hERmds2h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-02-20
head:   e7fa84e2f755a12d6e0312da700bb8f6038c035c
commit: c93b222fd35b0bc4dd175afaaf9ce4a08dc2b8d4 [64/66] move struct dai
config: arm64-randconfig-001-20260220 (https://download.01.org/0day-ci/archive/20260220/202602202110.hERmds2h-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602202110.hERmds2h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602202110.hERmds2h-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/pxa/mmp-sspa.c: In function 'mmp_sspa_set_dai_sysclk':
>> sound/soc/pxa/mmp-sspa.c:110:30: error: dereferencing pointer to incomplete type 'struct snd_soc_dai'
     struct device *dev = cpu_dai->component->dev;
                                 ^~


vim +110 sound/soc/pxa/mmp-sspa.c

fa375d42f0e531 Zhangfei Gao   2012-06-11  102  
fa375d42f0e531 Zhangfei Gao   2012-06-11  103  /*
fa375d42f0e531 Zhangfei Gao   2012-06-11  104   * Set the SSP ports SYSCLK.
fa375d42f0e531 Zhangfei Gao   2012-06-11  105   */
fa375d42f0e531 Zhangfei Gao   2012-06-11  106  static int mmp_sspa_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
fa375d42f0e531 Zhangfei Gao   2012-06-11  107  				    int clk_id, unsigned int freq, int dir)
fa375d42f0e531 Zhangfei Gao   2012-06-11  108  {
3c4e89df3b4534 Lubomir Rintel 2020-05-11  109  	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
a97e384ba78fd8 Lubomir Rintel 2020-05-11 @110  	struct device *dev = cpu_dai->component->dev;
fa375d42f0e531 Zhangfei Gao   2012-06-11  111  	int ret = 0;
fa375d42f0e531 Zhangfei Gao   2012-06-11  112  
a97e384ba78fd8 Lubomir Rintel 2020-05-11  113  	if (dev->of_node)
a97e384ba78fd8 Lubomir Rintel 2020-05-11  114  		return -ENOTSUPP;
a97e384ba78fd8 Lubomir Rintel 2020-05-11  115  
fa375d42f0e531 Zhangfei Gao   2012-06-11  116  	switch (clk_id) {
fa375d42f0e531 Zhangfei Gao   2012-06-11  117  	case MMP_SSPA_CLK_AUDIO:
3c4e89df3b4534 Lubomir Rintel 2020-05-11  118  		ret = clk_set_rate(sspa->audio_clk, freq);
fa375d42f0e531 Zhangfei Gao   2012-06-11  119  		if (ret)
fa375d42f0e531 Zhangfei Gao   2012-06-11  120  			return ret;
fa375d42f0e531 Zhangfei Gao   2012-06-11  121  		break;
fa375d42f0e531 Zhangfei Gao   2012-06-11  122  	case MMP_SSPA_CLK_PLL:
fa375d42f0e531 Zhangfei Gao   2012-06-11  123  	case MMP_SSPA_CLK_VCXO:
fa375d42f0e531 Zhangfei Gao   2012-06-11  124  		/* not support yet */
fa375d42f0e531 Zhangfei Gao   2012-06-11  125  		return -EINVAL;
fa375d42f0e531 Zhangfei Gao   2012-06-11  126  	default:
fa375d42f0e531 Zhangfei Gao   2012-06-11  127  		return -EINVAL;
fa375d42f0e531 Zhangfei Gao   2012-06-11  128  	}
fa375d42f0e531 Zhangfei Gao   2012-06-11  129  
fa375d42f0e531 Zhangfei Gao   2012-06-11  130  	return 0;
fa375d42f0e531 Zhangfei Gao   2012-06-11  131  }
fa375d42f0e531 Zhangfei Gao   2012-06-11  132  

:::::: The code at line 110 was first introduced by commit
:::::: a97e384ba78fd8bf7ba8c32718424d8a7536416e ASoC: mmp-sspa: Add Device Tree support

:::::: TO: Lubomir Rintel <lkundrak@v3.sk>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
