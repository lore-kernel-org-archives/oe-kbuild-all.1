Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C9020E334
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 23:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744327789; cv=none; b=ZfeO3oSABe6LEDUbvLV/a7EOdyHq4raZd0SrsDuM4ad3Bv0d0Sxz7A5p9eoZ5/BdIq6TNJ0pJiSqujHPklveW2DYUp0tbxK+zbz3+VFq7xoNe/entS5EUFpdwYT+01SJJ+kPWDaUCKsUHRZfPB7UJSuTvmQxFMMlzjCKYEkDW2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744327789; c=relaxed/simple;
	bh=+Plcb+fKbsEIwRWFZ981UXupQQIYBBt7V2FKwun/gGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WiE3C3kiqIyBEDLi/DLtg5XvPnA1xav0HIXPQFSrNXEm8wOptV/AMo9C5mdCToiXkwwifwYYGEgKemVP/XdLGbvGHgumSfnGzVYfuxdM3zKXpPpxIct5r3t5rlTOTm5fQjz4ElfhVhxFxgcz1vHQ8lNuKgabHSFJuwIAFINeRRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVV64jc5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVV64jc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744327787; x=1775863787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Plcb+fKbsEIwRWFZ981UXupQQIYBBt7V2FKwun/gGE=;
  b=LVV64jc5BLmwgZAw/pR1OYPidNKGPh+L5HLd90Ur5gSx9ky58mweNhWw
   GYOdBDit60kI6WQvwXLE11dEk1C6PffFAV5ygxMn78XkvkoalzuIOyI1P
   Kd4/j9EajwtBbCuZyFw0mW25zTCmGxzTZYUrWPq8Y+e1I42uQfUJf/0A2
   XzItimwKu22LAouhb6N5FopQBtYzdN5XokaxgPvRHnGMrVTKi9FTn2Bf9
   f/+9BBOyW11R0xrPwexTk2ZhO/kSC96QRALQo5ibek1xL9sASZkG23WYY
   l225n7vgRCxXO0N9RsUu/musfS+4ivn48viemWbNJJ1cev0K9TdmoKPx9
   g==;
X-CSE-ConnectionGUID: SIu2YgYkRwieChvPHz4BFA==
X-CSE-MsgGUID: GcwA/KEhTg68TvIST23KzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57253004"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="57253004"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 16:29:46 -0700
X-CSE-ConnectionGUID: NYi9gTidR6KlnUYpviVuXA==
X-CSE-MsgGUID: nENdoff6TVucGg6TTQLlBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="128996905"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Apr 2025 16:29:44 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u31L4-000AdM-0T;
	Thu, 10 Apr 2025 23:29:42 +0000
Date: Fri, 11 Apr 2025 07:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Song Zhang <zhangsong34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2117/2117] kernel/sched/fair.c:151:14: sparse:
 sparse: symbol 'sysctl_sched_prio_load_balance_enabled' was not declared.
 Should it be static?
Message-ID: <202504110741.FCO7H6rm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   62b846e657553d00552c1c71b6ecc26017eb1a9a
commit: 89bf80a4d6d5ba852b9042480e0be23c2c4a628c [2117/2117] sched: Introduce priority load balance for qos scheduler
config: loongarch-randconfig-r121-20250411 (https://download.01.org/0day-ci/archive/20250411/202504110741.FCO7H6rm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250411/202504110741.FCO7H6rm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504110741.FCO7H6rm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:143:14: sparse: sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it be static?
   kernel/sched/fair.c:144:14: sparse: sparse: symbol 'sysctl_offline_wait_interval' was not declared. Should it be static?
>> kernel/sched/fair.c:151:14: sparse: sparse: symbol 'sysctl_sched_prio_load_balance_enabled' was not declared. Should it be static?
   kernel/sched/fair.c:7578:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/fair.c:7578:9: sparse:     expected void *ptr
   kernel/sched/fair.c:7578:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/sched/fair.c:7578:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/fair.c:7578:9: sparse:     expected void *ptr
   kernel/sched/fair.c:7578:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/sched/fair.c:7578:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/fair.c:7578:9: sparse:     expected void *ptr
   kernel/sched/fair.c:7578:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/sched/fair.c:7578:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/fair.c:7578:9: sparse:     expected void *ptr
   kernel/sched/fair.c:7578:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/sched/fair.c:7578:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:7578:9: sparse:     expected void *ptr
   kernel/sched/fair.c:7578:9: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:7578:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:7578:9: sparse:     expected void *ptr
   kernel/sched/fair.c:7578:9: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:7578:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:7578:9: sparse:     expected void *ptr
   kernel/sched/fair.c:7578:9: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:7578:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:7578:9: sparse:     expected void *ptr
   kernel/sched/fair.c:7578:9: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:1271:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1271:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1271:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12846:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12846:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12846:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5925:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5925:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5925:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6667:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6667:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6667:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7396:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7396:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7396:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7396:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7396:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7396:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7396:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7396:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7396:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7396:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7396:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7396:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7499:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7499:16: sparse:     expected void *ptr
   kernel/sched/fair.c:7499:16: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7499:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7499:16: sparse:     expected void *ptr
   kernel/sched/fair.c:7499:16: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7499:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7499:16: sparse:     expected void *ptr
   kernel/sched/fair.c:7499:16: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7499:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7499:16: sparse:     expected void *ptr
   kernel/sched/fair.c:7499:16: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7974:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7974:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7974:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7974:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7974:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7974:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7974:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7974:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7974:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7974:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   kernel/sched/fair.c:7974:32: sparse:     expected void *ptr
   kernel/sched/fair.c:7974:32: sparse:     got struct cpumask *[noderef] __percpu *
   kernel/sched/fair.c:7998:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7998:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7998:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8310:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8310:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8310:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8421:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8421:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8421:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8641:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8641:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8641:22: sparse:    struct task_struct *
   kernel/sched/fair.c:8706:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8706:16: sparse:     expected void *ptr
   kernel/sched/fair.c:8706:16: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8706:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8706:16: sparse:     expected void *ptr
   kernel/sched/fair.c:8706:16: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8706:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8706:16: sparse:     expected void *ptr
   kernel/sched/fair.c:8706:16: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8706:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8706:16: sparse:     expected void *ptr
   kernel/sched/fair.c:8706:16: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8763:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8763:13: sparse:     expected void *ptr
   kernel/sched/fair.c:8763:13: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8763:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@

vim +/sysctl_sched_prio_load_balance_enabled +151 kernel/sched/fair.c

   149	
   150	#ifdef CONFIG_QOS_SCHED_PRIO_LB
 > 151	unsigned int sysctl_sched_prio_load_balance_enabled;
   152	#endif
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
