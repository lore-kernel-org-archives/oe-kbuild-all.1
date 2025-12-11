Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388EE28CF41
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 06:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765435370; cv=none; b=s7Aa/q+T9U06pOVPQUfkKgaG1IxeGqauQ+J+aafdfkzn5ouhLzevwuwVNQ4vPn/Ix4JszwLewEOZF5KRuB1oGJio2rqhz92ttLYDCVvkLRdvSxo/DR7KdNZVnjrvr015CXRlaDDn77AzDcJ1K/gBFM+qmcmAAXBn2BTa5Qlb+4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765435370; c=relaxed/simple;
	bh=cBKMtD9ANzaM9JwWVdLgd9POYqu7g57N4IhSfvsS3d4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WAvbwFzsB7ZfD2D+rWIR/23ZoTyMnZK5V1kN8FQ+hkTyZIWASUAXW4cRakU/SmJsawnyvNJTBC1XLPolVxDFdSaoN30b3+F/fMDNK/k/k/wcVq0L51NAqA32pERomP5T+Hp8LTg49Bo47ZSOKt8ZWsHS4036Gj8OOLlY/hNYSgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiOjCrTE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiOjCrTE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765435368; x=1796971368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cBKMtD9ANzaM9JwWVdLgd9POYqu7g57N4IhSfvsS3d4=;
  b=DiOjCrTEpzw06oEqRXpSGgZREEaO+83VxqbS6GAtrhrD9DtKEZehuNj7
   3oNGkDyiUNdSUP2zaIAodPMTSmlzHbKwQCkIS1NSrTd1RrqB2LksPdD+v
   Y86GZ0Rze5x6OHIQ5Klg4V33BVKTGnuL5DVtA8Oprr5riTgTHTVDodywh
   X3ZZmpGh3KZd06uLQQaOTWkZj6iRmjEPt8hDB8Fhh3B1EeKvW2b/It/ph
   7JRSqhfCFcDIA9f7X0aOxTwLtnHJH97msgM63ZoNQtYxODZ7YfVaJVMyp
   NfKefe72si6e5m4Aynll9U2ePIQbBEV0d/QZ2+Q+GHWvM/zaB6jlUrWy1
   A==;
X-CSE-ConnectionGUID: xca0EydYRga81pP2k7Aw9Q==
X-CSE-MsgGUID: Ajw7QNAxSSm97vjWHAXusQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67451077"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67451077"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 22:42:45 -0800
X-CSE-ConnectionGUID: Uruvww5SRqiqUIhU2NnAng==
X-CSE-MsgGUID: i7Kb910wQRCuH2HIUQcNCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196619958"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Dec 2025 22:42:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTaNt-000000004Jn-3KlL;
	Thu, 11 Dec 2025 06:42:41 +0000
Date: Thu, 11 Dec 2025 14:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 5/5]
 kernel/sched/group_balancer.c:1310:6: warning: no previous prototype for
 'add_tg_to_group_balancer_sched_domain_locked'
Message-ID: <202512111420.G44AU9Z6-lkp@intel.com>
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
commit: b5f72f490c749f52c40e6d351d9823d115a6c95e [5/5] anolis: sched: modify the interface of attach/detach_tg_to/from_group_balancer_sched_domain
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251211/202512111420.G44AU9Z6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111420.G44AU9Z6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111420.G44AU9Z6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/group_balancer.c:141:23: warning: no previous prototype for 'cpu_llc_mask' [-Wmissing-prototypes]
     141 | const struct cpumask *cpu_llc_mask(int cpu)
         |                       ^~~~~~~~~~~~
   kernel/sched/group_balancer.c:151:23: warning: no previous prototype for 'cpu_die_mask' [-Wmissing-prototypes]
     151 | const struct cpumask *cpu_die_mask(int cpu)
         |                       ^~~~~~~~~~~~
   kernel/sched/group_balancer.c:156:23: warning: no previous prototype for 'cpu_core_mask' [-Wmissing-prototypes]
     156 | const struct cpumask *cpu_core_mask(int cpu)
         |                       ^~~~~~~~~~~~~
   kernel/sched/group_balancer.c:161:23: warning: no previous prototype for 'cpu_root_mask' [-Wmissing-prototypes]
     161 | const struct cpumask *cpu_root_mask(int cpu)
         |                       ^~~~~~~~~~~~~
   kernel/sched/group_balancer.c:292:37: warning: no previous prototype for 'kernfs_to_gb_sd' [-Wmissing-prototypes]
     292 | struct group_balancer_sched_domain *kernfs_to_gb_sd(struct kernfs_node *kn)
         |                                     ^~~~~~~~~~~~~~~
   kernel/sched/group_balancer.c:300:37: warning: no previous prototype for 'group_balancer_kn_lock_live' [-Wmissing-prototypes]
     300 | struct group_balancer_sched_domain *group_balancer_kn_lock_live(struct kernfs_node *kn)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/group_balancer.c:314:6: warning: no previous prototype for 'group_balancer_kn_unlock' [-Wmissing-prototypes]
     314 | void group_balancer_kn_unlock(struct kernfs_node *kn)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/group_balancer.c:1105:6: warning: no previous prototype for 'sched_init_group_balancer_levels' [-Wmissing-prototypes]
    1105 | void sched_init_group_balancer_levels(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/group_balancer.c:1310:6: warning: no previous prototype for 'add_tg_to_group_balancer_sched_domain_locked' [-Wmissing-prototypes]
    1310 | void add_tg_to_group_balancer_sched_domain_locked(struct task_group *tg,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/group_balancer.c:1335:6: warning: no previous prototype for 'add_tg_to_group_balancer_sched_domain' [-Wmissing-prototypes]
    1335 | void add_tg_to_group_balancer_sched_domain(struct task_group *tg,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/add_tg_to_group_balancer_sched_domain_locked +1310 kernel/sched/group_balancer.c

  1299	
  1300	/*
  1301	 * When we attach/detach a task group to/from a domain, we hold the read lock
  1302	 * group_balancer_sched_domain_lock first, and then hold gb_sd->lock.
  1303	 * When we free a domain, we need to move task groups from domain to its parent, we
  1304	 * hold the write lock group_balancer_sched_domain_lock.
  1305	 * When we balance two domains, we hold the read lock group_balancer_sched_domain_lock
  1306	 * first, and then hold the locks of these two domains.
  1307	 * So that there will be no race.
  1308	 * TODO: Optimize the lock when we move task groups when balance.
  1309	 */
> 1310	void add_tg_to_group_balancer_sched_domain_locked(struct task_group *tg,
  1311							  struct group_balancer_sched_domain *gb_sd,
  1312							  bool enable)
  1313	{
  1314		int specs = tg->specs_ratio;
  1315		struct group_balancer_sched_domain *parent;
  1316	
  1317		tg->gb_sd = gb_sd;
  1318		rb_add(&tg->gb_node, &gb_sd->task_groups, tg_specs_less);
  1319	
  1320		if (specs != -1) {
  1321			for (parent = gb_sd; parent; parent = parent->parent) {
  1322				raw_spin_lock(&parent->lock);
  1323				parent->free_tg_specs -= specs;
  1324				raw_spin_unlock(&parent->lock);
  1325			}
  1326		}
  1327	
  1328		tg->soft_cpus_allowed_ptr = gb_sd_span(gb_sd);
  1329		if (enable)
  1330			walk_tg_tree_from(tg, tg_set_gb_tg_down, tg_nop, tg);
  1331	
  1332		check_task_group_leap_level(tg, gb_sd);
  1333	}
  1334	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
