Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39004218E81
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 16:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734712792; cv=none; b=Fk5tj7fLehJGsjuLASezV7IbOyhbZArAYoF9zbIumwLEQooHu8QhVOikwKK5dSjGSVzkKWshdA+CcnHEjCm3JiOMx0o46BadTGU9zCxo+dtOqiiCy3gJRnoAWs7Bd/C706AAOwOBE1o8AH4IFdZYGnfpr1uatX8gKoEDwgf1bxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734712792; c=relaxed/simple;
	bh=BdQBbCv6K1ZB+YLYmFbO7rGGys6kHM1HP0SvLWL3rGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CzwoNec/TrhEskIa0fafTDn4linvsQtyz+KNJ1fdQrLROazC5MSjtgT+QDBSmUICVFB4zuyq/IwovUZHctTW4GleheXQTUVFJxhMZs4N74jKzp8T0OErdoW4MJG5tLKzVlKRNnQMChUzSYKyuMHXggzUfTEANH2bvpMEsqbT8JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RaKX34te; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaKX34te"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734712789; x=1766248789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BdQBbCv6K1ZB+YLYmFbO7rGGys6kHM1HP0SvLWL3rGs=;
  b=RaKX34teAAVOhNfs7WApZmuKn+GbK1ZB/VKH1f0ellzP3BqJkU6FMVjr
   VuRBwCTngok/pSfpmvy2Rh18nU53I/Sy4NenT8rrYvxsDGXqDDZMSBUT+
   q5Oi3c6dHOcp2KqJotIATNIlaTlcCwskqGBJvFVsyHLYs9ThHQrbS3Zb1
   Y6Wucb9asbS9wMIuubggeucdI1qT5WoqFAw4xO6+p1gc6coVveaG9Jvo9
   Ne3ERj6MPode/ElArf+W+GlKCtD8ucErNl+FfmC0rb+39HBXF9FMZUeYI
   HLJS66Eg4MST2Qx3En8+vdBpYB4CaQANiY5hEniKyzaV2YrOrfAQziw5B
   w==;
X-CSE-ConnectionGUID: +h1QIOeJS3W8bWPOQO5JvQ==
X-CSE-MsgGUID: y3mk696xRwOMH73gN9McIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35295803"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35295803"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 08:39:49 -0800
X-CSE-ConnectionGUID: caPIIYY0SQuXzBxRoq+bMw==
X-CSE-MsgGUID: x7ICLrJIQG+RhpSFhLfBXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98386689"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Dec 2024 08:39:49 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOg2U-0001QM-1k;
	Fri, 20 Dec 2024 16:39:46 +0000
Date: Sat, 21 Dec 2024 00:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Jia <jiahao1@lixiang.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/core 43/43] kernel/sched/fair.c:9407:48: error:
 'struct cfs_rq' has no member named 'nr_running'
Message-ID: <202412210004.tZGVjD48-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   9eca7eecba70c32720d1fab922aa6d7ec5dfb6c1
commit: 9eca7eecba70c32720d1fab922aa6d7ec5dfb6c1 [43/43] sched/core: Prioritize migrating eligible tasks in sched_balance_rq()
config: x86_64-buildonly-randconfig-004-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210004.tZGVjD48-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210004.tZGVjD48-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210004.tZGVjD48-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'task_is_ineligible_on_dst_cpu':
>> kernel/sched/fair.c:9407:48: error: 'struct cfs_rq' has no member named 'nr_running'
    9407 |         if (sched_feat(PLACE_LAG) && dst_cfs_rq->nr_running &&
         |                                                ^~


vim +9407 kernel/sched/fair.c

  9389	
  9390	/*
  9391	 * Check whether the task is ineligible on the destination cpu
  9392	 *
  9393	 * When the PLACE_LAG scheduling feature is enabled and
  9394	 * dst_cfs_rq->nr_running is greater than 1, if the task
  9395	 * is ineligible, it will also be ineligible when
  9396	 * it is migrated to the destination cpu.
  9397	 */
  9398	static inline int task_is_ineligible_on_dst_cpu(struct task_struct *p, int dest_cpu)
  9399	{
  9400		struct cfs_rq *dst_cfs_rq;
  9401	
  9402	#if CONFIG_FAIR_GROUP_SCHED
  9403		dst_cfs_rq = task_group(p)->cfs_rq[dest_cpu];
  9404	#else
  9405		dst_cfs_rq = &cpu_rq(dest_cpu)->cfs;
  9406	#endif
> 9407		if (sched_feat(PLACE_LAG) && dst_cfs_rq->nr_running &&
  9408		    !entity_eligible(task_cfs_rq(p), &p->se))
  9409			return 1;
  9410	
  9411		return 0;
  9412	}
  9413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
