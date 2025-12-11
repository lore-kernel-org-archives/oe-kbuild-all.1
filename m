Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3DA2F6597
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765447034; cv=none; b=JpkDi1W9eM+E2Gs6syZ7kp3bthf5axoxfxx1BTtpklwKDlUL/RcqJJxOFPo5zz4Wizc9gXreuwLv51XYNB9GeS/Se2xhVqrjYnu5O06PqPILHMFxwyQyzRqGAsi3L/qBV67Mm6XAiLzUGTYJTYs+7pErnkAC3FdbNnkslTeGSF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765447034; c=relaxed/simple;
	bh=Tjedht1ai/4ZbzBpK5nEpLKWTxLEbGMMb2iPj6Tnum4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBIEJ7t9DcSs6Exa4kz6zo2co22XOMReK+AQrgXeJbhdfxClkEEAmz46h5N3xMsHlbNspDykQtwKT/zj0qe/AZqRK+X61wh5tE7Y0fTLili4BjJ1qOMLg7yugrhSCJRfjbREfdcrnmSiHtztIXI8W+yev8qZ6wKk/AqDW3e1Mb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0zkOxr2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0zkOxr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765447032; x=1796983032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tjedht1ai/4ZbzBpK5nEpLKWTxLEbGMMb2iPj6Tnum4=;
  b=h0zkOxr2shcxIfOxjMOLYhOr6X6ulAP4hav5hb6crS8brl3WptxZE/ai
   OfSmCv3JFBAvhTw0cs6NsYBGu3+DPmJ27NB4UDlLgLql2UVs8MjR1gtlz
   b/3CWEFS2uAEaZ9Kp/m5igEk5InAvAM4+okLhE2aN+bxotApAhsJRGOjn
   kvELxkGO3AL0PIvGejtBbdYcBq6zv03eLg5d3xugWIxPgHvoQLqK2ei/p
   215vGS2CKB+xCy3jiPv1TKk5Lz1iQ1+xafYl3k3q8I8S4kjKv8fziPTFP
   fTojCBQ3my+L9gNbOOZKUPNnN93UCUsx3fIP6iMvdq9YbveuM9uGpl947
   w==;
X-CSE-ConnectionGUID: 2F1HH2avTJa4mF7F1a3Gkg==
X-CSE-MsgGUID: S+wz/b+zQ6KwSIcfdKWl7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67312204"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67312204"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 01:56:54 -0800
X-CSE-ConnectionGUID: 6gd+SaFsQB2HO+7/4ZuNYQ==
X-CSE-MsgGUID: H+3Pwu8XRA+YiaExKGvrlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201851975"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Dec 2025 01:56:53 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTdPm-000000004Tx-16Ga;
	Thu, 11 Dec 2025 09:56:50 +0000
Date: Thu, 11 Dec 2025 17:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: Yuri Andriaccio <yurand2000@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 13/28] sched/rt: Update task event callbacks for
 HCBS scheduling
Message-ID: <202512111740.ecCVSekQ-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18]
[cannot apply to tip/sched/core tip/master peterz-queue/sched/core tip/auto-latest next-20251211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuri-Andriaccio/sched-deadline-Distinct-between-dl_rq-and-my_q/20251201-214223
base:   linus/master
patch link:    https://lore.kernel.org/r/20251201124205.11169-14-yurand2000%40gmail.com
patch subject: [RFC PATCH v4 13/28] sched/rt: Update task event callbacks for HCBS scheduling
config: x86_64-randconfig-122-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111740.ecCVSekQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111740.ecCVSekQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111740.ecCVSekQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1679:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1679:25: sparse:    struct task_struct *
   kernel/sched/rt.c:1679:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:450:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:450:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:450:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:839:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:839:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:839:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1191:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1191:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1191:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:858:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:858:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:858:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:859:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:859:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:859:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:920:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:920:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:920:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:962:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:962:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:962:39: sparse:     got struct task_struct [noderef] __rcu *donor
>> kernel/sched/rt.c:988:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_rt_entity *rt_se @@     got struct sched_rt_entity [noderef] __rcu * @@
   kernel/sched/rt.c:988:40: sparse:     expected struct sched_rt_entity *rt_se
   kernel/sched/rt.c:988:40: sparse:     got struct sched_rt_entity [noderef] __rcu *
   kernel/sched/rt.c:989:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_rt_entity *rt_se @@     got struct sched_rt_entity [noderef] __rcu * @@
   kernel/sched/rt.c:989:57: sparse:     expected struct sched_rt_entity *rt_se
   kernel/sched/rt.c:989:57: sparse:     got struct sched_rt_entity [noderef] __rcu *
   kernel/sched/rt.c:990:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:990:39: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:990:39: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/rt.c:991:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_dl_entity *[assigned] curr_dl_se @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/rt.c:991:28: sparse:     expected struct sched_dl_entity *[assigned] curr_dl_se
   kernel/sched/rt.c:991:28: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/rt.c:1032:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1032:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1032:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1359:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1359:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:1359:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1382:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1382:13: sparse:    struct task_struct *
   kernel/sched/rt.c:1382:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1730:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1730:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1730:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1732:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1732:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1732:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1732:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1732:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1732:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1860:63: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_rt_entity *rt_se @@     got struct sched_rt_entity [noderef] __rcu * @@
   kernel/sched/rt.c:1860:63: sparse:     expected struct sched_rt_entity *rt_se
   kernel/sched/rt.c:1860:63: sparse:     got struct sched_rt_entity [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2701:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2701:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2701:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2711:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2711:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2711:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2817:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2817:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2817:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2319:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2319:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2319:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2329:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2329:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2329:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1241:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1241:32: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1241:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1241:71: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1241:71: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1241:71: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1339:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1339:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1339:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1604:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1604:24: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1604:24: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1604:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1604:63: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1604:63: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1719:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1719:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1719:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2537:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2537:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2537:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2205:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2205:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2205:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2206:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2206:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2206:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2281:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2281:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2281:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2862:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2862:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2862:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2864:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2864:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2864:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2866:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2866:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2866:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3060:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3060:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3060:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3106:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/syscalls.c:251:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:251:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:251:48: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2297:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2297:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2297:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2297:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2297:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2297:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2308:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2308:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2308:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2297:25: sparse: sparse: incompatible types in comparison expression (different address spaces):

vim +988 kernel/sched/rt.c

   956	
   957	/*
   958	 * Preempt the current task with a newly woken task if needed:
   959	 */
   960	static void wakeup_preempt_rt(struct rq *rq, struct task_struct *p, int flags)
   961	{
   962		struct task_struct *donor = rq->donor;
   963		struct sched_dl_entity *woken_dl_se = NULL;
   964		struct sched_dl_entity *curr_dl_se = NULL;
   965	
   966		if (!rt_group_sched_enabled())
   967			goto no_group_sched;
   968	
   969		/*
   970		 * Preemption checks are different if the waking task and the current task
   971		 * are running on the global runqueue or in a cgroup. The following rules
   972		 * apply:
   973		 *   - dl-tasks (and equally dl_servers) always preempt FIFO/RR tasks.
   974		 *     - if curr is a FIFO/RR task inside a cgroup (i.e. run by a
   975		 *       dl_server), or curr is a DEADLINE task and waking is a FIFO/RR task
   976		 *       on the root cgroup, do nothing.
   977		 *     - if waking is inside a cgroup but curr is a FIFO/RR task in the root
   978		 *       cgroup, always reschedule.
   979		 *   - if they are both on the global runqueue, run the standard code.
   980		 *   - if they are both in the same cgroup, check for tasks priorities.
   981		 *   - if they are both in a cgroup, but not the same one, check whether the
   982		 *     woken task's dl_server preempts the current's dl_server.
   983		 *   - if curr is a DEADLINE task and waking is in a cgroup, check whether
   984		 *     the woken task's server preempts curr.
   985		 */
   986		if (is_dl_group(rt_rq_of_se(&p->rt)))
   987			woken_dl_se = dl_group_of(rt_rq_of_se(&p->rt));
 > 988		if (is_dl_group(rt_rq_of_se(&rq->curr->rt)))
   989			curr_dl_se = dl_group_of(rt_rq_of_se(&rq->curr->rt));
   990		else if (task_has_dl_policy(rq->curr))
 > 991			curr_dl_se = &rq->curr->dl;
   992	
   993		if (woken_dl_se != NULL && curr_dl_se != NULL) {
   994			if (woken_dl_se == curr_dl_se) {
   995				if (p->prio < rq->curr->prio)
   996					resched_curr(rq);
   997	
   998				return;
   999			}
  1000	
  1001			if (dl_entity_preempt(woken_dl_se, curr_dl_se))
  1002				resched_curr(rq);
  1003	
  1004			return;
  1005	
  1006		} else if (woken_dl_se != NULL) {
  1007			resched_curr(rq);
  1008			return;
  1009	
  1010		} else if (curr_dl_se != NULL) {
  1011			return;
  1012		}
  1013	
  1014	no_group_sched:
  1015		if (p->prio < donor->prio) {
  1016			resched_curr(rq);
  1017			return;
  1018		}
  1019	
  1020		/*
  1021		 * If:
  1022		 *
  1023		 * - the newly woken task is of equal priority to the current task
  1024		 * - the newly woken task is non-migratable while current is migratable
  1025		 * - current will be preempted on the next reschedule
  1026		 *
  1027		 * we should check to see if current can readily move to a different
  1028		 * cpu.  If so, we will reschedule to allow the push logic to try
  1029		 * to move current somewhere else, making room for our non-migratable
  1030		 * task.
  1031		 */
  1032		if (p->prio == donor->prio && !test_tsk_need_resched(rq->curr))
  1033			check_preempt_equal_prio(rq, p);
  1034	}
  1035	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
