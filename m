Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A02723645D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 02:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765419812; cv=none; b=AqWEFZGjfzZAmWh0pusKj/hUHEdrWUAOzBuHXFUfHFet92izJlifH3DN+C5TYrr0GoztWjVRI4IE0ai8UsnGAbYVIIBtE3zNg3ATfJxhKM4f3XKmCPZG8k2yeQryDAVvLY/GfeGlaAM43ChaXVvqSfdSzj3YfEWj/aXZaIhyVhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765419812; c=relaxed/simple;
	bh=V2PFZBK62eQEcgjX6qHB4wBIaoXbeSMNn1iRNnhhKBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fC/rQ1wfaTq2oVZrdihacMUr6YtM9kYV8jON12dr62nh9VBoH/DxU6pC96g208np7fyG4vsCZu0IdVp3ixeABMHbJymx69xpL5IVJwdCOVzmIU5uB07umZdSJ1NZjfSJW8QyEXbASh4LE1EuEfprf15cjwKKDmbXTtV7Ps6XStc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNdv9cxC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNdv9cxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765419811; x=1796955811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V2PFZBK62eQEcgjX6qHB4wBIaoXbeSMNn1iRNnhhKBw=;
  b=KNdv9cxCF3qHlIAWjq9RVxZMVP20oVL14nQIgyxlLPVchICIYixgwegM
   ODkEqdrkcAe1P6Z7f/aGT95+xrp0HwdFl6Y9gObX+CMMjy5pdqDqxkeVw
   ekDCujtAe6EfhN8x4AYmfDEpczv17nB9oqrC745/ZfPw2qig/LnbToQt1
   2QTTImDoJ+mXrGovqZ1Jg41XSGmoaYd+j37BoCXLncBPJ2mzV7NXX9MA2
   ldZNzz5ICuMoQexF6Sj3mSXegfCCAwZMO5Y/Z9N+P4nGgFpFMk3LaIMsv
   ZBRVdnRkZSt4njfeVTiICT9rSAUSzLKEYB3/i/o5+bsuEBuX2wgsxf6SM
   A==;
X-CSE-ConnectionGUID: MREesrbDQJmvExtjdsSPwg==
X-CSE-MsgGUID: +em7BDAUT6izwCoSzFJgGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="69984961"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="69984961"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:23:27 -0800
X-CSE-ConnectionGUID: bBuvsyWgQfCGRV71uXqPFQ==
X-CSE-MsgGUID: eAuV7X6kTvexqdb9atbBBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="197487212"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Dec 2025 18:23:27 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTWKy-0000000041j-2oNG;
	Thu, 11 Dec 2025 02:23:24 +0000
Date: Thu, 11 Dec 2025 10:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 5/5]
 kernel/sched/group_balancer.c:85:23: warning: no previous prototype for
 'cpu_llc_mask'
Message-ID: <202512111035.2qGMINai-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   38743d2d77ee27e7fe97c7ef81b8643365903536
commit: 8d2734694d5524c7d1f68d2548ebb06984b973d5 [5/5] anolis: sched: introduce group balancer sched domain
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251211/202512111035.2qGMINai-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111035.2qGMINai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111035.2qGMINai-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/group_balancer.c:85:23: warning: no previous prototype for 'cpu_llc_mask' [-Wmissing-prototypes]
      85 | const struct cpumask *cpu_llc_mask(int cpu)
         |                       ^~~~~~~~~~~~
   kernel/sched/group_balancer.c:92:23: warning: no previous prototype for 'cpu_die_mask' [-Wmissing-prototypes]
      92 | const struct cpumask *cpu_die_mask(int cpu)
         |                       ^~~~~~~~~~~~
>> kernel/sched/group_balancer.c:97:23: warning: no previous prototype for 'cpu_core_mask' [-Wmissing-prototypes]
      97 | const struct cpumask *cpu_core_mask(int cpu)
         |                       ^~~~~~~~~~~~~
>> kernel/sched/group_balancer.c:102:23: warning: no previous prototype for 'cpu_root_mask' [-Wmissing-prototypes]
     102 | const struct cpumask *cpu_root_mask(int cpu)
         |                       ^~~~~~~~~~~~~
>> kernel/sched/group_balancer.c:513:6: warning: no previous prototype for 'sched_init_group_balancer_levels' [-Wmissing-prototypes]
     513 | void sched_init_group_balancer_levels(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cpu_llc_mask +85 kernel/sched/group_balancer.c

    84	
  > 85	const struct cpumask *cpu_llc_mask(int cpu)
    86	{
    87		struct sched_domain *llc = rcu_dereference(per_cpu(sd_llc, cpu));
    88	
    89		return (const struct cpumask *)to_cpumask(llc->span);
    90	}
    91	
    92	const struct cpumask *cpu_die_mask(int cpu)
    93	{
    94		return topology_die_cpumask(cpu);
    95	}
    96	
  > 97	const struct cpumask *cpu_core_mask(int cpu)
    98	{
    99		return topology_core_cpumask(cpu);
   100	}
   101	
 > 102	const struct cpumask *cpu_root_mask(int cpu)
   103	{
   104		return (const struct cpumask *)&root_cpumask;
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
