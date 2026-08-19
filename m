Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033D144BCAE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 10:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136855; cv=none; b=VsKyH6hHhvyLWVmQT1Dxnnc3uaa7xy0+M86TObDN/gMCzHtjPuiOPzCmapSrjLSLYmIAR3kh+qdT2c3d5KUTia7+Zi5YstgoNSO01L3ElBoCh7a2Qmm6+X7wMhKTI5hhneUSuD+BbPSyglGt1PGDvMLMdVf4WwNSJ0wfvLn3KiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136855; c=relaxed/simple;
	bh=uqQ7B9BONkBPaPGwtNtXfoBCMB9Et4+utsSy5BvPt5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SxpUPVdjXEyXz+prAskDA20YSLS/PhE0FdrWMakmU8wkB9us/AO6dnhsj+CP0bpENcS2Rxun/FFyAKKm4DDUqnKWv2mffcwM5+cvg7dBZem/PvDzpAghhTK7Vocl8lI6X8cfs6ErQl2XjVxW0weYUOxt+KMFVvuh+hVnyIZS+kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nr2YEA17; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nr2YEA17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787136853; x=1818672853;
  h=date:from:to:cc:subject:message-id;
  bh=uqQ7B9BONkBPaPGwtNtXfoBCMB9Et4+utsSy5BvPt5w=;
  b=Nr2YEA17mRUbxXWWVDMOmwekAbIFnSSBJvMjSrZuTXeCxI+KXVEc1Np6
   35/itCqd4vBysWDZsd1G2Hc9pkte9X1zk5VOL+xljWp9VkD9R49/AHlI5
   RqNXYE1vxfOF5bEBUfMWPerpRorrAyFQQ6auOBCyY+xwdiZt+45li/hGM
   Zd212g0lP1GSgGErEM81LqtFJ7W0vG8cMiwnC8DfE6au0+MVk5FfGXJzp
   dvg895gnaRuD88U+xCZ6M1kfZjRq7NOQV5HNVJGApJhKq4PUi7GsIw2nn
   0XEXg/4Yr3YEMltBA3N/9TVwUs4N9qhEUlMnwEpdHL3vTYnAG0U5Afrm7
   Q==;
X-CSE-ConnectionGUID: RlU5EXYmTpWeZBpcS73cSA==
X-CSE-MsgGUID: yYq/8R8UT5iNuoo2n7CRaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87663218"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87663218"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 03:54:12 -0700
X-CSE-ConnectionGUID: xfjVb9kvTtCSEsrz7q5jKQ==
X-CSE-MsgGUID: iVYOanKMRReVtvjStRgLjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="303720367"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Aug 2026 03:54:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwdvs-00000000f4M-0yht;
	Wed, 19 Aug 2026 10:54:08 +0000
Date: Wed, 19 Aug 2026 18:53:58 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 57/80] kernel/sched/alt_core.c:125:1: sparse:
 sparse: symbol '__pcpu_scope_sched_smt_idle_lock' was not declared. Should it
 be static?
Message-ID: <202608191833.cqE1Auhb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   b735d8ec47d31db8e62d1925521a44d98c1cac2d
commit: 46ef77681e026cafee56306f59871ab4760809af [57/80] sched/alt: Auto-detect heterogeneous CPU topology
config: parisc-randconfig-r121-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191833.cqE1Auhb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191833.cqE1Auhb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191833.cqE1Auhb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/alt_core.c:125:1: sparse: sparse: symbol '__pcpu_scope_sched_smt_idle_lock' was not declared. Should it be static?
   kernel/sched/alt_core.c:2611:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:2611:36: sparse:     expected struct task_struct const *p
   kernel/sched/alt_core.c:2611:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:6002:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:6002:43: sparse:     expected struct task_struct *push_task
   kernel/sched/alt_core.c:6002:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4045:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:4045:15: sparse:    struct task_struct *
   kernel/sched/alt_core.c:4045:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:4129:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4129:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4129:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4778:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4778:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4778:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5309:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5309:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5309:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5852:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:5852:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:5852:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:895:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:895:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:895:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:895:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:895:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:895:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:1122:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1122:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1122:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1801:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1801:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1801:38: sparse:    struct task_struct const *
   kernel/sched/alt_core.c: note: in included file (through kernel/sched/sched.h):
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1122:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1122:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1122:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1122:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1122:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1122:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1122:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1122:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1122:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1122:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1122:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1122:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1122:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1122:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1122:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1122:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1122:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1122:37: sparse:    struct task_struct [noderef] __rcu *

vim +/__pcpu_scope_sched_smt_idle_lock +125 kernel/sched/alt_core.c

   124	
 > 125	DEFINE_PER_CPU_ALIGNED(raw_spinlock_t, sched_smt_idle_lock);
   126	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
