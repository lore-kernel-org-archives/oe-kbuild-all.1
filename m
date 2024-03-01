Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA2454273
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 21:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709330169; cv=none; b=uSQJwQ4/lUa3/qy3/C+McuVD+OwWsZw90e5Eb/abIxak+XWboDevXuX/aEA0GEpx+WPBOvjQ4fQlkzlq3Q5TJTCR6NM6CzOLbhx8o4Qgu1v4hXxtZtemdmhKyuOz2MOhG0P25cXV+D9vaWb42QP9/FPSLpLkCIc3xIgbt+f+x+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709330169; c=relaxed/simple;
	bh=0mkPoelFHQCLv2xLmDJEzmfWw9jOULGPNZne2IfuU1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Txdfb+2eKEEJDAb8jdk6aszvRD0VA1T32Sm+JAbrS0vXWi6vasQKU70fajAS27wTCFZ+mw7ocwtejDZreUjqu7bjqpCVfvDZDK24BRT461trRXu3kf5oo2E3AYV5qeznkyZmeiUh4wlo1jadd5Mov8NjY3X8ojq/3lSaundzd/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQwDGDGy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQwDGDGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709330166; x=1740866166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0mkPoelFHQCLv2xLmDJEzmfWw9jOULGPNZne2IfuU1Y=;
  b=nQwDGDGySd4YmJZ+k+DlWDQ403GGdL8hb3M32LAXxuICBZv927/8PJeF
   zZsjL+3DwRmEvoyM/CbyVo+igkH/7eFKE7nDZLGMBidLWARB2D/4yXogY
   WlbxqPHTXO3D3g4QooyhGaUxU6FgEGyuQ7E/vkxKpCfZcZKH2mjinBiYU
   IIuhTstVdZMcGGHV235/f15qQyPZFuKaWWt1An1qZ9bv50GWAxfBMBd1D
   RbEN66aD6Jx5jr5IW8p/Bpld4rQnasjEOJcTLwrW6slEOzYt8FVMi1mDP
   KHWlEBKWaM9Ug+IQJ06G6PL0+Xg8c2AqY/NWBAeNdhVWk5XR9mU4hEUbg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3812927"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="3812927"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 13:56:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="8224438"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Mar 2024 13:56:02 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgArH-000E7T-27;
	Fri, 01 Mar 2024 21:55:59 +0000
Date: Sat, 2 Mar 2024 05:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 86/98] kernel/sched/psi.c:272:1: warning: control
 reaches end of non-void function
Message-ID: <202403020559.Porpme18-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a4b2dc2ffad1810ebe7a86710aa1e5cc312aa2a1
commit: 5ad399e959efe7243d5e3c8afc13d249c607746a [86/98] psi: support cgroup v1 psi accounting
config: x86_64-buildonly-randconfig-002-20240302 (https://download.01.org/0day-ci/archive/20240302/202403020559.Porpme18-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403020559.Porpme18-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020559.Porpme18-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_utility.c:12:
   kernel/sched/psi.c: In function 'psi_use_legacy':
   kernel/sched/psi.c:267:31: error: 'memory_cgrp_subsys_on_dfl_key' undeclared (first use in this function); did you mean 'debug_cgrp_subsys_on_dfl_key'?
     267 |         !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
         |                               ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:40: note: in definition of macro 'likely'
      76 | # define likely(x) __builtin_expect(!!(x), 1)
         |                                        ^
   include/linux/jump_label.h:508:34: note: in expansion of macro 'likely_notrace'
     508 | #define static_branch_likely(x)  likely_notrace(static_key_enabled(&(x)->key))
         |                                  ^~~~~~~~~~~~~~
   include/linux/jump_label.h:508:49: note: in expansion of macro 'static_key_enabled'
     508 | #define static_branch_likely(x)  likely_notrace(static_key_enabled(&(x)->key))
         |                                                 ^~~~~~~~~~~~~~~~~~
   include/linux/cgroup.h:97:2: note: in expansion of macro 'static_branch_likely'
      97 |  static_branch_likely(&ss ## _on_dfl_key)
         |  ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:267:10: note: in expansion of macro 'cgroup_subsys_on_dfl'
     267 |         !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
         |          ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:267:31: note: each undeclared identifier is reported only once for each function it appears in
     267 |         !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
         |                               ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:40: note: in definition of macro 'likely'
      76 | # define likely(x) __builtin_expect(!!(x), 1)
         |                                        ^
   include/linux/jump_label.h:508:34: note: in expansion of macro 'likely_notrace'
     508 | #define static_branch_likely(x)  likely_notrace(static_key_enabled(&(x)->key))
         |                                  ^~~~~~~~~~~~~~
   include/linux/jump_label.h:508:49: note: in expansion of macro 'static_key_enabled'
     508 | #define static_branch_likely(x)  likely_notrace(static_key_enabled(&(x)->key))
         |                                                 ^~~~~~~~~~~~~~~~~~
   include/linux/cgroup.h:97:2: note: in expansion of macro 'static_branch_likely'
      97 |  static_branch_likely(&ss ## _on_dfl_key)
         |  ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:267:10: note: in expansion of macro 'cgroup_subsys_on_dfl'
     267 |         !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
         |          ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:268:31: error: 'io_cgrp_subsys_on_dfl_key' undeclared (first use in this function); did you mean 'misc_cgrp_subsys_on_dfl_key'?
     268 |         !cgroup_subsys_on_dfl(io_cgrp_subsys);
         |                               ^~~~~~~~~~~~~~
   include/linux/compiler.h:76:40: note: in definition of macro 'likely'
      76 | # define likely(x) __builtin_expect(!!(x), 1)
         |                                        ^
   include/linux/jump_label.h:508:34: note: in expansion of macro 'likely_notrace'
     508 | #define static_branch_likely(x)  likely_notrace(static_key_enabled(&(x)->key))
         |                                  ^~~~~~~~~~~~~~
   include/linux/jump_label.h:508:49: note: in expansion of macro 'static_key_enabled'
     508 | #define static_branch_likely(x)  likely_notrace(static_key_enabled(&(x)->key))
         |                                                 ^~~~~~~~~~~~~~~~~~
   include/linux/cgroup.h:97:2: note: in expansion of macro 'static_branch_likely'
      97 |  static_branch_likely(&ss ## _on_dfl_key)
         |  ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:268:10: note: in expansion of macro 'cgroup_subsys_on_dfl'
     268 |         !cgroup_subsys_on_dfl(io_cgrp_subsys);
         |          ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:97:
   kernel/sched/psi.c: In function 'psi_group_change_legacy':
   kernel/sched/psi.c:936:40: error: 'io_cgrp_subsys' undeclared (first use in this function); did you mean 'misc_cgrp_subsys'?
     936 |   group = cgroup_psi(task_cgroup(task, io_cgrp_subsys.id));
         |                                        ^~~~~~~~~~~~~~
         |                                        misc_cgrp_subsys
   kernel/sched/psi.c:943:40: error: 'memory_cgrp_subsys' undeclared (first use in this function); did you mean 'debug_cgrp_subsys'?
     943 |   group = cgroup_psi(task_cgroup(task, memory_cgrp_subsys.id));
         |                                        ^~~~~~~~~~~~~~~~~~
         |                                        debug_cgrp_subsys
   kernel/sched/psi.c: In function 'psi_use_legacy':
>> kernel/sched/psi.c:272:1: warning: control reaches end of non-void function [-Wreturn-type]
     272 | }
         | ^


vim +272 kernel/sched/psi.c

   262	
   263	static inline bool psi_use_legacy(void)
   264	{
   265	#ifdef CONFIG_CGROUPS
   266		return !cgroup_subsys_on_dfl(cpu_cgrp_subsys) &&
   267		       !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
   268		       !cgroup_subsys_on_dfl(io_cgrp_subsys);
   269	#else
   270		return false;
   271	#endif
 > 272	}
   273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
