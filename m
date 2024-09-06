Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5A4158875
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 21:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725659588; cv=none; b=EoxdJv8EHiC7ppVUkCMSKyHTYa55hLaB3MQLB5p74Lb7LU3eqa9tirwwEKNksNyktt0O7UFNnaNDQAsp32GjfG9ICziabjIpixTTGTx1cVinLJ2gafFFV2NNeEDie14J6PxDeWd3e74LNU/qXC67RmvsX2vBwvdRYGExzyhAcxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725659588; c=relaxed/simple;
	bh=2OzFddFsTsVL1LVpDBz9gZbgMcWFAx0an1Ewyau9BYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VlyxOluO6imfq7XXe/YeYmhp7xbP0Yh29iZ/RCGKQ+a0Fk20431CuHA7iXQ5h2FqwhDQdTNlgyMk/1EwOv3A2Kd4mlNPsk/3FSISXo2NFeVQGwZwMNWDr+iSoU2v2e8y9cK46k+DlJTuzbUSeOSvVp9EHsxqB7n1Fl7wSq19FVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dydU6y14; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dydU6y14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725659586; x=1757195586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2OzFddFsTsVL1LVpDBz9gZbgMcWFAx0an1Ewyau9BYk=;
  b=dydU6y14336aVuA/P4+tv68+a1M4ebV0+KCPaSOByYwy241kyBhwko7K
   e1Hw8B30r4RtSwgMKmmdcCSgZ1PsSk6UBQYXmIfVqbP4TXgWFHwe9GFnd
   dWg48PiZ9+V+lsHkGWSDHdnSpGLZOqjE0LQBbxijDIJRmnyutrnc25Pxi
   eA44kW9h3D13laBRLSNGSEgE/maT5tpZeLpj0nXDqWbNX3OBS3qTzzwSZ
   VfmyQnORGDjk9e26LJ6bK/pNW9P86q5YR6jTE3qFlnLkyHGpVcGY5iAny
   n5Tmn6aKbml53W9B5RuhoWUjk4euxOEJT4CcmJ3gAgQZrqGr8S8PpHXYS
   g==;
X-CSE-ConnectionGUID: jeeGhhaITN+o3YARPDJO3Q==
X-CSE-MsgGUID: bOGFgx+cRbiN/VRJKx0n9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24297389"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="24297389"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 14:53:01 -0700
X-CSE-ConnectionGUID: //o5PlHqR8eKEzms+4sBSA==
X-CSE-MsgGUID: moiqoNL0QJqLxyZkiQvftA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="70213196"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Sep 2024 14:52:59 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smgsz-000Bln-1A;
	Fri, 06 Sep 2024 21:52:57 +0000
Date: Sat, 7 Sep 2024 05:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Vernet <dvernet@meta.com>
Subject: [linux-next:master 106/10296] kernel/sched/ext.c:4158:32: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202409070555.1nL3qrXW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: 81aae789181b5850d77dfdf74d4b85c63f0705e9 [106/10296] sched_ext: Implement scx_bpf_kick_cpu() and task preemption support
config: loongarch-randconfig-r131-20240906 (https://download.01.org/0day-ci/archive/20240907/202409070555.1nL3qrXW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240907/202409070555.1nL3qrXW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409070555.1nL3qrXW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:916:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:916:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:916:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2364:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2364:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2364:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1002:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1002:38: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1002:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1536:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1536:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1536:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1876:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1876:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1876:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1556:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1556:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1556:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1621:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1621:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1621:45: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1682:67: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1682:67: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1682:67: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2044:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2044:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2044:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2067:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2067:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2067:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2417:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2417:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2417:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2419:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2419:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2419:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2419:61: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2419:61: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2419:61: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2401:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2401:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2401:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2411:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2411:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2411:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2519:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2519:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2519:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2026:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2026:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2026:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2037:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2037:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2037:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1220:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1220:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1220:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1444:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1444:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1444:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2262:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2262:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2262:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:1911:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:1911:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1911:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1987:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1987:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1987:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2566:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2566:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2566:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2568:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2568:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2568:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2570:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2570:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2570:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2745:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2745:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2745:22: sparse:    struct task_struct *
   kernel/sched/deadline.c:2794:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext.c:557:25: sparse: sparse: symbol 'scx_has_op' was not declared. Should it be static?
   kernel/sched/ext.c:657:22: sparse: sparse: symbol 'scx_dump_data' was not declared. Should it be static?
   kernel/sched/ext.c:1008:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1076:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1076:56: sparse:    struct task_struct *
   kernel/sched/ext.c:1076:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1433:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1433:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:1433:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:1443:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1443:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:1443:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:3500:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:3500:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:3500:52: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/ext.c:4158:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4158:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:4158:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:4588:18: sparse: sparse: symbol 'scx_bpf_kick_cpu' was not declared. Should it be static?
   kernel/sched/ext.c:5022:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:5022:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:5022:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2224:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2224:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2224:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2224:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2224:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2224:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2224:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2224:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2224:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2399:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2399:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2399:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2224:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2224:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2399:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2399:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2399:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1426:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1707:15: sparse: sparse: dereference of noderef expression

vim +4158 kernel/sched/ext.c

  4143	
  4144	static bool can_skip_idle_kick(struct rq *rq)
  4145	{
  4146		lockdep_assert_rq_held(rq);
  4147	
  4148		/*
  4149		 * We can skip idle kicking if @rq is going to go through at least one
  4150		 * full SCX scheduling cycle before going idle. Just checking whether
  4151		 * curr is not idle is insufficient because we could be racing
  4152		 * balance_one() trying to pull the next task from a remote rq, which
  4153		 * may fail, and @rq may become idle afterwards.
  4154		 *
  4155		 * The race window is small and we don't and can't guarantee that @rq is
  4156		 * only kicked while idle anyway. Skip only when sure.
  4157		 */
> 4158		return !is_idle_task(rq->curr) && !(rq->scx.flags & SCX_RQ_BALANCING);
  4159	}
  4160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
