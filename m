Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E341613A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 03:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709694848; cv=none; b=CmrC2OOnppyy62cwXbHiUn20ejYfTtjyk2nCPYxlEp02TRNcTjDi6QszvVwn6crnYTZ7dR5twFxND9Bna09SsKrtVQWtiRerq29d0vQ0R687s1rfM+Xu9wSSrce6FoS08LkEUzqjoPnTe973vhgft6AuMS5BdxqxXm2QGAp1t7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709694848; c=relaxed/simple;
	bh=IsSt2yv+A10j+vkfWIG6F73Je/eRRrcf/jpHcJQcAaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OE3Gb3w0VzJvAoohm9KuR43BlHtfA3mbLEKQFVqpCF/Z75omArXpWToihP7qlvWt+wWcnlAYOY0YF0xZUmM5suXxvrXoe22siPbW3xDtkTUpZHTsFuLS7f0TyoVcMa/d0jf1oBVZpAmQ4gIAmCAERsUOpVDqqNzjQTH7pWO609o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YaPelt0M; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YaPelt0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709694847; x=1741230847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IsSt2yv+A10j+vkfWIG6F73Je/eRRrcf/jpHcJQcAaM=;
  b=YaPelt0MNmYa9+/RZrcrQ/gyU3uk4cJa8uxLKKI4erHQ8zuVFGKKDh/Q
   MwznrcFEYokk7oRnOwBeXXyv8Pl5EnSw1yh2pu/5ewSygqcUw0duLVPW+
   j5VVrJ+Fyt7X2mdj0qQP3rox+3z3T9JlqtB5wbwELx5s07e5iCxZngQ/J
   7dYQao7qpMQ32aLot/0RVmlYTTt2l8dhLrSc9+GLOWuoeVTvuwlEjodSm
   UbzBB0kGTYDohefgD8Ihs5ICBNxAXU39p6lJF+K6UMgfbhMKJejE/MU5D
   6sJZWw3qSD0gOuCVcOT1J0iWi4grB9xT+ajPGFFuuE+ATGmwpzJijz2Yi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4149348"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4149348"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 19:13:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="47129812"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Mar 2024 19:13:08 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhhiL-0003rx-1h;
	Wed, 06 Mar 2024 03:13:05 +0000
Date: Wed, 6 Mar 2024 11:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xia Fukun <xiafukun@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2180/3862] kernel/sched/fair.c:8988:1: sparse:
 sparse: symbol 'qos_smt_expell_switch' was not declared. Should it be
 static?
Message-ID: <202403061134.XUPVJszR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f44547cb66ee30ed552adb15046a912cd1409c1f
commit: a62d532da0b51fe39f726c4c08f3debc8b3bc5d7 [2180/3862] sched/fair: Add cmdline nosmtexpell
config: arm64-randconfig-r111-20240227 (https://download.01.org/0day-ci/archive/20240306/202403061134.XUPVJszR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240306/202403061134.XUPVJszR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061134.XUPVJszR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:151:14: sparse: sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it be static?
   kernel/sched/fair.c:152:14: sparse: sparse: symbol 'sysctl_offline_wait_interval' was not declared. Should it be static?
   kernel/sched/fair.c:1284:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1284:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1284:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:13325:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13325:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13325:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6038:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6038:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:6038:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6780:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6780:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6780:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8163:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8163:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8163:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8478:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8478:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8478:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8590:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8590:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8590:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8936:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8936:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8936:22: sparse:    struct task_struct *
>> kernel/sched/fair.c:8988:1: sparse: sparse: symbol 'qos_smt_expell_switch' was not declared. Should it be static?
   kernel/sched/fair.c:9122:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *sibling_p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9122:51: sparse:     expected struct task_struct *sibling_p
   kernel/sched/fair.c:9122:51: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9127:30: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9127:30: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:9127:30: sparse:    struct task_struct *
   kernel/sched/fair.c:9205:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9454:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:10525:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:11162:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:11162:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:11162:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12603:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12603:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12603:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12260:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12260:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:12260:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12699:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12699:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12699:9: sparse:     got struct sched_domain [noderef] __rcu *parent
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
   kernel/sched/sched.h:2182:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2346:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2346:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2346:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2346:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2346:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2346:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2182:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2182:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2182:25: sparse:    struct task_struct *

vim +/qos_smt_expell_switch +8988 kernel/sched/fair.c

  8986	
  8987	#ifdef CONFIG_QOS_SCHED_SMT_EXPELLER
> 8988	DEFINE_STATIC_KEY_TRUE(qos_smt_expell_switch);
  8989	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
