Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8779A2BB05
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 19:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716665338; cv=none; b=H8DBjvQxsEaXCDVLSe9TIEQqHBJmU1NvkyWZdiEMfZqvFNg58Q0IlMm12l5wifnqzvCSadBY26+xB8mE9D/fFAf1Ydpesn9BKJT2YqcGngRAcdI0VJgDjAANWWDbHHM+l2G2wiGgByx/w+UIWmjpgNxdHvElFndBenH99VR7igo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716665338; c=relaxed/simple;
	bh=5UKRgZ30/yQlrnykXzE7BD9cIuhtiBi2EQ1f5p0Q52Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vFsNjd7Nf9mQiVXTTk3RSJRgTEScUfCF4p2tMkNYKgPILMEGq0PMFTd3wCMxPSyR9tUVKHWr6lSVol/PiU+YJ4CS5N6R9dJ0Io88ITGSG0DslCSNUuMIz1VaRNcWnROOty5cp1s2SZh+q0gaehuC905L8evLyV6t3yOm8MuW/2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXdTHEeD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXdTHEeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716665336; x=1748201336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5UKRgZ30/yQlrnykXzE7BD9cIuhtiBi2EQ1f5p0Q52Q=;
  b=nXdTHEeDrRcvNRh91Jreu46Rv5zmQmnANWBhj1F/GbwZ/rfIPkBr31sg
   VGGpm6Sb431iuLmm4DUFXxpz5JEM6848MEyiMVDPxrGw+Yh1THMPXh2hl
   9IQdT0gdQgTEtoOgO6KAr4CIkSn8Hu75bfWvt1LM4rS1/dqvq+PD7QX+Q
   zYl5xKVgjKNQWcl8zbgwxGosii0otM5jtgFjqovKxC9Sj5/9BOXJg+UZ8
   I8ctuQQcou1bKmlcvZkZeXeIuwOK6Mqd22C912EJVnQsc17xY44FK8ilu
   6BToJDondMrsvTAax+WfE1JLwaponcmfUN9If05HTOPeFirmi4Tpbc+3y
   g==;
X-CSE-ConnectionGUID: n2RNgANGS5KoEpjWPXVUEQ==
X-CSE-MsgGUID: TtvCnIrtTdmaz+nt0KbKgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="30537363"
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="30537363"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 12:28:56 -0700
X-CSE-ConnectionGUID: CfS4u2J4T2OkCHPYFCfJ7A==
X-CSE-MsgGUID: my+OZ12rTRWwbaaRcCvtpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="34942025"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 May 2024 12:28:54 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAx4V-0007MD-1y;
	Sat, 25 May 2024 19:28:51 +0000
Date: Sun, 26 May 2024 03:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask-types 2/3] include/linux/sched.h:1607:26: error:
 implicit declaration of function 'ilog2'
Message-ID: <202405260356.IFlw8hr8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask-types
head:   04d10bebce942cfc9871eca228852a351b276a06
commit: 6f595fbdf7c6cb328300eb821e124737a32bb382 [2/3] cpumask_types
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20240526/202405260356.IFlw8hr8-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405260356.IFlw8hr8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405260356.IFlw8hr8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   include/linux/sched.h: In function 'task_index_to_char':
>> include/linux/sched.h:1607:26: error: implicit declaration of function 'ilog2' [-Werror=implicit-function-declaration]
    1607 |         BUILD_BUG_ON(1 + ilog2(TASK_REPORT_MAX) != sizeof(state_char) - 1);
         |                          ^~~~~
   include/linux/compiler_types.h:467:23: note: in definition of macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:487:9: note: in expansion of macro '_compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/sched.h:1607:9: note: in expansion of macro 'BUILD_BUG_ON'
    1607 |         BUILD_BUG_ON(1 + ilog2(TASK_REPORT_MAX) != sizeof(state_char) - 1);
         |         ^~~~~~~~~~~~
   In file included from include/linux/ptrace.h:6,
                    from arch/xtensa/kernel/asm-offsets.c:21:
   include/linux/sched.h: In function 'set_cpus_allowed_ptr':
   include/linux/sched.h:1781:14: error: implicit declaration of function 'cpuamsk_bits'; did you mean 'cpumask_bits'? [-Werror=implicit-function-declaration]
    1781 |         if (*cpuamsk_bits(new_mask) & 1 == 0)
         |              ^~~~~~~~~~~~
         |              cpumask_bits
   include/linux/sched.h:1781:13: error: invalid type argument of unary '*' (have 'int')
    1781 |         if (*cpuamsk_bits(new_mask) & 1 == 0)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:117: arch/xtensa/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/ilog2 +1607 include/linux/sched.h

fa2c3254d7cfff Valentin Schneider 2022-01-20  1602  
1d48b080bcce0a Peter Zijlstra     2017-09-29  1603  static inline char task_index_to_char(unsigned int state)
1593baab910da7 Peter Zijlstra     2017-09-22  1604  {
8ef9925b02c23e Peter Zijlstra     2017-09-22  1605  	static const char state_char[] = "RSDTtXZPI";
1593baab910da7 Peter Zijlstra     2017-09-22  1606  
06eb61844d841d Peter Zijlstra     2017-09-22 @1607  	BUILD_BUG_ON(1 + ilog2(TASK_REPORT_MAX) != sizeof(state_char) - 1);
20435d84e5f204 Xie XiuQi          2017-08-07  1608  
1593baab910da7 Peter Zijlstra     2017-09-22  1609  	return state_char[state];
1593baab910da7 Peter Zijlstra     2017-09-22  1610  }
1593baab910da7 Peter Zijlstra     2017-09-22  1611  

:::::: The code at line 1607 was first introduced by commit
:::::: 06eb61844d841d0032a9950ce7f8e783ee49c0d0 sched/debug: Add explicit TASK_IDLE printing

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
