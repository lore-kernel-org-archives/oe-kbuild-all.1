Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF301D63F9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 06:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733122259; cv=none; b=ijyXarrOjeS6/DApdoHXgRs1vHPNztg43n0CroQUXK149Ht+KLmbnhHVyZeeVBBq9G4XtEgY0+tYXincPnTXbtB9CddxQCIbuQQH6uB71NL7dPtw2CgRPxyopko71lNIroF6TdPgzl5Cy5ou9Ry003ewq2Li3mbMeyKejwgvLz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733122259; c=relaxed/simple;
	bh=HJrU0UuI0V70VPE5LkGEdWEahqUFnaJputgNDQzSIwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c7eXo9lyV8rVSmWmuPQRAcqNTl33Y7sd4U3sylyr+XZmUHsyskazrwe0xVbMXMI/rrz68jv/nIfRhrSEDQJ+O7xBRYll7cwVNYmmS0YRBVw0AGTALhMI5ByP422+6XTQdxgumrNOQKndfS6WYJIJJfMH0vxdnswMJ9ZLLchKuWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMHuhOWF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMHuhOWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733122257; x=1764658257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HJrU0UuI0V70VPE5LkGEdWEahqUFnaJputgNDQzSIwo=;
  b=cMHuhOWFRwdXS9No5zJD3N6XU7EoJmTjpL9WUtH3rttEuT5tKpjNdHvc
   Qh806aCFuqN2OWGQ/lep7uqdgCaCA5JlQD2Dz+SI/vJIqE67Pk13vBOdF
   k9Fgj2zP47NgKcYicAKmKLVtmUW8US+dWQeoHpP2LgjQAjI+5miBbjyD+
   Oj55PmXNPVXIxcVEIf/b0XxxVStFKhsTQaGdhUFaGdww4TuwapaaxB1z4
   C1ylzlmNXV/vaKOiDs9tJEX42ci6Oj9geJqdqsuucyD0utn1QgcfsVJM8
   b9D7CvjflVWxQPQAQglsI7qP5V/qpbuCsnWrrSZeougEOvjGlRKttJRS4
   A==;
X-CSE-ConnectionGUID: heb9Hc84TaGqOmzy/XnX4Q==
X-CSE-MsgGUID: yenIF27QRNKODrApN7HU4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33521474"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33521474"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 22:50:56 -0800
X-CSE-ConnectionGUID: 7betdqwtRCidSlgI+bJrKg==
X-CSE-MsgGUID: NDF6iS6ZTUq6TkLeDRrnwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="97975498"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 01 Dec 2024 22:50:55 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI0Gh-00029X-2e;
	Mon, 02 Dec 2024 06:50:51 +0000
Date: Mon, 2 Dec 2024 14:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1455/1455] kernel/sched/core.c:11516:4: warning:
 format specifies type 'unsigned long long' but the argument has type 'int'
Message-ID: <202412021440.Jt42bWEf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: 6eb07f9925a906d81f328c808ba25f7800888dce [1455/1455] sched: Introduce smart grid scheduling strategy for cfs
config: x86_64-buildonly-randconfig-004-20241112 (https://download.01.org/0day-ci/archive/20241202/202412021440.Jt42bWEf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021440.Jt42bWEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412021440.Jt42bWEf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2181:
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
   kernel/sched/core.c:11374:5: warning: no previous prototype for function 'tg_set_dynamic_affinity_mode' [-Wmissing-prototypes]
    11374 | int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
          |     ^
   kernel/sched/core.c:11374:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11374 | int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
          | ^
          | static 
   kernel/sched/core.c:11415:5: warning: no previous prototype for function 'tg_set_affinity_period' [-Wmissing-prototypes]
    11415 | int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
          |     ^
   kernel/sched/core.c:11415:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11415 | int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
          | ^
          | static 
   kernel/sched/core.c:11429:5: warning: no previous prototype for function 'tg_get_affinity_period' [-Wmissing-prototypes]
    11429 | u64 tg_get_affinity_period(struct task_group *tg)
          |     ^
   kernel/sched/core.c:11429:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11429 | u64 tg_get_affinity_period(struct task_group *tg)
          | ^
          | static 
>> kernel/sched/core.c:11516:4: warning: format specifies type 'unsigned long long' but the argument has type 'int' [-Wformat]
    11514 |                 seq_printf(sf, "sd_level %d, cpu list %*pbl, stay_cnt %llu\n",
          |                                                                       ~~~~
          |                                                                       %d
    11515 |                         i, cpumask_pr_args(ad->domains[i]),
    11516 |                         schedstat_val(ad->stay_cnt[i]));
          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/stats.h:100:32: note: expanded from macro 'schedstat_val'
     100 | # define   schedstat_val(var)           0
         |                                         ^
   9 warnings generated.


vim +11516 kernel/sched/core.c

 11493	
 11494	static int cpu_affinity_stat_show(struct seq_file *sf, void *v)
 11495	{
 11496		struct task_group *tg = css_tg(seq_css(sf));
 11497		struct auto_affinity *auto_affi = tg->auto_affinity;
 11498		struct affinity_domain *ad;
 11499		int i;
 11500	
 11501		/* No stat when dynamic affinity disabled */
 11502		if (!dynamic_affinity_enabled())
 11503			return -EPERM;
 11504	
 11505		if (unlikely(!auto_affi))
 11506			return -EPERM;
 11507	
 11508		ad = &auto_affi->ad;
 11509		seq_printf(sf, "period_active %d\n", auto_affi->period_active);
 11510		seq_printf(sf, "dcount %d\n", ad->dcount);
 11511		seq_printf(sf, "domain_mask 0x%x\n", ad->domain_mask);
 11512		seq_printf(sf, "curr_level %d\n", ad->curr_level);
 11513		for (i = 0; i < ad->dcount; i++)
 11514			seq_printf(sf, "sd_level %d, cpu list %*pbl, stay_cnt %llu\n",
 11515				i, cpumask_pr_args(ad->domains[i]),
 11516				schedstat_val(ad->stay_cnt[i]));
 11517	
 11518		return 0;
 11519	}
 11520	#endif /* CONFIG_QOS_SCHED_SMART_GRID */
 11521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
