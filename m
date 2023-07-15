Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3CC63C6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 15:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689435603; x=1720971603;
  h=date:from:cc:subject:message-id:mime-version;
  bh=rGKg5ZdS+M2v5H0izjMwVASugeTwU75ofWAhcrSQ2+c=;
  b=IotSRucDCqYHNoFZobUTLUiU7S0QstuKOjMlvyYe2Kl0bBPowCtwklt8
   Wf57BC1DJwAOZPoeJkpFAdGf6bVhSBxt401XTmeMe0TlW2TWDqeFJDbAC
   hlxJfVHOrgJwuSwWgfDky08Wi1iyvJ68WxjXcsZ5TG20MV3gC/aV78txb
   6Ev2uLpp8Xg6pgjvwnnACUCXEUN9PfrkWFlt/IZGjxtTeHBGItN1dzYp+
   wP7vghwAPfWm0EuKn2s9Rg9L5TitvGK13OSBzuamwBqI6lM3Y/lJiZSHC
   rSwMYc8pGgoGt3u+FHZqyb6KYro6I3qHoB20BLj0o9tOFoPHqgkHHgPZ7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="363133472"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="363133472"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 08:40:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="846792650"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="846792650"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Jul 2023 08:40:00 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKhNH-0008Dd-2e
	for oe-kbuild-all@lists.linux.dev;
	Sat, 15 Jul 2023 15:39:59 +0000
Date: Sat, 15 Jul 2023 23:39:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_t 13796/30000] lib/test_printf.c:505:16:
 sparse: sparse: restricted gfp_t degrades to integer
Message-ID: <202307152351.1YwINrml-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   0f6dab7d9f97996aec10a8e2e854ec3bd628d550
commit: c29070e5b92b5505f5a13291c443a68309f72c4c [13796/30000] ANDROID: GKI: cma: redirect page allocation to CMA
config: m68k-randconfig-r072-20230713 (https://download.01.org/0day-ci/archive/20230715/202307152351.1YwINrml-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307152351.1YwINrml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307152351.1YwINrml-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/test_printf.c:505:16: sparse: sparse: restricted gfp_t degrades to integer
>> lib/test_printf.c:505:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted gfp_t [addressable] [assigned] [usertype] gfp @@     got unsigned int @@
   lib/test_printf.c:505:13: sparse:     expected restricted gfp_t [addressable] [assigned] [usertype] gfp
   lib/test_printf.c:505:13: sparse:     got unsigned int
   lib/test_printf.c:506:49: sparse: sparse: cast from restricted gfp_t
   lib/test_printf.c:510:58: sparse: sparse: cast from restricted gfp_t

vim +505 lib/test_printf.c

707cc7280f452a Rasmus Villemoes 2015-11-06  467  
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  468  static void __init
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  469  flags(void)
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  470  {
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  471  	unsigned long flags;
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  472  	gfp_t gfp;
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  473  	char *cmp_buffer;
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  474  
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  475  	flags = 0;
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  476  	test("", "%pGp", &flags);
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  477  
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  478  	/* Page flags should filter the zone id */
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  479  	flags = 1UL << NR_PAGEFLAGS;
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  480  	test("", "%pGp", &flags);
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  481  
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  482  	flags |= 1UL << PG_uptodate | 1UL << PG_dirty | 1UL << PG_lru
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  483  		| 1UL << PG_active | 1UL << PG_swapbacked;
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  484  	test("uptodate|dirty|lru|active|swapbacked", "%pGp", &flags);
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  485  
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  486  
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  487  	flags = VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  488  			| VM_DENYWRITE;
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  489  	test("read|exec|mayread|maywrite|mayexec|denywrite", "%pGv", &flags);
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  490  
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  491  	gfp = GFP_TRANSHUGE;
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  492  	test("GFP_TRANSHUGE", "%pGg", &gfp);
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  493  
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  494  	gfp = GFP_ATOMIC|__GFP_DMA;
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  495  	test("GFP_ATOMIC|GFP_DMA", "%pGg", &gfp);
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  496  
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  497  	gfp = __GFP_ATOMIC;
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  498  	test("__GFP_ATOMIC", "%pGg", &gfp);
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  499  
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  500  	cmp_buffer = kmalloc(BUF_SIZE, GFP_KERNEL);
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  501  	if (!cmp_buffer)
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  502  		return;
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  503  
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  504  	/* Any flags not translated by the table should remain numeric */
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15 @505  	gfp = ~__GFP_BITS_MASK;
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  506  	snprintf(cmp_buffer, BUF_SIZE, "%#lx", (unsigned long) gfp);
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  507  	test(cmp_buffer, "%pGg", &gfp);
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  508  
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  509  	snprintf(cmp_buffer, BUF_SIZE, "__GFP_ATOMIC|%#lx",
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  510  							(unsigned long) gfp);
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  511  	gfp |= __GFP_ATOMIC;
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  512  	test(cmp_buffer, "%pGg", &gfp);
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  513  
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  514  	kfree(cmp_buffer);
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  515  }
edf14cdbf9a0e5 Vlastimil Babka  2016-03-15  516  

:::::: The code at line 505 was first introduced by commit
:::::: edf14cdbf9a0e5ab52698ca66d07a76ade0d5c46 mm, printk: introduce new format string for flags

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
