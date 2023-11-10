Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF334ED3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 22:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcGJHARd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699656564; x=1731192564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=98G/EYC0Ltuxon/nzAj/8ahT57j8VJkvjXb/PMLsyIw=;
  b=gcGJHARdXAovsF10eO3N5Qm/ttfw3c+ZBgzw6i3TfwPGq9CO5DiB2gI7
   W6GBOZnIK2bwiOpbHz917pF/xLAouRkXAnu/RTktiV+Hw1MXBVOOjAzaw
   +YYOxdi4OABAutUBBzuCMkvWeU3CweZaAZJLIJe1UB6dnrZj0ij56K9+F
   5PYhKRzhb9yhwZKxfKDTLSWuzpjCKl7OYmLWyGz1sxQY+0ywVLQ3mSkIY
   RvmgTDig6BeOHLAXjfbHRlt6ATQzdM9n1BwI8QvEm5DvvlF8aHi8fPuas
   p3YSi7PO9b0AU2fMldaN2cCU8QTAL7wy8h8LE+kCPLLd7CUF1T7QorWYL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="8889026"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="8889026"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 14:49:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="757306920"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="757306920"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Nov 2023 14:49:21 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1aJS-0009zV-30;
	Fri, 10 Nov 2023 22:49:18 +0000
Date: Sat, 11 Nov 2023 06:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/arc/include/asm/checksum.h:27:26: sparse: sparse: restricted
 __wsum degrades to integer
Message-ID: <202311110638.YiWEivqX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac347a0655dbc7d885e217c89dddd16e2800bd58
commit: b38460bc463c54e0c15ff3b37e81f7e2059bb9bb kunit: Fix checksum tests on big endian CPUs
date:   3 months ago
config: arc-randconfig-r121-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110638.YiWEivqX-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110638.YiWEivqX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110638.YiWEivqX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/checksum_kunit.c: note: in included file:
>> arch/arc/include/asm/checksum.h:27:26: sparse: sparse: restricted __wsum degrades to integer
   arch/arc/include/asm/checksum.h:27:36: sparse: sparse: restricted __wsum degrades to integer
>> arch/arc/include/asm/checksum.h:29:11: sparse: sparse: bad assignment (-=) to restricted __wsum
   arch/arc/include/asm/checksum.h:30:16: sparse: sparse: restricted __wsum degrades to integer
>> arch/arc/include/asm/checksum.h:30:18: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __sum16 @@     got unsigned int @@
   arch/arc/include/asm/checksum.h:30:18: sparse:     expected restricted __sum16
   arch/arc/include/asm/checksum.h:30:18: sparse:     got unsigned int
>> arch/arc/include/asm/checksum.h:27:26: sparse: sparse: restricted __wsum degrades to integer
   arch/arc/include/asm/checksum.h:27:36: sparse: sparse: restricted __wsum degrades to integer
>> arch/arc/include/asm/checksum.h:29:11: sparse: sparse: bad assignment (-=) to restricted __wsum
   arch/arc/include/asm/checksum.h:30:16: sparse: sparse: restricted __wsum degrades to integer
>> arch/arc/include/asm/checksum.h:30:18: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __sum16 @@     got unsigned int @@
   arch/arc/include/asm/checksum.h:30:18: sparse:     expected restricted __sum16
   arch/arc/include/asm/checksum.h:30:18: sparse:     got unsigned int
>> arch/arc/include/asm/checksum.h:27:26: sparse: sparse: restricted __wsum degrades to integer
   arch/arc/include/asm/checksum.h:27:36: sparse: sparse: restricted __wsum degrades to integer
>> arch/arc/include/asm/checksum.h:29:11: sparse: sparse: bad assignment (-=) to restricted __wsum
   arch/arc/include/asm/checksum.h:30:16: sparse: sparse: restricted __wsum degrades to integer
>> arch/arc/include/asm/checksum.h:30:18: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __sum16 @@     got unsigned int @@
   arch/arc/include/asm/checksum.h:30:18: sparse:     expected restricted __sum16
   arch/arc/include/asm/checksum.h:30:18: sparse:     got unsigned int
>> arch/arc/include/asm/checksum.h:27:26: sparse: sparse: restricted __wsum degrades to integer
   arch/arc/include/asm/checksum.h:27:36: sparse: sparse: restricted __wsum degrades to integer
>> arch/arc/include/asm/checksum.h:29:11: sparse: sparse: bad assignment (-=) to restricted __wsum
   arch/arc/include/asm/checksum.h:30:16: sparse: sparse: restricted __wsum degrades to integer
>> arch/arc/include/asm/checksum.h:30:18: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __sum16 @@     got unsigned int @@
   arch/arc/include/asm/checksum.h:30:18: sparse:     expected restricted __sum16
   arch/arc/include/asm/checksum.h:30:18: sparse:     got unsigned int
>> arch/arc/include/asm/checksum.h:27:26: sparse: sparse: restricted __wsum degrades to integer
   arch/arc/include/asm/checksum.h:27:36: sparse: sparse: restricted __wsum degrades to integer
>> arch/arc/include/asm/checksum.h:29:11: sparse: sparse: bad assignment (-=) to restricted __wsum
   arch/arc/include/asm/checksum.h:30:16: sparse: sparse: restricted __wsum degrades to integer
>> arch/arc/include/asm/checksum.h:30:18: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __sum16 @@     got unsigned int @@
   arch/arc/include/asm/checksum.h:30:18: sparse:     expected restricted __sum16
   arch/arc/include/asm/checksum.h:30:18: sparse:     got unsigned int

vim +27 arch/arc/include/asm/checksum.h

ca15c8ecd588dd Vineet Gupta 2013-01-18  18  
ca15c8ecd588dd Vineet Gupta 2013-01-18  19  /*
ca15c8ecd588dd Vineet Gupta 2013-01-18  20   *	Fold a partial checksum
ca15c8ecd588dd Vineet Gupta 2013-01-18  21   *
ca15c8ecd588dd Vineet Gupta 2013-01-18  22   *  The 2 swords comprising the 32bit sum are added, any carry to 16th bit
ca15c8ecd588dd Vineet Gupta 2013-01-18  23   *  added back and final sword result inverted.
ca15c8ecd588dd Vineet Gupta 2013-01-18  24   */
ca15c8ecd588dd Vineet Gupta 2013-01-18  25  static inline __sum16 csum_fold(__wsum s)
ca15c8ecd588dd Vineet Gupta 2013-01-18  26  {
d4067395519b40 Jinchao Wang 2021-06-26 @27  	unsigned int r = s << 16 | s >> 16;	/* ror */
ca15c8ecd588dd Vineet Gupta 2013-01-18  28  	s = ~s;
ca15c8ecd588dd Vineet Gupta 2013-01-18 @29  	s -= r;
ca15c8ecd588dd Vineet Gupta 2013-01-18 @30  	return s >> 16;
ca15c8ecd588dd Vineet Gupta 2013-01-18  31  }
ca15c8ecd588dd Vineet Gupta 2013-01-18  32  

:::::: The code at line 27 was first introduced by commit
:::::: d4067395519b40d4ee9b7c26347233e4ae59f900 arc: Prefer unsigned int to bare use of unsigned

:::::: TO: Jinchao Wang <wjc@cdjrlc.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
