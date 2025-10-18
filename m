Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7A124886E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 17:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760808635; cv=none; b=PZcj6lv5Go6oN3ip8L/bTK+CdFNkSzdKOdJVade/WVGT33WTCM6kdGqFLB9NZ7j9AKaHfH9a5WVPWFi6xOaQtLJ4gcXy0P4psbQtO/D7OMkKiCx4EC0CAqmLmas1Z337rorSvxB2pTOIibtuCVTFlUXQi1Y9tIG171G83gJtaxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760808635; c=relaxed/simple;
	bh=cG5n7mLEmJWWWMypkPd1ohYT03IzsAqJyhpDT5hjT10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Snlg9/j49+osShl73IBARDaUy6Pcy9qoyPGzowWCmqH02o5S5U7CpcPt9hLHm2ikN07JpZwHdDaByGeB4NBUgtUstQndZcfb8/bID0MnhQ2uADJriM7kXS+eHcOASqESBkFXfFpKqF34/ba0weQ8cDOp4UtgF2Fa1tn4Sc/t/wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0ULearJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0ULearJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760808632; x=1792344632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cG5n7mLEmJWWWMypkPd1ohYT03IzsAqJyhpDT5hjT10=;
  b=H0ULearJoAW2VUw7Xtfw6yK4iifFFrcJcj00KWDFHzMI59oSVm9MMsw+
   upPpm/YWoQpkG0Ej11Tth7wr2eiknPPzaRykf/If+RTK28sbdPfo0sanX
   Yve4WLqe3NkD6IvAqioZpbVB7dx/Lpx38XJz0jsg5UlWbdEOCmQXZFhvN
   aox6Qn0n1xDA04WQQS4D3wDdzIGV/Ovtb45744jRBEFZYNhEB01rgp6V0
   t2n4nKc9uDLm2iteOJ+CouhkEKFrVeBKLc9fNvAyM700Q14rbQMZIFwzJ
   K6qTALiUyFo6H2IoMPLmbKH6+K9xnL0B5BLpBqKwsQLLpcsy6D9cZRbip
   w==;
X-CSE-ConnectionGUID: WFoFSOe7Q3StOm+GKPS/Fg==
X-CSE-MsgGUID: zHAtzMh6SIi2wUD7rGxAgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80624291"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="80624291"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 10:30:32 -0700
X-CSE-ConnectionGUID: m6MrHUl0TJmIskN6FQ+reQ==
X-CSE-MsgGUID: 2wIb3v9VQ8K8JBcn/Ed4iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="183473752"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Oct 2025 10:30:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAAlA-0008Sr-1v;
	Sat, 18 Oct 2025 17:30:28 +0000
Date: Sun, 19 Oct 2025 01:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Laibin Qiu <qiulaibin@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/page_alloc.c:3684:54:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202510190105.Ksp4uNzL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e98deea13d81cacd6479edf0de6267118ae7c639
commit: 9b6c51cd780588813c5d327e2a6d677d010a2b6f [1740/1740] mm: fix zoneref mapping problem in memory reliable
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20251019/202510190105.Ksp4uNzL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510190105.Ksp4uNzL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510190105.Ksp4uNzL-lkp@intel.com/

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
