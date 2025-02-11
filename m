Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C791D90CD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739267392; cv=none; b=Xr1SukvC4hrNv4+51Ljnzufp/rUdjHLSorY28dvm4NHNJa5MVg8kQHFicb/o439VwBlDXZlb9x9GZfUkL/DAZr4g0B+SYSFwMF8yQYc14uyUv6M6ZdwlP52kriMQJU+jTffMqk0gxI3fLstwMhHCEm2JUWt8+LMoJtnJ6Ulj8Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739267392; c=relaxed/simple;
	bh=d78rbI4OX29dISjdJ2ltkDyB1W3JQz9rUhsGACNV2Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l3Ez/5mdWBsu1gSPhC9EId7IUa2ZacDkNH0a7TR1ZN5ZdJA0V+6p7zcCy2wmm30+4FgNyXlogUTpjULvYwidAcApoLPcZGi6heNvj0glHywpSaOgN0zppT0vsNQ+tztKWAaeOYSPj/S4moU3R9HaKhmja56y9yT5n+G6fi5YLXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1o4rgD1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1o4rgD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739267390; x=1770803390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d78rbI4OX29dISjdJ2ltkDyB1W3JQz9rUhsGACNV2Fo=;
  b=R1o4rgD1wO6qk0FCaLuZS1Ggq6FgftCV1uwdMJfTFv9NjQGRak/84RGR
   EE4PoaOqHpsEzl6VTqwbxtIlX3ZmffDdW4jrY1quITyR2lcqx95nvbG4y
   fOuXLA0se5BOxd03kFCT+ATF6oYOPjalKp1s4ocwPtn8+OtG6N/xGb2LH
   Yc78Xgt2YYQW/Yb+5XMd+781ojOjQUvhgqhWA4eTxhC/bH7sDlEtxcPfU
   AucAqPddPPhlImNbtB1IITMnP8i1L5IVl7LX6twjLBs5E806xCaGLi/K4
   mh0GPCQ6Szp7vJMlxWhp0OhoXFKJvZrTIedDfHbzYF64vFkccji5lz9Ex
   A==;
X-CSE-ConnectionGUID: YnEUGktaQSqHKHfu4rZWkQ==
X-CSE-MsgGUID: 2A2ghcYvR9CZceQKBwrVoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="42715224"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="42715224"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 01:49:49 -0800
X-CSE-ConnectionGUID: r8qcHbv1RP+SrB81H4aQmg==
X-CSE-MsgGUID: YzP88OqpSmapBGdzmg0RQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149638639"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Feb 2025 01:49:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thmtl-0013zP-0W;
	Tue, 11 Feb 2025 09:49:45 +0000
Date: Tue, 11 Feb 2025 17:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:cpusetisolation 5/5] include/linux/sched/isolation.h:63:52:
 warning: omitting the parameter name in a function definition is a C23
 extension
Message-ID: <202502111706.jA5f0XxY-lkp@intel.com>
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
commit: 9861605548c2952b76f12b4ff62edaa42e6cb61e [5/5] sched/isolation: no housekeeping work for cpuset isolated_cpus
config: i386-buildonly-randconfig-006-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111706.jA5f0XxY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111706.jA5f0XxY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111706.jA5f0XxY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/watchdog.c:31:
>> include/linux/sched/isolation.h:63:52: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
      63 | static inline void reset_housekeeping(cpumask_var_t){ }
         |                                                    ^
   include/linux/sched/isolation.h:68:10: error: call to undeclared function 'housekeeping_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      68 |         return !housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
         |                 ^
   1 warning and 1 error generated.
--
   In file included from kernel/workqueue.c:52:
>> include/linux/sched/isolation.h:63:52: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
      63 | static inline void reset_housekeeping(cpumask_var_t){ }
         |                                                    ^
   include/linux/sched/isolation.h:68:10: error: call to undeclared function 'housekeeping_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      68 |         return !housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
         |                 ^
   kernel/workqueue.c:2519:8: error: call to undeclared function 'housekeeping_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2519 |                 if (!housekeeping_cpu(cpu, HK_TYPE_TIMER))
         |                      ^
   1 warning and 2 errors generated.
--
   In file included from kernel/time/hrtimer.c:41:
>> include/linux/sched/isolation.h:63:52: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
      63 | static inline void reset_housekeeping(cpumask_var_t){ }
         |                                                    ^
   include/linux/sched/isolation.h:68:10: error: call to undeclared function 'housekeeping_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      68 |         return !housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
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
   5 warnings and 1 error generated.
--
   In file included from kernel/sched/core.c:34:
>> include/linux/sched/isolation.h:63:52: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
      63 | static inline void reset_housekeeping(cpumask_var_t){ }
         |                                                    ^
   include/linux/sched/isolation.h:68:10: error: call to undeclared function 'housekeeping_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      68 |         return !housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
         |                 ^
   kernel/sched/core.c:5643:6: error: call to undeclared function 'housekeeping_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5643 |         if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
         |             ^
   1 warning and 2 errors generated.


vim +63 include/linux/sched/isolation.h

    58	
    59	static inline void housekeeping_affine(struct task_struct *t,
    60					       enum hk_type type) { }
    61	
    62	static inline void housekeeping_init(void) { }
  > 63	static inline void reset_housekeeping(cpumask_var_t){ }
    64	#endif /* CONFIG_CPU_ISOLATION */
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
