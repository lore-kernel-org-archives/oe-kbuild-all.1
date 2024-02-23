Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644737F48D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708696085; cv=none; b=JG3/H6iHrrRs9bIN/dk4pF6pKNihyc0DvMFyWDekgdSA2sLBGrRv0vxx0SmFutMJqYjAQJZwmMVcgRG8RoasmuLcMILfpncBc9K2glw7iSWvNv6smKLQhA9N/DBPjnk29PBU75H0wY9ygLkoNL7D8Shnq+b8bfEE8oK6guXA4go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708696085; c=relaxed/simple;
	bh=HTPVDQrKjOnlsd/wbPQf7WRoWISTP1d0bYy6ppxQZuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dmc3Cx4nmkyo1O+pDFlAH5Bz7dAoN/W5SXYPJzp2V7mJf5Lqt2ZSzjLfB6zNIdAV3F+yCLS+UnenCJiq9wuhc/F2BOFUL8U16EYtBHBSYfUT5k3Ae+BI8tLAuTe2M9fGZfgJqshWUwaL28LrS+c/51bQpc397cQranHEAzJGmvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fy+rsU1V; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fy+rsU1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708696083; x=1740232083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HTPVDQrKjOnlsd/wbPQf7WRoWISTP1d0bYy6ppxQZuk=;
  b=fy+rsU1V9SDLmjjFaKp+Ia8ueNP+d4k6IBHDgiPpT6b7Jug4BU5co9Id
   wFb82l/W19Y8pP5Ztoi8HBPUzbn8J0lxF2sU+7ILXo36hAC2AN0I2hgcS
   fm8sMqlUoDt07XMvBbIT3hkhvoDtXhLgr9CMWr/jrvkIv1aCGxfEsaiAb
   6BKpZSl/AJnpevUmVKHcwvEIZN9EJVVf16TD1K/2Kz/LpgmbqpNpV6qSN
   MWMmlPSEbZE+83Rla0aebzf/4qbugprio4Zqe+0/FGnAJeyYBvlP3H27O
   AgviX1sI5PzHZzrW/0Ghuj0Dd9VUDSlQ2FvV0BWLQXNtNz3Z5Seee6MeF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3163018"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="3163018"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 05:48:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="10606620"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 23 Feb 2024 05:48:00 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdVtc-0007YC-1Z;
	Fri, 23 Feb 2024 13:47:36 +0000
Date: Fri, 23 Feb 2024 21:46:38 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/sched/core.c:7176:5: warning: no previous prototype for
 function 'cpu_get_max_cpus'
Message-ID: <202402232152.tPhhMJk1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 5990ae24e7b9ab84c0ffa871fa9ec1ff1738da57 cgroupfs: quota aware support
date:   2 years, 4 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240223/202402232152.tPhhMJk1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402232152.tPhhMJk1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402232152.tPhhMJk1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:9:
   kernel/sched/sched.h:1333:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1333 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:2217:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
    2217 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^
   kernel/sched/core.c:2217:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2217 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         | ^
         | static 
   kernel/sched/core.c:3362:10: warning: cast from 'void (*)(struct callback_head *)' to 'void (*)(struct rq *)' converts to incompatible function type [-Wcast-function-type-strict]
    3362 |                 func = (void (*)(struct rq *))head->func;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:4278:35: warning: no previous prototype for function 'schedule_user' [-Wmissing-prototypes]
    4278 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^
   kernel/sched/core.c:4278:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4278 | asmlinkage __visible void __sched schedule_user(void)
         |                      ^
         |                      static 
>> kernel/sched/core.c:7176:5: warning: no previous prototype for function 'cpu_get_max_cpus' [-Wmissing-prototypes]
    7176 | int cpu_get_max_cpus(struct task_struct *p)
         |     ^
   kernel/sched/core.c:7176:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7176 | int cpu_get_max_cpus(struct task_struct *p)
         | ^
         | static 
   5 warnings generated.


vim +/cpu_get_max_cpus +7176 kernel/sched/core.c

  7171	
  7172	int container_cpuquota_aware;
  7173	#define cpu_quota_aware_enabled(tg) \
  7174	    (tg && tg != &root_task_group && tg->cpuquota_aware)
  7175	
> 7176	int cpu_get_max_cpus(struct task_struct *p)
  7177	{
  7178		int max_cpus = INT_MAX;
  7179		struct task_group *tg = task_group(p);
  7180	
  7181		if (!cpu_quota_aware_enabled(tg))
  7182			return max_cpus;
  7183	
  7184		if (tg->cfs_bandwidth.quota == RUNTIME_INF)
  7185			return max_cpus;
  7186	
  7187		max_cpus = DIV_ROUND_UP(tg->cfs_bandwidth.quota, tg->cfs_bandwidth.period);
  7188	
  7189		return max_cpus;
  7190	}
  7191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
