Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A862C2F9D9A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 08:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767945748; cv=none; b=o62ckDKPng/qbI7oReecS/5kyy842gLb/7a4UlEBhb0m/cRXozMAnR3LAM/DPcC1Nx3L3lRdvra2D34YYLSY9EYzvjGSJZnM91yrX0t4L7zaUCMMj0maYi8R2dqBMscHaAR6XnY0wGYvDaKNLPrlSKfZi0STyIbpiRsXcVG0RDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767945748; c=relaxed/simple;
	bh=Rg9tAtZfoA1d0wpg4v30vrjpKfeeaJ/atLyexEIwyR8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z3gjc3FRDlEI6LpJ2K7sVEmNMigo3VFXpGpozh7oozn+MG3ArzSK7DMT+5FVqlHgR5bl5sgjfn+JsLlP1VvBJFgi7NjJDeEja1Wv9zUVwCtbFk292s7/Rh0b4ChOVQHzBsJFUvnK5mFeLGjmEuSliDFKjZGpp/WR2tOTOT4mwjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4meEa2I; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4meEa2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767945747; x=1799481747;
  h=date:from:to:cc:subject:message-id;
  bh=Rg9tAtZfoA1d0wpg4v30vrjpKfeeaJ/atLyexEIwyR8=;
  b=H4meEa2I5Ap8Lrm4HKwWoLb40F6RhKtRs+DmVaQjtn48AOlwd36r5nR6
   J2f1eIUeJFtTp/aqVnhSL3+x4MVgsaeyzP2d1sVvRCWmOLexpMza493yA
   axTFcVO5gpDF1S5nl/TO6xhyOrd6nA+V8Qt6OwkJ5KDhlnTvCrAlpPny1
   Fo6WwivVjuIDbvLQGWzIDSR/gYtfpB+4CQfhSdSEKy5Wy/PgYNYOH2QbA
   RBNrxFQMjGxuMsuQnGigwZZ7x1uIlvSl1BCEiudWeRA5r+eq5RTeu1iJC
   Hkt5zZd+RvrECljGu01M/+D1Cn89yc5FZNACoxkL58d5warTsZnCBxPXP
   w==;
X-CSE-ConnectionGUID: bSFVW50xQc2joJSc1r2P1w==
X-CSE-MsgGUID: INxUJBRsTTqzkcaTgZCZAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80436349"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="80436349"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 00:02:27 -0800
X-CSE-ConnectionGUID: J3LKdtsoQhuGTswF7is+ng==
X-CSE-MsgGUID: 5ezGU6UpQ62voCWaDnSWCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203039103"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jan 2026 00:02:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve7Ru-000000005cq-37eG;
	Fri, 09 Jan 2026 08:02:22 +0000
Date: Fri, 09 Jan 2026 16:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v7 4/8]
 include/linux/cpuset.h:312:20: error: redefinition of
 'cpuset_sysram_nodes_allowed'
Message-ID: <202601091533.jxFh2Kt9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v7
head:   354a292e4159ea3350cbb9653e8a16b0e34d04df
commit: 8e120b8da3a1fe6cd7d3321c333cba6b21d09601 [4/8] cpuset: introduce cpuset.mems.sysram
config: parisc-randconfig-002-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091533.jxFh2Kt9-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091533.jxFh2Kt9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091533.jxFh2Kt9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/sched/isolation.h:5,
                    from kernel/workqueue.c:52:
>> include/linux/cpuset.h:312:20: error: redefinition of 'cpuset_sysram_nodes_allowed'
     312 | static inline void cpuset_sysram_nodes_allowed(struct cgroup *cgroup,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpuset.h:223:20: note: previous definition of 'cpuset_sysram_nodes_allowed' with type 'void(struct cgroup *, nodemask_t *)'
     223 | static inline void cpuset_sysram_nodes_allowed(struct cgroup *cgroup,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/cpuset.h:318:19: error: redefinition of 'cpuset_sysram_nodemask'
     318 | static nodemask_t cpuset_sysram_nodemask(struct task_struct *p)
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpuset.h:229:26: note: previous definition of 'cpuset_sysram_nodemask' with type 'nodemask_t(struct task_struct *)'
     229 | static inline nodemask_t cpuset_sysram_nodemask(struct task_struct *p)
         |                          ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/cpuset.h:318:19: warning: 'cpuset_sysram_nodemask' defined but not used [-Wunused-function]
     318 | static nodemask_t cpuset_sysram_nodemask(struct task_struct *p)
         |                   ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/sched/isolation.h:5,
                    from kernel/sched/build_policy.c:19:
>> include/linux/cpuset.h:312:20: error: redefinition of 'cpuset_sysram_nodes_allowed'
     312 | static inline void cpuset_sysram_nodes_allowed(struct cgroup *cgroup,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpuset.h:223:20: note: previous definition of 'cpuset_sysram_nodes_allowed' with type 'void(struct cgroup *, nodemask_t *)'
     223 | static inline void cpuset_sysram_nodes_allowed(struct cgroup *cgroup,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/cpuset.h:318:19: error: redefinition of 'cpuset_sysram_nodemask'
     318 | static nodemask_t cpuset_sysram_nodemask(struct task_struct *p)
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpuset.h:229:26: note: previous definition of 'cpuset_sysram_nodemask' with type 'nodemask_t(struct task_struct *)'
     229 | static inline nodemask_t cpuset_sysram_nodemask(struct task_struct *p)
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c:12:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
      12 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~
>> include/linux/cpuset.h:318:19: warning: 'cpuset_sysram_nodemask' defined but not used [-Wunused-function]
     318 | static nodemask_t cpuset_sysram_nodemask(struct task_struct *p)
         |                   ^~~~~~~~~~~~~~~~~~~~~~


vim +/cpuset_sysram_nodes_allowed +312 include/linux/cpuset.h

   311	
 > 312	static inline void cpuset_sysram_nodes_allowed(struct cgroup *cgroup,
   313						       nodemask_t *mask)
   314	{
   315		nodes_copy(*mask, node_states[N_MEMORY]);
   316	}
   317	
 > 318	static nodemask_t cpuset_sysram_nodemask(struct task_struct *p)
   319	{
   320		return node_states[N_MEMORY];
   321	}
   322	#endif /* !CONFIG_CPUSETS */
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
