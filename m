Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A482231C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Apr 2024 17:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712510779; cv=none; b=M/y7koAlv4SNwiGD2ySEdXcdSYOsqH/XkJapOWhjrZl4+nKi0/UqSwdAXxcWLTUizYm4kNOUNVidVdOGUL9nRBGBaIg7EhUNMJMG7n5bqfGHLeBXTYOfaGnm8hN8kKobg3U2wcPcCSbrPHJg7aBoxN8s5bMyxVid4jFxJ2/843E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712510779; c=relaxed/simple;
	bh=ahhb/PYw05Cvikro8RD5+mBy09U0aBU51zvf1ACnkHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XqT7a6byBSohzGYp9yYef8MQIob6MBOLbZ9Hxvpra+DaKWV0K6sAuGXjRvvr/1Sx7vx4UMNbfjVTRkImhEuerXuEe/OlIHMJTRkyqWGV+YEAamOeNcEvOjEdBPAdoG3WgW9YSftdAkigtfjjmWMn9SjSWejgkHa6wvygtnIDJGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOCNDEfc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOCNDEfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712510777; x=1744046777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ahhb/PYw05Cvikro8RD5+mBy09U0aBU51zvf1ACnkHA=;
  b=TOCNDEfcTUoaEaJk80W1kJocIsN5qWKP9bnNns6rlR79Tr8KCaZrKzZv
   64S11xSVcUs2adY0mqaQBaUtlmeQzX+GMqPe2iB72/drgh8kiW4xrXKSO
   ASZWTMqHuuYpi9PkQO8HngQTzlGd/l7PNLIISzrJ2rnl312z2aLFj635e
   CIoK9wIwPkZDmHODt9psSmwBlG8WeFz1Da+WstBm1Rl2qxlQmSLW+y+rx
   gINswIFVj1u88fw3Ee5qTIyHWPXhYvwVvO5hBF45JvWiNSGkWSuZKpVq4
   EyVxhlEXWmYTQzPcqTNHlihtQVg5Gzd5YQHKA3QkWHdMveQ0+WrUXDpzU
   g==;
X-CSE-ConnectionGUID: NPzb1ziRTAe5FNNhNtiXGg==
X-CSE-MsgGUID: MefnRJyhRg2/XD5U0h/Kjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="10755404"
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="10755404"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 10:26:16 -0700
X-CSE-ConnectionGUID: eDajeSmmQYesN8BmaehN4w==
X-CSE-MsgGUID: dj52uZxVR32Q+ohIjYiVyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="20094736"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Apr 2024 10:26:15 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtWHU-0004Vm-2k;
	Sun, 07 Apr 2024 17:26:12 +0000
Date: Mon, 8 Apr 2024 01:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 11/13]
 kernel/sched/core.c:4877:21: error: implicit declaration of function
 'ignore_task_perf'
Message-ID: <202404080104.wMn259i3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   3173a853e6c16e1dcb09d392ef1e9b5a06448696
commit: e3d0c229d3ce487080291ad232b68805d3c9f830 [11/13] sched/schedutil: Ignore perf requests for short running tasks
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240408/202404080104.wMn259i3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240408/202404080104.wMn259i3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404080104.wMn259i3-lkp@intel.com/

Note: the qais-yousef/uclamp-max-aggregation HEAD 3173a853e6c16e1dcb09d392ef1e9b5a06448696 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
   kernel/sched/core.c: In function 'update_cpufreq_ctx_switch':
   kernel/sched/core.c:4869:37: error: 'struct cfs_rq' has no member named 'decayed'
    4869 |                 if (unlikely(rq->cfs.decayed)) {
         |                                     ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/sched/core.c:4870:32: error: 'struct cfs_rq' has no member named 'decayed'
    4870 |                         rq->cfs.decayed = false;
         |                                ^
>> kernel/sched/core.c:4877:21: error: implicit declaration of function 'ignore_task_perf' [-Werror=implicit-function-declaration]
    4877 |                 if (ignore_task_perf(current))
         |                     ^~~~~~~~~~~~~~~~
   kernel/sched/core.c:4883:34: error: 'struct cfs_rq' has no member named 'avg'
    4883 |                 rq_util = rq->cfs.avg.util_avg;
         |                                  ^
   cc1: some warnings being treated as errors


vim +/ignore_task_perf +4877 kernel/sched/core.c

  4850	
  4851	static inline void update_cpufreq_ctx_switch(struct rq *rq)
  4852	{
  4853		if (unlikely(current->sched_class == &stop_sched_class))
  4854			return;
  4855	
  4856		if (unlikely(current->sched_class == &idle_sched_class))
  4857			return;
  4858	
  4859		if (unlikely(task_has_idle_policy(current)))
  4860			return;
  4861	
  4862		if (likely(fair_policy(current->policy))) {
  4863			unsigned long uclamp_min, uclamp_max;
  4864			unsigned long rq_util;
  4865	
  4866			/*
  4867			 * Allow cpufreq updates once for every update_load_avg() decay.
  4868			 */
  4869			if (unlikely(rq->cfs.decayed)) {
  4870				rq->cfs.decayed = false;
  4871				goto force_update;
  4872			}
  4873	
  4874			if (unlikely(current->in_iowait))
  4875				goto force_update;
  4876	
> 4877			if (ignore_task_perf(current))
  4878				return;
  4879	
  4880			/* Force an update if perf hints are required to be applied */
  4881			uclamp_min = uclamp_eff_value(current, UCLAMP_MIN);
  4882			uclamp_max = uclamp_eff_value(current, UCLAMP_MAX);
  4883			rq_util = rq->cfs.avg.util_avg;
  4884	
  4885			if (uclamp_min > rq_util || uclamp_max < rq_util)
  4886				goto force_update;
  4887	
  4888			return;
  4889		}
  4890	
  4891		/* RT and DL should always send a freq update */
  4892	
  4893		/* XXX ignore updates for sugov worker thread */
  4894	
  4895	force_update:
  4896	
  4897		/*
  4898		 * Request freq update after __balance_callbacks to take into account
  4899		 * any changes to rq.
  4900		 */
  4901		cpufreq_update_util(rq, current->in_iowait ? SCHED_CPUFREQ_IOWAIT : 0);
  4902	}
  4903	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
