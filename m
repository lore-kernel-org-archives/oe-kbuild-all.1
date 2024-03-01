Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EDA69D23
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709281980; cv=none; b=XBqphxGAqnHfxcFx0kBfFDhJcc7yx+5gIXZw3c4pNZDuXbiGXjTSj5CuykZjdP3vNTRqC+iN9U2cHI8O2/lZg8yelerdL18bdPIdvfgPNgSzYVxcrz8x1WGR0sPKMKYVEf7aIXqkpl3Yoon3YM0yvBC4haT2PooeWfHMFk0tkEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709281980; c=relaxed/simple;
	bh=slUj0GYA5VCixoSZUqcCiYYNJzR2IKn3fOrV7YvW7HM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IhbZLzqIJWkCjeO7BRROWJKxK7pUHIJkPhUkWIJuI+uBZ7uEmMn4+I4Qb6MAZkrJ+clSbMHxsYYGG3dJHfXmGisXF++qsUWSMqWZapfUUfNgRP783ba9Qe44ShK0YK5g3rXQOHqIaabJVFTcPZJdJziem7JINZh8tru8ssPQ7RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7wmyjqd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7wmyjqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709281978; x=1740817978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=slUj0GYA5VCixoSZUqcCiYYNJzR2IKn3fOrV7YvW7HM=;
  b=C7wmyjqdFJLA37f9fuLtavi4OZaooLjbkcFcGZ4O4VmGGzb2/q+ckd02
   dbep/ZFSzL5fqAokrLZ/G8dVsb/LCNstDK35Q70Ylpuf/MOfy78VXGAko
   Wbc4iqyU/92EBf79Ro2jdZ8pLximcty3JUhECBvpHksc2X0seA/X9XGeY
   QWaDCQHSER+el9JNtU9tIYQNm0oW4dDzFT3AVLKPHbJjz5GmBDo7iIDto
   9dWtpzCk2XAUKv3sqZLLgWvoThkWXu4hV9L37hGoh9tyripBYG7ima6Cp
   GDwAtQobgvjGzXaEWggIzffE8xYxcehIKDi9YEF6kLJtutLBrBZ0GkhnH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14446981"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="14446981"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 00:32:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8062250"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Mar 2024 00:32:55 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfyK3-000Dff-1q;
	Fri, 01 Mar 2024 08:32:51 +0000
Date: Fri, 1 Mar 2024 16:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuan Can <yuancan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1683/3700] mm/memcontrol.c:3147:6: sparse:
 sparse: symbol 'hisi_oom_recover' was not declared. Should it be static?
Message-ID: <202403011613.m2fhHDHp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7f1397339b784f46c104e2e1257952c885c84128
commit: b498d9f1bacd40d583c0970cab02ad522127a7e7 [1683/3700] arm64/ascend: Add new enable_oom_killer interface for oom contrl
config: arm64-randconfig-r111-20240227 (https://download.01.org/0day-ci/archive/20240301/202403011613.m2fhHDHp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240301/202403011613.m2fhHDHp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011613.m2fhHDHp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memcontrol.c:3147:6: sparse: sparse: symbol 'hisi_oom_recover' was not declared. Should it be static?
   mm/memcontrol.c:4228:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4228:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4228:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4230:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4230:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4230:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4386:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4386:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4386:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4480:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4480:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4480:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:6198:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:6198:23: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:6198:23: sparse:    struct task_struct *
   mm/memcontrol.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/memcontrol.c: note: in included file:
   include/linux/memcontrol.h:751:9: sparse: sparse: context imbalance in 'folio_lruvec_lock' - wrong count at exit
   include/linux/memcontrol.h:751:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irq' - wrong count at exit
   include/linux/memcontrol.h:751:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irqsave' - wrong count at exit
   mm/memcontrol.c:2111:6: sparse: sparse: context imbalance in 'folio_memcg_lock' - wrong count at exit
   mm/memcontrol.c:2158:17: sparse: sparse: context imbalance in '__folio_memcg_unlock' - unexpected unlock
   mm/memcontrol.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/memcontrol.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

vim +/hisi_oom_recover +3147 mm/memcontrol.c

  3145	
  3146	#ifdef CONFIG_ASCEND_OOM
> 3147	void hisi_oom_recover(struct obj_cgroup *objcg)
  3148	{
  3149		struct mem_cgroup *memcg;
  3150	
  3151		memcg = get_mem_cgroup_from_objcg(objcg);
  3152		if (!mem_cgroup_is_root(memcg))
  3153			memcg_oom_recover(memcg);
  3154		css_put(&memcg->css);
  3155	}
  3156	#else
  3157	static inline void hisi_oom_recover(struct obj_cgroup *objcg) { }
  3158	#endif
  3159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
