Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC632846A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 03:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783827963; cv=none; b=ZHJr7d63pPQM501hHjDRAeWB+9RZ3dJhQ79PdJSyG5k60BB0+sEOOnsrscJXt5l+VId9G/ftof28AHeY43KqV68Wt6CTokdtA1eCegNfsvv3eb/PqKRrEnANV2KzXSM3jz1N94mBifxQOjr7GzvmSKhRsHe9kJASyidNPCPukoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783827963; c=relaxed/simple;
	bh=DBjVPRTfH9vsgEux8rpjNietZTJYDVTgbM2ES39txu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DNySbaFXE9TqEI8emQsVQ5mF1z2PdlYsywdh4L6jurpbQdUf2AIne/kIIozs9XvIxcwMWXkrMoAVGrFuEu3IF2nuhZ3FsPhbIqE8FSRdM3rmGE1vi3F6DaC/HwxrkVWX/r6+PtVExjZ7YbpH1iOV58ybwovjxFZuIFYBysgOF/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4EeAn3b; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4EeAn3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783827962; x=1815363962;
  h=date:from:to:cc:subject:message-id;
  bh=DBjVPRTfH9vsgEux8rpjNietZTJYDVTgbM2ES39txu4=;
  b=K4EeAn3bkQPK7peQgNaahVDqtyPZQAjVbjnN9IgJ2fP6u/4U34gvhAWD
   F6TNSE93n1d4Wb1jZ5mnl4V86VWMcl6SUP40zYNOzF0rL+xEUzuxEggVw
   +keu4rjRob6OKozD1gexrk8SNWl4A08ZMrtnpmA4KMLfKorpw75K4zDIx
   mpxiES3GhWiErtJeNwukM2LfpiWHUZjZ0wOc4tJC+qR8fAc5hBV34WiUF
   jVyxkMaEsfWq8fFxVtJVHebsmWP1MVgF2pVKkENYTFxPzq4DOGm+rDfnz
   84nby9xjyrmQSgiqCq6PC3yNGE7BTC0+PHFDJQBeWhswhWJIp9NZX//27
   w==;
X-CSE-ConnectionGUID: g5EFC/FtSnC+48KEH69o1A==
X-CSE-MsgGUID: X1jCGSrLQaSZJ8VclE3fQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88387385"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88387385"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 20:45:54 -0700
X-CSE-ConnectionGUID: GHnSinbSSCOhJPVPJpoQLg==
X-CSE-MsgGUID: 1TczqmOUQlKUzAyc9sVQ4A==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jul 2026 20:45:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wil8U-00000000KeX-1TUu;
	Sun, 12 Jul 2026 03:45:47 +0000
Date: Sun, 12 Jul 2026 11:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: drivers/reset/reset-k230.c:221:24-29: WARNING: conversion to
 bool not needed here
Message-ID: <202607121116.XW2ODxe6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Junhui,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd3210c47e8d3ac6b4e9141fc68acc03b38c0ba3
commit: c7a5e01e229d21e0560d78bd645b4f7398667ce4 reset: canaan: k230: drop OF dependency and enable by default
date:   6 months ago
config: hexagon-randconfig-r051-20260709 (https://download.01.org/0day-ci/archive/20260712/202607121116.XW2ODxe6-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c279890c85da307abe34f10333442bbf72a60644)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c7a5e01e229d ("reset: canaan: k230: drop OF dependency and enable by default")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607121116.XW2ODxe6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/reset/reset-k230.c:221:24-29: WARNING: conversion to bool not needed here
   drivers/reset/reset-k230.c:252:24-29: WARNING: conversion to bool not needed here

vim +221 drivers/reset/reset-k230.c

360a7a64775944 Junhui Liu 2025-06-13  210  
360a7a64775944 Junhui Liu 2025-06-13  211  static int k230_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
360a7a64775944 Junhui Liu 2025-06-13  212  {
360a7a64775944 Junhui Liu 2025-06-13  213  	struct k230_rst *rstc = to_k230_rst(rcdev);
360a7a64775944 Junhui Liu 2025-06-13  214  
360a7a64775944 Junhui Liu 2025-06-13  215  	switch (k230_resets[id].type) {
360a7a64775944 Junhui Liu 2025-06-13  216  	case RST_TYPE_CPU1:
360a7a64775944 Junhui Liu 2025-06-13  217  		k230_rst_update(rstc, id, true, true, false);
360a7a64775944 Junhui Liu 2025-06-13  218  		break;
360a7a64775944 Junhui Liu 2025-06-13  219  	case RST_TYPE_SW_DONE:
360a7a64775944 Junhui Liu 2025-06-13  220  		k230_rst_update(rstc, id, true, false,
360a7a64775944 Junhui Liu 2025-06-13 @221  				id == RST_SPI2AXI ? false : true);
360a7a64775944 Junhui Liu 2025-06-13  222  		break;
360a7a64775944 Junhui Liu 2025-06-13  223  	case RST_TYPE_CPU0:
360a7a64775944 Junhui Liu 2025-06-13  224  	case RST_TYPE_FLUSH:
360a7a64775944 Junhui Liu 2025-06-13  225  	case RST_TYPE_HW_DONE:
360a7a64775944 Junhui Liu 2025-06-13  226  		return -EOPNOTSUPP;
360a7a64775944 Junhui Liu 2025-06-13  227  	}
360a7a64775944 Junhui Liu 2025-06-13  228  
360a7a64775944 Junhui Liu 2025-06-13  229  	/*
360a7a64775944 Junhui Liu 2025-06-13  230  	 * The time period when reset is applied but the clock is stopped for
360a7a64775944 Junhui Liu 2025-06-13  231  	 * RST_TYPE_CPU1 and RST_TYPE_SW_DONE can be set up to 3.75us. Delay
360a7a64775944 Junhui Liu 2025-06-13  232  	 * 10us to ensure proper reset timing.
360a7a64775944 Junhui Liu 2025-06-13  233  	 */
360a7a64775944 Junhui Liu 2025-06-13  234  	udelay(10);
360a7a64775944 Junhui Liu 2025-06-13  235  
360a7a64775944 Junhui Liu 2025-06-13  236  	return 0;
360a7a64775944 Junhui Liu 2025-06-13  237  }
360a7a64775944 Junhui Liu 2025-06-13  238  

:::::: The code at line 221 was first introduced by commit
:::::: 360a7a64775944e3a784cb2e3cffb15af5f328e5 reset: canaan: add reset driver for Kendryte K230

:::::: TO: Junhui Liu <junhui.liu@pigmoral.tech>
:::::: CC: Philipp Zabel <p.zabel@pengutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
