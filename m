Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771DD364
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 00:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705883134; cv=none; b=IGAB1e9f3yHkxXZHGB5dPuOG88sKr4sfDxyuMqWxCzwG0rJiElIPPDq11V+pek7k5GSnXXbl6MauUqLx+qupXxJwiK5Qhaa6ZL4DC4IakxXCHYNUdeeilzQIcsEo1Ebif4UztvFAosFAhpoKaRxLrsUAzb83FrQehwaFM1gnuFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705883134; c=relaxed/simple;
	bh=VLsLStotxU4HlAKKoKBtkjCpWWzI5u9mJAaR9v/I6ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kressSwLgg5cXlfDsBfuEHrNyO2k2B/eIR5SyYRvqnFhCt9JkovnLbQciyk20oZU3DvC7f5c/Vawz8LBGr1cT6kjK1g+WW9O1ALPHxGN8Th82uFT8SI/YwClY/fUpCs3dTKZ2kLL/7NGS5+8CyW3VDclnW51VCFTQH1Y2i9NUMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MTE0kjtf; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTE0kjtf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705883132; x=1737419132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VLsLStotxU4HlAKKoKBtkjCpWWzI5u9mJAaR9v/I6ms=;
  b=MTE0kjtfrKLkaVPGJUFKTjNFVDXU7NquSdC7DaZnRYPH33+J+7+dI3dQ
   dSrr7FwzujEh89I8OC9SGK96N7hUYVk1K38h11gumBuuyX90QpXHlLmdS
   G8/IZKXl/NkXezAxYAaIeQNN8QoDHHkES1/hi9oBZYfQ0XEJt8XkeUXxB
   yiVe4jCsBWZcGsNfeITNctjLgoBT6OF6EwW+wPSvSTknMXDWEy/GSOUCH
   TrnZvLxu4IrDdE4k0CSIIsHqz5R1BT4NPPhSFrZip4NKQOJ3puIjbkMmn
   32blI1kUEpoQbY9M3WSf93MK/m5h+GY1LC0sWhvr8sY2UWRYnICU+hNIw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="404837370"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="404837370"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 16:25:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="27495270"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Jan 2024 16:25:30 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRi80-0006HC-0t;
	Mon, 22 Jan 2024 00:25:28 +0000
Date: Mon, 22 Jan 2024 08:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 13/13]
 kernel/sched/core.c:4904:7: error: implicit declaration of function
 '__ignore_task_perf'; did you mean '__init_task_data'?
Message-ID: <202401220820.R4Ty2Udn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   a29c26f9317cede0f3141904d910d3125f8a82ea
commit: a29c26f9317cede0f3141904d910d3125f8a82ea [13/13] sched: Make iowait boost per task
config: i386-randconfig-011-20240122 (https://download.01.org/0day-ci/archive/20240122/202401220820.R4Ty2Udn-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401220820.R4Ty2Udn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401220820.R4Ty2Udn-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'update_cpufreq_ctx_switch':
   kernel/sched/core.c:4896:14: error: 'struct cfs_rq' has no member named 'decayed'
      if (rq->cfs.decayed) {
                 ^
   kernel/sched/core.c:4897:11: error: 'struct cfs_rq' has no member named 'decayed'
       rq->cfs.decayed = false;
              ^
>> kernel/sched/core.c:4904:7: error: implicit declaration of function '__ignore_task_perf'; did you mean '__init_task_data'? [-Werror=implicit-function-declaration]
      if (__ignore_task_perf(current))
          ^~~~~~~~~~~~~~~~~~
          __init_task_data
>> kernel/sched/core.c:4908:16: error: implicit declaration of function '__uclamp_eff_value'; did you mean 'uclamp_eff_value'? [-Werror=implicit-function-declaration]
      uclamp_min = __uclamp_eff_value(current, UCLAMP_MIN);
                   ^~~~~~~~~~~~~~~~~~
                   uclamp_eff_value
   kernel/sched/core.c:4910:20: error: 'struct cfs_rq' has no member named 'avg'
      rq_util = rq->cfs.avg.util_avg;
                       ^
   cc1: some warnings being treated as errors


vim +4904 kernel/sched/core.c

  4877	
  4878	static inline void update_cpufreq_ctx_switch(struct rq *rq)
  4879	{
  4880		if (unlikely(current->sched_class == &stop_sched_class))
  4881			return;
  4882	
  4883		if (unlikely(current->sched_class == &idle_sched_class))
  4884			return;
  4885	
  4886		if (unlikely(task_has_idle_policy(current)))
  4887			return;
  4888	
  4889		if (likely(fair_policy(current->policy))) {
  4890			unsigned long uclamp_min, uclamp_max;
  4891			unsigned long rq_util;
  4892	
  4893			/*
  4894			 * Allow cpufreq updates once for every update_load_avg() decay.
  4895			 */
  4896			if (rq->cfs.decayed) {
  4897				rq->cfs.decayed = false;
  4898				goto force_update;
  4899			}
  4900	
  4901			if (current->in_iowait)
  4902				goto force_update;
  4903	
> 4904			if (__ignore_task_perf(current))
  4905				return;
  4906	
  4907			/* Force an update if perf hints are required to be applied */
> 4908			uclamp_min = __uclamp_eff_value(current, UCLAMP_MIN);
  4909			uclamp_max = __uclamp_eff_value(current, UCLAMP_MAX);
  4910			rq_util = rq->cfs.avg.util_avg;
  4911	
  4912			if (uclamp_min > rq_util || uclamp_max < rq_util)
  4913				goto force_update;
  4914	
  4915			return;
  4916		}
  4917	
  4918		/* RT and DL should always send a freq update */
  4919	
  4920		/* XXX ignore updates for sugov worker thread */
  4921	
  4922	force_update:
  4923	
  4924		/*
  4925		 * Request freq update after __balance_callbacks to take into account
  4926		 * any changes to rq.
  4927		 */
  4928		cpufreq_update_util(rq, 0);
  4929	}
  4930	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
