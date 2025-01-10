Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C33433B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 06:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736490910; cv=none; b=siKaG5Jzb84Y+JQFbSxWk+8d3SM+w15nWA9MovwJf3Xa9Yb30x14mEgEicGuzS8zZSaZ5u0gwqWXOTvTf2qOjwSEVzEGEfrfuG6Bpzxs1Mut48U4DkQkkHK7qnbLidzrry0ufvaXrGK3c0WmE9tVb/aQCJAk+6Hnoe+xtjHOLMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736490910; c=relaxed/simple;
	bh=bpm99e/Ti33D5Gj7EIQfPoFVb4NSxkbd6UZRlrPK32A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zd1CP6La9lvnEdpLRnCxonoLakfZhlke42rHveeReDsVp+fB8aXEXYQkT5aP1dgUObefQLCwV/uAnv/Fc823NLDCTFoYFmFQLohghIZFrT/hoEg2H7x0mwzyvelVJQoUk7DriVe1OV3Q87m23+k1B0UhIdpjWfTY3SJob95OeCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/MQ21sK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/MQ21sK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736490908; x=1768026908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bpm99e/Ti33D5Gj7EIQfPoFVb4NSxkbd6UZRlrPK32A=;
  b=g/MQ21sKONiw0mXSqQeIEoeUW8NrWU4wqGldjFoGI8VgYYUXcPw5NK9K
   9Fj/QzNLOjEpK1coB0JW/xyzQL/EdBwHsTA9HApiFuGxkShTjfDhORv3/
   LNL8ySs51kMj2JTeSuvYGpibvRAAbZDKhMnPbfVrQ44sC9CuQMq9QeDR+
   0DyRlaXHjx2VL3mx3ZiuJ/yArZak217tjZfMChLsn/nKFsvHSC421kWVO
   RWCr45dpVgzgW55q0aQ0WvTg/FCGt17wjwOsQbIvMJ1mVyoHShFQq1EFE
   y2Yl9jsTrPkzngk8qbA7cykJzB2B4BHEZ71+QkOFN01wTvFDNVWjRjFQR
   w==;
X-CSE-ConnectionGUID: Bu3qYjYxRwKBFNo9P5FzGg==
X-CSE-MsgGUID: 67TrMHHIQQK9ctp0nHc8Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="59252487"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="59252487"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 22:35:08 -0800
X-CSE-ConnectionGUID: yVvyhEByRPC4FPAhDZKMAA==
X-CSE-MsgGUID: PUDezeMMTzuPpaxYrLKH2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103433564"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jan 2025 22:35:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW8bm-000IeF-0C;
	Fri, 10 Jan 2025 06:35:02 +0000
Date: Fri, 10 Jan 2025 14:34:52 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Righi <arighi@nvidia.com>, Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] sched_ext: Refresh scx idle state during idle-to-idle
 transitions
Message-ID: <202501101452.wa7SRR7Q-lkp@intel.com>
References: <20250109101952.443769-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109101952.443769-1-arighi@nvidia.com>

Hi Andrea,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.13-rc6 next-20250109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-Righi/sched_ext-Refresh-scx-idle-state-during-idle-to-idle-transitions/20250109-182533
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250109101952.443769-1-arighi%40nvidia.com
patch subject: [PATCH v5] sched_ext: Refresh scx idle state during idle-to-idle transitions
config: x86_64-randconfig-121-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101452.wa7SRR7Q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101452.wa7SRR7Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101452.wa7SRR7Q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/idle.c:480:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/idle.c:480:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/idle.c:480:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:851:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:851:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:851:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2336:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2336:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2336:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:531:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:531:55: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:531:55: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:991:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:991:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:991:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1529:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1529:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1529:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1849:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1849:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1849:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1549:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1549:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1549:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1550:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1550:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1550:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1611:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1611:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1611:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1654:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1654:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1654:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1674:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1674:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1674:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2018:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2018:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2018:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2041:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2041:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2041:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2387:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2387:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2387:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2389:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2389:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2389:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2389:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2389:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2389:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2715:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2715:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2715:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2725:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2725:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2725:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2831:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2831:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2831:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2357:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2357:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2357:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2368:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2368:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2368:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1262:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1262:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1262:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1262:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1262:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1262:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1362:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1362:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1362:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1671:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1671:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1671:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1671:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1671:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1671:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1759:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1759:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1759:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2576:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2576:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2576:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2242:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2242:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2242:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2243:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2243:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2243:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2318:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2318:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2318:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2876:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2876:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2876:38: sparse:     got struct task_struct [noderef] __rcu *curr

vim +480 kernel/sched/idle.c

   465	
   466	struct task_struct *pick_task_idle(struct rq *rq)
   467	{
   468		/*
   469		 * The scx idle state is updated only when the CPU transitions
   470		 * in/out of SCHED_IDLE, see put_prev_task_idle() and
   471		 * set_next_task_idle().
   472		 *
   473		 * However, the CPU may also exit/enter the idle state while
   474		 * running the idle task, for example waking up the CPU via
   475		 * scx_bpf_kick_cpu() without dispatching a task on it.
   476		 *
   477		 * In this case we still need to trigger scx_update_idle() to
   478		 * ensure a proper management of the scx idle state.
   479		 */
 > 480		if (rq->curr == rq->idle)
   481			scx_update_idle(rq, true, false);
   482		return rq->idle;
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
