Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EED3A759D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298183; cv=none; b=mnArw/Km7MmKIJ1kxmLl5Q+f2CamJxaBktRMZtNTnERg8RGkxOau+ZT416rUwBOs6klhfb8oOfiqn0VpZdCTqGQAMfoPzx6TBLPw8R+E+WYivY8+OXp1C5ZNCpOCR7R4DP/pQnhbWxMaTel3hHy4t24xkRRKRjf99T9lsLSXSts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298183; c=relaxed/simple;
	bh=4pFUoAUjAkpX9ZFGruv3NG0AfVB9SJL3dnRhS0NfFF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NnefRyA+Ongwu7pq1/ZEBnbxbXUeg6IeCl2Jies++wjXv6FMcOpnaT2m2pGB//JeFxY35Hbd2IMydYBmXxSVHsvX9n2/FS+ebSf/iDgaci5NlGbQqWXTGpOYl4L0lm3XRKL5AeFfpfeWabldNpMEyj7Svc81l+DvEx76wc18m9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mdcIxqZI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdcIxqZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787298178; x=1818834178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4pFUoAUjAkpX9ZFGruv3NG0AfVB9SJL3dnRhS0NfFF8=;
  b=mdcIxqZIQwPjmyeNsAK45cirzYbYLFB1j9EbkrX9EFILMJkhnk7q0hRe
   3m12xtYgcQmCuO3LGB5aiBmqF+9EEacvCiLfy40tDvLpMxY5COtkZo/qq
   VBEPc5Gf4MBn+sxyuf9wAz+rDRn5XMB4CqhwexQthKWU/VZJsEXYvZqwR
   Ou/k/bmp5RPPuR3tSuHqMValWHRY7MVV/M3b2FMuCzT1bB/phClq437A1
   so1SDvtKRaGcZodl/Fv8t5AhdH/UMsge0bOGnI26K28L4WCZaIEA+49Vb
   PPL2J+JC7YPYdGtDEyfSh4rz/FcOVvdOzpYnUq264VJRtSjRtXpZhcgUs
   w==;
X-CSE-ConnectionGUID: D+b51jj/S2+rBxwlTjjM8A==
X-CSE-MsgGUID: SMpvHWDcSyyG5LvmmFffhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="110631217"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="110631217"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 00:42:56 -0700
X-CSE-ConnectionGUID: pJ2Rh6LqSyq0z7aipzBubA==
X-CSE-MsgGUID: 6FDEg6lgRmu98MzQHiFXBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="264983482"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Aug 2026 00:42:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxJtr-00000000pZL-3o4K;
	Fri, 21 Aug 2026 07:42:51 +0000
Date: Fri, 21 Aug 2026 15:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:m-5 14/146] kernel/locking/lockdep.c:6777:2: error:
 'bootstrap_stack_trace' undeclared
Message-ID: <202608211513.SBVKLuvz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git m-5
head:   f4586ca88dc640ffb7dea6725f1b347cd3c51bf9
commit: b380fdf118d57d97bf5a7acd5b3ccb1d8dd74e9e [14/146] locking/lockdep: Migrate and compact stack trace entries into folio_scratchpad
config: powerpc-randconfig-002-20260821 (https://download.01.org/0day-ci/archive/20260821/202608211513.SBVKLuvz-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211513.SBVKLuvz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608211513.SBVKLuvz-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/locking/lockdep.c: In function 'lockdep_init':
>> kernel/locking/lockdep.c:6777:2: error: 'bootstrap_stack_trace' undeclared (first use in this function)
    6777 |  bootstrap_stack_trace = early_stack_trace;
         |  ^~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:6777:2: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/locking/lockdep.c:6777:26: error: 'early_stack_trace' undeclared (first use in this function)
    6777 |  bootstrap_stack_trace = early_stack_trace;
         |                          ^~~~~~~~~~~~~~~~~
>> kernel/locking/lockdep.c:6778:2: error: 'bootstrap_stack_trace_in_use' undeclared (first use in this function); did you mean 'bootstrap_entries_in_use'?
    6778 |  bootstrap_stack_trace_in_use = &early_stack_trace_in_use;
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |  bootstrap_entries_in_use
>> kernel/locking/lockdep.c:6778:34: error: 'early_stack_trace_in_use' undeclared (first use in this function)
    6778 |  bootstrap_stack_trace_in_use = &early_stack_trace_in_use;
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:31,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from arch/powerpc/include/asm/cmpxchg.h:8,
                    from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from kernel/locking/lockdep.c:30:
   kernel/locking/lockdep.c: In function 'lockdep_boot_report':
   kernel/locking/lockdep.c:6822:3: error: 'early_stack_trace_in_use' undeclared (first use in this function)
    6822 |   early_stack_trace_in_use,
         |   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:483:19: note: in definition of macro 'printk_index_wrap'
     483 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |                   ^~~~~~~~~~~
   include/linux/printk.h:584:2: note: in expansion of macro 'printk'
     584 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~
   kernel/locking/lockdep.c:6819:2: note: in expansion of macro 'pr_info'
    6819 |  pr_info("lockdep: %lu/%lu bootstrap entries, %lu/%lu bootstrap traces used before buddy init, folio_pool active\n",
         |  ^~~~~~~
>> kernel/locking/lockdep.c:6823:18: error: 'BOOTSTRAP_STACK_TRACE_ENTRIES' undeclared (first use in this function); did you mean 'MAX_STACK_TRACE_ENTRIES'?
    6823 |   (unsigned long)BOOTSTRAP_STACK_TRACE_ENTRIES);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:483:19: note: in definition of macro 'printk_index_wrap'
     483 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |                   ^~~~~~~~~~~
   include/linux/printk.h:584:2: note: in expansion of macro 'printk'
     584 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~
   kernel/locking/lockdep.c:6819:2: note: in expansion of macro 'pr_info'
    6819 |  pr_info("lockdep: %lu/%lu bootstrap entries, %lu/%lu bootstrap traces used before buddy init, folio_pool active\n",
         |  ^~~~~~~
   kernel/locking/lockdep.c: In function 'lockdep_compact_boot_graph':
   kernel/locking/lockdep.c:6845:26: error: 'lockdep_trace_scratchpad' undeclared (first use in this function); did you mean 'lockdep_trace_stats'?
    6845 |  folio_scratchpad_alloc(&lockdep_trace_scratchpad, sizeof(struct lock_trace) + 32 * sizeof(unsigned long),
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
         |                          lockdep_trace_stats
   kernel/locking/lockdep.c:6845:59: error: invalid application of 'sizeof' to incomplete type 'struct lock_trace'
    6845 |  folio_scratchpad_alloc(&lockdep_trace_scratchpad, sizeof(struct lock_trace) + 32 * sizeof(unsigned long),
         |                                                           ^~~~~~
   In file included from include/linux/kernel.h:16,
                    from arch/powerpc/include/asm/page.h:11,
                    from arch/powerpc/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:62,
                    from arch/powerpc/include/asm/ptrace.h:339,
                    from arch/powerpc/include/asm/hw_irq.h:12,
                    from arch/powerpc/include/asm/irqflags.h:12,
                    from include/linux/irqflags.h:18,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/powerpc/include/asm/cmpxchg.h:755,
                    from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from kernel/locking/lockdep.c:30:
   kernel/locking/lockdep.c:6855:29: error: 'stack_trace_hash' undeclared (first use in this function); did you mean 'stack_trace_save'?
    6855 |  for (i = 0; i < ARRAY_SIZE(stack_trace_hash); i++) {
         |                             ^~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/mutex.h:15,
                    from kernel/locking/lockdep.c:30:
   include/linux/compiler.h:200:82: error: expression in static assertion is not an integer
     200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:205:28: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     205 | #define __must_be_array(a) __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:6855:18: note: in expansion of macro 'ARRAY_SIZE'
    6855 |  for (i = 0; i < ARRAY_SIZE(stack_trace_hash); i++) {
         |                  ^~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/mutex.h:15,
                    from kernel/locking/lockdep.c:30:
   include/linux/container_of.h:21:28: error: invalid type argument of unary '*' (have 'int')
      21 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |                            ^~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:2: note: in expansion of macro 'static_assert'
      21 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |  ^~~~~~~~~~~~~
   include/linux/container_of.h:21:16: note: in expansion of macro '__same_type'
      21 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |                ^~~~~~~~~~~
   include/linux/list.h:1183:40: note: in expansion of macro 'container_of'
    1183 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1194:15: note: in expansion of macro 'hlist_entry'
    1194 |     ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |               ^~~~~~~~~~~
   include/linux/list.h:1235:13: note: in expansion of macro 'hlist_entry_safe'
    1235 |  for (pos = hlist_entry_safe((head)->first, typeof(*pos), member);\
         |             ^~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:6859:3: note: in expansion of macro 'hlist_for_each_entry_safe'
    6859 |   hlist_for_each_entry_safe(trace, n, &stack_trace_hash[i], hash_entry) {
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:1235:52: error: dereferencing pointer to incomplete type 'struct lock_trace'
    1235 |  for (pos = hlist_entry_safe((head)->first, typeof(*pos), member);\
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:2: note: in expansion of macro 'static_assert'
      21 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |  ^~~~~~~~~~~~~
   include/linux/container_of.h:21:16: note: in expansion of macro '__same_type'
      21 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |                ^~~~~~~~~~~
   include/linux/list.h:1183:40: note: in expansion of macro 'container_of'
    1183 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)


vim +/bootstrap_stack_trace +6777 kernel/locking/lockdep.c

  6772	
  6773	void __init lockdep_init(void)
  6774	{
  6775		bootstrap_entries = early_list_entries;
  6776		bootstrap_entries_in_use = early_list_entries_in_use;
> 6777		bootstrap_stack_trace = early_stack_trace;
> 6778		bootstrap_stack_trace_in_use = &early_stack_trace_in_use;
  6779	
  6780		pr_info("Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar\n");
  6781	
  6782		pr_info("... MAX_LOCKDEP_SUBCLASSES:  %lu\n", MAX_LOCKDEP_SUBCLASSES);
  6783		pr_info("... MAX_LOCK_DEPTH:          %lu\n", MAX_LOCK_DEPTH);
  6784		pr_info("... MAX_LOCKDEP_KEYS:        %lu\n", MAX_LOCKDEP_KEYS);
  6785		pr_info("... CLASSHASH_SIZE:          %lu\n", CLASSHASH_SIZE);
  6786		pr_info("... MAX_LOCKDEP_ENTRIES:     %lu\n", MAX_LOCKDEP_ENTRIES);
  6787		pr_info("... MAX_LOCKDEP_CHAINS:      %lu\n", MAX_LOCKDEP_CHAINS);
  6788		pr_info("... CHAINHASH_SIZE:          %lu\n", CHAINHASH_SIZE);
  6789	
  6790		pr_info(" memory used by lock dependency info: %zu kB\n",
  6791		       (sizeof(lock_classes) +
  6792			sizeof(lock_classes_in_use) +
  6793			sizeof(classhash_table) +
  6794			sizeof(early_list_entries) +
  6795			sizeof(early_list_entries_in_use) +
  6796			sizeof(chainhash_table) +
  6797			sizeof(delayed_free)
  6798	#ifdef CONFIG_PROVE_LOCKING
  6799			+ sizeof(lock_cq)
  6800			+ sizeof(lock_chains)
  6801			+ sizeof(lock_chains_in_use)
  6802			+ sizeof(chain_hlocks)
  6803	#endif
  6804			) / 1024
  6805			);
  6806	
  6807	#if defined(CONFIG_TRACE_IRQFLAGS) && defined(CONFIG_PROVE_LOCKING)
  6808		pr_info(" memory used for stack traces: dynamic (bootstrap %zu kB)\n",
  6809		       sizeof(early_stack_trace) / 1024
  6810		       );
  6811	#endif
  6812	
  6813		pr_info(" per task-struct memory footprint: %zu bytes\n",
  6814		       sizeof(((struct task_struct *)NULL)->held_locks));
  6815	}
  6816	
  6817	static int __init lockdep_boot_report(void)
  6818	{
  6819		pr_info("lockdep: %lu/%lu bootstrap entries, %lu/%lu bootstrap traces used before buddy init, folio_pool active\n",
  6820			min_t(unsigned long, nr_list_entries, BOOTSTRAP_LOCKDEP_ENTRIES),
  6821			BOOTSTRAP_LOCKDEP_ENTRIES,
  6822			early_stack_trace_in_use,
> 6823			(unsigned long)BOOTSTRAP_STACK_TRACE_ENTRIES);
  6824		return 0;
  6825	}
  6826	core_initcall(lockdep_boot_report);
  6827	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
