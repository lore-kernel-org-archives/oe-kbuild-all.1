Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E827450EE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 03:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741489292; cv=none; b=ftl5/CbytUKOgKJPrETUdouyPknuAJAycKTFVrRgINlMU+8B2UB8A96GqDfGrZMEaCbYdI8aQICzih5NdD7vi/1n9r35QYCp5SbL9AlTNx1a33ZndPxW0ZRTUgClC1CYhdWMWnxIOiyhBHKfx1z8vdrkQjUvsgowY5Xwnh0UisM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741489292; c=relaxed/simple;
	bh=+zQ2mjCDiEuOQEFSiTvz3S4ZH9MAw7v1ccDmwQ7oB0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SZ1c7mVhxvTiPH+/BPKFepRcQ0HpLqXtQwLyh0JBQzun7/CCaFwmO9iQ+O6FWMFc9WrQPR2z3UeanUu8Gj5d4E25tUMsA19bt/Koy9ML3XcmBNld4pweY+Ux1o2RQOE8wpdf37zxoV3nrbykxH0a+L8pjktEkYaFqFPcbmnafMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEO0d/J1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEO0d/J1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741489290; x=1773025290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+zQ2mjCDiEuOQEFSiTvz3S4ZH9MAw7v1ccDmwQ7oB0A=;
  b=EEO0d/J15NDA4/Pd7aaqgmYanF/A9driiH4eUBLEPGPdyztPJL5DITGY
   0QEpJZsTF7zRp8G7HpegScVnY3rRifKn/oFAn/Aw7OddTi/Jve9xLi61F
   tDYpzBwRp2jUGqyCYcucPfyuiU9N9NXJZYdwRZVzB+CdT5OCUQ5SpA87U
   8FL1kf7/6Aq9kGPwBgOnD8sleH20lrUzsxr8WzLQKrj/UpLFguthn00f3
   LXgSjjqTJNQwSLLXtnUg/D/DVgCVjrMaLWCaeC0mGe9Rql8NGLkVHrczc
   SdMQ9gFZ3oKrBukLBaRFEDquR8ke37Twx16d54maAk/SpnXQHerunDdmw
   g==;
X-CSE-ConnectionGUID: bVVBe5L0T6qcm98p1/SXYQ==
X-CSE-MsgGUID: 8swoiWQ+TKyFtAmu4XC5Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="60062335"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="60062335"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 19:01:29 -0800
X-CSE-ConnectionGUID: XKY6XN6iQOSVpvVZTSou8w==
X-CSE-MsgGUID: oiof5TvEQmy3cc2pGyX8Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="150454598"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 08 Mar 2025 19:01:28 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr6ur-0002b2-1c;
	Sun, 09 Mar 2025 03:01:25 +0000
Date: Sun, 9 Mar 2025 11:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenyu Huang <huangwenyu5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2007/2007] kernel/sched/fair.c:143:14: sparse:
 sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it
 be static?
Message-ID: <202503091054.fOa4dBNp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   944ce05f6b83ba40c4382c6b90b7b94f529118d3
commit: a3c9f2da0a35df4e41751556be4308f57bdaf3d6 [2007/2007] sched: Introduce handle priority reversion mechanism
config: x86_64-randconfig-r121-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091054.fOa4dBNp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091054.fOa4dBNp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091054.fOa4dBNp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/fair.c:143:14: sparse: sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it be static?
>> kernel/sched/fair.c:144:14: sparse: sparse: symbol 'sysctl_offline_wait_interval' was not declared. Should it be static?
   kernel/sched/fair.c:1236:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1236:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1236:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:3019:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/fair.c:3019:13: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:3019:13: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:12477:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12477:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12477:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5766:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5766:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5766:22: sparse:    struct task_struct *
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
   kernel/sched/fair.c:2965:9: sparse: sparse: context imbalance in 'task_numa_placement' - different lock contexts for basic block
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
   kernel/sched/fair.c:7047:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7047:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7047:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7053:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7053:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7053:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7060:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7060:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7060:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7068:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7068:17: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7068:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
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
