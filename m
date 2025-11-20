Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4344D12FF69
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629310; cv=none; b=Pw/RDUpfGx1StjcErsLiYcmKQEOWLkbg2/sP85Lyq1/VXn91w9ShDmvQd3ULbTRkoEt1XkF5jPpf7ngj4tP3BKtENjwcmgyUxcw1AyMXDUGpYAMLqNh6/gtyKXzfQVDz0TlcaU0W1M6uN2sJpsJY/FNvt5NxxQFvAs5a82qzaOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629310; c=relaxed/simple;
	bh=M2js6GQtY262e60rxzmHzngcSMalZFth8KyxvDnhoyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=urRmGPGEaPnB3eFDbY0rfTNo/hMR00mLkxn8UPgsR/rOz4CKX0ylFdwZefRabxEOnK7CdfS5jsRoTYscmEUs9HqcpZ3XrLyiCjyMJSGeAAX8KOa11H3wn98s22mvjDC/vDUQ3qMU5QAl/IhfutVYShqQufFhhWRelCrmHpe/60k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gUjKYU5O; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUjKYU5O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763629308; x=1795165308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M2js6GQtY262e60rxzmHzngcSMalZFth8KyxvDnhoyM=;
  b=gUjKYU5O1FQ+g7d7DbJvW2TmmsqRpyD7lREDxuD5o0PIOafsdFZ58Vtz
   sIi+BV4lX9fMAokB9VDTNUWELz7zppU197v/Yfza4S2hv2sm7FZ2htNzh
   fqK9fjhXwKFc6qhBK5Q+/gxBnat18oXljq3F/sjGxoVd+zAyHKOCmr5aS
   wr+9+UfmgzCbC8d8uU7c/L93tdbMXjVLCQeiyqFqJBO5AdrW5stloR/3E
   yhKaTR4oANaqzLE+39MgshyElFa6/uUvKVx9TTH26xonAelAEGSPlzBg2
   fHZGlrOePX8NlquOkOg+l1PBdzuaOg5EuinkLzZt8Ofc3yNxTn1T/qTdw
   g==;
X-CSE-ConnectionGUID: fnq2gCZ5SlKuSKhMeTokZQ==
X-CSE-MsgGUID: YhOFflL/TseoSAFZ7Q+EBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65630789"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="65630789"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 01:01:48 -0800
X-CSE-ConnectionGUID: z+1esKAdSf6ftzP4V0asMA==
X-CSE-MsgGUID: 1CqmMh9cQLaH0I8PAD1IBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="191570126"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2025 01:01:46 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM0Xw-0003nV-0U;
	Thu, 20 Nov 2025 09:01:44 +0000
Date: Thu, 20 Nov 2025 17:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: GyoungBo Min <mingyoungbo@coasia.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	Kyunghwan Kim <kenkim@coasia.com>,
	Ravi Patel <ravi.patel@samsung.com>
Subject: [krzk:next/clk 9/10] drivers/clk/samsung/clk-pll.c:1488:1-7:
 WARNING: do_div() does a 64-by-32 division, please consider using div64_u64
 instead.
Message-ID: <202511201607.N3OYcSYl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/clk
head:   66a62a2358c8a91dbd88e18d6d0f8d35c7b2d220
commit: 234db9f34c4c82f54c94326e92bdfd6304f4a2a4 [9/10] clk: samsung: Add clock PLL support for ARTPEC-9 SoC
config: nios2-randconfig-r054-20251120 (https://download.01.org/0day-ci/archive/20251120/202511201607.N3OYcSYl-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201607.N3OYcSYl-lkp@intel.com/

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
