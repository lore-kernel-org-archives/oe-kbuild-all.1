Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558B5208CF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcTEJ2Du"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697040045; x=1728576045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oXMnYxIiX7xy3BIyOGdnvN04ln8W9JfNMLEj3lcglLw=;
  b=GcTEJ2Du0Cz5pHy7tsvP9Xzbch4ki7jI2+F7gGkFJHRws+j/4uLjeGFs
   XINfx0Z+GnK1opT7+EFEjPF21gx5fUT2UfZxq0SK1cWtfIImkpb1gFzIR
   0oXb9hgjn8aFxjYRkUUruGckNwK3Iu9ikeA5Wd2ZZleHRYFLDKIk2R4ci
   SH+JyGqFszdUjef886BG73RQ5OaVo20F1YHogRsmPAVDobY6oGoacy9Ed
   xKpt9jvIVNNjQH/3K9QT2HWWy5ar1EbYlIvTq3o5VvyVjHyvvPXftx/P3
   vLv6J+PqkLrM/dRiTGiYDDx7YAwLcNqz26dYboAkiltiIQMyJa/kOb+N6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="470960659"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="470960659"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 09:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897682523"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="897682523"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2023 08:58:56 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqbdY-0002On-0Q;
	Wed, 11 Oct 2023 16:00:40 +0000
Date: Wed, 11 Oct 2023 23:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:kmem_performance.1 4/7] mm/memcontrol.c:3016:17: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202310112350.UJ6bHCq8-lkp@intel.com>
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
config: x86_64-randconfig-123-20230930 (https://download.01.org/0day-ci/archive/20231011/202310112350.UJ6bHCq8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310112350.UJ6bHCq8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310112350.UJ6bHCq8-lkp@intel.com/

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
