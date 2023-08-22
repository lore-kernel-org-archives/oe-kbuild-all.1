Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DFF10E9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 01:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692667931; x=1724203931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3XvLaxfsBDEOkiN5U7SkXijgd4M4ZZ342YI7VqrxORs=;
  b=dW6wKEgKsedW5dFxkE7xOV+ciNxyavxAnPVcFD/PZ4BOp+JD2Pe5hcGa
   lcwhybckzeGor7PO4wR1D/yRfiUtecBzWGKaUFhg9pphSsjgDkscOI2n1
   eTrnhtmQZg2yksUmcCXVZRczeXfy/W3M6DGYBVxriyaiLYTQFjSc2lYU8
   4RXtnDie/L8+q9XIQRR0+zJxgub6AfTWvt9b2fmowEi34kK9+RUwhaz1f
   m7e6pDXxekynQqm7RBHEs8DssDcdvFGqIiA4CWEinZR74Ow7wgd7+NQrx
   FD8GgH9Bk85NZra589VF1HECkJ+tDqGXxosezYD9FUF5R8ZiemdMlUdS4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="358739366"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="358739366"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 18:32:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="729631011"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="729631011"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Aug 2023 18:32:09 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYGFO-0001A3-04;
	Tue, 22 Aug 2023 01:31:56 +0000
Date: Tue, 22 Aug 2023 09:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:remove-margins 9/9]
 kernel/sched/cpufreq_schedutil.c:69: undefined reference to
 `approximate_runtime'
Message-ID: <202308220932.XhFtusrh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux remove-margins
head:   c33dc1443a3c5aebf846a5b6ea54b0cc8a2dc90f
commit: c33dc1443a3c5aebf846a5b6ea54b0cc8a2dc90f [9/9] sched/schedutil: Add a new tunnable to dictate response time
config: i386-randconfig-003-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220932.XhFtusrh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220932.XhFtusrh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220932.XhFtusrh-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/sched/core.o: in function `apply_dvfs_headroom':
   kernel/sched/sched.h:3027: undefined reference to `approximate_util_avg'
   ld: kernel/sched/fair.o: in function `fits_capacity':
   kernel/sched/fair.c:127: undefined reference to `approximate_util_avg'
   ld: kernel/sched/build_utility.o: in function `sugov_calc_freq_response_us':
>> kernel/sched/cpufreq_schedutil.c:69: undefined reference to `approximate_runtime'


vim +69 kernel/sched/cpufreq_schedutil.c

    63	
    64	static inline u64 sugov_calc_freq_response_us(struct sugov_policy *sg_policy)
    65	{
    66		int cpu = cpumask_first(sg_policy->policy->cpus);
    67		unsigned long cap = capacity_orig_of(cpu);
    68	
  > 69		return approximate_runtime(cap);
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
