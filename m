Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581991EB9E1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768727838; cv=none; b=GlXpa5l0OkQiPH2gOp52Ynl6TmNJqpJ3aSeC6ZS8RGsib+dHm+w9WmF/6JG0n1QVcnKKkkc3I8gmWd4cziwEoXCcdL5oUdOq/YO89eKjCABrA7Ft/jUlKU0vSKZEBTOeXZxH/FdFbA79VWUotTOoU/hEW6ATbPq2KmRamuHkSvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768727838; c=relaxed/simple;
	bh=N3zLJQgcb+IW2s1KfW7ax+XvshRfgaGhSlHku6pSOvA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ieozPYxOWPov804VzMOFW898EfsfLcbB6Qy9g45NGkn8DaVTrM+PRgVUGPyBbb0Vau92wL186OuPFhALyuOWwn/C4UBBfXm9opBngZZOIAjbQN6NEABUuQe/nE277PFuVZz2NLR293JpAQsxj7+qjnaGqBG2ekc/hF7iZSRfC48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bzkb27eS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bzkb27eS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768727837; x=1800263837;
  h=date:from:to:cc:subject:message-id;
  bh=N3zLJQgcb+IW2s1KfW7ax+XvshRfgaGhSlHku6pSOvA=;
  b=Bzkb27eSLTPBOd2QW9aTm2z720atTDci/k9RQVOWmHR5lfsTy9tthHu8
   Hpbtv6W5r+Qv582pfJq7WrCxZJEWOEiryjagdpvGh/Ka0hSUu+nGkPpb/
   pFWZtbd2Je2giH3ocsD6QshEXrKVKkYxfKpb4yYI3F8KsbfDRitBm66va
   CqXhhvmWLfJNafNqXvNsjuRSnDLvfpHZeMQXzrOnvD1pKW6PWf5UqvXP6
   viGV/GzzT2tMrAXaRUHrjtei0cAi1Y2MhiXm4oZBePEZlgSJc9XA3rM/T
   BJBh03zmpKqfrh0QNP16teZOM0xrsBkc3UzUtmDpAbZ4+MsatNydFMvYS
   w==;
X-CSE-ConnectionGUID: 07Fv87umTb68x1KTJon6ww==
X-CSE-MsgGUID: L8u6K2z0QNGuEB+zTo2BYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="92641999"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="92641999"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 01:17:16 -0800
X-CSE-ConnectionGUID: srR2DDXxTzadfswRIrB8lg==
X-CSE-MsgGUID: /PE78duQSu6/xjXTriY0YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="209751831"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Jan 2026 01:17:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhOuF-00000000MqC-27Cy;
	Sun, 18 Jan 2026 09:17:11 +0000
Date: Sun, 18 Jan 2026 17:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:timers/vdso 16/16] include/linux/sched/mm.h:496:23:
 sparse: sparse: cast removes address space '__percpu' of expression
Message-ID: <202601181733.YZOf9XU3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
head:   adc00a0daf1bb08915bceee9ae73cca682e7d5bb
commit: adc00a0daf1bb08915bceee9ae73cca682e7d5bb [16/16] compiler: Use __typeof_unqual__() for __unqual_scalar_typeof()
config: i386-randconfig-063-20260118 (https://download.01.org/0day-ci/archive/20260118/202601181733.YZOf9XU3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181733.YZOf9XU3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181733.YZOf9XU3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/filemap.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
   arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/filemap.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs/super_types.h, ...):
>> include/linux/sched/mm.h:496:23: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/sched/mm.h:496:23: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/sched/mm.h:496:23: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/sched/mm.h:497:17: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/sched/mm.h:497:17: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/sched/mm.h:497:17: sparse: sparse: cast removes address space '__percpu' of expression
   mm/filemap.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
   arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   mm/filemap.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'filemap_fault_recheck_pte_none' - unexpected unlock
   include/linux/rcupdate.h:895:9: sparse: sparse: context imbalance in 'filemap_map_pages' - different lock contexts for basic block
--
   mm/memcontrol-v1.c:438:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol-v1.c:438:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol-v1.c:438:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol-v1.c:440:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol-v1.c:440:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol-v1.c:440:21: sparse:    struct mem_cgroup_threshold_ary *
>> mm/memcontrol-v1.c:532:15: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol-v1.c:532:15: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol-v1.c:532:15: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol-v1.c:533:16: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol-v1.c:533:16: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol-v1.c:533:16: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol-v1.c:546:17: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol-v1.c:546:17: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol-v1.c:546:17: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol-v1.c:643:9: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol-v1.c:643:9: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol-v1.c:643:9: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol-v1.c:643:9: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol-v1.c:643:9: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol-v1.c:643:9: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol-v1.c:802:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol-v1.c:802:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol-v1.c:802:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol-v1.c:896:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol-v1.c:896:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol-v1.c:896:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol-v1.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/cgroup.h, ...):
   arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol-v1.c: note: in included file (through include/linux/sched.h, include/linux/cgroup.h, include/linux/memcontrol.h):
   arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/memcontrol.c:592:33: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol.c:892:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol.c:892:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol.c:892:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
   arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, include/linux/radix-tree.h, ...):
   arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol.c: note: in included file:
   include/linux/memcontrol.h:730:9: sparse: sparse: context imbalance in 'folio_lruvec_lock' - wrong count at exit
   include/linux/memcontrol.h:730:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irq' - wrong count at exit
   include/linux/memcontrol.h:730:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irqsave' - wrong count at exit
   mm/memcontrol.c:2722:17: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol.c:2722:17: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol.c:2722:17: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memcontrol.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
>> include/linux/sched/mm.h:496:23: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/sched/mm.h:496:23: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/sched/mm.h:496:23: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/sched/mm.h:497:17: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/sched/mm.h:497:17: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/sched/mm.h:497:17: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/notify/inotify/inotify_fsnotify.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs/super_types.h, ...):
>> include/linux/sched/mm.h:496:23: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/sched/mm.h:496:23: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/sched/mm.h:496:23: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/sched/mm.h:497:17: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/sched/mm.h:497:17: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/sched/mm.h:497:17: sparse: sparse: cast removes address space '__percpu' of expression
   fs/notify/inotify/inotify_fsnotify.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/rcupdate.h, ...):
   arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   fs/notify/inotify/inotify_fsnotify.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +496 include/linux/sched/mm.h

d7fefcc8de9147 Aneesh Kumar K.V 2019-03-05  472  
d46eb14b735b11 Shakeel Butt     2018-08-17  473  #ifdef CONFIG_MEMCG
37d5985c003daa Roman Gushchin   2020-10-17  474  DECLARE_PER_CPU(struct mem_cgroup *, int_active_memcg);
d46eb14b735b11 Shakeel Butt     2018-08-17  475  /**
b87d8cefe43c7f Roman Gushchin   2020-10-17  476   * set_active_memcg - Starts the remote memcg charging scope.
d46eb14b735b11 Shakeel Butt     2018-08-17  477   * @memcg: memcg to charge.
d46eb14b735b11 Shakeel Butt     2018-08-17  478   *
d46eb14b735b11 Shakeel Butt     2018-08-17  479   * This function marks the beginning of the remote memcg charging scope. All the
d46eb14b735b11 Shakeel Butt     2018-08-17  480   * __GFP_ACCOUNT allocations till the end of the scope will be charged to the
d46eb14b735b11 Shakeel Butt     2018-08-17  481   * given memcg.
d46eb14b735b11 Shakeel Butt     2018-08-17  482   *
e86828e5446d95 Roman Gushchin   2023-10-19  483   * Please, make sure that caller has a reference to the passed memcg structure,
e86828e5446d95 Roman Gushchin   2023-10-19  484   * so its lifetime is guaranteed to exceed the scope between two
e86828e5446d95 Roman Gushchin   2023-10-19  485   * set_active_memcg() calls.
e86828e5446d95 Roman Gushchin   2023-10-19  486   *
b87d8cefe43c7f Roman Gushchin   2020-10-17  487   * NOTE: This function can nest. Users must save the return value and
b87d8cefe43c7f Roman Gushchin   2020-10-17  488   * reset the previous value after their own charging scope is over.
d46eb14b735b11 Shakeel Butt     2018-08-17  489   */
b87d8cefe43c7f Roman Gushchin   2020-10-17  490  static inline struct mem_cgroup *
b87d8cefe43c7f Roman Gushchin   2020-10-17  491  set_active_memcg(struct mem_cgroup *memcg)
d46eb14b735b11 Shakeel Butt     2018-08-17  492  {
37d5985c003daa Roman Gushchin   2020-10-17  493  	struct mem_cgroup *old;
37d5985c003daa Roman Gushchin   2020-10-17  494  
55a68c82395185 Vasily Averin    2021-09-02  495  	if (!in_task()) {
37d5985c003daa Roman Gushchin   2020-10-17 @496  		old = this_cpu_read(int_active_memcg);
37d5985c003daa Roman Gushchin   2020-10-17  497  		this_cpu_write(int_active_memcg, memcg);
37d5985c003daa Roman Gushchin   2020-10-17  498  	} else {
37d5985c003daa Roman Gushchin   2020-10-17  499  		old = current->active_memcg;
d46eb14b735b11 Shakeel Butt     2018-08-17  500  		current->active_memcg = memcg;
37d5985c003daa Roman Gushchin   2020-10-17  501  	}
37d5985c003daa Roman Gushchin   2020-10-17  502  
b87d8cefe43c7f Roman Gushchin   2020-10-17  503  	return old;
d46eb14b735b11 Shakeel Butt     2018-08-17  504  }
d46eb14b735b11 Shakeel Butt     2018-08-17  505  #else
b87d8cefe43c7f Roman Gushchin   2020-10-17  506  static inline struct mem_cgroup *
b87d8cefe43c7f Roman Gushchin   2020-10-17  507  set_active_memcg(struct mem_cgroup *memcg)
d46eb14b735b11 Shakeel Butt     2018-08-17  508  {
b87d8cefe43c7f Roman Gushchin   2020-10-17  509  	return NULL;
d46eb14b735b11 Shakeel Butt     2018-08-17  510  }
d46eb14b735b11 Shakeel Butt     2018-08-17  511  #endif
d46eb14b735b11 Shakeel Butt     2018-08-17  512  

:::::: The code at line 496 was first introduced by commit
:::::: 37d5985c003daab138a72dd4af9853b396d91c26 mm: kmem: prepare remote memcg charging infra for interrupt contexts

:::::: TO: Roman Gushchin <guro@fb.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
