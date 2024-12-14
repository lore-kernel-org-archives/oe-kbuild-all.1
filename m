Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8991B5C96
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 01:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734138601; cv=none; b=B61Nx0LS/Fi5UYyKNAOuYRjQt3Yp6Z6ATa/WvoREPg+/7QpfdRBWLpLQYULCAkgFrHjbiVHn/S553KtTt5YxzLDXT58s2jVN7uqm+5RoT4OQYxW1E2ZqZFvZnNJFFZTQqkPZpl4k5LLUryQXG6KAAwnuvzPB4gO5VqhSMvZv12U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734138601; c=relaxed/simple;
	bh=Wsa/RzezSlUrZ8KNmYIaWAIrAA11DvuRQz6aozH82Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mnDPZitMCH7XFiBzH5qydzrNOQ3ZppaBtelY0/+KOFGRxgRpMAnpwnWLEOvvdZXpCtnfQ4PiR8BjmUBYTroFqw7we6ayRvHx19S8XtImxYVjN8/JybZzC+4p2n4NP7mtqWjWzCy3MG0MhOEMjUzFKdXwYqzEdSGdipYZsG1hyOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZ/abNbX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZ/abNbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734138600; x=1765674600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wsa/RzezSlUrZ8KNmYIaWAIrAA11DvuRQz6aozH82Aw=;
  b=aZ/abNbX1EW8DJ6HqfYrjYEEmo+YXzUmdrgDha2XZ41wa1AMmxqcGeME
   exj1WjiUxZi/+aUQlTqC/OhaLqXm4K4QCaHlrULcN57FSajr5jJ2Gtwzv
   oianIJM5WpKWpOGFNmNyTL9/NluAQgPw1KBSTi9ONET9+ROi1UMi4mLX2
   dFCYZaHMoV94oQTBdV+3yxs4PtLRjq23gVnYB3Z71j+yIgFdm+hqMBzqK
   RqjE/uXsxUTkioMs0MA6p+p8l57ifl7OQafr1qXHBj2o5+mQ8eASg2aR2
   v/45VWtee1aBrsSWLBjii+VDz63ifTCt6eHMM9wRlKEt/9M+Rjzn+P6f3
   w==;
X-CSE-ConnectionGUID: u5qR446xRtikDPy02HGnNw==
X-CSE-MsgGUID: 9EfKVBmUSAK/DVumdwzajw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34754025"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="34754025"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 17:09:59 -0800
X-CSE-ConnectionGUID: JJNgje4vS0CjUGyBXE2hnw==
X-CSE-MsgGUID: NC3+6naNTKaDyq9bxDZRcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="101707771"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Dec 2024 17:09:58 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMGfL-000Cb9-1x;
	Sat, 14 Dec 2024 01:09:55 +0000
Date: Sat, 14 Dec 2024 09:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 7228/7241]
 kernel/sched/core.c:4106:42: error: no member named 'wake_cpu' in 'struct
 task_struct'
Message-ID: <202412140822.hEuks5y8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   39fc9c68b13a226d44263bb908cccf8783e34d6e
commit: 6d7a9ac0d5ae138d1457c4c0efd7bc1572289a94 [7228/7241] ANDROID: sched: Add trace events for proxy execution
config: arm-randconfig-002-20241214 (https://download.01.org/0day-ci/archive/20241214/202412140822.hEuks5y8-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140822.hEuks5y8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140822.hEuks5y8-lkp@intel.com/

Note: the android-common/android16-6.12 HEAD 39fc9c68b13a226d44263bb908cccf8783e34d6e builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:4106:42: error: no member named 'wake_cpu' in 'struct task_struct'
                           trace_sched_pe_return_migration(p, p->wake_cpu);
                                                              ~  ^
   kernel/sched/core.c:7508:4: error: call to undeclared function 'zap_balance_callbacks'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           zap_balance_callbacks(rq);
                           ^
   kernel/sched/core.c:7508:4: note: did you mean '__balance_callbacks'?
   kernel/sched/core.c:5475:20: note: '__balance_callbacks' declared here
   static inline void __balance_callbacks(struct rq *rq)
                      ^
   2 errors generated.


vim +4106 kernel/sched/core.c

  4059	
  4060	/*
  4061	 * Consider @p being inside a wait loop:
  4062	 *
  4063	 *   for (;;) {
  4064	 *      set_current_state(TASK_UNINTERRUPTIBLE);
  4065	 *
  4066	 *      if (CONDITION)
  4067	 *         break;
  4068	 *
  4069	 *      schedule();
  4070	 *   }
  4071	 *   __set_current_state(TASK_RUNNING);
  4072	 *
  4073	 * between set_current_state() and schedule(). In this case @p is still
  4074	 * runnable, so all that needs doing is change p->state back to TASK_RUNNING in
  4075	 * an atomic manner.
  4076	 *
  4077	 * By taking task_rq(p)->lock we serialize against schedule(), if @p->on_rq
  4078	 * then schedule() must still happen and p->state can be changed to
  4079	 * TASK_RUNNING. Otherwise we lost the race, schedule() has happened, and we
  4080	 * need to do a full wakeup with enqueue.
  4081	 *
  4082	 * Returns: %true when the wakeup is done,
  4083	 *          %false otherwise.
  4084	 */
  4085	static int ttwu_runnable(struct task_struct *p, int wake_flags)
  4086	{
  4087		struct rq_flags rf;
  4088		struct rq *rq;
  4089		int ret = 0;
  4090	
  4091		rq = __task_rq_lock(p, &rf);
  4092		if (task_on_rq_queued(p)) {
  4093			update_rq_clock(rq);
  4094			if (p->se.sched_delayed) {
  4095				proxy_remove_from_sleeping_owner(p);
  4096				enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
  4097			}
  4098			if (!task_on_cpu(rq, p)) {
  4099				/*
  4100				 * When on_rq && !on_cpu the task is preempted, see if
  4101				 * it should preempt the task that is current now.
  4102				 */
  4103				wakeup_preempt(rq, p, wake_flags);
  4104			}
  4105			if (proxy_needs_return(rq, p)) {
> 4106				trace_sched_pe_return_migration(p, p->wake_cpu);
  4107				goto out;
  4108			}
  4109			ttwu_do_wakeup(p);
  4110			ret = 1;
  4111		}
  4112	out:
  4113		__task_rq_unlock(rq, &rf);
  4114	
  4115		return ret;
  4116	}
  4117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
