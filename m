Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2949432E758
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 22:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766011640; cv=none; b=Z65QAUgQrsApB/WyH8W5rxpdca9yBe+yV8jiLgTD/m+fiFK7lYhwZkkLjykoyN1HcGrvyMNXddH/VFdrrapkdI/BMveefhhfBSkpnI0OZpITZkbKBdzgY1cZxzey70XU65LSc7f5v1M3IxwLnGrTwI2PoOvZ/GPNR0gouEcOOFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766011640; c=relaxed/simple;
	bh=QqjFdqzkTEuW6zIFefLgrYyF7P1eP8cIiaWOQ9RPBEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c6YwG5HlbbW2pvSLr1RCDqIOHuuOr755qoZVVGGY7Ekb1jhSWM9PvnhlwPs+ao4Y9rqlCJktrPC+fYOAcikaHazyDTz0lAZNT5Jdjw6oxUY4VesgtCJ+PrG5Sa/sIYKU75PcUCKhAK3uibzO4Nkw88Xh0OR314DLCMtm30/bXes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2/+qZ3+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2/+qZ3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766011639; x=1797547639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QqjFdqzkTEuW6zIFefLgrYyF7P1eP8cIiaWOQ9RPBEQ=;
  b=K2/+qZ3+YUupyU+5q7mT6pVv5vFw84feynydp+JZdCTDloqpNK+lKXIe
   8poGMnSIO9iIp/n+lmEKeWkQVY1F84scLlqPq7DNDEMEsNAC2eEwTrzug
   nV+SGpwKEDrp53q5T3PviHuRqRbIdxkSrXJCIPxSHoEV3Gi9HmrN36oqt
   WoSUJnTQPnBRA/lKkqPP9YH/yLMu+4+QZTRPct1mUJutGLeEp5l8ZADEH
   fq1QGjW/Ikxhb6grM0vaWQ8EzO99HznCG/se2R0A0L0ELqoGM7FVlFjOF
   +4dwgFpW0vS4JdmEqhdgMf/jHKz9r6TJApgOMvhkpJ4UHag0c4N9tZ80D
   w==;
X-CSE-ConnectionGUID: eO290XIDRPGPbJw+mMY5Hg==
X-CSE-MsgGUID: xV5XypngSBSFBIE8vrEqTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67852008"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67852008"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 14:47:19 -0800
X-CSE-ConnectionGUID: 0TcIkJQWQBGCJihwceik9A==
X-CSE-MsgGUID: Nmf4THhpQZyIH+1RIXd2Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198032643"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Dec 2025 14:47:17 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW0Id-000000001Jk-3oM7;
	Wed, 17 Dec 2025 22:47:15 +0000
Date: Thu, 18 Dec 2025 06:46:41 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 7/7]
 include/linux/kernel_stat.h:167:9: error: implicit declaration of function
 'kcpustat_fetch_default'; did you mean 'kcpustat_cpu_fetch_default'?
Message-ID: <202512180610.eAvMvD83-lkp@intel.com>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251218/202512180610.eAvMvD83-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180610.eAvMvD83-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180610.eAvMvD83-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cgroup.h:27,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
   include/linux/kernel_stat.h: In function 'kcpustat_cpu_fetch':
>> include/linux/kernel_stat.h:167:9: error: implicit declaration of function 'kcpustat_fetch_default'; did you mean 'kcpustat_cpu_fetch_default'? [-Wimplicit-function-declaration]
     167 |         kcpustat_fetch_default(dst, cpu);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         kcpustat_cpu_fetch_default
   make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +167 include/linux/kernel_stat.h

   164	
   165	static inline void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
   166	{
 > 167		kcpustat_fetch_default(dst, cpu);
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
