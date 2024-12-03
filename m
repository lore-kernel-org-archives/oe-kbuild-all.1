Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B066C19C543
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733213526; cv=none; b=BQRhfkCdre+Lhu1Hp/03oEunYTrsWra9pcmnQqclQ8HDTAaDnzMW6JohbFEWAad/QL0KiJfrfnGT0zOIE+rCevZRLeTbvIjK6YdwnNZb7iOOMmxGsvQv4HG7SCYv+XdAba5Nrr1j7k/YauOOZ1EgCGjWtbhpCNj9kGZAHMS87SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733213526; c=relaxed/simple;
	bh=nC/9AgYkQYd67w3OXGLKGdZT5swgyaOeE007rjrUoJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WxP2J4CSGlF5dMzOzZH7NckIxURZ3OMXct3SlOo0B8sTCS+TO6Z+YVOz23Ddv7lmr2pQMjZQq2B6VuZe1CIRSuw6x6TPQhzV/f6Q2GMzhPQwYJ6MVTqsGjgvojVPPi67uAXXVR3smZx+Pl8hYhz7sKAuY1reyyZTJlqPMoW9JZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1AqBuYB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1AqBuYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733213525; x=1764749525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nC/9AgYkQYd67w3OXGLKGdZT5swgyaOeE007rjrUoJQ=;
  b=W1AqBuYB40battxNflvui5u8Yh/s5dR+yoJFR7f0N97nRJhIgHBIQT/p
   RtAU0keW41FjswrjfYZVsbJI8l2QA7wolKUt1YQkfT450EopB4bvS4YGW
   kzzOQomqPOMuTMBb0wq2Ssb40NqV+i0A2rdC9nL6oANlfKOhKye1I+EtK
   BM/BlNfU2RswsjZVMC6lrPBOE6ZSy35wbF+MfDpWi80jCcq6pbqOxsjPv
   6QRybRUNJ7OAccFwmQcuzUNAs+VNboTFhVQ74e5WT6dSg+B9GinjJwrO0
   lmuU9gbFPbalPuphez1eRzohvT/aQmihkDN4jctvfVxmt/Z4NeJB+2zPQ
   w==;
X-CSE-ConnectionGUID: tI3dLKlDTmKHGYSnYUZjEA==
X-CSE-MsgGUID: rOe55UmeRyq31nDozJD7Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="50939024"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="50939024"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 00:12:04 -0800
X-CSE-ConnectionGUID: PQE6BiHJT8qD/lEFg7NBJg==
X-CSE-MsgGUID: SjMz3sqPQsaufOC5+hVDdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="116616497"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Dec 2024 00:12:03 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIO0m-0000L6-2K;
	Tue, 03 Dec 2024 08:12:00 +0000
Date: Tue, 3 Dec 2024 16:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hui Tang <tanghui20@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516] kernel/sched/relationship.c:46:39:
 error: no member named 'mems_allowed' in 'struct task_struct'
Message-ID: <202412031643.JKJ5FFhF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f86196bf02fd9bea8511335c45bf10b6b0a3ea13
commit: 2ac826b258e9aceefd719f7b0c3e3a9e73901ce5 [2516/2516] sched: Introduce task relationship by net and memory
config: x86_64-randconfig-r063-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031643.JKJ5FFhF-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031643.JKJ5FFhF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031643.JKJ5FFhF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/relationship.c:19:
   In file included from include/linux/bpf_sched.h:5:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:1581:
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
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/relationship.c:22:
   kernel/sched/sched.h:1838:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1838 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/relationship.c:46:39: error: no member named 'mems_allowed' in 'struct task_struct'
      46 |                 !nodes_subset(node_online_map, tsk->mems_allowed) ||
         |                                                ~~~  ^
   include/linux/nodemask.h:218:30: note: expanded from macro 'nodes_subset'
     218 |                         __nodes_subset(&(src1), &(src2), MAX_NUMNODES)
         |                                                   ^~~~
   6 warnings and 1 error generated.


vim +46 kernel/sched/relationship.c

    38	
    39	bool task_relationship_supported(struct task_struct *tsk)
    40	{
    41		if (!task_relationship_used())
    42			return false;
    43	
    44		if (!tsk->rship || !tsk->mm ||
    45			!cpumask_subset(cpu_online_mask, tsk->cpus_ptr) ||
  > 46			!nodes_subset(node_online_map, tsk->mems_allowed) ||
    47			get_task_policy(tsk)->mode == MPOL_BIND ||
    48			get_task_policy(tsk)->mode == MPOL_INTERLEAVE)
    49			return false;
    50	
    51		return true;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
