Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9678E4F3ECE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 18:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483972; cv=none; b=ifCHcG7z1YcNBAW/mMnIlxSSBSxQ4PSvZxUCrCvB/FsDOSIbm89RxSMiD3AFV9ZgW2UHLT3gnJxynddmLFvJnJozBl7nmGKPKCKnYrRwq4glmG1bL8JyBZwJoIx2R40QAj2LAKnZozwDZYDfc1qU+9VHH8+sTngaP7DSCHeTpco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483972; c=relaxed/simple;
	bh=OOMZ0fn5Z4F+nllN8whBsm0YFChxzFXmL6izgoKrrcA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WAZrWPA1E0Ma0wAAkeN5Ptne2OQMAqoJ22agSxuhCOwLyBuphzBhG6aMz6R5AltaY/Z/Co/Kql+xy52AuTUL2e0OR5MaZbleyThWId3P9X5TF0S36262xdhcq1u9d4fyostpTnLDvh6rTU0s9jhcasifo5Qh0aL9NvUu1trHv7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NcO/P7PY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NcO/P7PY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791483959; x=1823019959;
  h=date:from:to:cc:subject:message-id;
  bh=OOMZ0fn5Z4F+nllN8whBsm0YFChxzFXmL6izgoKrrcA=;
  b=NcO/P7PYwdDVrlLsrOTr/ToZhfxbs/uFmeD37nvh0Fn5GdDzgzPh+lHV
   34jfBoplKebIbu9iHeJVXZCoYzIe0rwOwvaKhYZ/eEBc7/1yyD9hoXphq
   yc3W2uhr2Epfwz7ktmf3gEFsZXmXkK1DzLWLVMD/UjF2lal8Xq3TWLmQ0
   Mf1LQaAWfHjABJXatjWtB+bp+pLszSUToFih8elS1fu3k0QBtvU6/H7N0
   QiQRlD1iCkgEviowkCImtxOKfrdy4Od+MdLs46TezLg5XvJBHrBFXHkoQ
   2IujxFgio5W+F+WrGxR2EVob1vVZU54+nS1Y3j3nqwx7fZIQNrvu0tewX
   g==;
X-CSE-ConnectionGUID: lmdBNBRlTOKcWW8voSXlZA==
X-CSE-MsgGUID: 9FUNrSFWTEimICJ+MiXvCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="288152"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="288152"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 11:25:58 -0700
X-CSE-ConnectionGUID: Uy36g+vUQ0yDrGNuSVVgvA==
X-CSE-MsgGUID: ZTS4XYwnRb+2s/7J//URZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="224865"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 08 Oct 2026 11:25:57 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEsoU-000000005rx-2O6N;
	Thu, 08 Oct 2026 18:25:54 +0000
Date: Thu, 08 Oct 2026 20:25:27 +0200
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:sub-cid-sched 24/26]
 kernel/sched/ext/sub.c:202:19: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202610082015.LeBnslKG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git sub-cid-sched
head:   ab70cc94c6e1d685d061217812c15d7502eead7f
commit: 4b45dca90f4195528bf70a893ee3ff76ed5579b0 [24/26] sched_ext: Add ops.sub_cid_sched_updated() to report the sched running on a cid
config: sparc-randconfig-r2300-20261006 (https://download.01.org/0day-ci/archive/20261008/202610082015.LeBnslKG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610082015.LeBnslKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610082015.LeBnslKG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/deadline.c:3584:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3584:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3584:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3637:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/ext.c:448:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:1517:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:1721:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:1721:15: sparse:    struct task_struct *
   kernel/sched/ext/ext.c:1721:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:2523:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:2537:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:3425:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:3755:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:4945:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:4946:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:7487:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:7488:51: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:7491:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:7492:51: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:9045:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:9091:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:9454:18: sparse: sparse: symbol 'scx_bpf_dsq_insert___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9476:18: sparse: sparse: symbol 'scx_bpf_dsq_insert' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9536:1: sparse: sparse: symbol '__scx_bpf_dsq_insert_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9555:18: sparse: sparse: symbol 'scx_bpf_dsq_insert_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9716:17: sparse: sparse: symbol 'scx_bpf_dispatch_nr_slots' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9736:18: sparse: sparse: symbol 'scx_bpf_dispatch_cancel' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9780:18: sparse: sparse: symbol 'scx_bpf_dsq_move_to_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9823:18: sparse: sparse: symbol 'scx_bpf_dsq_move_to_local' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9837:18: sparse: sparse: symbol 'scx_bpf_dsq_move_set_slice' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9856:18: sparse: sparse: symbol 'scx_bpf_dsq_move_set_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9890:18: sparse: sparse: symbol 'scx_bpf_dsq_move' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9915:18: sparse: sparse: symbol 'scx_bpf_dsq_move_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9956:17: sparse: sparse: symbol 'scx_bpf_reenqueue_local' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9995:17: sparse: sparse: symbol 'scx_bpf_create_dsq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10082:18: sparse: sparse: symbol 'scx_bpf_task_set_slice' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10138:18: sparse: sparse: symbol 'scx_bpf_task_set_dsq_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10275:18: sparse: sparse: symbol 'scx_bpf_kick_cpu' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10298:18: sparse: sparse: symbol 'scx_bpf_kick_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10325:17: sparse: sparse: symbol 'scx_bpf_dsq_nr_queued' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10372:18: sparse: sparse: symbol 'scx_bpf_destroy_dsq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10398:17: sparse: sparse: symbol 'bpf_iter_scx_dsq_new' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10442:32: sparse: sparse: symbol 'bpf_iter_scx_dsq_next' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10460:18: sparse: sparse: symbol 'bpf_iter_scx_dsq_destroy' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10489:32: sparse: sparse: symbol 'scx_bpf_dsq_peek' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10532:18: sparse: sparse: symbol 'scx_bpf_dsq_reenq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10572:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10665:18: sparse: sparse: symbol 'scx_bpf_exit_bstr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10690:18: sparse: sparse: symbol 'scx_bpf_error_bstr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10717:18: sparse: sparse: symbol 'scx_bpf_dump_bstr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10772:17: sparse: sparse: symbol 'scx_bpf_cpuperf_cap' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10792:17: sparse: sparse: symbol 'scx_bpf_cidperf_cap' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10823:17: sparse: sparse: symbol 'scx_bpf_cpuperf_cur' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10843:17: sparse: sparse: symbol 'scx_bpf_cidperf_cur' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10930:18: sparse: sparse: symbol 'scx_bpf_cpuperf_set' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10957:17: sparse: sparse: symbol 'scx_bpf_cidperf_set' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10984:17: sparse: sparse: symbol 'scx_bpf_nr_node_ids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10994:17: sparse: sparse: symbol 'scx_bpf_nr_cpu_ids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11004:17: sparse: sparse: symbol 'scx_bpf_nr_cids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11019:17: sparse: sparse: symbol 'scx_bpf_nr_online_cids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11037:24: sparse: sparse: symbol 'scx_bpf_online_cmask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11061:17: sparse: sparse: symbol 'scx_bpf_this_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11076:34: sparse: sparse: symbol 'scx_bpf_get_possible_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11084:34: sparse: sparse: symbol 'scx_bpf_get_online_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11093:18: sparse: sparse: symbol 'scx_bpf_put_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11121:17: sparse: sparse: symbol 'scx_bpf_task_cpu' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11134:17: sparse: sparse: symbol 'scx_bpf_task_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11154:23: sparse: sparse: symbol 'scx_bpf_locked_rq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11186:32: sparse: sparse: symbol 'scx_bpf_cpu_curr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11210:32: sparse: sparse: symbol 'scx_bpf_cid_curr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11235:32: sparse: sparse: symbol 'scx_bpf_tid_to_task' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11303:17: sparse: sparse: symbol 'scx_bpf_now' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11338:18: sparse: sparse: symbol 'scx_bpf_events' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/cid.c:492:18: sparse: sparse: symbol 'scx_bpf_cid_override' was not declared. Should it be static?
   kernel/sched/ext/cid.c:656:17: sparse: sparse: symbol 'scx_bpf_cid_to_cpu' was not declared. Should it be static?
   kernel/sched/ext/cid.c:701:17: sparse: sparse: symbol 'scx_bpf_cpu_to_cid' was not declared. Should it be static?
   kernel/sched/ext/cid.c:975:18: sparse: sparse: symbol 'scx_bpf_cid_topo' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/idle.c:1039:17: sparse: sparse: symbol 'scx_bpf_cpu_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1122:1: sparse: sparse: symbol '__scx_bpf_select_cpu_and' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1141:17: sparse: sparse: symbol 'scx_bpf_select_cpu_and' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1184:34: sparse: sparse: symbol 'scx_bpf_get_idle_cpumask_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1242:34: sparse: sparse: symbol 'scx_bpf_get_idle_smtmask_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1361:17: sparse: sparse: symbol 'scx_bpf_pick_idle_cpu_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1447:17: sparse: sparse: symbol 'scx_bpf_pick_any_cpu_node' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext/sub.c:202:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/sub.c:2438:17: sparse: sparse: symbol 'scx_bpf_sub_grant' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2558:18: sparse: sparse: symbol 'scx_bpf_sub_revoke' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2652:17: sparse: sparse: symbol 'scx_bpf_sub_caps' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2742:17: sparse: sparse: symbol 'scx_bpf_sub_kill_bstr' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1420:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1313:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct *
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2504:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2504:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2504:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2504:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2504:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2504:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2515:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2504:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2504:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2504:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2515:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1454:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1454:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1454:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2340:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2340:15: sparse:    struct task_struct *
   kernel/sched/deadline.c:2340:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2504:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2504:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2504:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2504:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2504:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2504:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2515:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2515:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2504:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2504:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2504:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2515:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2515:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2515:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2515:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2515:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2515:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2515:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2515:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2515:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1454:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1454:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1454:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1345:11: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1680:15: sparse: sparse: dereference of noderef expression

vim +202 kernel/sched/ext/sub.c

   174	
   175	/**
   176	 * scx_ops_cid_sched_updated_enable - Maintain rq->scx.sched if @sch has the op
   177	 * @sch: sched being enabled, its has_op filled in
   178	 *
   179	 * rq->scx.sched is maintained only while a loaded sched implements
   180	 * ops.sub_cid_sched_updated(), so that everyone else pays one static branch per
   181	 * session open or close. The first such sched turns the key on and then
   182	 * initializes every rq from the task running there, in that order so that no
   183	 * session change in between goes unrecorded. While the key is off every
   184	 * rq->scx.sched is NULL, see scx_ops_cid_sched_updated_disable().
   185	 */
   186	void scx_ops_cid_sched_updated_enable(struct scx_sched *sch)
   187	{
   188		s32 cpu;
   189	
   190		lockdep_assert_held(&scx_enable_mutex);
   191	
   192		if (!SCX_HAS_OP(sch, sub_cid_sched_updated) || scx_nr_ops_cid_sched_updated++)
   193			return;
   194	
   195		static_branch_enable(&__scx_ops_cid_sched_updated_enabled);
   196	
   197		for_each_possible_cpu(cpu) {
   198			struct rq *rq = cpu_rq(cpu);
   199			struct task_struct *p;
   200	
   201			guard(rq_lock_irqsave)(rq);
 > 202			p = rq->donor;
   203			if (p->sched_class == &ext_sched_class &&
   204			    (p->scx.flags & SCX_TASK_RUN_TRACKED))
   205				rq->scx.sched = scx_task_sched(p);
   206		}
   207	}
   208	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
