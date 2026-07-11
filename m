Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784001A2C0B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774135; cv=none; b=kk1GNHGobiUY19QFKannp1M6DnIB1elsV2DPMHkKRTC9o/lXtv6V0D2LEYHqCuYMC00vrOdXtSE8zRqsKuwTWLNXDvd0nqACfw6OK4kQ99GHLxjfMTfgqk2bWYhRYRSanI4OCjLqNe9QDW+dZFrXI1ctuudEBL6evRFJ+paLgb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774135; c=relaxed/simple;
	bh=yP6sm3VGPDqXsBH27nsd2Fy63EQVSJbCisfk3j7xVOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JZkJmt/WdaMAO3KFjy0v3JC0sWDDJ2kN3CUc6qpyV+UQarWYswDN1WMp63UUH8+mTZyf3XQ/ZjlDivxYLT+/vXD+gbbpYkylph/H2lpLqi3dz8XwKjPcS2gNjk8McsHj5FvqbkLX2QX82RcXGgam1MPD6aqkE2sgEAk9A4doXdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQ+2KxEg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQ+2KxEg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783774133; x=1815310133;
  h=date:from:to:cc:subject:message-id;
  bh=yP6sm3VGPDqXsBH27nsd2Fy63EQVSJbCisfk3j7xVOI=;
  b=kQ+2KxEg78gUKHrOMJQDajHKyYVFRWK0KP8kwcf+kvwJOjwhnUkql2ZW
   I9ZIfGIu6M/5/Mnl+Qk3HykUo8YVfyxVtptr6XJM63DmxssfWhc1Wv5nL
   mkj9ix5Xu4fP+f/K//ljoud3GHZcNKAnEsZH4zOeqCStE4KP0miXDUGuo
   Vhp1H1328odk1ip3fhx8OmpehOgaxFiif6ui73Uei4h/kxMMUJ1F13Y7i
   xJexsxU2Y+NyAeH9y/F6TZMllzTdKMhjJ3p1/av92xnBNRP5+atB+486r
   99khLPR7rSm+8TnE++Izy2GafhFKI3B+81iBO7sZAt4zJQQY3Z5XV1Lqo
   w==;
X-CSE-ConnectionGUID: fnawMtmASsynxC1/NoR8TA==
X-CSE-MsgGUID: vNWmqaxES5GEVC2JAuMTVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83433579"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83433579"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 05:48:53 -0700
X-CSE-ConnectionGUID: pa4KWt5nTQGdfsPg5qRNNg==
X-CSE-MsgGUID: 1y+QkS8fQb2CjmOUJ/hnpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252487194"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jul 2026 05:48:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiX8P-00000000K3d-1BRe;
	Sat, 11 Jul 2026 12:48:45 +0000
Date: Sat, 11 Jul 2026 20:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Andrea Righi <arighi@nvidia.com>
Subject: [tj-sched-ext:for-7.3 18/29] kernel/sched/ext/sub.c:279:40:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202607111938.h8gidi20-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tejun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git for-7.3
head:   cbcda14b12fbc8c89546bfe4568df9b984238687
commit: daf8e166ba59ddf1dacb080228cb42e5d1de30ae [18/29] sched_ext: Split sub-scheduler implementation into sub.c
config: arm64-randconfig-r132-20260711 (https://download.01.org/0day-ci/archive/20260711/202607111938.h8gidi20-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607111938.h8gidi20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607111938.h8gidi20-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext/ext.c:2596:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:2596:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:2732:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:2732:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:2732:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:2879:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:2879:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext/ext.c:2879:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:3110:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:3110:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3110:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:3521:62: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext/ext.c:3521:62: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3521:62: sparse:     got struct scx_sched [noderef] __rcu *scx_sched
   kernel/sched/ext/ext.c:6051:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:6051:57: sparse:     expected struct task_struct const *p
   kernel/sched/ext/ext.c:6051:57: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:6052:51: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:6052:51: sparse:     expected struct task_struct *p
   kernel/sched/ext/ext.c:6052:51: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:7443:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:7443:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext/ext.c:7443:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:8776:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9221:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:9221:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:9221:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/idle.c:751:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext/idle.c:771:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext/sub.c:279:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *parent @@     got struct scx_sched [noderef] __rcu *scx_sched @@
>> kernel/sched/ext/sub.c:595:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1418:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1313:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct *
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2462:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2462:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1423:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2339:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2339:15: sparse:    struct task_struct *
   kernel/sched/deadline.c:2339:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2462:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2462:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2462:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2451:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2451:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1423:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1423:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1343:11: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1676:15: sparse: sparse: dereference of noderef expression

vim +279 kernel/sched/ext/sub.c

   275	
   276	/* verify that a scheduler can be attached to @cgrp and return the parent */
   277	static struct scx_sched *find_parent_sched(struct cgroup *cgrp)
   278	{
 > 279		struct scx_sched *parent = cgrp->scx_sched;
   280		struct scx_sched *pos;
   281	
   282		lockdep_assert_held(&scx_sched_lock);
   283	
   284		/* can't attach twice to the same cgroup */
   285		if (parent->cgrp == cgrp)
   286			return ERR_PTR(-EBUSY);
   287	
   288		/* does $parent allow sub-scheds? */
   289		if (!parent->ops.sub_attach)
   290			return ERR_PTR(-EOPNOTSUPP);
   291	
   292		/* can't insert between $parent and its exiting children */
   293		list_for_each_entry(pos, &parent->children, sibling)
   294			if (cgroup_is_descendant(pos->cgrp, cgrp))
   295				return ERR_PTR(-EBUSY);
   296	
   297		return parent;
   298	}
   299	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
