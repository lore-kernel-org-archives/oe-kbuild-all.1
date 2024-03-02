Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEC6125A9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 04:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709353165; cv=none; b=E/wrdOHmiGisZhFNm10iL/n+SZg19Dt4no4LY2oLp8NKNzWXq3ikX5A0KtriU3KOvAUr7vZ0wvJVchgFQcZQhGFEqkB1Kdqmn7l7bo3paPCTWZbiAvjBTCcnPq16chL1iMavwPZvaYieKibRdadMK9wZHDotcc1NhBMYDrZXu8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709353165; c=relaxed/simple;
	bh=Qhm2KO/aVyyJh5cmpGqvRhl6Yy2EV4z627i228Orx70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XxtPmDQHHC83c/tMwWigK6cVSQNXybkWfyj7O7CGlLksocaDDEV0J/FUIXQKJWhKlrOzjSD/XgRIGIc9i9ZCZeUrvN+3dDbfwBqQA9RiIcdPjmGx2DKcGo2U2tDfBDhmBw5Y9gvXPD5P8OODnBIBIJZvmjN8UjHc6uAr1PBm7Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YH2jVJQa; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YH2jVJQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709353163; x=1740889163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qhm2KO/aVyyJh5cmpGqvRhl6Yy2EV4z627i228Orx70=;
  b=YH2jVJQaC4sahaAcSIGbaBmfM7EkTU40iWM6ydTZaCj4wAyqluHt617I
   u4VVbHYx5708QZYL1fyMjvITaSf5IRIq4nk5sEyyrsFs5vxn+NbHnL0xn
   aEcxdb1Kn0N3j7JTmx78q3EhhbjSh8zZCEnHaUnDzKql30LfcszwnV/Zp
   xSi15pTbjWrAYG9KPz9mGT+HNsFlW+pZczFEtgFDBePdNEFxHLoC2hXoY
   qTx4mzZtm8tKcsPqwZPznwt9Ed+eFYbhnIAwdVM7cXXQFytb+VF1erfcU
   S/2BH1/Z6iFzs/veyL/rM5P4+odnhmwQWQVJiqu7zL1TWVXNwldSQjRRQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3772047"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="3772047"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 20:19:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="8460114"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Mar 2024 20:19:18 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgGq3-000EIn-11;
	Sat, 02 Mar 2024 04:19:15 +0000
Date: Sat, 2 Mar 2024 12:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 86/98] kernel/sched/psi.c:266:38: error:
 'cpu_cgrp_subsys_on_dfl_key' undeclared
Message-ID: <202403021255.NjXcadym-lkp@intel.com>
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
config: x86_64-randconfig-006-20240302 (https://download.01.org/0day-ci/archive/20240302/202403021255.NjXcadym-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021255.NjXcadym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403021255.NjXcadym-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/string_64.h:6,
                    from arch/x86/include/asm/string.h:5,
                    from include/linux/string.h:60,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_utility.c:12:
   kernel/sched/psi.c: In function 'psi_use_legacy':
>> kernel/sched/psi.c:266:38: error: 'cpu_cgrp_subsys_on_dfl_key' undeclared (first use in this function)
     266 |         return !cgroup_subsys_on_dfl(cpu_cgrp_subsys) &&
         |                                      ^~~~~~~~~~~~~~~
   include/linux/jump_label.h:485:50: note: in definition of macro 'static_branch_likely'
     485 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
   kernel/sched/psi.c:266:17: note: in expansion of macro 'cgroup_subsys_on_dfl'
     266 |         return !cgroup_subsys_on_dfl(cpu_cgrp_subsys) &&
         |                 ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:266:38: note: each undeclared identifier is reported only once for each function it appears in
     266 |         return !cgroup_subsys_on_dfl(cpu_cgrp_subsys) &&
         |                                      ^~~~~~~~~~~~~~~
   include/linux/jump_label.h:485:50: note: in definition of macro 'static_branch_likely'
     485 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
   kernel/sched/psi.c:266:17: note: in expansion of macro 'cgroup_subsys_on_dfl'
     266 |         return !cgroup_subsys_on_dfl(cpu_cgrp_subsys) &&
         |                 ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:267:38: error: 'memory_cgrp_subsys_on_dfl_key' undeclared (first use in this function)
     267 |                !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
         |                                      ^~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:485:50: note: in definition of macro 'static_branch_likely'
     485 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
   kernel/sched/psi.c:267:17: note: in expansion of macro 'cgroup_subsys_on_dfl'
     267 |                !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
         |                 ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:268:38: error: 'io_cgrp_subsys_on_dfl_key' undeclared (first use in this function); did you mean 'cgroup_subsys_on_dfl'?
     268 |                !cgroup_subsys_on_dfl(io_cgrp_subsys);
         |                                      ^~~~~~~~~~~~~~
   include/linux/jump_label.h:485:50: note: in definition of macro 'static_branch_likely'
     485 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
   kernel/sched/psi.c:268:17: note: in expansion of macro 'cgroup_subsys_on_dfl'
     268 |                !cgroup_subsys_on_dfl(io_cgrp_subsys);
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:97:
   kernel/sched/psi.c: In function 'psi_group_change_legacy':
   kernel/sched/psi.c:936:54: error: 'io_cgrp_subsys' undeclared (first use in this function)
     936 |                 group = cgroup_psi(task_cgroup(task, io_cgrp_subsys.id));
         |                                                      ^~~~~~~~~~~~~~
   kernel/sched/psi.c:943:54: error: 'memory_cgrp_subsys' undeclared (first use in this function)
     943 |                 group = cgroup_psi(task_cgroup(task, memory_cgrp_subsys.id));
         |                                                      ^~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:950:54: error: 'cpu_cgrp_subsys' undeclared (first use in this function); did you mean 'cpu_subsys'?
     950 |                 group = cgroup_psi(task_cgroup(task, cpu_cgrp_subsys.id));
         |                                                      ^~~~~~~~~~~~~~~
         |                                                      cpu_subsys


vim +/cpu_cgrp_subsys_on_dfl_key +266 kernel/sched/psi.c

   262	
   263	static inline bool psi_use_legacy(void)
   264	{
   265	#ifdef CONFIG_CGROUPS
 > 266		return !cgroup_subsys_on_dfl(cpu_cgrp_subsys) &&
   267		       !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
   268		       !cgroup_subsys_on_dfl(io_cgrp_subsys);
   269	#else
   270		return false;
   271	#endif
   272	}
   273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
