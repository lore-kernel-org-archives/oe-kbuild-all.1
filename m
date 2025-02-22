Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6F616F0FE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740222195; cv=none; b=T5JGqlvEoylVRJB0UAFXG9QCK0AJpRTqzUhbT0CSZqlXX3VXpIMGLbjtgtMmGOGYLGx7FTZDkLVrdHcyHCmtdM6bHomo4EpT/uDRJiKJVbn4kViBAawCj47iCaj6zISbPULDXvWZgIMmHCKnjvY2UT/kyN9HUqFavrtaryPuAsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740222195; c=relaxed/simple;
	bh=CTDty85Go+LgZulWAiNrUcRGEFi8Bq1Y6C5I5NEm88s=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QYluGCYhftXcJwIMbKOdicv7AJ7owCvLsY8HtrYaDos81nQLpSxsjrmyV1eTjqxR/i2SdrxdHvJHswNJ406CIys9vbjd3Xbt6wQD+IuKpGT2J0zY0vyrtjfw3xwVSiIgWlmIH+2ZfqmCmcWNdQ7XJVcZv3DMvtDg8O3qekg69/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PrmKJ5do; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PrmKJ5do"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740222194; x=1771758194;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CTDty85Go+LgZulWAiNrUcRGEFi8Bq1Y6C5I5NEm88s=;
  b=PrmKJ5doRoNn5V3yhvtL5mEQAw8Y1i5qJrDUYxxGL+USbci3nYc/KZdz
   Xp3pgpian9nZKxffeES2a0on5792wGK/Rfnw/+3+9+5a+Q1VEBjtKJOoC
   jfFS3xle135rX0hP1dAQsUDl0vNrnxqVv0TcjalzawKw1yw5YvfXrqY1N
   hkNJJorhFSHeecs/CUDRrokJVrADnqy3MTce/1DgvfRacSVneNgMC1Vwx
   n0h+STsaY/o35GcCO99L7Ef3vJvD8XccNTu6KTc/tmX8iyLZi1FBZYtxt
   gFCafabMZOkw4EmppTvhMAY7glUtYS13/fI440IW+26wGH0ke+0ny0pH3
   Q==;
X-CSE-ConnectionGUID: cHyzLz46S9SoBqG7l2FfpQ==
X-CSE-MsgGUID: 7wB/Cnf1TU2lv0x+viPlRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41158865"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="41158865"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 03:03:14 -0800
X-CSE-ConnectionGUID: A57PFKYpR9S6GPovQVLHeg==
X-CSE-MsgGUID: w01tJx/VQ4SDT3do1rOn1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="120520058"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Feb 2025 03:03:13 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlnHq-0006V9-0s
	for oe-kbuild-all@lists.linux.dev;
	Sat, 22 Feb 2025 11:03:10 +0000
Date: Sat, 22 Feb 2025 19:02:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/dovetail-xenomai 5/5]
 arch/arm/vfp/vfpmodule.c:259:21: error: implicit declaration of function
 'mark_cond_trap_entry'
Message-ID: <202502221825.8zhLr8xb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/dovetail-xenomai
head:   96c9aceb59d0ff2f4ac73415eeee24969ba6fa8f
commit: 321bdf89d2b75198908d7ee8c1895f22cdcc4665 [5/5] ARM: dovetail: route traps
config: arm-randconfig-004-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221825.8zhLr8xb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221825.8zhLr8xb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221825.8zhLr8xb-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/vfp/vfpmodule.c: In function 'vfp_raise_exceptions':
>> arch/arm/vfp/vfpmodule.c:259:21: error: implicit declaration of function 'mark_cond_trap_entry' [-Wimplicit-function-declaration]
     259 |                 if (mark_cond_trap_entry(ARM_TRAP_VFP, regs)) {
         |                     ^~~~~~~~~~~~~~~~~~~~
>> arch/arm/vfp/vfpmodule.c:259:42: error: 'ARM_TRAP_VFP' undeclared (first use in this function)
     259 |                 if (mark_cond_trap_entry(ARM_TRAP_VFP, regs)) {
         |                                          ^~~~~~~~~~~~
   arch/arm/vfp/vfpmodule.c:259:42: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm/vfp/vfpmodule.c:261:25: error: implicit declaration of function 'mark_trap_exit'; did you mean 'early_trap_init'? [-Wimplicit-function-declaration]
     261 |                         mark_trap_exit(ARM_TRAP_VFP, regs);
         |                         ^~~~~~~~~~~~~~
         |                         early_trap_init


vim +/mark_cond_trap_entry +259 arch/arm/vfp/vfpmodule.c

   247	
   248	/*
   249	 * Process bitmask of exception conditions.
   250	 */
   251	static void vfp_raise_exceptions(u32 exceptions, u32 inst, u32 fpscr, struct pt_regs *regs)
   252	{
   253		int si_code = 0;
   254	
   255		pr_debug("VFP: raising exceptions %08x\n", exceptions);
   256	
   257		if (exceptions == VFP_EXCEPTION_ERROR) {
   258			vfp_panic("unhandled bounce", inst);
 > 259			if (mark_cond_trap_entry(ARM_TRAP_VFP, regs)) {
   260				vfp_raise_sigfpe(FPE_FLTINV, regs);
 > 261				mark_trap_exit(ARM_TRAP_VFP, regs);
   262			}
   263			return;
   264		}
   265	
   266		/*
   267		 * If any of the status flags are set, update the FPSCR.
   268		 * Comparison instructions always return at least one of
   269		 * these flags set.
   270		 */
   271		if (exceptions & (FPSCR_N|FPSCR_Z|FPSCR_C|FPSCR_V))
   272			fpscr &= ~(FPSCR_N|FPSCR_Z|FPSCR_C|FPSCR_V);
   273	
   274		fpscr |= exceptions;
   275	
   276		fmxr(FPSCR, fpscr);
   277	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
