Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C011EE7B9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 08:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261696; cv=none; b=YvBYp5ZMmYyuFK9xrIneXRBJxgUm8Epl4yRWL7LtDJFoMDszLSP6ek4aUm0BUQ3NHRyrJVWjEQk+pjqDWpzlfcYnBwK0izCK4G0ONHavH8hV49UPK5cKzUS2Njh+o0LDf9nK0vvX7xbReqIYYYGrqhyqU7OnFYtxDvpJsCI7flE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261696; c=relaxed/simple;
	bh=u3HEH7+KRUgfzb1YwdfHiQD4cz8weo86cFpq6JLpF8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+Mt5ZieOMxiKHPfBsBcH+Dhm7/TFrBD92rvcJ7eAkP0iZzJv660Lj/kII1vldJ9ZxVVlLuEEBTi/Iadt90LDDjELGmpDtr8KhvaSJ/Bs1I7aqOYtJumJ6aRJfhKY0I8sEWNrwkpeXZ/PiaZHqyhLEkAjbfXBlaXceZ9pCS6LnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5d8sYXM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5d8sYXM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739261694; x=1770797694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u3HEH7+KRUgfzb1YwdfHiQD4cz8weo86cFpq6JLpF8Y=;
  b=R5d8sYXMy6m6sRQDkADOVey8N8/lcnYBJfMIaqeO9d1yuNDbkwADsq7X
   dhabh0CfQL7I7Z5tpAv9gdKhP0U2mxa2Ep1cn02QhCNKEu1AzExHSrslS
   DhMZWQ6tTA47aTtd2kZ1iBzxY7QD/uKViKut34I/yh719epIgWJrrvH88
   qWJsgdzeyly4LS9bSFXhlF2xNkHh+Yo/TZMliIrNlXfhyg/YdEya2tf7j
   +dbrKUPyIn8m3Z7hErrIg4prV30k9iyzMt09V7YnMwXTJK3sIOs/PZdjw
   8zNcLthaEl29KwXcCh/7CJaKAoXQ8UsxSPiKsAxmLZXpky/0z80tl8RSq
   g==;
X-CSE-ConnectionGUID: NRK5PQbcQ86q5kdfhGsXIw==
X-CSE-MsgGUID: 5LNCqaC5Sd6iCRYbjAtRlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="40138142"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="40138142"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 00:14:48 -0800
X-CSE-ConnectionGUID: he11YhHySmye8y/yLcbEeg==
X-CSE-MsgGUID: /NNKReeWS12NJKXwIJO9gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143342704"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Feb 2025 00:14:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thlPX-0013uT-1e;
	Tue, 11 Feb 2025 08:14:27 +0000
Date: Tue, 11 Feb 2025 16:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2735/2735] kernel/sched/core.c:8279:18: error:
 member reference base type 'struct task_group *(struct task_struct *)' is
 not a structure or union
Message-ID: <202502111634.nTWpsBtE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7152a244f5f9fb024d93d293168ce0b62309680a
commit: b7772972a0a76efac27078392f3f706914fe2af7 [2735/2735] sched/core: Add cpu.steal_task in cgroup v1 cpu subsystem
config: x86_64-randconfig-103-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111634.nTWpsBtE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111634.nTWpsBtE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111634.nTWpsBtE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:10:
   In file included from include/trace/events/sched.h:738:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:1587:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/core.c:13:
   kernel/sched/sched.h:1863:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1863 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:2750:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
    2750 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^
   kernel/sched/core.c:2750:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2750 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         | ^
         | static 
   kernel/sched/core.c:4126:10: warning: cast from 'void (*)(struct callback_head *)' to 'void (*)(struct rq *)' converts to incompatible function type [-Wcast-function-type-strict]
    4126 |                 func = (void (*)(struct rq *))head->func;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:8279:3: error: use of undeclared identifier 'root_task_group'; did you mean 'task_group'?
    8279 |                 root_task_group.steal_task = TG_STEAL_NO;
         |                 ^~~~~~~~~~~~~~~
         |                 task_group
   kernel/sched/sched.h:2058:34: note: 'task_group' declared here
    2058 | static inline struct task_group *task_group(struct task_struct *p)
         |                                  ^
>> kernel/sched/core.c:8279:18: error: member reference base type 'struct task_group *(struct task_struct *)' is not a structure or union
    8279 |                 root_task_group.steal_task = TG_STEAL_NO;
         |                 ~~~~~~~~~~~~~~~^~~~~~~~~~~
>> kernel/sched/core.c:8279:32: error: use of undeclared identifier 'TG_STEAL_NO'; did you mean 'PGSTEAL_ANON'?
    8279 |                 root_task_group.steal_task = TG_STEAL_NO;
         |                                              ^~~~~~~~~~~
         |                                              PGSTEAL_ANON
   include/linux/vm_event_item.h:41:3: note: 'PGSTEAL_ANON' declared here
      41 |                 PGSTEAL_ANON,
         |                 ^
   7 warnings and 3 errors generated.


vim +8279 kernel/sched/core.c

  8253	
  8254		wait_bit_init();
  8255	
  8256	#ifdef CONFIG_FAIR_GROUP_SCHED
  8257		ptr += 2 * nr_cpu_ids * sizeof(void **);
  8258	#endif
  8259	#ifdef CONFIG_RT_GROUP_SCHED
  8260		ptr += 2 * nr_cpu_ids * sizeof(void **);
  8261	#endif
  8262		if (ptr) {
  8263			ptr = (unsigned long)kzalloc(ptr, GFP_NOWAIT);
  8264	
  8265	#ifdef CONFIG_FAIR_GROUP_SCHED
  8266			root_task_group.se = (struct sched_entity **)ptr;
  8267			ptr += nr_cpu_ids * sizeof(void **);
  8268	
  8269			root_task_group.cfs_rq = (struct cfs_rq **)ptr;
  8270			ptr += nr_cpu_ids * sizeof(void **);
  8271	
  8272			root_task_group.shares = ROOT_TASK_GROUP_LOAD;
  8273			init_cfs_bandwidth(&root_task_group.cfs_bandwidth);
  8274	#endif /* CONFIG_FAIR_GROUP_SCHED */
  8275	#ifdef CONFIG_QOS_SCHED_SMT_EXPELLER
  8276			root_task_group.smt_expell = TG_SMT_EXPELL;
  8277	#endif
  8278	#ifdef CONFIG_SCHED_STEAL
> 8279			root_task_group.steal_task = TG_STEAL_NO;
  8280	#endif
  8281	#ifdef CONFIG_RT_GROUP_SCHED
  8282			root_task_group.rt_se = (struct sched_rt_entity **)ptr;
  8283			ptr += nr_cpu_ids * sizeof(void **);
  8284	
  8285			root_task_group.rt_rq = (struct rt_rq **)ptr;
  8286			ptr += nr_cpu_ids * sizeof(void **);
  8287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
