Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DD01F4E34
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 19:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758916600; cv=none; b=BiVVN7OrayRjUm1N97CxX3ipJCOXejxQaDUdeu6k1Bt15TFXcGbRSfJsiz5GEwUWr/zC4u5Gqmac4i1k5chby7pQtme7WQj8ocHAdFwuItoB5eyj+oZZ8UgFdHJ3y90//BFwamZyuaja7uVJpoQCUBLXQDVrMH2ZxkyU7ApGQ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758916600; c=relaxed/simple;
	bh=eFQVzPSBMdisVXm/y+0HZRjzlPuX3YcapWR1p14qQ9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ix9GfM8Kl/3qvpSXWTz0+FBkJtRqZPNC9rW/L8K2Swe40mYQLAlse+v/8BNI7i1fKXuR9ChoDC52lPkw9kmNolRvm22L6YJIQBqD/e08oqB6OpSfrHXQrQoergwuss1R1XwjD0mcZXCpWE398rn6ocTg3uclPfklcWOY8X4zc2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXnuGH4P; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXnuGH4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758916599; x=1790452599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFQVzPSBMdisVXm/y+0HZRjzlPuX3YcapWR1p14qQ9g=;
  b=QXnuGH4P20ul4+74rchYvOcdOWOOZpkXjRbsHmcBgSIC8CxhYojkPU2F
   9XPwUTIQCmN6BVCkxdk5rEQdD37seTWJ+3cx1m8rT2VXo+X5zKIA3bOrB
   DY7PfoOt6wzs7q7KiIxlUdzghwjn/y6Y+gAGbhVuFgaHHhk1ts3ZyaUlQ
   ES/XXM4G47VvCNv2Xr2nMcATcuC/f+nosvVdmbTOleFaahyBYj6lxPLan
   mldufhjlLCUXp6TaWCQFh1fqI2gaRUt0Hwo6W+vIVCKaqvhkp3qU/zf84
   HenQ+8PbhHjsIZMkdVcEUcJqoRnx3t69S3wpoyc5IJrIWxfDMPPQowyIO
   g==;
X-CSE-ConnectionGUID: 0GShz2UMRmaUo6zfr7doew==
X-CSE-MsgGUID: 0pYkOSd3RD2OGKB0ex28iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="71501188"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="71501188"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 12:56:38 -0700
X-CSE-ConnectionGUID: xjn0suZmS0eURcaGIQDMgw==
X-CSE-MsgGUID: YOo/SIipT+uNg74BRKNSuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="182879071"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 Sep 2025 12:56:38 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2EYV-0006Yd-0E;
	Fri, 26 Sep 2025 19:56:35 +0000
Date: Sat, 27 Sep 2025 03:55:35 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:syscon-rework-5 6/8] drivers/clk/microchip/clk-mpfs.c:217:2:
 error: use of undeclared identifier 'clk_divider_regmap_ops'; did you mean
 'clk_divider_ro_ops'?
Message-ID: <202509270300.j8Eu20pZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git syscon-rework-5
head:   f52f95f53970da26ac262fbdb5bd7bdc0701c675
commit: 907b87c8cc760f20b9b81857b29a7f90390fba85 [6/8] clk: microchip: mpfs: use regmap for clocks
config: i386-buildonly-randconfig-004-20250927 (https://download.01.org/0day-ci/archive/20250927/202509270300.j8Eu20pZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509270300.j8Eu20pZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509270300.j8Eu20pZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/microchip/clk-mpfs.c:217:2: error: use of undeclared identifier 'clk_divider_regmap_ops'; did you mean 'clk_divider_ro_ops'?
     217 |         CLK_PLL_OUT(CLK_MSSPLL0, "clk_msspll", "clk_msspll_internal", CLK_DIVIDER_ONE_BASED,
         |         ^
   drivers/clk/microchip/clk-mpfs.c:212:49: note: expanded from macro 'CLK_PLL_OUT'
     212 |         .output.hw.init = CLK_HW_INIT(_name, _parent, &clk_divider_regmap_ops, 0),      \
         |                                                        ^
   include/linux/clk-provider.h:737:29: note: 'clk_divider_ro_ops' declared here
     737 | extern const struct clk_ops clk_divider_ro_ops;
         |                             ^
   drivers/clk/microchip/clk-mpfs.c:219:2: error: use of undeclared identifier 'clk_divider_regmap_ops'; did you mean 'clk_divider_ro_ops'?
     219 |         CLK_PLL_OUT(CLK_MSSPLL1, "clk_msspll1", "clk_msspll_internal", CLK_DIVIDER_ONE_BASED,
         |         ^
   drivers/clk/microchip/clk-mpfs.c:212:49: note: expanded from macro 'CLK_PLL_OUT'
     212 |         .output.hw.init = CLK_HW_INIT(_name, _parent, &clk_divider_regmap_ops, 0),      \
         |                                                        ^
   include/linux/clk-provider.h:737:29: note: 'clk_divider_ro_ops' declared here
     737 | extern const struct clk_ops clk_divider_ro_ops;
         |                             ^
   drivers/clk/microchip/clk-mpfs.c:221:2: error: use of undeclared identifier 'clk_divider_regmap_ops'; did you mean 'clk_divider_ro_ops'?
     221 |         CLK_PLL_OUT(CLK_MSSPLL2, "clk_msspll2", "clk_msspll_internal", CLK_DIVIDER_ONE_BASED,
         |         ^
   drivers/clk/microchip/clk-mpfs.c:212:49: note: expanded from macro 'CLK_PLL_OUT'
     212 |         .output.hw.init = CLK_HW_INIT(_name, _parent, &clk_divider_regmap_ops, 0),      \
         |                                                        ^
   include/linux/clk-provider.h:737:29: note: 'clk_divider_ro_ops' declared here
     737 | extern const struct clk_ops clk_divider_ro_ops;
         |                             ^
   drivers/clk/microchip/clk-mpfs.c:223:2: error: use of undeclared identifier 'clk_divider_regmap_ops'; did you mean 'clk_divider_ro_ops'?
     223 |         CLK_PLL_OUT(CLK_MSSPLL3, "clk_msspll3", "clk_msspll_internal", CLK_DIVIDER_ONE_BASED,
         |         ^
   drivers/clk/microchip/clk-mpfs.c:212:49: note: expanded from macro 'CLK_PLL_OUT'
     212 |         .output.hw.init = CLK_HW_INIT(_name, _parent, &clk_divider_regmap_ops, 0),      \
         |                                                        ^
   include/linux/clk-provider.h:737:29: note: 'clk_divider_ro_ops' declared here
     737 | extern const struct clk_ops clk_divider_ro_ops;
         |                             ^
   4 errors generated.


vim +217 drivers/clk/microchip/clk-mpfs.c

445c2da89747e2 Conor Dooley 2022-04-13  215  
1afa9480c997b0 Conor Dooley 2024-01-22  216  static struct mpfs_msspll_out_hw_clock mpfs_msspll_out_clks[] = {
72151193839e4f Conor Dooley 2024-01-22 @217  	CLK_PLL_OUT(CLK_MSSPLL0, "clk_msspll", "clk_msspll_internal", CLK_DIVIDER_ONE_BASED,
66736997c231c7 Conor Dooley 2024-01-22  218  		    MSSPLL_POSTDIV02_SHIFT, MSSPLL_POSTDIV_WIDTH, REG_MSSPLL_POSTDIV01_CR),
72151193839e4f Conor Dooley 2024-01-22  219  	CLK_PLL_OUT(CLK_MSSPLL1, "clk_msspll1", "clk_msspll_internal", CLK_DIVIDER_ONE_BASED,
b67dae390918bc Conor Dooley 2024-01-22  220  		    MSSPLL_POSTDIV13_SHIFT, MSSPLL_POSTDIV_WIDTH, REG_MSSPLL_POSTDIV01_CR),
72151193839e4f Conor Dooley 2024-01-22  221  	CLK_PLL_OUT(CLK_MSSPLL2, "clk_msspll2", "clk_msspll_internal", CLK_DIVIDER_ONE_BASED,
b67dae390918bc Conor Dooley 2024-01-22  222  		    MSSPLL_POSTDIV02_SHIFT, MSSPLL_POSTDIV_WIDTH, REG_MSSPLL_POSTDIV23_CR),
72151193839e4f Conor Dooley 2024-01-22  223  	CLK_PLL_OUT(CLK_MSSPLL3, "clk_msspll3", "clk_msspll_internal", CLK_DIVIDER_ONE_BASED,
b67dae390918bc Conor Dooley 2024-01-22  224  		    MSSPLL_POSTDIV13_SHIFT, MSSPLL_POSTDIV_WIDTH, REG_MSSPLL_POSTDIV23_CR),
445c2da89747e2 Conor Dooley 2022-04-13  225  };
445c2da89747e2 Conor Dooley 2022-04-13  226  

:::::: The code at line 217 was first introduced by commit
:::::: 72151193839e4fe222d0be9931f6ba3a94de7aa5 clk: microchip: mpfs: convert MSSPLL outputs to clk_divider

:::::: TO: Conor Dooley <conor.dooley@microchip.com>
:::::: CC: Conor Dooley <conor.dooley@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
