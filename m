Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6D72F87B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 23:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774914666; cv=none; b=CszQCRKlv7h/57t7GpklP3lOrQIA8/0NehZBZKAFaYAYPrspJjiAsFqRuz4LNswE5+gIL0cwqiASMvvNj2rpLKpnNo15wpbG1/1n7WgzlF11HrnovyGqzHr5FxT+EndKzxT4t0xGzIxQk+tXzNn6dNXwepY0J1C6PH8osZirdCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774914666; c=relaxed/simple;
	bh=FfsUyNJwaxSlP0CtXVz+QnKh12vUWJVaBRZvoOJ8gwk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PC7xmjqVVXuDbiBxwdyj4ZuSZ5GR4qQ4/tLUwvC8b6nu2QFZEwItDEx2qg7EIo0QKmsxnOX9stIAQaqtAm6OxEqvguopExUyEAkCIi8ST4Hj4JxK03mPZNv2xVmyGq8GR8NUbFLKGJ62NtJl2kBi3b9pCklfu4JOC4hFtb8eA0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8sVDI/u; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8sVDI/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774914665; x=1806450665;
  h=date:from:to:cc:subject:message-id;
  bh=FfsUyNJwaxSlP0CtXVz+QnKh12vUWJVaBRZvoOJ8gwk=;
  b=I8sVDI/uq75ZZNNYnn57rGG+raGyxrQXdgEZGgr5L89hTant1SCCe2Lr
   E0TgqYX3pLm3G2ikIQVeUYave+5JOI3UsOiYiuAwh5/vcyiKlmqAThYWs
   800EekCiowyh7X6ckBrUhFwk1FML2tUQUPOeO+ZiU2PZU6SN6NtInRJ0/
   I6//mRDPx+NIOQDsT3K2GsDqTAWyHBxCoGYy2SVx7/1IN7DIMOJm6fGyC
   A8e9ZaBtrpDk0PcfAYG4Nc4f1lN425E3M6eTPgXvIE1fDtQ6cjyRM8ezV
   ouj94L1mkinv4QLozdIgerkffqxYZta+5y5jMEyBn1IQvVgHBTD0HGKBs
   A==;
X-CSE-ConnectionGUID: 3cJf6vyVTTKGj39hPFeIuA==
X-CSE-MsgGUID: HyHHVIR1R9ynMbcQuaTduw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75978979"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75978979"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 16:51:05 -0700
X-CSE-ConnectionGUID: LeT6H6pbRi6Vj6+ua20bgA==
X-CSE-MsgGUID: wg9Z4olTRE69CX02M9+iiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="226075235"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Mar 2026 16:51:03 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7MNo-000000001sx-3y5e;
	Mon, 30 Mar 2026 23:51:00 +0000
Date: Tue, 31 Mar 2026 07:50:40 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 2/11]
 include/linux/futex_types.h:51:26: error: expected ';' at end of declaration
 list
Message-ID: <202603310747.xy8sNrQG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   101e17624801c8d4b8d75e5b3fa3cd59e2e040d4
commit: db2041e444144d9669223d77c7025c8bd2f3e17d [2/11] futex: Move futex related mm_struct data into a struct
config: um-randconfig-r112-20260331 (https://download.01.org/0day-ci/archive/20260331/202603310747.xy8sNrQG-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310747.xy8sNrQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310747.xy8sNrQG-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/dtc/dtc-lexer.lex.c:641:12: warning: variable 'dts_version' set but not used [-Wunused-but-set-global]
     641 | static int dts_version = 1;
         |            ^
   1 warning generated.
   scripts/mod/modpost.c:59:13: warning: variable 'extra_warn' set but not used [-Wunused-but-set-global]
      59 | static bool extra_warn;
         |             ^
   1 warning generated.
   In file included from arch/um/kernel/asm-offsets.c:4:
   In file included from include/linux/sched.h:19:
>> include/linux/futex_types.h:51:26: error: expected ';' at end of declaration list
      51 |         unsigned int                    __percpu *phash_ref;
         |                                                  ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here


vim +51 include/linux/futex_types.h

    32	
    33	/**
    34	 * struct futex_mm_data - Futex related per MM data
    35	 * @phash_lock:			Mutex to protect the private hash operations
    36	 * @phash:			RCU managed pointer to the private hash
    37	 * @phash_new:			Pointer to a newly allocated private hash
    38	 * @phash_batches:		Batch state for RCU synchronization
    39	 * @phash_rcu:			RCU head for call_rcu()
    40	 * @phash_atomic:		Aggregate value for @phash_ref
    41	 * @phash_ref:			Per CPU reference counter for a private hash
    42	 */
    43	struct futex_mm_data {
    44	#ifdef CONFIG_FUTEX_PRIVATE_HASH
    45		struct mutex			phash_lock;
    46		struct futex_private_hash	__rcu *phash;
    47		struct futex_private_hash	*phash_new;
    48		unsigned long			phash_batches;
    49		struct rcu_head			phash_rcu;
    50		atomic_long_t			phash_atomic;
  > 51		unsigned int			__percpu *phash_ref;
    52	#endif
    53	};
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
