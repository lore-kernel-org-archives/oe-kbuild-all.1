Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C2B3AEF2F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 05:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783316213; cv=none; b=AjqTJ5ISSoM1I+cC0PIJK8T9VYjqUsXsjwYl8UP/sF7ePt89ZELZaPv2hAkCr2TW2tXU7dkZyUAPxk/gQcdNA6bvPPZPY5JtRw6VP181k5SFxQnDx7FKtWycfI3TrQLXlnREpkrc4aDostd7B/MM7uiz0pctwlORO+fZmNimEGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783316213; c=relaxed/simple;
	bh=oBCxcSoU63EQ83IjKhagRccasgwqu4yfQCd35dEOIMo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WOM0rxgwcefw0oo5r2H2TXZzb0dXjU/Bxf3FrqHkJ60ae3kqu9Rm+dt75weZavOGqdKyr+9xzt0MWawjJ6QbtbMHiMyZMC+v0R3sAaOupNuqa4LfjjNGDZ7DUQdRe5xOKzsMTXR9QTWELvXNwAtZqfNtrkEy5OORayJoIdn2iLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDH132Kj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDH132Kj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783316211; x=1814852211;
  h=date:from:to:cc:subject:message-id;
  bh=oBCxcSoU63EQ83IjKhagRccasgwqu4yfQCd35dEOIMo=;
  b=nDH132Kjk2nsrIwNr9gZvhcGK5o4tpKyoVe6tFE0xbAURwQfr2gRSdFu
   umSDoFklhcW66agTAevWvYykSrWYI/hQDyoZ18o8Te5h9o+/D5ox8YSJg
   Mw7TKJgQsvf9Hde137cIVhTDmgbDBiTFlI+/Cu1GB+BsBFpaWUB3BN9Zo
   zVtkaUtMbqYBO4wiNOzQ4a7zyXqYRnmxRJBdyxU0SCZAkBK0bW5SBoTcB
   mjYZCP5YWjvgl+Uyew+jTJ2y8r/L3YW7gE4F4p1VoziZlRPwoFuUhWUoE
   KHmVy5i6/GmHA8FZpVov/b4fLobbcNPnWePqhX/3LDcycIMe3peHLQvBX
   A==;
X-CSE-ConnectionGUID: p9eFv1aiSDaRpg6O47iX4Q==
X-CSE-MsgGUID: pIdfXkRPQM+BmPIvrR9N1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83920904"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83920904"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 22:36:50 -0700
X-CSE-ConnectionGUID: YYpF5ZoNQJafUfC5djXDOg==
X-CSE-MsgGUID: 5y6XNOYMTquwJKJtrU2dHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="255557204"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jul 2026 22:36:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgc0a-00000000E6Z-2Pfi;
	Mon, 06 Jul 2026 05:36:45 +0000
Date: Mon, 06 Jul 2026 13:36:05 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/qemu_upst 20/54]
 drivers/memory/pl353-smc.c:62:34: warning: unused variable
 'pl353_smc_supported_children'
Message-ID: <202607061331.uFgxkVmz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Richard,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_upst
head:   5e4bb1f393648d68ee1bcf780f3380dd8369e397
commit: 5840f3f95efe43f7f01794b4445e2827f805fb69 [20/54] hexagon: update build system and Kconfig
config: hexagon-randconfig-r122-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061331.uFgxkVmz-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061331.uFgxkVmz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061331.uFgxkVmz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/memory/pl353-smc.c:62:34: warning: unused variable 'pl353_smc_supported_children' [-Wunused-const-variable]
      62 | static const struct of_device_id pl353_smc_supported_children[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/pl353_smc_supported_children +62 drivers/memory/pl353-smc.c

fee10bd2267868f Naga Sureshkumar Relli 2018-12-06  58  
fee10bd2267868f Naga Sureshkumar Relli 2018-12-06  59  static SIMPLE_DEV_PM_OPS(pl353_smc_dev_pm_ops, pl353_smc_suspend,
fee10bd2267868f Naga Sureshkumar Relli 2018-12-06  60  			 pl353_smc_resume);
fee10bd2267868f Naga Sureshkumar Relli 2018-12-06  61  
fee10bd2267868f Naga Sureshkumar Relli 2018-12-06 @62  static const struct of_device_id pl353_smc_supported_children[] = {
fee10bd2267868f Naga Sureshkumar Relli 2018-12-06  63  	{
fee10bd2267868f Naga Sureshkumar Relli 2018-12-06  64  		.compatible = "cfi-flash"
fee10bd2267868f Naga Sureshkumar Relli 2018-12-06  65  	},
fee10bd2267868f Naga Sureshkumar Relli 2018-12-06  66  	{
fee10bd2267868f Naga Sureshkumar Relli 2018-12-06  67  		.compatible = "arm,pl353-nand-r2p1",
fee10bd2267868f Naga Sureshkumar Relli 2018-12-06  68  	},
fee10bd2267868f Naga Sureshkumar Relli 2018-12-06  69  	{}
fee10bd2267868f Naga Sureshkumar Relli 2018-12-06  70  };
fee10bd2267868f Naga Sureshkumar Relli 2018-12-06  71  

:::::: The code at line 62 was first introduced by commit
:::::: fee10bd2267868f2a3e7ba008ef7665aac5e4412 memory: pl353: Add driver for arm pl353 static memory controller

:::::: TO: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
