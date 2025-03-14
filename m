Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859E12E3363
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 06:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741933668; cv=none; b=mn1EBG6PnuX3XHrprsoe1Ky5T3hLV2lLvWjYSYljDbFFw3VAPzPJVVARtI3FO46snGM9Hd5s3zxq9kizWK8Rff7VxHOQn3q3Vn3DpbDFH6zPjwLcwVxAKV3EN/KzOl+rnYLaC33ydxcuuLQvNAld6TfEq2HOujAd/Z5mGZgiJpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741933668; c=relaxed/simple;
	bh=0xmsvv/kPvu5bWVIQWN70HiFfKB4Zvfa1fp/Nf4R8Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tI4PCog9GKeA3RAfjHYOkuOTdJTg/DDjiXdlEt6xQVBDCCRCBlxIWPW85JDx7ZT7mcMW5RJs+k3d/qpKuuQghUA+tIR8lC1+ivmsCQstwqcFRvGXSFeRj2rSpHHEhgpZ41YsEUV2sK4FZxaO/0UZU0+2x25Q6w8nCz4GJI1uFaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIwMk11a; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIwMk11a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741933667; x=1773469667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0xmsvv/kPvu5bWVIQWN70HiFfKB4Zvfa1fp/Nf4R8Mw=;
  b=CIwMk11aeojRLA9yJgPexBSrBAMiPsi54qswFc30iH2ueCJwubrI+XLg
   YFQAY65vdNj2wF9dMIVoCK1NO6WR3cGPHm97835SzmBT8uvObscGvQEY2
   FdQIeMKJwQb7kjQLF6ECn7OKq9z0GNaMV6cpJPLVPe34aXvVShOyjrDAK
   8RUpIdnjvaK/JoLzTV3pyV9GJawK34R6ofOoNFG10Wv6rgOuaj2J5vm7S
   6j5o/lovnxYygm3qC/EodeDL7/ucRzNEwNavkrLVfQU00HnvL2RudBLw7
   BwDZkRJIuYoI/nadHdUx1oHGe5pH7Tkz9+gKIQ4WeuWOFCVSXWDdz6SNZ
   Q==;
X-CSE-ConnectionGUID: iW8BlBZHT2aEMKLbwiQYxw==
X-CSE-MsgGUID: kyA7aruiQaOikvnwkEnEIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54455165"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="54455165"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 23:27:45 -0700
X-CSE-ConnectionGUID: 5M4ZO8IJQ4qKTB2WNi8QkQ==
X-CSE-MsgGUID: N3H/O3PBQImByqjSEwTA9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="152118949"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 13 Mar 2025 23:27:43 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsyWD-000AAL-1R;
	Fri, 14 Mar 2025 06:27:41 +0000
Date: Fri, 14 Mar 2025 14:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/scx-dlserver-boost 13/14] kernel/sched/core.c:6092:21:
 error: too few arguments to function 'class->pick_task'
Message-ID: <202503141425.PEosVzH4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/scx-dlserver-boost
head:   b9fb6bd57dd59c996babc65c5120897a66dde4aa
commit: 93829b151cbe44e283851f678b1e671c7650b964 [13/14] BUGGY: Add support to pick functions to take rf
config: i386-buildonly-randconfig-003-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141425.PEosVzH4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141425.PEosVzH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141425.PEosVzH4-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'pick_task':
>> kernel/sched/core.c:6092:21: error: too few arguments to function 'class->pick_task'
    6092 |                 p = class->pick_task(rq);
         |                     ^~~~~
   kernel/sched/core.c: In function 'pick_next_task':
>> kernel/sched/core.c:6245:37: error: too few arguments to function 'idle_sched_class.pick_task'
    6245 |                                 p = idle_sched_class.pick_task(rq_i);
         |                                     ^~~~~~~~~~~~~~~~


vim +6092 kernel/sched/core.c

539f65125d20aac Peter Zijlstra          2020-11-17  6083  
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6084  static inline struct task_struct *pick_task(struct rq *rq)
539f65125d20aac Peter Zijlstra          2020-11-17  6085  {
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6086  	const struct sched_class *class;
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6087  	struct task_struct *p;
539f65125d20aac Peter Zijlstra          2020-11-17  6088  
bd9bbc96e835688 Peter Zijlstra          2024-08-14  6089  	rq->dl_server = NULL;
bd9bbc96e835688 Peter Zijlstra          2024-08-14  6090  
a7a9fc549293168 Tejun Heo               2024-06-18  6091  	for_each_active_class(class) {
bc9ffef31bf5981 Peter Zijlstra          2021-08-24 @6092  		p = class->pick_task(rq);
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6093  		if (p)
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6094  			return p;
539f65125d20aac Peter Zijlstra          2020-11-17  6095  	}
539f65125d20aac Peter Zijlstra          2020-11-17  6096  
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6097  	BUG(); /* The idle class should always have a runnable task. */
539f65125d20aac Peter Zijlstra          2020-11-17  6098  }
539f65125d20aac Peter Zijlstra          2020-11-17  6099  
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6100) extern void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi);
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6101) 
5b6547ed97f4f5d Peter Zijlstra          2022-03-16  6102  static void queue_core_balance(struct rq *rq);
5b6547ed97f4f5d Peter Zijlstra          2022-03-16  6103  
539f65125d20aac Peter Zijlstra          2020-11-17  6104  static struct task_struct *
539f65125d20aac Peter Zijlstra          2020-11-17  6105  pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
539f65125d20aac Peter Zijlstra          2020-11-17  6106  {
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6107  	struct task_struct *next, *p, *max = NULL;
539f65125d20aac Peter Zijlstra          2020-11-17  6108  	const struct cpumask *smt_mask;
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6109) 	bool fi_before = false;
4feee7d12603dec Josh Don                2021-10-18  6110  	bool core_clock_updated = (rq == rq->core);
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6111  	unsigned long cookie;
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6112  	int i, cpu, occ = 0;
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6113  	struct rq *rq_i;
539f65125d20aac Peter Zijlstra          2020-11-17  6114  	bool need_sync;
539f65125d20aac Peter Zijlstra          2020-11-17  6115  
539f65125d20aac Peter Zijlstra          2020-11-17  6116  	if (!sched_core_enabled(rq))
539f65125d20aac Peter Zijlstra          2020-11-17  6117  		return __pick_next_task(rq, prev, rf);
539f65125d20aac Peter Zijlstra          2020-11-17  6118  
539f65125d20aac Peter Zijlstra          2020-11-17  6119  	cpu = cpu_of(rq);
539f65125d20aac Peter Zijlstra          2020-11-17  6120  
539f65125d20aac Peter Zijlstra          2020-11-17  6121  	/* Stopper task is switching into idle, no need core-wide selection. */
539f65125d20aac Peter Zijlstra          2020-11-17  6122  	if (cpu_is_offline(cpu)) {
539f65125d20aac Peter Zijlstra          2020-11-17  6123  		/*
539f65125d20aac Peter Zijlstra          2020-11-17  6124  		 * Reset core_pick so that we don't enter the fastpath when
539f65125d20aac Peter Zijlstra          2020-11-17  6125  		 * coming online. core_pick would already be migrated to
539f65125d20aac Peter Zijlstra          2020-11-17  6126  		 * another cpu during offline.
539f65125d20aac Peter Zijlstra          2020-11-17  6127  		 */
539f65125d20aac Peter Zijlstra          2020-11-17  6128  		rq->core_pick = NULL;
bd9bbc96e835688 Peter Zijlstra          2024-08-14  6129  		rq->core_dl_server = NULL;
539f65125d20aac Peter Zijlstra          2020-11-17  6130  		return __pick_next_task(rq, prev, rf);
539f65125d20aac Peter Zijlstra          2020-11-17  6131  	}
539f65125d20aac Peter Zijlstra          2020-11-17  6132  
539f65125d20aac Peter Zijlstra          2020-11-17  6133  	/*
539f65125d20aac Peter Zijlstra          2020-11-17  6134  	 * If there were no {en,de}queues since we picked (IOW, the task
539f65125d20aac Peter Zijlstra          2020-11-17  6135  	 * pointers are all still valid), and we haven't scheduled the last
539f65125d20aac Peter Zijlstra          2020-11-17  6136  	 * pick yet, do so now.
539f65125d20aac Peter Zijlstra          2020-11-17  6137  	 *
539f65125d20aac Peter Zijlstra          2020-11-17  6138  	 * rq->core_pick can be NULL if no selection was made for a CPU because
539f65125d20aac Peter Zijlstra          2020-11-17  6139  	 * it was either offline or went offline during a sibling's core-wide
539f65125d20aac Peter Zijlstra          2020-11-17  6140  	 * selection. In this case, do a core-wide selection.
539f65125d20aac Peter Zijlstra          2020-11-17  6141  	 */
539f65125d20aac Peter Zijlstra          2020-11-17  6142  	if (rq->core->core_pick_seq == rq->core->core_task_seq &&
539f65125d20aac Peter Zijlstra          2020-11-17  6143  	    rq->core->core_pick_seq != rq->core_sched_seq &&
539f65125d20aac Peter Zijlstra          2020-11-17  6144  	    rq->core_pick) {
539f65125d20aac Peter Zijlstra          2020-11-17  6145  		WRITE_ONCE(rq->core_sched_seq, rq->core->core_pick_seq);
539f65125d20aac Peter Zijlstra          2020-11-17  6146  
539f65125d20aac Peter Zijlstra          2020-11-17  6147  		next = rq->core_pick;
bd9bbc96e835688 Peter Zijlstra          2024-08-14  6148  		rq->dl_server = rq->core_dl_server;
539f65125d20aac Peter Zijlstra          2020-11-17  6149  		rq->core_pick = NULL;
bd9bbc96e835688 Peter Zijlstra          2024-08-14  6150  		rq->core_dl_server = NULL;
436f3eed5c69c10 Peter Zijlstra          2024-08-14  6151  		goto out_set_next;
539f65125d20aac Peter Zijlstra          2020-11-17  6152  	}
539f65125d20aac Peter Zijlstra          2020-11-17  6153  
260598f142c3481 Peter Zijlstra          2024-08-14  6154  	prev_balance(rq, prev, rf);
539f65125d20aac Peter Zijlstra          2020-11-17  6155  
539f65125d20aac Peter Zijlstra          2020-11-17  6156  	smt_mask = cpu_smt_mask(cpu);
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6157) 	need_sync = !!rq->core->core_cookie;
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6158) 
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6159) 	/* reset state */
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6160) 	rq->core->core_cookie = 0UL;
4feee7d12603dec Josh Don                2021-10-18  6161  	if (rq->core->core_forceidle_count) {
4feee7d12603dec Josh Don                2021-10-18  6162  		if (!core_clock_updated) {
4feee7d12603dec Josh Don                2021-10-18  6163  			update_rq_clock(rq->core);
4feee7d12603dec Josh Don                2021-10-18  6164  			core_clock_updated = true;
4feee7d12603dec Josh Don                2021-10-18  6165  		}
4feee7d12603dec Josh Don                2021-10-18  6166  		sched_core_account_forceidle(rq);
4feee7d12603dec Josh Don                2021-10-18  6167  		/* reset after accounting force idle */
4feee7d12603dec Josh Don                2021-10-18  6168  		rq->core->core_forceidle_start = 0;
4feee7d12603dec Josh Don                2021-10-18  6169  		rq->core->core_forceidle_count = 0;
4feee7d12603dec Josh Don                2021-10-18  6170  		rq->core->core_forceidle_occupation = 0;
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6171) 		need_sync = true;
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6172) 		fi_before = true;
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6173) 	}
539f65125d20aac Peter Zijlstra          2020-11-17  6174  
539f65125d20aac Peter Zijlstra          2020-11-17  6175  	/*
539f65125d20aac Peter Zijlstra          2020-11-17  6176  	 * core->core_task_seq, core->core_pick_seq, rq->core_sched_seq
539f65125d20aac Peter Zijlstra          2020-11-17  6177  	 *
539f65125d20aac Peter Zijlstra          2020-11-17  6178  	 * @task_seq guards the task state ({en,de}queues)
539f65125d20aac Peter Zijlstra          2020-11-17  6179  	 * @pick_seq is the @task_seq we did a selection on
539f65125d20aac Peter Zijlstra          2020-11-17  6180  	 * @sched_seq is the @pick_seq we scheduled
539f65125d20aac Peter Zijlstra          2020-11-17  6181  	 *
539f65125d20aac Peter Zijlstra          2020-11-17  6182  	 * However, preemptions can cause multiple picks on the same task set.
539f65125d20aac Peter Zijlstra          2020-11-17  6183  	 * 'Fix' this by also increasing @task_seq for every pick.
539f65125d20aac Peter Zijlstra          2020-11-17  6184  	 */
539f65125d20aac Peter Zijlstra          2020-11-17  6185  	rq->core->core_task_seq++;
539f65125d20aac Peter Zijlstra          2020-11-17  6186  
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6187) 	/*
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6188) 	 * Optimize for common case where this CPU has no cookies
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6189) 	 * and there are no cookied tasks running on siblings.
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6190) 	 */
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6191) 	if (!need_sync) {
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6192  		next = pick_task(rq);
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6193) 		if (!next->core_cookie) {
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6194) 			rq->core_pick = NULL;
bd9bbc96e835688 Peter Zijlstra          2024-08-14  6195  			rq->core_dl_server = NULL;
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6196) 			/*
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6197) 			 * For robustness, update the min_vruntime_fi for
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6198) 			 * unconstrained picks as well.
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6199) 			 */
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6200) 			WARN_ON_ONCE(fi_before);
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6201) 			task_vruntime_update(rq, next, false);
5b6547ed97f4f5d Peter Zijlstra          2022-03-16  6202  			goto out_set_next;
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6203) 		}
8039e96fcc1de30 Vineeth Pillai          2020-11-17  6204  	}
7afbba119f0da09 Joel Fernandes (Google  2020-11-17  6205) 
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6206  	/*
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6207  	 * For each thread: do the regular task pick and find the max prio task
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6208  	 * amongst them.
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6209  	 *
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6210  	 * Tie-break prio towards the current CPU
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6211  	 */
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6212  	for_each_cpu_wrap(i, smt_mask, cpu) {
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6213  		rq_i = cpu_rq(i);
539f65125d20aac Peter Zijlstra          2020-11-17  6214  
4feee7d12603dec Josh Don                2021-10-18  6215  		/*
4feee7d12603dec Josh Don                2021-10-18  6216  		 * Current cpu always has its clock updated on entrance to
4feee7d12603dec Josh Don                2021-10-18  6217  		 * pick_next_task(). If the current cpu is not the core,
4feee7d12603dec Josh Don                2021-10-18  6218  		 * the core may also have been updated above.
4feee7d12603dec Josh Don                2021-10-18  6219  		 */
4feee7d12603dec Josh Don                2021-10-18  6220  		if (i != cpu && (rq_i != rq->core || !core_clock_updated))
539f65125d20aac Peter Zijlstra          2020-11-17  6221  			update_rq_clock(rq_i);
539f65125d20aac Peter Zijlstra          2020-11-17  6222  
bd9bbc96e835688 Peter Zijlstra          2024-08-14  6223  		rq_i->core_pick = p = pick_task(rq_i);
bd9bbc96e835688 Peter Zijlstra          2024-08-14  6224  		rq_i->core_dl_server = rq_i->dl_server;
bd9bbc96e835688 Peter Zijlstra          2024-08-14  6225  
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6226  		if (!max || prio_less(max, p, fi_before))
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6227  			max = p;
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6228  	}
539f65125d20aac Peter Zijlstra          2020-11-17  6229  
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6230  	cookie = rq->core->core_cookie = max->core_cookie;
539f65125d20aac Peter Zijlstra          2020-11-17  6231  
539f65125d20aac Peter Zijlstra          2020-11-17  6232  	/*
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6233  	 * For each thread: try and find a runnable task that matches @max or
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6234  	 * force idle.
539f65125d20aac Peter Zijlstra          2020-11-17  6235  	 */
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6236  	for_each_cpu(i, smt_mask) {
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6237  		rq_i = cpu_rq(i);
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6238  		p = rq_i->core_pick;
539f65125d20aac Peter Zijlstra          2020-11-17  6239  
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6240  		if (!cookie_equals(p, cookie)) {
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6241  			p = NULL;
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6242  			if (cookie)
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6243  				p = sched_core_find(rq_i, cookie);
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6244  			if (!p)
bc9ffef31bf5981 Peter Zijlstra          2021-08-24 @6245  				p = idle_sched_class.pick_task(rq_i);
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6246  		}
d2dfa17bc7de67e Peter Zijlstra          2020-11-17  6247  
539f65125d20aac Peter Zijlstra          2020-11-17  6248  		rq_i->core_pick = p;
bd9bbc96e835688 Peter Zijlstra          2024-08-14  6249  		rq_i->core_dl_server = NULL;
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6250  
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6251  		if (p == rq_i->idle) {
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6252  			if (rq_i->nr_running) {
4feee7d12603dec Josh Don                2021-10-18  6253  				rq->core->core_forceidle_count++;
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6254) 				if (!fi_before)
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6255) 					rq->core->core_forceidle_seq++;
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6256) 			}
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6257  		} else {
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6258  			occ++;
539f65125d20aac Peter Zijlstra          2020-11-17  6259  		}
539f65125d20aac Peter Zijlstra          2020-11-17  6260  	}
539f65125d20aac Peter Zijlstra          2020-11-17  6261  
4feee7d12603dec Josh Don                2021-10-18  6262  	if (schedstat_enabled() && rq->core->core_forceidle_count) {
4feee7d12603dec Josh Don                2021-10-18  6263  		rq->core->core_forceidle_start = rq_clock(rq->core);
4feee7d12603dec Josh Don                2021-10-18  6264  		rq->core->core_forceidle_occupation = occ;
4feee7d12603dec Josh Don                2021-10-18  6265  	}
4feee7d12603dec Josh Don                2021-10-18  6266  
539f65125d20aac Peter Zijlstra          2020-11-17  6267  	rq->core->core_pick_seq = rq->core->core_task_seq;
539f65125d20aac Peter Zijlstra          2020-11-17  6268  	next = rq->core_pick;
539f65125d20aac Peter Zijlstra          2020-11-17  6269  	rq->core_sched_seq = rq->core->core_pick_seq;
539f65125d20aac Peter Zijlstra          2020-11-17  6270  
539f65125d20aac Peter Zijlstra          2020-11-17  6271  	/* Something should have been selected for current CPU */
539f65125d20aac Peter Zijlstra          2020-11-17  6272  	WARN_ON_ONCE(!next);
539f65125d20aac Peter Zijlstra          2020-11-17  6273  
539f65125d20aac Peter Zijlstra          2020-11-17  6274  	/*
539f65125d20aac Peter Zijlstra          2020-11-17  6275  	 * Reschedule siblings
539f65125d20aac Peter Zijlstra          2020-11-17  6276  	 *
539f65125d20aac Peter Zijlstra          2020-11-17  6277  	 * NOTE: L1TF -- at this point we're no longer running the old task and
539f65125d20aac Peter Zijlstra          2020-11-17  6278  	 * sending an IPI (below) ensures the sibling will no longer be running
539f65125d20aac Peter Zijlstra          2020-11-17  6279  	 * their task. This ensures there is no inter-sibling overlap between
539f65125d20aac Peter Zijlstra          2020-11-17  6280  	 * non-matching user state.
539f65125d20aac Peter Zijlstra          2020-11-17  6281  	 */
539f65125d20aac Peter Zijlstra          2020-11-17  6282  	for_each_cpu(i, smt_mask) {
bc9ffef31bf5981 Peter Zijlstra          2021-08-24  6283  		rq_i = cpu_rq(i);
539f65125d20aac Peter Zijlstra          2020-11-17  6284  
539f65125d20aac Peter Zijlstra          2020-11-17  6285  		/*
539f65125d20aac Peter Zijlstra          2020-11-17  6286  		 * An online sibling might have gone offline before a task
539f65125d20aac Peter Zijlstra          2020-11-17  6287  		 * could be picked for it, or it might be offline but later
539f65125d20aac Peter Zijlstra          2020-11-17  6288  		 * happen to come online, but its too late and nothing was
539f65125d20aac Peter Zijlstra          2020-11-17  6289  		 * picked for it.  That's Ok - it will pick tasks for itself,
539f65125d20aac Peter Zijlstra          2020-11-17  6290  		 * so ignore it.
539f65125d20aac Peter Zijlstra          2020-11-17  6291  		 */
539f65125d20aac Peter Zijlstra          2020-11-17  6292  		if (!rq_i->core_pick)
539f65125d20aac Peter Zijlstra          2020-11-17  6293  			continue;
539f65125d20aac Peter Zijlstra          2020-11-17  6294  
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6295) 		/*
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6296) 		 * Update for new !FI->FI transitions, or if continuing to be in !FI:
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6297) 		 * fi_before     fi      update?
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6298) 		 *  0            0       1
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6299) 		 *  0            1       1
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6300) 		 *  1            0       1
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6301) 		 *  1            1       0
c6047c2e3af68da Joel Fernandes (Google  2020-11-17  6302) 		 */
4feee7d12603dec Josh Don                2021-10-18  6303  		if (!(fi_before && rq->core->core_forceidle_count))
4feee7d12603dec Josh Don                2021-10-18  6304  			task_vruntime_update(rq_i, rq_i->core_pick, !!rq->core->core_forceidle_count);
539f65125d20aac Peter Zijlstra          2020-11-17  6305  
d2dfa17bc7de67e Peter Zijlstra          2020-11-17  6306  		rq_i->core_pick->core_occupation = occ;
d2dfa17bc7de67e Peter Zijlstra          2020-11-17  6307  
539f65125d20aac Peter Zijlstra          2020-11-17  6308  		if (i == cpu) {
539f65125d20aac Peter Zijlstra          2020-11-17  6309  			rq_i->core_pick = NULL;
bd9bbc96e835688 Peter Zijlstra          2024-08-14  6310  			rq_i->core_dl_server = NULL;
539f65125d20aac Peter Zijlstra          2020-11-17  6311  			continue;
539f65125d20aac Peter Zijlstra          2020-11-17  6312  		}
539f65125d20aac Peter Zijlstra          2020-11-17  6313  
539f65125d20aac Peter Zijlstra          2020-11-17  6314  		/* Did we break L1TF mitigation requirements? */
539f65125d20aac Peter Zijlstra          2020-11-17  6315  		WARN_ON_ONCE(!cookie_match(next, rq_i->core_pick));
539f65125d20aac Peter Zijlstra          2020-11-17  6316  
539f65125d20aac Peter Zijlstra          2020-11-17  6317  		if (rq_i->curr == rq_i->core_pick) {
539f65125d20aac Peter Zijlstra          2020-11-17  6318  			rq_i->core_pick = NULL;
bd9bbc96e835688 Peter Zijlstra          2024-08-14  6319  			rq_i->core_dl_server = NULL;
539f65125d20aac Peter Zijlstra          2020-11-17  6320  			continue;
539f65125d20aac Peter Zijlstra          2020-11-17  6321  		}
539f65125d20aac Peter Zijlstra          2020-11-17  6322  
539f65125d20aac Peter Zijlstra          2020-11-17  6323  		resched_curr(rq_i);
539f65125d20aac Peter Zijlstra          2020-11-17  6324  	}
539f65125d20aac Peter Zijlstra          2020-11-17  6325  
5b6547ed97f4f5d Peter Zijlstra          2022-03-16  6326  out_set_next:
436f3eed5c69c10 Peter Zijlstra          2024-08-14  6327  	put_prev_set_next_task(rq, prev, next);
5b6547ed97f4f5d Peter Zijlstra          2022-03-16  6328  	if (rq->core->core_forceidle_count && next == rq->idle)
5b6547ed97f4f5d Peter Zijlstra          2022-03-16  6329  		queue_core_balance(rq);
5b6547ed97f4f5d Peter Zijlstra          2022-03-16  6330  
539f65125d20aac Peter Zijlstra          2020-11-17  6331  	return next;
539f65125d20aac Peter Zijlstra          2020-11-17  6332  }
9edeaea1bc45237 Peter Zijlstra          2020-11-17  6333  

:::::: The code at line 6092 was first introduced by commit
:::::: bc9ffef31bf59819c9fc032178534ff9ed7c4981 sched/core: Simplify core-wide task selection

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
