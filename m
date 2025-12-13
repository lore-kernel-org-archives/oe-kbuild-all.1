Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B8554763
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 03:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765594918; cv=none; b=Mzdt4DRFvss/8o18DNQ6B3yj0D+vV2OXMBL7I+lJhMS7rRa4cFeFf+qiSoFez1GAyRbmhiocrT9E8IPJS9PttxDVgtoQVLjI/x4sivwDoab+TmKmfbk8GLHoB+wV/jgfSYHw5G+Vc8K7DSYptY0jMhuQtIUz5F/5N3zLz8NXYA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765594918; c=relaxed/simple;
	bh=dEJjb81zzQXjjjju41IuJJnx5MytTHqlxpO0PNG+BlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hJieWHKO4+H5c7qgwto4ExgzhV9AlXXNsJvF6okYooNkDZaT0xarLdc5vr0azANECZi/dLdQq54ZozGBuNnQJSDCeKQ2nWJBg5ZeWMA33k+WXdLQs7SpztNWggRgZIDWymc8PbaU8iaqtCjXEWE/fdJRLsYYcbuYgw/B/G22qdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NxGKYGNq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NxGKYGNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765594916; x=1797130916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dEJjb81zzQXjjjju41IuJJnx5MytTHqlxpO0PNG+BlE=;
  b=NxGKYGNqFVlUpTPYHHCHdKyfm4ol4zT4J9wrCppOlPbt+k7vTNgwgd3+
   Lnk3/6MyrUB7IRAy9Ui4JOAQvhyNkkiw5HC8QS0R/ZNOCTSF2nbLJ60aq
   BXFlkmXe68L62r2OhamPqZoQJqx2AK3grgFabMh/npAfhyZ0+OeJ11zel
   c91HpwytQVjxRZrg2o9jTU+b5AaO12q7CykFv27mbRAtQDDjcDLuNhISG
   UvbDhqgaGKTj8hVFtU5MAFmbXDzlUuFv6UmLG6vq0UYNEmnSIdkZ0pSSS
   Puo7NS2LUR3aLRvvz6vxFDsocjF0YNGqa/AyaOyTnfIQPUisBaU5S1ewW
   A==;
X-CSE-ConnectionGUID: L1gXS6/sQ7qCMOfVPDbkGg==
X-CSE-MsgGUID: 93MPtENLR8a4/lWZIRx/MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85190237"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85190237"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 19:01:54 -0800
X-CSE-ConnectionGUID: DBYABAEQQ2Ci7y1n/t244w==
X-CSE-MsgGUID: eBzMxyZ8TR2Rb3+yphw6Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="202165874"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 19:01:53 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUFtG-000000006y9-4BGT;
	Sat, 13 Dec 2025 03:01:50 +0000
Date: Sat, 13 Dec 2025 11:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 kernel/power/energy_model.c:431:15: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202512131141.NbHQZ5sx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: 3a759c5665716db18607b0419f8b29b977140a28 [0/1] UPSTREAM: PM: EM: Remove old table
config: x86_64-randconfig-121-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131141.NbHQZ5sx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131141.NbHQZ5sx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131141.NbHQZ5sx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/power/energy_model.c:168:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got struct em_perf_table * @@
   kernel/power/energy_model.c:168:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:168:15: sparse:     got struct em_perf_table *
   kernel/power/energy_model.c:169:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct em_perf_table [noderef] __rcu *table @@
   kernel/power/energy_model.c:169:15: sparse:     expected void const *objp
   kernel/power/energy_model.c:169:15: sparse:     got struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:177:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got struct em_perf_table * @@
   kernel/power/energy_model.c:177:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:177:15: sparse:     got struct em_perf_table *
   kernel/power/energy_model.c:179:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] __rcu * @@
   kernel/power/energy_model.c:179:19: sparse:     expected struct callback_head *head
   kernel/power/energy_model.c:179:19: sparse:     got struct callback_head [noderef] __rcu *
   kernel/power/energy_model.c:190:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:190:19: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:190:19: sparse:     got struct kref [noderef] __rcu *
   kernel/power/energy_model.c:208:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got void * @@
   kernel/power/energy_model.c:208:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:208:15: sparse:     got void *
   kernel/power/energy_model.c:212:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:212:20: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:212:20: sparse:     got struct kref [noderef] __rcu *
   kernel/power/energy_model.c:309:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:309:19: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:309:19: sparse:     got struct kref [noderef] __rcu *
   kernel/power/energy_model.c:314:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct em_perf_state *table @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:314:45: sparse:     expected struct em_perf_state *table
   kernel/power/energy_model.c:314:45: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:414:45: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct em_perf_state *table @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:414:45: sparse:     expected struct em_perf_state *table
   kernel/power/energy_model.c:414:45: sparse:     got struct em_perf_state [noderef] __rcu *
>> kernel/power/energy_model.c:431:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct em_perf_table [noderef] __rcu *[assigned] em_table @@
   kernel/power/energy_model.c:431:15: sparse:     expected void const *objp
   kernel/power/energy_model.c:431:15: sparse:     got struct em_perf_table [noderef] __rcu *[assigned] em_table
   kernel/power/energy_model.c:602:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct em_perf_state *table @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:602:55: sparse:     expected struct em_perf_state *table
   kernel/power/energy_model.c:602:55: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:665:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_state *new_ps @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:665:16: sparse:     expected struct em_perf_state *new_ps
   kernel/power/energy_model.c:665:16: sparse:     got struct em_perf_state [noderef] __rcu *

vim +431 kernel/power/energy_model.c

   378	
   379	static int em_create_pd(struct device *dev, int nr_states,
   380				struct em_data_callback *cb, cpumask_t *cpus,
   381				unsigned long flags)
   382	{
   383		struct em_perf_table __rcu *em_table;
   384		struct em_perf_domain *pd;
   385		struct device *cpu_dev;
   386		int cpu, ret, num_cpus;
   387	
   388		if (_is_cpu_device(dev)) {
   389			num_cpus = cpumask_weight(cpus);
   390	
   391			/* Prevent max possible energy calculation to not overflow */
   392			if (num_cpus > EM_MAX_NUM_CPUS) {
   393				dev_err(dev, "EM: too many CPUs, overflow possible\n");
   394				return -EINVAL;
   395			}
   396	
   397			pd = kzalloc(sizeof(*pd) + cpumask_size(), GFP_KERNEL);
   398			if (!pd)
   399				return -ENOMEM;
   400	
   401			cpumask_copy(em_span_cpus(pd), cpus);
   402		} else {
   403			pd = kzalloc(sizeof(*pd), GFP_KERNEL);
   404			if (!pd)
   405				return -ENOMEM;
   406		}
   407	
   408		pd->nr_perf_states = nr_states;
   409	
   410		em_table = em_table_alloc(pd);
   411		if (!em_table)
   412			goto free_pd;
   413	
   414		ret = em_create_perf_table(dev, pd, em_table->state, cb, flags);
   415		if (ret)
   416			goto free_pd_table;
   417	
   418		rcu_assign_pointer(pd->em_table, em_table);
   419	
   420		if (_is_cpu_device(dev))
   421			for_each_cpu(cpu, cpus) {
   422				cpu_dev = get_cpu_device(cpu);
   423				cpu_dev->em_pd = pd;
   424			}
   425	
   426		dev->em_pd = pd;
   427	
   428		return 0;
   429	
   430	free_pd_table:
 > 431		kfree(em_table);
   432	free_pd:
   433		kfree(pd);
   434		return -EINVAL;
   435	}
   436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
