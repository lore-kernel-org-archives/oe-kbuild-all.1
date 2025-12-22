Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D016B1E5207
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 18:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766429494; cv=none; b=efGk13lGPFOEM7mO7Y8XVpKEgPfSDPWglF+I8KO/Sb/TPPmS2Cm/FCjlPjbRrvM/pak4XvIFKym0VY4azal7ZxV/DkPhhnz6DGwuKl8ehYm28dhJwdRoANpo9dSQmsalGsTQQnMlxZF6TrnMKz9I3DjIO8A3oPAiMFpnvUVT1rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766429494; c=relaxed/simple;
	bh=eDiQfIwWKK9dD/AJKJtoeOVRKYJ8Jw9ZsyMPcleWyMU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kw6aeO5EDfy0B1bDNNKAx5+jSnKIfaOIjjZijgxy3Kbe/hH3BpRW2lIgvDo9DjLKPMwgIhi1Zbb0cyTtgHzr9uzOzo4twIhfIIdQe1FfrDF7rzXpf82e4W+UVIa5WpOylMpu4VpfCVucPm/OnOUYsP3TCGpV0LMdBhsEgeiTVtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpmxMvgX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpmxMvgX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766429492; x=1797965492;
  h=date:from:to:cc:subject:message-id;
  bh=eDiQfIwWKK9dD/AJKJtoeOVRKYJ8Jw9ZsyMPcleWyMU=;
  b=hpmxMvgXf4mkdjZeS90cDaPlduMgRS/lnPiE2TrxfYBrlMk1D5J32vn5
   ghVp2s3u4alIiQDP+ceFO5AFadMcwNJcgy+DbX8oDkiTisLZPVIfff/T+
   lqDYM8SVNIaqP8cS2ikow9Dg+p/dl7+vk6P8lwgcDDvy+IS+EweQzN5kV
   vMjLPCW07JJ7lPcEYn3YcDl6GPrAWtwvVnZ6s1nYLfebGFqwk+4IBohPL
   64YQOwJGoRXbe8iKpzCmHEvM6pDiIY4d2L19phTkpaQs8PFXuPeW/ANOr
   CwF/REaTpKk++vQ3ZyYBzZllJds7NhZB6FQSeDxxk6LOHi+kpUNCmV/3f
   g==;
X-CSE-ConnectionGUID: QpIam+/SQ36H8w/HjR5XWg==
X-CSE-MsgGUID: xkSdThU+QouceQ/mBQrRGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85872278"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="85872278"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 10:51:32 -0800
X-CSE-ConnectionGUID: BogtHtcdTASRB+scEicUkw==
X-CSE-MsgGUID: yN475tqPQCWS5/mb/HofIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199578156"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Dec 2025 10:51:30 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXkzw-0000000010V-0AFT;
	Mon, 22 Dec 2025 18:51:17 +0000
Date: Tue, 23 Dec 2025 02:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hui Tang <tanghui20@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] kernel/sched/fair.c:175:5:
 sparse: sparse: symbol 'sysctl_sched_util_low_pct' was not declared. Should
 it be static?
Message-ID: <202512230232.mDLII3OZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: 2e1dfc02d115143587ccfee1815ad295763050f2 [3541/3541] sched: Adjust wakeup cpu range according CPU util dynamicly
config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251223/202512230232.mDLII3OZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230232.mDLII3OZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230232.mDLII3OZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:143:14: sparse: sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it be static?
   kernel/sched/fair.c:144:14: sparse: sparse: symbol 'sysctl_offline_wait_interval' was not declared. Should it be static?
>> kernel/sched/fair.c:175:5: sparse: sparse: symbol 'sysctl_sched_util_low_pct' was not declared. Should it be static?
   kernel/sched/fair.c:1256:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1256:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1256:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:3039:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/fair.c:3039:13: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:3039:13: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:12740:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12740:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12740:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5891:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5891:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5891:22: sparse:    struct task_struct *
   kernel/sched/fair.c:7964:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7964:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7964:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8258:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8258:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8258:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8367:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8367:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8367:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8587:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8587:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8587:22: sparse:    struct task_struct *
   kernel/sched/fair.c:8941:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8941:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8941:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9934:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9934:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9934:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10571:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10571:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10571:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12012:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12012:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12012:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11669:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11669:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11669:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12108:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12108:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12108:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:2985:9: sparse: sparse: context imbalance in 'task_numa_placement' - different lock contexts for basic block
   kernel/sched/fair.c:7180:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7180:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7180:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7186:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7186:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7186:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7193:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7193:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7193:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7201:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7201:17: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7201:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2309:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *

vim +/sysctl_sched_util_low_pct +175 kernel/sched/fair.c

   168	
   169	#ifdef CONFIG_QOS_SCHED_DYNAMIC_AFFINITY
   170	/*
   171	 * Low utilization threshold for CPU
   172	 *
   173	 * (default: 85%), units: percentage of CPU utilization)
   174	 */
 > 175	int sysctl_sched_util_low_pct = 85;
   176	#endif
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
