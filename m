Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5928BEBE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 22:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FxLDK/dw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702334651; x=1733870651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w5XunGIJBEL2TTf8nbIqTbzQlZj1ORAEIw0uFdSJyTs=;
  b=FxLDK/dw3vodrYq1cAhJW59OfAksR4fh4sjOevpmSe0EjdEzPchKvcwF
   QK4judttNT16frlBq9AfIbZYDTdSNTAFKwoJ0xQRLj3hUp1YUybLcdALe
   AtSN3D6pPkdOm43iy4qoNheff6NETrF6l+s1o3cGaP9BMFcgZNwVcTQnX
   MO1Yw01dv7JNgFNKTKdC3AvnZ/HCj0eJoDSm0RNXVRpExQsf+I/hagqXB
   GnSz5+C2d0RVtt1hVxPIJwaBaXESnMMj25bIe3uOjWhZMc3ebbEl0Zxjj
   1yMXyKFx2EaPtd/7skFyVWJ8a59Ty8S/7SkM4DXVwriHezBzw6NPF6SNc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="374878469"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="374878469"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 14:44:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="21261077"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 11 Dec 2023 14:44:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCp0Q-000IXW-0V;
	Mon, 11 Dec 2023 22:44:06 +0000
Date: Tue, 12 Dec 2023 06:44:05 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 7/12]
 kernel/sched/cpufreq_schedutil.c:11:1: sparse: sparse: symbol
 'response_time_mult' was not declared. Should it be static?
Message-ID: <202312120650.RQasNry7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   4489ba9b2ba5ce1cf9caa0e13f7b3bdf14dbb83f
commit: 3d803d07795740e3f0c18046d900f2a84b5473a3 [7/12] sched/schedutil: Add a new tunable to dictate response time
config: x86_64-randconfig-121-20231212 (https://download.01.org/0day-ci/archive/20231212/202312120650.RQasNry7-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312120650.RQasNry7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312120650.RQasNry7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_utility.c: note: in included file:
>> kernel/sched/cpufreq_schedutil.c:11:1: sparse: sparse: symbol 'response_time_mult' was not declared. Should it be static?
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/debug.c:468:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/debug.c:468:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/debug.c:468:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/debug.c:793:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:793:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:793:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/debug.c:793:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:793:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:793:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/stats.c:148:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/stats.c:148:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/stats.c:148:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/topology.c:107:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:107:56: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:107:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:126:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:126:60: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:126:60: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:149:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:149:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:149:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:455:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_domain *[assigned] tmp @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:455:13: sparse:     expected struct perf_domain *[assigned] tmp
   kernel/sched/topology.c:455:13: sparse:     got struct perf_domain [noderef] __rcu *pd
   kernel/sched/topology.c:464:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_domain *[assigned] tmp @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:464:13: sparse:     expected struct perf_domain *[assigned] tmp
   kernel/sched/topology.c:464:13: sparse:     got struct perf_domain [noderef] __rcu *pd
   kernel/sched/topology.c:485:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct perf_domain *[assigned] pd @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:485:19: sparse:     expected struct perf_domain *[assigned] pd
   kernel/sched/topology.c:485:19: sparse:     got struct perf_domain [noderef] __rcu *pd
   kernel/sched/topology.c:647:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:647:49: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:647:49: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:732:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:732:50: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:732:50: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:740:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:740:55: sparse:     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child
   kernel/sched/topology.c:740:55: sparse:     got struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:753:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:753:29: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:753:29: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:758:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:758:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:758:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:779:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:779:13: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:779:13: sparse:     got struct sched_domain [noderef] __rcu *sd
   kernel/sched/topology.c:941:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:941:70: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:941:70: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:970:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:970:59: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:970:59: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1016:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1016:57: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1016:57: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1018:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1018:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1018:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1026:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1026:55: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1026:55: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1028:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1028:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1028:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1098:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1098:62: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1098:62: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1202:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1202:40: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:1202:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1622:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1622:43: sparse:     expected struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1622:43: sparse:     got struct sched_domain *child
   kernel/sched/topology.c:2321:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2321:31: sparse:     expected struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2321:31: sparse:     got struct sched_domain *sd
   kernel/sched/topology.c:2425:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2425:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2425:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2446:56: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:2446:56: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:2446:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:2445:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2445:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2445:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2500:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2500:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2500:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/core_sched.c:276:37: sparse: sparse: incompatible types in conditional expression (different address spaces):
   kernel/sched/core_sched.c:276:37: sparse:    struct task_struct *
   kernel/sched/core_sched.c:276:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/build_utility.c: note: in included file:

vim +/response_time_mult +11 kernel/sched/cpufreq_schedutil.c

    10	
  > 11	DEFINE_PER_CPU_READ_MOSTLY(unsigned long, response_time_mult);
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
