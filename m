Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E20F24A05D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 12:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150006; cv=none; b=srl1zoV1qeSzpbYNAw2i8CaO4y5LrD9OT3Xez3vbht2RPzg0gexhXV0Lvax5qN7H2VUYJSV6qamen29Mwo6iD0OrvoVGjrxg3iiOsJzUzf8oeQqBC5bz+USaj/mffIFUKPl82laXhzRw8laY7pDwvZiHLpCRfCMSYUsfEMI3y9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150006; c=relaxed/simple;
	bh=xLmNnCHtWmvPtAVsoqdDl3Xf01JpnnQ5b0ZtbGWy3pg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ukZVWjCJlSzdHJ7qCkjamUoa9ioy+5o1iUlTNjj8k3zuch6IvZp30c0ZVscHrBm5KLMUSvjyc5iG5PEBJMGuq8PHcLjXrffUuii6D5QEF4MqloxIuvZj/T+BqDEZ2lqxCoKMcULXC5K1z5ZFSCp3qexOKXd8kUdwZUTzgrRrEEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nnYmzeKh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nnYmzeKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752150004; x=1783686004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xLmNnCHtWmvPtAVsoqdDl3Xf01JpnnQ5b0ZtbGWy3pg=;
  b=nnYmzeKhvG+DVEkexu6i2Y5YmQczL6qskkkDeLeE8JnMv2ihd1GBfLYR
   J6Sl1jvLYKnbo1mKPocN8XGd7ELEkTowcaDuLPDRXZWEC1410PWZQnugJ
   u0HrCTTaSRh5iE5p/dvg4lqBxCNwYNwaExmpjuRxfgHM4fIBJUsD9r1Fa
   eJIPw4YAhqMVXaalCkLdWDBLrxKK/QPfgJAo2+1GmY8U/yfhaJ3fV4chj
   x9pVbTB6ZUdzV6drtuv2S3Qwv2g3KOQPPDToqrU5KykgNprkba1SnWflc
   L7Mws4TKPfjjYd9ZM5IphHkmHKIsO+FAplIDdyZyLt8955py4d6WlIsZX
   A==;
X-CSE-ConnectionGUID: muWH5WVcSlq8iE/jo+BlvQ==
X-CSE-MsgGUID: PSGbwsPmQR66UJylSvSrxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54360665"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="54360665"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 05:20:03 -0700
X-CSE-ConnectionGUID: r2/SldwQTmK1/IcstKxLWg==
X-CSE-MsgGUID: xOqmbfi2Q+28MxveiT6UtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="160356058"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jul 2025 05:20:02 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZqFs-00050t-0E;
	Thu, 10 Jul 2025 12:20:00 +0000
Date: Thu, 10 Jul 2025 20:19:32 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 25/25]
 kernel/sched/group_balancer.c:1411:6: warning: no previous prototype for
 'update_free_tg_specs'
Message-ID: <202507102016.076iGYZx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   a4b5d3580fee42a67cb52a2e418d8747700a1edb
commit: 6f6c7b8117e139e02ffebb7d2744ff9ea6ba0499 [25/25] anolis: sched: fix deadlock when add/remove task group to/from gb_sd
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250710/202507102016.076iGYZx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507102016.076iGYZx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507102016.076iGYZx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/group_balancer.c:159:23: warning: no previous prototype for 'cpu_llc_mask' [-Wmissing-prototypes]
     159 | const struct cpumask *cpu_llc_mask(int cpu)
         |                       ^~~~~~~~~~~~
   kernel/sched/group_balancer.c:169:23: warning: no previous prototype for 'cpu_die_mask' [-Wmissing-prototypes]
     169 | const struct cpumask *cpu_die_mask(int cpu)
         |                       ^~~~~~~~~~~~
   kernel/sched/group_balancer.c:174:23: warning: no previous prototype for 'cpu_core_mask' [-Wmissing-prototypes]
     174 | const struct cpumask *cpu_core_mask(int cpu)
         |                       ^~~~~~~~~~~~~
   kernel/sched/group_balancer.c:179:23: warning: no previous prototype for 'cpu_root_mask' [-Wmissing-prototypes]
     179 | const struct cpumask *cpu_root_mask(int cpu)
         |                       ^~~~~~~~~~~~~
   kernel/sched/group_balancer.c:315:37: warning: no previous prototype for 'kernfs_to_gb_sd' [-Wmissing-prototypes]
     315 | struct group_balancer_sched_domain *kernfs_to_gb_sd(struct kernfs_node *kn)
         |                                     ^~~~~~~~~~~~~~~
   kernel/sched/group_balancer.c:323:37: warning: no previous prototype for 'group_balancer_kn_lock_live' [-Wmissing-prototypes]
     323 | struct group_balancer_sched_domain *group_balancer_kn_lock_live(struct kernfs_node *kn)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/group_balancer.c:337:6: warning: no previous prototype for 'group_balancer_kn_unlock' [-Wmissing-prototypes]
     337 | void group_balancer_kn_unlock(struct kernfs_node *kn)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/group_balancer.c:1171:6: warning: no previous prototype for 'sched_init_group_balancer_levels' [-Wmissing-prototypes]
    1171 | void sched_init_group_balancer_levels(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/group_balancer.c:1411:6: warning: no previous prototype for 'update_free_tg_specs' [-Wmissing-prototypes]
    1411 | void update_free_tg_specs(struct group_balancer_sched_domain *gb_sd, int specs)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/group_balancer.c:1434:6: warning: no previous prototype for 'add_tg_to_group_balancer_sched_domain_locked' [-Wmissing-prototypes]
    1434 | void add_tg_to_group_balancer_sched_domain_locked(struct task_group *tg,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/group_balancer.c:1448:6: warning: no previous prototype for 'add_tg_to_group_balancer_sched_domain' [-Wmissing-prototypes]
    1448 | void add_tg_to_group_balancer_sched_domain(struct task_group *tg,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/update_free_tg_specs +1411 kernel/sched/group_balancer.c

  1410	
> 1411	void update_free_tg_specs(struct group_balancer_sched_domain *gb_sd, int specs)
  1412	{
  1413		struct group_balancer_sched_domain *parent;
  1414	
  1415		if (specs != -1) {
  1416			for (parent = gb_sd; parent; parent = parent->parent) {
  1417				raw_spin_lock(&parent->lock);
  1418				parent->free_tg_specs += specs;
  1419				raw_spin_unlock(&parent->lock);
  1420			}
  1421		}
  1422	}
  1423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
