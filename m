Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A189936B00
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 01:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709168668; cv=none; b=YrEF9B8e0xG9VVM2huqYPfneB/NfxUDnLT/+MbNHRSQzB/7TD8vsBOhZ8KFEOmqrBOND6vVDBZlCz/WKBBe/1rRV1gcgAq40dP0F4Snxo/n7Hxms+um2oHDRyV1FJ2+0YdKyRA97nBlrOM5vSkekTzHZ5MGF6yigmiOqP0+x56o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709168668; c=relaxed/simple;
	bh=qwiHpBwvd7mTExGs1GV2dkN1e/wxax9pvV1yppylhR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P/M9ollN8+Jz0OWAnhKLfKtRbf9aemkmwqPf/6Ku3xQqjcNV/I6aOywfa+EqrFoOQOJuGlzxBqUz43U01lJjGWyhufyeyL6+o0581eGVnqX9+5LnY/UPJMi4Ir5PBTjI2ZULNdtECMPTMGxA/d3UZIWuKNPdC5q/B0/LvpPK6j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SoBLsVXR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SoBLsVXR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709168665; x=1740704665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qwiHpBwvd7mTExGs1GV2dkN1e/wxax9pvV1yppylhR8=;
  b=SoBLsVXRnIcFqQdlVXlPNHE4W8aIFXkoynVeOHfY2YoH5Snli8SsReSv
   vqnCplQHnsNhSUEPr5hKe9ukr70BGhM/0moal5A5P5ihGKehHWSr3Utzg
   dimy7VXSRmYt04/GKsZewXqyrkM9XL5/Mb4R+xUFGMqU/EVQ7kwodnCfD
   UwkPJHqMgBcZuFQrzlBte5yj9zyHZwk+wJwm/VUvjQbSoHWv2a6maPXHe
   uHBdCPU22mx2u8ehtUK19WVAA8DpDIBKk6rA69ALKWVr/w1GT/Jgg8IX5
   nN158Y/lMGbTowpLIim+MaC6S9ADj/E8LvK7qFbs6/Xhfwzieq09DKJyw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3491501"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="3491501"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 17:04:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="7857733"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Feb 2024 17:04:23 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfUqT-000CWt-1b;
	Thu, 29 Feb 2024 01:04:21 +0000
Date: Thu, 29 Feb 2024 09:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenyu Huang <huangwenyu5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1659/3426] kernel/sched/fair.c:143:14: sparse:
 sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it
 be static?
Message-ID: <202402290858.u7zfnMrE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   54465add6cb7660c781c0ae7b4d3e3d56185624e
commit: a3c9f2da0a35df4e41751556be4308f57bdaf3d6 [1659/3426] sched: Introduce handle priority reversion mechanism
config: arm64-randconfig-r111-20240227 (https://download.01.org/0day-ci/archive/20240229/202402290858.u7zfnMrE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240229/202402290858.u7zfnMrE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290858.u7zfnMrE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/fair.c:143:14: sparse: sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it be static?
>> kernel/sched/fair.c:144:14: sparse: sparse: symbol 'sysctl_offline_wait_interval' was not declared. Should it be static?
   kernel/sched/fair.c:1236:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1236:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1236:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12477:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12477:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12477:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5766:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5766:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5766:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6508:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6508:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6508:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7809:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7809:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7809:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8014:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8014:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8014:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8113:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8113:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8113:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8333:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8333:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8333:22: sparse:    struct task_struct *
   kernel/sched/fair.c:8687:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8687:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8687:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9680:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9680:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9680:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10317:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10317:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10317:22: sparse:    struct task_struct *
   kernel/sched/fair.c:11749:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11749:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11749:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11406:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11406:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11406:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11845:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11845:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11845:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2309:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2309:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2309:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2145:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2145:25: sparse:    struct task_struct *

vim +/sysctl_overload_detect_period +143 kernel/sched/fair.c

   139	
   140	static DEFINE_PER_CPU_SHARED_ALIGNED(struct list_head, qos_throttled_cfs_rq);
   141	static DEFINE_PER_CPU_SHARED_ALIGNED(struct hrtimer, qos_overload_timer);
   142	static DEFINE_PER_CPU(int, qos_cpu_overload);
 > 143	unsigned int sysctl_overload_detect_period = 5000;  /* in ms */
 > 144	unsigned int sysctl_offline_wait_interval = 100;  /* in ms */
   145	static int one_thousand = 1000;
   146	static int hundred_thousand = 100000;
   147	static int unthrottle_qos_cfs_rqs(int cpu);
   148	#endif
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
