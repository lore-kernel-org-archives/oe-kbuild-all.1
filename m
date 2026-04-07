Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED225377559
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534442; cv=none; b=G3Uq+RRx3MuAG29C0olCyKdfxR3bakUY8lsQAHGYEVh4xCB97WukwJSdz8GnKUgmmXMWQLP9GCP4TI7qgAQHbxGA7ZBO8jOVxP9FiV3H9D54aA2mRraaPk7fj6Hi/jlm+sE80ZXlKxxC4uWHdeXX0zBX0iq3ti8k09pkUgj06sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534442; c=relaxed/simple;
	bh=xHU4Hr2RHDxBdX48O1mYwE6bH4HCVFrNC+rdtmeFb/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bn82o7gM5KhX4uZTWf4C62v2JyxojRc1RRjw61l5A6R7O2cfCiBn9xajo1k1Y5Wx1ZcgVDWoyCi9oHXASh9smWYtz0vzP/FkOkSodiar3K74A4Sq8LcWxbFaxmUv/GgUF+0Iqs+5uXM4d1kkK9czY/SxmC23z9ilpHYl+cNU4hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAHyEV3b; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAHyEV3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534441; x=1807070441;
  h=date:from:to:cc:subject:message-id;
  bh=xHU4Hr2RHDxBdX48O1mYwE6bH4HCVFrNC+rdtmeFb/I=;
  b=VAHyEV3bpV474YHukNnVlYR9B3wV3G4M63LCMPOeHIK7QIc/cuZzFd6I
   GBI1nYc14VqPWqBO1l+3I3Gpis6YBKC+doI72zic7SymEm1awtU/jP2IA
   SYLE/Gyr4udZ7nWcHbrHVnmlt0+iJJz6Jdf/NCH/6g3kj3GNat2xw+8Bh
   P6pB8ng5To4WXilevv34eE0tZ1mqJ7W3QSkY8seoxVbs/cq5JPXOd0k3Y
   0j4Wlq99fGv+XtmOK9RMwQNsumC16CmhDuR5hQs9WwnhSjIopZFV2Pt+r
   +/Vjd+zmrg3KdsPq85KFGrDjy9B+AlVB3wuMmASD18Vcd814YrXHzqhTP
   w==;
X-CSE-ConnectionGUID: kNLAuK5JTdqrY10+Hxbhfg==
X-CSE-MsgGUID: i4OhA0BsTwOkJlL7+hFFJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86782264"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86782264"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:00:38 -0700
X-CSE-ConnectionGUID: sWj4hpNtQGadmodCtOctDQ==
X-CSE-MsgGUID: zYr+C7VuR9y3jkP6rL+/uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="224844909"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Apr 2026 21:00:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xc9-0000000007V-2kpC;
	Tue, 07 Apr 2026 04:00:33 +0000
Date: Tue, 07 Apr 2026 12:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/ext.c:6509:18: sparse: sparse: symbol
 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
Message-ID: <202604051832.E2GE9BJq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3aae9383f42f687221c011d7ee87529398e826b3
commit: a3f5d48222532484c1e85ef27cc6893803e4cd17 sched_ext: Allow scx_bpf_reenqueue_local() to be called from anywhere
date:   5 months ago
config: sparc-randconfig-r134-20260404 (https://download.01.org/0day-ci/archive/20260405/202604051832.E2GE9BJq-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051832.E2GE9BJq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a3f5d4822253 ("sched_ext: Allow scx_bpf_reenqueue_local() to be called from anywhere")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051832.E2GE9BJq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
