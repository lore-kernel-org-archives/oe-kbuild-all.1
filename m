Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DE4227579
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 15:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739807949; cv=none; b=sPSXV9duBfzCj3Rzq2A5+Uy52TTIC5fSbBt/wPJOFnN4waajZPmlYH7SI9jJDJ5tBjQA+8D2j7119ChmGJdocFFLGHK2HOudMBnMH73Qiop8vHbwkysZ1LqUSd1I+pX2pM54Okx+QscH5MOxJb+CKwNypNBYu+rYoRYDxASlrLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739807949; c=relaxed/simple;
	bh=xg/R77lAnb2P+xoX0k75JO1T8vqsdq2Ue2yyFro13VI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rx2bcRV0q3xmQRmYskchhIYigzcHuAS9gx5lPcZf1O2t4tr+0h2r9U0frXEZkFVHAIine5hQrvnhZSu+/U4g1MSa6j6aQprUmFm+dYX6Ihf81aKa4KuLUVxG3X6JV9amaz+Y3N0xza335rZ83rrcv4VQ023zz8i1oyxIo/PsP3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNEg5tYR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNEg5tYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739807947; x=1771343947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xg/R77lAnb2P+xoX0k75JO1T8vqsdq2Ue2yyFro13VI=;
  b=LNEg5tYRwn79XV5H4PUhPTUFJNI0se1idY+7kgC4mh+etioP+b/LSyWs
   iY3pkBWnpSBBtJOCqshgSuoPdbzBHVxYeROIA0JKQBeyJocw+Oxt9GtP9
   C5qrWB2SDpfNvFPjfRNuGMTf+9HePrx5ZlklLP0yWe3tNVZPnHa44yxag
   pYYHsW5YV96d/NVX4k1EFOgZzQEZQXfgK+vlHC0N7sOitYZNhc/R2+6si
   v15uwpxaWoP/+oWxFh6trtTtnKm8QzfetMybtyX3I8YjWpH3qpDVEaEt6
   iM/L/udceeQDVZkeYHl9JVEwcS0qMZ5F6WWsnOHTIcqrAz4ttGeRD8LEk
   w==;
X-CSE-ConnectionGUID: qeLaeaUuR+mhnj5a5eEdTg==
X-CSE-MsgGUID: gKcscGwHR72qLR67ZfElVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="28092494"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="28092494"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 07:58:56 -0800
X-CSE-ConnectionGUID: rhoDuf3iTH+NI1znWQOarw==
X-CSE-MsgGUID: +IdE58lAR0Cru48SyCvqnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114026220"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Feb 2025 07:58:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk3WG-001DJB-1b;
	Mon, 17 Feb 2025 15:58:52 +0000
Date: Mon, 17 Feb 2025 23:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:res-lock-base 19/26] kernel/bpf/hashtab.c:152:34: error:
 incompatible pointer types passing 'rqspinlock_t *' (aka 'struct rqspinlock
 *') to parameter of type 'struct qspinlock *'
Message-ID: <202502172327.q0rZMGAB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux res-lock-base
head:   f998e0817b8a89691123f4a4a6e1277c22523695
commit: f18489b44b19afd315672b453cd104c51c75d95f [19/26] bpf: Convert hashtab.c to rqspinlock
config: x86_64-buildonly-randconfig-006-20250217 (https://download.01.org/0day-ci/archive/20250217/202502172327.q0rZMGAB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502172327.q0rZMGAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502172327.q0rZMGAB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/hashtab.c:19:
   In file included from arch/x86/include/asm/rqspinlock.h:27:
   include/asm-generic/rqspinlock.h:33:12: error: conflicting types for 'resilient_tas_spin_lock'
      33 | extern int resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout);
         |            ^
   arch/x86/include/asm/rqspinlock.h:17:12: note: previous declaration is here
      17 | extern int resilient_tas_spin_lock(struct qspinlock *lock, u64 timeout);
         |            ^
>> kernel/bpf/hashtab.c:152:34: error: incompatible pointer types passing 'rqspinlock_t *' (aka 'struct rqspinlock *') to parameter of type 'struct qspinlock *' [-Werror,-Wincompatible-pointer-types]
     152 |         ret = raw_res_spin_lock_irqsave(&b->raw_lock, flags);
         |                                         ^~~~~~~~~~~~
   include/asm-generic/rqspinlock.h:200:29: note: expanded from macro 'raw_res_spin_lock_irqsave'
     200 |                 __ret = raw_res_spin_lock(lock);  \
         |                                           ^~~~
   include/asm-generic/rqspinlock.h:188:25: note: expanded from macro 'raw_res_spin_lock'
     188 |                 __ret = res_spin_lock(lock);       \
         |                                       ^~~~
   include/asm-generic/rqspinlock.h:156:53: note: expanded from macro 'res_spin_lock'
     156 | #define res_spin_lock(lock) resilient_tas_spin_lock(lock, RES_DEF_TIMEOUT)
         |                                                     ^~~~
   arch/x86/include/asm/rqspinlock.h:17:54: note: passing argument to parameter 'lock' here
      17 | extern int resilient_tas_spin_lock(struct qspinlock *lock, u64 timeout);
         |                                                      ^
   2 errors generated.


vim +152 kernel/bpf/hashtab.c

  > 19	#include <asm/rqspinlock.h>
    20	
    21	#define HTAB_CREATE_FLAG_MASK						\
    22		(BPF_F_NO_PREALLOC | BPF_F_NO_COMMON_LRU | BPF_F_NUMA_NODE |	\
    23		 BPF_F_ACCESS_MASK | BPF_F_ZERO_SEED)
    24	
    25	#define BATCH_OPS(_name)			\
    26		.map_lookup_batch =			\
    27		_name##_map_lookup_batch,		\
    28		.map_lookup_and_delete_batch =		\
    29		_name##_map_lookup_and_delete_batch,	\
    30		.map_update_batch =			\
    31		generic_map_update_batch,		\
    32		.map_delete_batch =			\
    33		generic_map_delete_batch
    34	
    35	/*
    36	 * The bucket lock has two protection scopes:
    37	 *
    38	 * 1) Serializing concurrent operations from BPF programs on different
    39	 *    CPUs
    40	 *
    41	 * 2) Serializing concurrent operations from BPF programs and sys_bpf()
    42	 *
    43	 * BPF programs can execute in any context including perf, kprobes and
    44	 * tracing. As there are almost no limits where perf, kprobes and tracing
    45	 * can be invoked from the lock operations need to be protected against
    46	 * deadlocks. Deadlocks can be caused by recursion and by an invocation in
    47	 * the lock held section when functions which acquire this lock are invoked
    48	 * from sys_bpf(). BPF recursion is prevented by incrementing the per CPU
    49	 * variable bpf_prog_active, which prevents BPF programs attached to perf
    50	 * events, kprobes and tracing to be invoked before the prior invocation
    51	 * from one of these contexts completed. sys_bpf() uses the same mechanism
    52	 * by pinning the task to the current CPU and incrementing the recursion
    53	 * protection across the map operation.
    54	 *
    55	 * This has subtle implications on PREEMPT_RT. PREEMPT_RT forbids certain
    56	 * operations like memory allocations (even with GFP_ATOMIC) from atomic
    57	 * contexts. This is required because even with GFP_ATOMIC the memory
    58	 * allocator calls into code paths which acquire locks with long held lock
    59	 * sections. To ensure the deterministic behaviour these locks are regular
    60	 * spinlocks, which are converted to 'sleepable' spinlocks on RT. The only
    61	 * true atomic contexts on an RT kernel are the low level hardware
    62	 * handling, scheduling, low level interrupt handling, NMIs etc. None of
    63	 * these contexts should ever do memory allocations.
    64	 *
    65	 * As regular device interrupt handlers and soft interrupts are forced into
    66	 * thread context, the existing code which does
    67	 *   spin_lock*(); alloc(GFP_ATOMIC); spin_unlock*();
    68	 * just works.
    69	 *
    70	 * In theory the BPF locks could be converted to regular spinlocks as well,
    71	 * but the bucket locks and percpu_freelist locks can be taken from
    72	 * arbitrary contexts (perf, kprobes, tracepoints) which are required to be
    73	 * atomic contexts even on RT. Before the introduction of bpf_mem_alloc,
    74	 * it is only safe to use raw spinlock for preallocated hash map on a RT kernel,
    75	 * because there is no memory allocation within the lock held sections. However
    76	 * after hash map was fully converted to use bpf_mem_alloc, there will be
    77	 * non-synchronous memory allocation for non-preallocated hash map, so it is
    78	 * safe to always use raw spinlock for bucket lock.
    79	 */
    80	struct bucket {
    81		struct hlist_nulls_head head;
    82		rqspinlock_t raw_lock;
    83	};
    84	
    85	#define HASHTAB_MAP_LOCK_COUNT 8
    86	#define HASHTAB_MAP_LOCK_MASK (HASHTAB_MAP_LOCK_COUNT - 1)
    87	
    88	struct bpf_htab {
    89		struct bpf_map map;
    90		struct bpf_mem_alloc ma;
    91		struct bpf_mem_alloc pcpu_ma;
    92		struct bucket *buckets;
    93		void *elems;
    94		union {
    95			struct pcpu_freelist freelist;
    96			struct bpf_lru lru;
    97		};
    98		struct htab_elem *__percpu *extra_elems;
    99		/* number of elements in non-preallocated hashtable are kept
   100		 * in either pcount or count
   101		 */
   102		struct percpu_counter pcount;
   103		atomic_t count;
   104		bool use_percpu_counter;
   105		u32 n_buckets;	/* number of hash buckets */
   106		u32 elem_size;	/* size of each element in bytes */
   107		u32 hashrnd;
   108	};
   109	
   110	/* each htab element is struct htab_elem + key + value */
   111	struct htab_elem {
   112		union {
   113			struct hlist_nulls_node hash_node;
   114			struct {
   115				void *padding;
   116				union {
   117					struct pcpu_freelist_node fnode;
   118					struct htab_elem *batch_flink;
   119				};
   120			};
   121		};
   122		union {
   123			/* pointer to per-cpu pointer */
   124			void *ptr_to_pptr;
   125			struct bpf_lru_node lru_node;
   126		};
   127		u32 hash;
   128		char key[] __aligned(8);
   129	};
   130	
   131	static inline bool htab_is_prealloc(const struct bpf_htab *htab)
   132	{
   133		return !(htab->map.map_flags & BPF_F_NO_PREALLOC);
   134	}
   135	
   136	static void htab_init_buckets(struct bpf_htab *htab)
   137	{
   138		unsigned int i;
   139	
   140		for (i = 0; i < htab->n_buckets; i++) {
   141			INIT_HLIST_NULLS_HEAD(&htab->buckets[i].head, i);
   142			raw_res_spin_lock_init(&htab->buckets[i].raw_lock);
   143			cond_resched();
   144		}
   145	}
   146	
   147	static inline int htab_lock_bucket(struct bucket *b, unsigned long *pflags)
   148	{
   149		unsigned long flags;
   150		int ret;
   151	
 > 152		ret = raw_res_spin_lock_irqsave(&b->raw_lock, flags);
   153		if (ret)
   154			return ret;
   155		*pflags = flags;
   156		return 0;
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
