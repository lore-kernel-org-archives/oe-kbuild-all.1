Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ABB3E8357
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 17:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184553; cv=none; b=ef/jHfmoqlb3zfhlYbNAd47pJL0Z13/j2aCPvLYmb7DEuzpT5C0zNl5/Nokh2yK2gGtR+JV3jinmpQVEhDNML7yp5CDP+lh+aABwVG7AG0AdSlToHtWi7JAmcpngDpXgX5lLUFEwnzan/DTEA8pvxRNMV76VDlYR6K74CjT+lg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184553; c=relaxed/simple;
	bh=TKUgE0Jiqn8py+gNtfdxXh+MUW5uclGquOb+Tr/VOtA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aZ8KDwcG0pDGADqkFjjHkXxeaJTH4bxcAjsVw9DnuZf/AclsCgfBkOH22BmPtftAMlyQcaqIim0zk09ETk2xbdOkyAIEbmZPzMZ8RmoMr1AI54Z4qJI/otaxlV+zrAjRVxEtWMmK3Tcxw9+B+xuT+ZzcXy65wmiJ8y7UxtMfJE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BU2Ka3/N; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BU2Ka3/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790184552; x=1821720552;
  h=date:from:to:cc:subject:message-id;
  bh=TKUgE0Jiqn8py+gNtfdxXh+MUW5uclGquOb+Tr/VOtA=;
  b=BU2Ka3/N6klyv7ELCSSwfu08xoA4W7QrtFhtuBjZ+0s6bOYUzHQQP8i4
   zzkN61CB1WXv4MMGNF0/+/evYaDbwjuU0JgjtKbw/9n4UFE7ykTQH704V
   5amUhteM6/YgyvLNPIaSNLFRUhjyVuXNDSIniiDxkngHRK6AhjfkPctJX
   t+VBxH5CGowKMkIJEw/Pj9YeK3iEEeIU98OibVoX8kPmx8ZgdzWc28Yy/
   aGezR1zzzkDzuYrhU9poO6pY1/jELqqsHo+MwhaqqwyC6tWLamuamwfCV
   yW8BnI2WkPrv3hGv+e02trJKtfqkwrAof/mTYU4d3VA0VpOI+umG9ejee
   Q==;
X-CSE-ConnectionGUID: TN4bURHBRqydI2uYXXktsw==
X-CSE-MsgGUID: 7fC3frs+SgGY2J5UtGFLpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90774378"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="90774378"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 10:29:11 -0700
X-CSE-ConnectionGUID: k70LbYo3R+OjXeXxpzd6Pw==
X-CSE-MsgGUID: bdGt17PNRFCGOFJqc0nDJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="281790161"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2026 10:29:09 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9QmI-000000000lH-2ntx;
	Wed, 23 Sep 2026 17:29:06 +0000
Date: Wed, 23 Sep 2026 19:28:18 +0200
From: kernel test robot <lkp@intel.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c:86:37: warning:
 unused variable 'pll_cpu_0_hws'
Message-ID: <202609231933.dOvgjuKo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andre-Przywara/clk-sunxi-ng-generalise-update-bit/20260918-003909
head:   ba8232e01e566f29f719c4672ce4d39a320f9b4c
commit: d61ade3a07f9b9d78ede819b93c7a7588472e38b clk: sunxi-ng: add support for the A523/T527 CPU CCU
date:   6 days ago
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260923/202609231933.dOvgjuKo-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231933.dOvgjuKo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231933.dOvgjuKo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c:86:37: warning: unused variable 'pll_cpu_0_hws' [-Wunused-const-variable]
      86 | static const struct clk_parent_data pll_cpu_0_hws[] = {
         |                                     ^~~~~~~~~~~~~
   1 warning generated.


vim +/pll_cpu_0_hws +86 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c

    74	
    75	static struct ccu_mult pll_cpu_0_clk = {
    76		.enable	= BIT(27),
    77		.lock	= BIT(28),
    78		.mult	= _SUNXI_CCU_MULT(8, 8),
    79		.common	= {
    80			.reg		= 0x00,
    81			.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-cpu-0", osc24M,
    82								   &ccu_mult_ops,
    83								   CLK_SET_RATE_UNGATE),
    84		},
    85	};
  > 86	static const struct clk_parent_data pll_cpu_0_hws[] = {
    87		{ .hw = &pll_cpu_0_clk.common.hw },
    88	};
    89	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
