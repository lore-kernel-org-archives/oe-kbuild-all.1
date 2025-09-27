Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A39B28371
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 19:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759002538; cv=none; b=mGRogKv3Tq/zSs5hf6KbWh0GI0Z3Gh02m2GlSc47iFFRrKh15NYu91Rn1wWgDCameoaxqSUYLGjEgT6H+CuHbQNxBqovqv83QNRW9lh54/c4wWrVGzvsOBWUVfQqTS9THTqfrmsFJCmVn5Ubria5ioimyWCCUdR6c6EL79/S1Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759002538; c=relaxed/simple;
	bh=QET8weNrUIxMtHizYE83CDO/3Z7OcFSdegRTtnRCVB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a31wRR9GNIbL1MeyOp7ko8Z7XnbXwZv1TewziHs7h3sNFltq6lMna7saAOo6ReRmwPCgpUWE3dRq4RSHbtR+bos9CVCTO7RrZJoBilO7UccsBX9z11HxzPXpdI37YxG/6m/zyLFVirXP7Vq09msFsvnQGtuKrWFFiwWDLnM74uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghAdAwMe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghAdAwMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759002537; x=1790538537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QET8weNrUIxMtHizYE83CDO/3Z7OcFSdegRTtnRCVB8=;
  b=ghAdAwMedpVR4V0cbZezaNncLftYozMMkVMgBsMtCw9XG8HUe4ci7gQ5
   KGnyXdQY+et9XJkUSw03844zdeoBRF4M8zhYNmHX+OHFfut0eRtDMwPP0
   9usMdkbAhb8EsxXxn3HktBvHAryjnngAfO22/2VTpJD2cR+4UI8Hvc2v1
   Xi4Xd14ncgNqodrUAwNqm2BZG61AEqOr6qMK4AYHLqR5TNfPN7aN4t8Y4
   kKABhO5gcr+S/RGg6aFXJ21sDBe0H9hlSLAfr/JXZlGvGNtlRhJFr73Sc
   Zu8s9UfWaUxz8GbyhoywqCunp8FEu4Kw6JvaSs6b/hm5SBUy7MU1Qcfyv
   g==;
X-CSE-ConnectionGUID: HWUdPfC/Sn+BA06K0tvbpg==
X-CSE-MsgGUID: saoXOsvVSCeAx1DRKu0AQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="78726586"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="78726586"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 12:48:56 -0700
X-CSE-ConnectionGUID: FNrjeabjTwi00VHInbS7Iw==
X-CSE-MsgGUID: G815ZcvsQMSxdtknjbclTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="181888111"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Sep 2025 12:48:55 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2aua-0007IJ-0u;
	Sat, 27 Sep 2025 19:48:52 +0000
Date: Sun, 28 Sep 2025 03:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6189/12740]
 drivers/clk/microchip/clk-core.c:391:12: error: redefinition of
 'roclk_determine_rate'
Message-ID: <202509280327.jsapR0Ww-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   262858079afde6d367ce3db183c74d8a43a0e83f
commit: e9f039c08cdc9b38665aee9a88ae21f59c09ba8c [6189/12740] clk: microchip: core: convert from round_rate() to determine_rate()
config: mips-randconfig-r131-20250927 (https://download.01.org/0day-ci/archive/20250928/202509280327.jsapR0Ww-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509280327.jsapR0Ww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509280327.jsapR0Ww-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/microchip/clk-core.c:391:12: error: redefinition of 'roclk_determine_rate'
     391 | static int roclk_determine_rate(struct clk_hw *hw,
         |            ^
   drivers/clk/microchip/clk-core.c:377:12: note: previous definition is here
     377 | static int roclk_determine_rate(struct clk_hw *hw,
         |            ^
>> drivers/clk/microchip/clk-core.c:411:18: error: call to undeclared function 'roclk_round_rate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     411 |                 nearest_rate = roclk_round_rate(hw, req->rate, &parent_rate);
         |                                ^
   drivers/clk/microchip/clk-core.c:926:20: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     926 |         .determine_rate = __clk_mux_determine_rate,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/microchip/clk-core.c:922:20: note: previous initialization is here
     922 |         .determine_rate = sclk_determine_rate,
         |                           ^~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +/roclk_determine_rate +391 drivers/clk/microchip/clk-core.c

ce6e1188465998 Purna Chandra Mandal 2016-05-13  390  
ce6e1188465998 Purna Chandra Mandal 2016-05-13 @391  static int roclk_determine_rate(struct clk_hw *hw,
ce6e1188465998 Purna Chandra Mandal 2016-05-13  392  				struct clk_rate_request *req)
ce6e1188465998 Purna Chandra Mandal 2016-05-13  393  {
ce6e1188465998 Purna Chandra Mandal 2016-05-13  394  	struct clk_hw *parent_clk, *best_parent_clk = NULL;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  395  	unsigned int i, delta, best_delta = -1;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  396  	unsigned long parent_rate, best_parent_rate = 0;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  397  	unsigned long best = 0, nearest_rate;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  398  
ce6e1188465998 Purna Chandra Mandal 2016-05-13  399  	/* find a parent which can generate nearest clkrate >= rate */
ce6e1188465998 Purna Chandra Mandal 2016-05-13  400  	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
ce6e1188465998 Purna Chandra Mandal 2016-05-13  401  		/* get parent */
ce6e1188465998 Purna Chandra Mandal 2016-05-13  402  		parent_clk = clk_hw_get_parent_by_index(hw, i);
ce6e1188465998 Purna Chandra Mandal 2016-05-13  403  		if (!parent_clk)
ce6e1188465998 Purna Chandra Mandal 2016-05-13  404  			continue;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  405  
ce6e1188465998 Purna Chandra Mandal 2016-05-13  406  		/* skip if parent runs slower than target rate */
ce6e1188465998 Purna Chandra Mandal 2016-05-13  407  		parent_rate = clk_hw_get_rate(parent_clk);
ce6e1188465998 Purna Chandra Mandal 2016-05-13  408  		if (req->rate > parent_rate)
ce6e1188465998 Purna Chandra Mandal 2016-05-13  409  			continue;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  410  
ce6e1188465998 Purna Chandra Mandal 2016-05-13 @411  		nearest_rate = roclk_round_rate(hw, req->rate, &parent_rate);
ce6e1188465998 Purna Chandra Mandal 2016-05-13  412  		delta = abs(nearest_rate - req->rate);
ce6e1188465998 Purna Chandra Mandal 2016-05-13  413  		if ((nearest_rate >= req->rate) && (delta < best_delta)) {
ce6e1188465998 Purna Chandra Mandal 2016-05-13  414  			best_parent_clk = parent_clk;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  415  			best_parent_rate = parent_rate;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  416  			best = nearest_rate;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  417  			best_delta = delta;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  418  
ce6e1188465998 Purna Chandra Mandal 2016-05-13  419  			if (delta == 0)
ce6e1188465998 Purna Chandra Mandal 2016-05-13  420  				break;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  421  		}
ce6e1188465998 Purna Chandra Mandal 2016-05-13  422  	}
ce6e1188465998 Purna Chandra Mandal 2016-05-13  423  
ce6e1188465998 Purna Chandra Mandal 2016-05-13  424  	/* if no match found, retain old rate */
ce6e1188465998 Purna Chandra Mandal 2016-05-13  425  	if (!best_parent_clk) {
ce6e1188465998 Purna Chandra Mandal 2016-05-13  426  		pr_err("%s:%s, no parent found for rate %lu.\n",
ce6e1188465998 Purna Chandra Mandal 2016-05-13  427  		       __func__, clk_hw_get_name(hw), req->rate);
ce6e1188465998 Purna Chandra Mandal 2016-05-13  428  		return clk_hw_get_rate(hw);
ce6e1188465998 Purna Chandra Mandal 2016-05-13  429  	}
ce6e1188465998 Purna Chandra Mandal 2016-05-13  430  
ce6e1188465998 Purna Chandra Mandal 2016-05-13  431  	pr_debug("%s,rate %lu, best_parent(%s, %lu), best %lu, delta %d\n",
ce6e1188465998 Purna Chandra Mandal 2016-05-13  432  		 clk_hw_get_name(hw), req->rate,
ce6e1188465998 Purna Chandra Mandal 2016-05-13  433  		 clk_hw_get_name(best_parent_clk), best_parent_rate,
ce6e1188465998 Purna Chandra Mandal 2016-05-13  434  		 best, best_delta);
ce6e1188465998 Purna Chandra Mandal 2016-05-13  435  
ce6e1188465998 Purna Chandra Mandal 2016-05-13  436  	if (req->best_parent_rate)
ce6e1188465998 Purna Chandra Mandal 2016-05-13  437  		req->best_parent_rate = best_parent_rate;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  438  
ce6e1188465998 Purna Chandra Mandal 2016-05-13  439  	if (req->best_parent_hw)
ce6e1188465998 Purna Chandra Mandal 2016-05-13  440  		req->best_parent_hw = best_parent_clk;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  441  
ce6e1188465998 Purna Chandra Mandal 2016-05-13  442  	return best;
ce6e1188465998 Purna Chandra Mandal 2016-05-13  443  }
ce6e1188465998 Purna Chandra Mandal 2016-05-13  444  

:::::: The code at line 391 was first introduced by commit
:::::: ce6e1188465998820e7182455261b1f5d508ca17 CLK: microchip: Add Microchip PIC32 clock driver.

:::::: TO: Purna Chandra Mandal <purna.mandal@microchip.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
