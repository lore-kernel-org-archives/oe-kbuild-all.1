Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6221C46538
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 18:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhpN9h7i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703700012; x=1735236012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CxksFN7pLipTcdPqkmpusJ+sNcZrj+lwY7PJghX2WtM=;
  b=FhpN9h7i0m77WSspCgid5EUmHaJurJMz0krSt3SktAKRjCU8eoBNEmYn
   hLQN+MBYJIvJ3BXM3v3yBn/9I0zVSN2OnUM/oOfqMw2FWU+ZZ7MSXSDAC
   uhku0d5VfEKJvjf5/sI7JTqWl0U8K+03kNj2vdiuN/4dY4ZgWYTMkTbvY
   CxmDYunxoO42cFplBNhqpwHYD0eZ9WuEZrTC4yZ7ONZpAuScNRVJVqLhk
   PWrum+9vghEjE+UyqXyqXXj7kygysvu89VoebAv0NvvFaqJXrkbVjGQ66
   6xqhWKo4T/tUTE1+o3qINzhaDSK+krbotT8qVePgWwuX2fvP0caLzYt6Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="400282975"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="400282975"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 10:00:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="26626728"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Dec 2023 10:00:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIYCE-000FdR-2O;
	Wed, 27 Dec 2023 17:59:58 +0000
Date: Thu, 28 Dec 2023 01:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: mungerjiang <mungerjiang@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	kaixuxiakx <60962168+kaixuxiakx@users.noreply.github.com>,
	Bin Lai <robinlai@tencent.com>, benbjiang <benbjiang@tencent.com>,
	Bauerchen <bauerchen@tencent.com>
Subject: include/linux/sli.h:57:13: warning: 'sli_check_longsys' defined but
 not used
Message-ID: <202312280121.x7dLeD8X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 95a8c85b7fc097afff14500b1392124385d67b50 sli/cpu: introduce longsys check
date:   2 years, 2 months ago
config: arm64-randconfig-001-20231228 (https://download.01.org/0day-ci/archive/20231228/202312280121.x7dLeD8X-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312280121.x7dLeD8X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312280121.x7dLeD8X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/rculist.h:532:9: note: in expansion of macro 'rcu_assign_pointer'
     532 |         rcu_assign_pointer(hlist_first_rcu(h), n);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rculist.h: In function 'hlist_add_tail_rcu':
   include/linux/rcupdate.h:379:40: error: expected expression before ')' token
     379 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:568:17: note: in expansion of macro 'rcu_assign_pointer'
     568 |                 rcu_assign_pointer(hlist_next_rcu(last), n);
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:380:40: error: expected expression before ')' token
     380 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:568:17: note: in expansion of macro 'rcu_assign_pointer'
     568 |                 rcu_assign_pointer(hlist_next_rcu(last), n);
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/rculist.h: In function 'hlist_add_before_rcu':
   include/linux/rcupdate.h:379:40: error: expected expression before ')' token
     379 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:597:9: note: in expansion of macro 'rcu_assign_pointer'
     597 |         rcu_assign_pointer(hlist_pprev_rcu(n), n);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:380:40: error: expected expression before ')' token
     380 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:597:9: note: in expansion of macro 'rcu_assign_pointer'
     597 |         rcu_assign_pointer(hlist_pprev_rcu(n), n);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rculist.h: In function 'hlist_add_behind_rcu':
   include/linux/rcupdate.h:379:40: error: expected expression before ')' token
     379 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:624:9: note: in expansion of macro 'rcu_assign_pointer'
     624 |         rcu_assign_pointer(hlist_next_rcu(prev), n);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:380:40: error: expected expression before ')' token
     380 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:624:9: note: in expansion of macro 'rcu_assign_pointer'
     624 |         rcu_assign_pointer(hlist_next_rcu(prev), n);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rculist_bl.h: In function 'hlist_bl_set_first_rcu':
   include/linux/rcupdate.h:379:40: error: expected expression before ')' token
     379 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist_bl.h:17:9: note: in expansion of macro 'rcu_assign_pointer'
      17 |         rcu_assign_pointer(h->first,
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:380:40: error: expected expression before ')' token
     380 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist_bl.h:17:9: note: in expansion of macro 'rcu_assign_pointer'
      17 |         rcu_assign_pointer(h->first,
         |         ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/arm64/kernel/asm-offsets.c:16:
   include/linux/memcontrol.h: In function 'lruvec_holds_page_lru_lock':
   include/linux/memcontrol.h:978:34: error: 'pg_data_t' {aka 'struct pglist_data'} has no member named '__lruvec'; did you mean 'lruvec'?
     978 |         return lruvec == &pgdat->__lruvec;
         |                                  ^~~~~~~~
         |                                  lruvec
   include/linux/memcontrol.h: In function 'lock_page_lruvec':
   include/linux/memcontrol.h:1005:27: error: 'struct pglist_data' has no member named '__lruvec'; did you mean 'lruvec'?
    1005 |         spin_lock(&pgdat->__lruvec.lru_lock);
         |                           ^~~~~~~~
         |                           lruvec
   include/linux/memcontrol.h:1006:24: error: 'struct pglist_data' has no member named '__lruvec'; did you mean 'lruvec'?
    1006 |         return &pgdat->__lruvec;
         |                        ^~~~~~~~
         |                        lruvec
   include/linux/memcontrol.h: In function 'lock_page_lruvec_irq':
   include/linux/memcontrol.h:1013:31: error: 'struct pglist_data' has no member named '__lruvec'; did you mean 'lruvec'?
    1013 |         spin_lock_irq(&pgdat->__lruvec.lru_lock);
         |                               ^~~~~~~~
         |                               lruvec
   include/linux/memcontrol.h:1014:24: error: 'struct pglist_data' has no member named '__lruvec'; did you mean 'lruvec'?
    1014 |         return &pgdat->__lruvec;
         |                        ^~~~~~~~
         |                        lruvec
   In file included from include/linux/radix-tree.h:16:
   include/linux/memcontrol.h: In function 'lock_page_lruvec_irqsave':
   include/linux/memcontrol.h:1022:35: error: 'struct pglist_data' has no member named '__lruvec'; did you mean 'lruvec'?
    1022 |         spin_lock_irqsave(&pgdat->__lruvec.lru_lock, *flagsp);
         |                                   ^~~~~~~~
   include/linux/spinlock.h:250:48: note: in definition of macro 'raw_spin_lock_irqsave'
     250 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   include/linux/memcontrol.h:1022:9: note: in expansion of macro 'spin_lock_irqsave'
    1022 |         spin_lock_irqsave(&pgdat->__lruvec.lru_lock, *flagsp);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/memcontrol.h:1023:24: error: 'struct pglist_data' has no member named '__lruvec'; did you mean 'lruvec'?
    1023 |         return &pgdat->__lruvec;
         |                        ^~~~~~~~
         |                        lruvec
   In file included from include/linux/context_tracking.h:11,
                    from include/linux/kvm_host.h:24,
                    from arch/arm64/kernel/asm-offsets.c:14:
   include/linux/sli.h: At top level:
>> include/linux/sli.h:57:13: warning: 'sli_check_longsys' defined but not used [-Wunused-function]
      57 | static void sli_check_longsys(struct task_struct *tsk){};
         |             ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:99: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=3008103305
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1136: prepare0] Error 2 shuffle=3008103305
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:179: sub-make] Error 2 shuffle=3008103305
   make: Target 'prepare' not remade because of errors.


vim +/sli_check_longsys +57 include/linux/sli.h

    45	
    46	int  sli_cgroup_alloc(struct cgroup *cgroup);
    47	void sli_cgroup_free(struct cgroup *cgroup);
    48	void sli_memlat_stat_start(u64 *start);
    49	void sli_memlat_stat_end(enum sli_memlat_stat_item sidx, u64 start);
    50	int  sli_memlat_stat_show(struct seq_file *m, struct cgroup *cgrp);
    51	void sli_schedlat_stat(struct task_struct *task,enum sli_schedlat_stat_item sidx, u64 delta);
    52	void sli_schedlat_rundelay(struct task_struct *task, struct task_struct *prev, u64 delta);
    53	int  sli_schedlat_stat_show(struct seq_file *m, struct cgroup *cgrp);
    54	#ifdef CONFIG_SCHED_INFO
    55	void sli_check_longsys(struct task_struct *tsk);
    56	#else
  > 57	static void sli_check_longsys(struct task_struct *tsk){};

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
