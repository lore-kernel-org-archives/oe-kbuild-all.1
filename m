Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A3B24BD02
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 09:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130386; cv=none; b=VjvxGW/1Fgynb/s3ThZSkMWJ6WRO1ygj/DjXSlhld392DUw+LJlxzfBChuP6akNLVXWgpfN6BEgjqEP92VHQkkohD9UMTuGIm7jfJvVl2GrghoK2KfYcTpPK5OryGTtfe5Ht9YMvHGQvd2m3DLgerwxm5GaT8LFiT+E3OgENf0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130386; c=relaxed/simple;
	bh=9pxyBYvK+fT6YL41mqFbNyaLmHzuT/Tbv0vojSrVtO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YbGYLiq+mS5+UMu1QGOZttYA5daeJdsYzrblQ8I8xhxU9DvjqL0YZ91ZMRTnRgUARI8+n6KTecbmD4wCtPEO55ohkvaAow2n9sB2bltZbiQHxM0mDfR57tS884cG5B0GNmhcOotD5uHy1RyKFpBJYQDqm2hBZ0W8d8faFBHwqwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ap6Qm3yd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ap6Qm3yd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747130384; x=1778666384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9pxyBYvK+fT6YL41mqFbNyaLmHzuT/Tbv0vojSrVtO0=;
  b=ap6Qm3ydFyOVigDgma7J59DQMInpjt/Ot4t36BbnrhOalkocHCs6U/6m
   4jG7Z5m92bMw9xJQ5i9C2iavNLsVLKIRfUphbJh/tNHdpQzEzuynbtXqU
   m5NKcvLTLbNFTrleWL+4XJTI6uchnhNXf4ZW/zBxCv/baCRY8GAvq1M3n
   dFmDf2u9+dmY4nHTHFUXQka66oVFsyvaQCdX1Iq8i2pA11vYw2SLEU9ls
   PcdETMdygVTTwQam5dBQNB52XicwEQUEMCCEwb7aowP2w+x9ZIXPasbRR
   DoANEK4lp9sbynP9HJdGV17/jcXXWwmCJclqr05KseDEkghgmmdKKfRE1
   A==;
X-CSE-ConnectionGUID: 0WIBDrwASyiTKKgQDoXkIQ==
X-CSE-MsgGUID: 6zeaBZlOSwKsoMtpfD2ypQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59198133"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="59198133"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 02:59:43 -0700
X-CSE-ConnectionGUID: 8RhEaoNwRYKVPB2tv87mJQ==
X-CSE-MsgGUID: jN5g0wDhSXii1F6bXWJAiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="168760146"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 May 2025 02:59:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEmQF-000FxZ-38;
	Tue, 13 May 2025 09:59:39 +0000
Date: Tue, 13 May 2025 17:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2220/2220] kernel/sched/core.c:11374:5: sparse:
 sparse: symbol 'tg_set_dynamic_affinity_mode' was not declared. Should it be
 static?
Message-ID: <202505131750.XmCe9Vhu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8c683c781fbd8981b1fabf54cf6eec18190cebdf
commit: 6eb07f9925a906d81f328c808ba25f7800888dce [2220/2220] sched: Introduce smart grid scheduling strategy for cfs
config: x86_64-randconfig-123-20250513 (https://download.01.org/0day-ci/archive/20250513/202505131750.XmCe9Vhu-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131750.XmCe9Vhu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131750.XmCe9Vhu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:797:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:797:48: sparse:     expected struct task_struct *p
   kernel/sched/core.c:797:48: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1044:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1044:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1044:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1103:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:1103:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:1103:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:2233:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2233:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:2233:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2233:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2233:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2233:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3747:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3747:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3747:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3955:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3955:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3955:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:9512:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:9512:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:9512:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5683:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5683:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5683:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6628:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6628:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6628:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7153:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7153:17: sparse:    struct task_struct *
   kernel/sched/core.c:7153:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7369:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7369:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7369:22: sparse:    struct task_struct *
>> kernel/sched/core.c:11374:5: sparse: sparse: symbol 'tg_set_dynamic_affinity_mode' was not declared. Should it be static?
>> kernel/sched/core.c:11415:5: sparse: sparse: symbol 'tg_set_affinity_period' was not declared. Should it be static?
>> kernel/sched/core.c:11429:5: sparse: sparse: symbol 'tg_get_affinity_period' was not declared. Should it be static?
   kernel/sched/core.c:12118:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:12118:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:12118:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:551:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:584:23: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:600:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1717:9: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1717:9: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:97:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:97:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:97:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:797:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:1087:5: sparse: sparse: context imbalance in 'get_nohz_timer_target' - wrong count at exit
   kernel/sched/core.c:1482:13: sparse: sparse: context imbalance in 'uclamp_update_util_min_rt_default' - wrong count at exit
   kernel/sched/core.c:2224:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2225:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2226:18: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2286:15: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2244:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2408:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct *
   kernel/sched/core.c:2199:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2199:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2199:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2244:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2408:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2408:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2244:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2408:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2244:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2408:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2244:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2408:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2244:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2408:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2244:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2408:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct *

vim +/tg_set_dynamic_affinity_mode +11374 kernel/sched/core.c

 11372	
 11373	#ifdef CONFIG_QOS_SCHED_SMART_GRID
 11374	int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
 11375	{
 11376		struct auto_affinity *auto_affi = tg->auto_affinity;
 11377	
 11378		if (unlikely(!auto_affi))
 11379			return -EPERM;
 11380	
 11381		/* auto mode */
 11382		if (mode == 1)
 11383			start_auto_affinity(auto_affi);
 11384		else if (mode == 0)
 11385			stop_auto_affinity(auto_affi);
 11386		else
 11387			return -EINVAL;
 11388	
 11389		return 0;
 11390	}
 11391	
 11392	static u64 cpu_affinity_mode_read_u64(struct cgroup_subsys_state *css,
 11393						      struct cftype *cft)
 11394	{
 11395		struct task_group *tg = css_tg(css);
 11396	
 11397		if (!dynamic_affinity_enabled())
 11398			return -EPERM;
 11399	
 11400		if (unlikely(!tg->auto_affinity))
 11401			return -EPERM;
 11402	
 11403		return tg->auto_affinity->mode;
 11404	}
 11405	
 11406	static int cpu_affinity_mode_write_u64(struct cgroup_subsys_state *css,
 11407					   struct cftype *cftype, u64 mode)
 11408	{
 11409		if (!dynamic_affinity_enabled())
 11410			return -EPERM;
 11411	
 11412		return tg_set_dynamic_affinity_mode(css_tg(css), mode);
 11413	}
 11414	
 11415	int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
 11416	{
 11417		if (unlikely(!tg->auto_affinity))
 11418			return -EPERM;
 11419	
 11420		if (!period_ms || period_ms > U64_MAX / NSEC_PER_MSEC)
 11421			return -EINVAL;
 11422	
 11423		raw_spin_lock_irq(&tg->auto_affinity->lock);
 11424		tg->auto_affinity->period = ms_to_ktime(period_ms);
 11425		raw_spin_unlock_irq(&tg->auto_affinity->lock);
 11426		return 0;
 11427	}
 11428	
 11429	u64 tg_get_affinity_period(struct task_group *tg)
 11430	{
 11431		if (unlikely(!tg->auto_affinity))
 11432			return -EPERM;
 11433	
 11434		return ktime_to_ms(tg->auto_affinity->period);
 11435	}
 11436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
