Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873A32F4A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 18:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726426321; cv=none; b=WhwM45bl7rFkG/BgLwmx7tonY4D2gcN7eXB+fD0Lmm/pYK9/yLA6tx9egLSSKvSFeOY6JXsUU8xREsIKcbjTL8KySmw/dfsLaUXJS/p3W+ylUOeHBDoJPDh9S22FZFdAep/DkejMtBq7cYqkc4bn+4Y6tvTrNqwTD+33AUrxnv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726426321; c=relaxed/simple;
	bh=Xl6voxpKSUrSSye2uFdoNNoaFb1rl5PGa/U7qIregwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ah0zXTHsUl9bXAhPjT0mgu116L6n92DQhsLbFJyXTN6JRuGI5nNGp0ADjniMYFaU1Mjazc31OyycXEYBl7j3UpTHeP7iLZGNt8NIKVAZKUCu4URjnAr05ibaBY+FJaeLoFeI8J29HyXyDmG0VxDtsxYxRVnd0xDmQbjfbAJUBQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SaOBaDnE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SaOBaDnE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726426319; x=1757962319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xl6voxpKSUrSSye2uFdoNNoaFb1rl5PGa/U7qIregwY=;
  b=SaOBaDnEcdTvMI5+7G6vKPNo3nwKp7GW7DIF12HReP9p7qXJ2Xd3K/b3
   tlKtEeU634QuqO6odYs6GTZaMxuRa2sCAYxdygelba+hlHMEYhZIXplkm
   d+B+gZ5rhe/Nhkxvi9c5pYgKAGhnZlPZeQVt4EGY3aJoIWIH+zdmJBj3M
   PnDSufaMqJbeAqBZ7wBY0+Bd7ZWP+mY20gWVbhMwrgFuwriXwkJjF9FHo
   xLFEvilIk8UXMlZW+B9XqPFV1CKGF/+cZwp3s9IoIv6/mKPmszJawgEHs
   DitdnB+P9v1n5RdnVQxtIYmzqRA8my0MDe9vx+3c0PquYIsDQWzc3rdWN
   A==;
X-CSE-ConnectionGUID: VI123+6nRM+3YGUdRB8Huw==
X-CSE-MsgGUID: /QGIjTxFSeSCkX0ZI9rouA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="47778008"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="47778008"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 11:51:59 -0700
X-CSE-ConnectionGUID: 8Pm559/QTyKFjW1+5C+1QQ==
X-CSE-MsgGUID: oGY3TiQNQD6aM59akohjNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="73449587"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Sep 2024 11:51:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spuLj-0008wA-2e;
	Sun, 15 Sep 2024 18:51:55 +0000
Date: Mon, 16 Sep 2024 02:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenyu Huang <huangwenyu5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1659/13950] kernel/sched/fair.c:146:12: warning:
 'hundred_thousand' defined but not used
Message-ID: <202409160256.rcSYesB7-lkp@intel.com>
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
head:   84404f248a61323e09909849803ea4efce81742f
commit: a3c9f2da0a35df4e41751556be4308f57bdaf3d6 [1659/13950] sched: Introduce handle priority reversion mechanism
config: loongarch-randconfig-002-20240916 (https://download.01.org/0day-ci/archive/20240916/202409160256.rcSYesB7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160256.rcSYesB7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160256.rcSYesB7-lkp@intel.com/

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
