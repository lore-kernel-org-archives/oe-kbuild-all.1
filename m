Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC629247280
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 01:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761442079; cv=none; b=IjgiosNk30VrOCU9nXQS5qIu6LHSSUAq+zZSyUMeTR8zmMIl0yZXO6QEcQHWLn3rJ+cA0J45uA4bT8VtOTGnOau8tNHRudi8xfZGmqOfI7rp6XIxVX+4z+lYNlbtGx6j+2TWd7GBDfq+i3a0Gq4u4k/raJWlpYYkY0Pz4jQb9RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761442079; c=relaxed/simple;
	bh=mYG4nrWIGCmpkgW11TYkj/utWft6bxm8maW6RNZQq3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=szw48ghfi9NamMM0A0bVXWzldvNorVNnLnk039L2Lhgz5oE0etwW+pgiJFGv9dK9jFPO6VXTPeyR77RC98SaCpkvVvPoUk62I/ZWnVrZiHmRABXSmR4WBRVgHoAWF8+SbVH5TQK5zJXqQ3b03weL5rqkvVw/XGlcW/8h1wuu/vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRR9JLdI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRR9JLdI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761442078; x=1792978078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mYG4nrWIGCmpkgW11TYkj/utWft6bxm8maW6RNZQq3o=;
  b=FRR9JLdIdKo3Lxg0jEHO0RG5ze40qv0a1cdyMrVl+OXyzb1l4gXHMMSd
   jb7+hLEl+Yk+/7HtibISWMwWMhUXUzRymCShIJUUf1e/1JvAEyhmmgzes
   mBXGdmxulcyJ5QoYsPnj0it0M9kUXXhwLyWY8QSRrzJzhzUSw00E/1nA3
   WKg0BgP0IKjtcV7RtjOI6klFzykr70qHcr9LGsRmMYWkEPHr+lg/yPdWm
   4/2H4nxmB5SJbUvqYg0lUTVpv2diXksksrBLR5nCQ3l9ICv5CefeNC2DK
   v5c7FIEI2aiPbaH//tY4W+CSqDiZXsbmS/SCY69f7ZcPj8P+pVLHiVWNv
   g==;
X-CSE-ConnectionGUID: 0TOtVBFJT3mQt9UWw6VUgA==
X-CSE-MsgGUID: L7WjWGP9QqmiWAZeEM+HvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51144919"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="51144919"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 18:27:57 -0700
X-CSE-ConnectionGUID: OHvPIOPASZ+ba0o8J6lxrg==
X-CSE-MsgGUID: XG05n4YkRGC3ecO19M66BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="184812628"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Oct 2025 18:27:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCpY2-000FmH-09;
	Sun, 26 Oct 2025 01:27:54 +0000
Date: Sun, 26 Oct 2025 09:27:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Qiao <zhangqiao22@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3201/3201] kernel/sched/soft_domain.c:186:10:
 error: implicit declaration of function 'cpu_util_cfs'
Message-ID: <202510260907.OvG1jFRN-lkp@intel.com>
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

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ca1036e548e57768ca272bbd5f5cbde3b153f803
commit: dd6655291bf7230ef984e1d283a5ec05821f996f [3201/3201] sched: Attach task group to soft domain
config: x86_64-buildonly-randconfig-002-20250909 (https://download.01.org/0day-ci/archive/20251026/202510260907.OvG1jFRN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260907.OvG1jFRN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260907.OvG1jFRN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/soft_domain.c:186:10: error: implicit declaration of function 'cpu_util_cfs' [-Werror,-Wimplicit-function-declaration]
     186 |                 sum += cpu_util_cfs(cpu_rq(cpu));
         |                        ^
   kernel/sched/soft_domain.c:186:10: note: did you mean 'cpu_util_irq'?
   kernel/sched/sched.h:3118:29: note: 'cpu_util_irq' declared here
    3118 | static inline unsigned long cpu_util_irq(struct rq *rq)
         |                             ^
   kernel/sched/soft_domain.c:269:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
     269 |         int cpu;
         |             ^
   1 warning and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/cpu_util_cfs +186 kernel/sched/soft_domain.c

   179	
   180	static unsigned long sum_util(struct cpumask *mask)
   181	{
   182		unsigned long sum = 0;
   183		int cpu;
   184	
   185		for_each_cpu(cpu, mask)
 > 186			sum += cpu_util_cfs(cpu_rq(cpu));
   187	
   188		return sum;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
