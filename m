Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB1517588
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 02:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724293339; cv=none; b=thYECuLixFE8ns02eYedIMovt42Cxrz2YNAToFvEcbLS98Z1dHibHpUXDtjmHht20ybBvmc6xzs4NNzsfcrkofBc/1qbjsE3B0QWc2RSfOTKJFpEN057m2AMiy0+vJ8DfYM7u3TqH1flB3cZw268rFGg1qRKKE4/PHpVeJWsNZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724293339; c=relaxed/simple;
	bh=xuI9kfBe/N6afXGUNYZ83tS2YyA0sq+VSnigPJkxTyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYHNe7OPKn8+7YtF5vDQVLkDSkQ/VxOdaaoZvD8ujdukacXUQxHjGXZc+TH5tdKpNLfD1vPbPX4JEqcrfOlLZWHT2OmQR0N6RVGmii2Zo58oEur9yGfe92CvcZyvMNP9/j37y02Pa5ezAPwicEiGdpXEATSmNaqjcMIJlHwqmzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BM0ph6C9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BM0ph6C9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724293338; x=1755829338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xuI9kfBe/N6afXGUNYZ83tS2YyA0sq+VSnigPJkxTyE=;
  b=BM0ph6C9rrzhz98T0tDQAlPmbReHKPLOIfcsOKJfHMFc5ldB2EpsIXaE
   X4oR3LfGJqCUbsO9fidTj/T3+CEsxe1voGh80GyNcCkuGYty3OcXUAiqd
   SPVk4rVmnpBJMPuA9t580VGeS7Y4CaGoOM0nijgN9BLhJIcJ/m/xXyfAT
   Q81pG0cF4nhf1wKJAITrieRc8QnR0WuVjEjqYw1e/z5Owi2U3RsiV2WtA
   kUq5IpkLOZHu95GAeECkxoffUTqx7rePJ+yA2ULfI2QZonQeGCd/Kxjin
   n8Gm0POrtiwgVWERcC3DDBSAfDsLu4Kt+h3BPUQDubR8GRuvBQFkS5Yex
   A==;
X-CSE-ConnectionGUID: YSxMGvTzRLCEeIUtL3Su0A==
X-CSE-MsgGUID: 6Li9J8S+T9igbLbj/ggtbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22295843"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="22295843"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 19:22:16 -0700
X-CSE-ConnectionGUID: 7m2xaCKWTg+7uIgybTrMZg==
X-CSE-MsgGUID: 7Vjp+PzwRnWMJuuAX9x2pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="66233018"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Aug 2024 19:22:14 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgxSl-000CB2-0h;
	Thu, 22 Aug 2024 02:22:11 +0000
Date: Thu, 22 Aug 2024 10:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: Hongyan Xia <hongyan.xia2@arm.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Warn against unbalanced util_est during
 dequeue
Message-ID: <202408221024.pQc774Ya-lkp@intel.com>
References: <752ae417c02b9277ca3ec18893747c54dd5f277f.1724245193.git.hongyan.xia2@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <752ae417c02b9277ca3ec18893747c54dd5f277f.1724245193.git.hongyan.xia2@arm.com>

Hi Hongyan,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/master peterz-queue/sched/core next-20240821]
[cannot apply to tip/auto-latest linus/master v6.11-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongyan-Xia/sched-fair-Warn-against-unbalanced-util_est-during-dequeue/20240821-210618
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/752ae417c02b9277ca3ec18893747c54dd5f277f.1724245193.git.hongyan.xia2%40arm.com
patch subject: [PATCH] sched/fair: Warn against unbalanced util_est during dequeue
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240822/202408221024.pQc774Ya-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221024.pQc774Ya-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221024.pQc774Ya-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:54:
   kernel/sched/fair.c: In function 'dequeue_task_fair':
>> kernel/sched/fair.c:7180:46: error: 'struct cfs_rq' has no member named 'avg'
    7180 |                         SCHED_WARN_ON(rq->cfs.avg.util_est);
         |                                              ^
   kernel/sched/sched.h:97:42: note: in definition of macro 'SCHED_WARN_ON'
      97 | # define SCHED_WARN_ON(x)      ({ (void)(x), 0; })
         |                                          ^
   kernel/sched/sched.h:97:44: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      97 | # define SCHED_WARN_ON(x)      ({ (void)(x), 0; })
         |                                            ^
   kernel/sched/fair.c:7180:25: note: in expansion of macro 'SCHED_WARN_ON'
    7180 |                         SCHED_WARN_ON(rq->cfs.avg.util_est);
         |                         ^~~~~~~~~~~~~
   kernel/sched/fair.c:7186:38: error: 'struct cfs_rq' has no member named 'avg'
    7186 |                 SCHED_WARN_ON(rq->cfs.avg.util_est);
         |                                      ^
   kernel/sched/sched.h:97:42: note: in definition of macro 'SCHED_WARN_ON'
      97 | # define SCHED_WARN_ON(x)      ({ (void)(x), 0; })
         |                                          ^
   kernel/sched/sched.h:97:44: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      97 | # define SCHED_WARN_ON(x)      ({ (void)(x), 0; })
         |                                            ^
   kernel/sched/fair.c:7186:17: note: in expansion of macro 'SCHED_WARN_ON'
    7186 |                 SCHED_WARN_ON(rq->cfs.avg.util_est);
         |                 ^~~~~~~~~~~~~


vim +7180 kernel/sched/fair.c

  7168	
  7169	/*
  7170	 * The dequeue_task method is called before nr_running is
  7171	 * decreased. We remove the task from the rbtree and
  7172	 * update the fair scheduling stats:
  7173	 */
  7174	static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
  7175	{
  7176		util_est_dequeue(&rq->cfs, p);
  7177	
  7178		if (dequeue_entities(rq, &p->se, flags) < 0) {
  7179			if (!rq->cfs.h_nr_running)
> 7180				SCHED_WARN_ON(rq->cfs.avg.util_est);
  7181			util_est_update(&rq->cfs, p, DEQUEUE_SLEEP);
  7182			return false;
  7183		}
  7184	
  7185		if (!rq->cfs.h_nr_running)
  7186			SCHED_WARN_ON(rq->cfs.avg.util_est);
  7187		util_est_update(&rq->cfs, p, flags & DEQUEUE_SLEEP);
  7188		hrtick_update(rq);
  7189		return true;
  7190	}
  7191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
