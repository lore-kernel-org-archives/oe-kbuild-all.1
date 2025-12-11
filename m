Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699E42877ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 05:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765431645; cv=none; b=jQ/sS5iF5ThUqSvtAoThw0dbraJS2lKF+6XFmU7W8QE43uNmweqJbeQp4BJwDhGXdJZKwz7WAOpTk55NFjh6RfRmAbkI48HqL3qoRKo6fUpDWcg1S2wdbgR6blo4nz8PcMMoZNSQwIIB47wJXRmzPlQu+9rqEVR8uxejXn514N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765431645; c=relaxed/simple;
	bh=Dow2U4kGsk0crl/G8Bt1uiAQP1mSV6rXG9UYVwcH6jY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f17sFPZEk0Cv0m/N34joh6Vpz1o3hzW5e9LMPdON5LhWWRtT4S56aXLK8vFrVx+ZPofhoGjlyMWoAmE0ALRZxMLVoZYRCRu9M9A8Bp3CT1Y87R0ZlmQI84/4JNZSJkc3ouoPiFzFX4rKYgO4LaRiKPzmKj3EY/SdDj5yBIbZyNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVXVocpE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVXVocpE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765431643; x=1796967643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dow2U4kGsk0crl/G8Bt1uiAQP1mSV6rXG9UYVwcH6jY=;
  b=XVXVocpEzQgsczcXydx7fPSWZqbuzIF36sjt+J0A3Ii1JATM9TnWxEwM
   sEiGZmO+J+4pjODIWYFwPiMGmbfj90Pe6QTaurpFTaGQrPJj3pK4Ypqfe
   fOPkPfgkqiWResfp5Dg1iaCg/MM5ULCwpv/e0iGuHC986IjQ2Aow2nclW
   gSb6HmpuWTpHi0FVSF5xe0rb+GjvoeQ+ldR6L6t2Z/u7ZKRR53LJs8uv9
   yCNM6FCS67s/5hhpBR1TNVaup3LMICwFJJHZvckIHLzIyRfgdrbF+kqfG
   f3kKrNNdqrP2sFAXfTMV/5EOjQ6QRLpotr+4Q8bajUKlMQOCvK6iv5h4B
   w==;
X-CSE-ConnectionGUID: SbpgAC8URGuxGUJem7wdhw==
X-CSE-MsgGUID: 5hsbsX8bSdyLFpI/ofo2qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84817140"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="84817140"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 21:40:41 -0800
X-CSE-ConnectionGUID: FYcW2FsgRKaE08fEjFMGOA==
X-CSE-MsgGUID: utWq0AONTaetsfZH22zaUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201630353"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Dec 2025 21:40:40 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTZPp-000000004F8-36oW;
	Thu, 11 Dec 2025 05:40:37 +0000
Date: Thu, 11 Dec 2025 13:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: kernel/sched/core.c:881:49: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202512111308.D5hqTn1p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: e38e5299747b23015b00b0109891815db44a2f30 sched/hrtick: Fix hrtick() vs. scheduling context
date:   5 days ago
config: nios2-randconfig-r121-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111308.D5hqTn1p-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111308.D5hqTn1p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111308.D5hqTn1p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/core.c:881:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:881:49: sparse:     expected struct task_struct *p
   kernel/sched/core.c:881:49: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:1101:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1101:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1101:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2175:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2175:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2175:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2186:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2186:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2186:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3583:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3583:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3583:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3788:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3788:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3788:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5512:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5512:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5512:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6730:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6730:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6730:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6797:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6797:37: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6797:37: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7303:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7303:17: sparse:    struct task_struct *
   kernel/sched/core.c:7303:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10207:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10207:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10207:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:632:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:657:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:683:9: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1808:9: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1808:9: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:102:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:102:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:881:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2256:35: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2291:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2291:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2291:25: sparse:    struct task_struct *
   kernel/sched/core.c:2170:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2170:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2170:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2635:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2635:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2635:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2302:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2302:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2612:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2612:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2612:9: sparse:    struct task_struct *

vim +881 kernel/sched/core.c

   867	
   868	/*
   869	 * High-resolution timer tick.
   870	 * Runs from hardirq context with interrupts disabled.
   871	 */
   872	static enum hrtimer_restart hrtick(struct hrtimer *timer)
   873	{
   874		struct rq *rq = container_of(timer, struct rq, hrtick_timer);
   875		struct rq_flags rf;
   876	
   877		WARN_ON_ONCE(cpu_of(rq) != smp_processor_id());
   878	
   879		rq_lock(rq, &rf);
   880		update_rq_clock(rq);
 > 881		rq->donor->sched_class->task_tick(rq, rq->donor, 1);
   882		rq_unlock(rq, &rf);
   883	
   884		return HRTIMER_NORESTART;
   885	}
   886	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
