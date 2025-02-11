Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BD51F12EF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 08:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739264320; cv=none; b=TEWOPCaBcMJ034dhUMypb8bzskBeFyxg41n/BXEWXVMINOaOi3HcvZCVi+GPrZdt86hYcafeL5PL6mSfspAj6V5xcmIBtUfjM5vZSIITfBeKh9sV2i363WSNbY1IuFaukhXJYV/uBIIIlIjCHiDbq4C2mG8CXgE3Hwxzb6FpWMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739264320; c=relaxed/simple;
	bh=6ltLRsgKs8/2niSiB+F8xMW+FDsLhdFMwaiPwoiOkXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r+iHsYTKorKY/0yl6W60TC7BtJ5BN/JgiOAVBTpP78Lp6j/dzOB30Bj6s1OmzCpKKyqVYvzGMcYeupJOoeNr/9Te4S9iD6wzWQBNYY3EPFfxsbNEePypUdixku4vDPt61qgcyHnBlU/dQQbG503+NvTeEvX2/Sfp4vyPaoaIRuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPdA8ABO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPdA8ABO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739264319; x=1770800319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ltLRsgKs8/2niSiB+F8xMW+FDsLhdFMwaiPwoiOkXg=;
  b=QPdA8ABOzWMHnIwhkvWjlFJI0IzI9YOchP/la4nYU9vcoIL04Ox7Vydc
   r+INzNc002J/w2tHfFrIKD1dB2iQKiTZtTrDbREaiSEUrxVb7bi6a3+vs
   yLCGceOwbGDpCof8xuAkmeyCarivtrLu1CGKVWlxuUD7Fzvycgn9zCldZ
   4+cFk+vOAfcqUocZ8JH/LwWSXer6ImfluLGrQCN/7zDfeDM45C5JhtqOo
   znYk8Vbtw1ckqyu9ZUCdW7/D+N6XkLI13H8pXlbyJbpjcxYTqGd4lqDpr
   rzMVn71srSP0r2gVRXVRgdiV48cuLWll0wkOOxqMlyNWUS0xcrmlI06tk
   Q==;
X-CSE-ConnectionGUID: VFBB3tE4TZeiAvdtUkTX2w==
X-CSE-MsgGUID: XT92dM0TTq6VPvTCFqZmXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39892870"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39892870"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 00:57:43 -0800
X-CSE-ConnectionGUID: rSVLfZUDT/WLvHfbiEWXjQ==
X-CSE-MsgGUID: /bTZJbfkQlmKe3DLRN+C+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135701189"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2025 00:57:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thm5L-0013wR-14;
	Tue, 11 Feb 2025 08:57:39 +0000
Date: Tue, 11 Feb 2025 16:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:cpusetisolation 2/5] include/linux/sched/isolation.h:61:10:
 error: call to undeclared function 'housekeeping_cpu'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202502111608.FDAH2ySN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git cpusetisolation
head:   9861605548c2952b76f12b4ff62edaa42e6cb61e
commit: 74b420e55b3d622b3e1c580efada25dedfc9c2d3 [2/5] sched/isolation: merge housekeeping_cpu() and housekeeping_test_cpu()
config: i386-buildonly-randconfig-006-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111608.FDAH2ySN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111608.FDAH2ySN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111608.FDAH2ySN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/watchdog.c:31:
>> include/linux/sched/isolation.h:61:10: error: call to undeclared function 'housekeeping_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      61 |         return !housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
         |                 ^
   1 error generated.
--
   In file included from kernel/workqueue.c:52:
>> include/linux/sched/isolation.h:61:10: error: call to undeclared function 'housekeeping_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      61 |         return !housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
         |                 ^
>> kernel/workqueue.c:2519:8: error: call to undeclared function 'housekeeping_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2519 |                 if (!housekeeping_cpu(cpu, HK_TYPE_TIMER))
         |                      ^
   2 errors generated.
--
   In file included from kernel/time/hrtimer.c:41:
>> include/linux/sched/isolation.h:61:10: error: call to undeclared function 'housekeeping_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      61 |         return !housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
         |                 ^
   kernel/time/hrtimer.c:124:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     124 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:27: note: previous initialization is here
     122 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:125:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     125 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:27: note: previous initialization is here
     122 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:126:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     126 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:27: note: previous initialization is here
     122 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:127:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     127 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:27: note: previous initialization is here
     122 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.
--
   In file included from kernel/sched/core.c:34:
>> include/linux/sched/isolation.h:61:10: error: call to undeclared function 'housekeeping_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      61 |         return !housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
         |                 ^
>> kernel/sched/core.c:5643:6: error: call to undeclared function 'housekeeping_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5643 |         if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
         |             ^
   2 errors generated.


vim +/housekeeping_cpu +61 include/linux/sched/isolation.h

    58	
    59	static inline bool cpu_is_isolated(int cpu)
    60	{
  > 61		return !housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
    62		       !housekeeping_cpu(cpu, HK_TYPE_TICK) ||
    63		       cpuset_cpu_is_isolated(cpu);
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
