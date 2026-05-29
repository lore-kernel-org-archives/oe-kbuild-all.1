Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E62A35203F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 06:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036068; cv=none; b=sN6jVfY/NOr2MsHjfmI3of3g4D0tC+1qx2PjsZjf2KOPTPeJSVVaD2jo1Y0+qe3liM4A//5yzmNhB12HTFrpxKJWtZ9Tp1lG3BiD20OqVSaTbIHVGAQYj4oIlUo153cW7RNKeYi7HKI61v13C5RQ9X8oH4YJpvFiYuxYh9IPaoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036068; c=relaxed/simple;
	bh=eVeOvAaLV5wkFYnEEdWWyFO8uuRE3ZFo2bWdjuJRwGA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wuq3ZOS2VIp4ZA5rj5z1mQyj49WMG+BIEWGeP2Rlkq7TjIB7t6/YSHpOHeRB0gyiL2O8nJDfQ+14AlsdOQC1a65Glmjw12Oy5iEvFIvBWlGKYd/8eElMRyXCYEDSsPta/ulz3PATPuQHMXgodDfGOcmdaK1X0qal98LsfyhA0Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLgwohoS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLgwohoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780036067; x=1811572067;
  h=date:from:to:cc:subject:message-id;
  bh=eVeOvAaLV5wkFYnEEdWWyFO8uuRE3ZFo2bWdjuJRwGA=;
  b=iLgwohoS4b1IosJDhkGsIiQt/o7lyonDUpLHcPghUG2WblaWa/yXEwmq
   GFYSHfPhVAHGOGOBWWcToRUxIMfaUg9mfnLaGqd0u16yPUtV/nPU0AbsN
   XiJVNILLIVMQodEP9jpQv9VhU4ZXz9146vDlBPSysXi5K3v3NsFbkHNAN
   3QnEiQI6BV1oxI6IP9fchtlM9cnPk84gRmtA6gEvBujeVF1VDVgK6eimv
   Xp7hxIuTbzZnwa2W+QEnF7IU9/g3reEtBC/lTIAoitpTAdLRFm/FGtwcN
   vTdYG6BlXhqoTnL+GmLYVE0p8MwxxmYW5oOF6cWWZiDVCvM6VA1xBpngn
   w==;
X-CSE-ConnectionGUID: 3Wj4BeQmRiWlF4B9Yp5Lew==
X-CSE-MsgGUID: IKc+4T+gSNiuKcDeuJh5yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="98300941"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="98300941"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 23:27:46 -0700
X-CSE-ConnectionGUID: 0F42sRTiRQO7Nlhcjq1Btw==
X-CSE-MsgGUID: /sHDmZIUSJOousR+Yec7Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="247708165"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 May 2026 23:27:44 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSqh4-000000006qG-0lUM;
	Fri, 29 May 2026 06:27:42 +0000
Date: Fri, 29 May 2026 14:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [bigeasy-staging:smp_call_function_any 4/12]
 kernel/smp.c:806:28: warning: assignment to 'cpumask_t *' {aka 'struct
 cpumask *'} from 'int' makes pointer from integer without a cast
Message-ID: <202605291433.OHkzEFaS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git smp_call_function_any
head:   cec01329013ce633ca5857f5bb9273e000fdc6cf
commit: 98f51da91a96beeef4adf696e0c4f768fee75f33 [4/12] smp: Use task-local IPI cpumask in smp_call_function_many_cond()
config: i386-buildonly-randconfig-003-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291433.OHkzEFaS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291433.OHkzEFaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291433.OHkzEFaS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/smp.c: In function 'smp_task_ipi_mask_alloc':
   kernel/smp.c:806:30: error: implicit declaration of function 'kmalloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
     806 |         task->ipi_mask_ptr = kmalloc(cpumask_size(), GFP_KERNEL);
         |                              ^~~~~~~
         |                              mm_alloc
>> kernel/smp.c:806:28: warning: assignment to 'cpumask_t *' {aka 'struct cpumask *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     806 |         task->ipi_mask_ptr = kmalloc(cpumask_size(), GFP_KERNEL);
         |                            ^
   kernel/smp.c: In function 'smp_task_ipi_mask_free':
   kernel/smp.c:818:9: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     818 |         kfree(task->ipi_mask_ptr);
         |         ^~~~~
   cc1: some warnings being treated as errors


vim +806 kernel/smp.c

   800	
   801	int smp_task_ipi_mask_alloc(struct task_struct *task)
   802	{
   803		if (static_branch_unlikely(&ipi_mask_inlined))
   804			return 0;
   805	
 > 806		task->ipi_mask_ptr = kmalloc(cpumask_size(), GFP_KERNEL);
   807		if (!task->ipi_mask_ptr)
   808			return -ENOMEM;
   809	
   810		return 0;
   811	}
   812	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
