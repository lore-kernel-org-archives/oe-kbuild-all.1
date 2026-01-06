Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1327238159
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 21:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767736388; cv=none; b=c0E+S3osvHrGL67ZMHCz2YkJn3vQmXSoehR3dyGY3e6D658kSOVt8Vsvk32OchNzJFDo2mD0Lm7eAeN/AvWLj11GLT+Yt7cMZNtRis77jukEJKJ/lVqeQY2A3y+Yk0gfLDESnSEfgKev0QmUqiXdxlsj6mwU+k5RS6csVdFrdA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767736388; c=relaxed/simple;
	bh=xMGbtGbvvLuvfe9NyBpfvc0IB8JMUPtiv3vc3a+92ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u8WXiZs2l4tYHDrGoL88CwCM4jbLvhYdW/7en8Oi+oJGIJcfpY4cokunNSHnufPhrgEs9q2qTQ344sTtgxgzYmc1gJZDPbsefboUzzdFk7ORXSZmPnM0SntblpL2VyvRoFqWM0sKBefO13aDxV+rkTJOy6fSIsHHC90nZOYzz20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bzk8fszc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bzk8fszc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767736386; x=1799272386;
  h=date:from:to:cc:subject:message-id;
  bh=xMGbtGbvvLuvfe9NyBpfvc0IB8JMUPtiv3vc3a+92ZQ=;
  b=Bzk8fszcztwrlCNtjkdzmM1Z9hkSH/87wQ6jFmhNRHF4eVL4xgn5TdBU
   BtjbD2YrONkvq8t6ELe0lW4UpAwndLjEelOtoUcNDVwBP9dxlk8J7RruN
   s2l+r7jRmPZYCU7cKwrSmj+x203JyPyeJHx9Uqmf8MjzO/GH+67LObUyx
   0IpKU4aHBLnRPadu6jaLlh1/iFRAzf+SWTWyTewpqADXUyqpCRXHU3Jli
   zjsyUXWc+g/eCx3yi0ombqfBVPJWEc//S0tAOK6/pN0GWY4TSg81WFxzJ
   Ba3yxb0gRSo0+gWHtGDvxpi8iWnP8GIR2ICx+T+cKAXSdea+m3NL9RDbo
   w==;
X-CSE-ConnectionGUID: VvCdIrbwTTS8yG/rZQzADg==
X-CSE-MsgGUID: B8zlSau6QQ+km21Rq+CDkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="86691994"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="86691994"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 13:53:05 -0800
X-CSE-ConnectionGUID: as9JITlYSE2yMQTD89bmMQ==
X-CSE-MsgGUID: /gYqDVOgTbGBPPC9Cs62vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="202363350"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jan 2026 13:53:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdEz7-000000003GL-3U4M;
	Tue, 06 Jan 2026 21:53:01 +0000
Date: Wed, 07 Jan 2026 05:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>
Subject: drivers/clk/microchip/clk-core.c:915:10: sparse: sparse:
 Initializer entry defined twice
Message-ID: <202601070531.yJ4x70yl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Brian,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
commit: 7d85cd8730ab7701a1cafd0db0d7b6b1f6cfbb91 clk: microchip: core: remove duplicate roclk_determine_rate()
date:   3 months ago
config: mips-randconfig-r113-20260106 (https://download.01.org/0day-ci/archive/20260107/202601070531.yJ4x70yl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601070531.yJ4x70yl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601070531.yJ4x70yl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/microchip/clk-core.c:915:10: sparse: sparse: Initializer entry defined twice
   drivers/clk/microchip/clk-core.c:919:10: sparse:   also defined here

vim +915 drivers/clk/microchip/clk-core.c

ce6e1188465998 Purna Chandra Mandal 2016-05-13  910  
ce6e1188465998 Purna Chandra Mandal 2016-05-13  911  /* sclk with post-divider */
ce6e1188465998 Purna Chandra Mandal 2016-05-13  912  const struct clk_ops pic32_sclk_ops = {
ce6e1188465998 Purna Chandra Mandal 2016-05-13  913  	.get_parent	= sclk_get_parent,
ce6e1188465998 Purna Chandra Mandal 2016-05-13  914  	.set_parent	= sclk_set_parent,
e9f039c08cdc9b Brian Masney         2025-08-11 @915  	.determine_rate = sclk_determine_rate,
ce6e1188465998 Purna Chandra Mandal 2016-05-13  916  	.set_rate	= sclk_set_rate,
ce6e1188465998 Purna Chandra Mandal 2016-05-13  917  	.recalc_rate	= sclk_get_rate,
ce6e1188465998 Purna Chandra Mandal 2016-05-13  918  	.init		= sclk_init,
ce6e1188465998 Purna Chandra Mandal 2016-05-13  919  	.determine_rate = __clk_mux_determine_rate,
ce6e1188465998 Purna Chandra Mandal 2016-05-13  920  };
ce6e1188465998 Purna Chandra Mandal 2016-05-13  921  

:::::: The code at line 915 was first introduced by commit
:::::: e9f039c08cdc9b38665aee9a88ae21f59c09ba8c clk: microchip: core: convert from round_rate() to determine_rate()

:::::: TO: Brian Masney <bmasney@redhat.com>
:::::: CC: Brian Masney <bmasney@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
