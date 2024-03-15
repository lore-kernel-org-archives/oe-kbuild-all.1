Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A660AD502
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 03:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710473338; cv=none; b=hfmFcxFPGj/Qo2f+gO5nUaFE1CaJSDWlG5oehNcOYxZZHNhFzTIvYXuRRZj2MFoHU25n1UXflhFPkFxiJBMh2TlE7ibzEsMkWmfpHHxnlwoN8K24Bb5F+kDigKl+PwKvY1imoFdzPKMJi1NnxDWK6pAOT2o+z/6s/Gn4lW2Nt0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710473338; c=relaxed/simple;
	bh=3AtPRYjqk286YBRQKTt6kqG7XKJuRAtN7cyFPbmMsBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pH8WzV/eBkYC1Edpn9uLxwaVW6ktwuKbwkBPLEnaaXkrMe3excUY5kR69BBhOLj14e8wF9F+Z2hT/HigcmkiJSnlUQjD7Tu0zaXJe3iKmchrtAxjRaoDLxbBAro9ex7gzKdluNwEWn0U7gxdV+dBhYvw+ZGwCRISqkQ/FkubEgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fr1QPjxt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fr1QPjxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710473336; x=1742009336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3AtPRYjqk286YBRQKTt6kqG7XKJuRAtN7cyFPbmMsBQ=;
  b=Fr1QPjxteN5QbX+yagokp/+tZIEscJk0NRTfKcnJqTw67dKi/h++rDQZ
   fRoPJ3RxU4CeK2v/OdqwDEp7cXFxjf0YhQF7PLgN4aE50w0Z7ZL17Zd9X
   BiVpWyKlnJmrDPF0kFFo/Jj6Pnuzu1RtnPXl7anp/qTG0CdcfyIiuaBhh
   d2YpjofOSgz2fGZ7uGnf9hXoEnII/Hp4ycIv7Ii6XWThuvb+z9rBczwY+
   GOlrgwFF6Ov0EE6G4bY7q0vMRVNCf0/HGDAIOYmaMKLh0LkWNKyBOo6Jl
   GigDuQb1l7eenXqS5lLAY6BYT4K3rQ7/i3adOcTyAHcYWVHbzprxQwp0t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22849128"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="22849128"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 20:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="12975376"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Mar 2024 20:28:54 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkyFY-000E3D-0d;
	Fri, 15 Mar 2024 03:28:52 +0000
Date: Fri, 15 Mar 2024 11:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.7/main 434/3293] kernel/sched/alt_core.c:595:25: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202403151141.6ddy5GSg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

First bad commit (maybe != root cause):

tree:   https://github.com/zen-kernel/zen-kernel 6.7/main
head:   6e5c8b50414acc1e8c08a44a834f6a22af5765f2
commit: 233cb867f9692c48ca88defda0ce015cd43ef5dd [434/3293] sched/alt: [Sync] 111cd11bbc54 sched/cpuset: Bring back cpuset_mutex
config: i386-randconfig-061-20240315 (https://download.01.org/0day-ci/archive/20240315/202403151141.6ddy5GSg-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151141.6ddy5GSg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151141.6ddy5GSg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/alt_core.c:595:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:595:25: sparse:     expected struct task_struct *task
   kernel/sched/alt_core.c:595:25: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:1009:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:1009:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:1009:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:4063:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:4063:15: sparse:    struct task_struct *
   kernel/sched/alt_core.c:4063:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:4151:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4151:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4151:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:4167:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4167:32: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4167:32: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:4789:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4789:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4789:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5325:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5325:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5325:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5475:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5475:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5475:22: sparse:    struct task_struct *
>> kernel/sched/alt_core.c:7081:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:7081:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:7081:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   kernel/sched/alt_core.c:472:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/alt_core.c:511:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/alt_core.c: note: in included file (through kernel/sched/sched.h):
   kernel/sched/alt_sched.h:446:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/alt_core.c:536:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/alt_core.c:555:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/alt_core.c:430:29: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/alt_core.c:442:29: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *

vim +595 kernel/sched/alt_core.c

24d8396ed140df Alfred Chen 2021-09-02  559  
9f08fc0c802aa6 Alfred Chen 2019-08-19  560  /*
9f08fc0c802aa6 Alfred Chen 2019-08-19  561   * RQ-clock updating methods:
9f08fc0c802aa6 Alfred Chen 2019-08-19  562   */
9f08fc0c802aa6 Alfred Chen 2019-08-19  563  
9f08fc0c802aa6 Alfred Chen 2019-08-19  564  static void update_rq_clock_task(struct rq *rq, s64 delta)
9f08fc0c802aa6 Alfred Chen 2019-08-19  565  {
9f08fc0c802aa6 Alfred Chen 2019-08-19  566  /*
9f08fc0c802aa6 Alfred Chen 2019-08-19  567   * In theory, the compile should just see 0 here, and optimize out the call
9f08fc0c802aa6 Alfred Chen 2019-08-19  568   * to sched_rt_avg_update. But I don't trust it...
9f08fc0c802aa6 Alfred Chen 2019-08-19  569   */
9f08fc0c802aa6 Alfred Chen 2019-08-19  570  	s64 __maybe_unused steal = 0, irq_delta = 0;
9f08fc0c802aa6 Alfred Chen 2019-08-19  571  
9f08fc0c802aa6 Alfred Chen 2019-08-19  572  #ifdef CONFIG_IRQ_TIME_ACCOUNTING
9f08fc0c802aa6 Alfred Chen 2019-08-19  573  	irq_delta = irq_time_read(cpu_of(rq)) - rq->prev_irq_time;
9f08fc0c802aa6 Alfred Chen 2019-08-19  574  
9f08fc0c802aa6 Alfred Chen 2019-08-19  575  	/*
9f08fc0c802aa6 Alfred Chen 2019-08-19  576  	 * Since irq_time is only updated on {soft,}irq_exit, we might run into
9f08fc0c802aa6 Alfred Chen 2019-08-19  577  	 * this case when a previous update_rq_clock() happened inside a
9f08fc0c802aa6 Alfred Chen 2019-08-19  578  	 * {soft,}irq region.
9f08fc0c802aa6 Alfred Chen 2019-08-19  579  	 *
9f08fc0c802aa6 Alfred Chen 2019-08-19  580  	 * When this happens, we stop ->clock_task and only update the
9f08fc0c802aa6 Alfred Chen 2019-08-19  581  	 * prev_irq_time stamp to account for the part that fit, so that a next
9f08fc0c802aa6 Alfred Chen 2019-08-19  582  	 * update will consume the rest. This ensures ->clock_task is
9f08fc0c802aa6 Alfred Chen 2019-08-19  583  	 * monotonic.
9f08fc0c802aa6 Alfred Chen 2019-08-19  584  	 *
9f08fc0c802aa6 Alfred Chen 2019-08-19  585  	 * It does however cause some slight miss-attribution of {soft,}irq
9f08fc0c802aa6 Alfred Chen 2019-08-19  586  	 * time, a more accurate solution would be to update the irq_time using
9f08fc0c802aa6 Alfred Chen 2019-08-19  587  	 * the current rq->clock timestamp, except that would require using
9f08fc0c802aa6 Alfred Chen 2019-08-19  588  	 * atomic ops.
9f08fc0c802aa6 Alfred Chen 2019-08-19  589  	 */
9f08fc0c802aa6 Alfred Chen 2019-08-19  590  	if (irq_delta > delta)
9f08fc0c802aa6 Alfred Chen 2019-08-19  591  		irq_delta = delta;
9f08fc0c802aa6 Alfred Chen 2019-08-19  592  
9f08fc0c802aa6 Alfred Chen 2019-08-19  593  	rq->prev_irq_time += irq_delta;
9f08fc0c802aa6 Alfred Chen 2019-08-19  594  	delta -= irq_delta;
9ff7b05ecd0040 Alfred Chen 2023-06-08 @595  	delayacct_irq(rq->curr, irq_delta);
9f08fc0c802aa6 Alfred Chen 2019-08-19  596  #endif
9f08fc0c802aa6 Alfred Chen 2019-08-19  597  #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
9f08fc0c802aa6 Alfred Chen 2019-08-19  598  	if (static_key_false((&paravirt_steal_rq_enabled))) {
9f08fc0c802aa6 Alfred Chen 2019-08-19  599  		steal = paravirt_steal_clock(cpu_of(rq));
9f08fc0c802aa6 Alfred Chen 2019-08-19  600  		steal -= rq->prev_steal_time_rq;
9f08fc0c802aa6 Alfred Chen 2019-08-19  601  
9f08fc0c802aa6 Alfred Chen 2019-08-19  602  		if (unlikely(steal > delta))
9f08fc0c802aa6 Alfred Chen 2019-08-19  603  			steal = delta;
9f08fc0c802aa6 Alfred Chen 2019-08-19  604  
9f08fc0c802aa6 Alfred Chen 2019-08-19  605  		rq->prev_steal_time_rq += steal;
9f08fc0c802aa6 Alfred Chen 2019-08-19  606  		delta -= steal;
9f08fc0c802aa6 Alfred Chen 2019-08-19  607  	}
9f08fc0c802aa6 Alfred Chen 2019-08-19  608  #endif
9f08fc0c802aa6 Alfred Chen 2019-08-19  609  
9f08fc0c802aa6 Alfred Chen 2019-08-19  610  	rq->clock_task += delta;
9f08fc0c802aa6 Alfred Chen 2019-08-19  611  

:::::: The code at line 595 was first introduced by commit
:::::: 9ff7b05ecd00405cd2c5e6996ad7920e724273eb sched/alt: [Sync] a3b2aeac9d15 delayacct: track delays from IRQ/SOFTIRQ

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
