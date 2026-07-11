Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46CB1A682A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 02:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783737467; cv=none; b=aeWdJBrhlLNgW2l1KOLHEWFHMAXlBneatBuXJSjVKcSkIXpheR48jPXsg1gArIGBXVn9OVTH3tVP0CR6Gb7ulAThcBdxQpW+ZAUnqcZ1Ls09Y1hYOIPEnEKBwyY35VEzRkRokiENmaMGyrmEnHok7inqctLoZIrjTFhNrlrsMCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783737467; c=relaxed/simple;
	bh=Yx3/HPDXz71CdzQ8WirtqsYe/LAsV7CitW9sBWxvk2s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aGFB32OyG7oQNg+35F57g6yt7LJOuj37uhmm5j953hq3GTXn9Axapvxun9v8WZ8oUOo6acMfgXKxRs+/RVbFc/qiFnsGQyl6hiCFfOFaHRQ0w840mzxQauGl7hhkr7ukadC3fIAslLoPzwtEB7sIidsZOidzIXl+fKjH6ja+gds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5CbC904; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5CbC904"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783737465; x=1815273465;
  h=date:from:to:cc:subject:message-id;
  bh=Yx3/HPDXz71CdzQ8WirtqsYe/LAsV7CitW9sBWxvk2s=;
  b=R5CbC904GmCkFm9oV0+GaktQ3IfDbB6ReSzb8hrQwHr9x2W+q7Iw9Yyu
   9UN+7mic1XWyGFxlX/emjgGGSDVRiApiytBTQptf65ees9Y8Aa91KBhaE
   Cxmr+dWD46/oGULpXIWg65HLc7mBVivba5t7FUTfC11oOEgxsFWbctRz1
   2xLqDXqfNN6IbStNOfEPilW6UUtLGAlcSVtTpsMHiqvLhLa65GEDCpAP9
   lJmXNH8sfxhmIiG5R6tHJ6tkYyL86XFhzsvjv1lLIwf+Q/0Kit5P0DSKs
   6swehlsnkdXOpe+EK2wZ2ZU7VXO4hLsWldobc/0EeETMNGwboK7RvyiSC
   g==;
X-CSE-ConnectionGUID: LNcQ+G+lS7uVWF39qyU0Mg==
X-CSE-MsgGUID: dTcvuCr4RfSvjKIEUs+Vcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83414416"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83414416"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 19:37:44 -0700
X-CSE-ConnectionGUID: UenDjx9GSGKoUH5k0bGeVw==
X-CSE-MsgGUID: mdKf16tZQvG/Fst+hR2Jqw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jul 2026 19:37:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiNb2-00000000Jf2-2bVP;
	Sat, 11 Jul 2026 02:37:40 +0000
Date: Sat, 11 Jul 2026 10:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: SJ Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 151/151] mm/damon/vaddr.c:196:13: warning:
 variable 'tidx' set but not used
Message-ID: <202607111055.NqcvApT6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   b617f1f8428697a2583fb6882864224d59a91bf2
commit: b617f1f8428697a2583fb6882864224d59a91bf2 [151/151] mm/damon/vaddr: remove debug message
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260711/202607111055.NqcvApT6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607111055.NqcvApT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607111055.NqcvApT6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/damon/vaddr.c: In function '__damon_va_init_regions':
>> mm/damon/vaddr.c:196:13: warning: variable 'tidx' set but not used [-Wunused-but-set-variable=]
     196 |         int tidx = 0;
         |             ^~~~


vim +/tidx +196 mm/damon/vaddr.c

3f49584b262cf8 SeongJae Park 2021-09-07  148  
3f49584b262cf8 SeongJae Park 2021-09-07  149  /*
3f49584b262cf8 SeongJae Park 2021-09-07  150   * Initialize the monitoring target regions for the given target (task)
3f49584b262cf8 SeongJae Park 2021-09-07  151   *
3f49584b262cf8 SeongJae Park 2021-09-07  152   * t	the given target
3f49584b262cf8 SeongJae Park 2021-09-07  153   *
3f49584b262cf8 SeongJae Park 2021-09-07  154   * Because only a number of small portions of the entire address space
3f49584b262cf8 SeongJae Park 2021-09-07  155   * is actually mapped to the memory and accessed, monitoring the unmapped
3f49584b262cf8 SeongJae Park 2021-09-07  156   * regions is wasteful.  That said, because we can deal with small noises,
3f49584b262cf8 SeongJae Park 2021-09-07  157   * tracking every mapping is not strictly required but could even incur a high
3f49584b262cf8 SeongJae Park 2021-09-07  158   * overhead if the mapping frequently changes or the number of mappings is
3f49584b262cf8 SeongJae Park 2021-09-07  159   * high.  The adaptive regions adjustment mechanism will further help to deal
3f49584b262cf8 SeongJae Park 2021-09-07  160   * with the noise by simply identifying the unmapped areas as a region that
3f49584b262cf8 SeongJae Park 2021-09-07  161   * has no access.  Moreover, applying the real mappings that would have many
3f49584b262cf8 SeongJae Park 2021-09-07  162   * unmapped areas inside will make the adaptive mechanism quite complex.  That
3f49584b262cf8 SeongJae Park 2021-09-07  163   * said, too huge unmapped areas inside the monitoring target should be removed
3f49584b262cf8 SeongJae Park 2021-09-07  164   * to not take the time for the adaptive mechanism.
3f49584b262cf8 SeongJae Park 2021-09-07  165   *
3f49584b262cf8 SeongJae Park 2021-09-07  166   * For the reason, we convert the complex mappings to three distinct regions
3f49584b262cf8 SeongJae Park 2021-09-07  167   * that cover every mapped area of the address space.  Also the two gaps
3f49584b262cf8 SeongJae Park 2021-09-07  168   * between the three regions are the two biggest unmapped areas in the given
3f49584b262cf8 SeongJae Park 2021-09-07  169   * address space.  In detail, this function first identifies the start and the
3f49584b262cf8 SeongJae Park 2021-09-07  170   * end of the mappings and the two biggest unmapped areas of the address space.
3f49584b262cf8 SeongJae Park 2021-09-07  171   * Then, it constructs the three regions as below:
3f49584b262cf8 SeongJae Park 2021-09-07  172   *
3f49584b262cf8 SeongJae Park 2021-09-07  173   *     [mappings[0]->start, big_two_unmapped_areas[0]->start)
3f49584b262cf8 SeongJae Park 2021-09-07  174   *     [big_two_unmapped_areas[0]->end, big_two_unmapped_areas[1]->start)
3f49584b262cf8 SeongJae Park 2021-09-07  175   *     [big_two_unmapped_areas[1]->end, mappings[nr_mappings - 1]->end)
3f49584b262cf8 SeongJae Park 2021-09-07  176   *
3f49584b262cf8 SeongJae Park 2021-09-07  177   * As usual memory map of processes is as below, the gap between the heap and
3f49584b262cf8 SeongJae Park 2021-09-07  178   * the uppermost mmap()-ed region, and the gap between the lowermost mmap()-ed
3f49584b262cf8 SeongJae Park 2021-09-07  179   * region and the stack will be two biggest unmapped regions.  Because these
3f49584b262cf8 SeongJae Park 2021-09-07  180   * gaps are exceptionally huge areas in usual address space, excluding these
3f49584b262cf8 SeongJae Park 2021-09-07  181   * two biggest unmapped regions will be sufficient to make a trade-off.
3f49584b262cf8 SeongJae Park 2021-09-07  182   *
3f49584b262cf8 SeongJae Park 2021-09-07  183   *   <heap>
3f49584b262cf8 SeongJae Park 2021-09-07  184   *   <BIG UNMAPPED REGION 1>
3f49584b262cf8 SeongJae Park 2021-09-07  185   *   <uppermost mmap()-ed region>
3f49584b262cf8 SeongJae Park 2021-09-07  186   *   (other mmap()-ed regions and small unmapped regions)
3f49584b262cf8 SeongJae Park 2021-09-07  187   *   <lowermost mmap()-ed region>
3f49584b262cf8 SeongJae Park 2021-09-07  188   *   <BIG UNMAPPED REGION 2>
3f49584b262cf8 SeongJae Park 2021-09-07  189   *   <stack>
3f49584b262cf8 SeongJae Park 2021-09-07  190   */
3f49584b262cf8 SeongJae Park 2021-09-07  191  static void __damon_va_init_regions(struct damon_ctx *ctx,
3f49584b262cf8 SeongJae Park 2021-09-07  192  				     struct damon_target *t)
3f49584b262cf8 SeongJae Park 2021-09-07  193  {
962fe7a6b1b2f9 SJ Park       2022-01-14  194  	struct damon_target *ti;
3f49584b262cf8 SeongJae Park 2021-09-07  195  	struct damon_addr_range regions[3];
442d87c7db9e9e SJ Park       2026-02-28 @196  	int tidx = 0;
3f49584b262cf8 SeongJae Park 2021-09-07  197  
3f49584b262cf8 SeongJae Park 2021-09-07  198  	if (damon_va_three_regions(t, regions)) {
962fe7a6b1b2f9 SJ Park       2022-01-14  199  		damon_for_each_target(ti, ctx) {
962fe7a6b1b2f9 SJ Park       2022-01-14  200  			if (ti == t)
962fe7a6b1b2f9 SJ Park       2022-01-14  201  				break;
962fe7a6b1b2f9 SJ Park       2022-01-14  202  			tidx++;
962fe7a6b1b2f9 SJ Park       2022-01-14  203  		}
3f49584b262cf8 SeongJae Park 2021-09-07  204  		return;
3f49584b262cf8 SeongJae Park 2021-09-07  205  	}
3f49584b262cf8 SeongJae Park 2021-09-07  206  
442d87c7db9e9e SJ Park       2026-02-28  207  	damon_set_regions(t, regions, 3, DAMON_MIN_REGION_SZ);
3f49584b262cf8 SeongJae Park 2021-09-07  208  }
3f49584b262cf8 SeongJae Park 2021-09-07  209  

:::::: The code at line 196 was first introduced by commit
:::::: 442d87c7db9e9e2a569a49d38f404b8b556b8719 mm/damon/vaddr: do not split regions for min_nr_regions

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
