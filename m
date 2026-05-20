Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183C8365A02
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 07:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263490; cv=none; b=GULs8lp5OkXP2DRos1cMlR0JbsE3ebdWi8PvCuWDkHys8IwjGam8kz5z3R+VtPo8r3oVXtOlyUPsXLffQNs2IiNvPo/08T+CJe/C6ch8JlW9498YUthiZ9cdw5m6ABpSf/E0sgAz6Hm2S9Hs5lYHDnBkWgYce8ppC4oF6iRNTEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263490; c=relaxed/simple;
	bh=pg8tRX5JcNeModQPjAtjvsFQxfFeTi1WwpO0hy+u2v0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iyZMRzld7949zT9w9G8YDTS+QNG/DfPYRbTcc74sTWIknkpTPgKzf1z/tUfUOM6/i5H3Elz0hqpkkturUTwADRbW2p9wBrxhDSoXoMqKRF8WuELfqPP7Qks7CvPeRWlDTJqBahsZomRqMvZQyZqMILPFNuyVswfytK3fV3c5MHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVmjr5nX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVmjr5nX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779263488; x=1810799488;
  h=date:from:to:cc:subject:message-id;
  bh=pg8tRX5JcNeModQPjAtjvsFQxfFeTi1WwpO0hy+u2v0=;
  b=WVmjr5nXK3G/No8IFooYtJar6AEKAoznaQfuTWN64qRQbYNejyLe2k4a
   SnP3CE9qp1sbupWd07I2g7qV4tK3Pt3j8T84WSHhYsqrmqUQH8aEKVPfW
   ZpUtYk3QVHuHGoFUd5Fh6Nadv8ua67E+tfH1vHcVupBxYP/bPVGa5Qd71
   uTbel5/TwEqmviWc6n+WiivyKfyU/Wzvl2U3uvlI7Ri/N3wh/SEQYMwDq
   q97GX7ORNJdxQhowt1/0Zs7jQw/0G1k9B2UYqRaFar6axXpILVzkYNOJs
   nB4Y48nH0dTh8QZBnm1lH5BQJ7PKG1piEuXkU1lXMMimob5u4FqyqUNeo
   Q==;
X-CSE-ConnectionGUID: kQ3QVkanTz2QU1hh49X7iA==
X-CSE-MsgGUID: GZTqejw7Q6+ZoFqjEhURxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102831477"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="102831477"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 00:51:28 -0700
X-CSE-ConnectionGUID: tkjlESw6QtGJp0AwJ8HqIw==
X-CSE-MsgGUID: zcwo9yfSTtGJdjHMteXp1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="270417710"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 May 2026 00:51:25 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPbi6-000000002kr-2AGj;
	Wed, 20 May 2026 07:51:22 +0000
Date: Wed, 20 May 2026 15:50:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Jann Horn <jannh@google.com>,
 Feng Tang <feng.tang@linux.alibaba.com>
Subject: [ardb:arm64-remap-linear-data-alias-v5 2/13]
 arch/sh/mm/init.c:335:30: sparse: sparse: incorrect type in argument 1
 (different modifiers)
Message-ID: <202605201553.FcgPpE75-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-remap-linear-data-alias-v5
head:   d3ef1c7a7d081f762b2bb61c614d06af61ace42b
commit: f8ca7ccc34aa79d6d288b0b2c2f7da546487afa4 [2/13] mm: Make empty_zero_page[] const
config: sh-randconfig-r111-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201553.FcgPpE75-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201553.FcgPpE75-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201553.FcgPpE75-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/sh/mm/init.c:335:30: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void *start @@     got unsigned char const * @@
   arch/sh/mm/init.c:335:30: sparse:     expected void *start
   arch/sh/mm/init.c:335:30: sparse:     got unsigned char const *

vim +335 arch/sh/mm/init.c

d9b9487af79955 Paul Mundt     2010-01-18  328  
^1da177e4c3f41 Linus Torvalds 2005-04-16  329  void __init mem_init(void)
^1da177e4c3f41 Linus Torvalds 2005-04-16  330  {
37443ef3f0406e Paul Mundt     2009-08-15  331  	/* Set this up early, so we can take care of the zero page */
37443ef3f0406e Paul Mundt     2009-08-15  332  	cpu_cache_init();
37443ef3f0406e Paul Mundt     2009-08-15  333  
^1da177e4c3f41 Linus Torvalds 2005-04-16  334  	/* clear the zero-page */
^1da177e4c3f41 Linus Torvalds 2005-04-16 @335  	__flush_wback_region(empty_zero_page, PAGE_SIZE);
^1da177e4c3f41 Linus Torvalds 2005-04-16  336  
35f99c0da17beb Paul Mundt     2010-01-20  337  	vsyscall_init();
35f99c0da17beb Paul Mundt     2010-01-20  338  
da61efcfedabf1 Jiang Liu      2013-07-03  339  	pr_info("virtual kernel memory layout:\n"
35f99c0da17beb Paul Mundt     2010-01-20  340  		"    fixmap  : 0x%08lx - 0x%08lx   (%4ld kB)\n"
35f99c0da17beb Paul Mundt     2010-01-20  341  		"    vmalloc : 0x%08lx - 0x%08lx   (%4ld MB)\n"
3125ee72dca25f Paul Mundt     2010-01-21  342  		"    lowmem  : 0x%08lx - 0x%08lx   (%4ld MB) (cached)\n"
b0f3ae03aca0f3 Paul Mundt     2010-02-12  343  #ifdef CONFIG_UNCACHED_MAPPING
3125ee72dca25f Paul Mundt     2010-01-21  344  		"            : 0x%08lx - 0x%08lx   (%4ld MB) (uncached)\n"
b0f3ae03aca0f3 Paul Mundt     2010-02-12  345  #endif
35f99c0da17beb Paul Mundt     2010-01-20  346  		"      .init : 0x%08lx - 0x%08lx   (%4ld kB)\n"
35f99c0da17beb Paul Mundt     2010-01-20  347  		"      .data : 0x%08lx - 0x%08lx   (%4ld kB)\n"
35f99c0da17beb Paul Mundt     2010-01-20  348  		"      .text : 0x%08lx - 0x%08lx   (%4ld kB)\n",
35f99c0da17beb Paul Mundt     2010-01-20  349  		FIXADDR_START, FIXADDR_TOP,
35f99c0da17beb Paul Mundt     2010-01-20  350  		(FIXADDR_TOP - FIXADDR_START) >> 10,
35f99c0da17beb Paul Mundt     2010-01-20  351  
35f99c0da17beb Paul Mundt     2010-01-20  352  		(unsigned long)VMALLOC_START, VMALLOC_END,
35f99c0da17beb Paul Mundt     2010-01-20  353  		(VMALLOC_END - VMALLOC_START) >> 20,
35f99c0da17beb Paul Mundt     2010-01-20  354  
35f99c0da17beb Paul Mundt     2010-01-20  355  		(unsigned long)memory_start, (unsigned long)high_memory,
35f99c0da17beb Paul Mundt     2010-01-20  356  		((unsigned long)high_memory - (unsigned long)memory_start) >> 20,
35f99c0da17beb Paul Mundt     2010-01-20  357  

:::::: The code at line 335 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
