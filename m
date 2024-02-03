Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B7E5D728
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 11:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706958476; cv=none; b=c51hUSjBWB5YYqTLA5lFYWq126XNr45PJrxEj7lDxuAFfQtXUYces0gbLIdBrSbTAx7Kas7ZRu3+pBskW9yUTY0zdfUqUXMhF15Tcq+FzPOR66UF+Z4ehVUpw14aYLaqzTJS78w55vUNL8y7zXyOlDAvbRpIyj8iMZJL1ijof04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706958476; c=relaxed/simple;
	bh=fzoWHBsc4qRKprufNKiYrHa6fSp2NMcfp1M2qsMV/1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pnYQzl2FNPFnOS5dR5hq7/WHUWVojvA1/EROR9+VlVhraA+iESy3TQGlYuCwqF/od/6ojmQkoseR4pK08SXGGk9d/SyW8dtH+KDsFy6qgPpTkoBFq9QwCq+dYmEyg1iJuc+vjBpmbhKv3p9fZCVAU12W/DE6fM6JlJgKEDJlgbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8Uag08t; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8Uag08t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706958475; x=1738494475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fzoWHBsc4qRKprufNKiYrHa6fSp2NMcfp1M2qsMV/1g=;
  b=Y8Uag08t/79a3YNn3x2KBPuLJLQPkP/3fP1x4rKSoQdITrsvaArTlQGM
   Z1ZuFHxnL2XHVSpjprAuK3gyirFBcKhO2dbKlnWNNoJHf4WcvJ4qzE6yv
   wGidkdeIGs0tj5rWim9qw5cSb0dzF259eQNTLLD31FSBQ3Ac1Izfwdd5B
   Ce6du0/QJfcPSyNyp4+5xDVwv6IG9Id0ExJveWkSKqJloXyEPhhl9GOMs
   03HebEOx5LMIDfKLQxoc/UFgw8WZVtqAASpotDprUaQMEAV5lScl1KvN/
   vZKsXLCszvSSo1A12DgWBiuTDwnK1HhzpI5bkXuQ9mkDP+cCRrBulBYYO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="22781716"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="22781716"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 03:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="31393480"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Feb 2024 03:07:52 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWDsE-0004xW-1U;
	Sat, 03 Feb 2024 11:07:50 +0000
Date: Sat, 3 Feb 2024 19:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:improve-sched-cpufreq-interaction 1/1]
 kernel/sched/core.c:5129:36: error: 'cpufreq_update_enabled' undeclared; did
 you mean 'cpufreq_boost_enabled'?
Message-ID: <202402031907.7fDaITAG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux improve-sched-cpufreq-interaction
head:   787874f453b03230a3fcde689b1c6b68355e2f40
commit: 787874f453b03230a3fcde689b1c6b68355e2f40 [1/1] sched: Consolidate cpufreq updates
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240203/202402031907.7fDaITAG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402031907.7fDaITAG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402031907.7fDaITAG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
   kernel/sched/core.c: In function 'update_cpufreq_ctx_switch':
>> kernel/sched/core.c:5129:36: error: 'cpufreq_update_enabled' undeclared (first use in this function); did you mean 'cpufreq_boost_enabled'?
    5129 |         if (!static_branch_likely(&cpufreq_update_enabled))
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/jump_label.h:508:41: note: in expansion of macro 'likely_notrace'
     508 | #define static_branch_likely(x)         likely_notrace(static_key_enabled(&(x)->key))
         |                                         ^~~~~~~~~~~~~~
   include/linux/jump_label.h:508:56: note: in expansion of macro 'static_key_enabled'
     508 | #define static_branch_likely(x)         likely_notrace(static_key_enabled(&(x)->key))
         |                                                        ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5129:14: note: in expansion of macro 'static_branch_likely'
    5129 |         if (!static_branch_likely(&cpufreq_update_enabled))
         |              ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5129:36: note: each undeclared identifier is reported only once for each function it appears in
    5129 |         if (!static_branch_likely(&cpufreq_update_enabled))
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/jump_label.h:508:41: note: in expansion of macro 'likely_notrace'
     508 | #define static_branch_likely(x)         likely_notrace(static_key_enabled(&(x)->key))
         |                                         ^~~~~~~~~~~~~~
   include/linux/jump_label.h:508:56: note: in expansion of macro 'static_key_enabled'
     508 | #define static_branch_likely(x)         likely_notrace(static_key_enabled(&(x)->key))
         |                                                        ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5129:14: note: in expansion of macro 'static_branch_likely'
    5129 |         if (!static_branch_likely(&cpufreq_update_enabled))
         |              ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5146:37: error: 'struct cfs_rq' has no member named 'decayed'
    5146 |                 if (unlikely(rq->cfs.decayed)) {
         |                                     ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/sched/core.c:5147:32: error: 'struct cfs_rq' has no member named 'decayed'
    5147 |                         rq->cfs.decayed = false;
         |                                ^


vim +5129 kernel/sched/core.c

  5126	
  5127	static inline void update_cpufreq_ctx_switch(struct rq *rq)
  5128	{
> 5129		if (!static_branch_likely(&cpufreq_update_enabled))
  5130			return;
  5131	
  5132		if (unlikely(current->sched_class == &stop_sched_class))
  5133			return;
  5134	
  5135		if (unlikely(current->sched_class == &idle_sched_class))
  5136			return;
  5137	
  5138		if (unlikely(task_has_idle_policy(current)))
  5139			return;
  5140	
  5141		if (likely(fair_policy(current->policy))) {
  5142	
  5143			/*
  5144			 * Allow cpufreq updates once for every update_load_avg() decay.
  5145			 */
  5146			if (unlikely(rq->cfs.decayed)) {
  5147				rq->cfs.decayed = false;
  5148				goto force_update;
  5149			}
  5150	
  5151			if (unlikely(current->in_iowait))
  5152				goto force_update;
  5153	
  5154			return;
  5155		}
  5156	
  5157		/* RT and DL should always send a freq update */
  5158	
  5159		/* XXX ignore updates for sugov worker thread */
  5160	
  5161	force_update:
  5162	
  5163		/*
  5164		 * Request freq update after __balance_callbacks to take into account
  5165		 * any changes to rq.
  5166		 */
  5167		cpufreq_update_util(rq, current->in_iowait ? SCHED_CPUFREQ_IOWAIT : 0);
  5168	}
  5169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
