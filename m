Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDAF22D785
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 05:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765429719; cv=none; b=HJ62Csx+VJ6VGloLJUysIwgBjS6eiiLlPhmIGZynXcKmYF86ombUzc7/MRQNuP2dTWIltsK8hECAcFYSmt3BZSV1a9F+B3W8V5yRIjKdFINZReqzWhboIY0SRV9vTuvX7ZaC2US3+O/wlEqKY04pTEP8Fa92ZD4+XcLQyMZZQIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765429719; c=relaxed/simple;
	bh=BtJ9yBF4Ld7d4t2hQmOdVCG8wluHd18Ci6JC2gkZER4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b4nJ60YFi/zRlKKljzrELA69Bjoqruk27KYP69MYNdsbA0DtMUEEtUVq4V/lyH5shaL9yzShC9Sz5tFIbNTMF4NfUCnym3HP6PDZbsuSBJSdt2NmUgH93s9+vsA2bZEyBe1L5dqvds/brSA2SI5H/xBsvB0RrlSwDm+2lSpFshc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bElVld/i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bElVld/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765429718; x=1796965718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BtJ9yBF4Ld7d4t2hQmOdVCG8wluHd18Ci6JC2gkZER4=;
  b=bElVld/iL3Ha3dZcyth9Vm3k/2aLokQqRF57GNwlizjCoiTvMvv7og0y
   4kETUE9IespvMd8J3vFy0WxIZXg/LtDknf6FSrp0Z6v4Tl4oP946FHyai
   7+ASqb/JfdMHrHzIZv+gBqRDVZ314ld7Ye5RnEFbXOEwu4YO8pCcqOr5B
   Q6Td34wot86ZniWTkVo6GCMGrsqxE7j9HYL4SFX7ZLoQd1FRubhpFPtfW
   M6tTH6g8bHu+h6TayYx0eGonCQCeDjB1EDB3t28f4FdiyVr27QbnSexv2
   0Ae9gtCYC0ra2bC++IF/FXiUktG973gXNK564fypjEVlStSU/VpydG3TZ
   A==;
X-CSE-ConnectionGUID: 60daJXq+S5Sza49sc38WsA==
X-CSE-MsgGUID: x71pB8pmRD6HP4czqtEduQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78025411"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78025411"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 21:08:37 -0800
X-CSE-ConnectionGUID: iuyVeOR9Tgqb9SKD9pMUlg==
X-CSE-MsgGUID: XQsOKTtARSycD7WWEp21cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196709063"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2025 21:08:37 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTYuo-000000004Bz-0Wwo;
	Thu, 11 Dec 2025 05:08:34 +0000
Date: Thu, 11 Dec 2025 13:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 5/5]
 kernel/sched/group_balancer.c:1262:6: warning: no previous prototype for
 'add_tg_to_group_balancer_sched_domain'
Message-ID: <202512111354.C9wZUoJn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   38743d2d77ee27e7fe97c7ef81b8643365903536
commit: 0953f4ce33ed19d315abd333bf42a68cc511661f [5/5] anolis: sched: maintain group balancer task groups
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251211/202512111354.C9wZUoJn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111354.C9wZUoJn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111354.C9wZUoJn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/group_balancer.c:108:23: warning: no previous prototype for 'cpu_llc_mask' [-Wmissing-prototypes]
     108 | const struct cpumask *cpu_llc_mask(int cpu)
         |                       ^~~~~~~~~~~~
   kernel/sched/group_balancer.c:118:23: warning: no previous prototype for 'cpu_die_mask' [-Wmissing-prototypes]
     118 | const struct cpumask *cpu_die_mask(int cpu)
         |                       ^~~~~~~~~~~~
   kernel/sched/group_balancer.c:123:23: warning: no previous prototype for 'cpu_core_mask' [-Wmissing-prototypes]
     123 | const struct cpumask *cpu_core_mask(int cpu)
         |                       ^~~~~~~~~~~~~
   kernel/sched/group_balancer.c:128:23: warning: no previous prototype for 'cpu_root_mask' [-Wmissing-prototypes]
     128 | const struct cpumask *cpu_root_mask(int cpu)
         |                       ^~~~~~~~~~~~~
   kernel/sched/group_balancer.c:259:37: warning: no previous prototype for 'kernfs_to_gb_sd' [-Wmissing-prototypes]
     259 | struct group_balancer_sched_domain *kernfs_to_gb_sd(struct kernfs_node *kn)
         |                                     ^~~~~~~~~~~~~~~
   kernel/sched/group_balancer.c:267:37: warning: no previous prototype for 'group_balancer_kn_lock_live' [-Wmissing-prototypes]
     267 | struct group_balancer_sched_domain *group_balancer_kn_lock_live(struct kernfs_node *kn)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/group_balancer.c:281:6: warning: no previous prototype for 'group_balancer_kn_unlock' [-Wmissing-prototypes]
     281 | void group_balancer_kn_unlock(struct kernfs_node *kn)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/group_balancer.c:1067:6: warning: no previous prototype for 'sched_init_group_balancer_levels' [-Wmissing-prototypes]
    1067 | void sched_init_group_balancer_levels(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/group_balancer.c:1262:6: warning: no previous prototype for 'add_tg_to_group_balancer_sched_domain' [-Wmissing-prototypes]
    1262 | void add_tg_to_group_balancer_sched_domain(struct task_group *tg,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/group_balancer.c:1283:6: warning: no previous prototype for 'remove_tg_from_group_balancer_sched_domain' [-Wmissing-prototypes]
    1283 | void remove_tg_from_group_balancer_sched_domain(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/add_tg_to_group_balancer_sched_domain +1262 kernel/sched/group_balancer.c

  1251	
  1252	/*
  1253	 * When we attach/detach a task group to/from a domain, we hold the read lock
  1254	 * group_balancer_sched_domain_lock first, and then hold gb_sd->lock.
  1255	 * When we free a domain, we need to move task groups from domain to its parent, we
  1256	 * hold the write lock group_balancer_sched_domain_lock.
  1257	 * When we balance two domains, we hold the read lock group_balancer_sched_domain_lock
  1258	 * first, and then hold the locks of these two domains.
  1259	 * So that there will be no race.
  1260	 * TODO: Optimize the lock when we move task groups when balance.
  1261	 */
> 1262	void add_tg_to_group_balancer_sched_domain(struct task_group *tg,
  1263						   struct group_balancer_sched_domain *gb_sd)
  1264	{
  1265		int specs = tg->specs_ratio;
  1266		struct group_balancer_sched_domain *parent;
  1267	
  1268		tg->gb_sd = gb_sd;
  1269		raw_spin_lock(&gb_sd->lock);
  1270		rb_add(&tg->gb_node, &gb_sd->task_groups, tg_specs_less);
  1271		raw_spin_unlock(&gb_sd->lock);
  1272	
  1273		if (specs != -1) {
  1274			for (parent = gb_sd; parent; parent = parent->parent) {
  1275				raw_spin_lock(&parent->lock);
  1276				parent->free_tg_specs -= specs;
  1277				raw_spin_unlock(&parent->lock);
  1278			}
  1279		}
  1280		walk_tg_tree_from(tg, tg_set_soft_cpus_down, tg_nop, gb_sd_span(gb_sd));
  1281	}
  1282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
