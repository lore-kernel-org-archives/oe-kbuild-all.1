Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F1E37B023
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205782; cv=none; b=bIwVdbtQQpP/MPdDFmVovZJnm9jpCSGVXtNqQu2AT4PlnaIKMaosOlo7I4A+wSgyuDCXq1aADu3Qf1ZfBj6VnUVNlDXVZELZaIbXuyaK2Ljr6JTknJ+dIWEuxY2sbhluvPLHw27jl0Xkh6pajSZt7sH1dN3NsxxJOS9rfgnO/yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205782; c=relaxed/simple;
	bh=iAMrJHtL2poSkxQFRUT/CbPctzlgJfcktgmlgzoTN4U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V9TmqP93G8Ve0s9MHAfwGb4UsMGeWYOEnfTMT/0QiafXtcsGxTFZurTfYVmeb2SWMDoI1C3iKYZ0aXnwXg8IJ1wWg69278nyG3nJ/Gi2qp9kKeliylUVfBooLnjrecrh1JQGW0iipuBzwCnGw3EsS/bLS6TC+Nrn5AB2pCUdLPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCNDTgTG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCNDTgTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205780; x=1806741780;
  h=date:from:to:cc:subject:message-id;
  bh=iAMrJHtL2poSkxQFRUT/CbPctzlgJfcktgmlgzoTN4U=;
  b=oCNDTgTGLz47+bgMslq+lBxiXmvq7fKY9rx7LD4ZbYLnXrPB7pKoZEDz
   FzZzLyqvxdoAWjGI+zGhM8t6oltL1k6m0hIR6eH9y2ERpqz7uNUXHaDGo
   8xXsBwLTigHXppxksRz3BU9hVOoMz9mGTcGuU5Choc1sksLLg9JGkvggi
   h5VID5JTMylpB58ARWp2HpapZxNz3BNXRGFP1zKD45Zq6MCzX1EzSQLAD
   AOAOUI8IOjlIXcLPF14cBemjaFRGnS5NDz6teXzvskWYGpi8LzOMgLCzN
   7YygBSCMz/4DmZCR3f7gHKvXgdZbMO4p0+1LLpGoscC01a0gliNJ/APDP
   A==;
X-CSE-ConnectionGUID: SQ3u6tl5TaeJhrrtq/Cm9w==
X-CSE-MsgGUID: DdHjbrMoR9GNQDa2ynu8bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75311889"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75311889"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:42:59 -0700
X-CSE-ConnectionGUID: vCOOGIURQguVEdwz/ngyCQ==
X-CSE-MsgGUID: iQHUZHR8R2OGMv7/Ekd8Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250286596"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:42:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a7D-0000000013Y-1Ron;
	Fri, 03 Apr 2026 08:42:55 +0000
Date: Fri, 03 Apr 2026 16:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-04 1/1]
 mm/oom_kill.c:426:6: warning: no previous prototype for function 'dump_tasks'
Message-ID: <202604030019.QPgHdAzI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-04
head:   1a029ed73e0c73261faa5c9cfc848e08ce285151
commit: 9c79e4cf566128a03f7bec29a8e948b27f0be2fa [1/1] ANDROID: mm: export dump_tasks symbol.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260403/202604030019.QPgHdAzI-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030019.QPgHdAzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030019.QPgHdAzI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/oom_kill.c:21:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:2238:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> mm/oom_kill.c:426:6: warning: no previous prototype for function 'dump_tasks' [-Wmissing-prototypes]
     426 | void dump_tasks(struct oom_control *oc)
         |      ^
   mm/oom_kill.c:426:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     426 | void dump_tasks(struct oom_control *oc)
         | ^
         | static 
   6 warnings generated.


vim +/dump_tasks +426 mm/oom_kill.c

   415	
   416	/**
   417	 * dump_tasks - dump current memory state of all system tasks
   418	 * @oc: pointer to struct oom_control
   419	 *
   420	 * Dumps the current memory state of all eligible tasks.  Tasks not in the same
   421	 * memcg, not in the same cpuset, or bound to a disjoint set of mempolicy nodes
   422	 * are not shown.
   423	 * State information includes task's pid, uid, tgid, vm size, rss,
   424	 * pgtables_bytes, swapents, oom_score_adj value, and name.
   425	 */
 > 426	void dump_tasks(struct oom_control *oc)
   427	{
   428		pr_info("Tasks state (memory values in pages):\n");
   429		pr_info("[  pid  ]   uid  tgid total_vm      rss pgtables_bytes swapents oom_score_adj name\n");
   430	
   431		if (is_memcg_oom(oc))
   432			mem_cgroup_scan_tasks(oc->memcg, dump_task, oc);
   433		else {
   434			struct task_struct *p;
   435	
   436			rcu_read_lock();
   437			for_each_process(p)
   438				dump_task(p, oc);
   439			rcu_read_unlock();
   440		}
   441	}
   442	EXPORT_SYMBOL_GPL(dump_tasks);
   443	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
