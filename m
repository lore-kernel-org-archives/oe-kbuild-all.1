Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F811B395E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 23:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734132159; cv=none; b=igW1Uve0TcDfxQ6Uf3EHa1yZo6JUr6jcn80mlmNgDTgiTeeuCScVQxo6AgLhTvj3MFeQuGh7IIFYtzw2tYao5Ye2mFHi3HxPGBUMpus7tu2uOQ2qcXGek4dIU48uEAm25ZYkjCr4Es8iFe7LZC0nx42VaFJN7+BQAN9Mo5Dp4YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734132159; c=relaxed/simple;
	bh=LOhB4O46OzJ5V9PAtMsqNJLD0hUmEC7TooMxhGCTPmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lYJzxTk90er0Nrh29bCIl42lFqPFLeDWvogYiZ86bjuvMoWIxe9UlY1j4Q3f7W2q60iGsSbsATljHCXi4kbXkR0K47NkrPFp1CDuXjAdoMK83H0/r0gVsL7/zDoQtzsOqlXJzmqO33LaJjjMiByy661y3koJHNbUmQufwk0Q6FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ty0UkS7v; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ty0UkS7v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734132158; x=1765668158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LOhB4O46OzJ5V9PAtMsqNJLD0hUmEC7TooMxhGCTPmg=;
  b=Ty0UkS7vjeJsR1THLfOILsl5N8oF79iK9qiuh5zzptfOcNCUaKE6kEFI
   vXcEv+zAz2toiZozPJulxUKe7PIRUYZwDxIBdAgt2PyC77huCNHUFXug3
   kwFMWP/bU7GvXTZFmB31rPOsXHSXEuHbAKBa9WfWACiikfjKHiA6p9S3S
   +tmdt1gtCaUGkolYf5XZseeNIoLXnidj5RVKSaifDhXcxj/4+4a5gUxcQ
   pBvW0FOC5taeLXKnNzqD4dP1wtdGoLR4Q/X33LZldgPtXp4+WVWEcBu4C
   snurnFGNBBqyNSHP7QCNCHvw3OQbZweJyljvE9jq4BDBdU6vC8uCeBPxW
   A==;
X-CSE-ConnectionGUID: 8faXfyA5TyOE1bTbIAKEzQ==
X-CSE-MsgGUID: CCFidtqnRAOSqqw8H4eZdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34470748"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="34470748"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 15:22:37 -0800
X-CSE-ConnectionGUID: rMbLWaKlTwq07xSmqxcIbw==
X-CSE-MsgGUID: TVUpWy8KR++S1nP9zSsMAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="96569454"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2024 15:22:37 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMEzS-000CWp-0j;
	Fri, 13 Dec 2024 23:22:34 +0000
Date: Sat, 14 Dec 2024 07:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 7228/7241]
 kernel/sched/core.c:4106:63: error: 'struct task_struct' has no member named
 'wake_cpu'; did you mean 'wake_q'?
Message-ID: <202412140745.G1fnehI6-lkp@intel.com>
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
config: arm-randconfig-001-20241214 (https://download.01.org/0day-ci/archive/20241214/202412140745.G1fnehI6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140745.G1fnehI6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140745.G1fnehI6-lkp@intel.com/

Note: the android-common/android16-6.12 HEAD 39fc9c68b13a226d44263bb908cccf8783e34d6e builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'ttwu_runnable':
>> kernel/sched/core.c:4106:63: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    4106 |                         trace_sched_pe_return_migration(p, p->wake_cpu);
         |                                                               ^~~~~~~~
         |                                                               wake_q
   kernel/sched/core.c: In function '__schedule':
   kernel/sched/core.c:7508:25: error: implicit declaration of function 'zap_balance_callbacks'; did you mean 'balance_callbacks'? [-Wimplicit-function-declaration]
    7508 |                         zap_balance_callbacks(rq);
         |                         ^~~~~~~~~~~~~~~~~~~~~
         |                         balance_callbacks


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
