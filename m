Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CFD37A4AE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771952432; cv=none; b=a0IGf16rV+ZyVOPxQ+bXOKcniPxdFPQsPa1XtqD6XZRJoy/0BXwJotMr9lHCv7e29XGaGlhV/6zk/jYkZuRRKvyIMgqF/DwXm0YyXcVyMjIhpjBIgANu/ffCw7QwbegOjFrU1dmO+02ZKPADNLHtUwgcecXNZOEbaPT3DqnQWkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771952432; c=relaxed/simple;
	bh=BUNfFJZOyCARh+ESBm0ianxSJMqD+l9e2ybd+zGbVoM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YZe7PwPSz1U9a0Cej/NY/mjko/LziQ6uyPZtE6fHofkpPt6FNyAf2/152XlqjJwWNv4nAphUEzOu69zJEk8g8y/kWzMVnGooa9wDMoyil10ZQP0SmPL4JJ/JIcbQL+D/baukPf3Q9gP827L1NPsU5kW/37pZTVUn/pXZkjjiLy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7x0wbUE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7x0wbUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771952431; x=1803488431;
  h=date:from:to:cc:subject:message-id;
  bh=BUNfFJZOyCARh+ESBm0ianxSJMqD+l9e2ybd+zGbVoM=;
  b=G7x0wbUEoI0xH+hSiiumjtEsOegYdUOWaupreMiceKgZ5WdvYPavn0w9
   ZvwHNZPLr+Hz5b+O6lEEMZ82IHq3nDIOg9kyrXRu9G4Q/FKmOhEWDOQZF
   SBCB1HkNqHtNB32nWKBn1Ag3mNPmkj9rncxCoZ/hH6m5C6iwjkWNG7SIm
   fbO7Y83TQolnSSYFjkU49Z7W6pZ+/U81xmhVH16fLoY05pvUgjekQL+C8
   AgI1WdPcgHMl3DmWDW8gNLtrLHkN3nCuPr2fkVsPaHtcM6O492+y1SPDQ
   cZnAkynrvp0Rx83m9UB7K/2qFpchId/fH/SPK4GwU5ZP1TpoF1+FO+UCE
   A==;
X-CSE-ConnectionGUID: fn72kDv+RCak2pp74O8Gvg==
X-CSE-MsgGUID: PkXYLz29Q3yNWdbYKGBs8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72184540"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="72184540"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 09:00:30 -0800
X-CSE-ConnectionGUID: nbZ21dGrRaGVKQQCUeqxaA==
X-CSE-MsgGUID: /GOxmOy4RG6tpKph/yAKng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="215970392"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Feb 2026 09:00:28 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuvlq-000000002FZ-1DB4;
	Tue, 24 Feb 2026 17:00:26 +0000
Date: Wed, 25 Feb 2026 00:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: GyoungBo Min <mingyoungbo@coasia.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyunghwan Kim <kenkim@coasia.com>, Ravi Patel <ravi.patel@samsung.com>
Subject: [krzk:next/clk 2/3] drivers/clk/samsung/clk-pll.c:1488:1-7:
 WARNING: do_div() does a 64-by-32 division, please consider using div64_u64
 instead.
Message-ID: <202602250053.wEU1hlpY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/clk
head:   85cc5be65b82481d9eb14afb6a6d52d5bde36cb0
commit: f051dc5bc8e785b221d2e69094e774507c3a52dd [2/3] clk: samsung: Add clock PLL support for ARTPEC-9 SoC
config: riscv-randconfig-r054-20260224 (https://download.01.org/0day-ci/archive/20260225/202602250053.wEU1hlpY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250053.wEU1hlpY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/samsung/clk-pll.c:1488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

vim +1488 drivers/clk/samsung/clk-pll.c

  1469	
  1470	static unsigned long samsung_a9fraco_recalc_rate(struct clk_hw *hw,
  1471							 unsigned long parent_rate)
  1472	{
  1473		struct samsung_clk_pll *pll = to_clk_pll(hw);
  1474		u32 pll_con0, pll_con5;
  1475		u64 mdiv, pdiv, sdiv, kdiv;
  1476		u64 fvco = parent_rate;
  1477	
  1478		pll_con0 = readl_relaxed(pll->con_reg);
  1479		pll_con5 = readl_relaxed(pll->con_reg + PLLA9FRACO_PLL_CON5_DIV_FRAC);
  1480		mdiv = (pll_con0 >> PLLA9FRACO_MDIV_SHIFT) & PLLA9FRACO_MDIV_MASK;
  1481		pdiv = (pll_con0 >> PLLA9FRACO_PDIV_SHIFT) & PLLA9FRACO_PDIV_MASK;
  1482		sdiv = (pll_con0 >> PLLA9FRACO_SDIV_SHIFT) & PLLA9FRACO_SDIV_MASK;
  1483		kdiv = (pll_con5 & PLLA9FRACO_KDIV_MASK);
  1484	
  1485		/* fvco = fref * (M + K/2^24) / p * (S+1) */
  1486		fvco *= mdiv;
  1487		fvco = (fvco << 24) + kdiv;
> 1488		do_div(fvco, ((pdiv * (sdiv + 1)) << 24));
  1489	
  1490		return (unsigned long)fvco;
  1491	}
  1492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
