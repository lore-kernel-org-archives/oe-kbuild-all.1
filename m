Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98447534441
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 13:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170698; cv=none; b=MqENAFVFmLWFKRR2NXvgP+YWFbJFPa0PUb3dMO9VWwwfbYbglkLM4IvYgQTDtfs59lqr7Py8CBwM0C9+ST61k+eGXyNiEdUDExHX6c/JFbfznjdO/4cmJ6ivl5hKF10xQeonygCFVq4Z6is1h7/BWdkns6M8wOA5fQvksy44Log=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170698; c=relaxed/simple;
	bh=Z44TsJX2wtU0pyNmMuDkqNVJLk+zcow1UZEinuJLDrc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l6kKCe99IwsVUqOxegLCB68eyHrBoRfjy69diFbDlNYwKXN+eekICuDNNcWOS6C2BoJZkr15XYROyA6cBsrXFzcIB0QjHhccTsjU8PvWKNyPgYbX2RuznKk1W+JHVb1rxRBuxy9QBqYoTtqooxzphyFuY5RhPOkbnvNOLPpUZfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8+z8rkr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8+z8rkr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790170697; x=1821706697;
  h=date:from:to:cc:subject:message-id;
  bh=Z44TsJX2wtU0pyNmMuDkqNVJLk+zcow1UZEinuJLDrc=;
  b=n8+z8rkrwBVZOrSF+DNhs+xAITQ9DWNxHmLLWyLS0jVwtV2wJkzCxMBe
   hI6R8yrReH5doPrGWAJGLBAJqa3groElIGfWTSzZfe/PA4eNWM/n9xaSC
   vldw7hFV8gvTxLqTPPyo2NPhmWGD9fMkxUeIMnwll0S7eiyTuYF6ja1Ce
   1O6a7xs/bv9LEQahrEaRSbx0uiRe+17wB9H2ftBCYeKsRLTghXEwWpE3B
   Iur4yn2V5tEJR/lg2YgshibmeHBYKYcwZWCjA5hnbfBl2TFkjgaV9WIQl
   GSUra3FjYJGyfhX/wIQc+Ln6cfygweS0Qr0GmNpNB3B2I9KvbBlPlDoKk
   Q==;
X-CSE-ConnectionGUID: YOiBVvMQQCaRsNM01vQWvg==
X-CSE-MsgGUID: 74ZvBoFVSAGSPMAHmrc/Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="116388943"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="116388943"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 06:38:16 -0700
X-CSE-ConnectionGUID: uE2cOXzNQwqPlvgr++m8xQ==
X-CSE-MsgGUID: 6CyApfH2T/GJRzdf7ZFvTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="301545285"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2026 06:38:14 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9NAp-000000000hH-3DFE;
	Wed, 23 Sep 2026 13:38:11 +0000
Date: Wed, 23 Sep 2026 15:37:58 +0200
From: kernel test robot <lkp@intel.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c:86:37: warning:
 'pll_cpu_0_hws' defined but not used
Message-ID: <202609231512.gGlMwwXn-lkp@intel.com>
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
config: xtensa-randconfig-2000-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231512.gGlMwwXn-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231512.gGlMwwXn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231512.gGlMwwXn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c:86:37: warning: 'pll_cpu_0_hws' defined but not used [-Wunused-const-variable=]
      86 | static const struct clk_parent_data pll_cpu_0_hws[] = {
         |                                     ^~~~~~~~~~~~~


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
