Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C19130F927
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 21:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761771704; cv=none; b=AGigQqLKuaUWyuCVw6ueECPY+7WmxiZPf1IsmXrq2w6pWmgZXp6foEr35ONIEwzC9i7n0ZRCD6HZKj6e6dPn/OS0Gl3C8vG0hCHa8kmVKKzpl6tutptsYBPe6CiRcYuxJFGim2NQxdFn4Cw1hfHUKgPTLVnHb5faE3lHaLY7V6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761771704; c=relaxed/simple;
	bh=FqULR9ZGk0Gm0D1qdTD9T3DfJddl9IskIartgNvZdq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V2SN4h+P26RZg2YHrNq2c1QdwFjRhD6AsuHZpbOyL/v1ewEs1EPkXKmQ5bv1N69siRpV3nLvy2rH8TP9RaQ0awfZMdZPWDiVRJDFPFxTu10tKvyK2j8bm/dR4wSO6AsX373d0gbtqqhpOda//XDdajc/qUdFmCluOahwaKcG5j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdk8UVRf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdk8UVRf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761771702; x=1793307702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FqULR9ZGk0Gm0D1qdTD9T3DfJddl9IskIartgNvZdq0=;
  b=cdk8UVRfG3yN/Kp+QNXua6oMESGzvFBT5em+SsVJKkg0M2t2Z8SkMNHy
   oGMcK4INVf5LqCMG8njmPAB5rKV/yq//xys+uOnQdKlF0kAamlgiPfr4s
   tp42QBlliwCSdEsmgbcIgvs1HvhqJlKuA+ts5Gahd3Do/uAOSUkfCIrp1
   Rtl147LebZsgruoFLc2/cFMCWmr1MLYeKmKRC92hku1SABKd1Z49ff5Ux
   E7hwJ/1hvIYuwteZDtrtlC92PKv0fsn9v41UYmCLMCgTf4bNi8xs99gQw
   w3FuWhsxziWGMLzeYk6seVGtVRe0wzV1HUO1xTKSvgGbnPMnDe0DZutxq
   w==;
X-CSE-ConnectionGUID: 8gizbXnjQIGNEljyTK8O0g==
X-CSE-MsgGUID: ssrJhQCoRv2HAgc3kWOH9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="66521634"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="66521634"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 14:01:39 -0700
X-CSE-ConnectionGUID: jsFV+b0XTlqtHRoexWDRgA==
X-CSE-MsgGUID: PN9GzqviRGK6w5TmhAXVGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="185019756"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Oct 2025 14:01:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEDIU-000L9y-2E;
	Wed, 29 Oct 2025 21:01:34 +0000
Date: Thu, 30 Oct 2025 05:01:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3257/3257] kernel/sched/fair.c:9944:50: error:
 invalid use of undefined type 'struct task_group'
Message-ID: <202510300412.XOY1Sf5f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cheng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5860abf4ca1c1e5ced0d4787886db4195a9c54ea
commit: 433c0b72564239cf3086f563d5ca32a10e4ffd3f [3257/3257] sched/fair: Count the number of tasks marked as steal_task on cfs_rq
config: x86_64-randconfig-015-20251029 (https://download.01.org/0day-ci/archive/20251030/202510300412.XOY1Sf5f-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300412.XOY1Sf5f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300412.XOY1Sf5f-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'group_steal_enabled':
   kernel/sched/fair.c:4483:38: error: implicit declaration of function 'is_tg_steal' [-Werror=implicit-function-declaration]
    4483 |         return group_steal_used() && is_tg_steal(steal_task);
         |                                      ^~~~~~~~~~~
   kernel/sched/fair.c: In function 'overload_clear':
   kernel/sched/fair.c:4489:23: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    4489 |         unsigned long time;
         |                       ^~~~
   kernel/sched/fair.c: In function 'overload_set':
   kernel/sched/fair.c:4517:23: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    4517 |         unsigned long time;
         |                       ^~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:6013:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    6013 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'select_task_rq_fair':
   kernel/sched/fair.c:8191:23: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    8191 |         unsigned long time;
         |                       ^~~~
   kernel/sched/fair.c: In function 'pick_next_task_fair':
   kernel/sched/fair.c:9185:23: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    9185 |         unsigned long time;
         |                       ^~~~
   kernel/sched/fair.c: In function 'can_migrate_task_llc':
>> kernel/sched/fair.c:9944:50: error: invalid use of undefined type 'struct task_group'
    9944 |         if (group_steal_used() && !is_tg_steal(tg->steal_task))
         |                                                  ^~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:13961:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   13961 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13963:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   13963 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13968:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   13968 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13970:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   13970 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +9944 kernel/sched/fair.c

  9929	
  9930	#ifdef CONFIG_SCHED_STEAL
  9931	/*
  9932	 * Return true if task @p can migrate from @rq to @dst_rq in the same LLC.
  9933	 * No need to test for co-locality, and no need to test task_hot(), as sharing
  9934	 * LLC provides cache warmth at that level.
  9935	 */
  9936	static bool
  9937	can_migrate_task_llc(struct task_struct *p, struct rq *rq, struct rq *dst_rq)
  9938	{
  9939		int dst_cpu = dst_rq->cpu;
  9940		struct task_group *tg = task_group(p);
  9941	
  9942		lockdep_assert_rq_held(rq);
  9943	
> 9944		if (group_steal_used() && !is_tg_steal(tg->steal_task))
  9945			return false;
  9946	
  9947		if (throttled_lb_pair(tg, cpu_of(rq), dst_cpu))
  9948			return false;
  9949	
  9950		if (!cpumask_test_cpu(dst_cpu, p->cpus_ptr)) {
  9951			schedstat_inc(p->se.statistics.nr_failed_migrations_affine);
  9952			return false;
  9953		}
  9954	
  9955		if (task_running(rq, p)) {
  9956			schedstat_inc(p->se.statistics.nr_failed_migrations_running);
  9957			return false;
  9958		}
  9959	
  9960		return true;
  9961	}
  9962	#endif
  9963	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
