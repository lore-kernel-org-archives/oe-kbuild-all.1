Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F09D142E83
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 00:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781312321; cv=none; b=jxV99H/Hkt3y+8bvUDIK1d0ZW0VAXtR062pZsRTiPGgOvkPcj6X02qUjWw4kgCj+wRdw9tWarhNRT4S5Zk5v5cAi3AdSq+g7L7KhrA5getdmjrIljENTB8YkCUUwPpcsFHyHmDkFaSj7dIQwhpw6H/NzQsTNXX23vkUP22Kl2EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781312321; c=relaxed/simple;
	bh=pDWKsmcW/EMmP7XUeKd0z31OqOWyWlEnPvWq9IY4lt8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z1SmFO6JteKGAF+JllHvHuEpWcl+8GM+g3tgEcXRXCZMeDBWggmkglZOzbENBuoYh4i8FDhOea1qvgkhk4k2lj7mItNhZ8kUwUlW+06fH9Q1HbOtwcI2vwnXa2giG8gLsZzR0sKBCTQKAC76dexnBPmK4un7vEoKwU8iaSlwIk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dX8IuVp6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dX8IuVp6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781312320; x=1812848320;
  h=date:from:to:cc:subject:message-id;
  bh=pDWKsmcW/EMmP7XUeKd0z31OqOWyWlEnPvWq9IY4lt8=;
  b=dX8IuVp6txpLBqStB/2bWiJP4BkxZzUhaHFOgXBTbpO71fzfRily1Jtm
   XlVIjjKvI0xQ3ZPEynSbHcmW3Mnz9po4E43gbmDBv2rSNATwXAJ8K7tRo
   wQASQNcaMVjWGOa6P5ldX01WTcsrszbM2wuFk/QYH2/rYCLBvXMs1Jmv1
   rIzNWmk/j8U8HVIV/fjXrrvbRJSH3QNvQscL7HJ60l4LdfkoFrKWnQqFv
   3RvDxm5fVFxcc4RCLkGMdRye8pUB7TKDlRbtJABfGb0ISVQCMbaErCi1P
   T84XyhJLmNUaMN8WSk0md20P8nXa7aZkgMH/3RmZ3b/SoTm+f/jsTm2iJ
   A==;
X-CSE-ConnectionGUID: ALDRxNS3S+2tvZhZMB2Wxg==
X-CSE-MsgGUID: +phg4tcNQYehyCQha45CQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93263905"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="93263905"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 17:58:39 -0700
X-CSE-ConnectionGUID: zk5/t48nR7KYvcxs04GUOQ==
X-CSE-MsgGUID: 00W1iUsDQbC20vPTbHdJbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="247025130"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jun 2026 17:58:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYChm-00000000PYD-2auB;
	Sat, 13 Jun 2026 00:58:34 +0000
Date: Sat, 13 Jun 2026 08:57:52 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/ext.c:6509:18: sparse: sparse: symbol
 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
Message-ID: <202606130849.HHalyAqp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: a3f5d48222532484c1e85ef27cc6893803e4cd17 sched_ext: Allow scx_bpf_reenqueue_local() to be called from anywhere
date:   8 months ago
config: arm64-randconfig-r111-20260612 (https://download.01.org/0day-ci/archive/20260613/202606130849.HHalyAqp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6a8ad9d1b5c2efc07899796d41956761bd4247b8)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130849.HHalyAqp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a3f5d4822253 ("sched_ext: Allow scx_bpf_reenqueue_local() to be called from anywhere")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130849.HHalyAqp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext.c:2851:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2851:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2851:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2864:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2864:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2864:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2994:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2994:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2994:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3010:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3010:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3010:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3046:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:3046:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:3046:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:3078:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3078:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3078:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3107:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3107:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3107:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3120:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3120:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3120:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3169:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3169:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3169:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3188:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3188:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3188:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3206:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3206:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3206:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3222:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3222:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3222:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3239:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3239:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3239:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3919:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:3919:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext.c:3919:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext.c:3922:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:3922:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:3922:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:3922:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:3922:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:3922:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4203:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4203:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4203:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:4246:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4246:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4246:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:4357:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4357:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:4357:52: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:4434:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:4434:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext.c:4434:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext.c:4437:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4437:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4437:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4446:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4446:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4446:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:5141:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5141:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:5141:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5268:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5268:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5268:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:5595:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5595:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5595:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
>> kernel/sched/ext.c:6509:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext.c:6683:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:6683:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:6683:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext_idle.c:736:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext_idle.c:756:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:185:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:185:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:185:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2282:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2282:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2282:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2282:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2282:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2282:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2282:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2282:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1257:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1659:15: sparse: sparse: dereference of noderef expression

vim +/scx_bpf_reenqueue_local___v2 +6509 kernel/sched/ext.c

  6501	
  6502	/**
  6503	 * scx_bpf_reenqueue_local - Re-enqueue tasks on a local DSQ
  6504	 *
  6505	 * Iterate over all of the tasks currently enqueued on the local DSQ of the
  6506	 * caller's CPU, and re-enqueue them in the BPF scheduler. Can be called from
  6507	 * anywhere.
  6508	 */
> 6509	__bpf_kfunc void scx_bpf_reenqueue_local___v2(void)
  6510	{
  6511		struct rq *rq;
  6512	
  6513		guard(preempt)();
  6514	
  6515		rq = this_rq();
  6516		local_set(&rq->scx.reenq_local_deferred, 1);
  6517		schedule_deferred(rq);
  6518	}
  6519	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
