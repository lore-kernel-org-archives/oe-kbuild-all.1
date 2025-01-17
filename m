Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61A01A2391
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 20:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737146976; cv=none; b=lG9rhJ+4EkhToWP1LO2h/EWqUwo3vVtZIGjbjsqUXhbpVBkmTW0XlI8QvObVMyJs2kGRjaWsWQXT7GDu4EZCWhzKTbBLz6NcTkl53lknRx7BZDB7TU56t2MJiFyf2xoNcVJyFQJ8oEaQGpQcA2+CNtrusyAe6L46WFqOadyF75I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737146976; c=relaxed/simple;
	bh=/4/WxKvnAu03tWcBlRWWSdm+0uxV+xlshqWG8gjR4E8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I0/C1DF4wzVX5K9NKctsiz/tDue8eOAOWIdgxnxhsmnx8YzJ823zMthRzE1B/tpDTOjFUFaF4GeycAlRo8tO5aZlCM0sPicyNZXw3gn8eQRHvEfzAocppKRG1ObhoKKlPnYHNAv687tWcwWHaXq+GfR7TchxL4dHM7kt3q5MRjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGlItbBT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGlItbBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737146974; x=1768682974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/4/WxKvnAu03tWcBlRWWSdm+0uxV+xlshqWG8gjR4E8=;
  b=aGlItbBTmrkGs/oXiDy8qHTdTOoLkkeJBdTB5H7lLcvmWL3xxB25oE8o
   S9u0/w8m247PObGSYYDOpKGRfX2YQ9B3KhDQw2rl4oTkDXnyzXW/5lSq5
   1TJ3jw//WHp5kImFk7ZYoA9hGt+rYWbUX2sinYo8MOf/p8jOPtXt8xSXM
   zI025RZdEfmygpvETSh/byiwMmV2BC2NpyUIY42ELW6wE/DpY/Y/W02Ob
   mdxrQJJOcBqDhLS8ZZdIEbc3jNAWcEpcgrbjkidyv3CZLKuVh7S12cgbI
   YaUbF3ij8F8VwOFDr/c2hNmKI5RBQzoWnnLXn630w0E9UJWeWdjlvgKxj
   Q==;
X-CSE-ConnectionGUID: 0nu/FvHxQw+iQEB3jTrrkA==
X-CSE-MsgGUID: muWsS/CzQZ6ikJGSTlejsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37752081"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37752081"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 12:49:33 -0800
X-CSE-ConnectionGUID: xB/W8i/zS5SeLSG5gGA44g==
X-CSE-MsgGUID: KtiOH4RUSTSiGE6hw/p2mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110542671"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jan 2025 12:49:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYtHW-000Tgx-0d;
	Fri, 17 Jan 2025 20:49:30 +0000
Date: Sat, 18 Jan 2025 04:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenyu Huang <huangwenyu5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1826/1826] kernel/sched/fair.c:146:12: warning:
 'hundred_thousand' defined but not used
Message-ID: <202501180452.dWoRzgYk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a5cbe5b715d9cac271b2c6175e728f0c4167f675
commit: a3c9f2da0a35df4e41751556be4308f57bdaf3d6 [1826/1826] sched: Introduce handle priority reversion mechanism
config: loongarch-randconfig-r063-20250118 (https://download.01.org/0day-ci/archive/20250118/202501180452.dWoRzgYk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180452.dWoRzgYk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180452.dWoRzgYk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:146:12: warning: 'hundred_thousand' defined but not used [-Wunused-variable]
     146 | static int hundred_thousand = 100000;
         |            ^~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:145:12: warning: 'one_thousand' defined but not used [-Wunused-variable]
     145 | static int one_thousand = 1000;
         |            ^~~~~~~~~~~~


vim +/hundred_thousand +146 kernel/sched/fair.c

   139	
   140	static DEFINE_PER_CPU_SHARED_ALIGNED(struct list_head, qos_throttled_cfs_rq);
   141	static DEFINE_PER_CPU_SHARED_ALIGNED(struct hrtimer, qos_overload_timer);
   142	static DEFINE_PER_CPU(int, qos_cpu_overload);
   143	unsigned int sysctl_overload_detect_period = 5000;  /* in ms */
   144	unsigned int sysctl_offline_wait_interval = 100;  /* in ms */
 > 145	static int one_thousand = 1000;
 > 146	static int hundred_thousand = 100000;
   147	static int unthrottle_qos_cfs_rqs(int cpu);
   148	#endif
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
