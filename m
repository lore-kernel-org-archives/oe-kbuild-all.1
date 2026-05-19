Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD73235F8D2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 19:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218724; cv=none; b=WKpQBdqMMnCMqwuQvei2bmQFB7H+ydD8Wymn3Sp9pPCheXhNMnS4sN66nHL4JQxM6fy86LZclizfZEvcMLA7PvVqCgHrEHrpLHG5UA2m2CLDbuPdL99dURiiMm5637K9PZqbsHS8+0eY0u8HVHfmhaEJXfbmgZeAJC9GhHbYOqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218724; c=relaxed/simple;
	bh=FF42nqgjyEosQhISHqhoXMl4+Wcxgxr3h8yPBGfi8Ik=;
	h=Date:From:To:Cc:Subject:Message-ID; b=om1aL8A+PKc2bLSlRYZo4A8RDm0/tXm5Yl1Z4P1Tb35bGyyRL/Bxu+2jePLfO9i2QTDECIoZHwpaqYxYYWrqMEB/xlNUgAXNDev8PSzHBSgY7s5Jk9/2dSv5w6mjuuKfZqcFlpqkRjL61qHe+F2r5dTMX6Cf+e2Wd62MUOnQCcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKZZNGIQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKZZNGIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779218723; x=1810754723;
  h=date:from:to:cc:subject:message-id;
  bh=FF42nqgjyEosQhISHqhoXMl4+Wcxgxr3h8yPBGfi8Ik=;
  b=LKZZNGIQooFbo3JGTHM6bbfWJ2i7TwLjGHe1STqDKRrhLdPJAHWIqw1C
   OayGRz+HjvZp+CgGaEJXUL+UP4ZxKWoxjTxk2Ct63yzLoMtg/2FnhlKaV
   Z65pRJQRvAV9/O7bKLAjs52xkFI8Il7xnNoaHZVP5toP6ggZaOYd5UQrg
   QHS4DrlRZ7gUZMKSvWI2FsGJENlcV9+XhEuemxOyMr+9E3yc+56K9bZFc
   ukbKrcjIF+jO2LU9Vy8DPrnD88A77MLO2FIWthUHi5qCg4lVmWGpXrJDo
   8fX9v8h8ABsv1fc6ffDbBx2Iu5oqcpjG6SC+cua1ljxsELYazBOG+Txr/
   Q==;
X-CSE-ConnectionGUID: S0yCzRUHQCmjgrrE/d8Myw==
X-CSE-MsgGUID: 7qHTMnb9SO6NCcPVP33r/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="83992170"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="83992170"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 12:25:22 -0700
X-CSE-ConnectionGUID: vdTpQSy+QJuD8FIXP6pjGQ==
X-CSE-MsgGUID: CL2t8bT3RV6Lw4loej3tqw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 19 May 2026 12:25:20 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPQ3M-000000001lJ-0YTv;
	Tue, 19 May 2026 19:24:35 +0000
Date: Wed, 20 May 2026 03:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Jann Horn <jannh@google.com>,
 Feng Tang <feng.tang@linux.alibaba.com>
Subject: [ardb:arm64-remap-linear-data-alias-v5 2/13]
 arch/sh/mm/init.c:335:30: warning: passing argument 1 of
 '__flush_wback_region' discards 'const' qualifier from pointer target type
Message-ID: <202605200336.oeejBFJU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-remap-linear-data-alias-v5
head:   d3ef1c7a7d081f762b2bb61c614d06af61ace42b
commit: f8ca7ccc34aa79d6d288b0b2c2f7da546487afa4 [2/13] mm: Make empty_zero_page[] const
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260520/202605200336.oeejBFJU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200336.oeejBFJU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200336.oeejBFJU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sh/mm/init.c: In function 'mem_init':
>> arch/sh/mm/init.c:335:30: warning: passing argument 1 of '__flush_wback_region' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     335 |         __flush_wback_region(empty_zero_page, PAGE_SIZE);
         |                              ^~~~~~~~~~~~~~~
   arch/sh/mm/init.c:335:30: note: expected 'void *' but argument is of type 'const uint8_t *' {aka 'const unsigned char *'}


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
