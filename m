Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EF64A33EA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 17:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778003248; cv=none; b=afhBCZjf3lB3AjIkHR886fXPD7UI+nWx88lve0DeNb+r/yaY2vdCJckBTSduVEkNQs/LbtpCyy0loDQZXPhFuS3OIauyaxcMJ5ISWvD+zIrzI21StluXe6zCWQWrNfD7fHp6IZPU0u3HEy9FPjjyN55o3FGdrlR5rCqxdHvTub4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778003248; c=relaxed/simple;
	bh=uoeZV2NaZFqFjdZzzfB48uY1hhe3C1CgeehOsPw0fWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O6+jj1FSRXiIE4TAx25+CDR1P/4WHxQYWBWZM6rwmMTcfQ0nR+ZRhuQkAVM4pohP6k9Vf+4Zd2ycMn5QDr7LTd8h7Dxt6PUNFU9W2mfDIRAw3QKm4Two9u+3GpbsmXZ9cbEhQT+71qC9WafPy1wYG3HZTd/+U+JFaNmBt1ypRSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtESdop1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtESdop1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778003238; x=1809539238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uoeZV2NaZFqFjdZzzfB48uY1hhe3C1CgeehOsPw0fWU=;
  b=KtESdop1vuq4dxnGB62zG0eMv+6iVmKdb1uWzwIleYD+TeqGEqWsB2+P
   /FeT/PBB4vEAZfMHngqCr0ktvYpt1HT5rGG1EpEWvV9gNYPiX+TNhKsB/
   H2pZi+SKO6I+WKLITkxeWb2BiGev3gVee4Cl0pLr5b/1fglDMdktRIgCL
   r2gvY2L4VZp7Y9AmpLZ2HCYjwaUFofJjX+523YraUWvdStNoW2IDYzIkc
   qbkczJszPnRmQK56Cs8MJMh00Kum8zTeodpuHFlfQq7MARj6PSdOVvEeQ
   HTeJh1RSgoLfwZwHIN2TgrAbVYFJ5fMfOmcES1etAK3qNdY1Y0C7u2Bsv
   A==;
X-CSE-ConnectionGUID: vXD0zIIWReKKDzlT/IGGXQ==
X-CSE-MsgGUID: 6AfnilpnSfSwq4cvVCvhmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90258791"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="90258791"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 10:47:17 -0700
X-CSE-ConnectionGUID: jZWd1YTFT/iF1g5xbY4uHg==
X-CSE-MsgGUID: WyAkThwsQuK2mwd/yVkm2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="259552266"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 May 2026 10:47:15 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKJrV-000000000Kf-1itY;
	Tue, 05 May 2026 17:47:13 +0000
Date: Wed, 06 May 2026 01:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Duje =?utf-8?Q?Mihanovi=C4=87"?= <duje@dujemihanovic.xyz>
Cc: oe-kbuild-all@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>
Subject: [linux-next:master 1590/2999]
 drivers/clk/mmp/clk-pxa1908-apbcp.c:64:2-3: Unneeded semicolon
Message-ID: <202605060103.276IjHGW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
commit: 8267609a380f3f0f47c1e0d13440cb87b3a65d6e [1590/2999] clk: mmp: pxa1908-apbcp: Add reset cells
config: arm64-randconfig-r061-20260505 (https://download.01.org/0day-ci/archive/20260506/202605060103.276IjHGW-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060103.276IjHGW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/mmp/clk-pxa1908-apbcp.c:64:2-3: Unneeded semicolon

vim +64 drivers/clk/mmp/clk-pxa1908-apbcp.c

    46	
    47	/* Taken from clk-of-pxa1928.c */
    48	static void pxa1908_clk_reset_init(struct device_node *np,
    49					   struct pxa1908_clk_unit *pxa_unit)
    50	{
    51		struct mmp_clk_reset_cell *cells;
    52		int nr_cells = ARRAY_SIZE(apbcp_gate_clks);
    53	
    54		cells = kzalloc_objs(*cells, nr_cells);
    55		if (!cells)
    56			return;
    57	
    58		for (int i = 0; i < nr_cells; i++) {
    59			cells[i].clk_id = apbcp_gate_clks[i].id;
    60			cells[i].reg = pxa_unit->base + apbcp_gate_clks[i].offset;
    61			cells[i].bits = BIT(2);
    62			cells[i].flags = 0;
    63			cells[i].lock = apbcp_gate_clks[i].lock;
  > 64		};
    65	
    66		mmp_clk_reset_register(np, cells, nr_cells);
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
