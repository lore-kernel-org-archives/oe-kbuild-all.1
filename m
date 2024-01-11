Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C01353E16
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 19:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuWLr0ch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705001857; x=1736537857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+7pLyIPOrGsS6alMT3nnjKoSt2FVMcCiFrTa7HW0XPI=;
  b=PuWLr0chY9Hiy3d7vU2IRltNYFMJMG8M65+Swpu1bj6vOisNTG7prRkG
   c/nCruNSwVDh49VCQe+CuVGHyaYX+KTxPRmawlYF5+KMvMGE2MXCDwqcj
   Ch5ZwL7VS5ITFMPI9ukAQhgsaibxOmLDt54JvCIBEs6FJp/gEb/Qr7krV
   TDF5eHehh5cz7JK68J/6O004VzD7zdwEUI2QMNud7e9DdLr9diE9vBKr4
   NfgTVA3pvIQwPZ36nSxPMozufwpsrzKb0s+t9AG4hmJ8DQ5mPxcnvayZ5
   hmTiN3HUPAFiE8Gwq7G1ukWSLCJnH21UmxWOyZusgANbTHumncQSx2Xfa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="485140545"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="485140545"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 11:37:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="17140903"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2024 11:37:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rO0rt-0008fy-1m;
	Thu, 11 Jan 2024 19:37:33 +0000
Date: Fri, 12 Jan 2024 03:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2271/2356] kernel/sched/psi.c:908:31: error: use
 of undeclared identifier 'cpuacct_cgrp_id'; did you mean 'cpu_cgrp_id'?
Message-ID: <202401120334.tGS5AHXP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea6de9f6732d495c506f9c140b4ec17c957e1b77
commit: 2dfc29e742a07863c2426aea03d5c2c97b558b9d [2271/2356] sched/psi: Export cgroup psi from cgroupv2 to cgroupv1
config: x86_64-randconfig-005-20240111 (https://download.01.org/0day-ci/archive/20240112/202401120334.tGS5AHXP-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401120334.tGS5AHXP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401120334.tGS5AHXP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:97:
>> kernel/sched/psi.c:908:31: error: use of undeclared identifier 'cpuacct_cgrp_id'; did you mean 'cpu_cgrp_id'?
     908 |                         cgroup = task_cgroup(task, cpuacct_cgrp_id);
         |                                                    ^~~~~~~~~~~~~~~
         |                                                    cpu_cgrp_id
   include/linux/cgroup_subsys.h:17:1: note: 'cpu_cgrp_id' declared here
      17 | SUBSYS(cpu)
         | ^
   include/linux/cgroup-defs.h:42:20: note: expanded from macro 'SUBSYS'
      42 | #define SUBSYS(_x) _x ## _cgrp_id,
         |                    ^
   <scratch space>:298:1: note: expanded from here
     298 | cpu_cgrp_id
         | ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +908 kernel/sched/psi.c

   899	
   900	static inline struct psi_group *task_psi_group(struct task_struct *task)
   901	{
   902	#ifdef CONFIG_CGROUPS
   903		if (static_branch_likely(&psi_cgroups_enabled)) {
   904			if (task_is_in_psi_v1()) {
   905				struct cgroup *cgroup;
   906	
   907				rcu_read_lock();
 > 908				cgroup = task_cgroup(task, cpuacct_cgrp_id);
   909				rcu_read_unlock();
   910				return cgroup_psi(cgroup);
   911			}
   912			return cgroup_psi(task_dfl_cgroup(task));
   913		}
   914	#endif
   915		return &psi_system;
   916	}
   917	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
