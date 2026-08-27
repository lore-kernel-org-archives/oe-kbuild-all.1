Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9022288D0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 00:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787792379; cv=none; b=V4CvSJJE78fpxb5n1orp88WydxDEWWf1YGGOw6eMYbCxEDMRL/+Y4RVXRXaZo14thNJQYAt/6kF8xPNhX/13M4GEHUH7gmDTV4Nq32zomrtL5glxiPFuDkVyBuzy1ufb5yv4/92AcsT2Vy4iAx7sYKSoZFsa+W1bbSBhfo0UpFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787792379; c=relaxed/simple;
	bh=AKTyA/09d73uFvvrKO+n9Aul1w4mtTgwKUsYIVrWnHk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OaMOyc3c09GvUEYbUcdxbtIohyV+swyJbKpbXmHvyoH+KopT6P6u6j+SaN54hBT7I5Q0UYwgoL8QSKSLcITcut/QS0oQQ9xyGcjqtYKDNww9m4ORK5YV3quO4KjBCyXEtdpB0ZzCEz8vGKvWJUtZTG3BpFUFD4d6d4mkvbSrfSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWPqeLWO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWPqeLWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787792378; x=1819328378;
  h=date:from:to:cc:subject:message-id;
  bh=AKTyA/09d73uFvvrKO+n9Aul1w4mtTgwKUsYIVrWnHk=;
  b=iWPqeLWOumJIVzR46kaIXgmw8OuzXsc9ygz9NKmSgNNBKTJM8qy2DrlM
   2H+75h1CTaa/P4yE1BO6DjbA3IYoH0AIWMzU5dPBnevnDsr0txCpm4NRN
   kXnTb2pVWb0N2BT+QH9eRPO5kzT3DGjIiD8hfufjt0RP/P7cWrmgxp6bL
   aNh9I6jJIz8Qov08aPZmf/ucm8KwrsmFGOWLgL1B1uKvZpg766E6zfeXt
   lXF1vV7syCX5Zu72EoYoFUqex8lO0uQoE3ZWuzXAFCyf3sA+GYoe07+/N
   4X5sbp5cI0TOvdKyTGJb/ljTpHa1TRlmWa8+x0Eo4jeCzfXhsAFVjImk6
   g==;
X-CSE-ConnectionGUID: 2eD95wfaTmG3RyolS/JGVA==
X-CSE-MsgGUID: LdN0I8wRS5KrXcCVchnIfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87422598"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="87422598"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:59:37 -0700
X-CSE-ConnectionGUID: AF0+ZcSQRi+63OoWBCqP0g==
X-CSE-MsgGUID: nGJvHrzKR92QlVQSvMJRog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="261584645"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Aug 2026 17:59:36 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzOSr-000000008jV-1zim;
	Thu, 27 Aug 2026 00:59:33 +0000
Date: Thu, 27 Aug 2026 08:58:37 +0800
From: kernel test robot <lkp@intel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "David Hildenbrand (Arm)" <david@kernel.org>
Subject: [davidhildenbrand:get_dummy 14/21]
 include/linux/pgtable.h:2351:13: error: implicit declaration of function
 'mm_pmd_folded'
Message-ID: <202608270845.raYtE0vt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yeoreum,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/davidhildenbrand/linux get_dummy
head:   112a153a97494becabd764fe6257578ba908801f
commit: db92928e80f5332bbfca9a70beaef62d46a0c9de [14/21] x86: mm: carve out the generic compile-time folded pgtable case in effective_prot()
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260827/202608270845.raYtE0vt-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608270845.raYtE0vt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608270845.raYtE0vt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:31,
                    from include/linux/cpuset.h:17,
                    from kernel/sched/sched.h:33,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/pgtable.h: In function 'mm_first_pgtable_level':
>> include/linux/pgtable.h:2351:13: error: implicit declaration of function 'mm_pmd_folded' [-Wimplicit-function-declaration]
    2351 |         if (mm_pmd_folded(mm))
         |             ^~~~~~~~~~~~~
>> include/linux/pgtable.h:2353:13: error: implicit declaration of function 'mm_pud_folded' [-Wimplicit-function-declaration]
    2353 |         if (mm_pud_folded(mm))
         |             ^~~~~~~~~~~~~
>> include/linux/pgtable.h:2355:13: error: implicit declaration of function 'mm_p4d_folded' [-Wimplicit-function-declaration]
    2355 |         if (mm_p4d_folded(mm))
         |             ^~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1410: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/mm_pmd_folded +2351 include/linux/pgtable.h

  2331	
  2332	/**
  2333	 * mm_first_pgtable_level - return the first non-folded page-table level
  2334	 * @mm: The mm structure.
  2335	 *
  2336	 * With runtime- or compile-time folded page tables, page-table walkers
  2337	 * effectively skip the folded top-level page tables, treating them as
  2338	 * always-present entries pointing to the next lower-level page table.
  2339	 *
  2340	 * Return the first page-table level in @mm that is not folded.
  2341	 *
  2342	 * Return: the first non-folded page-table level.
  2343	 */
  2344	static inline enum pgtable_level mm_first_pgtable_level(struct mm_struct *mm)
  2345	{
  2346		/*
  2347		 * "PMD folded" actually means "PMD is folded into PUD", and
  2348		 * pud_present() etc. are hard-coded to look like present page table
  2349		 * levels, whereby pmd_present() etc. contain real logic.
  2350		 */
> 2351		if (mm_pmd_folded(mm))
  2352			return PGTABLE_LEVEL_PMD;
> 2353		if (mm_pud_folded(mm))
  2354			return PGTABLE_LEVEL_PUD;
> 2355		if (mm_p4d_folded(mm))
  2356			return PGTABLE_LEVEL_P4D;
  2357		return PGTABLE_LEVEL_PGD;
  2358	}
  2359	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
