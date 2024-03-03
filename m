Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6656CDC0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 19:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709495523; cv=none; b=B96q1eAVki6UXNHfa4JYBti6xKZ0eUAyMfw8sucEtRU8It+SjL+1qdYjeqcZZqzP1dKzv9bICTuhu9utQtVpXi2FBVp2h9K/SSp5vE1Hzo/0oV6NDy5/gCts3NR7ss61lHzb7VvxeQshZq4EAZQQhJLofw6Y2TEu9x7yKCggprE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709495523; c=relaxed/simple;
	bh=3DAfhvYvfY5k8x8oHYCCOpR7BzKvdLnhSDQIu+xKvwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BxqAEkQBIRKg39xj6/z1TMyeopp2r5HjRXNzyrEpmeUonDkoYYMIfJL4ZfTiecJp6MfTvAH1cVeUJXGVMbE4vgnq67dlTWfCOHvVGWT4SUws+JoQI2Imu+Iq573B8/J8Lf6PgsxdbNY4vQOFh0IMPRQQ2FAesSYMqzVH9JHmgws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0oim4r4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0oim4r4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709495521; x=1741031521;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3DAfhvYvfY5k8x8oHYCCOpR7BzKvdLnhSDQIu+xKvwk=;
  b=P0oim4r4/eLVWbT+eoRk5G0Mj98kTfeW4buiJIMZM+t5uRXfLFR0Fpxv
   busp2HTT2jMOmsREZB4rP5slpQTvs/C/fyBkFctOqkXdzJCY+mwYUDK/U
   jJn3Tuf010lu4LEqvjx888FSrX1kO3Qzef/qjl0/lH3Eb2shO++B2sT7C
   dYQtfGlmg/m4gbpp94OEgD3cgSKlSnEgGN3+Rj48lly8PmfQncP0O3kFB
   Mn0Wugw2QpoOTxBugLEN4RIuzDLUiLfQDzl3xNcw0+K6qbO71lSjhcxmk
   0U32LeANFy2MmKwJHy9OEh4gbJZChiUvhJiHhFmPcJsIKq9o17TROR4cP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4146426"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="4146426"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 11:52:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13271082"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Mar 2024 11:51:59 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgrsL-000242-1G;
	Sun, 03 Mar 2024 19:51:57 +0000
Date: Mon, 4 Mar 2024 03:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xia Fukun <xiafukun@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2176/3769] kernel/sched/fair.c:9005:51: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202403040353.ycQkLqqd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   fbcd4a3032a53350f6d182c9daeaa4c46e65d964
commit: c52c17a85f1fa9cde2bcb15359096634cfd9eb7c [2176/3769] sched: Add tracepoint for qos smt expeller
config: arm64-randconfig-r111-20240227 (https://download.01.org/0day-ci/archive/20240304/202403040353.ycQkLqqd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240304/202403040353.ycQkLqqd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040353.ycQkLqqd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:151:14: sparse: sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it be static?
   kernel/sched/fair.c:152:14: sparse: sparse: symbol 'sysctl_offline_wait_interval' was not declared. Should it be static?
   kernel/sched/fair.c:1283:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1283:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1283:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:13203:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13203:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13203:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6012:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6012:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:6012:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6754:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6754:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6754:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8121:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8121:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8121:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8436:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8436:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8436:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8548:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8548:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8548:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8774:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8774:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8774:22: sparse:    struct task_struct *
>> kernel/sched/fair.c:9005:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *sibling_p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9005:51: sparse:     expected struct task_struct *sibling_p
   kernel/sched/fair.c:9005:51: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9010:30: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9010:30: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:9010:30: sparse:    struct task_struct *
   kernel/sched/fair.c:9084:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9332:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:10403:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:11040:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:11040:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:11040:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12481:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12481:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12481:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12138:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12138:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:12138:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12577:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12577:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12577:9: sparse:     got struct sched_domain [noderef] __rcu *parent
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
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2174:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2338:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2338:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2338:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2338:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2338:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2338:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2174:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2174:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct *

vim +9005 kernel/sched/fair.c

  8984	
  8985	static bool _qos_smt_check_need_resched(int this_cpu, struct rq *rq)
  8986	{
  8987		int cpu;
  8988	
  8989		if (!sched_smt_active())
  8990			return false;
  8991	
  8992		for_each_cpu(cpu, cpu_smt_mask(this_cpu)) {
  8993			if (cpu == this_cpu)
  8994				continue;
  8995	
  8996			/*
  8997			* There are two cases rely on the set need_resched to drive away
  8998			* offline task：
  8999			* a) The qos_smt_status of siblings cpu is online, the task of curr cpu is offline;
  9000			* b) The qos_smt_status of siblings cpu is offline, the task of curr cpu is idle,
  9001			*    and current cpu only has SCHED_IDLE tasks enqueued.
  9002			*/
  9003			if (per_cpu(qos_smt_status, cpu) == QOS_LEVEL_ONLINE &&
  9004			    task_group(current)->qos_level < QOS_LEVEL_ONLINE) {
> 9005				trace_sched_qos_smt_expel(cpu_curr(cpu), per_cpu(qos_smt_status, cpu));
  9006				return true;
  9007			}
  9008	
  9009			if (per_cpu(qos_smt_status, cpu) == QOS_LEVEL_OFFLINE &&
  9010			    rq->curr == rq->idle && sched_idle_cpu(this_cpu)) {
  9011				trace_sched_qos_smt_expel(cpu_curr(cpu), per_cpu(qos_smt_status, cpu));
  9012				return true;
  9013			}
  9014		}
  9015	
  9016		return false;
  9017	}
  9018	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
