Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762865;
	b=GP8zTf5OAr3dqBG3MjVUjkLoCRByLRZsJgJJfL7KsZXlA4iTbxZWYQ6jb8rPuuDT8Yi7
	 bg+4rEbQPWWiQHRgrs8OUpLVNL9RpDhklVJlPUV4LsOMguu/JKCgestKw+UrNdjMywD4C
	 LUW6VYLu1c/JU87uXqPZWEJsNzZvmp6hH3Re/uzWornmE+U1QCCvFfwYZyntdniCFk4jT
	 czmoaz+AIntHTxaFL1lxmsbxon0Q++PusMSDaDDCejLorcgFwIXBo19txTs8rPMbdb/FY
	 UFdmgf07IySSroSviGLazdKPY0R2csbkJxUrJERn7VowkaV8HdQNxvydcp/C1Uw4gSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762865;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bhJbVPYQz1Ug+ER7TzRHOF8dsG93+bWhtT63dididPY=;
	b=1o1k1kb7Mkck0zEqpKc+imtl9JBiZPcEvfx4E9BwfhKhcnV7+tNeCwMMdFx3p24gO/zc
	 uM2DWxC7/mFSPESNny3iLpUKHjk9V6q1O9mbcHCR2c7cdA+fP8MCkaKA8Xflq4nyyxJIL
	 1wMT/ruWCPkgEPh8P9oUi4dTjGRU4tLwM4UXJqHB2llmd1UR9q5J4fkRJMp0+8UKTNC8A
	 gydZlCxp3wEoW5jaXQXmm+8uVovVd2e5dRYu3X3agmMkHEcsUnCJ4+mcgxE92K2z+j2c3
	 UYfOv4FwotgU0je0q0wKo5SzCyFCEjfeDVTOh9VqE0rQQDvXxaN6+qkAPLuDzC78wNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UoiwqrBJ;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DA2606A31F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 13:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62DA2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UoiwqrBJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792762865; x=1824298865;
  h=date:from:to:cc:subject:message-id;
  bh=ccsghUPQSqlg0+ub/QNu4/qq1VfidUzhanCxNb9qB14=;
  b=UoiwqrBJNq55WS9GpPvpbm9cGTaDlHPXOjLL9QSmo/b72IanWXLD6yTZ
   jgtxvAUTjujUnunYGcLwKcoFKnpBC42ts1PErzS5uYZqb+ygaYLthFQ9q
   YP+Dv1yjFo0x7zhvKX1xxsIDtApZFLgcGxyJZPniOB3hWgl86buewSSE1
   2OrLMl7ykYbKJSJzhFdYaeuphBDo0kiZDX49ukAf5ElxdLaQeK30BdXib
   BgYMN3lEIyj6oyPsFiZzJpD1IfDI1/seMwiqEFn7vUG+1qXlF32waJwHg
   8YEfAdpPFg8tHOOCn4nYYFtEwBriCX2Plhi1yHxojGYTv27l+RebFwuCP
   A==;
X-CSE-ConnectionGUID: ltO60YDhSMmZwzLmqSPR1w==
X-CSE-MsgGUID: SDiWwiFsQ6yIcI+YGg6anQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1423923"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1423923"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 06:41:04 -0700
X-CSE-ConnectionGUID: 7RJPMqxjQvKdgA4WWxeMvw==
X-CSE-MsgGUID: KHcImypGSAK12Iu1I5Ok6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="5410193"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 23 Oct 2026 06:41:03 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKFW0-000000000cp-29ky;
	Fri, 23 Oct 2026 13:41:00 +0000
Date: Fri, 23 Oct 2026 15:40:27 +0200
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.3/prjc 647/732] kernel/sched/alt_core.c:7357:58:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202610231516.vYtA7qeq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Alfred,

First bad commit (maybe != root cause):

tree:   https://github.com/zen-kernel/zen-kernel 7.3/prjc
head:   f1ab44d828f1d74c6ec1d7a6cf32bc79cec13905
commit: f12c89ee63642bc3e9b2868770e78964634b8b3b [647/732] sched/alt: [Sync] dcb7416212e6 block: invalidate cached plug timestamp after task switch
config: powerpc64-randconfig-r2302-20261023 (https://download.01.org/0day-ci/archive/20261023/202610231516.vYtA7qeq-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231516.vYtA7qeq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231516.vYtA7qeq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/alt_core.c:109:1: sparse: sparse: symbol 'sched_cpu_topo_end_mask' was not declared. Should it be static?
   kernel/sched/alt_core.c:2505:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:2505:36: sparse:     expected struct task_struct const *p
   kernel/sched/alt_core.c:2505:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5859:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:5859:43: sparse:     expected struct task_struct *push_task
   kernel/sched/alt_core.c:5859:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:3916:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:3916:15: sparse:    struct task_struct *
   kernel/sched/alt_core.c:3916:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:4000:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4000:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4000:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4644:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4644:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4644:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5170:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5170:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5170:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5716:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:5716:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:5716:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:6623:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct task_struct * @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:6623:16: sparse:     expected struct task_struct *
   kernel/sched/alt_core.c:6623:16: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:7357:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *t @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:7357:58: sparse:     expected struct task_struct *t
   kernel/sched/alt_core.c:7357:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:7389:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:7389:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:7389:38: sparse:    struct task_struct *
   kernel/sched/alt_core.c:923:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:923:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:923:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1831:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1831:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1831:38: sparse:    struct task_struct const *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1141:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1141:37: sparse:    struct task_struct [noderef] __rcu *

vim +7357 kernel/sched/alt_core.c

4130c40b2dd0eb Alfred Chen 2023-06-09  7338  
a93b326971dff8 Alfred Chen 2026-01-02  7339  static void mm_cid_fixup_cpus_to_tasks(struct mm_struct *mm)
4130c40b2dd0eb Alfred Chen 2023-06-09  7340  {
a93b326971dff8 Alfred Chen 2026-01-02  7341  	unsigned int cpu;
4130c40b2dd0eb Alfred Chen 2023-06-09  7342  
a93b326971dff8 Alfred Chen 2026-01-02  7343  	/* Walk the CPUs and fixup all stale CIDs */
a93b326971dff8 Alfred Chen 2026-01-02  7344  	for_each_possible_cpu(cpu) {
a93b326971dff8 Alfred Chen 2026-01-02  7345  		struct mm_cid_pcpu *pcp = per_cpu_ptr(mm->mm_cid.pcpu, cpu);
a93b326971dff8 Alfred Chen 2026-01-02  7346  		struct rq *rq = cpu_rq(cpu);
4130c40b2dd0eb Alfred Chen 2023-06-09  7347  
a93b326971dff8 Alfred Chen 2026-01-02  7348  		/* Remote access to mm::mm_cid::pcpu requires rq_lock */
a93b326971dff8 Alfred Chen 2026-01-02  7349  		guard(rq_lock_irq)(rq);
a93b326971dff8 Alfred Chen 2026-01-02  7350  		/* Is the CID still owned by the CPU? */
a93b326971dff8 Alfred Chen 2026-01-02  7351  		if (cid_on_cpu(pcp->cid)) {
4130c40b2dd0eb Alfred Chen 2023-06-09  7352  			/*
a93b326971dff8 Alfred Chen 2026-01-02  7353  			 * If rq->curr has @mm, transfer it with the
a93b326971dff8 Alfred Chen 2026-01-02  7354  			 * transition bit set. Otherwise drop it.
4130c40b2dd0eb Alfred Chen 2023-06-09  7355  			 */
a93b326971dff8 Alfred Chen 2026-01-02  7356  			if (rq->curr->mm == mm && rq->curr->mm_cid.active)
a93b326971dff8 Alfred Chen 2026-01-02 @7357  				mm_cid_transit_to_task(rq->curr, pcp);
a93b326971dff8 Alfred Chen 2026-01-02  7358  			else
a93b326971dff8 Alfred Chen 2026-01-02  7359  				mm_drop_cid_on_cpu(mm, pcp);
4130c40b2dd0eb Alfred Chen 2023-06-09  7360  
a93b326971dff8 Alfred Chen 2026-01-02  7361  		} else if (rq->curr->mm == mm && rq->curr->mm_cid.active) {
a93b326971dff8 Alfred Chen 2026-01-02  7362  			unsigned int cid = rq->curr->mm_cid.cid;
4130c40b2dd0eb Alfred Chen 2023-06-09  7363  
a93b326971dff8 Alfred Chen 2026-01-02  7364  			/* Ensure it has the transition bit set */
a93b326971dff8 Alfred Chen 2026-01-02  7365  			if (!cid_in_transit(cid)) {
a93b326971dff8 Alfred Chen 2026-01-02  7366  				cid = cid_to_transit_cid(cid);
a93b326971dff8 Alfred Chen 2026-01-02  7367  				rq->curr->mm_cid.cid = cid;
a93b326971dff8 Alfred Chen 2026-01-02  7368  				pcp->cid = cid;
a93b326971dff8 Alfred Chen 2026-01-02  7369  			}
a93b326971dff8 Alfred Chen 2026-01-02  7370  		}
a93b326971dff8 Alfred Chen 2026-01-02  7371  	}
645e4518e411b4 Alfred Chen 2026-02-09  7372  	mm_cid_complete_transit(mm, 0);
4130c40b2dd0eb Alfred Chen 2023-06-09  7373  }
4130c40b2dd0eb Alfred Chen 2023-06-09  7374  

:::::: The code at line 7357 was first introduced by commit
:::::: a93b326971dff819fbcdd3aae333b45dae17074d sched/mmcid/alt: Sync mainline mmcid code changes

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
