Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9029D21773D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 01:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778376609; cv=none; b=WPGhYGTBUpfq+UJAugdQNW6ldHzUkXxaDQ5NuyPoi3kMeqBIfEH8V+B4qL7dX8cwbG/2c563kvdyYZdZmTcYvtnZ4hIvEdlc2fzxz0EaidIDurZevAUqk9rAFnS91EabBZJ51w2Z6z+Zmgb11WqkNeZPFJCwC9svqHX0MpbNDyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778376609; c=relaxed/simple;
	bh=ieXmuGjRRUnhgDa4Am36q1cwPHLLmrRcJt4t+7OjoqQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I/VXDHmWnN/csF9NwHBJRQ76GUL56Fy3yd7dp3Aic9EzazblOXisnnimk4RkMqM2hOnehyWdlEFzp6pksEXKo+hcOGVatZs9Qz1zIt2XPpkWgz5t1i/JUgGPanJPeP+0CXA66ehV0N+hANFo8q3PSfAqBTLA95a2SleS1rQumUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EI9Qcm5X; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EI9Qcm5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778376608; x=1809912608;
  h=date:from:to:cc:subject:message-id;
  bh=ieXmuGjRRUnhgDa4Am36q1cwPHLLmrRcJt4t+7OjoqQ=;
  b=EI9Qcm5XWHIg4UKTsbRfRvEwoGBrdaMs/QaaCcsIVqFHmnQ7H5EqqZ9y
   9q+cg+0TRQ3RA7sV4HwogTCB/OMCyy57xfyvyySWgFPIcSLlZM57Cf9z0
   ICilTUzVuSw/uXvWmitYQLUOTYnUKI28rlKqH870fUV/vFUGTyldGIsfF
   N4o0rkrnyicoxpeejRv08fZjxVNOloiBFe7T+XW6/TqYOC3Hiu4vf2rHb
   rxN+M9ICZATrE2yWL4qmzhJ1JmlblD/vWeH0Z1teUivBjw07MSAjVFCer
   6sO36yJ/4DiTK6r5Uxxpm2kJqTfLBYoeLQkZCIr4881G9V0UQP0hj/BiN
   w==;
X-CSE-ConnectionGUID: vY2pwoZDQ4WdVfKzUNpK/w==
X-CSE-MsgGUID: ma96JCP2TkCUzfB6Q0W5Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="89896235"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="89896235"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 18:30:07 -0700
X-CSE-ConnectionGUID: 9q6g2RbbRWWhIgRhH6Mezw==
X-CSE-MsgGUID: N96WJCuISGWpkH3j9hUGeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="234050432"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 May 2026 18:30:05 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLszb-000000001cj-1CfZ;
	Sun, 10 May 2026 01:30:03 +0000
Date: Sun, 10 May 2026 09:29:29 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/171-dptxphy 1/1]
 drivers/phy/apple/dptx.c:98 dptx_phy_set_active_lane_count() warn:
 inconsistent indenting
Message-ID: <202605100948.xvUvuQAM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/171-dptxphy
head:   bd8e7fa49e0d5ad013b1089ee5305074823b1382
commit: bd8e7fa49e0d5ad013b1089ee5305074823b1382 [1/1] phy: apple: Add DP TX phy driver
config: um-randconfig-r072-20260509 (https://download.01.org/0day-ci/archive/20260510/202605100948.xvUvuQAM-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100948.xvUvuQAM-lkp@intel.com/

smatch warnings:
drivers/phy/apple/dptx.c:98 dptx_phy_set_active_lane_count() warn: inconsistent indenting
drivers/phy/apple/dptx.c:328 dptx_phy_set_link_rate() warn: inconsistent indenting

vim +98 drivers/phy/apple/dptx.c

    79	
    80	
    81	static int dptx_phy_set_active_lane_count(struct apple_dptx_phy *phy, u32 num_lanes)
    82	{
    83		u32 l, ctrl;
    84	
    85		dev_dbg(phy->dev, "set_active_lane_count(%u)\n", num_lanes);
    86	
    87		if (num_lanes == 3 || num_lanes > DPTX_MAX_LANES)
    88			return -1;
    89	
    90		ctrl = readl(phy->regs.dptx + 0x4000);
    91		writel(ctrl, phy->regs.dptx + 0x4000);
    92	
    93		for (l = 0; l < num_lanes; l++) {
    94			u64 offset = 0x5000 + 0x1000 * l;
    95			readl(phy->regs.dptx + offset);
    96			writel(0x100, phy->regs.dptx + offset);
    97	    }
  > 98	    for (; l < DPTX_MAX_LANES; l++) {
    99	        u64 offset = 0x5000 + 0x1000 * l;
   100		readl(phy->regs.dptx + offset);
   101		writel(0x300, phy->regs.dptx + offset);
   102	    }
   103	    for (l = 0; l < num_lanes; l++) {
   104	        u64 offset = 0x5000 + 0x1000 * l;
   105		readl(phy->regs.dptx + offset);
   106		writel(0x0, phy->regs.dptx + offset);
   107	    }
   108	    for (; l < DPTX_MAX_LANES; l++) {
   109	        u64 offset = 0x5000 + 0x1000 * l;
   110		readl(phy->regs.dptx + offset);
   111		writel(0x300, phy->regs.dptx + offset);
   112	    }
   113	
   114	    if (num_lanes > 0) {
   115		// clear32(phy->regs.dptx + 0x4000, 0x4000000);
   116		ctrl = readl(phy->regs.dptx + 0x4000);
   117		ctrl &= ~0x4000000;
   118		writel(ctrl, phy->regs.dptx + 0x4000);
   119	    }
   120	    phy->active_lanes = num_lanes;
   121	
   122	    return 0;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
