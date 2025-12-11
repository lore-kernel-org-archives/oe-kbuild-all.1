Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5DB1A9F83
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 04:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765427077; cv=none; b=P5Z2QHMKWwakNhsYSTYqGG6Xv0hHigYxR/TQc2WBwCvmbvfMsjOVl+5fWggpp3hfcp4fG+AXBN8uvx278XDKW2a0Mpfa6Jc56sf+aPmrhZ74lKzHgnjUcNp9b0CCMfCkuhLajqwEr6ods0SlGd3kUr4Kky9DrAimObgYwUyHPmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765427077; c=relaxed/simple;
	bh=M3R9nzzG4aLqkqNKGXy+aZL6hLbF0ncBJrqD4pOlwsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oVhPM0PF9v09fIzktM7fMbuy3SX7yAZ9XWcaIZR9E2iqHxzUTfuDy1up646rTlG3y/ZsspEHKHMG84zi2xGlYRuI+JPDas62O1ZO7gz2SBOlqb99BSHNeDu2zJDOCJeGjNs8p9CcCX+rKFt+yZKqz7NwxixpxAhmSV5OZ00pHZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAfmlxFS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAfmlxFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765427076; x=1796963076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M3R9nzzG4aLqkqNKGXy+aZL6hLbF0ncBJrqD4pOlwsc=;
  b=OAfmlxFSWyiEp7T+LqgSmAdgDlQjCPcSeOhTsBSVh/4TJpK7q8UcaHhQ
   wXdejSoyUqBunvSeYubsWJg+o3rndM8xCB7tHjYIUM6pgtM0CoOJX/YEQ
   eQWlmY/FSVDOYg2FFEH4ThjK028TXVMa00T6JndV/dUQxual3x59yWUN5
   VklL/cn+/JrOg90jVxIf9dgzicBhqlAOekhEfPgtg52LdHs+Lm6N1uECO
   /01bWcJDhvWo4iVtOHpYOdm2XpRw3pyxnRhD4uNOwaQWnBhPklsAlQ0OX
   WD4rNVdmYK6gzWsdiKV0eRGnw4Xv6IKMlGNzT8liMDljEpsfJyZobpZcA
   Q==;
X-CSE-ConnectionGUID: w1K3adDXSVe6RqoGbJE+gg==
X-CSE-MsgGUID: hEVWbzRVQlGy3Ln0vxRKDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67442776"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67442776"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 20:24:35 -0800
X-CSE-ConnectionGUID: ITbe5tv2TOGKDVUqMnqdJw==
X-CSE-MsgGUID: 3DjgE5CBSZy4H8eFGIAC0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196701407"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2025 20:24:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTYEA-0000000048v-0dRD;
	Thu, 11 Dec 2025 04:24:30 +0000
Date: Thu, 11 Dec 2025 12:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Connor O'Brien <connoro@google.com>,
	John Stultz <jstultz@google.com>, Metin Kaya <metin.kaya@arm.com>
Subject: kernel/sched/fair.c:8784:37: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202512111218.sqWkmRcc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8c8081cc599fcafa25371d50959c17e154f9fd08
commit: af0c8b2bf67b25756f27644936e74fd9a6273bd2 sched: Split scheduler and execution contexts
date:   1 year, 2 months ago
config: i386-randconfig-061-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111218.sqWkmRcc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111218.sqWkmRcc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111218.sqWkmRcc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1203:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:1203:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:1203:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:1261:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1261:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1261:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:6833:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:6833:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:6833:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:7036:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7036:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:7036:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8753:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8753:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8753:39: sparse:     got struct task_struct [noderef] __rcu *donor
>> kernel/sched/fair.c:8784:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8784:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8784:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8995:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8995:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8995:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:6755:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2496:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2496:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2496:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *

vim +8784 kernel/sched/fair.c

  8747	
  8748	/*
  8749	 * Preempt the current task with a newly woken task if needed:
  8750	 */
  8751	static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int wake_flags)
  8752	{
  8753		struct task_struct *donor = rq->donor;
  8754		struct sched_entity *se = &donor->se, *pse = &p->se;
  8755		struct cfs_rq *cfs_rq = task_cfs_rq(donor);
  8756		int cse_is_idle, pse_is_idle;
  8757	
  8758		if (unlikely(se == pse))
  8759			return;
  8760	
  8761		/*
  8762		 * This is possible from callers such as attach_tasks(), in which we
  8763		 * unconditionally wakeup_preempt() after an enqueue (which may have
  8764		 * lead to a throttle).  This both saves work and prevents false
  8765		 * next-buddy nomination below.
  8766		 */
  8767		if (unlikely(throttled_hierarchy(cfs_rq_of(pse))))
  8768			return;
  8769	
  8770		if (sched_feat(NEXT_BUDDY) && !(wake_flags & WF_FORK)) {
  8771			set_next_buddy(pse);
  8772		}
  8773	
  8774		/*
  8775		 * We can come here with TIF_NEED_RESCHED already set from new task
  8776		 * wake up path.
  8777		 *
  8778		 * Note: this also catches the edge-case of curr being in a throttled
  8779		 * group (e.g. via set_curr_task), since update_curr() (in the
  8780		 * enqueue of curr) will have resulted in resched being set.  This
  8781		 * prevents us from potentially nominating it as a false LAST_BUDDY
  8782		 * below.
  8783		 */
> 8784		if (test_tsk_need_resched(rq->curr))
  8785			return;
  8786	
  8787		if (!sched_feat(WAKEUP_PREEMPTION))
  8788			return;
  8789	
  8790		find_matching_se(&se, &pse);
  8791		WARN_ON_ONCE(!pse);
  8792	
  8793		cse_is_idle = se_is_idle(se);
  8794		pse_is_idle = se_is_idle(pse);
  8795	
  8796		/*
  8797		 * Preempt an idle entity in favor of a non-idle entity (and don't preempt
  8798		 * in the inverse case).
  8799		 */
  8800		if (cse_is_idle && !pse_is_idle)
  8801			goto preempt;
  8802		if (cse_is_idle != pse_is_idle)
  8803			return;
  8804	
  8805		/*
  8806		 * BATCH and IDLE tasks do not preempt others.
  8807		 */
  8808		if (unlikely(!normal_policy(p->policy)))
  8809			return;
  8810	
  8811		cfs_rq = cfs_rq_of(se);
  8812		update_curr(cfs_rq);
  8813		/*
  8814		 * If @p has a shorter slice than current and @p is eligible, override
  8815		 * current's slice protection in order to allow preemption.
  8816		 *
  8817		 * Note that even if @p does not turn out to be the most eligible
  8818		 * task at this moment, current's slice protection will be lost.
  8819		 */
  8820		if (do_preempt_short(cfs_rq, pse, se) && se->vlag == se->deadline)
  8821			se->vlag = se->deadline + 1;
  8822	
  8823		/*
  8824		 * If @p has become the most eligible task, force preemption.
  8825		 */
  8826		if (pick_eevdf(cfs_rq) == pse)
  8827			goto preempt;
  8828	
  8829		return;
  8830	
  8831	preempt:
  8832		resched_curr(rq);
  8833	}
  8834	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
