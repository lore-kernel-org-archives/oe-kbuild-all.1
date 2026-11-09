Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216300;
	b=EfyWBF7BVnhBK1qhX/fdU6YvLdEHUyEueTxEZ6RP3T1u/gByzPdzpvBOy5nLmQMluPEO
	 4aeqNa72PHjnfmPyRx0b39UEFniIQvdbBxAuU64+Q3bInjotVa22dVXuCO7KUNgMcHnZD
	 ifQ3oNjy23wd0su3e8BVThjRmgdusvw1pX55dNpML9cKBKSyJosapxF0U05J4vvPBeTG5
	 Zg+kJVFTTSjlKVRfa+FFid86tI7uYAbFU17tGGtfEsdPC/NjZnbgAe0RdF9CZaxDl0bR/
	 /ojfIxbUExTPutI3tQSLErKCTl68dRvjPXq0QQOxZoiNfFxzXnqesqW+Hurxev29Qag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216300;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2xmQlRidnxjXoJT7tatyxljDEYI5yzB+d+GPCz5ijRw=;
	b=sdY5KyyIzlqhEOFN9/IDl0e/j/Ar8fgdXBALMX7slPyqI85g4kt7cbcslvVVLeMw3Sd5
	 r0J4E53XWhFXr7X7tsuYi8lBhKTE3O9x/3qv9YjnDmPLXFf8TmHYvMP9X7hk+kVdLLzZ9
	 UUsNMAdXeG/BDGZGKgvFdYcEmiAAJRbuwNCpq2PrXzF8Gb5i25aENHn+5R/UVAYT2M7VL
	 BI5gxiNlUEDgctapfc/Fg8Om0SXS9Cn6FSCBXTQhAPCZQ74FwRtQRdBRYXRoVsqDnTTN6
	 DQz4Kfe7YsoGsJh3E86+ox6JnnIEEvv9W/ty/D4twgq1gty0+ci/V3nqCyiQiZUdWSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DkXV1SoW;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10961606D82D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 09:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10961606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DkXV1SoW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794216299; x=1825752299;
  h=date:from:to:cc:subject:message-id;
  bh=/8NSbN/zPefMBkG6hiOv6QZ9baF2dnttaG9vihD4gfM=;
  b=DkXV1SoWSE20GIXpRMRCahalpviSP2+mHCSInlHnnLTZW8CMZ6x2F2yl
   G3/+29PCJ2GhmkDgMjYJ+vRqfJUEZdKiC0MjxRV+7FstD8zamTvE6UQJQ
   7xAYWPUXWrcOf+xp6BJzp5zY6PTKVlLJIL9neAYoHMrrWhcWBc+ewGl3P
   TuIMCG7CfhgsY3vF5td1Mjx3pDOPmso42Z5eapBtWedB1fij7TReOD9oe
   f3VpPUjtGWfphunfBFCxiLJZo5LRxejr3NDcTn78ZWt1xqHdXxvdx3FQZ
   8wUiZJOPQgtM6Lo/3yeTMdHl8noJDK0NizRZScq2loCaXsPvGl3dWyYIQ
   g==;
X-CSE-ConnectionGUID: AzQnpvTXRN+gYd3p1A3cqw==
X-CSE-MsgGUID: 7+UCX07SR1GeSdYdN2oUFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2830523"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2830523"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 01:24:57 -0800
X-CSE-ConnectionGUID: 4U4sAbMVRcKiYXQwEsTBYQ==
X-CSE-MsgGUID: LX2YbKr6ScG27u4nX2nbEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7699385"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 Nov 2026 01:24:56 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQLcR-000000000Hz-3e7r;
	Mon, 09 Nov 2026 09:24:51 +0000
Date: Mon, 09 Nov 2026 10:24:00 +0100
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Andrea Righi <arighi@nvidia.com>
Subject: [tj-sched-ext:for-next 5/17]
 kernel/sched/ext/inlines.h:44:66: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202611091033.nhKyExPa-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git for-next
head:   5372f91e6ac4d064ddd4eda4c93e0d528506fb1f
commit: 9ce6fca02867911ba79bc3664219effe8c7be8f4 [5/17] sched_ext: Fix stale pick when the donor changes during dispatch
config: arm-randconfig-r2305-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091033.nhKyExPa-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091033.nhKyExPa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091033.nhKyExPa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext/ext.c:11734:17: sparse: sparse: symbol 'scx_bpf_this_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11749:34: sparse: sparse: symbol 'scx_bpf_get_possible_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11757:34: sparse: sparse: symbol 'scx_bpf_get_online_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11766:18: sparse: sparse: symbol 'scx_bpf_put_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11794:17: sparse: sparse: symbol 'scx_bpf_task_cpu' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11807:17: sparse: sparse: symbol 'scx_bpf_task_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11827:23: sparse: sparse: symbol 'scx_bpf_locked_rq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11859:32: sparse: sparse: symbol 'scx_bpf_cpu_curr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11883:32: sparse: sparse: symbol 'scx_bpf_cid_curr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11908:32: sparse: sparse: symbol 'scx_bpf_tid_to_task' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11976:17: sparse: sparse: symbol 'scx_bpf_now' was not declared. Should it be static?
   kernel/sched/ext/ext.c:12011:18: sparse: sparse: symbol 'scx_bpf_events' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/cid.c:498:18: sparse: sparse: symbol 'scx_bpf_cid_override' was not declared. Should it be static?
   kernel/sched/ext/cid.c:662:17: sparse: sparse: symbol 'scx_bpf_cid_to_cpu' was not declared. Should it be static?
   kernel/sched/ext/cid.c:707:17: sparse: sparse: symbol 'scx_bpf_cpu_to_cid' was not declared. Should it be static?
   kernel/sched/ext/cid.c:981:18: sparse: sparse: symbol 'scx_bpf_cid_topo' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/idle.c:1067:17: sparse: sparse: symbol 'scx_bpf_cpu_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1150:1: sparse: sparse: symbol '__scx_bpf_select_cpu_and' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1169:17: sparse: sparse: symbol 'scx_bpf_select_cpu_and' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1212:34: sparse: sparse: symbol 'scx_bpf_get_idle_cpumask_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1270:34: sparse: sparse: symbol 'scx_bpf_get_idle_smtmask_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1389:17: sparse: sparse: symbol 'scx_bpf_pick_idle_cpu_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1475:17: sparse: sparse: symbol 'scx_bpf_pick_any_cpu_node' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/sub.c:229:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/sub.c:2861:17: sparse: sparse: symbol 'scx_bpf_sub_grant' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2992:18: sparse: sparse: symbol 'scx_bpf_sub_revoke' was not declared. Should it be static?
   kernel/sched/ext/sub.c:3086:17: sparse: sparse: symbol 'scx_bpf_sub_caps' was not declared. Should it be static?
   kernel/sched/ext/sub.c:3176:17: sparse: sparse: symbol 'scx_bpf_sub_kill_bstr' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1420:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1313:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct *
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2520:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2520:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2520:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2520:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2520:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2520:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2531:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2520:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2520:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2520:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2531:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1469:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1469:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1469:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2340:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2340:15: sparse:    struct task_struct *
   kernel/sched/deadline.c:2340:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2520:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2520:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2520:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2520:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2520:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2520:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2531:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2531:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2520:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2520:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2520:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2531:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2531:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2531:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2531:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext/inlines.h:44:66: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/inlines.h:44:66: sparse:    struct task_struct *
   kernel/sched/ext/inlines.h:44:66: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/ext/inlines.h:44:66: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/inlines.h:44:66: sparse:    struct task_struct *
   kernel/sched/ext/inlines.h:44:66: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/ext/inlines.h:44:66: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/inlines.h:44:66: sparse:    struct task_struct *
   kernel/sched/ext/inlines.h:44:66: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/ext/inlines.h:44:66: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/inlines.h:44:66: sparse:    struct task_struct *
   kernel/sched/ext/inlines.h:44:66: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2531:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2531:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2531:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2531:26: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext/inlines.h:44:66: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/inlines.h:44:66: sparse:    struct task_struct *
   kernel/sched/ext/inlines.h:44:66: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/ext/inlines.h:44:66: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/inlines.h:44:66: sparse:    struct task_struct *
   kernel/sched/ext/inlines.h:44:66: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:1469:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1469:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1469:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1345:11: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1680:15: sparse: sparse: dereference of noderef expression

vim +44 kernel/sched/ext/inlines.h

    23	
    24	/**
    25	 * scx_dsp_prev_stale - Test whether dispatch's @prev went stale
    26	 * @rq: rq being dispatched for
    27	 * @prev: @rq's donor when dispatch started
    28	 *
    29	 * @prev can stop being @rq's donor while dispatch has the rq lock dropped. With
    30	 * proxy execution, @prev may not be the running task, and another CPU can reset
    31	 * the donor to rq->curr. With core scheduling, the core pick runs dispatch for
    32	 * the sibling rqs too, and a sibling can switch @prev out. Dispatch restarts
    33	 * the pick when that happened and doesn't hand the old donor to the BPF
    34	 * scheduler.
    35	 *
    36	 * With proxy execution alone, the donor only ever changes to rq->curr during a
    37	 * pick. Only __schedule() on this CPU sets a different donor, after the pick,
    38	 * so the restarted pick takes rq->curr as @prev and can't go stale again. Under
    39	 * core scheduling, the restart goes through the core pick, which already
    40	 * retries whenever dispatch dropped the lock.
    41	 */
    42	static inline bool scx_dsp_prev_stale(struct rq *rq, struct task_struct *prev)
    43	{
  > 44		return (sched_proxy_exec() || sched_core_enabled(rq)) && unlikely(prev != rq->donor);
    45	}
    46	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
