Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7398239E9D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 13:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766323085; cv=none; b=fKWBEUzyWxxXbzIi2ncBctH/oPPIPt+ub3hJrWOk5qH2tvGTNCWscVQFrxtHfLJ/MIRWEF8pAqGsOUP6t849PWKSQSru32WIXL2wAcNknpAIo19OPaSVdcZbDqwWskjrLz8+hUUNx/mCdWg7WZaJpKivl1SNinUE5gtb+hnS/os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766323085; c=relaxed/simple;
	bh=eJvYUKmzImpFT950h3Q+BKG7gS8ccwVPu2QT0YONmak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZqG3t1f1K2TcNYVqKAW9cadVIHt/g7PrzsMcfPRsQ5Uctt34m+q2FV25zBNqMWNL3IMl0qd3UEjsCF9NvCp5Icjv/ussjjCxa7HSKqx0VdIvfdlySmAnAdrMHmnvxXcAwixbE4J4BTZDWBZCdh0CfIIki2nEAgNgBv11fhZjNrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIFhKU6Q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIFhKU6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766323082; x=1797859082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eJvYUKmzImpFT950h3Q+BKG7gS8ccwVPu2QT0YONmak=;
  b=KIFhKU6QJohkNnw0Nk4AzyT7axoCHa1W9hbKg6FWjxnUszeMgLNvf023
   aTCG9EIudKQes5vgmFpO5xDkYpOEYfGCHoL2sxgpAC57ccZVQFUcAi3AY
   wN2DucOtyjjE6fXP9OVTpfYH9vOIPpYO6fLvlNSXLJ57b+HH3HdJF7gab
   a7boNj9Fcp9Js3CgRsasvk0ayeMtKNLKwbcGrj3+4I1bBmlsu5NcScxed
   X/ju9t7BTlPPkOh2Gpsc6jFYb8Q3rxiJMTtEgHYIXVT6hTECYThlplrSa
   03+TxoQOQDlyEn4QZQl0onGXlcOg+OGetKQ4VfqcrA4m9Lr57KqL0japy
   Q==;
X-CSE-ConnectionGUID: wSWnxABURkmgVfSmXJpBtw==
X-CSE-MsgGUID: LuIld+WQQNSBOL6B6rD6rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="93681373"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="93681373"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 05:18:01 -0800
X-CSE-ConnectionGUID: HkubRZmMQu2l+bh0e0KdKg==
X-CSE-MsgGUID: oyBZETbETqqjD7RRRKXrdA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2025 05:18:00 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXJJu-0000000054K-1epv;
	Sun, 21 Dec 2025 13:17:58 +0000
Date: Sun, 21 Dec 2025 14:17:15 +0100
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 7/7]
 ./include/linux/kernel_stat.h:167:9: error: implicit declaration of function
 'kcpustat_fetch_default'; did you mean 'kcpustat_cpu_fetch_default'?
Message-ID: <202512211446.GiIMpzdi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   377cf035e0d76753d72649b16d4d9b693e7f4b86
commit: 377cf035e0d76753d72649b16d4d9b693e7f4b86 [7/7] tick/sched: Consolidate fetching idle time
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251221/202512211446.GiIMpzdi-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211446.GiIMpzdi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211446.GiIMpzdi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/cgroup.h:27,
                    from ./include/linux/cgroup_api.h:1,
                    from kernel/sched/sched.h:28,
                    from kernel/sched/rq-offsets.c:5:
   ./include/linux/kernel_stat.h: In function 'kcpustat_cpu_fetch':
>> ./include/linux/kernel_stat.h:167:9: error: implicit declaration of function 'kcpustat_fetch_default'; did you mean 'kcpustat_cpu_fetch_default'? [-Wimplicit-function-declaration]
     167 |         kcpustat_fetch_default(dst, cpu);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         kcpustat_cpu_fetch_default


vim +167 ./include/linux/kernel_stat.h

   164	
   165	static inline void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
   166	{
 > 167		kcpustat_fetch_default(dst, cpu);
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
