Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F2024C694
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285792; cv=none; b=W7YNA/UhPQjYbiveH8xsoBWTXdHltVVl8C86F4sAjnFAL4PNJhS1WMnVgZ+FKXXdc5nTz1iPKZVWooerxygEx8WTplAQpCsjXSCmv2hSfQTktRoH0ZRA0VPaNOAyGq6R7AzawyLb1oERiBeakMPuhVpLr3l+GdY+tjkryasNdAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285792; c=relaxed/simple;
	bh=WNY5BpReGnMFCUhFSVF6Xwe/N44NwM9NGvZS4KxU0E8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TiuShPZpn+CH7gvnPgTKI+DoK3xoXpUDTzCX5gScYoruCNakzQLaCDMyzArNdWVLtXv8ffrleD5Kd4PdgtP/T9L7F2heht47ivW+jKAjZsxQMAOEYv5Ko9YSlPVQnZGii18DtiMMQwUTy2JCDI9enR7vlom6fTlkAT12zqzAROQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+lNtTKq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+lNtTKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739285791; x=1770821791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WNY5BpReGnMFCUhFSVF6Xwe/N44NwM9NGvZS4KxU0E8=;
  b=Q+lNtTKqCZ61B5O6C9+lF5TogV733Q39je4vea7YmR+Dw8WCrO2NLmV3
   jxEvPXmsSvXQEwHOuUyOvwCs+GujNu1U4T8Ohh6J/XvTA0TuTUWgpvxrQ
   imqK/OkSywM04PO++laQA0M97gD7FF4GX/U8vTM+rtvxFkT5f09eqwMGB
   Qo73vfDtb4fGrXDfOyevI1mXCJ1svkn5vOZnu99GP0nj4Bi0C3z6dmsWv
   fkXA+/LQmmoF9ey8X0zNdkV/KXtiZinsN6uUbKe18Fs05Fnk6pLR5lbLZ
   J0RtOOc2gUjvdzyEpFACrMCd3aCa200N//rZU3K1thYWpMlA0B1bamlXT
   Q==;
X-CSE-ConnectionGUID: GOvh6D2JRqeypGorYf3LrA==
X-CSE-MsgGUID: 2WGjlcuCSSGCH9qd4NED5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39790326"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39790326"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:56:25 -0800
X-CSE-ConnectionGUID: g/6/ZSo5Rru0HZwr7EwXIw==
X-CSE-MsgGUID: RpUIaBMJRVC5WgL0pGNCDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="143383624"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Feb 2025 06:56:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thrgS-0014KB-1R;
	Tue, 11 Feb 2025 14:56:20 +0000
Date: Tue, 11 Feb 2025 22:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:cpusetisolation 5/5] include/linux/sched/isolation.h:63:52:
 warning: omitting the parameter name in a function definition is a C2x
 extension
Message-ID: <202502112215.CuIJEolZ-lkp@intel.com>
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
config: um-randconfig-001-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112215.CuIJEolZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112215.CuIJEolZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502112215.CuIJEolZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/workqueue.c:52:
>> include/linux/sched/isolation.h:63:52: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
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
   In file included from kernel/kthread.c:30:
>> include/linux/sched/isolation.h:63:52: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
      63 | static inline void reset_housekeeping(cpumask_var_t){ }
         |                                                    ^
   include/linux/sched/isolation.h:68:10: error: call to undeclared function 'housekeeping_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      68 |         return !housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
         |                 ^
   1 warning and 1 error generated.
--
   In file included from kernel/time/hrtimer.c:41:
>> include/linux/sched/isolation.h:63:52: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
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
>> include/linux/sched/isolation.h:63:52: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
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
