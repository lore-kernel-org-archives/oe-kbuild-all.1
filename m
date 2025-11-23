Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEBD15E5BB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763893463; cv=none; b=GhK2OaoN1CtsYystpNvNl21ExuaN32fR/iu5GFNymC79iuNcWUtp87tPJDhlystkzNAns5AIcCj7wONVIQO4+EdkCE92t3p96CnUHPv3Tohwxk+rmKFrUSmQ4rGRHgzUmzrFRVsg1rcZbXM2sYuy8H88w4NX7Tvw0gPkwz6e6uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763893463; c=relaxed/simple;
	bh=csjopn6ov896oScY/qM1P8mPwTeXjM1YsHS9UkeBRSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RdyGUin3BsCb/s9DoBTOZwkEJFP2TdVcMINFV4Bber0BmMr7quTwjMaume6FkIGa7y+HPdvjQUyHrQ1cr1gJEeVX1vIihRcMWQg2KuUwdEBPpDrZbAfbmSL8FX01QZcUgkvhFvBkRdTp+gInXpJXrzAMJIg/uurbqMY5yvJwys8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBfSp0dt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBfSp0dt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763893461; x=1795429461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=csjopn6ov896oScY/qM1P8mPwTeXjM1YsHS9UkeBRSQ=;
  b=eBfSp0dtq9rfPpVhbVpAxn1M/B408pi/yFYUMVEVv1N84NxTBEkCRnwZ
   9adeOhUSJgkolS2cu/ejPWYBFUzhcOT92ZdIjO3+wtPmD7GQZSRTwSPGY
   fhVNwiado7U3IEweh+G+hNAiY/zAWKMy3Hpm5Ms/V2dTx698WQ024bn2x
   bEETJSI0SgPTtSdLF533vtNUABzOM9aFMD8oWtZxVntMNc2dGFL5ecgCR
   kpz1NSdtGzsQOgWRJf3pULRSjJahOuC+8hNVuaeSJ2ttbG4zak7liGt5N
   jwHrzfa+VnR6oL1tr1BJZZkhpyE6bDE9tXv2kmt+Aj1Z+T0jxDNdovj6Q
   A==;
X-CSE-ConnectionGUID: E5hKDxyDTWSdLSHeCAeYkw==
X-CSE-MsgGUID: rt8Dhkr7S4ix/KsAs1znEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="88574503"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="88574503"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 02:24:21 -0800
X-CSE-ConnectionGUID: t1Fv66QwTECh3eAtIXlu0A==
X-CSE-MsgGUID: UYkoKrEUT7+82muahMxmzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="192545315"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Nov 2025 02:24:18 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN7GS-0008D3-1x;
	Sun, 23 Nov 2025 10:24:16 +0000
Date: Sun, 23 Nov 2025 18:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Laibin Qiu <qiulaibin@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/page_alloc.c:3684:54:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202511231858.zGXZmmUs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6c5657aecca1857be6ea39f789159c9acfde2f9e
commit: 9b6c51cd780588813c5d327e2a6d677d010a2b6f [1740/1740] mm: fix zoneref mapping problem in memory reliable
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20251123/202511231858.zGXZmmUs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231858.zGXZmmUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231858.zGXZmmUs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:140:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/mem_reliable.h:68:15: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:4656:13: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:4661:35: sparse: sparse: invalid assignment: |=
   mm/page_alloc.c:4661:35: sparse:    left side has type restricted gfp_t
   mm/page_alloc.c:4661:35: sparse:    right side has type unsigned int
   mm/page_alloc.c:4677:35: sparse: sparse: invalid assignment: |=
   mm/page_alloc.c:4677:35: sparse:    left side has type restricted gfp_t
   mm/page_alloc.c:4677:35: sparse:    right side has type unsigned int
   mm/page_alloc.c:4683:35: sparse: sparse: invalid assignment: |=
   mm/page_alloc.c:4683:35: sparse:    left side has type restricted gfp_t
   mm/page_alloc.c:4683:35: sparse:    right side has type unsigned int
   mm/page_alloc.c:4698:35: sparse: sparse: invalid assignment: |=
   mm/page_alloc.c:4698:35: sparse:    left side has type restricted gfp_t
   mm/page_alloc.c:4698:35: sparse:    right side has type unsigned int
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:324:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:324:27: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:3683:14: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:3684:45: sparse: sparse: restricted gfp_t degrades to integer
>> mm/page_alloc.c:3684:54: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned int @@
   mm/page_alloc.c:3684:54: sparse:     expected restricted gfp_t [usertype] flags
   mm/page_alloc.c:3684:54: sparse:     got unsigned int
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:3701:14: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c: In function 'mem_init_print_info':
   mm/page_alloc.c:7512:27: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 36-      |                           ^~
   mm/page_alloc.c:7516:9: note: in expansion of macro 'adj_init_size'
    7516 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:27: note: use '&__init_begin[0] <= &_sinittext[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 42-      |                           ^~
   mm/page_alloc.c:7516:9: note: in expansion of macro 'adj_init_size'
    7516 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 48-      |                                         ^
   mm/page_alloc.c:7516:9: note: in expansion of macro 'adj_init_size'
    7516 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: note: use '&_sinittext[0] < &__init_end[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 54-      |                                         ^
   mm/page_alloc.c:7516:9: note: in expansion of macro 'adj_init_size'
    7516 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:27: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 60-      |                           ^~
   mm/page_alloc.c:7518:9: note: in expansion of macro 'adj_init_size'
    7518 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 66-      |                           ^~
   mm/page_alloc.c:7518:9: note: in expansion of macro 'adj_init_size'
    7518 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 72-      |                                         ^
   mm/page_alloc.c:7518:9: note: in expansion of macro 'adj_init_size'
    7518 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 78-      |                                         ^
   mm/page_alloc.c:7518:9: note: in expansion of macro 'adj_init_size'
    7518 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:27: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 84-      |                           ^~
   mm/page_alloc.c:7519:9: note: in expansion of macro 'adj_init_size'
    7519 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 90-      |                           ^~
   mm/page_alloc.c:7519:9: note: in expansion of macro 'adj_init_size'
    7519 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 96-      |                                         ^
   mm/page_alloc.c:7519:9: note: in expansion of macro 'adj_init_size'
    7519 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: note: use '&__init_begin[0] < &_edata[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 102-      |                                         ^
   mm/page_alloc.c:7519:9: note: in expansion of macro 'adj_init_size'
    7519 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:27: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 108-      |                           ^~
   mm/page_alloc.c:7520:9: note: in expansion of macro 'adj_init_size'
    7520 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:27: note: use '&_stext[0] <= &__start_rodata[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 114-      |                           ^~
   mm/page_alloc.c:7520:9: note: in expansion of macro 'adj_init_size'
    7520 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 120-      |                                         ^
   mm/page_alloc.c:7520:9: note: in expansion of macro 'adj_init_size'
    7520 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: note: use '&__start_rodata[0] < &_etext[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 126-      |                                         ^

vim +3684 mm/page_alloc.c

  3673	
  3674	#ifdef CONFIG_MEMORY_RELIABLE
  3675	static inline void reliable_fb_find_zone(gfp_t gfp_mask,
  3676						 struct alloc_context *ac)
  3677	{
  3678		if (!reliable_allow_fb_enabled())
  3679			return;
  3680	
  3681		/* dst node don't have zone we want, fallback here */
  3682		if ((gfp_mask & __GFP_THISNODE) && (ac->high_zoneidx == ZONE_NORMAL) &&
  3683		    (gfp_mask & ___GFP_RELIABILITY)) {
> 3684			ac->high_zoneidx = gfp_zone(gfp_mask & ~___GFP_RELIABILITY);
  3685			ac->preferred_zoneref = first_zones_zonelist(
  3686				ac->zonelist, ac->high_zoneidx, ac->nodemask);
  3687		}
  3688	
  3689		return;
  3690	}
  3691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
