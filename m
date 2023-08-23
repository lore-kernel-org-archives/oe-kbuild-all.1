Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E88DA92F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 09:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692784605; x=1724320605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HqT7OzzDvK2rZLyHdEsPUSAi6l4hgL6Y0cwdE/HQfY4=;
  b=Mdf0J0zTs5+tv0mPldjXvb7LUiFm90VO8o4FffQEk/X+fY8+0IGGRDtZ
   h62e42jfMQ7Acnc3CeC527GeVjLRiNTRrsCRTslUhr8v12zaM452dZVRI
   p0uGICAIog0IY86nK3iGjNwv2y/gy1dNVrf/QAP151gdGoX5jZggVxB2i
   TRKgwIey8xg4osPTrHuixMuPbOUIkNaWYqEZ1KRV9mblo7Mt20K8MHQla
   AvAJiwTNpcR5U9/TExBqUTqAtGVN+oeByvXIIPhE8Z0XuzVf0wGDNMPcZ
   KrwkJu0qCNQDTXZ/xyeKSvg0S8jPItcLP4qV+/ywDXB5Yb86RZzivlYDr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="371531429"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="371531429"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 02:56:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="806634493"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="806634493"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 23 Aug 2023 02:56:43 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYkbS-000158-1a;
	Wed, 23 Aug 2023 09:56:42 +0000
Date: Wed, 23 Aug 2023 17:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:remove-margins 9/9]
 kernel/sched/cpufreq_schedutil.c:67:29: error: implicit declaration of
 function 'capacityh_orig_of'; did you mean 'capacity_orig_of'?
Message-ID: <202308231755.ZM4BmTTF-lkp@intel.com>
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
commit: 4a7dcd9f6eb733cd9a63222583591193d675dc0a [9/9] sched/schedutil: Add a new tunnable to dictate response time
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230823/202308231755.ZM4BmTTF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231755.ZM4BmTTF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231755.ZM4BmTTF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:69:
   kernel/sched/cpufreq_schedutil.c: In function 'sugov_calc_freq_response_us':
>> kernel/sched/cpufreq_schedutil.c:67:29: error: implicit declaration of function 'capacityh_orig_of'; did you mean 'capacity_orig_of'? [-Werror=implicit-function-declaration]
      67 |         unsigned long cap = capacityh_orig_of(cpu);
         |                             ^~~~~~~~~~~~~~~~~
         |                             capacity_orig_of
   kernel/sched/cpufreq_schedutil.c: In function 'sugov_apply_response_time':
>> kernel/sched/cpufreq_schedutil.c:97:15: error: expected expression before '/' token
      97 |         mult =/ sg_policy->tunables->response_time_us;
         |               ^
   kernel/sched/cpufreq_schedutil.c: In function 'response_time_us_store':
   kernel/sched/cpufreq_schedutil.c:597:13: warning: unused variable 'cpu' [-Wunused-variable]
     597 |         int cpu;
         |             ^~~
   kernel/sched/cpufreq_schedutil.c:595:30: warning: unused variable 'sg_policy' [-Wunused-variable]
     595 |         struct sugov_policy *sg_policy;
         |                              ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +67 kernel/sched/cpufreq_schedutil.c

    63	
    64	static inline u64 sugov_calc_freq_response_us(struct sugov_policy *sg_policy)
    65	{
    66		int cpu = cpumask_first(sg_policy->policy->cpus);
  > 67		unsigned long cap = capacityh_orig_of(cpu);
    68	
    69		return approximate_runtime(cap);
    70	}
    71	
    72	/*
    73	 * Shrink or expand how long it takes to reach the maximum performance of the
    74	 * policy.
    75	 *
    76	 * sg_policy->freq_response_time_us is a constant value defined by PELT
    77	 * HALFLIFE and the capacity of the policy (assuming HMP systems).
    78	 *
    79	 * sg_policy->tunables->response_time_us is a user defined response time. By
    80	 * setting it lower than sg_polichy->freq_response_time_us, the system will
    81	 * respond fater to changes in util, which will result in reach maximum
    82	 * performance point faster. By setting it higher, it'll slow down the amount
    83	 * of time required to reach the maximum OPP.
    84	 *
    85	 * This should be applied when selecting the frequency. By default no
    86	 * conversion is done and we should return util as-is.
    87	 */
    88	static inline unsigned long
    89	sugov_apply_response_time(struct sugov_policy *sg_policy, unsigned long util)
    90	{
    91		unsigned long mult;
    92	
    93		if (sg_policy->freq_response_time_us == sg_policy->tunables->response_time_us)
    94			return util;
    95	
    96		mult = sg_policy->freq_response_time_us * SCHED_CAPACITY_SCALE;
  > 97		mult =/	sg_policy->tunables->response_time_us;
    98		mult *= util;
    99	
   100		return mult >> SCHED_CAPACITY_SHIFT;
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
