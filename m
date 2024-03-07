Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF58133995
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 21:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709847387; cv=none; b=uvliSFznDM9MBiyYIEWudQ1KU2Dj+rj1h8RFq+ueO0dh1snIYFqvFGMyEAziIiXr4FUewAzD/MELm5Vm/0cCS1dCIaL/fz0lsPxyyVtQlFsMi6SSiZSRvjQHplNKaqf3LbkoSfFZ4j+WeR3VnKX8hpgQcbnRY5okaLFme4Dnvpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709847387; c=relaxed/simple;
	bh=CR7HIRvDGh2iKDm8zvdpZm/O5u0nIDPNUKsmU0Sy0bc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=myUU3rMXj83Gguisl87474l9zIz7Y82pd0U0zJ0olctWLGY9HlyXIG7tTCuVWUHWi82fyuI12QADBFgcOToMDcl7dYRd4wNqk1PImLF9IQXT8ZAj3wHqLNVk09XF4K+B0QJm9VqCSQg07s5Jqux+cHkqbWH6K5rHQFaUnYp7JbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzQ1pgTk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzQ1pgTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709847385; x=1741383385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CR7HIRvDGh2iKDm8zvdpZm/O5u0nIDPNUKsmU0Sy0bc=;
  b=VzQ1pgTkTgoHx5VXGjsamEq9p6+Yf2HVXO/ITBpNOCTdTcV9puv8A61P
   faF6qOl08zLZxIDQMFVL7dcV8q0O2m7vLkdE4YyzWoSaMmmxUy2yvCJ8T
   XkbUjYwmFUlh/pIU8RVzxmkDCuL2nMmS/lBvdN2TNcD8q4C1DBkVGg+jc
   /tuziYV4U8tAuwD9ae1SEagW+nrxxBpYhspUV80htvdefTwSVHkFNbEpb
   Ffu239kVonEdf5FYHZPW6/c0fWgmUg0IaRpN9pYBIwy0IEC2zkN1Ns3tA
   6MHgnrwkwnYJx77xyqE6NBc0CiCID7nxU3bHp4wkRndciMszXzmNRy6xA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="8305399"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="8305399"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 13:36:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="10374986"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Mar 2024 13:36:21 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riLPX-0005it-1z;
	Thu, 07 Mar 2024 21:36:19 +0000
Date: Fri, 8 Mar 2024 05:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 25735/27434] kernel/sched/psi.c:276:38:
 error: 'memory_cgrp_subsys_on_dfl_key' undeclared; did you mean
 'debug_cgrp_subsys_on_dfl_key'?
Message-ID: <202403080523.oJf25XWR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 0e5fb2bd883d16551ac628df69281b81094f53cd [25735/27434] emm: psi: support cgroup v1 psi accounting
config: x86_64-buildonly-randconfig-003-20240305 (https://download.01.org/0day-ci/archive/20240308/202403080523.oJf25XWR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080523.oJf25XWR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080523.oJf25XWR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:42,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/list.h:9,
                    from include/linux/timer.h:5,
                    from include/linux/workqueue.h:9,
                    from kernel/sched/../workqueue_internal.h:11,
                    from kernel/sched/psi.c:139:
   kernel/sched/psi.c: In function 'psi_use_legacy':
>> kernel/sched/psi.c:276:38: error: 'memory_cgrp_subsys_on_dfl_key' undeclared (first use in this function); did you mean 'debug_cgrp_subsys_on_dfl_key'?
     276 |                !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
         |                                      ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/jump_label.h:480:48: note: in expansion of macro 'static_key_enabled'
     480 | #define static_branch_likely(x)         likely(static_key_enabled(&(x)->key))
         |                                                ^~~~~~~~~~~~~~~~~~
   include/linux/cgroup.h:98:9: note: in expansion of macro 'static_branch_likely'
      98 |         static_branch_likely(&ss ## _on_dfl_key)
         |         ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:276:17: note: in expansion of macro 'cgroup_subsys_on_dfl'
     276 |                !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
         |                 ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:276:38: note: each undeclared identifier is reported only once for each function it appears in
     276 |                !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
         |                                      ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/jump_label.h:480:48: note: in expansion of macro 'static_key_enabled'
     480 | #define static_branch_likely(x)         likely(static_key_enabled(&(x)->key))
         |                                                ^~~~~~~~~~~~~~~~~~
   include/linux/cgroup.h:98:9: note: in expansion of macro 'static_branch_likely'
      98 |         static_branch_likely(&ss ## _on_dfl_key)
         |         ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:276:17: note: in expansion of macro 'cgroup_subsys_on_dfl'
     276 |                !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
         |                 ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c: In function 'psi_group_change_legacy':
>> kernel/sched/psi.c:918:54: error: 'memory_cgrp_subsys' undeclared (first use in this function); did you mean 'debug_cgrp_subsys'?
     918 |                 group = cgroup_psi(task_cgroup(task, memory_cgrp_subsys.id));
         |                                                      ^~~~~~~~~~~~~~~~~~
         |                                                      debug_cgrp_subsys
   kernel/sched/psi.c: In function 'psi_use_legacy':
   kernel/sched/psi.c:281:1: warning: control reaches end of non-void function [-Wreturn-type]
     281 | }
         | ^


vim +276 kernel/sched/psi.c

   271	
   272	static inline bool psi_use_legacy(void)
   273	{
   274	#ifdef CONFIG_CGROUPS
   275		return !cgroup_subsys_on_dfl(cpu_cgrp_subsys) &&
 > 276		       !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
   277		       !cgroup_subsys_on_dfl(io_cgrp_subsys);
   278	#else
   279		return false;
   280	#endif
   281	}
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
