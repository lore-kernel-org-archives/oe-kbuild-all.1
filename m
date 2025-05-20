Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EE6259CAF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 04:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747715872; cv=none; b=iB17xi4TZpk0Mn9eIEYVTGcHlkTG8yY5Rc3vImf/d0+MokFtp+nGliJWDv9tDCSlC+DmzunHh6N9KpJyJEK1HIao8VY+oG7KXL70jkjWx6u+hCNHN+KZgdiWE0UlhuQElRkbj6fbgA8WrRL+IZDqiCUmncXwSG86sSN25PBbh1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747715872; c=relaxed/simple;
	bh=SfA7QmMI4tte7jluGByenSWRaHT1a4eP2zm3hzErzk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2JA9oyytSoS3WdBeq0LLqnyUoJp/NvPVbRmC75v3e5mA7uAPKcJpIev9/WiRDutO547cSgkdkwLjR17yUA/UVNROwvtKVKqJFEt93CZKFbnp32UpHDC4D/+txv2I3lS7DTc26ThaGDF8lCf8cqOVSQxMidni95zGZsuBuGJlj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExMUz0AN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExMUz0AN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747715870; x=1779251870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SfA7QmMI4tte7jluGByenSWRaHT1a4eP2zm3hzErzk0=;
  b=ExMUz0ANdXn2WaVHUafC/lS/AHh2gov7wrlboa4qNukwzdnxXTP9Kt23
   Lv55ZRvWMbfA3TTuUXrl1m+LcHx8IaPtkbEP64UiJmc/9VSQMpOvT0tqf
   fDSW1JjYr4kPnydQM3BadTnXv6PuKbrb1K2qDwF5fthBihtKRj/DXB20d
   G+aWjslfaZRVw7XzZe+XVefxMfwGfSplUOVbzxGBE01GXrit145vjDQth
   mLbkO1UI+8L6JBv0kpv+sbh9t+C5wfq4VXaS+b09DJRGRqEMCZogNSc8X
   lNX2uggg6eVVqyneCNOeLh9FOXqz4XfA8kupPGDtMBP6n7tKZU8AGwrsx
   g==;
X-CSE-ConnectionGUID: UeaMiBALSkWT1/in7DMSCA==
X-CSE-MsgGUID: AbrojqfsR7C4STqokTQfMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="67186512"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="67186512"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 21:37:49 -0700
X-CSE-ConnectionGUID: 3/SU5uJvQUGS+9iJ8En1Bw==
X-CSE-MsgGUID: p9aAIKoeSKy9GtSGcw9WBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140100130"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 May 2025 21:37:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHEja-000MA6-1b;
	Tue, 20 May 2025 04:37:46 +0000
Date: Tue, 20 May 2025 12:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.2 15/15] mm/vmscan.c:4163:43: error: passing
 argument 1 of 'mutex_trylock' from incompatible pointer type
Message-ID: <202505201253.vPJQiPYv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.2
head:   1078570cd7bf92cc1b6d67e990786cfb9a717785
commit: 1078570cd7bf92cc1b6d67e990786cfb9a717785 [15/15] mm: oom: stop exporting oom_lock mutex
config: arc-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201253.vPJQiPYv-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201253.vPJQiPYv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201253.vPJQiPYv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/ptrace.h:11,
                    from arch/arc/include/asm/bug.h:11,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/vmscan.c:15:
   mm/vmscan.c: In function 'lru_gen_age_node':
>> mm/vmscan.c:4163:43: error: passing argument 1 of 'mutex_trylock' from incompatible pointer type [-Wincompatible-pointer-types]
    4163 |         if (!reclaimable && mutex_trylock(&oom_lock)) {
         |                                           ^~~~~~~~~
         |                                           |
         |                                           void (*)(struct oom_control *)
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   mm/vmscan.c:4163:9: note: in expansion of macro 'if'
    4163 |         if (!reclaimable && mutex_trylock(&oom_lock)) {
         |         ^~
   In file included from include/linux/seqlock.h:19,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   include/linux/mutex.h:196:40: note: expected 'struct mutex *' but argument is of type 'void (*)(struct oom_control *)'
     196 | extern int mutex_trylock(struct mutex *lock);
         |                          ~~~~~~~~~~~~~~^~~~
>> mm/vmscan.c:4163:43: error: passing argument 1 of 'mutex_trylock' from incompatible pointer type [-Wincompatible-pointer-types]
    4163 |         if (!reclaimable && mutex_trylock(&oom_lock)) {
         |                                           ^~~~~~~~~
         |                                           |
         |                                           void (*)(struct oom_control *)
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   mm/vmscan.c:4163:9: note: in expansion of macro 'if'
    4163 |         if (!reclaimable && mutex_trylock(&oom_lock)) {
         |         ^~
   include/linux/mutex.h:196:40: note: expected 'struct mutex *' but argument is of type 'void (*)(struct oom_control *)'
     196 | extern int mutex_trylock(struct mutex *lock);
         |                          ~~~~~~~~~~~~~~^~~~
>> mm/vmscan.c:4163:43: error: passing argument 1 of 'mutex_trylock' from incompatible pointer type [-Wincompatible-pointer-types]
    4163 |         if (!reclaimable && mutex_trylock(&oom_lock)) {
         |                                           ^~~~~~~~~
         |                                           |
         |                                           void (*)(struct oom_control *)
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   mm/vmscan.c:4163:9: note: in expansion of macro 'if'
    4163 |         if (!reclaimable && mutex_trylock(&oom_lock)) {
         |         ^~
   include/linux/mutex.h:196:40: note: expected 'struct mutex *' but argument is of type 'void (*)(struct oom_control *)'
     196 | extern int mutex_trylock(struct mutex *lock);
         |                          ~~~~~~~~~~~~~~^~~~
>> mm/vmscan.c:4171:30: error: passing argument 1 of 'mutex_unlock' from incompatible pointer type [-Wincompatible-pointer-types]
    4171 |                 mutex_unlock(&oom_lock);
         |                              ^~~~~~~~~
         |                              |
         |                              void (*)(struct oom_control *)
   include/linux/mutex.h:197:40: note: expected 'struct mutex *' but argument is of type 'void (*)(struct oom_control *)'
     197 | extern void mutex_unlock(struct mutex *lock);
         |                          ~~~~~~~~~~~~~~^~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics


vim +/mutex_trylock +4163 mm/vmscan.c

1332a809d95a4f Yu Zhao        2022-09-18  4137  
ac35a490237446 Yu Zhao        2022-09-18  4138  static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
ac35a490237446 Yu Zhao        2022-09-18  4139  {
ac35a490237446 Yu Zhao        2022-09-18  4140  	struct mem_cgroup *memcg;
1332a809d95a4f Yu Zhao        2022-09-18  4141  	unsigned long min_ttl = READ_ONCE(lru_gen_min_ttl);
30d77b7eef019f Yu Zhao        2024-07-12  4142  	bool reclaimable = !min_ttl;
ac35a490237446 Yu Zhao        2022-09-18  4143  
ac35a490237446 Yu Zhao        2022-09-18  4144  	VM_WARN_ON_ONCE(!current_is_kswapd());
ac35a490237446 Yu Zhao        2022-09-18  4145  
30d77b7eef019f Yu Zhao        2024-07-12  4146  	set_initial_priority(pgdat, sc);
bd74fdaea14602 Yu Zhao        2022-09-18  4147  
ac35a490237446 Yu Zhao        2022-09-18  4148  	memcg = mem_cgroup_iter(NULL, NULL, NULL);
ac35a490237446 Yu Zhao        2022-09-18  4149  	do {
ac35a490237446 Yu Zhao        2022-09-18  4150  		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
ac35a490237446 Yu Zhao        2022-09-18  4151  
30d77b7eef019f Yu Zhao        2024-07-12  4152  		mem_cgroup_calculate_protection(NULL, memcg);
ac35a490237446 Yu Zhao        2022-09-18  4153  
30d77b7eef019f Yu Zhao        2024-07-12  4154  		if (!reclaimable)
30d77b7eef019f Yu Zhao        2024-07-12  4155  			reclaimable = lruvec_is_reclaimable(lruvec, sc, min_ttl);
ac35a490237446 Yu Zhao        2022-09-18  4156  	} while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)));
bd74fdaea14602 Yu Zhao        2022-09-18  4157  
1332a809d95a4f Yu Zhao        2022-09-18  4158  	/*
1332a809d95a4f Yu Zhao        2022-09-18  4159  	 * The main goal is to OOM kill if every generation from all memcgs is
1332a809d95a4f Yu Zhao        2022-09-18  4160  	 * younger than min_ttl. However, another possibility is all memcgs are
7348cc91821b0c Yu Zhao        2022-12-21  4161  	 * either too small or below min.
1332a809d95a4f Yu Zhao        2022-09-18  4162  	 */
30d77b7eef019f Yu Zhao        2024-07-12 @4163  	if (!reclaimable && mutex_trylock(&oom_lock)) {
1332a809d95a4f Yu Zhao        2022-09-18  4164  		struct oom_control oc = {
efada76077d88c Roman Gushchin 2025-05-16  4165  			.type = OOM_TYPE_SYSTEM,
1332a809d95a4f Yu Zhao        2022-09-18  4166  			.gfp_mask = sc->gfp_mask,
1332a809d95a4f Yu Zhao        2022-09-18  4167  		};
1332a809d95a4f Yu Zhao        2022-09-18  4168  
1332a809d95a4f Yu Zhao        2022-09-18  4169  		out_of_memory(&oc);
1332a809d95a4f Yu Zhao        2022-09-18  4170  
1332a809d95a4f Yu Zhao        2022-09-18 @4171  		mutex_unlock(&oom_lock);
1332a809d95a4f Yu Zhao        2022-09-18  4172  	}
ac35a490237446 Yu Zhao        2022-09-18  4173  }
ac35a490237446 Yu Zhao        2022-09-18  4174  

:::::: The code at line 4163 was first introduced by commit
:::::: 30d77b7eef019fa4422980806e8b7cdc8674493e mm/mglru: fix ineffective protection calculation

:::::: TO: Yu Zhao <yuzhao@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
