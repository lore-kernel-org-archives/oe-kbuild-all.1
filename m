Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6BA332ECB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 08:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439025; cv=none; b=IREYDkz911jvVxKQuCRS/coYQOC0Y0dEHDClB4m+Myl3MPJme4DyVLXBKftIpEi0dCskwbe/zhOAFSCCEixyiBEkrxtW9lyH7x/g9qO/fyvSSjdUVaaCapIyKSsT+38dBo3m0oju9lRh/1w7zmpbfkmWW5V5RLOiYFg+ZHPMB/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439025; c=relaxed/simple;
	bh=k7WD9BggRnCO29eNEibGjzG29C0r1fTQhv9psuB6YY0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E8BiDTceEmyHiDysoHAJRDxbsuLkJBoTSYbopc8iSpfNT9muIJUQzIQfR8TshedR5V99a7WPjN6swehsen8Pz0jrplA2b/U8qNUUhHIq/u2A2iQRo3QuA1J7pWg5WQ6TswPupvwuRLfuVUCdK6NNlW2pf0O0Gg3TI5+VhlHv0qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xpbc8mO1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xpbc8mO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772439021; x=1803975021;
  h=date:from:to:cc:subject:message-id;
  bh=k7WD9BggRnCO29eNEibGjzG29C0r1fTQhv9psuB6YY0=;
  b=Xpbc8mO1gjR+azRiDfju+THWAyGlxxLL50EfPWAaMxbR9RXVQx8KBQeq
   O7R6RxY7Vsad855Ea4BaJMS+ZVhcyAoEZNrihWc8nTz52GPTrGt6/iKPz
   IBrr24vXGIz/1maluT0pwK9ykWf/ILUhLA6FZdSMvT9GxRumdqbkOIl40
   OjYe/PGdtUKgTVeH7td8N81BdYKxO/0YtRp/6sp6uJibHWEZ64cSypsEg
   7zomJFSGnbjfAebjnQ8AqBAWgAJs3kn9Bba7dHmCJ7HZgA0JiW6KnhmUb
   DSfRq7yiltXihPiFbkiS5+CXikUqaZeZTjRb1HrAfkoLTE/D6a1/A+rsi
   Q==;
X-CSE-ConnectionGUID: spVAQ5doQfGBFP15CZoYxA==
X-CSE-MsgGUID: rGSZ1xrhTraGC423jTC3bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73551377"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73551377"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 00:10:20 -0800
X-CSE-ConnectionGUID: /rPq4BuoTZKtRBUbjdgTIA==
X-CSE-MsgGUID: yhcp0oyQQZivgz7ktSWCDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="215250070"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Mar 2026 00:10:18 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwyM3-000000000bn-07p0;
	Mon, 02 Mar 2026 08:10:15 +0000
Date: Mon, 02 Mar 2026 16:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>
Subject: lib/tests/printf_kunit.c:740:49: sparse: sparse: cast from
 restricted gfp_t
Message-ID: <202603021615.d6FkL331-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11439c4635edd669ae435eec308f4ab8a0804808
commit: 7a79e7daa84e230266184a2018507551086c2317 printf: convert self-test to KUnit
date:   12 months ago
config: sparc64-randconfig-r132-20260302 (https://download.01.org/0day-ci/archive/20260302/202603021615.d6FkL331-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021615.d6FkL331-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021615.d6FkL331-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/printf_kunit.c:740:49: sparse: sparse: cast from restricted gfp_t
   lib/tests/printf_kunit.c:744:58: sparse: sparse: cast from restricted gfp_t

vim +740 lib/tests/printf_kunit.c

c244297acbe51f lib/test_printf.c        Yafang Shao       2021-03-19  702  
7a79e7daa84e23 lib/tests/printf_kunit.c Tamir Duberstein  2025-03-07  703  static void
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  704  flags(void)
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  705  {
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  706  	unsigned long flags;
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  707  	char *cmp_buffer;
c244297acbe51f lib/test_printf.c        Yafang Shao       2021-03-19  708  	gfp_t gfp;
c244297acbe51f lib/test_printf.c        Yafang Shao       2021-03-19  709  
c244297acbe51f lib/test_printf.c        Yafang Shao       2021-03-19  710  	cmp_buffer = kmalloc(BUF_SIZE, GFP_KERNEL);
c244297acbe51f lib/test_printf.c        Yafang Shao       2021-03-19  711  	if (!cmp_buffer)
c244297acbe51f lib/test_printf.c        Yafang Shao       2021-03-19  712  		return;
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  713  
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  714  	flags = 0;
c244297acbe51f lib/test_printf.c        Yafang Shao       2021-03-19  715  	page_flags_test(0, 0, 0, 0, 0, flags, "", cmp_buffer);
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  716  
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  717  	flags = 1UL << NR_PAGEFLAGS;
c244297acbe51f lib/test_printf.c        Yafang Shao       2021-03-19  718  	page_flags_test(0, 0, 0, 0, 0, flags, "", cmp_buffer);
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  719  
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  720  	flags |= 1UL << PG_uptodate | 1UL << PG_dirty | 1UL << PG_lru
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  721  		| 1UL << PG_active | 1UL << PG_swapbacked;
c244297acbe51f lib/test_printf.c        Yafang Shao       2021-03-19  722  	page_flags_test(1, 1, 1, 0x1fffff, 1, flags,
c244297acbe51f lib/test_printf.c        Yafang Shao       2021-03-19  723  			"uptodate|dirty|lru|active|swapbacked",
c244297acbe51f lib/test_printf.c        Yafang Shao       2021-03-19  724  			cmp_buffer);
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  725  
8d0920bde5eb8e lib/test_printf.c        David Hildenbrand 2021-04-22  726  	flags = VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC;
8d0920bde5eb8e lib/test_printf.c        David Hildenbrand 2021-04-22  727  	test("read|exec|mayread|maywrite|mayexec", "%pGv", &flags);
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  728  
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  729  	gfp = GFP_TRANSHUGE;
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  730  	test("GFP_TRANSHUGE", "%pGg", &gfp);
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  731  
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  732  	gfp = GFP_ATOMIC|__GFP_DMA;
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  733  	test("GFP_ATOMIC|GFP_DMA", "%pGg", &gfp);
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  734  
2973d8229b78d3 lib/test_printf.c        NeilBrown         2023-01-13  735  	gfp = __GFP_HIGH;
2973d8229b78d3 lib/test_printf.c        NeilBrown         2023-01-13  736  	test("__GFP_HIGH", "%pGg", &gfp);
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  737  
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  738  	/* Any flags not translated by the table should remain numeric */
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  739  	gfp = ~__GFP_BITS_MASK;
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15 @740  	snprintf(cmp_buffer, BUF_SIZE, "%#lx", (unsigned long) gfp);
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  741  	test(cmp_buffer, "%pGg", &gfp);
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  742  
2973d8229b78d3 lib/test_printf.c        NeilBrown         2023-01-13  743  	snprintf(cmp_buffer, BUF_SIZE, "__GFP_HIGH|%#lx",
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  744  							(unsigned long) gfp);
2973d8229b78d3 lib/test_printf.c        NeilBrown         2023-01-13  745  	gfp |= __GFP_HIGH;
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  746  	test(cmp_buffer, "%pGg", &gfp);
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  747  
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  748  	kfree(cmp_buffer);
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  749  }
edf14cdbf9a0e5 lib/test_printf.c        Vlastimil Babka   2016-03-15  750  

:::::: The code at line 740 was first introduced by commit
:::::: edf14cdbf9a0e5ab52698ca66d07a76ade0d5c46 mm, printk: introduce new format string for flags

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
