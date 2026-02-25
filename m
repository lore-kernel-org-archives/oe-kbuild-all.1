Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102393B9601
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026402; cv=none; b=HyGOwiyNYNlaXuXCXCzqkULvgTE1Jy+53xhaK3jyPldUxvpHnWPSVkWl/4MX/EcI9QaVT06nzfo5nxfHKpbFCxuJ5V652GyGLO+TdtM5e7YhVBIPhhzSnnzxtabI678sv5N0CetR1BpOlV+IZK8NNKlu8aNfCOJN+mpnUtMUHZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026402; c=relaxed/simple;
	bh=a9w+L8RLhtUM0SglvH6yfjjcoQSdM+WzYq/yVE/fdMk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t9Hy3zQAM5OCcGukepMeYINuyoYV2zUE34k8kMm4mqpHxCq5bOJJ2jVVQz3/LpM0s2kmWYMRg/BEBN3xQ6k52gXDqj9/Eu3bq/JV3lPcpVajzvT3qo5CytdBvnqsRpG/UaP5ecgUzbI8w65Tn8OQw+DAIjuiIXszwJMNfPhoiuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tct9OznR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tct9OznR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772026389; x=1803562389;
  h=date:from:to:cc:subject:message-id;
  bh=a9w+L8RLhtUM0SglvH6yfjjcoQSdM+WzYq/yVE/fdMk=;
  b=Tct9OznR2SXQ1S4lxVOV7C+GC0JIHMDrApaUGEFT3JN7uE25opscvLox
   9WLmsIIIU6U/niLIKsPaQJnC4fNd9o4iIobhwGHzXBft1Gf0OG92DdPVM
   qnruLfr6BgW7GM6Gbs/HEafqCyzQ9RAcP+w1WHdCBHj40TAhzuHnBzr1K
   6dJoLFSmLL3cKCdgS2ZzW2FB4X20pIpnnheJyBNQzNTIwjRfYzwqNKREu
   /0FIHnM9J5HpImK1hAFyHkYPSXEi9uT7bj/wpoM9nABO5OHIaJzcV+kpa
   IA6HFmGPYRhFaqdxwADzfKHV35nI20Fz+S1r2C7F7J9MeUNr1ZNOX2GXv
   w==;
X-CSE-ConnectionGUID: 6WC8VyUJSJiIQbQIU5bG2g==
X-CSE-MsgGUID: 6Qklr+qdSWO4HZB2zt2o3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73105336"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="73105336"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 05:33:08 -0800
X-CSE-ConnectionGUID: iKfIRI9RQ3COl/JmkoDlmw==
X-CSE-MsgGUID: aYG84zunSyKf0FbM80DW0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="246790171"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Feb 2026 05:33:07 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvF0T-000000005pj-290L;
	Wed, 25 Feb 2026 13:32:53 +0000
Date: Wed, 25 Feb 2026 21:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-sub-sched-v2 35/40]
 kernel/sched/ext.c:3355:28: error: 'scx_enabling_sub_sched' undeclared
Message-ID: <202602252126.DMNIFVkn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-sub-sched-v2
head:   f2122e67cf5ccb9d8844e72cd437a6fd56f0ad80
commit: 2c199dba3d5deb39066fcf783060dcba58c893e3 [35/40] sched_ext: Implement cgroup sub-sched enabling and disabling
config: powerpc-randconfig-001-20260225 (https://download.01.org/0day-ci/archive/20260225/202602252126.DMNIFVkn-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602252126.DMNIFVkn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602252126.DMNIFVkn-lkp@intel.com/

All errors (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:507:50: note: in expansion of macro 'READ_ONCE'
     507 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:626:31: note: in expansion of macro '__rcu_access_pointer'
     626 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2424:24: note: in expansion of macro 'rcu_access_pointer'
    2424 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2424:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2424 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                                                    ^
   include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:507:50: note: in expansion of macro 'READ_ONCE'
     507 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:626:31: note: in expansion of macro '__rcu_access_pointer'
     626 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2424:24: note: in expansion of macro 'rcu_access_pointer'
    2424 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2424:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2424 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                                                    ^
   include/linux/compiler_types.h:633:27: note: in definition of macro '__unqual_scalar_typeof'
     633 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/linux/rcupdate.h:507:50: note: in expansion of macro 'READ_ONCE'
     507 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:626:31: note: in expansion of macro '__rcu_access_pointer'
     626 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2424:24: note: in expansion of macro 'rcu_access_pointer'
    2424 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:372,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_policy.c:16:
   kernel/sched/ext.c:2424:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2424 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                                                    ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/rcupdate.h:507:50: note: in expansion of macro 'READ_ONCE'
     507 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:626:31: note: in expansion of macro '__rcu_access_pointer'
     626 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2424:24: note: in expansion of macro 'rcu_access_pointer'
    2424 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2424:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2424 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                                                    ^
   include/linux/rcupdate.h:509:19: note: in definition of macro '__rcu_access_pointer'
     509 |         ((typeof(*p) __force __kernel *)(local)); \
         |                   ^
   kernel/sched/ext.c:2424:24: note: in expansion of macro 'rcu_access_pointer'
    2424 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:62:
   kernel/sched/ext.c:2448:27: error: 'struct scx_sched_pcpu' has no member named 'bypass_host_seq'
    2448 |                 if (!(pcpu->bypass_host_seq++ % SCX_BYPASS_HOST_NTH) &&
         |                           ^~
   kernel/sched/ext.c: In function '__scx_init_task':
   kernel/sched/ext.c:3188:28: warning: unused variable 'tg' [-Wunused-variable]
    3188 |         struct task_group *tg = task_group(p);
         |                            ^~
   In file included from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from arch/powerpc/include/asm/cmpxchg.h:8,
                    from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13:
   kernel/sched/ext.c: In function 'scx_disable_and_exit_task':
>> kernel/sched/ext.c:3355:28: error: 'scx_enabling_sub_sched' undeclared (first use in this function)
    3355 |             !WARN_ON_ONCE(!scx_enabling_sub_sched)) {
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:205:32: note: in definition of macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/ext.c:3355:14: note: in expansion of macro 'WARN_ON_ONCE'
    3355 |             !WARN_ON_ONCE(!scx_enabling_sub_sched)) {
         |              ^~~~~~~~~~~~
   kernel/sched/ext.c:3355:28: note: each undeclared identifier is reported only once for each function it appears in
    3355 |             !WARN_ON_ONCE(!scx_enabling_sub_sched)) {
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:205:32: note: in definition of macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/ext.c:3355:14: note: in expansion of macro 'WARN_ON_ONCE'
    3355 |             !WARN_ON_ONCE(!scx_enabling_sub_sched)) {
         |              ^~~~~~~~~~~~
   kernel/sched/ext.c: In function 'scx_fork':
>> kernel/sched/ext.c:3395:52: error: invalid use of undefined type 'struct css_set'
    3395 |                 struct scx_sched *sch = kargs->cset->dfl_cgrp->scx_sched;
         |                                                    ^~
   kernel/sched/ext.c: In function 'scx_root_disable':
   kernel/sched/ext.c:4983:9: error: implicit declaration of function 'drain_descendants' [-Werror=implicit-function-declaration]
    4983 |         drain_descendants(sch);
         |         ^~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:5044:29: error: 'struct scx_sched' has no member named 'cgrp'
    5044 |         set_cgroup_sched(sch->cgrp, NULL);
         |                             ^~
   kernel/sched/ext.c: In function 'scx_vexit':
   kernel/sched/ext.c:5541:9: warning: function 'scx_vexit' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    5541 |         vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
         |         ^~~~~~~~~~
   kernel/sched/ext.c: In function 'scx_root_enable':
   kernel/sched/ext.c:5799:45: error: 'cgrp_dfl_root' undeclared (first use in this function)
    5799 |         sch = scx_alloc_and_add_sched(ops, &cgrp_dfl_root.cgrp, NULL);
         |                                             ^~~~~~~~~~~~~
   kernel/sched/ext.c:5907:29: error: 'struct scx_sched' has no member named 'cgrp'
    5907 |         set_cgroup_sched(sch->cgrp, sch);
         |                             ^~
   kernel/sched/ext.c: At top level:
   kernel/sched/ext.c:4970:13: warning: 'scx_propgate_disable' defined but not used [-Wunused-function]
    4970 | static void scx_propgate_disable(struct scx_sched *sch) { }
         |             ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/scx_enabling_sub_sched +3355 kernel/sched/ext.c

  3343	
  3344	static void scx_disable_and_exit_task(struct scx_sched *sch,
  3345					      struct task_struct *p)
  3346	{
  3347		__scx_disable_and_exit_task(sch, p);
  3348	
  3349		/*
  3350		 * If set, @p exited between __scx_init_task() and scx_enable_task() in
  3351		 * scx_sub_enable() and is initialized for both the associated sched and
  3352		 * its parent. Disable and exit for the child too.
  3353		 */
  3354		if ((p->scx.flags & SCX_TASK_SUB_INIT) &&
> 3355		    !WARN_ON_ONCE(!scx_enabling_sub_sched)) {
  3356			__scx_disable_and_exit_task(scx_enabling_sub_sched, p);
  3357			p->scx.flags &= ~SCX_TASK_SUB_INIT;
  3358		}
  3359	
  3360		scx_set_task_sched(p, NULL);
  3361		scx_set_task_state(p, SCX_TASK_NONE);
  3362	}
  3363	
  3364	void init_scx_entity(struct sched_ext_entity *scx)
  3365	{
  3366		memset(scx, 0, sizeof(*scx));
  3367		INIT_LIST_HEAD(&scx->dsq_list.node);
  3368		RB_CLEAR_NODE(&scx->dsq_priq);
  3369		scx->sticky_cpu = -1;
  3370		scx->holding_cpu = -1;
  3371		INIT_LIST_HEAD(&scx->runnable_node);
  3372		scx->runnable_at = jiffies;
  3373		scx->ddsp_dsq_id = SCX_DSQ_INVALID;
  3374		scx->slice = SCX_SLICE_DFL;
  3375	}
  3376	
  3377	void scx_pre_fork(struct task_struct *p)
  3378	{
  3379		/*
  3380		 * BPF scheduler enable/disable paths want to be able to iterate and
  3381		 * update all tasks which can become complex when racing forks. As
  3382		 * enable/disable are very cold paths, let's use a percpu_rwsem to
  3383		 * exclude forks.
  3384		 */
  3385		percpu_down_read(&scx_fork_rwsem);
  3386	}
  3387	
  3388	int scx_fork(struct task_struct *p, struct kernel_clone_args *kargs)
  3389	{
  3390		s32 ret;
  3391	
  3392		percpu_rwsem_assert_held(&scx_fork_rwsem);
  3393	
  3394		if (scx_init_task_enabled) {
> 3395			struct scx_sched *sch = kargs->cset->dfl_cgrp->scx_sched;
  3396	
  3397			ret = scx_init_task(sch, p, true);
  3398			if (!ret)
  3399				scx_set_task_sched(p, sch);
  3400			return ret;
  3401		}
  3402	
  3403		return 0;
  3404	}
  3405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
