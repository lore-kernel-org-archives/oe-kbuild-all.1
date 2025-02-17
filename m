Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0674415666D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 17:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739812386; cv=none; b=f4XEOPfy2GeMeUpMClV94FnD+RhtrQ8rumvapYcyYqf53SdbzDFhnZZiyLR5qzIIzO+qqqeSHJc4L1NmahYdhBl2xPCB2GFbI6FLHv/WuBRSysQuDtRsh+Wn/6CPwfd8CYssS9v//EuUGZ0Aw9IBNJsUDvQKPShpIRpEN7AE9LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739812386; c=relaxed/simple;
	bh=PPK6ajjHVunX2WRnRaBmso+7oSb0N3asfibxbG7y0us=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oUQ/EVlDjjZd81rJY4QkUNivxmUHnu56vhyfYNIuAJNdlEZkDwwxDVejiJDlHi/JVoaqX33kGCvhtjR8w6mQcrXzgdHViZTR0En4XU0oCV0+Gx8uDmFCsiQAqGk9cOCnI79Zcbfyr/VRzUeiXMAz+aAFMcDqrkeLTM4CgZgMbzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RW+Nw+HV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RW+Nw+HV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739812385; x=1771348385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PPK6ajjHVunX2WRnRaBmso+7oSb0N3asfibxbG7y0us=;
  b=RW+Nw+HVJJjA36nxNz+CvkqETh94NL/ONYffB6qCmlL9Fq5TLBdlVfH7
   MW6bL//Nr7JZXqziTerFRjPkNPL/Kwptfc9ETeKnyr5H8DYccDPhYVgDa
   6kYhVmgrzg/9lIjqWMJNyeyPfHCLP2YEeuEtqhucMii2dWJP/Qltb6Vk9
   NI77m/tDllZ0vMLVDycR0sujPp3bBQY6J8DovZ5E6oJWChRkxsm/VCzNh
   Z+rr9metLMOu07ndxGwwTjs4KuCP7C97y5GU2t8XFojgDg48RCBllsrvG
   L7qvtzFhwxlmdA7BHz7SR/tu4L8ChEFWE08CrE6DU6bJpJMIjWJA4PBzD
   A==;
X-CSE-ConnectionGUID: zX6W/RDfT5O4E8ZVsLTfZA==
X-CSE-MsgGUID: /YQytLdVSXa5A7StPjrjjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40762723"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="40762723"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 09:13:04 -0800
X-CSE-ConnectionGUID: 1LW3cUpUTz+toFXg2zFvrw==
X-CSE-MsgGUID: bZ/o8hHkS6CZM0oxzywgOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="114692870"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Feb 2025 09:13:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk4g0-001DNl-2r;
	Mon, 17 Feb 2025 17:13:00 +0000
Date: Tue, 18 Feb 2025 01:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:res-lock-base 20/26] kernel/bpf/percpu_freelist.c:38:24:
 error: incompatible pointer types passing 'rqspinlock_t *' (aka 'struct
 rqspinlock *') to parameter of type 'struct qspinlock *'
Message-ID: <202502180117.vtskxZS0-lkp@intel.com>
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
commit: b93ebda0fc9e433a04a84dc63e762f0a3a8d9431 [20/26] bpf: Convert percpu_freelist.c to rqspinlock
config: x86_64-buildonly-randconfig-006-20250217 (https://download.01.org/0day-ci/archive/20250218/202502180117.vtskxZS0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180117.vtskxZS0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502180117.vtskxZS0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/percpu_freelist.c:4:
   In file included from kernel/bpf/percpu_freelist.h:8:
   In file included from arch/x86/include/asm/rqspinlock.h:27:
   include/asm-generic/rqspinlock.h:33:12: error: conflicting types for 'resilient_tas_spin_lock'
      33 | extern int resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout);
         |            ^
   arch/x86/include/asm/rqspinlock.h:17:12: note: previous declaration is here
      17 | extern int resilient_tas_spin_lock(struct qspinlock *lock, u64 timeout);
         |            ^
>> kernel/bpf/percpu_freelist.c:38:24: error: incompatible pointer types passing 'rqspinlock_t *' (aka 'struct rqspinlock *') to parameter of type 'struct qspinlock *' [-Werror,-Wincompatible-pointer-types]
      38 |         if (raw_res_spin_lock(&head->lock))
         |                               ^~~~~~~~~~~
   include/asm-generic/rqspinlock.h:188:25: note: expanded from macro 'raw_res_spin_lock'
     188 |                 __ret = res_spin_lock(lock);       \
         |                                       ^~~~
   include/asm-generic/rqspinlock.h:156:53: note: expanded from macro 'res_spin_lock'
     156 | #define res_spin_lock(lock) resilient_tas_spin_lock(lock, RES_DEF_TIMEOUT)
         |                                                     ^~~~
   arch/x86/include/asm/rqspinlock.h:17:54: note: passing argument to parameter 'lock' here
      17 | extern int resilient_tas_spin_lock(struct qspinlock *lock, u64 timeout);
         |                                                      ^
   kernel/bpf/percpu_freelist.c:59:26: error: incompatible pointer types passing 'rqspinlock_t *' (aka 'struct rqspinlock *') to parameter of type 'struct qspinlock *' [-Werror,-Wincompatible-pointer-types]
      59 |                         if (raw_res_spin_lock(&head->lock))
         |                                               ^~~~~~~~~~~
   include/asm-generic/rqspinlock.h:188:25: note: expanded from macro 'raw_res_spin_lock'
     188 |                 __ret = res_spin_lock(lock);       \
         |                                       ^~~~
   include/asm-generic/rqspinlock.h:156:53: note: expanded from macro 'res_spin_lock'
     156 | #define res_spin_lock(lock) resilient_tas_spin_lock(lock, RES_DEF_TIMEOUT)
         |                                                     ^~~~
   arch/x86/include/asm/rqspinlock.h:17:54: note: passing argument to parameter 'lock' here
      17 | extern int resilient_tas_spin_lock(struct qspinlock *lock, u64 timeout);
         |                                                      ^
   kernel/bpf/percpu_freelist.c:110:25: error: incompatible pointer types passing 'rqspinlock_t *' (aka 'struct rqspinlock *') to parameter of type 'struct qspinlock *' [-Werror,-Wincompatible-pointer-types]
     110 |                 if (raw_res_spin_lock(&head->lock))
         |                                       ^~~~~~~~~~~
   include/asm-generic/rqspinlock.h:188:25: note: expanded from macro 'raw_res_spin_lock'
     188 |                 __ret = res_spin_lock(lock);       \
         |                                       ^~~~
   include/asm-generic/rqspinlock.h:156:53: note: expanded from macro 'res_spin_lock'
     156 | #define res_spin_lock(lock) resilient_tas_spin_lock(lock, RES_DEF_TIMEOUT)
         |                                                     ^~~~
   arch/x86/include/asm/rqspinlock.h:17:54: note: passing argument to parameter 'lock' here
      17 | extern int resilient_tas_spin_lock(struct qspinlock *lock, u64 timeout);
         |                                                      ^
   4 errors generated.


vim +38 kernel/bpf/percpu_freelist.c

   > 4	#include "percpu_freelist.h"
     5	
     6	int pcpu_freelist_init(struct pcpu_freelist *s)
     7	{
     8		int cpu;
     9	
    10		s->freelist = alloc_percpu(struct pcpu_freelist_head);
    11		if (!s->freelist)
    12			return -ENOMEM;
    13	
    14		for_each_possible_cpu(cpu) {
    15			struct pcpu_freelist_head *head = per_cpu_ptr(s->freelist, cpu);
    16	
    17			raw_res_spin_lock_init(&head->lock);
    18			head->first = NULL;
    19		}
    20		return 0;
    21	}
    22	
    23	void pcpu_freelist_destroy(struct pcpu_freelist *s)
    24	{
    25		free_percpu(s->freelist);
    26	}
    27	
    28	static inline void pcpu_freelist_push_node(struct pcpu_freelist_head *head,
    29						   struct pcpu_freelist_node *node)
    30	{
    31		node->next = head->first;
    32		WRITE_ONCE(head->first, node);
    33	}
    34	
    35	static inline bool ___pcpu_freelist_push(struct pcpu_freelist_head *head,
    36						 struct pcpu_freelist_node *node)
    37	{
  > 38		if (raw_res_spin_lock(&head->lock))
    39			return false;
    40		pcpu_freelist_push_node(head, node);
    41		raw_res_spin_unlock(&head->lock);
    42		return true;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
