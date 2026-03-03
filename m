Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1484B397686
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 19:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772566547; cv=none; b=bhtMPCMs0vPYaCqnZjpPFOYeaTY6I4kEWXs8Cuip8BRpAbnJXanplKGQYAuI/jpEuC24qIbvK7J5SBrgoDeaNE+akCPK+Iz5ubuqqTi+3zyZo4FeCPcLgHXNZDRxifOzEeWebdm7GoxoKFVLHzaVlOzCOka3Bx8b3B8QJ4MCK7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772566547; c=relaxed/simple;
	bh=rlYHjov3XNF7n2LKMNAZfVade/2Jz7CFF+T1UgiP4tk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lTfn5lwzx9HAm6HZbMniOZvICy/pKfzkwzV8W7yTX+RzWQx3deUX0HM3KxnthGUeddr+C7kZNTlBctvnpq/6fckut6qBjp6CQwumccTaU0wQ2mVdKYKwptn6Dw4rr52lDanI+/2aNfJVFs9a++CJK7+oqmFttExyN+GhpC9nYIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ha8C5Fs9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ha8C5Fs9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772566546; x=1804102546;
  h=date:from:to:cc:subject:message-id;
  bh=rlYHjov3XNF7n2LKMNAZfVade/2Jz7CFF+T1UgiP4tk=;
  b=ha8C5Fs96+8VhbXCSDlP85lpzqkPPTgYwRGYwpP/czrmJKcd7MixpU7B
   aq66EBgzEvfI1Midl92xwrS4/c41NRNesr9JgsbAGXg7HZqltT3gd3XXA
   m1o4X/KQ/ku8bCDuESSv7knLlXy01fVUCasxiJU4mRN68xX63PhwEejvh
   a+L9xA9UQWh2y4AAM5rks47S0OsP+CRHhQxhhRwlEtZG1SXDjbIs5MURi
   GIn2gDf4yZtG/6lO2OMK9qZQEil3CLkNdHyU3cJH1fhN+KwRf6rFErf8e
   kbfPIiL0NULlxTqta5Oo4e/7BCvTTd93ceHab+jdN9lJAtcLVeZ9jn4ls
   g==;
X-CSE-ConnectionGUID: dV9cc1F0S9mfk7u9BHX9Ww==
X-CSE-MsgGUID: M5xB3ODWTcylLy2ZeR0+PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73667317"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="73667317"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 11:35:45 -0800
X-CSE-ConnectionGUID: 07IhXq9nTYemWvDxtbU+yA==
X-CSE-MsgGUID: qunlJegFRTiAczZz5fyHSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="217264706"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Mar 2026 11:35:43 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxVWu-000000002kn-2Oba;
	Tue, 03 Mar 2026 19:35:40 +0000
Date: Wed, 04 Mar 2026 03:35:20 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/ext.c:6509:18: sparse: sparse: symbol
 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
Message-ID: <202603040332.o3BbPAat-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
commit: a3f5d48222532484c1e85ef27cc6893803e4cd17 sched_ext: Allow scx_bpf_reenqueue_local() to be called from anywhere
date:   4 months ago
config: sparc-randconfig-r122-20260302 (https://download.01.org/0day-ci/archive/20260304/202603040332.o3BbPAat-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603040332.o3BbPAat-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603040332.o3BbPAat-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext.c:1527:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1527:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1528:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1528:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:1528:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2082:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2082:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2082:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2225:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2225:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2225:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2281:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2281:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2281:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2322:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2322:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2322:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2376:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2376:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:2376:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2469:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2469:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2469:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2489:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2489:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2489:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2550:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2550:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2550:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2569:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2569:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2569:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2691:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2691:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2691:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2770:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2770:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2770:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2823:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2823:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2823:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
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
   kernel/sched/ext.c:4246:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4357:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4434:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:4437:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4437:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4437:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4446:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4446:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4446:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:5141:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5268:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5595:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
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
   kernel/sched/syscalls.c:230:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:230:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:230:48: sparse:    struct task_struct *
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
