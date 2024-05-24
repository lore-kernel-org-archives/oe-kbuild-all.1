Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDE750263
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 19:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716578735; cv=none; b=ug+JvQXQdQ7WuW6gO6+u/VN9q+1HMhpbAj8o7XMASnM9DfCFLasGCGOztBSzn6UQebe2Y3qEiEYZ2qouCTOXGla++iYOr0PfCQR7Xq4gC/TzmLNy8cYxmg1IfX3aDrL7rej1s/OJMnyZ/m5aniYV4O26njjtWmkU3O2TEYlc1eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716578735; c=relaxed/simple;
	bh=/s3EzciSFU4Y3H/vYAjH51UcdFmhaxaUHFVb1UyfX1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iTYQUbBmz0o8c4SLa1ToKd2CwKXIPpH5s+2lA3yMof0AKZpywtQyNdf8AWCKBPyzPDzG28UbC2H2H/3Kt6JyzavBqUUPizE5GocRspuuCIv/gctOChgiLqk8p16iHzRiZn+U5l/RH6H/cf1zZr2yag0CV7ei4K2QABmcEsF38uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUp9C10Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUp9C10Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716578733; x=1748114733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/s3EzciSFU4Y3H/vYAjH51UcdFmhaxaUHFVb1UyfX1U=;
  b=JUp9C10QzGNVQjcz5ECjEH84LYldmtAFsS/uDfd5dJjtwsF8jJ7pOuVO
   TM1M6UgQIutlWx6N3+nNji4jC7EFgjuFL55Fd86giOwFyON7lWMY0kGhC
   3tpPN5cE8KN3yyEchPc0P7DLupgSRUgbZ7oZsZYevByFsVWsNs0zlwz7R
   9DfIsgGEOUiVVVUX3tqJu4xPwbSO7rw7WiuO4hD6HqgpCzLqDOdjwe5e4
   2V7J62Dyt1hOg7cm8ozIv3OrmACCRTRV/iZK1J8FciXZBAOcliNozAfZD
   F/mLbIDm+w5iqYbs52MNqVwmjDVfcLRDtwgT0yeA5k/MJOtrnzwR/D7/R
   A==;
X-CSE-ConnectionGUID: L2SAvUHlRPixKso/vzLouA==
X-CSE-MsgGUID: foDwrhNKTHGF7DFwqX54tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12909738"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="12909738"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 12:25:32 -0700
X-CSE-ConnectionGUID: QoBuZDtLTEuX8UB+CBxm8A==
X-CSE-MsgGUID: yXh9g8sySp6EnqHplmQljQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="34130253"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2024 12:25:31 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAaXg-0005px-2V;
	Fri, 24 May 2024 19:25:28 +0000
Date: Sat, 25 May 2024 03:18:01 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 9/13]
 kernel/sched/core.c:5167:34: error: 'struct cfs_rq' has no member named
 'avg'
Message-ID: <202405250307.a2kAisjf-lkp@intel.com>
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
commit: a56dffdffe68dfc7170004f08a18bc921266f3ab [9/13] sched: Take perf requests into account when making cpufreq updates
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240525/202405250307.a2kAisjf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250307.a2kAisjf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250307.a2kAisjf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
   kernel/sched/core.c: In function 'update_cpufreq_ctx_switch':
   kernel/sched/core.c:5156:37: error: 'struct cfs_rq' has no member named 'decayed'
    5156 |                 if (unlikely(rq->cfs.decayed)) {
         |                                     ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/sched/core.c:5157:32: error: 'struct cfs_rq' has no member named 'decayed'
    5157 |                         rq->cfs.decayed = false;
         |                                ^
>> kernel/sched/core.c:5167:34: error: 'struct cfs_rq' has no member named 'avg'
    5167 |                 rq_util = rq->cfs.avg.util_avg;
         |                                  ^


vim +5167 kernel/sched/core.c

  5137	
  5138	static inline void update_cpufreq_ctx_switch(struct rq *rq)
  5139	{
  5140		if (unlikely(current->sched_class == &stop_sched_class))
  5141			return;
  5142	
  5143		if (unlikely(current->sched_class == &idle_sched_class))
  5144			return;
  5145	
  5146		if (unlikely(task_has_idle_policy(current)))
  5147			return;
  5148	
  5149		if (likely(fair_policy(current->policy))) {
  5150			unsigned long uclamp_min, uclamp_max;
  5151			unsigned long rq_util;
  5152	
  5153			/*
  5154			 * Allow cpufreq updates once for every update_load_avg() decay.
  5155			 */
  5156			if (unlikely(rq->cfs.decayed)) {
  5157				rq->cfs.decayed = false;
  5158				goto force_update;
  5159			}
  5160	
  5161			if (unlikely(current->in_iowait))
  5162				goto force_update;
  5163	
  5164			/* Force an update if perf hints are required to be applied */
  5165			uclamp_min = uclamp_eff_value(current, UCLAMP_MIN);
  5166			uclamp_max = uclamp_eff_value(current, UCLAMP_MAX);
> 5167			rq_util = rq->cfs.avg.util_avg;
  5168	
  5169			if (uclamp_min > rq_util || uclamp_max < rq_util)
  5170				goto force_update;
  5171	
  5172			return;
  5173		}
  5174	
  5175		/* RT and DL should always send a freq update */
  5176	
  5177		/* XXX ignore updates for sugov worker thread */
  5178	
  5179	force_update:
  5180	
  5181		/*
  5182		 * Request freq update after __balance_callbacks to take into account
  5183		 * any changes to rq.
  5184		 */
  5185		cpufreq_update_util(rq, current->in_iowait ? SCHED_CPUFREQ_IOWAIT : 0);
  5186	}
  5187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
