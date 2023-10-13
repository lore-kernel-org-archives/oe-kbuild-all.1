Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1676F37A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 14:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBj8VvMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697206401; x=1728742401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J+FRKP01vGADX1Zc/fyKXO0FBVl46prgtOELUQ4Hm5Q=;
  b=iBj8VvMCYj8SQiVLVZW6UGHNakDan7HGtAC5nd4lrpEcuHDzW9xTmY9a
   eeUjLM109bBp+sRMK9t5tB/qwS4KShWDY/xdT+humkWQzLLahcwRKU2U7
   /LXlc2Gsr5qigDbuuYEZX4wJdQ2NRiTj3ix8xUoWws8i+A1hW7gqTlNeP
   kdMX5dlwOz8V1YEKjzIhdB5kTxMtPFekYHIlAem6/HW3IFreEXU2IMeLp
   M1oRC04Iypk513rufjnzmWeyffKuqtV5AGZxO4M0ETBk72txA7ePsFobL
   Fgsj1GAFoxBJUwFnQJhUFUq4nzP89NNRBWXROWnybwqzhnRflLmI/Noji
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="416239396"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="416239396"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 07:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="704662036"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="704662036"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Oct 2023 07:13:18 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrIui-0004qV-1C;
	Fri, 13 Oct 2023 14:13:16 +0000
Date: Fri, 13 Oct 2023 22:12:50 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:can-clk-changes 7/7] include/vdso/bits.h:7:33: warning:
 conversion from 'long unsigned int' to 'unsigned char' changes value from
 '2048' to '0'
Message-ID: <202310132244.jgY5GcoQ-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310132244.jgY5GcoQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310132244.jgY5GcoQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310132244.jgY5GcoQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> include/vdso/bits.h:7:33: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '2048' to '0' [-Woverflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   drivers/clk/microchip/clk-mpfs.c:187:25: note: in definition of macro 'CLK_PLL_OUT'
     187 |         .output.flags = _flags,                                                 \
         |                         ^~~~~~
   include/linux/clk-provider.h:30:33: note: in expansion of macro 'BIT'
      30 | #define CLK_IS_CRITICAL         BIT(11) /* do not gate, ever */
         |                                 ^~~
   drivers/clk/microchip/clk-mpfs.c:197:71: note: in expansion of macro 'CLK_IS_CRITICAL'
     197 |         CLK_PLL_OUT(CLK_MSSPLL, "clk_msspll2", "clk_msspll_internal", CLK_IS_CRITICAL,
         |                                                                       ^~~~~~~~~~~~~~~
>> include/vdso/bits.h:7:33: warning: conversion from 'long unsigned int' to 'unsigned char' changes value from '2048' to '0' [-Woverflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   drivers/clk/microchip/clk-mpfs.c:187:25: note: in definition of macro 'CLK_PLL_OUT'
     187 |         .output.flags = _flags,                                                 \
         |                         ^~~~~~
   include/linux/clk-provider.h:30:33: note: in expansion of macro 'BIT'
      30 | #define CLK_IS_CRITICAL         BIT(11) /* do not gate, ever */
         |                                 ^~~
   drivers/clk/microchip/clk-mpfs.c:199:71: note: in expansion of macro 'CLK_IS_CRITICAL'
     199 |         CLK_PLL_OUT(CLK_MSSPLL, "clk_msspll3", "clk_msspll_internal", CLK_IS_CRITICAL,
         |                                                                       ^~~~~~~~~~~~~~~


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
