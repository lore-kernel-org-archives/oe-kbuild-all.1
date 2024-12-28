Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5025135952
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 10:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735380417; cv=none; b=bBNpYQr6b/C3Yt569XI3aiFh6NwBmVlahu0gJI/cHE0DFky3fOoCt+ufvQDhbafgFxZ/pZmfhR1swLJZHbh8Mif0IPr/jgVBd/VWbmUx/GH5irvWNplrzErzpJLP75DNuqx4kZEXa9Mg+gc7AKAz0JljG807/H5SggPpZKo0Bm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735380417; c=relaxed/simple;
	bh=0qdmeiPS9LIpivL2OQRyQEAt9QtWBrgbgF4BnKrlXBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SKGUGQJ00dCiihme3z+9qhoPShEirRLfvQxwrJc0HpSOTTQmEB+wJcMBksOYoeQvXS8rIB+VKVLWyxN5Tp1MsBv07qB4uY6bP5PWGK0Xv+LbSQRerSntZ83MkuXHBM7j3RnElM0/coSDQa5E2seocOr7CenTPanPwFvd7Mi7cS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ap664Iux; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ap664Iux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735380415; x=1766916415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0qdmeiPS9LIpivL2OQRyQEAt9QtWBrgbgF4BnKrlXBk=;
  b=Ap664Iux3VuAi08ghFg+sS9WEIVBi/J4dlfalzUKyNIYpP1xDOiuiko1
   syP6uGJ5S47Hwdg6foW3tKpuP7/dL3ODKzCxrksIpCf/xjfrAy/Kd2I01
   rwXjIAkpYQdGPUBQKi9d63poCCQ+N4Bl02rclPHNMH3lIKt/wmXVmN1cp
   qenkWJTszBrOuV+G2A2eyppWjsHi1LK4USHnuoOpS83Z8wxuZjmDb91+L
   Htqu3eC3CFi5zBp+FGQBAETEN9cRf0kt+7vEq85LWOQfOAocMVF2VgS8q
   DUIL390m++lUFVRyyn6FlmYIhNHMtulud2HdsKM4CJK/3FKKJiGNix8m0
   w==;
X-CSE-ConnectionGUID: oJvpNPQXTr6umLMxktzMJg==
X-CSE-MsgGUID: gBBWoUmuSiCkQKozx16I0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="61127626"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="61127626"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 02:06:54 -0800
X-CSE-ConnectionGUID: nfNeE0oHR/KPUeFYufJoWQ==
X-CSE-MsgGUID: udzWDwc9Riuo2KQ7IjsggA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="100097806"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Dec 2024 02:06:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRTid-0003zg-0R;
	Sat, 28 Dec 2024 10:06:51 +0000
Date: Sat, 28 Dec 2024 18:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 12/13]
 drivers/cpufreq/longrun.c:104:2: error: call to undeclared function 'wrmsr';
 ISO C99 and later do not support implicit function declarations
Message-ID: <202412281850.tbPWDbz5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   831a3852bafc8cabcce4c27132e763d6c88e3e25
commit: fa35b474c37ab69322a792c957381b9bb28bb057 [12/13] x86/msr: Remove MSR write APIs that take MSR value in two u32 arguments
config: i386-buildonly-randconfig-005-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281850.tbPWDbz5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281850.tbPWDbz5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281850.tbPWDbz5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpufreq/longrun.c:104:2: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     104 |         wrmsr(MSR_TMTA_LONGRUN_FLAGS, msr_lo, msr_hi);
         |         ^
   drivers/cpufreq/longrun.c:104:2: note: did you mean 'wrmsrl'?
   arch/x86/include/asm/msr.h:251:20: note: 'wrmsrl' declared here
     251 | static inline void wrmsrl(u32 msr, u64 val)
         |                    ^
   drivers/cpufreq/longrun.c:181:3: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     181 |                 wrmsr(MSR_TMTA_LRTI_READOUT, msr_hi, msr_hi);
         |                 ^
   drivers/cpufreq/longrun.c:219:3: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     219 |                 wrmsr(MSR_TMTA_LONGRUN_CTRL, msr_lo, msr_hi);
         |                 ^
   3 errors generated.


vim +/wrmsr +104 drivers/cpufreq/longrun.c

^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   62  
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   63  
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   64  /**
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   65   * longrun_set_policy - sets a new CPUFreq policy
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   66   * @policy: new policy
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   67   *
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   68   * Sets a new CPUFreq policy on LongRun-capable processors. This function
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   69   * has to be called with cpufreq_driver locked.
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   70   */
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   71  static int longrun_set_policy(struct cpufreq_policy *policy)
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   72  {
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   73  	u32 msr_lo, msr_hi;
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   74  	u32 pctg_lo, pctg_hi;
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   75  
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   76  	if (!policy)
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   77  		return -EINVAL;
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   78  
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   79  	if (longrun_high_freq <= longrun_low_freq) {
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   80  		/* Assume degenerate Longrun table */
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   81  		pctg_lo = pctg_hi = 100;
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   82  	} else {
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   83  		pctg_lo = (policy->min - longrun_low_freq) /
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   84  			((longrun_high_freq - longrun_low_freq) / 100);
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   85  		pctg_hi = (policy->max - longrun_low_freq) /
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   86  			((longrun_high_freq - longrun_low_freq) / 100);
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   87  	}
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   88  
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   89  	if (pctg_hi > 100)
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   90  		pctg_hi = 100;
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   91  	if (pctg_lo > pctg_hi)
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   92  		pctg_lo = pctg_hi;
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   93  
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   94  	/* performance or economy mode */
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   95  	rdmsr(MSR_TMTA_LONGRUN_FLAGS, msr_lo, msr_hi);
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   96  	msr_lo &= 0xFFFFFFFE;
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   97  	switch (policy->policy) {
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   98  	case CPUFREQ_POLICY_PERFORMANCE:
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16   99  		msr_lo |= 0x00000001;
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  100  		break;
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  101  	case CPUFREQ_POLICY_POWERSAVE:
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  102  		break;
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  103  	}
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16 @104  	wrmsr(MSR_TMTA_LONGRUN_FLAGS, msr_lo, msr_hi);
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  105  
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  106  	/* lower and upper boundary */
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  107  	rdmsr(MSR_TMTA_LONGRUN_CTRL, msr_lo, msr_hi);
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  108  	msr_lo &= 0xFFFFFF80;
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  109  	msr_hi &= 0xFFFFFF80;
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  110  	msr_lo |= pctg_lo;
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  111  	msr_hi |= pctg_hi;
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  112  	wrmsr(MSR_TMTA_LONGRUN_CTRL, msr_lo, msr_hi);
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  113  
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  114  	return 0;
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  115  }
^1da177e4c3f415 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds 2005-04-16  116  

:::::: The code at line 104 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
