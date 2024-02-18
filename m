Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7590F15C0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 02:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708225195; cv=none; b=GZcG8YktBS943Ys18ulSC99Y4IKfApPshfrNq5ZcyzsDJ1l5z4wj9qkCSQscncbol342Z6g8foDOVk/E0kxJQ4iT3mzLD2v0tW9ef6NEYB+xz6TgBn2OObhYZswTeXJeSmCNzybdxAfPjpAocOwvdQCwT67eSxNkdPFuc33xe6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708225195; c=relaxed/simple;
	bh=/903zrsexZk/ZwXa6fb4VzYbOD8rDEKC5pmyXlB1C0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q3YK1uCTWDZ3lEYqADTo4kCKOan28ivXml8HG8Bb5CBC0sZDuOW8WhU4V114tHhkLHsHwH79o0Q9FdE7YCfdAHtFtwqFsSGV0UDIUmW6qWfFRZe4Y+NjCo4Aj5PNXRxowpI4bdodqN9YB3D0DpyxygekfTKmRx/pqW2JcPSD8SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Br6xaqLB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Br6xaqLB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708225194; x=1739761194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/903zrsexZk/ZwXa6fb4VzYbOD8rDEKC5pmyXlB1C0E=;
  b=Br6xaqLBmgiCMyONT/sIRtjiQpErNhb5+o95ggOM7pnTNpPPcqXjMW0r
   T+H/tFscaTTyo5iRdjpP5OB1WVcdrGVVdDfHevhyU9ipODujvj5CiEoMJ
   kavnqZdgCLOQELZjVjQIrdLxjYrmbHmqtoyt9rNqlC0lSLDUBLp7ZtQun
   ADtwuvOC64rT2eVpmoFiZSQvPKlAOOaxqtJdIC7BloqsuLetevSaD7nGJ
   RLlNzQ8owOMOtfGHe29+StBxVzlLufKSWPxN7z7+jaCHPpIHskrfx1bhp
   ChakC6NwsMDlJW8bie+PRAiCkn9ck2PuGmrwkEHcTSGxFkk6n8bAZqMsN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="19748576"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="19748576"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 18:59:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="8853889"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 17 Feb 2024 18:59:51 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbXOm-0002jE-1k;
	Sun, 18 Feb 2024 02:59:36 +0000
Date: Sun, 18 Feb 2024 10:58:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 16/60] kernel/sched/fair_eevdf.c:869:38:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202402181006.8QTMKRBm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   9af710afc434138601a0fe61195e4b193ca6a931
commit: e865e3abb45cea830f107c69a227ed07b28c0b43 [16/60] CHROMIUM: sched/eevdf: Adding fair_eevdf.c
config: x86_64-randconfig-123-20240218 (https://download.01.org/0day-ci/archive/20240218/202402181006.8QTMKRBm-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402181006.8QTMKRBm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402181006.8QTMKRBm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/fair_eevdf.c:869:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:869:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:869:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/fair_eevdf.c:905:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair_eevdf.c:905:34: sparse:     expected struct sched_entity *se
   kernel/sched/fair_eevdf.c:905:34: sparse:     got struct sched_entity [noderef] __rcu *
>> kernel/sched/fair_eevdf.c:11417:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:11417:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:11417:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:5765:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:5765:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:5765:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/fair_eevdf.c:6025:1: sparse: sparse: symbol '__pcpu_scope_load_balance_mask' was not declared. Should it be static?
>> kernel/sched/fair_eevdf.c:6026:1: sparse: sparse: symbol '__pcpu_scope_select_idle_mask' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:7081:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:7081:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:7081:20: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair_eevdf.c:7262:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:7262:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair_eevdf.c:7262:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:7452:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:7452:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:7452:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:7750:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:7750:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:7750:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/fair_eevdf.c:8801:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair_eevdf.c:8801:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair_eevdf.c:8801:40: sparse:     got struct sched_domain [noderef] __rcu *child
>> kernel/sched/fair_eevdf.c:9343:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair_eevdf.c:9343:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair_eevdf.c:9343:22: sparse:    struct task_struct *
   kernel/sched/fair_eevdf.c:10706:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:10706:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:10706:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair_eevdf.c:10364:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:10364:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair_eevdf.c:10364:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:10802:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:10802:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:10802:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair_eevdf.c:5694:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair_eevdf.c: note: in included file:
   kernel/sched/sched.h:2064:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2229:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2064:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2064:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct *

vim +869 kernel/sched/fair_eevdf.c

   863	
   864	/*
   865	 * Used by other classes to account runtime.
   866	 */
   867	s64 update_curr_common(struct rq *rq)
   868	{
 > 869		struct task_struct *curr = rq->curr;
   870		s64 delta_exec;
   871	
   872		delta_exec = update_curr_se(rq, &curr->se);
   873		if (likely(delta_exec > 0))
   874			update_curr_task(curr, delta_exec);
   875	
   876		return delta_exec;
   877	}
   878	
   879	/*
   880	 * Update the current task's runtime statistics.
   881	 */
   882	static void update_curr(struct cfs_rq *cfs_rq)
   883	{
   884		struct sched_entity *curr = cfs_rq->curr;
   885		s64 delta_exec;
   886	
   887		if (unlikely(!curr))
   888			return;
   889	
   890		delta_exec = update_curr_se(rq_of(cfs_rq), curr);
   891		if (unlikely(delta_exec <= 0))
   892			return;
   893	
   894		curr->vruntime += calc_delta_fair(delta_exec, curr);
   895		update_min_vruntime(cfs_rq);
   896	
   897		if (entity_is_task(curr))
   898			update_curr_task(task_of(curr), delta_exec);
   899	
   900		account_cfs_rq_runtime(cfs_rq, delta_exec);
   901	}
   902	
   903	static void update_curr_fair(struct rq *rq)
   904	{
 > 905		update_curr(cfs_rq_of(&rq->curr->se));
   906	}
   907	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
