Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3CC30148B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765443053; cv=none; b=fCEptmkt3YAcWQCrxgWeXRAGjoq56go1IaHnUxQNBNR+wsn6GxlQE/mNPPlxT5+28N+ZyKg54B0oah8NdKXV29EUXA/0ceeHp+uFgt9yA4pZ3tMJ42tHYDYSiaG1xhdB3D/PsjHNHEPHtvqa+kV8Rc0wdt0NUNMJR2tw1XmAzBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765443053; c=relaxed/simple;
	bh=Y2fSakf3HpIkHlwlAkViFMLUyj5KWW66GCtAqFYd0LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAVEmjSSx7I/qN/wJkJdN16SJAU4c6ur89YWewhWkCfJUkAn8VJnSJyCBj6iobk0f/ETEwfHvVVqOpBwpII2TREY5tVagVIe8E9Rv6CWOZYZjE7uA1pdUpyT2lpRHD/pockvo0jy6FxBjhP9G0QbuVdtWlhBhVOkr8UAFK9SdSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViiKSfcJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViiKSfcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765443052; x=1796979052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y2fSakf3HpIkHlwlAkViFMLUyj5KWW66GCtAqFYd0LY=;
  b=ViiKSfcJmBzkwAJ2Vts31JdsQmAbyAZ+dSPCDI1dTAYfw6jaxGSbHYYf
   ubxyEgXqFUEFfbUIOJxYC7kcbCJMba6f9BKkfoioJOfWs6wHG8XeyqDUv
   0ZFfUKqHQ7yKuLGIjsWcMuNF9RrApXi36OLIWy+BKPfStAHToCRImXA2j
   P9RWeApD+2OtZYCreL2gEg2duQqi13tOoC3Fx4fnz6WpfuuM1gXN0SufC
   /4Bk24ir1G3NR5VXTsqaCMgHOSH94T94Fkrm54BV2KhxRFujNw5Tv85X8
   +MiSwt0DSPuoR3jgq3/PmgX3rBJCGMVxbRdfyk8IGOKU00Q4Cp3Uu35h/
   g==;
X-CSE-ConnectionGUID: iqDkaYbZQ9+F0EuANOvfZA==
X-CSE-MsgGUID: eVTLtSdQQPWtfjdBd9rfvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67471136"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67471136"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 00:50:51 -0800
X-CSE-ConnectionGUID: ewAEW+7oRhW6MTAvZzzG0w==
X-CSE-MsgGUID: OtW8/2hwQ8W/6k4QcdaKzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201837874"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Dec 2025 00:50:50 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTcNr-000000004Qt-2u3b;
	Thu, 11 Dec 2025 08:50:47 +0000
Date: Thu, 11 Dec 2025 16:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: Yuri Andriaccio <yurand2000@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 13/28] sched/rt: Update task event callbacks for
 HCBS scheduling
Message-ID: <202512111651.zyrWX5KS-lkp@intel.com>
References: <20251201124205.11169-14-yurand2000@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201124205.11169-14-yurand2000@gmail.com>

Hi Yuri,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18]
[cannot apply to tip/sched/core tip/master peterz-queue/sched/core tip/auto-latest next-20251211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuri-Andriaccio/sched-deadline-Distinct-between-dl_rq-and-my_q/20251201-214223
base:   linus/master
patch link:    https://lore.kernel.org/r/20251201124205.11169-14-yurand2000%40gmail.com
patch subject: [RFC PATCH v4 13/28] sched/rt: Update task event callbacks for HCBS scheduling
config: x86_64-randconfig-121-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111651.zyrWX5KS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111651.zyrWX5KS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111651.zyrWX5KS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c: In function 'prio_changed_rt':
>> kernel/sched/rt.c:1860:40: error: 'struct rt_rq' has no member named 'tg'
    1860 |                     rt_rq_of_se(&p->rt)->tg != rt_rq_of_se(&rq->curr->rt)->tg)
         |                                        ^~
   kernel/sched/rt.c:1860:74: error: 'struct rt_rq' has no member named 'tg'
    1860 |                     rt_rq_of_se(&p->rt)->tg != rt_rq_of_se(&rq->curr->rt)->tg)
         |                                                                          ^~


vim +1860 kernel/sched/rt.c

  1826	
  1827	/*
  1828	 * Priority of the task has changed. This may cause
  1829	 * us to initiate a push or pull.
  1830	 */
  1831	static void
  1832	prio_changed_rt(struct rq *rq, struct task_struct *p, int oldprio)
  1833	{
  1834		struct rt_rq *rt_rq = rt_rq_of_se(&p->rt);
  1835	
  1836		if (!task_on_rq_queued(p))
  1837			return;
  1838	
  1839		if (task_current_donor(rq, p)) {
  1840			/*
  1841			 * If our priority decreases while running, we
  1842			 * may need to pull tasks to this runqueue.
  1843			 */
  1844			if (!IS_ENABLED(CONFIG_RT_GROUP_SCHED) && oldprio < p->prio)
  1845				rt_queue_pull_task(rt_rq);
  1846	
  1847			/*
  1848			 * If there's a higher priority task waiting to run
  1849			 * then reschedule.
  1850			 */
  1851			if (p->prio > rt_rq->highest_prio.curr)
  1852				resched_curr(rq);
  1853		} else {
  1854			/*
  1855			 * This task is not running, thus we check against the currently
  1856			 * running task for preemption. We can preempt only if both tasks are
  1857			 * in the same cgroup or on the global runqueue.
  1858			 */
  1859			if (IS_ENABLED(CONFIG_RT_GROUP_SCHED) &&
> 1860			    rt_rq_of_se(&p->rt)->tg != rt_rq_of_se(&rq->curr->rt)->tg)
  1861				return;
  1862	
  1863			/*
  1864			 * This task is not running, but if it is
  1865			 * greater than the current running task
  1866			 * then reschedule.
  1867			 */
  1868			if (p->prio < rq->donor->prio)
  1869				resched_curr(rq);
  1870		}
  1871	}
  1872	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
