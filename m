Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAEC2BAE1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 20:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716581699; cv=none; b=J8Qpx2GiFjOwUy1nRHVBBGiHbM/XEORQ2j6FxTB+WNtfgP4C8N3fQU+Sf/cGfhiN9V9WZO72CPd0ehT9Fts0ZNq6pSyQLTgKXA3XrSPa2gpNZ4GjtbFwuzQfRj10GusEQYFu5eFaFXG87NQFTcyI7HFMuh5HpMVlrcVi/n/x/Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716581699; c=relaxed/simple;
	bh=aDgx4/EsrzkKNydn8XIHjWgUToXIK7gIKWAMupeQEU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EzliSnGh7dUmpjX0nspL7SHQ7vXN6N/+ZiEAYieqWRAXeOlpRqWQeogRnV2inE0K3lTGQyqiFYvgNhUk5BAB7MkMHyUnG7+DlI3EUDAIO5WNmw0/M5Nhxg9jkEvGNZR7Qa9rQA8tBVNzsYnoxSjaTfPxzYFrwb6etpKwBAYBN/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBTEoENh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBTEoENh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716581698; x=1748117698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aDgx4/EsrzkKNydn8XIHjWgUToXIK7gIKWAMupeQEU4=;
  b=lBTEoENhyk1fD3uT7HM+x8+MIs207zhAHOYPjnLM5CQ2ybVOkC4730zg
   NzVrvxkX1Bu1GweQX4xe2ZFHxq8s4ei1G9meEZxznGkQ/nIOCIBv9aT72
   KjEBizpfh1UbFPQnxnJU71BaUb5Fl3g7El2tPLj5XJxcZuUCOXC9lud/q
   z6eqXsMW7RJsl6BlmMQskm4d+sJZdCWAGdwYa9+enu+x3/lEhLINwWVlx
   DNrMcRfEACyjzxMeizbgSjtDu7ke/9mQS6z+lh/WFq7FVA6KA1E1rI8XL
   1f2ShCZLu6etk3s4F4wvrzyZLDogIGz3Z2n8HWB1QNla7ZkKU2wOmWgSJ
   Q==;
X-CSE-ConnectionGUID: OxfDGunxQDu5GOt5kMPuJg==
X-CSE-MsgGUID: CjxpMsXjQfm0PUIJ52ftsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12820890"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="12820890"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 13:14:57 -0700
X-CSE-ConnectionGUID: 8+frOWTuTUqBFDpoypeITQ==
X-CSE-MsgGUID: KffNW7nTRRyh1qaTtuxm1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="38711675"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 May 2024 13:14:55 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAbJF-0005sZ-2o;
	Fri, 24 May 2024 20:14:45 +0000
Date: Sat, 25 May 2024 04:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 13/13]
 kernel/sched/core.c:4914:21: error: implicit declaration of function
 '__ignore_task_perf'
Message-ID: <202405250438.YmaypNVh-lkp@intel.com>
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
commit: 3173a853e6c16e1dcb09d392ef1e9b5a06448696 [13/13] sched: Make iowait boost per task
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240525/202405250438.YmaypNVh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250438.YmaypNVh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250438.YmaypNVh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
   kernel/sched/core.c: In function 'update_cpufreq_ctx_switch':
   kernel/sched/core.c:4906:37: error: 'struct cfs_rq' has no member named 'decayed'
    4906 |                 if (unlikely(rq->cfs.decayed)) {
         |                                     ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/sched/core.c:4907:32: error: 'struct cfs_rq' has no member named 'decayed'
    4907 |                         rq->cfs.decayed = false;
         |                                ^
>> kernel/sched/core.c:4914:21: error: implicit declaration of function '__ignore_task_perf' [-Werror=implicit-function-declaration]
    4914 |                 if (__ignore_task_perf(current))
         |                     ^~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:4918:30: error: implicit declaration of function '__uclamp_eff_value'; did you mean 'uclamp_eff_value'? [-Werror=implicit-function-declaration]
    4918 |                 uclamp_min = __uclamp_eff_value(current, UCLAMP_MIN);
         |                              ^~~~~~~~~~~~~~~~~~
         |                              uclamp_eff_value
   kernel/sched/core.c:4920:34: error: 'struct cfs_rq' has no member named 'avg'
    4920 |                 rq_util = rq->cfs.avg.util_avg;
         |                                  ^
   cc1: some warnings being treated as errors


vim +/__ignore_task_perf +4914 kernel/sched/core.c

  4887	
  4888	static inline void update_cpufreq_ctx_switch(struct rq *rq)
  4889	{
  4890		if (unlikely(current->sched_class == &stop_sched_class))
  4891			return;
  4892	
  4893		if (unlikely(current->sched_class == &idle_sched_class))
  4894			return;
  4895	
  4896		if (unlikely(task_has_idle_policy(current)))
  4897			return;
  4898	
  4899		if (likely(fair_policy(current->policy))) {
  4900			unsigned long uclamp_min, uclamp_max;
  4901			unsigned long rq_util;
  4902	
  4903			/*
  4904			 * Allow cpufreq updates once for every update_load_avg() decay.
  4905			 */
  4906			if (unlikely(rq->cfs.decayed)) {
  4907				rq->cfs.decayed = false;
  4908				goto force_update;
  4909			}
  4910	
  4911			if (unlikely(current->in_iowait))
  4912				goto force_update;
  4913	
> 4914			if (__ignore_task_perf(current))
  4915				return;
  4916	
  4917			/* Force an update if perf hints are required to be applied */
> 4918			uclamp_min = __uclamp_eff_value(current, UCLAMP_MIN);
  4919			uclamp_max = __uclamp_eff_value(current, UCLAMP_MAX);
  4920			rq_util = rq->cfs.avg.util_avg;
  4921	
  4922			if (uclamp_min > rq_util || uclamp_max < rq_util)
  4923				goto force_update;
  4924	
  4925			return;
  4926		}
  4927	
  4928		/* RT and DL should always send a freq update */
  4929	
  4930		/* XXX ignore updates for sugov worker thread */
  4931	
  4932	force_update:
  4933	
  4934		/*
  4935		 * Request freq update after __balance_callbacks to take into account
  4936		 * any changes to rq.
  4937		 */
  4938		cpufreq_update_util(rq, 0);
  4939	}
  4940	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
