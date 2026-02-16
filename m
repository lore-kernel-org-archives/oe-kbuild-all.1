Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB2B3191BF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 20:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771274316; cv=none; b=MchZlr4yjdojTiLfKJ2eN2hrUXfHMk1lIVvtq0XVzu/8XwgN1TK1ohwYXSDfB2c7y9xJg3a68w5CiLyDFYNPjWVO6Z16ZJKWOW12YqXv5qQGDm2sPNO8ieKSuiGgxFwp2FllRONo9ntQaLtSFZKjPNGqmRCp6vHNPy7JpAoH+mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771274316; c=relaxed/simple;
	bh=+IU7qaljESUsZIY/zfGTCAScgZOxpSLj0WnGLtaoZug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ItI5QEnZ3N+EXxr1k7QUgdp/o3bjixfT3kYC6Ls8D/L87jcbFacx2l6uWmmjQcZffRQxjG66lDk+AmxBkTirV91l+Pf0Rf37Ffrx6BGwKzncwrQLOdNp5AbXfS7DXD5pQVgt5XW6UOBuHVtXiBYDODHGd/OafTLUKVbrWdOXA7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ymjmno2p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ymjmno2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771274314; x=1802810314;
  h=date:from:to:cc:subject:message-id;
  bh=+IU7qaljESUsZIY/zfGTCAScgZOxpSLj0WnGLtaoZug=;
  b=Ymjmno2pnnBf6lmR6ZKNFWwsHKcbtKcIqEDlhK2bSDaVInn7BmNKl4Yp
   IiErN43TylD+GRKRgta0WWwQp/9UoTeoTrM8+4ZUqh7wZaZynNorWK8Kc
   LlSqZa8X8i0yWVxwq6qjBELCNhHNq6FgdXH7hX0ZY/2KfDGSJVnDWdUdD
   IU60EbFHha076/p81+BTnasxvuiFOtXW9S3WTm24Tbj0M/qhvfqqlvbdW
   Qf1tGNApfhnnaKm+mU+CpTFD/Bp2bmNFDMTGseyHFomOCl0qLftWUvOXG
   9C9+SktkxkG+sPkumILhTqeg1A9a8m1a8j0dBJ7SOLxd1zHPURILCjOlj
   A==;
X-CSE-ConnectionGUID: wJUII3FvTiyHfsh+tbjLnA==
X-CSE-MsgGUID: 1yoAy9ZHTLSzF8QTUMrj7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83079008"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="83079008"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 12:38:33 -0800
X-CSE-ConnectionGUID: XoSn/AWPSmanDAcNu5j7Fw==
X-CSE-MsgGUID: LPPjK+FZRs+3EaOYo5dj7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="217844707"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Feb 2026 12:38:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs5MT-000000010GW-3NXn;
	Mon, 16 Feb 2026 20:38:29 +0000
Date: Tue, 17 Feb 2026 04:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-02-16 61/61]
 sound/soc/codecs/cs35l36.c:755 cs35l36_set_dai_fmt() warn: inconsistent
 indenting
Message-ID: <202602170419.ADHlGogf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-02-16
head:   bb25c306c1c6349fbd34a25fed00e74a9f6d9a9a
commit: bb25c306c1c6349fbd34a25fed00e74a9f6d9a9a [61/61] dai
config: arm64-randconfig-r073-20260216 (https://download.01.org/0day-ci/archive/20260217/202602170419.ADHlGogf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170419.ADHlGogf-lkp@intel.com/

smatch warnings:
sound/soc/codecs/cs35l36.c:755 cs35l36_set_dai_fmt() warn: inconsistent indenting

vim +755 sound/soc/codecs/cs35l36.c

   750	
   751	static int cs35l36_set_dai_fmt(struct snd_soc_dai *component_dai,
   752				       unsigned int fmt)
   753	{
   754			struct snd_soc_component *component = snd_soc_dai_to_component(component_dai);
 > 755		struct cs35l36_private *cs35l36 = snd_soc_component_get_drvdata(component);
   756		unsigned int asp_fmt, lrclk_fmt, sclk_fmt, clock_provider, clk_frc;
   757	
   758		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
   759		case SND_SOC_DAIFMT_CBP_CFP:
   760			clock_provider = 1;
   761			break;
   762		case SND_SOC_DAIFMT_CBC_CFC:
   763			clock_provider = 0;
   764			break;
   765		default:
   766			return -EINVAL;
   767		}
   768	
   769		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_TX_PIN_CTRL,
   770					CS35L36_SCLK_MSTR_MASK,
   771					clock_provider << CS35L36_SCLK_MSTR_SHIFT);
   772		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_RATE_CTRL,
   773					CS35L36_LRCLK_MSTR_MASK,
   774					clock_provider << CS35L36_LRCLK_MSTR_SHIFT);
   775	
   776		switch (fmt & SND_SOC_DAIFMT_CLOCK_MASK) {
   777		case SND_SOC_DAIFMT_CONT:
   778			clk_frc = 1;
   779			break;
   780		case SND_SOC_DAIFMT_GATED:
   781			clk_frc = 0;
   782			break;
   783		default:
   784			return -EINVAL;
   785		}
   786	
   787		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_TX_PIN_CTRL,
   788				   CS35L36_SCLK_FRC_MASK, clk_frc <<
   789				   CS35L36_SCLK_FRC_SHIFT);
   790		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_RATE_CTRL,
   791				   CS35L36_LRCLK_FRC_MASK, clk_frc <<
   792				   CS35L36_LRCLK_FRC_SHIFT);
   793	
   794		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
   795		case SND_SOC_DAIFMT_DSP_A:
   796			asp_fmt = 0;
   797			break;
   798		case SND_SOC_DAIFMT_I2S:
   799			asp_fmt = 2;
   800			break;
   801		default:
   802			return -EINVAL;
   803		}
   804	
   805		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
   806		case SND_SOC_DAIFMT_NB_IF:
   807			lrclk_fmt = 1;
   808			sclk_fmt = 0;
   809			break;
   810		case SND_SOC_DAIFMT_IB_NF:
   811			lrclk_fmt = 0;
   812			sclk_fmt = 1;
   813			break;
   814		case SND_SOC_DAIFMT_IB_IF:
   815			lrclk_fmt = 1;
   816			sclk_fmt = 1;
   817			break;
   818		case SND_SOC_DAIFMT_NB_NF:
   819			lrclk_fmt = 0;
   820			sclk_fmt = 0;
   821			break;
   822		default:
   823			return -EINVAL;
   824		}
   825	
   826		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_RATE_CTRL,
   827				   CS35L36_LRCLK_INV_MASK,
   828				   lrclk_fmt << CS35L36_LRCLK_INV_SHIFT);
   829		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_TX_PIN_CTRL,
   830				   CS35L36_SCLK_INV_MASK,
   831				   sclk_fmt << CS35L36_SCLK_INV_SHIFT);
   832		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_FORMAT,
   833				   CS35L36_ASP_FMT_MASK, asp_fmt);
   834	
   835		return 0;
   836	}
   837	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
