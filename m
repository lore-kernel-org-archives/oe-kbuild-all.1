Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711331401C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Apr 2024 16:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713716488; cv=none; b=IcfkfE3qRBt8yARH/64UieXsz4p72oY8kYeYYTmh/hkMCCx+Fs7QfL48imPNZWeb5ZSYcaCz3FQfvkoK2fHIJem7s5Gl2spGUHaSA01GPPBvLzjWY3XuVV8u4Ojx3QzIKkwQZKg4vUQXrewJb0QOjTLtikovzjE4Xsi166uiPm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713716488; c=relaxed/simple;
	bh=PkOf22Bq8yOf+GTyr5vElszz8aAAQdCOUQcBxvZEdno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WwXg5l6I0vNSqBq3FYlOLqe80WXIq2mP5T50TeIMsTxXogrlHMgLjYTW7SUEOl249Zx3/IHB11+SUmH1E5LPUd1iQQ6KSKS27TaEGEEABg9mPdjdP3BkfZW5PDq1WbnsOHtbe0s049P9WMT4b8PHpIKA5HA6K/3+O6ZNaQYFCOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lkFqFWnv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lkFqFWnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713716487; x=1745252487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PkOf22Bq8yOf+GTyr5vElszz8aAAQdCOUQcBxvZEdno=;
  b=lkFqFWnvOE17dPCqqUwGIail/0Eu7toeV6AkRL3zxt0ddVNXt8ngBnbT
   Ll591Zg6hqFQw0zcwXezq7cN6F2mC+7nyTka66B6R5BgbOvkWs85Law2m
   P/M8Zh2LKl5fzmiuJjlWvzXdGAKhQClUc5n8in1u9TupzQHC+rmjqSQr4
   DJg1l1c0fsG5hIT0GFqhrrQ51SsxaVbuwU/9kRZk66MBFtSWIuVzKTY2d
   B3s3Nc+abh4VbqMsaf+WXYQf71dZ1M+oU0lTIky13nY1WDuARGUXZ7n3k
   wxaTH0QdhbB/kikkAfEV80NDhI4cFkGVzvCHSkj49e76EEx3r27Rs+mrV
   g==;
X-CSE-ConnectionGUID: GD2aCoRmTmaZMVjAGEPLag==
X-CSE-MsgGUID: tXlKTTLDQ/Weommg8luZmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="26707704"
X-IronPort-AV: E=Sophos;i="6.07,218,1708416000"; 
   d="scan'208";a="26707704"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 09:21:27 -0700
X-CSE-ConnectionGUID: J/Gcep/jSz+iNE2RBqVOKg==
X-CSE-MsgGUID: 1K6xvJXXSaeFmM4iYVZP9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,218,1708416000"; 
   d="scan'208";a="24312589"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Apr 2024 09:21:14 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryZwE-000C1G-1R;
	Sun, 21 Apr 2024 16:21:10 +0000
Date: Mon, 22 Apr 2024 00:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 86/98] kernel/sched/psi.c:936:11: error: call to
 undeclared function 'cgroup_psi'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202404220030.MxbsuTKP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   14a98183c9e243396a2acd72fcd56ad4230f24ee
commit: 5ad399e959efe7243d5e3c8afc13d249c607746a [86/98] psi: support cgroup v1 psi accounting
config: x86_64-buildonly-randconfig-004-20240421 (https://download.01.org/0day-ci/archive/20240422/202404220030.MxbsuTKP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404220030.MxbsuTKP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404220030.MxbsuTKP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:97:
>> kernel/sched/psi.c:936:11: error: call to undeclared function 'cgroup_psi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     936 |                 group = cgroup_psi(task_cgroup(task, io_cgrp_subsys.id));
         |                         ^
>> kernel/sched/psi.c:936:22: error: call to undeclared function 'task_cgroup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     936 |                 group = cgroup_psi(task_cgroup(task, io_cgrp_subsys.id));
         |                                    ^
   kernel/sched/psi.c:936:22: note: did you mean 'task_group'?
   kernel/sched/sched.h:2064:34: note: 'task_group' declared here
    2064 | static inline struct task_group *task_group(struct task_struct *p)
         |                                  ^
   In file included from kernel/sched/build_utility.c:97:
   kernel/sched/psi.c:936:40: error: use of undeclared identifier 'io_cgrp_subsys'
     936 |                 group = cgroup_psi(task_cgroup(task, io_cgrp_subsys.id));
         |                                                      ^
   kernel/sched/psi.c:943:11: error: call to undeclared function 'cgroup_psi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     943 |                 group = cgroup_psi(task_cgroup(task, memory_cgrp_subsys.id));
         |                         ^
   kernel/sched/psi.c:943:22: error: call to undeclared function 'task_cgroup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     943 |                 group = cgroup_psi(task_cgroup(task, memory_cgrp_subsys.id));
         |                                    ^
   kernel/sched/psi.c:943:40: error: use of undeclared identifier 'memory_cgrp_subsys'
     943 |                 group = cgroup_psi(task_cgroup(task, memory_cgrp_subsys.id));
         |                                                      ^
   kernel/sched/psi.c:950:11: error: call to undeclared function 'cgroup_psi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     950 |                 group = cgroup_psi(task_cgroup(task, cpu_cgrp_subsys.id));
         |                         ^
   kernel/sched/psi.c:950:22: error: call to undeclared function 'task_cgroup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     950 |                 group = cgroup_psi(task_cgroup(task, cpu_cgrp_subsys.id));
         |                                    ^
   kernel/sched/psi.c:950:40: error: use of undeclared identifier 'cpu_cgrp_subsys'
     950 |                 group = cgroup_psi(task_cgroup(task, cpu_cgrp_subsys.id));
         |                                                      ^
   9 errors generated.


vim +/cgroup_psi +936 kernel/sched/psi.c

   918	
   919	/*
   920	 * Iteration for cgroup V1, we only have SOME PSI support for each cgroup due
   921	 * to the nature of splitted resource types of cgroup V1 design will bring
   922	 * large overhead for FULL PSI tracking (eg. every TSK_RUNNING change need to
   923	 * iterate through three types of cgroups instead of one). So FULL PSI
   924	 * required flags are not considered.
   925	 *
   926	 * So only TSK_IOWAIT, TSK_MEMSTALL, TSK_RUNNING are tracked individually.
   927	 * Have to process three flags here one by one. This may have up to 3 times
   928	 * overhead for batch change but have to live with it.
   929	 */
   930	static inline void psi_group_change_legacy(struct task_struct *task, int cpu,
   931						   u64 now, int clear, int set, bool wake)
   932	{
   933		struct psi_group *group;
   934	
   935		if ((clear | set) & TSK_IOWAIT) {
 > 936			group = cgroup_psi(task_cgroup(task, io_cgrp_subsys.id));
   937			do {
   938				psi_group_change(group, cpu, clear & TSK_IOWAIT, set & TSK_IOWAIT, now, wake);
   939			} while ((group = group->parent));
   940		}
   941	
   942		if ((clear | set) & TSK_MEMSTALL) {
   943			group = cgroup_psi(task_cgroup(task, memory_cgrp_subsys.id));
   944			do {
   945				psi_group_change(group, cpu, clear & TSK_MEMSTALL, set & TSK_MEMSTALL, now, wake);
   946			} while ((group = group->parent));
   947		}
   948	
   949		if ((clear | set) & TSK_RUNNING) {
   950			group = cgroup_psi(task_cgroup(task, cpu_cgrp_subsys.id));
   951			do {
   952				psi_group_change(group, cpu, clear & TSK_RUNNING, set & TSK_RUNNING, now, wake);
   953			} while ((group = group->parent));
   954		}
   955	}
   956	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
