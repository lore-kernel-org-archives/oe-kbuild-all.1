Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC3F19644B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787071041; cv=none; b=fwhN2cKG8Xtbj6Bjw/P205QNCNpE9XkZjYwQ2uvNqw4sA1xM9GwWp5y8+AkzOU3SdQ8TGaavEFnT4UkuyrJ/P9cpFiDuRgVWptexdtYJ6IWFxoPKl7tT5C2EgqyBsD73qRMSQHfvRQNWk5Ir+8QM02GExdxasnaLRDUnRouiyG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787071041; c=relaxed/simple;
	bh=dvTUFqiydE0+Ur/do9KApJGG74gS9bNa4c2swOFa8sU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nyWcZHi1ehOa5yFs1V7Ja+kxoOASz/1EmJ7NnYOnYdfUSglosQDiWiwiF4xTIT3vYy8QjitSWgb3usMfPW5phcOSqqwGPGw8ZErEAzZfGWNU82wEToI9JGCSCeCg5EQ6Gi8xAZ9pfWHdi8u59DQXIF268oImbCtsn9/pBsoBMmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Om94uvn0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Om94uvn0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787071036; x=1818607036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dvTUFqiydE0+Ur/do9KApJGG74gS9bNa4c2swOFa8sU=;
  b=Om94uvn0ciEQJyWu6l2IDO/mRHEapqmK0v6wbTcPf4rWiUk6dCD3xQTL
   sAjU7QgnbicW+gl1Bpu9oZZiGNljL2nYSIcDO+xorvkBJTsZ8IogBFSqT
   MkOJjnS5/8i0KIVBFkRFXaXUc6U7SYxZW748mg3bQEabefUvKGpBsaH/X
   3MVoBcn9RXJBbC2cJCzT4EWAY8BZvINJF0bdYzIfypufU3a0qjdO/MZT1
   QoNqzmF8w6Apd79Sd0/ojM5t5s+gSMN8knKkdu/zA4N4S5GPQmC1wkkYu
   oxUvnZiOz5e8QtvU73IkYR2ehod04pKEeyQMe2oJCZ52HVzocAuEN5TQ4
   w==;
X-CSE-ConnectionGUID: Q7AutrHNTIWMmFZMBC6u5g==
X-CSE-MsgGUID: o4i+gJIjTca8xG/p+Y9Shw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="91381912"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="91381912"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 09:37:14 -0700
X-CSE-ConnectionGUID: m8V7gM+4RN6rYIe5QpY8nw==
X-CSE-MsgGUID: Dqn7HgFMQVaXMICd+vbEtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261998709"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2026 09:37:12 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwMoH-00000000eRO-2vKO;
	Tue, 18 Aug 2026 16:37:09 +0000
Date: Wed, 19 Aug 2026 00:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v2-lockdep 14/21]
 kernel/locking/lockdep.c:6776:2: error: use of undeclared identifier
 'bootstrap_stack_trace'
Message-ID: <202608190004.QWOuY3ze-lkp@intel.com>
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
config: powerpc64-randconfig-001-20260818 (https://download.01.org/0day-ci/archive/20260819/202608190004.QWOuY3ze-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190004.QWOuY3ze-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190004.QWOuY3ze-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/locking/lockdep.c:6776:2: error: use of undeclared identifier 'bootstrap_stack_trace'
    6776 |         bootstrap_stack_trace = early_stack_trace;
         |         ^~~~~~~~~~~~~~~~~~~~~
>> kernel/locking/lockdep.c:6776:26: error: use of undeclared identifier 'early_stack_trace'
    6776 |         bootstrap_stack_trace = early_stack_trace;
         |                                 ^~~~~~~~~~~~~~~~~
>> kernel/locking/lockdep.c:6777:2: error: use of undeclared identifier 'bootstrap_stack_trace_in_use'; did you mean 'bootstrap_entries_in_use'?
    6777 |         bootstrap_stack_trace_in_use = &early_stack_trace_in_use;
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         bootstrap_entries_in_use
   kernel/locking/lockdep.c:237:23: note: 'bootstrap_entries_in_use' declared here
     237 | static unsigned long *bootstrap_entries_in_use __read_mostly = early_list_entries_in_use;
         |                       ^
>> kernel/locking/lockdep.c:6777:34: error: use of undeclared identifier 'early_stack_trace_in_use'
    6777 |         bootstrap_stack_trace_in_use = &early_stack_trace_in_use;
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:6821:3: error: use of undeclared identifier 'early_stack_trace_in_use'
    6821 |                 early_stack_trace_in_use,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/locking/lockdep.c:6822:18: error: use of undeclared identifier 'BOOTSTRAP_STACK_TRACE_ENTRIES'
    6822 |                 (unsigned long)BOOTSTRAP_STACK_TRACE_ENTRIES);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:6844:26: error: use of undeclared identifier 'lockdep_trace_scratchpad'; did you mean 'lockdep_trace_stats'?
    6844 |         folio_scratchpad_alloc(&lockdep_trace_scratchpad, sizeof(struct lock_trace) + 32 * sizeof(unsigned long),
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                 lockdep_trace_stats
   kernel/locking/lockdep_internals.h:163:6: note: 'lockdep_trace_stats' declared here
     163 | void lockdep_trace_stats(unsigned int *nr_chunks, size_t *chunk_size, size_t *tail_used);
         |      ^
   kernel/locking/lockdep.c:6844:52: error: invalid application of 'sizeof' to an incomplete type 'struct lock_trace'
    6844 |         folio_scratchpad_alloc(&lockdep_trace_scratchpad, sizeof(struct lock_trace) + 32 * sizeof(unsigned long),
         |                                                           ^     ~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep_types.h:85:8: note: forward declaration of 'struct lock_trace'
      85 | struct lock_trace;
         |        ^
   kernel/locking/lockdep.c:6854:29: error: use of undeclared identifier 'stack_trace_hash'; did you mean 'stack_trace_save'?
    6854 |         for (i = 0; i < ARRAY_SIZE(stack_trace_hash); i++) {
         |                                    ^~~~~~~~~~~~~~~~
         |                                    stack_trace_save
   include/linux/array_size.h:11:33: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   include/linux/stacktrace.h:70:14: note: 'stack_trace_save' declared here
      70 | unsigned int stack_trace_save(unsigned long *store, unsigned int size,
         |              ^
   kernel/locking/lockdep.c:6854:29: error: use of undeclared identifier 'stack_trace_hash'; did you mean 'stack_trace_save'?
    6854 |         for (i = 0; i < ARRAY_SIZE(stack_trace_hash); i++) {
         |                                    ^~~~~~~~~~~~~~~~
         |                                    stack_trace_save
   include/linux/array_size.h:11:48: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                ^~~
   include/linux/stacktrace.h:70:14: note: 'stack_trace_save' declared here
      70 | unsigned int stack_trace_save(unsigned long *store, unsigned int size,
         |              ^
   kernel/locking/lockdep.c:6854:18: error: subscript of pointer to function type 'unsigned int (unsigned long *, unsigned int, unsigned int)'
    6854 |         for (i = 0; i < ARRAY_SIZE(stack_trace_hash); i++) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:47: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                               ^~~~~
   kernel/locking/lockdep.c:6854:29: error: use of undeclared identifier 'stack_trace_hash'; did you mean 'stack_trace_save'?
    6854 |         for (i = 0; i < ARRAY_SIZE(stack_trace_hash); i++) {
         |                                    ^~~~~~~~~~~~~~~~
         |                                    stack_trace_save
   include/linux/array_size.h:11:75: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                                           ^~~
   include/linux/compiler.h:205:64: note: expanded from macro '__must_be_array'
     205 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                                                     ^
   include/linux/compiler.h:204:39: note: expanded from macro '__is_array'
     204 | #define __is_array(a)           (!__same_type((a), &(a)[0]))
         |                                                ^
   include/linux/compiler_types.h:610:63: note: expanded from macro '__same_type'
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/compiler.h:200:84: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
     200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                    ^
   include/linux/stacktrace.h:70:14: note: 'stack_trace_save' declared here
      70 | unsigned int stack_trace_save(unsigned long *store, unsigned int size,
         |              ^
   kernel/locking/lockdep.c:6854:29: error: use of undeclared identifier 'stack_trace_hash'; did you mean 'stack_trace_save'?
    6854 |         for (i = 0; i < ARRAY_SIZE(stack_trace_hash); i++) {
         |                                    ^~~~~~~~~~~~~~~~
         |                                    stack_trace_save
   include/linux/array_size.h:11:75: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                                           ^~~
   include/linux/compiler.h:205:64: note: expanded from macro '__must_be_array'
     205 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                                                     ^
   include/linux/compiler.h:204:45: note: expanded from macro '__is_array'
     204 | #define __is_array(a)           (!__same_type((a), &(a)[0]))
         |                                                      ^
   include/linux/compiler_types.h:610:74: note: expanded from macro '__same_type'
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/compiler.h:200:84: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
     200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                    ^
   include/linux/stacktrace.h:70:14: note: 'stack_trace_save' declared here
      70 | unsigned int stack_trace_save(unsigned long *store, unsigned int size,
         |              ^
   kernel/locking/lockdep.c:6854:18: error: subscript of pointer to function type 'unsigned int (unsigned long *, unsigned int, unsigned int)'
    6854 |         for (i = 0; i < ARRAY_SIZE(stack_trace_hash); i++) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:205:53: note: expanded from macro '__must_be_array'
     205 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
     206 |                                                         "must be array")
         |                                                         ~~~~~~~~~~~~~~~~
   include/linux/compiler.h:204:44: note: expanded from macro '__is_array'
     204 | #define __is_array(a)           (!__same_type((a), &(a)[0]))
         |                                                     ^
   include/linux/compiler_types.h:610:74: note: expanded from macro '__same_type'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +/bootstrap_stack_trace +6776 kernel/locking/lockdep.c

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
