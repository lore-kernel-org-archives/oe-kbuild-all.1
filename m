Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB938F48
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Dec 2023 16:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K779HP4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704041188; x=1735577188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F90xKm4W9nGvweGG2mUzJ0l+gs/UQq8KIrj109SuaG0=;
  b=K779HP4vYVO6t/twjmfHhxW+DvL29ct9DsB+F68EIBjv2lFDE/UQJ72/
   aJqvypPuwl4cYnZCXBAgvXg4bLnzfaXHw7dbOQCL+mFbR1agbqYS1/c/R
   p+CpFkw3MpOFEBX1T/7qcNVgUm6OZ3cv0XlqXPtdmhE8NHqtpZZmtFXPl
   ORN533S/LvN4nM8Vm2gcsN40y7tSJ/7DxMr1MjUUPt6UWihfuWLMWm7Ep
   KBDSDBMI6eMPi4SbZECmDOkYb1geycj4llczu/iyMW6O9uJdm4xwA9Cs9
   K/N37xekOR5yLzFSbG7wZEh/QqOuYtC9afXio6kUQtDZkybCY2MEA3R2H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="395638411"
X-IronPort-AV: E=Sophos;i="6.04,320,1695711600"; 
   d="scan'208";a="395638411"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2023 08:46:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="779260229"
X-IronPort-AV: E=Sophos;i="6.04,320,1695711600"; 
   d="scan'208";a="779260229"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 31 Dec 2023 08:46:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJyxD-000Jbm-0Q;
	Sun, 31 Dec 2023 16:46:23 +0000
Date: Mon, 1 Jan 2024 00:46:21 +0800
From: kernel test robot <lkp@intel.com>
To: caelli <caelli@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	kaixuxiakx <60962168+kaixuxiakx@users.noreply.github.com>,
	Peng Hao <flyingpeng@tencent.com>, Bin Lai <robinlai@tencent.com>
Subject: kernel/sched/core.c:7176:5: warning: no previous prototype for
 'cpu_get_max_cpus'
Message-ID: <202401010022.GXO6rO9x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 5990ae24e7b9ab84c0ffa871fa9ec1ff1738da57 cgroupfs: quota aware support
date:   2 years, 2 months ago
config: x86_64-oc_base_config (https://download.01.org/0day-ci/archive/20240101/202401010022.GXO6rO9x-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240101/202401010022.GXO6rO9x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401010022.GXO6rO9x-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:2217:6: warning: no previous prototype for 'sched_set_stop_task' [-Wmissing-prototypes]
    2217 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:7176:5: warning: no previous prototype for 'cpu_get_max_cpus' [-Wmissing-prototypes]
    7176 | int cpu_get_max_cpus(struct task_struct *p)
         |     ^~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'cpu_get_max_cpus':
   kernel/sched/core.c:7184:30: error: 'struct cfs_bandwidth' has no member named 'quota'
    7184 |         if (tg->cfs_bandwidth.quota == RUNTIME_INF)
         |                              ^
   In file included from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/bitops.h:5,
                    from include/linux/kernel.h:12,
                    from arch/x86/include/asm/percpu.h:45,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/core.c:9:
   kernel/sched/core.c:7187:50: error: 'struct cfs_bandwidth' has no member named 'quota'
    7187 |         max_cpus = DIV_ROUND_UP(tg->cfs_bandwidth.quota, tg->cfs_bandwidth.period);
         |                                                  ^
   include/uapi/linux/const.h:34:40: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
      34 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                        ^
   kernel/sched/core.c:7187:20: note: in expansion of macro 'DIV_ROUND_UP'
    7187 |         max_cpus = DIV_ROUND_UP(tg->cfs_bandwidth.quota, tg->cfs_bandwidth.period);
         |                    ^~~~~~~~~~~~
   kernel/sched/core.c:7187:75: error: 'struct cfs_bandwidth' has no member named 'period'
    7187 |         max_cpus = DIV_ROUND_UP(tg->cfs_bandwidth.quota, tg->cfs_bandwidth.period);
         |                                                                           ^
   include/uapi/linux/const.h:34:46: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
      34 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                              ^
   kernel/sched/core.c:7187:20: note: in expansion of macro 'DIV_ROUND_UP'
    7187 |         max_cpus = DIV_ROUND_UP(tg->cfs_bandwidth.quota, tg->cfs_bandwidth.period);
         |                    ^~~~~~~~~~~~
   kernel/sched/core.c:7187:75: error: 'struct cfs_bandwidth' has no member named 'period'
    7187 |         max_cpus = DIV_ROUND_UP(tg->cfs_bandwidth.quota, tg->cfs_bandwidth.period);
         |                                                                           ^
   include/uapi/linux/const.h:34:57: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
      34 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                                         ^
   kernel/sched/core.c:7187:20: note: in expansion of macro 'DIV_ROUND_UP'
    7187 |         max_cpus = DIV_ROUND_UP(tg->cfs_bandwidth.quota, tg->cfs_bandwidth.period);
         |                    ^~~~~~~~~~~~


vim +/cpu_get_max_cpus +7176 kernel/sched/core.c

  7171	
  7172	int container_cpuquota_aware;
  7173	#define cpu_quota_aware_enabled(tg) \
  7174	    (tg && tg != &root_task_group && tg->cpuquota_aware)
  7175	
> 7176	int cpu_get_max_cpus(struct task_struct *p)
  7177	{
  7178		int max_cpus = INT_MAX;
  7179		struct task_group *tg = task_group(p);
  7180	
  7181		if (!cpu_quota_aware_enabled(tg))
  7182			return max_cpus;
  7183	
  7184		if (tg->cfs_bandwidth.quota == RUNTIME_INF)
  7185			return max_cpus;
  7186	
  7187		max_cpus = DIV_ROUND_UP(tg->cfs_bandwidth.quota, tg->cfs_bandwidth.period);
  7188	
  7189		return max_cpus;
  7190	}
  7191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
