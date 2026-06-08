Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5030E2E1EE0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jun 2026 03:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888741; cv=none; b=JZEk4272pYt2m9nHV7cU7xTgsM5In38929xOH+9CPjk2r8gVNLiOjTiBU/WLggw7JXeFhaAEl7ClGPa2JkUZPZI7QPRHi0vJZBbQrGeVp0eZYVFRea7h35jLNYotECHwNWopg0MO6Wfa4RMt7vOF5HHLiviB2wfxMvxDQzjzP/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888741; c=relaxed/simple;
	bh=RUUJTtyCni/ePuv33E/2tFZWOXkpAKWHxZNEE7bWTAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cgz8Am3oxEdtrrCrC76oOOOt9Qv9EoTrCfB5rQNk2YsVUsVdlW8/ZUXFyiFA927wMvVAyvnbndtli11n7k7P5SPfGUrjYouz3CBskFhyCLguxG6itIqLo8ZGmjWCAq7hCMZ/AAqSFVhqJlep4zEd5a+7/Nzsw8hCoP1C4ztxPXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFxJ3ye7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFxJ3ye7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780888739; x=1812424739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RUUJTtyCni/ePuv33E/2tFZWOXkpAKWHxZNEE7bWTAU=;
  b=NFxJ3ye7BgBjjA9WZwPzH1uuY387q8VYyYMW0rzzb4Etzs274BVTWO0F
   LMlTwF3zBNfX1pSCnql0TMGlrd6/7BFvz9efGQaZRJi/1NpSXsrjBdpTi
   9hkOAK4u9rNfGHgThaTmmFPpDv5tumegqSQsE5n8oVEAxOwgumOtCXUuH
   kejgJRi7Yu0w3Rvst5vwtB0MmZmAMBGc61vP0P+WMyKrf9FnQjeR3Byiw
   pzMwgEvr7HYVdTjeEhprd1SHrzIBq31LwQrtqY4u/lsKF37D8G3hup2fg
   zS40kSmaxA7g4zYKN2ds21pgcAfk6vcAKD2uGkFBzDciR6YcZuZtUtwxn
   w==;
X-CSE-ConnectionGUID: QvORU4XiRKWx92WNLPmkHA==
X-CSE-MsgGUID: 5P5a80c8TcCNbealQq4p2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93105361"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="93105361"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 20:18:58 -0700
X-CSE-ConnectionGUID: NJdzsv5HSw2ham0VD0FZzA==
X-CSE-MsgGUID: eM+0rSJER/ezEhuRhUZw7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="240971516"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Jun 2026 20:18:56 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWQVq-000000003B3-2yEM;
	Mon, 08 Jun 2026 03:18:54 +0000
Date: Mon, 8 Jun 2026 05:18:03 +0200
From: kernel test robot <lkp@intel.com>
To: yahia <yahia.a.abdrabou@gmail.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, david@kernel.org, ziy@nvidia.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	yahia <yahia.a.abdrabou@gmail.com>
Subject: Re: [PATCH] mm/migrate: Add native folio functions
Message-ID: <202606080542.ER5s80Rl-lkp@intel.com>
References: <20260608001251.66847-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608001251.66847-1-yahia.a.abdrabou@gmail.com>

Hi yahia,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/yahia/mm-migrate-Add-native-folio-functions/20260608-081741
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260608001251.66847-1-yahia.a.abdrabou%40gmail.com
patch subject: [PATCH] mm/migrate: Add native folio functions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260608/202606080542.ER5s80Rl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260608/202606080542.ER5s80Rl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606080542.ER5s80Rl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:23:
>> include/linux/page-flags.h:1113:1: error: use of undeclared identifier 'PG_MovableOpsIsolated'; did you mean 'PG_movable_ops_isolated'?
    1113 | FOLIO_TEST_FLAG(MovableOpsIsolated, movable_ops_isolated)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:412:19: note: expanded from macro 'FOLIO_TEST_FLAG'
     412 | { return test_bit(PG_##name, const_folio_flags(folio, page)); }
         |                   ^~~~~~~~~
   <scratch space>:185:1: note: expanded from here
     185 | PG_MovableOpsIsolated
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:172:2: note: 'PG_movable_ops_isolated' declared here
     172 |         PG_movable_ops_isolated = PG_reclaim,
         |         ^
>> include/linux/page-flags.h:1113:37: error: use of undeclared identifier 'movable_ops_isolated'; did you mean 'PG_movable_ops_isolated'?
    1113 | FOLIO_TEST_FLAG(MovableOpsIsolated, movable_ops_isolated)
         |                                     ^~~~~~~~~~~~~~~~~~~~
         |                                     PG_movable_ops_isolated
   include/linux/page-flags.h:412:55: note: expanded from macro 'FOLIO_TEST_FLAG'
     412 | { return test_bit(PG_##name, const_folio_flags(folio, page)); }
         |                                                       ^~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:44:37: note: expanded from macro 'bitop'
      44 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/page-flags.h:172:2: note: 'PG_movable_ops_isolated' declared here
     172 |         PG_movable_ops_isolated = PG_reclaim,
         |         ^
>> include/linux/page-flags.h:1113:37: error: use of undeclared identifier 'movable_ops_isolated'; did you mean 'PG_movable_ops_isolated'?
    1113 | FOLIO_TEST_FLAG(MovableOpsIsolated, movable_ops_isolated)
         |                                     ^~~~~~~~~~~~~~~~~~~~
         |                                     PG_movable_ops_isolated
   include/linux/page-flags.h:412:55: note: expanded from macro 'FOLIO_TEST_FLAG'
     412 | { return test_bit(PG_##name, const_folio_flags(folio, page)); }
         |                                                       ^~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:45:16: note: expanded from macro 'bitop'
      45 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   include/linux/page-flags.h:172:2: note: 'PG_movable_ops_isolated' declared here
     172 |         PG_movable_ops_isolated = PG_reclaim,
         |         ^
>> include/linux/page-flags.h:1113:37: error: use of undeclared identifier 'movable_ops_isolated'; did you mean 'PG_movable_ops_isolated'?
    1113 | FOLIO_TEST_FLAG(MovableOpsIsolated, movable_ops_isolated)
         |                                     ^~~~~~~~~~~~~~~~~~~~
         |                                     PG_movable_ops_isolated
   include/linux/page-flags.h:412:55: note: expanded from macro 'FOLIO_TEST_FLAG'
     412 | { return test_bit(PG_##name, const_folio_flags(folio, page)); }
         |                                                       ^~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:46:50: note: expanded from macro 'bitop'
      46 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   include/linux/page-flags.h:172:2: note: 'PG_movable_ops_isolated' declared here
     172 |         PG_movable_ops_isolated = PG_reclaim,
         |         ^
>> include/linux/page-flags.h:1113:1: error: use of undeclared identifier 'PG_MovableOpsIsolated'; did you mean 'PG_movable_ops_isolated'?
    1113 | FOLIO_TEST_FLAG(MovableOpsIsolated, movable_ops_isolated)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:412:19: note: expanded from macro 'FOLIO_TEST_FLAG'
     412 | { return test_bit(PG_##name, const_folio_flags(folio, page)); }
         |                   ^~~~~~~~~
   <scratch space>:185:1: note: expanded from here
     185 | PG_MovableOpsIsolated
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:172:2: note: 'PG_movable_ops_isolated' declared here
     172 |         PG_movable_ops_isolated = PG_reclaim,
         |         ^
>> include/linux/page-flags.h:1113:37: error: use of undeclared identifier 'movable_ops_isolated'; did you mean 'PG_movable_ops_isolated'?
    1113 | FOLIO_TEST_FLAG(MovableOpsIsolated, movable_ops_isolated)
         |                                     ^~~~~~~~~~~~~~~~~~~~
         |                                     PG_movable_ops_isolated
   include/linux/page-flags.h:412:55: note: expanded from macro 'FOLIO_TEST_FLAG'
     412 | { return test_bit(PG_##name, const_folio_flags(folio, page)); }
         |                                                       ^~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:47:17: note: expanded from macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   include/linux/page-flags.h:172:2: note: 'PG_movable_ops_isolated' declared here
     172 |         PG_movable_ops_isolated = PG_reclaim,
         |         ^
>> include/linux/page-flags.h:1113:1: error: use of undeclared identifier 'PG_MovableOpsIsolated'; did you mean 'PG_movable_ops_isolated'?
    1113 | FOLIO_TEST_FLAG(MovableOpsIsolated, movable_ops_isolated)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:412:19: note: expanded from macro 'FOLIO_TEST_FLAG'
     412 | { return test_bit(PG_##name, const_folio_flags(folio, page)); }
         |                   ^~~~~~~~~
   <scratch space>:185:1: note: expanded from here
     185 | PG_MovableOpsIsolated
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:172:2: note: 'PG_movable_ops_isolated' declared here
     172 |         PG_movable_ops_isolated = PG_reclaim,
         |         ^
>> include/linux/page-flags.h:1113:37: error: use of undeclared identifier 'movable_ops_isolated'; did you mean 'PG_movable_ops_isolated'?
    1113 | FOLIO_TEST_FLAG(MovableOpsIsolated, movable_ops_isolated)
         |                                     ^~~~~~~~~~~~~~~~~~~~
         |                                     PG_movable_ops_isolated
   include/linux/page-flags.h:412:55: note: expanded from macro 'FOLIO_TEST_FLAG'
     412 | { return test_bit(PG_##name, const_folio_flags(folio, page)); }
         |                                                       ^~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:47:32: note: expanded from macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   include/linux/page-flags.h:172:2: note: 'PG_movable_ops_isolated' declared here
     172 |         PG_movable_ops_isolated = PG_reclaim,
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^


vim +1113 include/linux/page-flags.h

  1093	
  1094	#ifdef CONFIG_MIGRATION
  1095	/*
  1096	 * This page is migratable through movable_ops (for selected typed pages
  1097	 * only).
  1098	 *
  1099	 * Page migration of such pages might fail, for example, if the page is
  1100	 * already isolated by somebody else, or if the page is about to get freed.
  1101	 *
  1102	 * While a subsystem might set selected typed pages that support page migration
  1103	 * as being movable through movable_ops, it must never clear this flag.
  1104	 *
  1105	 * This flag is only cleared when the page is freed back to the buddy.
  1106	 *
  1107	 * Only selected page types support this flag (see page_movable_ops()) and
  1108	 * the flag might be used in other context for other pages. Always use
  1109	 * page_has_movable_ops() instead.
  1110	 */
  1111	TESTPAGEFLAG(MovableOps, movable_ops, PF_NO_TAIL);
  1112	SETPAGEFLAG(MovableOps, movable_ops, PF_NO_TAIL);
> 1113	FOLIO_TEST_FLAG(MovableOpsIsolated, movable_ops_isolated)
  1114	/*
  1115	 * A movable_ops page has this flag set while it is isolated for migration.
  1116	 * This flag primarily protects against concurrent migration attempts.
  1117	 *
  1118	 * Once migration ended (success or failure), the flag is cleared. The
  1119	 * flag is managed by the migration core.
  1120	 */
  1121	PAGEFLAG(MovableOpsIsolated, movable_ops_isolated, PF_NO_TAIL);
  1122	#else /* !CONFIG_MIGRATION */
  1123	TESTPAGEFLAG_FALSE(MovableOps, movable_ops);
  1124	SETPAGEFLAG_NOOP(MovableOps, movable_ops);
  1125	PAGEFLAG_FALSE(MovableOpsIsolated, movable_ops_isolated);
  1126	#endif /* CONFIG_MIGRATION */
  1127	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
