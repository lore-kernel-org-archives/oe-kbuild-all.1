Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ED117E3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 05:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696139198; x=1727675198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KUJWb8i15/7piQvXp2WBf0phCJrw7w1+WO7xjoEE+5s=;
  b=MTsiuYouENwyOlJOyRLHA1Zb1BhsWsy02MeFXPhsa8J4Iv+PYGfn7TUG
   exhJ7W/5SyJwp+oiTQ22VrdLV/15atL4ragSdgFo09Vnd54CAlLguALZ4
   eT9r6JiEjg5dqVMJGQO8lZghwGg+EbWAQhawtgc3pbJxSqCluj1kDs3rb
   3TdaSSmU8u3b2nuVYTj5v7aPcEcFLxq2MKYzqA2f7ebA5bZ5x2ER0vRsp
   YlpE+tRhzJ5CCmm8Zi0jAtfiTyMLXRS6tvy+GUACTJqjLgKO5oBPrxJtc
   UM7dSqwF9NP3ajODOTAxwLfxBzUCmlHs8wbWUjBziLnLxoHIL+Yhf6p3B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="4069980"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="4069980"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 22:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="1081327755"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="1081327755"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Sep 2023 22:46:35 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmpHk-0004nv-2y;
	Sun, 01 Oct 2023 05:46:32 +0000
Date: Sun, 1 Oct 2023 13:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:kmem_performance.1 4/7] mm/memcontrol.c:3016:17: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202310011333.iSgIn8LO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git kmem_performance.1
head:   4ce474b7270a507dd448b335168acb30e9fe7d46
commit: 1b638f41428889e8e7ab15b64939d9ceeeabfbd5 [4/7] mm: kmem: add direct objcg pointer to task_struct
config: x86_64-randconfig-123-20230930 (https://download.01.org/0day-ci/archive/20231001/202310011333.iSgIn8LO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310011333.iSgIn8LO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310011333.iSgIn8LO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memcontrol.c:3016:17: sparse: sparse: Using plain integer as NULL pointer
   mm/memcontrol.c:3032:23: sparse: sparse: Using plain integer as NULL pointer
   mm/memcontrol.c:4242:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4242:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4242:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4244:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4244:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4244:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4400:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4400:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4400:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4494:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4494:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4494:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:6206:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:6206:23: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:6206:23: sparse:    struct task_struct *
   mm/memcontrol.c:6443:52: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:6443:52: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:6443:52: sparse:    struct task_struct *
   mm/memcontrol.c: note: in included file:
   include/linux/memcontrol.h:761:9: sparse: sparse: context imbalance in 'folio_lruvec_lock' - wrong count at exit
   include/linux/memcontrol.h:761:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irq' - wrong count at exit
   include/linux/memcontrol.h:761:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irqsave' - wrong count at exit
   mm/memcontrol.c:2095:6: sparse: sparse: context imbalance in 'folio_memcg_lock' - wrong count at exit
   mm/memcontrol.c:2142:17: sparse: sparse: context imbalance in '__folio_memcg_unlock' - unexpected unlock
   mm/memcontrol.c:6056:28: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   mm/memcontrol.c:6251:36: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

vim +3016 mm/memcontrol.c

  3003	
  3004	static struct obj_cgroup *current_objcg_update(struct obj_cgroup *old)
  3005	{
  3006		struct mem_cgroup *memcg;
  3007		struct obj_cgroup *objcg = NULL, *tmp = old;
  3008	
  3009		old = current_objcg_without_update_flag(old);
  3010		if (old)
  3011			obj_cgroup_put(old);
  3012	
  3013		rcu_read_lock();
  3014		do {
  3015			/* Atomically drop the update bit, */
> 3016			WARN_ON_ONCE(cmpxchg(&current->objcg, tmp, 0) != tmp);
  3017	
  3018			/* ...obtain the new objcg pointer */
  3019			memcg = mem_cgroup_from_task(current);
  3020			for (; memcg != root_mem_cgroup; memcg = parent_mem_cgroup(memcg)) {
  3021				objcg = rcu_dereference(memcg->objcg);
  3022				if (objcg && obj_cgroup_tryget(objcg))
  3023					break;
  3024				objcg = NULL;
  3025			}
  3026	
  3027			/*
  3028			 * ...and try atomically set up a new objcg pointer. If it
  3029			 * fails, it means the update flag was set concurrently, so
  3030			 * the whole procedure should be repeated.
  3031			 */
  3032			tmp = 0;
  3033		} while (!try_cmpxchg(&current->objcg, &tmp, objcg));
  3034		rcu_read_unlock();
  3035	
  3036		return objcg;
  3037	}
  3038	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
