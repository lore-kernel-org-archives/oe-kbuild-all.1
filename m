Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2B617EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 02:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dT+23u0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697422361; x=1728958361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8cgzGMvi4Z1JNNULnntn0vnHuXspRKhPTD/2CERZrEQ=;
  b=dT+23u0Pj21bq6GJjNLWDJct1CwLRlKEiuycNnK6/+UNxI2uU7Par1ve
   1PZrmgshLs3m6UcLkH7kZbZKLFaP4sQ36DTv+vuPD3GG99rlkKsLhsuko
   RVmWUenl/yOydnJ/U4EZxqYG2HudFj/NH/VfXSRw+Xk28qtEEiKwQEi+f
   78nMigj0OiaXlch4m38ZHDBe+6SiiueiiDE4uZXejT1Ecvpf+16cplSeb
   RbnNVHZm+NN9zO++eFePKH20gaFRge6Q+UBX3HqO0YDcI8rcupILNmcZn
   rPJSZ29UfDDqLSka2ebNA6Oy14avS9Nq4CtfLCL8rMN4gSiJ+U0Wq3azG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389291204"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="389291204"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 19:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002754300"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="1002754300"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 15 Oct 2023 19:12:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsD5w-000819-2R;
	Mon, 16 Oct 2023 02:12:36 +0000
Date: Mon, 16 Oct 2023 10:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:can-clk-changes 7/7] include/vdso/bits.h:7:19: warning: large
 integer implicitly truncated to unsigned type
Message-ID: <202310161024.l9TPnXEB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git can-clk-changes
head:   46c6b04fed8775eefb9f33d13ac89604bbab8eee
commit: 46c6b04fed8775eefb9f33d13ac89604bbab8eee [7/7] speculatively convert to a divider clock
config: i386-buildonly-randconfig-001-20231016 (https://download.01.org/0day-ci/archive/20231016/202310161024.l9TPnXEB-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310161024.l9TPnXEB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161024.l9TPnXEB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> include/vdso/bits.h:7:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
    #define BIT(nr)   (UL(1) << (nr))
                      ^
   drivers/clk/microchip/clk-mpfs.c:187:18: note: in definition of macro 'CLK_PLL_OUT'
     .output.flags = _flags,       \
                     ^~~~~~
   include/linux/clk-provider.h:30:26: note: in expansion of macro 'BIT'
    #define CLK_IS_CRITICAL  BIT(11) /* do not gate, ever */
                             ^~~
   drivers/clk/microchip/clk-mpfs.c:197:64: note: in expansion of macro 'CLK_IS_CRITICAL'
     CLK_PLL_OUT(CLK_MSSPLL, "clk_msspll2", "clk_msspll_internal", CLK_IS_CRITICAL,
                                                                   ^~~~~~~~~~~~~~~
>> include/vdso/bits.h:7:19: warning: large integer implicitly truncated to unsigned type [-Woverflow]
    #define BIT(nr)   (UL(1) << (nr))
                      ^
   drivers/clk/microchip/clk-mpfs.c:187:18: note: in definition of macro 'CLK_PLL_OUT'
     .output.flags = _flags,       \
                     ^~~~~~
   include/linux/clk-provider.h:30:26: note: in expansion of macro 'BIT'
    #define CLK_IS_CRITICAL  BIT(11) /* do not gate, ever */
                             ^~~
   drivers/clk/microchip/clk-mpfs.c:199:64: note: in expansion of macro 'CLK_IS_CRITICAL'
     CLK_PLL_OUT(CLK_MSSPLL, "clk_msspll3", "clk_msspll_internal", CLK_IS_CRITICAL,
                                                                   ^~~~~~~~~~~~~~~


vim +7 include/vdso/bits.h

3945ff37d2f48d Vincenzo Frascino 2020-03-20  6  
3945ff37d2f48d Vincenzo Frascino 2020-03-20 @7  #define BIT(nr)			(UL(1) << (nr))
cbdb1f163af2bb Andy Shevchenko   2022-11-28  8  #define BIT_ULL(nr)		(ULL(1) << (nr))
3945ff37d2f48d Vincenzo Frascino 2020-03-20  9  

:::::: The code at line 7 was first introduced by commit
:::::: 3945ff37d2f48d39fd1751d282c80176654049e4 linux/bits.h: Extract common header for vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
