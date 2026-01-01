Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9771E2222B2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 03:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767236849; cv=none; b=hy3vhu37wNlsoA1y+4bgv0olwfLqqIpLD6wqY3N5+swHqiqitkj3q4w5BW/oGrWFo2L6sEn8l2/wRWcyTxxVFXyav6wWn18umeBfNtDzHUyx/vaTe7p51SV2uAXg/AiZR/4wMn9WlUnSqqE4goQw6dBHGwopDbZPr9n2sWbtoX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767236849; c=relaxed/simple;
	bh=0CL41+ZEvsVgFfdB3vD01RPc1kewgcH52QZf4HGTHC4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SuR1nQRv5uGD/XiabHJQNxh7RaCOHWs003/fbSkQ8aMyTiM39QJl2An3CMwOjn6/8d95StAMjYd61R1/w4M6WCOX3EBW41dYwvDbbPEXl7XsWD5E2zWjbrxmI+w0ccCeaZcat5tA0zAuKMFUWsEeHYqXvxftAw77OHZIAaqzkhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmiDw6Rl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmiDw6Rl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767236847; x=1798772847;
  h=date:from:to:cc:subject:message-id;
  bh=0CL41+ZEvsVgFfdB3vD01RPc1kewgcH52QZf4HGTHC4=;
  b=LmiDw6Rl2Y238FulaD0Ick1DAuTn7lgICPAXgvB2+FZ8ZbaymLtN+6mt
   14tsFlSR+EvUer/Nefq9Wp+LyI1BpDDzFHPn8248woEkxYisPwvKL48uD
   aDT+E3HsmmhE1LLy9A56naXnXg3MdymFwt7RxwaTeL5pTuP0HgEOH/BtT
   JIy9HM90V1ACxfS0c/7C5c+CQGOxIlJBbqsUxciLcaBcnpTkNUlkaLiCE
   8eCVmcswLNCSpKZ7kbI3G1E9WAAQ91RqQnsmJlYWqoxnIE5Utm1q0MSO7
   Lmss3h3ZW2mRmTHmgOZT0nTFxNvmgbs+J49dNUzG5MaoZEeYWGiIwFMtG
   A==;
X-CSE-ConnectionGUID: H4LGuJBfRQCbq6IJr0RP5Q==
X-CSE-MsgGUID: M7k/Yo8BSEORIqocANo6Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68823154"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="68823154"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 19:07:26 -0800
X-CSE-ConnectionGUID: 3WpCJzsMRCmJRkpaCLw2+A==
X-CSE-MsgGUID: Oa/u0Y7zR+u7fv8QM8uOWQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Dec 2025 19:07:24 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb922-000000001dh-15D6;
	Thu, 01 Jan 2026 03:07:22 +0000
Date: Thu, 01 Jan 2026 11:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenyu Huang <huangwenyu5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 18/18] kernel/sched/fair.c:146:12:
 warning: 'hundred_thousand' defined but not used
Message-ID: <202601011044.V6fvcOo6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Zhang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5078a3a23a1e1825ec136485173ec98668cdd640
commit: a3c9f2da0a35df4e41751556be4308f57bdaf3d6 [18/18] sched: Introduce handle priority reversion mechanism
config: loongarch-randconfig-r133-20260101 (https://download.01.org/0day-ci/archive/20260101/202601011044.V6fvcOo6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011044.V6fvcOo6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601011044.V6fvcOo6-lkp@intel.com/

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
