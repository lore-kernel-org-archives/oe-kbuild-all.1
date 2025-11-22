Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF2F5661
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 13:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763818787; cv=none; b=nv/DjWQTvbOXhxYBin0qkG0WvlrOX3fWtkRcsApJh4jFJ/XaSP+dYPnQ13WvM7X/zzY4zPbOhjgpi+pgmty1zwJU66pEdknDHg63JKTX4t10COI4sKZFXjYQuNTLqnL1XmbslrFMBIbtoZrACYu+s0oeNR9lD7LbA10Bx+OKzI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763818787; c=relaxed/simple;
	bh=LA8XRJ8hYbb6HVUX0ex4G947psgOKltycDOjS932eyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=joSfYC3EQHNY580cPYXma1pYQqPNcQML8r0w3SFSK89Wijwr2RntTB1T5FLBgd220N4S/Xewaiqp0afrdDFH9kiGC1hTO8W6cXTL+VzV8SV+VX/u++W5PWFqGYzUH2pqpzszw5qt8VfwxLSek+EyrqU23vNmrGx7RkoMZo8Thjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MuM/A9qF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MuM/A9qF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763818786; x=1795354786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LA8XRJ8hYbb6HVUX0ex4G947psgOKltycDOjS932eyI=;
  b=MuM/A9qFPz3jDUaLWtC1HaJ/nSKxffyOunwxZ0Ybm7G/1mW0AB0qJdM0
   iURu/tOaKt7N2x6aS97KsWjgW0kxpAK/WK380wzsE1KLkyxbk1W+MoRVc
   8rieW1uEEyQkmoNGRyAr9empRT85hGU0+Ny9LDroQPzLjFGbfEXmThnR3
   lmLpyOPuC+toZYU1RnLLa7QQzlEdS6O5Ni2B2wNyg74F5pK6ncKHTgeoO
   BptHU29QWfBzNMXxNI/EuatFZDpBY+l1n+XcYoLBVgXDE4feHrr6cua1x
   qwoHbOfo3BBwhxCGYmpJQLjqMGl2EseNbnSRs2tiKvvEn9SfAC5PgTpmp
   w==;
X-CSE-ConnectionGUID: IXoXVB3BQPKEFYxyqx8xCQ==
X-CSE-MsgGUID: aYUAOoONR0u18yP9X5BYYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="69510191"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="69510191"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 05:39:46 -0800
X-CSE-ConnectionGUID: up2hGHKLRsaWwWzN6Nb89g==
X-CSE-MsgGUID: lootEyG/R1ipNOMSGBjcpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="191113575"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2025 05:39:44 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMnq1-0007YJ-1o;
	Sat, 22 Nov 2025 13:39:41 +0000
Date: Sat, 22 Nov 2025 21:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>
Subject: drivers/clk/microchip/clk-core.c:915:10: sparse: sparse: Initializer
 entry defined twice
Message-ID: <202511222115.uvHrP95A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Brian,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2eba5e05d9bcf4cdea995ed51b0f07ba0275794a
commit: 7d85cd8730ab7701a1cafd0db0d7b6b1f6cfbb91 clk: microchip: core: remove duplicate roclk_determine_rate()
date:   7 weeks ago
config: mips-randconfig-r134-20251122 (https://download.01.org/0day-ci/archive/20251122/202511222115.uvHrP95A-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511222115.uvHrP95A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511222115.uvHrP95A-lkp@intel.com/

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
