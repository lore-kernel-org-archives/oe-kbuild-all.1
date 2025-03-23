Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCD71FC0E9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 01:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742692190; cv=none; b=YKqtZHUJVk9L3I7IRlitHtsWYhE77dMkZ0xSyWYhM6sOWlmIrGE88KWROjf0x4FDMMwI1o92F1oidLXPAu3kxx1/wDQQDKLjQppsGftP6EEIy3GYtZAD38jFi5SbY0p335t1xTCsOQM/H91kL05reUOvXGqnURqq/xVTbUU97LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742692190; c=relaxed/simple;
	bh=xPZhOtDyNHDQulBJo4zLbjG+7r7kuiq34iiYhZ5hh8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uum2VdjXGw68mm8paLrrfE+GMN8HkybcCnS0mSo/smO4ZDQOnhKh+SeNUO7ICFZKN/CKfOKhmMAcdjKNGyM5cz1UrJFtv1OINraYSEcxRejvu8IH7RAHbfcIvvEpJbDIjUFmZ5CR1bG89WoKONDHX/tYys5pvwrTFq5kI21MaSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CrZHxb+5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CrZHxb+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742692189; x=1774228189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xPZhOtDyNHDQulBJo4zLbjG+7r7kuiq34iiYhZ5hh8I=;
  b=CrZHxb+5Wb3F257Sl4DQfwsX27ZIL4joSEYwhYuCR+jXmW3nE29VV8+n
   TBAvU2FxonK/+qIOs5ASJfAGKb3xnJLwy2eoFFQopWRPRz0l0DE8hhTev
   nygKMd9bNB5aN8G2clCKsbif6GItSGc9UX0+6D8O0hykT/qtRzDMrac3C
   LCODoww3+MWAoTXajtrbb0wOeq3zlXgnP9q/z6KEB+zWfU8MLz+4+gBBS
   V8pD8G+SeJEA0ws8xLxJ3MtAm/x8uuEm41CB6dRWrJKkVYh6bJWNQaXvy
   xCMXEgc61F+o1/XSKCAef8NleqeCqGLeLiZPIUIEoYmpPDoEom4MfA5eZ
   A==;
X-CSE-ConnectionGUID: 8pV9/XNmT9SrWrPzEQ+Z1g==
X-CSE-MsgGUID: j2fDwmK4S+q8mTbIqr2aig==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="43855989"
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="43855989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 18:09:48 -0700
X-CSE-ConnectionGUID: yIwGH+d6Q22fbGFENGz1hA==
X-CSE-MsgGUID: wVs9l92CTECrF2/FPmGZvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="128539737"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Mar 2025 18:09:47 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw9qD-0002VQ-0L;
	Sun, 23 Mar 2025 01:09:29 +0000
Date: Sun, 23 Mar 2025 09:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuan Can <yuancan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2051/2051] mm/memcontrol.c:3147:6: warning: no
 previous prototype for 'hisi_oom_recover'
Message-ID: <202503230914.IDoSqyA4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Weilong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6f6f173b2b8fa65e1ef7ebc6e43b0b02c2a52759
commit: b498d9f1bacd40d583c0970cab02ad522127a7e7 [2051/2051] arm64/ascend: Add new enable_oom_killer interface for oom contrl
config: arm64-randconfig-r111-20250323 (https://download.01.org/0day-ci/archive/20250323/202503230914.IDoSqyA4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250323/202503230914.IDoSqyA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503230914.IDoSqyA4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:3147:6: warning: no previous prototype for 'hisi_oom_recover' [-Wmissing-prototypes]
    3147 | void hisi_oom_recover(struct obj_cgroup *objcg)
         |      ^~~~~~~~~~~~~~~~

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
   mm/memcontrol.c:6415:52: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:6415:52: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:6415:52: sparse:    struct task_struct *
   mm/memcontrol.c:1320:18: sparse: sparse: context imbalance in 'folio_lruvec_lock' - wrong count at exit
   mm/memcontrol.c:1343:22: sparse: sparse: context imbalance in 'folio_lruvec_lock_irq' - wrong count at exit
   mm/memcontrol.c: note: in included file (through include/linux/spinlock.h, include/linux/wait.h, include/linux/pid.h, ...):
   include/linux/spinlock_api_smp.h:111:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irqsave' - wrong count at exit
   mm/memcontrol.c:2111:6: sparse: sparse: context imbalance in 'folio_memcg_lock' - wrong count at exit
   mm/memcontrol.c:2158:17: sparse: sparse: context imbalance in '__folio_memcg_unlock' - unexpected unlock
   mm/memcontrol.c:6058:9: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   mm/memcontrol.c:6326:9: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

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
