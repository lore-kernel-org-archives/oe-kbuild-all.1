Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5CA37EFF1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 05:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786857080; cv=none; b=LrmjduBV/KDSyGQtvlylYCnIW7GoaisdQ/6tlOjnZvn3mR+N9rthAOrhs6Xb1/VhG6tO5xtnwVFT+swQMfcZxpnWk25M4qa4YaqV1DOYru4OxrmGrXhhIPpl7qL/XS2Zv/x1P6wxwR+3k7IEDZ5+0fQhQHZfPO6bE5wI0DC6CZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786857080; c=relaxed/simple;
	bh=USXosNWCvxELyWsTsEZLwVB74ZOKMg+9OBhm21Li+wg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GFG3w/LzPtUlH/ec58T8w4S6Uz4LN/5VnZOzuBa9jEw7ljfQeNeCTRf7cy7+SbfOWqOPO35heUidwpf31e0Hq+S/5DD71VHV9cXKitGEnopsgL9EaZSFUNfuuwD1/vpwOaDkmw11BahSbpd13VhSEw0jRAmLKhhD16np83yss0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dS9BklyE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dS9BklyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786857078; x=1818393078;
  h=date:from:to:cc:subject:message-id;
  bh=USXosNWCvxELyWsTsEZLwVB74ZOKMg+9OBhm21Li+wg=;
  b=dS9BklyERTkqIsHZkzkjXcrDpPr+dT7WWYmGV4U6I6See5LvgMTk75Cm
   P2+1nCNzQORxtLSf9JFA0kvO4h35C8YZ1Xtw8d8kfcg2OkJj4E3EsgAjT
   hPwhC1dmyAdr+GQx/r/gtKNpbP7Mt77Gd85op68zpq6AjNmzdBkCYnNo1
   vcktNnh/i9jvKzfit281slX7kif3IMjAkLHJLwR2wWrd8luOoyQM7DUGr
   vsMY5DoXQHuqjR+9290hA3SWR5Px9sH0vHBN8bXJM4Jyx1KJhlWxfnR4r
   dvEmh04sUZHzigaAKIC8dyEriRqOZAOIHSw+LXkLelZIIkSk8DgDM6BAt
   w==;
X-CSE-ConnectionGUID: 1D4zNgd0TZeaWE1JDRCB7w==
X-CSE-MsgGUID: wBoG5gdcRjK66yj86r4myg==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87441005"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87441005"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 22:11:17 -0700
X-CSE-ConnectionGUID: 3Ts4zX9fQ3uOx07sBWNt7w==
X-CSE-MsgGUID: YTBEUlroS7WMKpc2/UZcPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="294521739"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 15 Aug 2026 22:11:16 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvT9N-000000006YL-1KFN;
	Sun, 16 Aug 2026 05:11:13 +0000
Date: Sun, 16 Aug 2026 07:10:28 +0200
From: kernel test robot <lkp@intel.com>
To: Jianyong Wu <wujianyong@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/sched/fair.c:4004:13: error: implicit declaration of
 function 'sched_cache_override_numa'
Message-ID: <202608160738.F2IHmVhf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jianyong-Wu/sched-topo-Add-some-llc-related-helpers/20260813-033153
head:   401facce126338688b04e3ec71da6345310c9a39
commit: ae33ef4db803424de60c67a6fdab44e102e92ec7 sched: Let sched cache take precedence over NUMA balancing
date:   3 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260816/202608160738.F2IHmVhf-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160738.F2IHmVhf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160738.F2IHmVhf-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'task_numa_fault':
>> kernel/sched/fair.c:4004:13: error: implicit declaration of function 'sched_cache_override_numa' [-Wimplicit-function-declaration]
    4004 |         if (sched_cache_override_numa())
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sched_cache_override_numa +4004 kernel/sched/fair.c

  3984	
  3985	/*
  3986	 * Got a PROT_NONE fault for a page on @node.
  3987	 */
  3988	void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
  3989	{
  3990		struct task_struct *p = current;
  3991		bool migrated = flags & TNF_MIGRATED;
  3992		int cpu_node = task_node(current);
  3993		int local = !!(flags & TNF_FAULT_LOCAL);
  3994		struct numa_group *ng;
  3995		int priv;
  3996	
  3997		if (!static_branch_likely(&sched_numa_balancing))
  3998			return;
  3999	
  4000		/*
  4001		 * We just want to migrate page other than migrate task
  4002		 * once sched cache override numa balance is enabled.
  4003		 */
> 4004		if (sched_cache_override_numa())
  4005			return;
  4006	
  4007		/* for example, ksmd faulting in a user's mm */
  4008		if (!p->mm)
  4009			return;
  4010	
  4011		/*
  4012		 * NUMA faults statistics are unnecessary for the slow memory
  4013		 * node for memory tiering mode.
  4014		 */
  4015		if (!node_is_toptier(mem_node) &&
  4016		    (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING ||
  4017		     !cpupid_valid(last_cpupid)))
  4018			return;
  4019	
  4020		/* Allocate buffer to track faults on a per-node basis */
  4021		if (unlikely(!p->numa_faults)) {
  4022			int size = sizeof(*p->numa_faults) *
  4023				   NR_NUMA_HINT_FAULT_BUCKETS * nr_node_ids;
  4024	
  4025			p->numa_faults = kzalloc(size, GFP_KERNEL|__GFP_NOWARN);
  4026			if (!p->numa_faults)
  4027				return;
  4028	
  4029			p->total_numa_faults = 0;
  4030			memset(p->numa_faults_locality, 0, sizeof(p->numa_faults_locality));
  4031		}
  4032	
  4033		/*
  4034		 * First accesses are treated as private, otherwise consider accesses
  4035		 * to be private if the accessing pid has not changed
  4036		 */
  4037		if (unlikely(last_cpupid == (-1 & LAST_CPUPID_MASK))) {
  4038			priv = 1;
  4039		} else {
  4040			priv = cpupid_match_pid(p, last_cpupid);
  4041			if (!priv && !(flags & TNF_NO_GROUP))
  4042				task_numa_group(p, last_cpupid, flags, &priv);
  4043		}
  4044	
  4045		/*
  4046		 * If a workload spans multiple NUMA nodes, a shared fault that
  4047		 * occurs wholly within the set of nodes that the workload is
  4048		 * actively using should be counted as local. This allows the
  4049		 * scan rate to slow down when a workload has settled down.
  4050		 */
  4051		ng = deref_curr_numa_group(p);
  4052		if (!priv && !local && ng && ng->active_nodes > 1 &&
  4053					numa_is_active_node(cpu_node, ng) &&
  4054					numa_is_active_node(mem_node, ng))
  4055			local = 1;
  4056	
  4057		/*
  4058		 * Retry to migrate task to preferred node periodically, in case it
  4059		 * previously failed, or the scheduler moved us.
  4060		 */
  4061		if (time_after(jiffies, p->numa_migrate_retry)) {
  4062			task_numa_placement(p);
  4063			numa_migrate_preferred(p);
  4064		}
  4065	
  4066		if (migrated)
  4067			p->numa_pages_migrated += pages;
  4068		if (flags & TNF_MIGRATE_FAIL)
  4069			p->numa_faults_locality[2] += pages;
  4070	
  4071		p->numa_faults[task_faults_idx(NUMA_MEMBUF, mem_node, priv)] += pages;
  4072		p->numa_faults[task_faults_idx(NUMA_CPUBUF, cpu_node, priv)] += pages;
  4073		p->numa_faults_locality[local] += pages;
  4074	}
  4075	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
