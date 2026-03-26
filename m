Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C435539C626
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 04:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499049; cv=none; b=GpJIXNB1O6yonBOH8ZkrS9x5p5LAKC1WHnUKcSbfKzkTV7YtVaCw4p3bGyC6qbFL2r9P02PLiQb+wZE7E5pxQsr7KPFvDY8WsouUD7fttV64Eq4eo41uZDmHYdjjY/+UWs43PnP6zxZU4mAih2A/3VST2Un4k3WSws3Co61yvxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499049; c=relaxed/simple;
	bh=7kiTk03O7jHm9bbFbTcMcggIhTL9GIKhhyq+stxFdXE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VoiHVbZDirWDGypaZao67R3l27qnCuV9k6SOhaBejMiaqLurunT4VsQJHzVupLoI1zCzedqph5yl0CeLa2f1h3FKq0gMQ2kDC+AKpVnuq0lgGt4BMtqPAgM3KtByoURpkZUAmS3I2u0nvvEIBD3huYgZDJ5Dlst7nBJCf9eKogs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Or2po0Fl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Or2po0Fl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774499048; x=1806035048;
  h=date:from:to:cc:subject:message-id;
  bh=7kiTk03O7jHm9bbFbTcMcggIhTL9GIKhhyq+stxFdXE=;
  b=Or2po0Fl6dfnosYdYIqyThDnJDGBdktgGHySBKOI6vt5YEQqc2kEl/Tx
   FN9+POlep3+Z/2NWcGu8JFQ/WctxqwW4DUJpe49vnyWphZ7JmjlnZeg0L
   u+SzZ1o2lQ+aMx/hEwOc9CmQ0EG5G83ekgnExr9Hw4TBridWvzmuO23SF
   leIn0AShf6i+abfpd/l6N1oZKyLf+Mv1I75FtzKE2yXI4RUd8r1w1fS8L
   mfKJEY8aFpRPOWuH7anH4stzGgXe5NR8o0VeVbbTEE94nvJ8RDvBv9TGo
   bch+QzGssEy/ydm/SsqibGZpAhBY5YE6BNRIsTWFSgl3PWgYBBbCdhmUx
   Q==;
X-CSE-ConnectionGUID: 4xIz8ItBSM28FTl1I1Q1wQ==
X-CSE-MsgGUID: OH9HWCUqS3yTTs1W/rySEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79404681"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="79404681"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 21:24:04 -0700
X-CSE-ConnectionGUID: ZafZIBx1SXGkm7ozwok1Ug==
X-CSE-MsgGUID: OShqybl/R2KIXGOp0VjSOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="226520807"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Mar 2026 21:24:02 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5cGG-0000000089f-166d;
	Thu, 26 Mar 2026 04:24:00 +0000
Date: Thu, 26 Mar 2026 12:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>
Subject: drivers/edac/ie31200_edac.c:613:19: sparse: sparse: symbol
 'rpl_s_cfg' was not declared. Should it be static?
Message-ID: <202603261217.CJjVkDlZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0138af2472dfdef0d56fc4697416eaa0ff2589bd
commit: d0742284ec6da1435acdda428088136944c4c3c2 EDAC/ie31200: Add Intel Raptor Lake-S SoCs support
date:   1 year ago
config: i386-randconfig-062-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261217.CJjVkDlZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261217.CJjVkDlZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261217.CJjVkDlZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/edac/ie31200_edac.c:613:19: sparse: sparse: symbol 'rpl_s_cfg' was not declared. Should it be static?

vim +/rpl_s_cfg +613 drivers/edac/ie31200_edac.c

   612	
 > 613	struct res_config rpl_s_cfg = {
   614		.mtype				= MEM_DDR5,
   615		.imc_num			= 2,
   616		.reg_mchbar_mask		= GENMASK_ULL(41, 17),
   617		.reg_mchbar_window_size		= BIT_ULL(16),
   618		.reg_eccerrlog_offset[0]	= 0xe048,
   619		.reg_eccerrlog_offset[1]	= 0xe848,
   620		.reg_eccerrlog_ce_mask		= BIT_ULL(0),
   621		.reg_eccerrlog_ce_ovfl_mask	= BIT_ULL(1),
   622		.reg_eccerrlog_ue_mask		= BIT_ULL(2),
   623		.reg_eccerrlog_ue_ovfl_mask	= BIT_ULL(3),
   624		.reg_eccerrlog_rank_mask	= GENMASK_ULL(28, 27),
   625		.reg_eccerrlog_syndrome_mask	= GENMASK_ULL(23, 16),
   626		.msr_clear_eccerrlog_offset	= 0x791,
   627		.reg_mad_dimm_offset[0]		= 0xd80c,
   628		.reg_mad_dimm_offset[1]		= 0xd810,
   629		.reg_mad_dimm_size_granularity	= BIT_ULL(29),
   630		.reg_mad_dimm_size_mask[0]	= GENMASK(6, 0),
   631		.reg_mad_dimm_size_mask[1]	= GENMASK(22, 16),
   632		.reg_mad_dimm_rank_mask[0]	= GENMASK(10, 9),
   633		.reg_mad_dimm_rank_mask[1]	= GENMASK(27, 26),
   634		.reg_mad_dimm_width_mask[0]	= GENMASK(8, 7),
   635		.reg_mad_dimm_width_mask[1]	= GENMASK(25, 24),
   636	};
   637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
