Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9CF757E8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 18:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710442725; cv=none; b=o5Gq8BHkaENiKppavPws186jWWhXWh0DUzoft1xTx1t2l7vGehq7wdxv+xe6XLfVknOJKdP9drj7phrdo/6QX+K+tpG3doSqSCtVs9jUhs/qhm0tzi8mTmOP69CVnHdwfcUsZCTGZ6FSlevkkz0lC0cJH4doqocYhn4Y1mN7tbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710442725; c=relaxed/simple;
	bh=ZWpyS3rzcPsz3w9pl2LixxRzOCcO22eZ+QiW+PP7EXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A5hxibN+YNhoqBBHHMZIauPwgxwKCJgAwYUgBsOujlZuDckmuOytorELhOK3+tDp9Ibks8xfof+dnFawd8yLhTpRJ2dw+vX24nMtm6dv262rHshy2xP251+3cxezN++ipib3slPrGrJreF1RPZEy8E4mm8spBsXsIlPRZWrG97A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jFuNLte+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jFuNLte+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710442722; x=1741978722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZWpyS3rzcPsz3w9pl2LixxRzOCcO22eZ+QiW+PP7EXM=;
  b=jFuNLte+r8Iz+ndfpIedCjwfkAVg3XpoXg7Bspex5IpWZMWgArWluV9o
   3HJTBxa4f2BesOxw/1cgaooc9E6JzKXtx4GVYMHQXcAi1zcidSzlGMKVI
   5SXeFBmSWpOFcJ23m+6G0ThRJ+L/k9TaaFaSiZWTN6CTpX/UepkV1i14q
   5eVHs/7NSY6Rlbdwk3il9Nm0vgfc6ZjnOCpUKaswnMBCXYLuc03xkVD0G
   sOab4iN7Tnj47OnF38yVONW4MCnDXJpxJf+uBij16nMh3rqDlCX9j4xLK
   WLocY7lzQ6hA1lmCpWCSqo4JRX7geVOwDaIT1ZgYJfahdWJ14dbkc+YGM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="9066845"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="9066845"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 11:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="17061305"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Mar 2024 11:58:40 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkqHl-000DiF-0t;
	Thu, 14 Mar 2024 18:58:37 +0000
Date: Fri, 15 Mar 2024 02:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangchangzhong <zhangchangzhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20703/21864]
 kernel/sched/core.c:6988:5: sparse: sparse: symbol
 'tg_set_dynamic_affinity_mode' was not declared. Should it be static?
Message-ID: <202403150202.LRmQdyUB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c41e48598c428d3e38e9ce985a698070deb979b
commit: 713cfd2684fa5ea08b144d92b9858b932c0f1705 [20703/21864] sched: Introduce smart grid scheduling strategy for cfs
config: x86_64-randconfig-r111-20240313 (https://download.01.org/0day-ci/archive/20240315/202403150202.LRmQdyUB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403150202.LRmQdyUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403150202.LRmQdyUB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:133:6: sparse: sparse: symbol 'account_irqtime_to_task' was not declared. Should it be static?
   kernel/sched/core.c:1646:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:1646:17: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/core.c:1646:17: sparse:    struct sched_domain *
   kernel/sched/core.c:1830:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:1830:27: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:1830:27: sparse:    struct task_struct *
   kernel/sched/core.c:3508:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:3508:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:3508:17: sparse:    struct task_struct *
   kernel/sched/core.c:5501:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:5501:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:5501:9: sparse:    struct task_struct *
   kernel/sched/core.c:6699:11: sparse: sparse: symbol 'min_cfs_quota_period' was not declared. Should it be static?
   kernel/sched/core.c:6779:5: sparse: sparse: symbol 'tg_set_cfs_quota' was not declared. Should it be static?
   kernel/sched/core.c:6794:6: sparse: sparse: symbol 'tg_get_cfs_quota' was not declared. Should it be static?
   kernel/sched/core.c:6807:5: sparse: sparse: symbol 'tg_set_cfs_period' was not declared. Should it be static?
   kernel/sched/core.c:6820:6: sparse: sparse: symbol 'tg_get_cfs_period' was not declared. Should it be static?
>> kernel/sched/core.c:6988:5: sparse: sparse: symbol 'tg_set_dynamic_affinity_mode' was not declared. Should it be static?
>> kernel/sched/core.c:7025:5: sparse: sparse: symbol 'tg_set_affinity_period' was not declared. Should it be static?
>> kernel/sched/core.c:7036:5: sparse: sparse: symbol 'tg_get_affinity_period' was not declared. Should it be static?
   In file included from kernel/sched/core.c:8:
   In file included from kernel/sched/sched.h:52:
   In file included from include/linux/migrate.h:6:
   In file included from include/linux/mempolicy.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/core.c:8:
   kernel/sched/sched.h:1249:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1249 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:1587:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
    1587 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^
   kernel/sched/core.c:1587:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1587 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         | ^
         | static
   kernel/sched/core.c:2741:10: warning: cast from 'void (*)(struct callback_head *)' to 'void (*)(struct rq *)' converts to incompatible function type [-Wcast-function-type-strict]
    2741 |                 func = (void (*)(struct rq *))head->func;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:3771:35: warning: no previous prototype for function 'preempt_schedule_irq' [-Wmissing-prototypes]
    3771 | asmlinkage __visible void __sched preempt_schedule_irq(void)
         |                                   ^
   kernel/sched/core.c:3771:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3771 | asmlinkage __visible void __sched preempt_schedule_irq(void)
         |                      ^
         |                      static
   kernel/sched/core.c:6779:5: warning: no previous prototype for function 'tg_set_cfs_quota' [-Wmissing-prototypes]
    6779 | int tg_set_cfs_quota(struct task_group *tg, long cfs_quota_us)
         |     ^
   kernel/sched/core.c:6779:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6779 | int tg_set_cfs_quota(struct task_group *tg, long cfs_quota_us)
         | ^
         | static
   kernel/sched/core.c:6794:6: warning: no previous prototype for function 'tg_get_cfs_quota' [-Wmissing-prototypes]
    6794 | long tg_get_cfs_quota(struct task_group *tg)
         |      ^
   kernel/sched/core.c:6794:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6794 | long tg_get_cfs_quota(struct task_group *tg)
         | ^
         | static
   kernel/sched/core.c:6807:5: warning: no previous prototype for function 'tg_set_cfs_period' [-Wmissing-prototypes]
    6807 | int tg_set_cfs_period(struct task_group *tg, long cfs_period_us)
         |     ^
   kernel/sched/core.c:6807:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6807 | int tg_set_cfs_period(struct task_group *tg, long cfs_period_us)
         | ^
         | static
   kernel/sched/core.c:6820:6: warning: no previous prototype for function 'tg_get_cfs_period' [-Wmissing-prototypes]
    6820 | long tg_get_cfs_period(struct task_group *tg)
         |      ^
   kernel/sched/core.c:6820:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6820 | long tg_get_cfs_period(struct task_group *tg)
         | ^
         | static
   kernel/sched/core.c:6988:5: warning: no previous prototype for function 'tg_set_dynamic_affinity_mode' [-Wmissing-prototypes]
    6988 | int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
         |     ^
   kernel/sched/core.c:6988:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6988 | int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
         | ^
         | static
   kernel/sched/core.c:7025:5: warning: no previous prototype for function 'tg_set_affinity_period' [-Wmissing-prototypes]
    7025 | int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
         |     ^
   kernel/sched/core.c:7025:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7025 | int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
         | ^
         | static
   kernel/sched/core.c:7036:5: warning: no previous prototype for function 'tg_get_affinity_period' [-Wmissing-prototypes]
    7036 | u64 tg_get_affinity_period(struct task_group *tg)
         |     ^
   kernel/sched/core.c:7036:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7036 | u64 tg_get_affinity_period(struct task_group *tg)
         | ^
         | static
   In file included from kernel/sched/core.c:8:
   In file included from kernel/sched/sched.h:52:
   In file included from include/linux/migrate.h:6:
   include/linux/mempolicy.h:329:13: warning: unused function '__do_mbind' [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   13 warnings generated.
--
   kernel/sched/fair.c:47:14: sparse: sparse: symbol 'normalized_sysctl_sched_latency' was not declared. Should it be static?
   kernel/sched/fair.c:68:14: sparse: sparse: symbol 'normalized_sysctl_sched_min_granularity' was not declared. Should it be static?
   kernel/sched/fair.c:91:14: sparse: sparse: symbol 'normalized_sysctl_sched_wakeup_granularity' was not declared. Should it be static?
   kernel/sched/fair.c:141:14: sparse: sparse: symbol 'capacity_margin' was not declared. Should it be static?
   kernel/sched/fair.c:6933:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6933:14: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:6933:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:3682:6: sparse: sparse: symbol 'sync_entity_load_avg' was not declared. Should it be static?
   kernel/sched/fair.c:3695:6: sparse: sparse: symbol 'remove_entity_load_avg' was not declared. Should it be static?
   kernel/sched/fair.c:10761:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10761:22: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:10761:22: sparse:    struct sched_domain *
   kernel/sched/fair.c:10775:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10775:9: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:10775:9: sparse:    struct sched_domain *
   kernel/sched/fair.c:3870:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:3870:25: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/fair.c:3870:25: sparse:    struct sparsemask *
   kernel/sched/fair.c:3887:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:3887:25: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/fair.c:3887:25: sparse:    struct sparsemask *
   kernel/sched/fair.c:10985:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10985:25: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/fair.c:10985:25: sparse:    struct sparsemask *
>> kernel/sched/fair.c:5566:6: sparse: sparse: symbol 'free_affinity_domains' was not declared. Should it be static?
   kernel/sched/fair.c:5610:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5610:9: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:5610:9: sparse:    struct sched_domain *
   kernel/sched/fair.c:5632:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5632:9: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:5632:9: sparse:    struct sched_domain *
   kernel/sched/fair.c:6821:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6821:19: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:6821:19: sparse:    struct sched_domain *
   kernel/sched/fair.c:7258:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:7258:9: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:7258:9: sparse:    struct sched_domain *
   kernel/sched/fair.c:10126:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10126:9: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:10126:9: sparse:    struct sched_domain *
   kernel/sched/fair.c:10204:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10204:9: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:10204:9: sparse:    struct sched_domain *
   kernel/sched/fair.c:6688:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6688:15: sparse:    struct sched_domain_shared [noderef] __rcu *
   kernel/sched/fair.c:6688:15: sparse:    struct sched_domain_shared *
   kernel/sched/fair.c:6679:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6679:15: sparse:    struct sched_domain_shared [noderef] __rcu *
   kernel/sched/fair.c:6679:15: sparse:    struct sched_domain_shared *
   kernel/sched/fair.c:6688:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6688:15: sparse:    struct sched_domain_shared [noderef] __rcu *
   kernel/sched/fair.c:6688:15: sparse:    struct sched_domain_shared *
   kernel/sched/fair.c:6679:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6679:15: sparse:    struct sched_domain_shared [noderef] __rcu *
   kernel/sched/fair.c:6679:15: sparse:    struct sched_domain_shared *
   kernel/sched/fair.c:6660:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6660:17: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:6660:17: sparse:    struct sched_domain *
   kernel/sched/fair.c:10294:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10294:16: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:10294:16: sparse:    struct sched_domain *
   In file included from kernel/sched/fair.c:23:
   In file included from kernel/sched/sched.h:52:
   In file included from include/linux/migrate.h:6:
   In file included from include/linux/mempolicy.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/fair.c:23:
   kernel/sched/sched.h:1249:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1249 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3682:6: warning: no previous prototype for function 'sync_entity_load_avg' [-Wmissing-prototypes]
    3682 | void sync_entity_load_avg(struct sched_entity *se)
         |      ^
   kernel/sched/fair.c:3682:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3682 | void sync_entity_load_avg(struct sched_entity *se)
         | ^
         | static
   kernel/sched/fair.c:3695:6: warning: no previous prototype for function 'remove_entity_load_avg' [-Wmissing-prototypes]
    3695 | void remove_entity_load_avg(struct sched_entity *se)
         |      ^
   kernel/sched/fair.c:3695:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3695 | void remove_entity_load_avg(struct sched_entity *se)
         | ^
         | static
   kernel/sched/fair.c:5566:6: warning: no previous prototype for function 'free_affinity_domains' [-Wmissing-prototypes]
    5566 | void free_affinity_domains(struct affinity_domain *ad)
         |      ^
   kernel/sched/fair.c:5566:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5566 | void free_affinity_domains(struct affinity_domain *ad)
         | ^
         | static
   kernel/sched/fair.c:8613:7: warning: variable 'done' set but not used [-Wunused-but-set-variable]
    8613 |         bool done = true;
         |              ^
   In file included from kernel/sched/fair.c:23:
   In file included from kernel/sched/sched.h:52:
   In file included from include/linux/migrate.h:6:
   include/linux/mempolicy.h:329:13: warning: unused function '__do_mbind' [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   7 warnings generated.

vim +/tg_set_dynamic_affinity_mode +6988 kernel/sched/core.c

  6986	
  6987	#ifdef CONFIG_QOS_SCHED_SMART_GRID
> 6988	int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
  6989	{
  6990		struct auto_affinity *auto_affi = tg->auto_affinity;
  6991		int ret = 0;
  6992	
  6993		raw_spin_lock_irq(&auto_affi->lock);
  6994	
  6995		/* auto mode*/
  6996		if (mode == 1) {
  6997			start_auto_affinity(auto_affi);
  6998		} else if (mode == 0) {
  6999			stop_auto_affinity(auto_affi);
  7000		} else {
  7001			raw_spin_unlock_irq(&auto_affi->lock);
  7002			return -EINVAL;
  7003		}
  7004	
  7005		auto_affi->mode = mode;
  7006		raw_spin_unlock_irq(&auto_affi->lock);
  7007	
  7008		return ret;
  7009	}
  7010	
  7011	static u64 cpu_affinity_mode_read_u64(struct cgroup_subsys_state *css,
  7012						      struct cftype *cft)
  7013	{
  7014		struct task_group *tg = css_tg(css);
  7015	
  7016		return tg->auto_affinity->mode;
  7017	}
  7018	
  7019	static int cpu_affinity_mode_write_u64(struct cgroup_subsys_state *css,
  7020					   struct cftype *cftype, u64 mode)
  7021	{
  7022		return tg_set_dynamic_affinity_mode(css_tg(css), mode);
  7023	}
  7024	
> 7025	int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
  7026	{
  7027		if (period_ms > U64_MAX / NSEC_PER_MSEC)
  7028			return -EINVAL;
  7029	
  7030		raw_spin_lock_irq(&tg->auto_affinity->lock);
  7031		tg->auto_affinity->period = ms_to_ktime(period_ms);
  7032		raw_spin_unlock_irq(&tg->auto_affinity->lock);
  7033		return 0;
  7034	}
  7035	
> 7036	u64 tg_get_affinity_period(struct task_group *tg)
  7037	{
  7038		return ktime_to_ms(tg->auto_affinity->period);
  7039	}
  7040	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
