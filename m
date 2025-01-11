Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB35517BB35
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736597030; cv=none; b=JPnjdgZu4wsz2Yakdiu++1Py47DzZgwhrHh/3sxCj+ARBKXY/R8+mQuBpNMJgpRm/KUQN+uW4j0Q1D1BGxXUl/eafFZn5vn3FUH6Zze5dHGqSFn/CgaFRt6RelLV8aJoWa2/2tr4e4T0MgaWucg+93U+mTfgPbIdcw/TQQajGfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736597030; c=relaxed/simple;
	bh=9v9e9Mg09tqTGp+iVB0NP5iRUk5YX9KoBJwOMqtE9aA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ecCwnHNdFVaR+H7FJ0I1r6n9yIkXl3HbI/MDXVdzcuVW4lIGvy4AoAJeERdhxUHTWXjXaZMMvkejk0OLr07AfezOTV1myAMHYIUrNmQXxcChCU+4+9UIdjo/U4KZGNQu+FmnMnD2R3NQkBc1kTGNg7AoFIlGN5FNNq6jzUaVXmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVRFYejp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVRFYejp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736597028; x=1768133028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9v9e9Mg09tqTGp+iVB0NP5iRUk5YX9KoBJwOMqtE9aA=;
  b=GVRFYejpAHq7JQLaxH/7JFXvpnM8k1BRn9ihL8+UaEKOew5pwzXKDAk5
   Y1A/eHVofMuDEWUhcxOQ15xKHAf/4MGolegrlfpphA9RuTdV/iHIO4Wzy
   tvTtITftaWgqUutly8SLshy4SyFtV1x2VKu7YkBdsIjC0KFmuNmUSZiVn
   9V6xrtkEk7yqLnf/QP3cNEbKWR+VXakdkjzgr6oi3J93iOaJcMLdyxFPV
   C/Mk7yLNlnAwGnnLeQN2aifBQEJq09dq744dusKsF5QrfBG5ZSVNrNv4P
   9BXSma43GPDlcBmxFh7Fn4drDIBiT78ShGbv6jJIgjpQHuR07dKVZcp6K
   w==;
X-CSE-ConnectionGUID: uwBnI7KAQYulZFHSA3Ve5g==
X-CSE-MsgGUID: fEIWfhkhQgCkQ1GpgcFKCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="40565018"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="40565018"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 04:03:48 -0800
X-CSE-ConnectionGUID: mO8x9nQvRkOl49Ts5DsbmA==
X-CSE-MsgGUID: xMw6yD2YQauw9FPq7/azRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="103781738"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jan 2025 04:03:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWaDQ-000Kbo-3C;
	Sat, 11 Jan 2025 12:03:44 +0000
Date: Sat, 11 Jan 2025 20:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 10/10]
 drivers/char/hw_random/via-rng.c:173:3: error: call to undeclared function
 'wrmsr'; ISO C99 and later do not support implicit function declarations
Message-ID: <202501111925.pqdCrmml-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   9707e868fba6a5cad792a4f4deb3a8db7e194e5c
commit: 9707e868fba6a5cad792a4f4deb3a8db7e194e5c [10/10] x86/msr: Remove MSR write APIs that take MSR value in two u32 arguments
config: x86_64-buildonly-randconfig-004-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111925.pqdCrmml-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111925.pqdCrmml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111925.pqdCrmml-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/hw_random/via-rng.c:173:3: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |                 wrmsr(MSR_VIA_RNG, lo, hi);
         |                 ^
   drivers/char/hw_random/via-rng.c:173:3: note: did you mean 'wrmsrl'?
   arch/x86/include/asm/msr.h:251:20: note: 'wrmsrl' declared here
     251 | static inline void wrmsrl(u32 msr, u64 val)
         |                    ^
   1 error generated.
--
>> arch/x86/kernel/cpu/mce/amd.c:326:3: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     326 |                 wrmsr(smca_config, low, high);
         |                 ^
   arch/x86/kernel/cpu/mce/amd.c:326:3: note: did you mean 'wrmsrl'?
   arch/x86/include/asm/msr.h:251:20: note: 'wrmsrl' declared here
     251 | static inline void wrmsrl(u32 msr, u64 val)
         |                    ^
   arch/x86/kernel/cpu/mce/amd.c:470:2: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     470 |         wrmsr(tr->b->address, lo, hi);
         |         ^
   arch/x86/kernel/cpu/mce/amd.c:526:2: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     526 |         wrmsr(MSR_CU_DEF_ERR, low, high);
         |         ^
   3 errors generated.
--
>> arch/x86/kernel/cpu/mce/core.c:1868:3: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1868 |                 wrmsr(MSR_IA32_MCG_CTL, 0xffffffff, 0xffffffff);
         |                 ^
   arch/x86/kernel/cpu/mce/core.c:1868:3: note: did you mean 'wrmsrl'?
   arch/x86/include/asm/msr.h:251:20: note: 'wrmsrl' declared here
     251 | static inline void wrmsrl(u32 msr, u64 val)
         |                    ^
   1 error generated.


vim +/wrmsr +173 drivers/char/hw_random/via-rng.c

13523363577d49 Michael Buesch  2006-06-26  128  
13523363577d49 Michael Buesch  2006-06-26  129  static int via_rng_init(struct hwrng *rng)
13523363577d49 Michael Buesch  2006-06-26  130  {
11025e85523514 Dave Jones      2008-02-06  131  	struct cpuinfo_x86 *c = &cpu_data(0);
13523363577d49 Michael Buesch  2006-06-26  132  	u32 lo, hi, old_lo;
13523363577d49 Michael Buesch  2006-06-26  133  
858576bdc5d65e Harald Welte    2009-05-15  134  	/* VIA Nano CPUs don't have the MSR_VIA_RNG anymore.  The RNG
858576bdc5d65e Harald Welte    2009-05-15  135  	 * is always enabled if CPUID rng_en is set.  There is no
858576bdc5d65e Harald Welte    2009-05-15  136  	 * RNG configuration like it used to be the case in this
858576bdc5d65e Harald Welte    2009-05-15  137  	 * register */
49d1179573c028 davidwang       2018-04-13  138  	if (((c->x86 == 6) && (c->x86_model >= 0x0f))  || (c->x86 > 6)){
362f924b64ba0f Borislav Petkov 2015-12-07  139  		if (!boot_cpu_has(X86_FEATURE_XSTORE_EN)) {
7a1ae9c0ce39d8 Sudip Mukherjee 2014-09-15  140  			pr_err(PFX "can't enable hardware RNG "
858576bdc5d65e Harald Welte    2009-05-15  141  				"if XSTORE is not enabled\n");
858576bdc5d65e Harald Welte    2009-05-15  142  			return -ENODEV;
858576bdc5d65e Harald Welte    2009-05-15  143  		}
858576bdc5d65e Harald Welte    2009-05-15  144  		return 0;
858576bdc5d65e Harald Welte    2009-05-15  145  	}
858576bdc5d65e Harald Welte    2009-05-15  146  
13523363577d49 Michael Buesch  2006-06-26  147  	/* Control the RNG via MSR.  Tread lightly and pay very close
85796a9b7583a0 Jason Wang      2022-07-15  148  	 * attention to values written, as the reserved fields
13523363577d49 Michael Buesch  2006-06-26  149  	 * are documented to be "undefined and unpredictable"; but it
13523363577d49 Michael Buesch  2006-06-26  150  	 * does not say to write them as zero, so I make a guess that
13523363577d49 Michael Buesch  2006-06-26  151  	 * we restore the values we find in the register.
13523363577d49 Michael Buesch  2006-06-26  152  	 */
13523363577d49 Michael Buesch  2006-06-26  153  	rdmsr(MSR_VIA_RNG, lo, hi);
13523363577d49 Michael Buesch  2006-06-26  154  
13523363577d49 Michael Buesch  2006-06-26  155  	old_lo = lo;
13523363577d49 Michael Buesch  2006-06-26  156  	lo &= ~(0x7f << VIA_STRFILT_CNT_SHIFT);
13523363577d49 Michael Buesch  2006-06-26  157  	lo &= ~VIA_XSTORE_CNT_MASK;
13523363577d49 Michael Buesch  2006-06-26  158  	lo &= ~(VIA_STRFILT_ENABLE | VIA_STRFILT_FAIL | VIA_RAWBITS_ENABLE);
13523363577d49 Michael Buesch  2006-06-26  159  	lo |= VIA_RNG_ENABLE;
11025e85523514 Dave Jones      2008-02-06  160  	lo |= VIA_NOISESRC1;
11025e85523514 Dave Jones      2008-02-06  161  
11025e85523514 Dave Jones      2008-02-06  162  	/* Enable secondary noise source on CPUs where it is present. */
11025e85523514 Dave Jones      2008-02-06  163  
11025e85523514 Dave Jones      2008-02-06  164  	/* Nehemiah stepping 8 and higher */
b399151cb48db3 Jia Zhang       2018-01-01  165  	if ((c->x86_model == 9) && (c->x86_stepping > 7))
11025e85523514 Dave Jones      2008-02-06  166  		lo |= VIA_NOISESRC2;
11025e85523514 Dave Jones      2008-02-06  167  
11025e85523514 Dave Jones      2008-02-06  168  	/* Esther */
11025e85523514 Dave Jones      2008-02-06  169  	if (c->x86_model >= 10)
11025e85523514 Dave Jones      2008-02-06  170  		lo |= VIA_NOISESRC2;
13523363577d49 Michael Buesch  2006-06-26  171  
13523363577d49 Michael Buesch  2006-06-26  172  	if (lo != old_lo)
13523363577d49 Michael Buesch  2006-06-26 @173  		wrmsr(MSR_VIA_RNG, lo, hi);
13523363577d49 Michael Buesch  2006-06-26  174  
13523363577d49 Michael Buesch  2006-06-26  175  	/* perhaps-unnecessary sanity check; remove after testing if
13523363577d49 Michael Buesch  2006-06-26  176  	   unneeded */
13523363577d49 Michael Buesch  2006-06-26  177  	rdmsr(MSR_VIA_RNG, lo, hi);
13523363577d49 Michael Buesch  2006-06-26  178  	if ((lo & VIA_RNG_ENABLE) == 0) {
7a1ae9c0ce39d8 Sudip Mukherjee 2014-09-15  179  		pr_err(PFX "cannot enable VIA C3 RNG, aborting\n");
13523363577d49 Michael Buesch  2006-06-26  180  		return -ENODEV;
13523363577d49 Michael Buesch  2006-06-26  181  	}
13523363577d49 Michael Buesch  2006-06-26  182  
13523363577d49 Michael Buesch  2006-06-26  183  	return 0;
13523363577d49 Michael Buesch  2006-06-26  184  }
13523363577d49 Michael Buesch  2006-06-26  185  

:::::: The code at line 173 was first introduced by commit
:::::: 13523363577d49b9af3cad06fcb757126bedc61b [PATCH] Add VIA HW RNG driver

:::::: TO: Michael Buesch <mb@bu3sch.de>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
