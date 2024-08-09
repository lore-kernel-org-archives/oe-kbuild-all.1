Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FD81FA4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 00:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723162887; cv=none; b=IsWdKEK+/IHoDPZM5q9qfj24sD7KBmGv4O0GGy5nJzc6r0tAfF2TmWAHENjHKO8aKILS8X9iO4nuSRsANH51NZk5QUJQQQsqY80LwwEcMaHAjZFJUUz2G7l+ovjrT32p76PMY8mkwHDfL6CfunMcJYU72roaS+QY14VnQ+TOEVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723162887; c=relaxed/simple;
	bh=CWu+uA0sVvIYihL8TogbkwRB0mKRoKZjp/LxpjHs0MY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CiCsI50VgFr1EVdq5gVlOgFowZBLBLEKlc9M6qQhOjzNvkrxgbV3PgFs4cn4huEkEDUaff83cOk7ZNzePCqjGePH+pvnxffoX4uEytqaIE1l6/kGQ5tTm4Yt9EU3C+Gzc2ae6n38AS+70D3TLUFBYCZwB0hZLGf0vk9AcM1lpAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=auhFHbOh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auhFHbOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723162886; x=1754698886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CWu+uA0sVvIYihL8TogbkwRB0mKRoKZjp/LxpjHs0MY=;
  b=auhFHbOhVXVCmZDPQyD5z2SgdXH/kWlgpL17VPzBdGMh59JkVxq84/Rt
   +uP6eISbCp10QGkwJCJ7CEYLpt7C2vpGOyUGY8nwHW+1jogS+wgGTX/dF
   Y3HwAB/67jMU/wR9YbmZ1gZ5SPYuqVL3+naPiJEW/3/GX9iWusILeuqKG
   AS63FnAuBmZqwZ9xQZ2R8yc29V1dhUqEOybViir9gO9XCZ4weS0eOoU6q
   L8WHgMG6toiDu+upaOJ9tSGBW7DCyB44oc3I1Eshwgh4+W2YZz0JkGTBA
   xuPUu8Tme0ISat9gJVjdpALiL8PFhfEKRLIlXucC4viMlXFYmWvtNfWMB
   Q==;
X-CSE-ConnectionGUID: Q1gPcOwmT9uF0QIffbm/Yg==
X-CSE-MsgGUID: GBzaO7WJSyuVvpXBfp14tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21180366"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="21180366"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 17:21:25 -0700
X-CSE-ConnectionGUID: F7ze2U8TRkiIpOI3bInXgA==
X-CSE-MsgGUID: i07EJ7SAQPeZmbCVPh1evw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="88029076"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 08 Aug 2024 17:21:23 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scDNd-0006fg-0p;
	Fri, 09 Aug 2024 00:21:18 +0000
Date: Fri, 9 Aug 2024 08:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlelli:upstream/dl-server-params 1/2]
 kernel/sched/deadline.c:1631:5: sparse: sparse: symbol
 'default_dl_server_period' was not declared. Should it be static?
Message-ID: <202408090802.3Dej2WDP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jlelli/linux.git upstream/dl-server-params
head:   1b5e0a534c80f5b6fc3e74545ecea48ca9cbdd01
commit: 163cb6033def0fff4c9e9fefed7c675ec5a83b08 [1/2] sched/deadline: Add kernel parameter for dl server
config: x86_64-randconfig-122-20240809 (https://download.01.org/0day-ci/archive/20240809/202408090802.3Dej2WDP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090802.3Dej2WDP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090802.3Dej2WDP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:851:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:851:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:851:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2355:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2355:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2355:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:531:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:531:54: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:531:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:991:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:991:38: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:991:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1527:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1527:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1527:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1867:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1867:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1867:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1547:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1547:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1547:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1612:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1612:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1612:45: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1673:67: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1673:67: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1673:67: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2035:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2035:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2035:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2058:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2058:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2058:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2408:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2408:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2408:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2410:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2410:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2410:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2410:61: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2410:61: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2410:61: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2781:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2781:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2781:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2791:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2791:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2791:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2899:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2899:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2899:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2391:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2391:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2391:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2402:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2402:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2402:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1242:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1242:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1242:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1242:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1242:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1242:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1342:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1342:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1342:23: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/deadline.c:1631:5: sparse: sparse: symbol 'default_dl_server_period' was not declared. Should it be static?
>> kernel/sched/deadline.c:1637:5: sparse: sparse: symbol 'default_dl_server_runtime' was not declared. Should it be static?
   kernel/sched/deadline.c:1695:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1695:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1695:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1695:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1695:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1695:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1785:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1785:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1785:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2642:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2642:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2642:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2276:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2276:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2276:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2352:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2352:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2352:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2946:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2946:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2946:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2948:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2948:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2948:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2950:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2950:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2950:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3125:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3125:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3125:22: sparse:    struct task_struct *
   kernel/sched/deadline.c:3174:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/syscalls.c:253:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:253:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:253:48: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2179:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2179:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2179:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2179:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2179:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2179:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2179:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2179:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2351:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2351:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2351:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2179:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2179:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2351:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2351:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2351:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1402:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1698:15: sparse: sparse: dereference of noderef expression

vim +/default_dl_server_period +1631 kernel/sched/deadline.c

  1626	
  1627	/*
  1628	 * period (microseconds) over which the dl server works.
  1629	 * default: 1s
  1630	 */
> 1631	int default_dl_server_period = 1000000;
  1632	
  1633	/*
  1634	 * runtime (microseconds) availabe for tasks to run using the dl server.
  1635	 * default: 0.05s
  1636	 */
> 1637	int default_dl_server_runtime = 50000;
  1638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
