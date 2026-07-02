Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BA434B1B4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 03:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782964637; cv=none; b=VkNur+gResEaEO9/Hlp6w/FyJscdd2WbIQwde0yX+HaMDve113T8IslVDj4o6UvGutmz7AdOSIMW6jVHZkmwmo/vtknvNkHXSKQOtpLPfS6nP4TDBqpQZiFkFUGo9pszxfeyrT0vvzQrtCPtuwRJZ1QVh19Z3QGOrGo4EXli7W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782964637; c=relaxed/simple;
	bh=sEnTRZzyDnMvVr1N5rMhcgsKL74S53lQXzBFKSnh8wA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=myxh90gURqj/1iZUoKHx+UyJJzgBJoyoYFWu8QdKg5RnjuphGI6Ymx+Co7eYczcXh+MM8RcGS7YyeHc1H8IT7qkTCdiHxSpWja6+gSIx1PLUK1o8Yrfm5Vo7aBRuBYVJ/dJ7GKgBxHzDI2wbKjFB74mxikVuXfq5/WQvZ4LZITY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1y3zdZH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1y3zdZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782964635; x=1814500635;
  h=date:from:to:cc:subject:message-id;
  bh=sEnTRZzyDnMvVr1N5rMhcgsKL74S53lQXzBFKSnh8wA=;
  b=D1y3zdZH92fEe/zxeFIOqRa8aY2Qx7xBBi5xEYqIo1P3udtL9BC6SZdl
   IIoXgXY2K9tf2EhRv9Q7RM1FSK/R1NRKM/g7sHcuNE8jW1pIxQEHh2avI
   ODZN76DJH1KfLODOb7V4BZx+oMxInub6L4TMgDH5KdKBAktNN6fiQ8hFa
   cLzq/boYUQdIBbQu7hTBAgECJOQhzO1vgARLUykxFo0xs9VW+mczl245e
   s+YTRLZ/0hVE0tmcHZLXwdxuSwfLdj0/5MkM6RrpgmYEKI6evXzQV1GTf
   Gn7pVt2+rg2SKV0FPTvT//+y3B2IpccSsaQHfcbJIqnso4S963pEiHuUA
   w==;
X-CSE-ConnectionGUID: Mu23Vy9CSUqD8vFpyqhxQA==
X-CSE-MsgGUID: 5rpa5JKcSNqYEBtPLDu9Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83578064"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83578064"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 20:57:14 -0700
X-CSE-ConnectionGUID: FTwIQHCAT1+BhEbm0bXkpw==
X-CSE-MsgGUID: 98quAn3uTom+kYJtsZmjxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251697958"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2026 20:57:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf8Y1-000000009xd-3rwH;
	Thu, 02 Jul 2026 03:57:09 +0000
Date: Thu, 02 Jul 2026 11:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:asoc-7.3 56/63] sound/soc/codecs/es8389.c:109
 find_best_hpf_freq() warn: unsigned 'target_hz' is never less than zero.
Message-ID: <202607021153.zU3zkE2I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-7.3
head:   fb5d1b1c5f8a920ee697545fa6dee16825085717
commit: 87592da1a490abd2adeb57a49fb200d058403cc5 [56/63] ASoC: codecs: ES8389: Add private members about HPF
config: m68k-randconfig-r072-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021153.zU3zkE2I-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021153.zU3zkE2I-lkp@intel.com/

smatch warnings:
sound/soc/codecs/es8389.c:109 find_best_hpf_freq() warn: unsigned 'target_hz' is never less than zero.

vim +/target_hz +109 sound/soc/codecs/es8389.c

   101	
   102	static bool find_best_hpf_freq(u32 target_hz, u8 *hpf1, u8 *hpf2, u32 *out)
   103	{
   104		int best_row = -1, best_col = -1;
   105		u32 min_diff = U32_MAX;
   106		u32 f, diff;
   107		int i, j;
   108	
 > 109		if ((target_hz > 1020) | (target_hz < 0))
   110			return false;
   111	
   112		for (i = 0; i < 10; i++) {
   113			for (j = i; j < 10; j++) {
   114				f = hpf_table[i][j];
   115	
   116				diff = (target_hz > f) ? (target_hz - f) : (f - target_hz);
   117				if (diff < min_diff) {
   118					min_diff = diff;
   119					best_row = i;
   120					best_col = j;
   121					*out = f;
   122				}
   123			}
   124		}
   125	
   126		*hpf1 = best_col + ES8389_HPF_OFFSET;
   127		*hpf2 = best_row + ES8389_HPF_OFFSET;
   128	
   129		return true;
   130	}
   131	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
