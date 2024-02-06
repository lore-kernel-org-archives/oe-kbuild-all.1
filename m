Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064761339AC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707222487; cv=none; b=b+xkpkAU3MyV72CvoibXuwVlGzem38Znk5DkUuw/NCtpjPLmT6LfjbmW+Ce8H7auwAP5VO82UXWOaXnofcxV/vnG4n9mfoGe2SFlo3xJj02j54Fp5oVb+6zddcBarbVScB5YZhtCaXEF8wll/QU1UFTdjYVVGRASRm07KXnfFUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707222487; c=relaxed/simple;
	bh=LEIc070BVx4Rfg3o8WduIQ2tthnaVwO/61uwk3fu5Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c0wDcGH1T9QZV0jKpGMrQJgH3R81JdaCg5+Ysg/yuPyzMvrttMkChXQfVa5yeI01Plwqs3jC8rbWcMIe5HH9vRslKrAX2LtESCyCSMmo6EW+b3B/ZJzGiBne5s7ZbIuToaBOd0w7XqGBgnHNLuYhIOrly+YiqLnMJr63EjIVna8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qwj3UZfs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qwj3UZfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707222485; x=1738758485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LEIc070BVx4Rfg3o8WduIQ2tthnaVwO/61uwk3fu5Sc=;
  b=Qwj3UZfsl+lemqPXH7mKs0lNaMx41o8sNSS368bYgH9zXTn6aZN2F//Z
   JkjAaDfkMC2pPIdJX65DJcLaeyGB592snXTHq9JGeIexv01lmG+LWUsP1
   FIVVooo29MKwrecRoxnJNszYmsMZ9QzlMLS7lWFJaA4Ds3tzdWRZ+kOH7
   kPljgSJA2yxfKQX3qInIsMcbP3iFD3DA6y79sr/C+iw5ifmvHker0inOB
   ifzw2zOkESLE+b5K7A4epUQUvmnK4a/a0LD9vj8dXyjkSyMOX05IR86W9
   HWL3LaCNB/BOOntThAFB4+L1RB5bMYMLeDB7Ozs0anc0qzoil7Z9V04zp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="632710"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="632710"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 04:28:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1056695"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Feb 2024 04:28:03 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXKYT-0001Mk-0E;
	Tue, 06 Feb 2024 12:28:01 +0000
Date: Tue, 6 Feb 2024 20:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19669/21616]
 kernel/sched/fair.c:6701:19: error: incomplete definition of type 'struct
 task_group'
Message-ID: <202402062002.kXYC72o0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: 70a232a564cfa99401d197708cf380398ad5e2d7 [19669/21616] sched: Adjust wakeup cpu range according CPU util dynamicly
config: x86_64-randconfig-102-20240206 (https://download.01.org/0day-ci/archive/20240206/202402062002.kXYC72o0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402062002.kXYC72o0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402062002.kXYC72o0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:23:
   In file included from kernel/sched/sched.h:52:
   In file included from include/linux/migrate.h:6:
   In file included from include/linux/mempolicy.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/fair.c:23:
   kernel/sched/sched.h:1201:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1201 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3675:6: warning: no previous prototype for function 'sync_entity_load_avg' [-Wmissing-prototypes]
    3675 | void sync_entity_load_avg(struct sched_entity *se)
         |      ^
   kernel/sched/fair.c:3675:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3675 | void sync_entity_load_avg(struct sched_entity *se)
         | ^
         | static 
   kernel/sched/fair.c:3688:6: warning: no previous prototype for function 'remove_entity_load_avg' [-Wmissing-prototypes]
    3688 | void remove_entity_load_avg(struct sched_entity *se)
         |      ^
   kernel/sched/fair.c:3688:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3688 | void remove_entity_load_avg(struct sched_entity *se)
         | ^
         | static 
   kernel/sched/fair.c:5206:6: warning: no previous prototype for function 'init_cfs_bandwidth' [-Wmissing-prototypes]
    5206 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^
   kernel/sched/fair.c:5206:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5206 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         | ^
         | static 
>> kernel/sched/fair.c:6701:19: error: incomplete definition of type 'struct task_group'
    6701 |                 if (unlikely(!tg->se[cpu]))
         |                               ~~^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/sched.h:57:8: note: forward declaration of 'struct task_group'
      57 | struct task_group;
         |        ^
   kernel/sched/fair.c:6707:40: error: incomplete definition of type 'struct task_group'
    6707 |                         spare = (long)(capacity_of(cpu) - tg->se[cpu]->avg.util_avg);
         |                                                           ~~^
   include/linux/sched.h:57:8: note: forward declaration of 'struct task_group'
      57 | struct task_group;
         |        ^
   kernel/sched/fair.c:6720:21: error: incomplete definition of type 'struct task_group'
    6720 |                 util_avg_sum += tg->se[cpu]->avg.util_avg;
         |                                 ~~^
   include/linux/sched.h:57:8: note: forward declaration of 'struct task_group'
      57 | struct task_group;
         |        ^
   kernel/sched/fair.c:6747:16: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    6747 |         unsigned long time;
         |                       ^
   kernel/sched/fair.c:7291:16: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    7291 |         unsigned long time;
         |                       ^
   kernel/sched/fair.c:11034:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
    11034 | void free_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:11034:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11034 | void free_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:11036:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
    11036 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          |     ^
   kernel/sched/fair.c:11036:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11036 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          | ^
          | static 
   kernel/sched/fair.c:11041:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
    11041 | void online_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:11041:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11041 | void online_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:11043:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
    11043 | void unregister_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:11043:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11043 | void unregister_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   11 warnings and 3 errors generated.


vim +6701 kernel/sched/fair.c

  6670	
  6671	/*
  6672	 * set_task_select_cpus: select the cpu range for task
  6673	 * @p: the task whose available cpu range will to set
  6674	 * @idlest_cpu: the cpu which is the idlest in prefer cpus
  6675	 *
  6676	 * If sum of 'util_avg' among 'preferred_cpus' lower than the percentage
  6677	 * 'sysctl_sched_util_low_pct' of 'preferred_cpus' capacity, select
  6678	 * 'preferred_cpus' range for task, otherwise select 'preferred_cpus' for task.
  6679	 *
  6680	 * The available cpu range set to p->select_cpus. Idlest cpu in preferred cpus
  6681	 * set to @idlest_cpu, which is set to wakeup cpu when fast path wakeup cpu
  6682	 * without p->select_cpus.
  6683	 */
  6684	static void set_task_select_cpus(struct task_struct *p, int *idlest_cpu,
  6685					 int sd_flag)
  6686	{
  6687		unsigned long util_avg_sum = 0;
  6688		unsigned long tg_capacity = 0;
  6689		long min_util = INT_MIN;
  6690		struct task_group *tg;
  6691		long spare;
  6692		int cpu;
  6693	
  6694		p->select_cpus = &p->cpus_allowed;
  6695		if (!prefer_cpus_valid(p))
  6696			return;
  6697	
  6698		rcu_read_lock();
  6699		tg = task_group(p);
  6700		for_each_cpu(cpu, p->prefer_cpus) {
> 6701			if (unlikely(!tg->se[cpu]))
  6702				continue;
  6703	
  6704			if (idlest_cpu && available_idle_cpu(cpu)) {
  6705				*idlest_cpu = cpu;
  6706			} else if (idlest_cpu) {
  6707				spare = (long)(capacity_of(cpu) - tg->se[cpu]->avg.util_avg);
  6708				if (spare > min_util) {
  6709					min_util = spare;
  6710					*idlest_cpu = cpu;
  6711				}
  6712			}
  6713	
  6714			if (available_idle_cpu(cpu)) {
  6715				rcu_read_unlock();
  6716				p->select_cpus = p->prefer_cpus;
  6717				return;
  6718			}
  6719	
  6720			util_avg_sum += tg->se[cpu]->avg.util_avg;
  6721			tg_capacity += capacity_of(cpu);
  6722		}
  6723		rcu_read_unlock();
  6724	
  6725		if (tg_capacity > cpumask_weight(p->prefer_cpus) &&
  6726		    util_avg_sum * 100 <= tg_capacity * sysctl_sched_util_low_pct) {
  6727			p->select_cpus = p->prefer_cpus;
  6728		}
  6729	}
  6730	#endif
  6731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
