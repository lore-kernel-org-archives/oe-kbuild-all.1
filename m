Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0D7ECC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jul 2024 02:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722132784; cv=none; b=swrmHi9L3mbqqxv5ZHwgufZlUvRVL3C5Oh8lbdWnxe1QbVXBwP3nUnLW/scR1S33fRHssX4CrAv6IiyA/Z3tJWGFBx5zPVMr0VAsnajcuTdhw05vkYIOGtZbM7XdrsRoGWcjC+eNyQyp1thnbiE+ReGbeyfGyEr5XP3DiSVwgn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722132784; c=relaxed/simple;
	bh=X7fjn2OkAJ/8+lASO6fAEUwyrdCaY41RbfLl1n2gtaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A4xBQHTK9i0aFTFOXdQTAI0MP7vtmcIekOWb+UHzePNY0QUrq1MYcQ4fPGC8Z3ckRAbyzswH7ZaD9my22vb7+/P14KZI4uAUrwcgtqdB4joby4yLujoG5E8UaEmDzPX19d6pjYIyB9ALKiWK9icJc5XMznETej0m8aYOpqy4w8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ev8uG2e6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ev8uG2e6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722132782; x=1753668782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X7fjn2OkAJ/8+lASO6fAEUwyrdCaY41RbfLl1n2gtaI=;
  b=ev8uG2e6Lf4MDndDnxXrSzCgkXDuNe7P5+vVEeL4vD4wEsKC4tJ5S8S3
   ldDfj2testYKgY5tQBjVz/3nr5RoqoXW4Q7E2DHEo1a86yzQo/ZAVTAwl
   vwIYIQa5jeZVo6GFOsTxIdoBnPbM9MCZAuxs8OuGOf35hEpdG9JFpJF8J
   rN9gx/qURJK2Nq0KsE1x9vmoH0DOVRtVjO/IW9o5lNe1Ooc4N0Ug6pddC
   bO1JZs2uECwPhBqsCU7XQ0wW+CjGnaEgGFRb7WF3uKWkxPsimc9OtFW1l
   +o3Z/U/DKv92mpXIT4Qwxd50uXp2SADBcgGBtQMuCz5spMhnYkRPu8nDy
   A==;
X-CSE-ConnectionGUID: jkdHbPLeSceUM55w93+bbQ==
X-CSE-MsgGUID: CNb/W2UFS/CwwM0+Jw4MLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="20022854"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="20022854"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 19:12:50 -0700
X-CSE-ConnectionGUID: 2g52wDJQQQuGviIt2+DmRw==
X-CSE-MsgGUID: haLI7FyqSUuTfpml1EPRAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="57766766"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jul 2024 19:12:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXtOv-000qR6-2d;
	Sun, 28 Jul 2024 02:12:45 +0000
Date: Sun, 28 Jul 2024 10:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Song Zhang <zhangsong34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1889/10967] kernel/sched/fair.c:151:14: sparse:
 sparse: symbol 'sysctl_sched_prio_load_balance_enabled' was not declared.
 Should it be static?
Message-ID: <202407281041.HjAnBUAM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b4a0c4baeb5af802ab07bb35e874446f0389901f
commit: 89bf80a4d6d5ba852b9042480e0be23c2c4a628c [1889/10967] sched: Introduce priority load balance for qos scheduler
config: loongarch-randconfig-r112-20240728 (https://download.01.org/0day-ci/archive/20240728/202407281041.HjAnBUAM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240728/202407281041.HjAnBUAM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407281041.HjAnBUAM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:143:14: sparse: sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it be static?
   kernel/sched/fair.c:144:14: sparse: sparse: symbol 'sysctl_offline_wait_interval' was not declared. Should it be static?
>> kernel/sched/fair.c:151:14: sparse: sparse: symbol 'sysctl_sched_prio_load_balance_enabled' was not declared. Should it be static?
   kernel/sched/fair.c:1271:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1271:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1271:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12846:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12846:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12846:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5925:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5925:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5925:22: sparse:    struct task_struct *
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
   kernel/sched/fair.c:8763:13: sparse:     expected void *ptr
   kernel/sched/fair.c:8763:13: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8763:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8763:13: sparse:     expected void *ptr
   kernel/sched/fair.c:8763:13: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8763:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/fair.c:8763:13: sparse:     expected void *ptr
   kernel/sched/fair.c:8763:13: sparse:     got int [noderef] __percpu *
   kernel/sched/fair.c:8999:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8999:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8999:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:10040:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:10040:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:10040:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10677:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10677:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10677:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12118:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12118:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12118:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11775:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11775:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11775:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12214:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12214:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12214:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7214:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7214:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7214:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7220:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7220:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7220:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7227:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7227:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7227:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7235:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7235:17: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7235:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2312:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2312:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2312:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2148:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2148:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2148:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2148:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2148:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2148:25: sparse:    struct task_struct *

vim +/sysctl_sched_prio_load_balance_enabled +151 kernel/sched/fair.c

   149	
   150	#ifdef CONFIG_QOS_SCHED_PRIO_LB
 > 151	unsigned int sysctl_sched_prio_load_balance_enabled;
   152	#endif
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
