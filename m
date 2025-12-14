Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D324728FA9A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 23:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765753675; cv=none; b=hIPmrQkOgUwvZDS+jsN5luP3M1wiENieO+nrxBt29x0EQOuP6hap+iSZCeqkf3P0QpVYUh3wYbI3M+iqyIkiVSDQeYo+85vV9rOD6JI0NuGTGD6dp78GwcAJwobfzxgp+dWn4Asy604R1VP7Tv88Ow2PklbSHPFKVrgHE+X/Lb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765753675; c=relaxed/simple;
	bh=JZ0Dk3W56p2ENSouckv8s7Rcy0ZjXW+5Z6ordbHCjdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rbTTMsS5qE6LI83/FKppATd4AoWGA4Zxg4f43VcYifaKljNQ02UV2IYpttusxdeFOA3Bq1jeSiHdWTR8/aZAUKWLM2bjwGUtbFkcTE8SIjPwJofwISGdJO4aYfFGnhgb82a/dBZAjCLC60/W/CjExDvwrfIoIqgx8uQrHlmw8p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVea345x; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVea345x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765753674; x=1797289674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JZ0Dk3W56p2ENSouckv8s7Rcy0ZjXW+5Z6ordbHCjdc=;
  b=YVea345x7dRddXlPKK7zSOls0t+w6jAJkK92W8DpIWeiyH3gi78bmoRI
   c66TFSfUY07sMxLrIusCFrdafutdIt1+pnWf+Q0e8IR7bpbFgYtVbGPbq
   T9RKL7u7lTXCDyU8Cs3j6o+tfI+GXMi315or7u8o1bEGBq56NQ1GBicZS
   bot+6MScrmJqp52uQP68rRxr/+DvGwhAfWU18NsFIK929/LiUNe/Uvj3u
   9mNtL/jid+g3mXbEI6YibUEu66d+qDTTJERU4ykQzjaEY06TApCEKM5vb
   gwvmbSqMeRKrY2OkrBnHygo0e2vTNdSverVNpHv/XYF/FJf2DQklgN2YH
   g==;
X-CSE-ConnectionGUID: 3nyLwi6xSG+zDXRxrpjs4w==
X-CSE-MsgGUID: pZmBzZ97S+2KgURa4VXHZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="66838474"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="66838474"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 15:07:51 -0800
X-CSE-ConnectionGUID: tigwARf5SO+z7zXdsSyIuA==
X-CSE-MsgGUID: Q1AlBp0/T0eX918WcvCFNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="201989825"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Dec 2025 15:07:50 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUvBs-000000009TP-11lG;
	Sun, 14 Dec 2025 23:07:48 +0000
Date: Mon, 15 Dec 2025 07:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenyu Huang <huangwenyu5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] kernel/sched/fair.c:143:14: sparse:
 sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it
 be static?
Message-ID: <202512150649.o2WPQrCa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: a3c9f2da0a35df4e41751556be4308f57bdaf3d6 [3541/3541] sched: Introduce handle priority reversion mechanism
config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251215/202512150649.o2WPQrCa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150649.o2WPQrCa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150649.o2WPQrCa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/fair.c:143:14: sparse: sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it be static?
>> kernel/sched/fair.c:144:14: sparse: sparse: symbol 'sysctl_offline_wait_interval' was not declared. Should it be static?
   kernel/sched/fair.c:1236:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1236:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1236:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:3019:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/fair.c:3019:13: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:3019:13: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:12477:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12477:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12477:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5766:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5766:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5766:22: sparse:    struct task_struct *
   kernel/sched/fair.c:7809:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7809:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7809:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8014:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8014:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8014:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8113:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8113:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8113:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8333:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8333:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8333:22: sparse:    struct task_struct *
   kernel/sched/fair.c:8687:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8687:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8687:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9680:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9680:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9680:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10317:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10317:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10317:22: sparse:    struct task_struct *
   kernel/sched/fair.c:11749:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11749:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11749:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11406:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11406:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11406:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11845:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11845:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11845:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:2965:9: sparse: sparse: context imbalance in 'task_numa_placement' - different lock contexts for basic block
   kernel/sched/fair.c:7047:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7047:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7047:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7053:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7053:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7053:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7060:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7060:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7060:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7068:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7068:17: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7068:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2309:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *

vim +/sysctl_overload_detect_period +143 kernel/sched/fair.c

   139	
   140	static DEFINE_PER_CPU_SHARED_ALIGNED(struct list_head, qos_throttled_cfs_rq);
   141	static DEFINE_PER_CPU_SHARED_ALIGNED(struct hrtimer, qos_overload_timer);
   142	static DEFINE_PER_CPU(int, qos_cpu_overload);
 > 143	unsigned int sysctl_overload_detect_period = 5000;  /* in ms */
 > 144	unsigned int sysctl_offline_wait_interval = 100;  /* in ms */
   145	static int one_thousand = 1000;
   146	static int hundred_thousand = 100000;
   147	static int unthrottle_qos_cfs_rqs(int cpu);
   148	#endif
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
