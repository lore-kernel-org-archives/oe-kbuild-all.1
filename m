Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2127318C2C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 00:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782433360; cv=none; b=nwkAdmEkEFBEGckX/6ahdQXuOQx3QMbSRV5vYE2JRq/efO8Ny5Oq1mPMm/DqwFMxKG+9h8PEiODhWIw0GVsPfXVtiMdozkwm1+HC+BNKjwu2ZFYUXvWUNNf5bcmCUzSL04JWdVeP8DlwOLmZ8I5m6q1YKCIRMXtq3bcdO4yZBac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782433360; c=relaxed/simple;
	bh=0EW4ZG4x1ASqRnfDU1lYhdYVZSJH/HExRy2x9eF6gUk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dJLXiLRonllRU2L/WLMNdlBpaXnbrS3p9fApkwOXvxcctNXISJObfcl12IER7SXu3jkZbxzPklLB+STkDovd+NhRhWYP0D2ALlwG1V76cyQsOlN3q1icV5UIS8afoodH5nwTADRf2K3VwBuGnDpbmAcTdR1eZE+3FeZZqca75Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GxJZYFCt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GxJZYFCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782433359; x=1813969359;
  h=date:from:to:cc:subject:message-id;
  bh=0EW4ZG4x1ASqRnfDU1lYhdYVZSJH/HExRy2x9eF6gUk=;
  b=GxJZYFCttACqGDBJh4UMTxyRG9Im+5CHEgGPdEHMKDj5bwnO7RR8MEvL
   e9B6HWo9M5uk4346GSeekyjx5fn5xO+YQQ3ij01Jy4AdYTZuujw46Klso
   xM12HVRG3VqEgycmx/mDIu1HjoPDBFdUItrdn2jHeMVYqgKVOyieC7OEI
   nvn+TnDGAgp4KQS6U4w/oMcFhQQ/D0xIaBa7hkZHFevTfmaplU9RqoZiN
   5DHJk2BnMsqIsDsBcE7E0ka+k8oG+yo7Cs85Uvk6XaskxDj3FGHE/TZCI
   ykltU7cGUxm7jp3mi35tZVhQMyvYGgvfAoakAsNhOm+XXy2kZZSA8/Ojg
   A==;
X-CSE-ConnectionGUID: fEbe2jXwQ3+7aoEPwnewtg==
X-CSE-MsgGUID: 4SZ1FS46TAWIGZeGvX/olA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83239808"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="83239808"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 17:22:38 -0700
X-CSE-ConnectionGUID: 9tgj2uDxRtaZaVEdrUvMUw==
X-CSE-MsgGUID: fDPkyR/NS1CxOhYRCI1gFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="253087445"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jun 2026 17:22:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcuL5-000000004fp-042Y;
	Fri, 26 Jun 2026 00:22:35 +0000
Date: Fri, 26 Jun 2026 08:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-sync 7/21] kernel/sched/fair.c:7361:76: error:
 'class_raw_spinlock_irqsave_t' has no member named 'flags'
Message-ID: <202606260808.qo1RBpNl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   9214bf3de496a0c6db1b33bfecf8d4732c060b8e
commit: a71ac5c74494cca5cc75b846522f22be9f1a2231 [7/21] locking: Switch to _irq_{disable,enable}() variants in cleanup guards
config: x86_64-randconfig-102-20260625 (https://download.01.org/0day-ci/archive/20260626/202606260808.qo1RBpNl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606260808.qo1RBpNl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606260808.qo1RBpNl-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'sched_cfs_period_timer':
>> kernel/sched/fair.c:7361:76: error: 'class_raw_spinlock_irqsave_t' has no member named 'flags'
    7361 |                 idle = do_sched_cfs_period_timer(cfs_b, overrun, cfsb_guard.flags);
         |                                                                            ^


vim +7361 kernel/sched/fair.c

029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7345  
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7346  static enum hrtimer_restart sched_cfs_period_timer(struct hrtimer *timer)
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7347  {
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7348  	struct cfs_bandwidth *cfs_b =
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7349  		container_of(timer, struct cfs_bandwidth, period_timer);
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7350  	int overrun;
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7351  	int idle = 0;
2e8e19226398db kernel/sched/fair.c Phil Auld       2019-03-19  7352  	int count = 0;
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7353  
1abbecd1d2d2fd kernel/sched/fair.c K Prateek Nayak 2026-06-02  7354  	CLASS(raw_spinlock_irqsave, cfsb_guard)(&cfs_b->lock);
1abbecd1d2d2fd kernel/sched/fair.c K Prateek Nayak 2026-06-02  7355  
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7356  	for (;;) {
77a4d1a1b9a122 kernel/sched/fair.c Peter Zijlstra  2015-04-15  7357  		overrun = hrtimer_forward_now(timer, cfs_b->period);
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7358  		if (!overrun)
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7359  			break;
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7360  
1abbecd1d2d2fd kernel/sched/fair.c K Prateek Nayak 2026-06-02 @7361  		idle = do_sched_cfs_period_timer(cfs_b, overrun, cfsb_guard.flags);
5a6d6a6ccb5f48 kernel/sched/fair.c Huaixin Chang   2020-04-20  7362  
2e8e19226398db kernel/sched/fair.c Phil Auld       2019-03-19  7363  		if (++count > 3) {
2e8e19226398db kernel/sched/fair.c Phil Auld       2019-03-19  7364  			u64 new, old = ktime_to_ns(cfs_b->period);
2e8e19226398db kernel/sched/fair.c Phil Auld       2019-03-19  7365  
4929a4e6faa0f1 kernel/sched/fair.c Xuewei Zhang    2019-10-03  7366  			/*
4929a4e6faa0f1 kernel/sched/fair.c Xuewei Zhang    2019-10-03  7367  			 * Grow period by a factor of 2 to avoid losing precision.
4929a4e6faa0f1 kernel/sched/fair.c Xuewei Zhang    2019-10-03  7368  			 * Precision loss in the quota/period ratio can cause __cfs_schedulable
4929a4e6faa0f1 kernel/sched/fair.c Xuewei Zhang    2019-10-03  7369  			 * to fail.
4929a4e6faa0f1 kernel/sched/fair.c Xuewei Zhang    2019-10-03  7370  			 */
4929a4e6faa0f1 kernel/sched/fair.c Xuewei Zhang    2019-10-03  7371  			new = old * 2;
5bc34be478d09c kernel/sched/fair.c Tejun Heo       2025-06-13  7372  			if (new < max_bw_quota_period_us * NSEC_PER_USEC) {
2e8e19226398db kernel/sched/fair.c Phil Auld       2019-03-19  7373  				cfs_b->period = ns_to_ktime(new);
4929a4e6faa0f1 kernel/sched/fair.c Xuewei Zhang    2019-10-03  7374  				cfs_b->quota *= 2;
f4183717b370ad kernel/sched/fair.c Huaixin Chang   2021-06-21  7375  				cfs_b->burst *= 2;
2e8e19226398db kernel/sched/fair.c Phil Auld       2019-03-19  7376  
2e8e19226398db kernel/sched/fair.c Phil Auld       2019-03-19  7377  				pr_warn_ratelimited(
4929a4e6faa0f1 kernel/sched/fair.c Xuewei Zhang    2019-10-03  7378  	"cfs_period_timer[cpu%d]: period too short, scaling up (new cfs_period_us = %lld, cfs_quota_us = %lld)\n",
2e8e19226398db kernel/sched/fair.c Phil Auld       2019-03-19  7379  					smp_processor_id(),
2e8e19226398db kernel/sched/fair.c Phil Auld       2019-03-19  7380  					div_u64(new, NSEC_PER_USEC),
2e8e19226398db kernel/sched/fair.c Phil Auld       2019-03-19  7381  					div_u64(cfs_b->quota, NSEC_PER_USEC));
4929a4e6faa0f1 kernel/sched/fair.c Xuewei Zhang    2019-10-03  7382  			} else {
4929a4e6faa0f1 kernel/sched/fair.c Xuewei Zhang    2019-10-03  7383  				pr_warn_ratelimited(
4929a4e6faa0f1 kernel/sched/fair.c Xuewei Zhang    2019-10-03  7384  	"cfs_period_timer[cpu%d]: period too short, but cannot scale up without losing precision (cfs_period_us = %lld, cfs_quota_us = %lld)\n",
4929a4e6faa0f1 kernel/sched/fair.c Xuewei Zhang    2019-10-03  7385  					smp_processor_id(),
4929a4e6faa0f1 kernel/sched/fair.c Xuewei Zhang    2019-10-03  7386  					div_u64(old, NSEC_PER_USEC),
4929a4e6faa0f1 kernel/sched/fair.c Xuewei Zhang    2019-10-03  7387  					div_u64(cfs_b->quota, NSEC_PER_USEC));
4929a4e6faa0f1 kernel/sched/fair.c Xuewei Zhang    2019-10-03  7388  			}
2e8e19226398db kernel/sched/fair.c Phil Auld       2019-03-19  7389  
2e8e19226398db kernel/sched/fair.c Phil Auld       2019-03-19  7390  			/* reset count so we don't come right back in here */
2e8e19226398db kernel/sched/fair.c Phil Auld       2019-03-19  7391  			count = 0;
2e8e19226398db kernel/sched/fair.c Phil Auld       2019-03-19  7392  		}
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7393  	}
1abbecd1d2d2fd kernel/sched/fair.c K Prateek Nayak 2026-06-02  7394  
1abbecd1d2d2fd kernel/sched/fair.c K Prateek Nayak 2026-06-02  7395  	if (idle) {
4cfafd3082afc7 kernel/sched/fair.c Peter Zijlstra  2015-05-14  7396  		cfs_b->period_active = 0;
1abbecd1d2d2fd kernel/sched/fair.c K Prateek Nayak 2026-06-02  7397  		return HRTIMER_NORESTART;
1abbecd1d2d2fd kernel/sched/fair.c K Prateek Nayak 2026-06-02  7398  	}
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7399  
1abbecd1d2d2fd kernel/sched/fair.c K Prateek Nayak 2026-06-02  7400  	return HRTIMER_RESTART;
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7401  }
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra  2011-10-25  7402  

:::::: The code at line 7361 was first introduced by commit
:::::: 1abbecd1d2d2fdd96e52f541f07ee2b163631bee sched/fair: Convert cfs bandwidth throttling to use guards

:::::: TO: K Prateek Nayak <kprateek.nayak@amd.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
