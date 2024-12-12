Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CBB13BADF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 04:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733977899; cv=none; b=GcZ8tZEWC0Y8pA2BTHZg/nnpvQvolJXThHrbJTo4iBWXy0+FOMu76tDQtkOZbKT4lBdUA20MJghTFZ6jlfBQ3DkQPGHA+1lmH5VlFtl9rfJFchKHDX8e4lR1CV2jSE12zxGIyZb0DAVwO3C9CPKp/XvWPy+ykVsapqwK71EdDko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733977899; c=relaxed/simple;
	bh=4P8lol3fMwMiLe9XkCI5HuyEKpP8wYd70ypaIgqBUHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iPISG50EWqSHnhpBVYQDP7mHZ8gUdffEfqkEvnZJiq0g9odAHoOWWXNQMtf06gzxcHcYh7auHV9Ylo0W3e+VPgMSOOnq66aDAutktDqYlslNNSW7nWkzXN/5e5WA2d8vMj8zpMBIh3ktSKiXG4uJShiS8aUAPkgK9h2Fy+OYIXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlWkdrHg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlWkdrHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733977897; x=1765513897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4P8lol3fMwMiLe9XkCI5HuyEKpP8wYd70ypaIgqBUHU=;
  b=QlWkdrHgXUOuqSYXQiFwRTk0sf8d6iOmUplKkhWzJ7N58BZEQzps3Ned
   XdIiTWI6Z6GI5zElhBuufbOfHDOli8JnDq8Inp5FQhFkLW/t5Y6UifD3l
   TMyXjPnAAYfgoYHz5Raq06doe1GMSu4BCF9DYIxINq2jcDJ6actSUHltb
   qWlMNEHCFI6W4UPa+soJh7MkfYcB9uwGRlSuVffWWkd1GEadQFSeMQeDL
   0g3okAn3obZhQ/5I+9Uo/4NJ1SyJ4P805msE295LIgYXLA5he7Eb5V7pH
   swXg49dyvG3l/yBJ+AeFEwyy8d4PBwlNtITMbMKrH9yGw4mMNZA3V2on0
   A==;
X-CSE-ConnectionGUID: SAji7VXpQ+K0kGJ5pG+ajw==
X-CSE-MsgGUID: DAyGpMx/RvW8dM3CeMpxjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34253912"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34253912"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 20:31:36 -0800
X-CSE-ConnectionGUID: l7W/5otfTUygnhvP8FDobg==
X-CSE-MsgGUID: C8PqyssIQO+6lqZoQse1nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="101114605"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2024 20:31:35 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLarN-0007Qt-0s;
	Thu, 12 Dec 2024 04:31:33 +0000
Date: Thu, 12 Dec 2024 12:30:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hui Tang <tanghui20@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613] kernel/sched/fair.c:175:5: sparse:
 sparse: symbol 'sysctl_sched_util_low_pct' was not declared. Should it be
 static?
Message-ID: <202412121240.WE2mP4ai-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea308216b3205d652bf8108517516848b0b64435
commit: 2e1dfc02d115143587ccfee1815ad295763050f2 [1613/1613] sched: Adjust wakeup cpu range according CPU util dynamicly
config: loongarch-randconfig-r111-20241210 (https://download.01.org/0day-ci/archive/20241212/202412121240.WE2mP4ai-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241212/202412121240.WE2mP4ai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121240.WE2mP4ai-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/fair.c:175:5: sparse: sparse: symbol 'sysctl_sched_util_low_pct' was not declared. Should it be static?
   kernel/sched/fair.c:1256:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1256:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1256:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12740:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12740:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12740:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6633:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6633:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6633:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7964:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7964:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7964:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8258:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8258:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8258:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8367:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8367:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8367:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8941:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8941:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8941:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9934:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9934:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9934:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10571:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10571:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10571:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12012:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12012:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12012:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11669:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11669:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11669:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12108:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12108:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12108:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   kernel/sched/fair.c:6555:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2309:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *

vim +/sysctl_sched_util_low_pct +175 kernel/sched/fair.c

   168	
   169	#ifdef CONFIG_QOS_SCHED_DYNAMIC_AFFINITY
   170	/*
   171	 * Low utilization threshold for CPU
   172	 *
   173	 * (default: 85%), units: percentage of CPU utilization)
   174	 */
 > 175	int sysctl_sched_util_low_pct = 85;
   176	#endif
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
