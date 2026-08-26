Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C129141B8EB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747129; cv=none; b=biaICJbcYnWsAA8c0+vVXTpJ9HNS8Jg+UPPRGfaFjPAeZlD+RVNVF164lj5F81yyjTxT7GX9WX9WPQ8yMP3djbTDDTHBMowIX7aCLfSbHHVe0jcHVgFXH8qmAbEmPnC9+cLOPsOsdMpDvBmuwpnoGXBSDCSXzdbZtJ29ZkwZAb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747129; c=relaxed/simple;
	bh=1Pdrkg77u6Rx4+qp18wt59hkTUMvpkiRblh3jdfR9MI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sz59pxjiqw0JQMo8hzNQQJJfptuICCkHxbV0CfM7PVrioBXDDb5XaUMlV+8ap2iBKEVzSwFGQbh69WfufJKw41qUmkSozLN+sn1ESZe10vhPkzViIfTvBXIGaeiUkGnqBEKwWDhFUqI/uoxhmCwsq8U2NzPEYDu0tP6y3r8iMus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayCwXV2Z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayCwXV2Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787747127; x=1819283127;
  h=date:from:to:cc:subject:message-id;
  bh=1Pdrkg77u6Rx4+qp18wt59hkTUMvpkiRblh3jdfR9MI=;
  b=ayCwXV2Zv7PX+U1T0bdb2lsINr3pXIKMLhY19MSd4lcG1MX5CfM5azOl
   J8ORr9hsS+xua9g+QujsHKxEjmXvQddm3IwjsBj949w3y2TKWVZlDSU3P
   d7qGOZbqOh1jYBtFohqFox/y/CicuwlO8L04tQsiH/ezQljIGnijjp60i
   Aq3YvI20qTG2Q2z/1+e6YwToxjDlspKD1N0IKIge8Qe3NjUA37zzPQmuf
   vw3IxDU35SmHP9FJ61EIxN28ymwLn0KE259bRVWERZdGePbQV8HQ25NyN
   aPu62WP8wYCKSpLc5phnHzbTLxH3i8ZSKtc+vRHTSH6QakcvQpjLkHnwV
   A==;
X-CSE-ConnectionGUID: 4bFx83DSSrW6dFk5QG1LSg==
X-CSE-MsgGUID: LvFT7mw2Rl2fFr1icUO4QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="105604387"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="105604387"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 05:25:26 -0700
X-CSE-ConnectionGUID: z9s6iXeWRYCcqzu92BGIew==
X-CSE-MsgGUID: smkA2DUfR+ahcSsvnGfh8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="268132153"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Aug 2026 05:25:25 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzCh0-000000007Qz-2PAi;
	Wed, 26 Aug 2026 12:25:22 +0000
Date: Wed, 26 Aug 2026 20:24:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-06 6/6]
 sound/soc/codecs/nau8325.c:425 nau8325_clksrc_choose() warn: inconsistent
 indenting
Message-ID: <202608262036.dl40G5K0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jaroslav,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-06
head:   4f69fc7b210c4319e69b69cd861e6efa5b096e2a
commit: ceb8ee5ed4507c9de966b4ce8c76450c0051230a [6/6] ASoC: nau8325: add missing build config
config: x86_64-randconfig-161-20260826 (https://download.01.org/0day-ci/archive/20260826/202608262036.dl40G5K0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608262036.dl40G5K0-lkp@intel.com/

smatch warnings:
sound/soc/codecs/nau8325.c:425 nau8325_clksrc_choose() warn: inconsistent indenting

vim +425 sound/soc/codecs/nau8325.c

c0a3873b9938bf Seven Lee 2024-03-27  384  
c0a3873b9938bf Seven Lee 2024-03-27  385  static int nau8325_clksrc_choose(struct nau8325 *nau8325,
c0a3873b9938bf Seven Lee 2024-03-27  386  				 const struct nau8325_srate_attr **srate_table,
c0a3873b9938bf Seven Lee 2024-03-27  387  				 int *n1_sel, int *mult_sel, int *n2_sel)
c0a3873b9938bf Seven Lee 2024-03-27  388  {
c0a3873b9938bf Seven Lee 2024-03-27  389  	int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
c0a3873b9938bf Seven Lee 2024-03-27  390  
c0a3873b9938bf Seven Lee 2024-03-27  391  	if (!nau8325->mclk || !nau8325->fs)
c0a3873b9938bf Seven Lee 2024-03-27  392  		goto proc_err;
c0a3873b9938bf Seven Lee 2024-03-27  393  
c0a3873b9938bf Seven Lee 2024-03-27  394  	/* select sampling rate and MCLK_SRC */
c0a3873b9938bf Seven Lee 2024-03-27  395  	*srate_table = target_srate_attribute(nau8325->fs);
c0a3873b9938bf Seven Lee 2024-03-27  396  	if (!*srate_table)
c0a3873b9938bf Seven Lee 2024-03-27  397  		goto proc_err;
c0a3873b9938bf Seven Lee 2024-03-27  398  
c0a3873b9938bf Seven Lee 2024-03-27  399  	/* First check clock from MCLK directly, decide N2 for MCLK_SRC.
c0a3873b9938bf Seven Lee 2024-03-27  400  	 * If not good, consider 1/N1 and Multiplier.
c0a3873b9938bf Seven Lee 2024-03-27  401  	 */
c0a3873b9938bf Seven Lee 2024-03-27  402  	ratio = nau8325_clksrc_n2(nau8325, *srate_table, nau8325->mclk, n2_sel);
c0a3873b9938bf Seven Lee 2024-03-27  403  	if (ratio != NAU8325_MCLK_FS_RATIO_NUM) {
c0a3873b9938bf Seven Lee 2024-03-27  404  		*n1_sel = 0;
c0a3873b9938bf Seven Lee 2024-03-27  405  		*mult_sel = CLK_PROC_BYPASS;
c0a3873b9938bf Seven Lee 2024-03-27  406  		*n2_sel = MCLK_SRC;
c0a3873b9938bf Seven Lee 2024-03-27  407  		goto proc_done;
c0a3873b9938bf Seven Lee 2024-03-27  408  	}
c0a3873b9938bf Seven Lee 2024-03-27  409  
c0a3873b9938bf Seven Lee 2024-03-27  410  	/* Get MCLK_SRC through 1/N, Multiplier, and then 1/N2. */
c0a3873b9938bf Seven Lee 2024-03-27  411  	mclk_max = 0;
c0a3873b9938bf Seven Lee 2024-03-27  412  	for (i = 0; i < ARRAY_SIZE(mclk_n1_div); i++) {
c0a3873b9938bf Seven Lee 2024-03-27  413  		for (j = 0; j < ARRAY_SIZE(mclk_n3_mult); j++) {
c0a3873b9938bf Seven Lee 2024-03-27  414  			mclk = nau8325->mclk << mclk_n3_mult[j].param;
c0a3873b9938bf Seven Lee 2024-03-27  415  			mclk = mclk / mclk_n1_div[i].param;
c0a3873b9938bf Seven Lee 2024-03-27  416  			ratio = nau8325_clksrc_n2(nau8325,
c0a3873b9938bf Seven Lee 2024-03-27  417  						  *srate_table, mclk, n2_sel);
c0a3873b9938bf Seven Lee 2024-03-27  418  			if (ratio != NAU8325_MCLK_FS_RATIO_NUM &&
c0a3873b9938bf Seven Lee 2024-03-27  419  			    (mclk_max < mclk || i > *n1_sel)) {
c0a3873b9938bf Seven Lee 2024-03-27  420  				mclk_max = mclk;
c0a3873b9938bf Seven Lee 2024-03-27  421  				n2_max = *n2_sel;
c0a3873b9938bf Seven Lee 2024-03-27  422  				*n1_sel = i;
c0a3873b9938bf Seven Lee 2024-03-27  423  				*mult_sel = j;
c0a3873b9938bf Seven Lee 2024-03-27  424  				ratio_sel = ratio;
c0a3873b9938bf Seven Lee 2024-03-27 @425  					goto proc_done;
c0a3873b9938bf Seven Lee 2024-03-27  426  			}
c0a3873b9938bf Seven Lee 2024-03-27  427  		}
c0a3873b9938bf Seven Lee 2024-03-27  428  	}
c0a3873b9938bf Seven Lee 2024-03-27  429  	if (mclk_max) {
c0a3873b9938bf Seven Lee 2024-03-27  430  		*n2_sel = n2_max;
c0a3873b9938bf Seven Lee 2024-03-27  431  		ratio = ratio_sel;
c0a3873b9938bf Seven Lee 2024-03-27  432  		goto proc_done;
c0a3873b9938bf Seven Lee 2024-03-27  433  	}
c0a3873b9938bf Seven Lee 2024-03-27  434  
c0a3873b9938bf Seven Lee 2024-03-27  435  proc_err:
c0a3873b9938bf Seven Lee 2024-03-27  436  	dev_dbg(nau8325->dev, "The MCLK %d is invalid. It can't get MCLK_SRC of 256/400/500 FS (%d)",
c0a3873b9938bf Seven Lee 2024-03-27  437  		nau8325->mclk, nau8325->fs);
c0a3873b9938bf Seven Lee 2024-03-27  438  	return -EINVAL;
c0a3873b9938bf Seven Lee 2024-03-27  439  proc_done:
c0a3873b9938bf Seven Lee 2024-03-27  440  	dev_dbg(nau8325->dev, "nau8325->fs=%d,range=0x%x, %s, (n1,mu,n2,dmu):(%d,%d,%d), MCLK_SRC=%uHz (%d)",
c0a3873b9938bf Seven Lee 2024-03-27  441  		nau8325->fs, (*srate_table)->range,
c0a3873b9938bf Seven Lee 2024-03-27  442  		(*srate_table)->max ? "MAX" : "MIN",
c0a3873b9938bf Seven Lee 2024-03-27  443  		*n1_sel == CLK_PROC_BYPASS ?
c0a3873b9938bf Seven Lee 2024-03-27  444  		CLK_PROC_BYPASS : mclk_n1_div[*n1_sel].param,
c0a3873b9938bf Seven Lee 2024-03-27  445  		*mult_sel == CLK_PROC_BYPASS ?
c0a3873b9938bf Seven Lee 2024-03-27  446  		CLK_PROC_BYPASS : 1 << mclk_n3_mult[*mult_sel].param,
c0a3873b9938bf Seven Lee 2024-03-27  447  		1 << mclk_n2_div[*n2_sel].param,
c0a3873b9938bf Seven Lee 2024-03-27  448  		(*srate_table)->mclk_src[ratio],
c0a3873b9938bf Seven Lee 2024-03-27  449  		(*srate_table)->mclk_src[ratio] / nau8325->fs);
c0a3873b9938bf Seven Lee 2024-03-27  450  
c0a3873b9938bf Seven Lee 2024-03-27  451  	return 0;
c0a3873b9938bf Seven Lee 2024-03-27  452  }
c0a3873b9938bf Seven Lee 2024-03-27  453  

:::::: The code at line 425 was first introduced by commit
:::::: c0a3873b9938bfaa77bd337cad33266a50a6583f ASoC: nau8325: new driver

:::::: TO: Seven Lee <wtli@nuvoton.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
