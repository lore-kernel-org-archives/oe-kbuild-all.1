Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3953E2F12AC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 13:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787059109; cv=none; b=bFpVdrE/VtLAoqL1vLxBcU/mpxVD7qfIMD5UjUdAEPj9PYNw7Y5KfGlUE6++vqsKaOiL3PUZc2z0B6CHwqaBzz+UG4xv+Mrfm2JTOyc9VPoOfr5ymbjeONeVwol/e7s5+Sv/4boZEimYW0cn+P1zMaOu+/9nE0ZUXRPabq0QTaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787059109; c=relaxed/simple;
	bh=h+ASz1Sxk4tkZxxV0S0Na4ZRPxYEdCspVR8Q45UYrjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lxe+FeekcEFHwr/s69X2Zawzg4y5vhC1DudLEnWtrxbCm1PtVSIN0TMOo+5VXFiNAk/TQd5nU4AL7exh88lq0/kwhcb6xtxPCVPuMwJoU8gn94v6P5CboAlYbgjF3drgP35wfLyWGsoDwMM1dQgdJE1eddR8cj7qaVx40etOklk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzx40j8m; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzx40j8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787059107; x=1818595107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h+ASz1Sxk4tkZxxV0S0Na4ZRPxYEdCspVR8Q45UYrjo=;
  b=bzx40j8me5OzqCYpo/b+cEpmE0MuE/tWcFXvjz8S/vnBVTIaXfB/tLn7
   LN9cYrjzU1RLKTi1IuU6+q8IozE+jp5JOOj9X17b/nyQvDmycYt0/VXbc
   Gje76DfeHFNPj6QpipJKa8B3oOtf2YseqAgy7cbIaVWXyrpA4TTMMXBvG
   rVMT3RKJpqSsZ9nM/JoBY5OmcG2dVp7kSRLehLtdSnMAmiIplWE3EVliV
   ESARacPpdYfk1Z+Fmrb0xEBuSLGRfZlJtab/5Og3BFacyTjj139tEgq5R
   Df60jKQB9BCO7lO49Hp9PrdMGvSpdMZc1yyJ6ylrKRsXO0jNuIj1/hxCB
   w==;
X-CSE-ConnectionGUID: 8fiEIUtERd+1Fgi73CqXHA==
X-CSE-MsgGUID: 83sTG1ceRPeRpYrdjR/U+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="91420835"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="91420835"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 06:18:27 -0700
X-CSE-ConnectionGUID: 2mGobLqFQgu+pdioQWOETg==
X-CSE-MsgGUID: akixx5CLQh6qbQtpDnczug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="265836311"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Aug 2026 06:18:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwJhu-00000000eLO-3PDk;
	Tue, 18 Aug 2026 13:18:22 +0000
Date: Tue, 18 Aug 2026 21:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v2-lockdep 14/21]
 kernel/locking/lockdep.c:6776:2: error: 'bootstrap_stack_trace' undeclared;
 did you mean 'save_stack_trace'?
Message-ID: <202608182137.3ygq0RhO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git folio-pool-v2-lockdep
head:   e77ee8289ea0755b0ee299348504d4568f942d71
commit: 198cb0234063750d4125d2f5b3fd29f373fba200 [14/21] locking/lockdep: Migrate and compact stack trace entries into folio_scratchpad
config: sparc64-randconfig-001-20260818 (https://download.01.org/0day-ci/archive/20260818/202608182137.3ygq0RhO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608182137.3ygq0RhO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608182137.3ygq0RhO-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/locking/lockdep.c: In function 'lockdep_init':
>> kernel/locking/lockdep.c:6776:2: error: 'bootstrap_stack_trace' undeclared (first use in this function); did you mean 'save_stack_trace'?
     bootstrap_stack_trace = early_stack_trace;
     ^~~~~~~~~~~~~~~~~~~~~
     save_stack_trace
   kernel/locking/lockdep.c:6776:2: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/locking/lockdep.c:6776:26: error: 'early_stack_trace' undeclared (first use in this function); did you mean 'save_stack_trace'?
     bootstrap_stack_trace = early_stack_trace;
                             ^~~~~~~~~~~~~~~~~
                             save_stack_trace
>> kernel/locking/lockdep.c:6777:2: error: 'bootstrap_stack_trace_in_use' undeclared (first use in this function); did you mean 'bootstrap_entries_in_use'?
     bootstrap_stack_trace_in_use = &early_stack_trace_in_use;
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
     bootstrap_entries_in_use
>> kernel/locking/lockdep.c:6777:34: error: 'early_stack_trace_in_use' undeclared (first use in this function); did you mean 'save_stack_trace_user'?
     bootstrap_stack_trace_in_use = &early_stack_trace_in_use;
                                     ^~~~~~~~~~~~~~~~~~~~~~~~
                                     save_stack_trace_user
   In file included from include/asm-generic/bug.h:31,
                    from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/sparc/include/asm/current.h:15,
                    from include/linux/mutex.h:14,
                    from kernel/locking/lockdep.c:30:
   kernel/locking/lockdep.c: In function 'lockdep_boot_report':
   kernel/locking/lockdep.c:6821:3: error: 'early_stack_trace_in_use' undeclared (first use in this function); did you mean 'save_stack_trace_user'?
      early_stack_trace_in_use,
      ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:483:19: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:584:2: note: in expansion of macro 'printk'
     printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   kernel/locking/lockdep.c:6818:2: note: in expansion of macro 'pr_info'
     pr_info("lockdep: %lu/%lu bootstrap entries, %lu/%lu bootstrap traces used before buddy init, folio_pool active\n",
     ^~~~~~~
>> kernel/locking/lockdep.c:6822:18: error: 'BOOTSTRAP_STACK_TRACE_ENTRIES' undeclared (first use in this function); did you mean 'MAX_STACK_TRACE_ENTRIES'?
      (unsigned long)BOOTSTRAP_STACK_TRACE_ENTRIES);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:483:19: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:584:2: note: in expansion of macro 'printk'
     printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   kernel/locking/lockdep.c:6818:2: note: in expansion of macro 'pr_info'
     pr_info("lockdep: %lu/%lu bootstrap entries, %lu/%lu bootstrap traces used before buddy init, folio_pool active\n",
     ^~~~~~~
   kernel/locking/lockdep.c: In function 'lockdep_compact_boot_graph':
   kernel/locking/lockdep.c:6844:26: error: 'lockdep_trace_scratchpad' undeclared (first use in this function); did you mean 'lockdep_trace_stats'?
     folio_scratchpad_alloc(&lockdep_trace_scratchpad, sizeof(struct lock_trace) + 32 * sizeof(unsigned long),
                             ^~~~~~~~~~~~~~~~~~~~~~~~
                             lockdep_trace_stats
   kernel/locking/lockdep.c:6844:59: error: invalid application of 'sizeof' to incomplete type 'struct lock_trace'
     folio_scratchpad_alloc(&lockdep_trace_scratchpad, sizeof(struct lock_trace) + 32 * sizeof(unsigned long),
                                                              ^~~~~~
   In file included from include/linux/string.h:6,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from kernel/locking/lockdep.c:30:
   kernel/locking/lockdep.c:6854:29: error: 'stack_trace_hash' undeclared (first use in this function); did you mean 'stack_trace_save'?
     for (i = 0; i < ARRAY_SIZE(stack_trace_hash); i++) {
                                ^~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                    ^~~
   In file included from arch/sparc/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/sparc/include/asm/current.h:15,
                    from include/linux/mutex.h:14,
                    from kernel/locking/lockdep.c:30:
   include/linux/compiler.h:200:82: error: expression in static assertion is not an integer
    #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
                                                                                     ^
   include/linux/compiler.h:205:28: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
    #define __must_be_array(a) __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                              ^~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:6854:18: note: in expansion of macro 'ARRAY_SIZE'
     for (i = 0; i < ARRAY_SIZE(stack_trace_hash); i++) {
                     ^~~~~~~~~~
   In file included from include/linux/list.h:5,
                    from include/linux/mutex.h:15,
                    from kernel/locking/lockdep.c:30:
   include/linux/container_of.h:20:17: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     void *__mptr = (void *)(ptr);     \
                    ^
   include/linux/list.h:1183:40: note: in expansion of macro 'container_of'
    #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
                                           ^~~~~~~~~~~~
   include/linux/list.h:1194:15: note: in expansion of macro 'hlist_entry'
        ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
                  ^~~~~~~~~~~
   include/linux/list.h:1235:13: note: in expansion of macro 'hlist_entry_safe'
     for (pos = hlist_entry_safe((head)->first, typeof(*pos), member);\
                ^~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:6858:3: note: in expansion of macro 'hlist_for_each_entry_safe'
      hlist_for_each_entry_safe(trace, n, &stack_trace_hash[i], hash_entry) {
      ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:31,
                    from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/sparc/include/asm/current.h:15,
                    from include/linux/mutex.h:14,
                    from kernel/locking/lockdep.c:30:
   include/linux/container_of.h:21:28: error: invalid type argument of unary '*' (have 'int')
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                               ^~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:21:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:21:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   include/linux/list.h:1183:40: note: in expansion of macro 'container_of'
    #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
                                           ^~~~~~~~~~~~
   include/linux/list.h:1194:15: note: in expansion of macro 'hlist_entry'
        ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
                  ^~~~~~~~~~~
   include/linux/list.h:1235:13: note: in expansion of macro 'hlist_entry_safe'
     for (pos = hlist_entry_safe((head)->first, typeof(*pos), member);\
                ^~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:6858:3: note: in expansion of macro 'hlist_for_each_entry_safe'
      hlist_for_each_entry_safe(trace, n, &stack_trace_hash[i], hash_entry) {


vim +6776 kernel/locking/lockdep.c

  6771	
  6772	void __init lockdep_init(void)
  6773	{
  6774		bootstrap_entries = early_list_entries;
  6775		bootstrap_entries_in_use = early_list_entries_in_use;
> 6776		bootstrap_stack_trace = early_stack_trace;
> 6777		bootstrap_stack_trace_in_use = &early_stack_trace_in_use;
  6778	
  6779		pr_info("Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar\n");
  6780	
  6781		pr_info("... MAX_LOCKDEP_SUBCLASSES:  %lu\n", MAX_LOCKDEP_SUBCLASSES);
  6782		pr_info("... MAX_LOCK_DEPTH:          %lu\n", MAX_LOCK_DEPTH);
  6783		pr_info("... MAX_LOCKDEP_KEYS:        %lu\n", MAX_LOCKDEP_KEYS);
  6784		pr_info("... CLASSHASH_SIZE:          %lu\n", CLASSHASH_SIZE);
  6785		pr_info("... MAX_LOCKDEP_ENTRIES:     %lu\n", MAX_LOCKDEP_ENTRIES);
  6786		pr_info("... MAX_LOCKDEP_CHAINS:      %lu\n", MAX_LOCKDEP_CHAINS);
  6787		pr_info("... CHAINHASH_SIZE:          %lu\n", CHAINHASH_SIZE);
  6788	
  6789		pr_info(" memory used by lock dependency info: %zu kB\n",
  6790		       (sizeof(lock_classes) +
  6791			sizeof(lock_classes_in_use) +
  6792			sizeof(classhash_table) +
  6793			sizeof(early_list_entries) +
  6794			sizeof(early_list_entries_in_use) +
  6795			sizeof(chainhash_table) +
  6796			sizeof(delayed_free)
  6797	#ifdef CONFIG_PROVE_LOCKING
  6798			+ sizeof(lock_cq)
  6799			+ sizeof(lock_chains)
  6800			+ sizeof(lock_chains_in_use)
  6801			+ sizeof(chain_hlocks)
  6802	#endif
  6803			) / 1024
  6804			);
  6805	
  6806	#if defined(CONFIG_TRACE_IRQFLAGS) && defined(CONFIG_PROVE_LOCKING)
  6807		pr_info(" memory used for stack traces: dynamic (bootstrap %zu kB)\n",
  6808		       sizeof(early_stack_trace) / 1024
  6809		       );
  6810	#endif
  6811	
  6812		pr_info(" per task-struct memory footprint: %zu bytes\n",
  6813		       sizeof(((struct task_struct *)NULL)->held_locks));
  6814	}
  6815	
  6816	static int __init lockdep_boot_report(void)
  6817	{
  6818		pr_info("lockdep: %lu/%lu bootstrap entries, %lu/%lu bootstrap traces used before buddy init, folio_pool active\n",
  6819			min_t(unsigned long, nr_list_entries, BOOTSTRAP_LOCKDEP_ENTRIES),
  6820			BOOTSTRAP_LOCKDEP_ENTRIES,
  6821			early_stack_trace_in_use,
> 6822			(unsigned long)BOOTSTRAP_STACK_TRACE_ENTRIES);
  6823		return 0;
  6824	}
  6825	core_initcall(lockdep_boot_report);
  6826	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
