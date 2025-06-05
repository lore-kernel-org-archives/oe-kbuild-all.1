Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF4B7260C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 19:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749152063; cv=none; b=caG5K2JmhPHVs9o9p7Tk6py4UQiunLi/x+XZeFJuxNTvOAnJgFi3Nv3YYmGLfULwY2s98B8uM1OOshkpNu8HPww0T+LgdNq16f2vn7UV6B46zz5dG8CCqDCdTVytT8oVO1oXJvExaYH3qOSVpx3N2x0npYpMCfSALHM6gG+uvb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749152063; c=relaxed/simple;
	bh=eXryyG1m/BQhfdOVYqo2XtzhBqJ4N3EPQGEfJ711UrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1P59h/Yd3B6UKXx2COwO6ymttEwikM9p/dVLpQEqD+y8v1JAw+39CHl0SyCrNfVZyz048OHrQLqWsXzUwYkLTvT32CzAl4lVEcBmXuzxRAmWTI85tn3qreSRzntEbo8U49b6J/2SKPAtsMhgc1XmtxYunJuLLN0nxHeqzt1gJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkU2rQgJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkU2rQgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749152062; x=1780688062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eXryyG1m/BQhfdOVYqo2XtzhBqJ4N3EPQGEfJ711UrM=;
  b=OkU2rQgJDu/IVap9u+qVvWHsTgr6ger2WhxhfOeBSVjR+Ybun9vsrv2Z
   QXSUsY4CqQLv2Svs99DyF7BO35zceFbtzl0MqzFWPLs6pu6dii5NMDU2q
   fBs+5r/g85mRUnWKjmYvytI6wuZRgW+curriFFuTEo0qGm1or5fDWqDB/
   HejObgOz4kQxsJB66sAY5/CzLswFd9sJnhpr/B3pZrmWaYGcthqAQbuHx
   /Umk0HAKSw3VGn++OWsUVJ9oXdlxINw9zZfwhKD8oYk1iL+bBI61XKKbE
   W2GhJsQn6xdo5iAh3oM7jI+fGLciqoDH16SGpV3IQNQmQ+mYcmtWZ299K
   g==;
X-CSE-ConnectionGUID: MrcU+W8xRIaPUOqIY0V2SQ==
X-CSE-MsgGUID: zAlQkSf2QHSl8t2d/1Rubw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="62650097"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="62650097"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 12:34:21 -0700
X-CSE-ConnectionGUID: U0AzhraoSaeZ9h3C9akHXA==
X-CSE-MsgGUID: 5DrEEg48RKKI9qFM1xEevQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="145971159"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2025 12:34:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNGLy-0004Pp-1Q;
	Thu, 05 Jun 2025 19:34:18 +0000
Date: Fri, 6 Jun 2025 03:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yuri Andriaccio <yurand2000@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/9] sched/deadline: Hierarchical scheduling with DL
 on top of RT
Message-ID: <202506060302.XPImkE9l-lkp@intel.com>
References: <20250605071412.139240-6-yurand2000@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605071412.139240-6-yurand2000@gmail.com>

Hi Yuri,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/master linus/master next-20250605]
[cannot apply to peterz-queue/sched/core tip/auto-latest v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuri-Andriaccio/sched-deadline-Make-a-distinction-between-dl_rq-and-my_q/20250605-161409
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250605071412.139240-6-yurand2000%40gmail.com
patch subject: [RFC PATCH 5/9] sched/deadline: Hierarchical scheduling with DL on top of RT
config: i386-buildonly-randconfig-003-20250606 (https://download.01.org/0day-ci/archive/20250606/202506060302.XPImkE9l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506060302.XPImkE9l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506060302.XPImkE9l-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c: In function 'wakeup_preempt_rt':
>> kernel/sched/rt.c:1688:1: warning: label 'no_group_sched' defined but not used [-Wunused-label]
    1688 | no_group_sched:
         | ^~~~~~~~~~~~~~
   kernel/sched/rt.c: In function 'prio_changed_rt':
>> kernel/sched/rt.c:2584:40: error: 'struct rt_rq' has no member named 'tg'
    2584 |                     rt_rq_of_se(&p->rt)->tg != rt_rq_of_se(&rq->curr->rt)->tg)
         |                                        ^~
   kernel/sched/rt.c:2584:74: error: 'struct rt_rq' has no member named 'tg'
    2584 |                     rt_rq_of_se(&p->rt)->tg != rt_rq_of_se(&rq->curr->rt)->tg)
         |                                                                          ^~
   kernel/sched/rt.c: At top level:
   kernel/sched/rt.c:10:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
      10 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~


vim +2584 kernel/sched/rt.c

  2565	
  2566			/*
  2567			 * If there's a higher priority task waiting to run
  2568			 * then reschedule.
  2569			 */
  2570			if (p->prio > rt_rq->highest_prio.curr)
  2571				resched_curr(rq);
  2572	#else
  2573			/* For UP simply resched on drop of prio */
  2574			if (oldprio < p->prio)
  2575				resched_curr(rq);
  2576	#endif /* CONFIG_SMP */
  2577		} else {
  2578			/*
  2579			 * This task is not running, thus we check against the currently
  2580			 * running task for preemption. We can preempt only if both tasks are
  2581			 * in the same cgroup or on the global runqueue.
  2582			 */
  2583			if (IS_ENABLED(CONFIG_RT_GROUP_SCHED) &&
> 2584			    rt_rq_of_se(&p->rt)->tg != rt_rq_of_se(&rq->curr->rt)->tg)
  2585				return;
  2586	
  2587			/*
  2588			 * This task is not running, but if it is
  2589			 * greater than the current running task
  2590			 * then reschedule.
  2591			 */
  2592			if (p->prio < rq->donor->prio)
  2593				resched_curr(rq);
  2594		}
  2595	}
  2596	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
