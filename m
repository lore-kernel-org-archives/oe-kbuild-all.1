Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FD04A23
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 06:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741501007; cv=none; b=nACQa2ZnF2+vQ02lE475OLrymhFsHXjjtr9DBgDJJx9jL+SqdHWjKvlfuoG3Bw+sgWeWsfw+T5RSUb93SwuKJFmFUOTNIzyX1A0Q5MoDCU+n5t0QCKNS4swsauUtsZYdTGhtwqUhMeVDu2V537K79hI5A23EalRvyB6t+4ULnaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741501007; c=relaxed/simple;
	bh=A32B+oaiKBXascspRv9z8MHjw4fg31+Omw116hpRf9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LRif0K/jSxJvIkRHvXn3Dpz4dv4FFSOyXuREWZvb9JzGpJcNl0wJ7JG3L/pTvlUSFL3ncu1A7lq/K7+eBEGWkEqpBJU9PGnvc9KiClKMm7bE8QHrrLKFYNAlaepA4FDtTx7jQymR99k+ck23qKe0YiISqCk+GC0YLII2sq4Nt2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhjNhkKa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhjNhkKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741501005; x=1773037005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A32B+oaiKBXascspRv9z8MHjw4fg31+Omw116hpRf9k=;
  b=RhjNhkKa0TgvvZnGPP/THNrL7OaILLlLUA0tn2obhL335N9oYMAg/Zfq
   5kyNtd0tEUOFpw4EgXQRLrtRxIsnjxoHiwnImfezENbktcxun7ZGJSVAW
   TSg5DPOY5/csAcNUcQ/V9usw95b6edccSJiKgGuXA8d01PxpglOwwPXdd
   ERHv0uDYQgKJeXdrDpH39LzGavOXlaefz7U6VRrK8Xyp0Q1Hfwse6movH
   ieKsbnXy0Ljgu0LEX0a/jIPANVSDVLjKOInMm6HKPEPIpNuJc96Hlxrmb
   K6PGmlb7GqYQuG0Zc5cNu7XxRyEsdrxJfH9uari0870BOU/RVGhDXqkdu
   g==;
X-CSE-ConnectionGUID: qIgZTOo3SxOrQOrQ3dJpFw==
X-CSE-MsgGUID: tmVFt5XDSLG0wx6hGaGShw==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="46426365"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="46426365"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 22:16:44 -0800
X-CSE-ConnectionGUID: wsLFChyjQZqRwsApDJXZXA==
X-CSE-MsgGUID: Or1dmfZpQ4qsBweBQyeGsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="119675707"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Mar 2025 22:16:44 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr9xp-0002lV-08;
	Sun, 09 Mar 2025 06:16:41 +0000
Date: Sun, 9 Mar 2025 14:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhao Wenhui <zhaowenhui8@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2007/2007] kernel/sched/fair.c:174:14: sparse:
 sparse: symbol 'sysctl_qos_level_weights' was not declared. Should it be
 static?
Message-ID: <202503091446.DwKr9tpK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   944ce05f6b83ba40c4382c6b90b7b94f529118d3
commit: 0b620bf6de24090878f77ca8c639759b8f1af8e7 [2007/2007] sched/fair: Introduce multiple qos level
config: x86_64-randconfig-r121-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091446.DwKr9tpK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091446.DwKr9tpK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091446.DwKr9tpK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:151:14: sparse: sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it be static?
   kernel/sched/fair.c:152:14: sparse: sparse: symbol 'sysctl_offline_wait_interval' was not declared. Should it be static?
>> kernel/sched/fair.c:174:14: sparse: sparse: symbol 'sysctl_qos_level_weights' was not declared. Should it be static?
   kernel/sched/fair.c:1310:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1310:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1310:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:3093:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/fair.c:3093:13: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:3093:13: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:13391:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13391:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13391:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5195:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5195:25: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/fair.c:5195:25: sparse:    struct sparsemask *
   kernel/sched/fair.c:5212:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5212:25: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/fair.c:5212:25: sparse:    struct sparsemask *
   kernel/sched/fair.c:13747:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:13747:25: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/fair.c:13747:25: sparse:    struct sparsemask *
   kernel/sched/fair.c:6071:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6071:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:6071:22: sparse:    struct task_struct *
   kernel/sched/fair.c:8196:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8196:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8196:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8511:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8511:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8511:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8623:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8623:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8623:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8969:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8969:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8969:22: sparse:    struct task_struct *
   kernel/sched/fair.c:9520:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9520:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:9520:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:10591:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:10591:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:10591:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:11228:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:11228:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:11228:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12669:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12669:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12669:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12326:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12326:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:12326:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12765:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12765:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12765:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:3039:9: sparse: sparse: context imbalance in 'task_numa_placement' - different lock contexts for basic block
   kernel/sched/fair.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/fair.c:7382:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7382:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7382:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7388:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7388:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7388:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7395:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7395:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7395:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7403:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7403:17: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7403:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2355:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2355:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2355:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2355:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2355:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2355:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2191:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2191:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2191:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2191:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2191:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2191:25: sparse:    struct task_struct *

vim +/sysctl_qos_level_weights +174 kernel/sched/fair.c

   173	
 > 174	unsigned int sysctl_qos_level_weights[5] = {
   175		QOS_LEVEL_WEIGHT_OFFLINE_EX,
   176		QOS_LEVEL_WEIGHT_OFFLINE,
   177		QOS_LEVEL_WEIGHT_ONLINE,
   178		QOS_LEVEL_WEIGHT_HIGH,
   179		QOS_LEVEL_WEIGHT_HIGH_EX,
   180	};
   181	static long qos_reweight(long shares, struct task_group *tg);
   182	#endif
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
