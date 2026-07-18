Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879CF303C8A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 07:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784361018; cv=none; b=MDy3G1SuEQ+kgfHhvii0O1LYWgqL5TfM6SgDmGjOb72ZwVGepbehW867pZ2hqC+5gNjE7QNB0kl8AYqwoGb5T3PzYC7TNbMFzGLvNtPIj+jy8EMcvoJkY+LHHa1GYUufWoY1IFOuebClMI8oxFEgfm8+mOOad5yKWp/zew9hD3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784361018; c=relaxed/simple;
	bh=1A+7UCELoItskKVUHDLSrDhOMBSoysPchmuBOLcsPkg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uz6Den/GmS8c5AK4cuIdOJvtmOnab8QzbI3beQpzYxAixB1FlE9HPh0pvsHoXoHCTVNRt2Md3xH0o9SgYr0cKsHv+NvTnHcmyPz1ebT9/ZEZg+lTfU8NpvsbcQd+MZ6jayfjoCzHCiS0nCg0Bm3gaQxi3tpOK3FVOlqLkRzjQ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ya8hQhit; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ya8hQhit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784361016; x=1815897016;
  h=date:from:to:cc:subject:message-id;
  bh=1A+7UCELoItskKVUHDLSrDhOMBSoysPchmuBOLcsPkg=;
  b=Ya8hQhitD14/G2HDswMod5J2dmUpCDx/386tvnb0nUE+xcnlq/EvRPzx
   KGVbvAonAXXBuWs5kccpsFd/TioeFfvoqADEjr9URBwmiHIrTlsjgWZCU
   kFxOGu6M0sMk5ou2jrmt4/Z71SfO0nQGGr/IIXGile/ng6uwdN+tyP3mG
   +353Ksc08DUmU/+Ze2SnFeoogPkKQcZbLHoatN4kB2+jCnga2AiXpw+2y
   mmIRziShXrSn96MpYxJvT8mYzn8xPsWglOOb8dj9in5oZrJ4tHWMnsjoF
   iKg04bm82wFQ8zpM7zpciM0ovBMBzrQIaInsxwDsPB+temrZh9qlSmDJL
   w==;
X-CSE-ConnectionGUID: WH/gNeDlSpKjzIHbTvagrg==
X-CSE-MsgGUID: sCA3WmHoSYqgkmnfLEa05A==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84003491"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="84003491"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 00:50:15 -0700
X-CSE-ConnectionGUID: vF1tEMqnQm+wyoLk6BYr6g==
X-CSE-MsgGUID: QcgKflroQayRxY4v1ZfJuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="255210878"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Jul 2026 00:50:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkzoJ-00000000TYk-2s94;
	Sat, 18 Jul 2026 07:50:11 +0000
Date: Sat, 18 Jul 2026 15:49:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1598/7584] kernel/sched/fair.c:2004:38:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202607181556.r1HxW23p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
commit: 85570f10a4c61372c1d437365b9d8dbad512ec6f [1598/7584] sched/eevdf: Move to a single runqueue
config: powerpc64-randconfig-r131-20260716 (https://download.01.org/0day-ci/archive/20260718/202607181556.r1HxW23p-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181556.r1HxW23p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181556.r1HxW23p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1335:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1335:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1335:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1945:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1945:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1945:33: sparse:     got struct sched_entity [noderef] __rcu *
>> kernel/sched/fair.c:2004:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:2004:38: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:2004:38: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:14433:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:14433:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:14433:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7744:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:7744:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:7744:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9440:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9440:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:9440:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9635:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9635:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:9635:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9809:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:9809:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:9809:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9843:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9843:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:9843:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:10045:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:10045:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:10045:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:11385:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:11385:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:11385:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:11733:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:11733:28: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:11733:28: sparse:    struct sched_domain *
   kernel/sched/fair.c:12151:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:12151:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:12151:22: sparse:    struct task_struct *
   kernel/sched/fair.c:13669:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13669:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13669:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:13300:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13300:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:13300:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:13805:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13805:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13805:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7644:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2454:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2454:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2454:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *

vim +2004 kernel/sched/fair.c

  2001	
  2002	static void update_curr_fair(struct rq *rq)
  2003	{
> 2004		struct sched_entity *se = &rq->donor->se;
  2005	
  2006		for_each_sched_entity(se)
  2007			update_curr(cfs_rq_of(se));
  2008	}
  2009	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
