Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A465B3587DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986409; cv=none; b=BpuqWSNaO67NuxmZNBAh3oJQRtZj2ERLKDrWLgflJFJFkkp82uul9BbTa7yFaofGPQfxuRWriSuqB63CAfFr4JqswsTbxBjyPldgdgqOnHKeJQNy7T1O6Eff047cPUA++QmkdCJmCFjlgcps6AjGAqEU3cERQrzpyhF87Bsw1mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986409; c=relaxed/simple;
	bh=GvyQ7SqsZSSwVPIt/dmJ26wZ+g/QELrzN3kUV1FRekA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UFjz557lC4CENVJeWQXuMdrZpn2bbz6MXxtn513r82w+v1spXjlSkwFpXgwwkByHIP4JH+jYLelXyfYK/tc5hCzq2KrtAC5c/m0DHMJjPKfjQ03M/V6RYQj+RD+kxIjSYRXSMCfEwq8hHSfrvp+rWgXxCCRY5qHOBUcihX5guqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzqpzR/W; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzqpzR/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768986407; x=1800522407;
  h=date:from:to:cc:subject:message-id;
  bh=GvyQ7SqsZSSwVPIt/dmJ26wZ+g/QELrzN3kUV1FRekA=;
  b=MzqpzR/WaxOvHrcv9NyV3O1MlGpdznooNjKp009lR4Y+uNVe8P3wU1Lc
   IeSwBwAkS/Y9+QchprhfB35nRl389g8oDsp2uBqUFUty53myevRgoc3tH
   w4/7z+RHr2h310v08Z8zyEPc/3oI+t9k4izzYAA+gBTbR4riy5f+dDKLc
   t+y8FViDxQif3X6aA8XHt0XhVr7QSULRlwaQ3Y1N8xyLaHHLWYsuW0EUn
   0i0fYH6YJ81YS69wPc+1gRQX91bUh7TYkyQyjsBRGAzWnnk8wsbZxZcEd
   LilEV76u3NhclCN/ORoixnFB7c7lo5yvLgGye3+fYUxj9M33upZCfEAUt
   Q==;
X-CSE-ConnectionGUID: tlTrxSKUTeapS9hQqRdwYw==
X-CSE-MsgGUID: Lp9f2miXQOeuiAo6Zde9WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="95681712"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="95681712"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 01:06:47 -0800
X-CSE-ConnectionGUID: Er7NUVsJS5iTdl2AUpmu2g==
X-CSE-MsgGUID: mOU9DPPxQhS8eopmzyB5jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="205644425"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Jan 2026 01:06:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viUAk-00000000QC1-2s54;
	Wed, 21 Jan 2026 09:06:42 +0000
Date: Wed, 21 Jan 2026 17:06:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 19/19]
 sound/soc/codecs/nau8325.c:425 nau8325_clksrc_choose() warn: inconsistent
 indenting
Message-ID: <202601211751.aOlZhQB9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jaroslav,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   2aeb340753d0e3533439d7647f568cba7214e573
commit: 79bc3bdf36bc29037cb4a5fe0cd8e4d93101ef7f [19/19] ASoC: nau8325: add missing build config
config: i386-randconfig-141-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211751.aOlZhQB9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211751.aOlZhQB9-lkp@intel.com/

smatch warnings:
sound/soc/codecs/nau8325.c:425 nau8325_clksrc_choose() warn: inconsistent indenting

vim +425 sound/soc/codecs/nau8325.c

c0a3873b9938bfa Seven Lee           2024-03-27  384  
c0a3873b9938bfa Seven Lee           2024-03-27  385  static int nau8325_clksrc_choose(struct nau8325 *nau8325,
c0a3873b9938bfa Seven Lee           2024-03-27  386  				 const struct nau8325_srate_attr **srate_table,
c0a3873b9938bfa Seven Lee           2024-03-27  387  				 int *n1_sel, int *mult_sel, int *n2_sel)
c0a3873b9938bfa Seven Lee           2024-03-27  388  {
1123b37d894768b Krzysztof Kozlowski 2025-12-03  389  	int i, j, mclk, ratio;
1123b37d894768b Krzysztof Kozlowski 2025-12-03  390  	int mclk_max = 0, ratio_sel = 0, n2_max = 0;
c0a3873b9938bfa Seven Lee           2024-03-27  391  
c0a3873b9938bfa Seven Lee           2024-03-27  392  	if (!nau8325->mclk || !nau8325->fs)
c0a3873b9938bfa Seven Lee           2024-03-27  393  		goto proc_err;
c0a3873b9938bfa Seven Lee           2024-03-27  394  
c0a3873b9938bfa Seven Lee           2024-03-27  395  	/* select sampling rate and MCLK_SRC */
c0a3873b9938bfa Seven Lee           2024-03-27  396  	*srate_table = target_srate_attribute(nau8325->fs);
c0a3873b9938bfa Seven Lee           2024-03-27  397  	if (!*srate_table)
c0a3873b9938bfa Seven Lee           2024-03-27  398  		goto proc_err;
c0a3873b9938bfa Seven Lee           2024-03-27  399  
c0a3873b9938bfa Seven Lee           2024-03-27  400  	/* First check clock from MCLK directly, decide N2 for MCLK_SRC.
c0a3873b9938bfa Seven Lee           2024-03-27  401  	 * If not good, consider 1/N1 and Multiplier.
c0a3873b9938bfa Seven Lee           2024-03-27  402  	 */
c0a3873b9938bfa Seven Lee           2024-03-27  403  	ratio = nau8325_clksrc_n2(nau8325, *srate_table, nau8325->mclk, n2_sel);
c0a3873b9938bfa Seven Lee           2024-03-27  404  	if (ratio != NAU8325_MCLK_FS_RATIO_NUM) {
c0a3873b9938bfa Seven Lee           2024-03-27  405  		*n1_sel = 0;
c0a3873b9938bfa Seven Lee           2024-03-27  406  		*mult_sel = CLK_PROC_BYPASS;
c0a3873b9938bfa Seven Lee           2024-03-27  407  		*n2_sel = MCLK_SRC;
c0a3873b9938bfa Seven Lee           2024-03-27  408  		goto proc_done;
c0a3873b9938bfa Seven Lee           2024-03-27  409  	}
c0a3873b9938bfa Seven Lee           2024-03-27  410  
c0a3873b9938bfa Seven Lee           2024-03-27  411  	/* Get MCLK_SRC through 1/N, Multiplier, and then 1/N2. */
c0a3873b9938bfa Seven Lee           2024-03-27  412  	for (i = 0; i < ARRAY_SIZE(mclk_n1_div); i++) {
c0a3873b9938bfa Seven Lee           2024-03-27  413  		for (j = 0; j < ARRAY_SIZE(mclk_n3_mult); j++) {
c0a3873b9938bfa Seven Lee           2024-03-27  414  			mclk = nau8325->mclk << mclk_n3_mult[j].param;
c0a3873b9938bfa Seven Lee           2024-03-27  415  			mclk = mclk / mclk_n1_div[i].param;
c0a3873b9938bfa Seven Lee           2024-03-27  416  			ratio = nau8325_clksrc_n2(nau8325,
c0a3873b9938bfa Seven Lee           2024-03-27  417  						  *srate_table, mclk, n2_sel);
c0a3873b9938bfa Seven Lee           2024-03-27  418  			if (ratio != NAU8325_MCLK_FS_RATIO_NUM &&
c0a3873b9938bfa Seven Lee           2024-03-27  419  			    (mclk_max < mclk || i > *n1_sel)) {
c0a3873b9938bfa Seven Lee           2024-03-27  420  				mclk_max = mclk;
c0a3873b9938bfa Seven Lee           2024-03-27  421  				n2_max = *n2_sel;
c0a3873b9938bfa Seven Lee           2024-03-27  422  				*n1_sel = i;
c0a3873b9938bfa Seven Lee           2024-03-27  423  				*mult_sel = j;
c0a3873b9938bfa Seven Lee           2024-03-27  424  				ratio_sel = ratio;
c0a3873b9938bfa Seven Lee           2024-03-27 @425  					goto proc_done;
c0a3873b9938bfa Seven Lee           2024-03-27  426  			}
c0a3873b9938bfa Seven Lee           2024-03-27  427  		}
c0a3873b9938bfa Seven Lee           2024-03-27  428  	}
c0a3873b9938bfa Seven Lee           2024-03-27  429  	if (mclk_max) {
c0a3873b9938bfa Seven Lee           2024-03-27  430  		*n2_sel = n2_max;
c0a3873b9938bfa Seven Lee           2024-03-27  431  		ratio = ratio_sel;
c0a3873b9938bfa Seven Lee           2024-03-27  432  		goto proc_done;
c0a3873b9938bfa Seven Lee           2024-03-27  433  	}
c0a3873b9938bfa Seven Lee           2024-03-27  434  
c0a3873b9938bfa Seven Lee           2024-03-27  435  proc_err:
c0a3873b9938bfa Seven Lee           2024-03-27  436  	dev_dbg(nau8325->dev, "The MCLK %d is invalid. It can't get MCLK_SRC of 256/400/500 FS (%d)",
c0a3873b9938bfa Seven Lee           2024-03-27  437  		nau8325->mclk, nau8325->fs);
c0a3873b9938bfa Seven Lee           2024-03-27  438  	return -EINVAL;
c0a3873b9938bfa Seven Lee           2024-03-27  439  proc_done:
c0a3873b9938bfa Seven Lee           2024-03-27  440  	dev_dbg(nau8325->dev, "nau8325->fs=%d,range=0x%x, %s, (n1,mu,n2,dmu):(%d,%d,%d), MCLK_SRC=%uHz (%d)",
c0a3873b9938bfa Seven Lee           2024-03-27  441  		nau8325->fs, (*srate_table)->range,
c0a3873b9938bfa Seven Lee           2024-03-27  442  		(*srate_table)->max ? "MAX" : "MIN",
c0a3873b9938bfa Seven Lee           2024-03-27  443  		*n1_sel == CLK_PROC_BYPASS ?
c0a3873b9938bfa Seven Lee           2024-03-27  444  		CLK_PROC_BYPASS : mclk_n1_div[*n1_sel].param,
c0a3873b9938bfa Seven Lee           2024-03-27  445  		*mult_sel == CLK_PROC_BYPASS ?
c0a3873b9938bfa Seven Lee           2024-03-27  446  		CLK_PROC_BYPASS : 1 << mclk_n3_mult[*mult_sel].param,
c0a3873b9938bfa Seven Lee           2024-03-27  447  		1 << mclk_n2_div[*n2_sel].param,
c0a3873b9938bfa Seven Lee           2024-03-27  448  		(*srate_table)->mclk_src[ratio],
c0a3873b9938bfa Seven Lee           2024-03-27  449  		(*srate_table)->mclk_src[ratio] / nau8325->fs);
c0a3873b9938bfa Seven Lee           2024-03-27  450  
c0a3873b9938bfa Seven Lee           2024-03-27  451  	return 0;
c0a3873b9938bfa Seven Lee           2024-03-27  452  }
c0a3873b9938bfa Seven Lee           2024-03-27  453  

:::::: The code at line 425 was first introduced by commit
:::::: c0a3873b9938bfaa77bd337cad33266a50a6583f ASoC: nau8325: new driver

:::::: TO: Seven Lee <wtli@nuvoton.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
