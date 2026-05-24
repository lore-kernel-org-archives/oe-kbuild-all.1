Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF39D1E1E16
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 03:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779594866; cv=none; b=PFknpl/aeSNaqT8bm4HHqhrEIwHk9Qx8jZa/JVfxpU79diU/2UtGCU5qRvvXXsZ6aokhavyOXsC+BCw2n/VdblNWfxQySREEQThVQwxJRzb63u2M0iUxjpnNZB5JP+qW37ZMa+v3nmuaU3aJ7mY9a7iRVOX/R6xh3pv7CLcN4dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779594866; c=relaxed/simple;
	bh=iMvtGj1qF2mJT0R4gsVLajOjl38NKF+qUy2uqUn/05Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FQ3J8WMrd5Dn2yyL9ipVadi2d0pyMlQm08iSXGzLn+de+lrQ60HuwFoIWcG7p46FrU+vQmMDx6WE+Rrm/9+iVwtCooEzuAkiy1uqZJ5EU+WLUULVNccngktaVcCuCPfLw5xdw1u+zVWgDXrEif2uzDp0KzC6RxWcIMSY0DOWv7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEUz8iQj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEUz8iQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779594864; x=1811130864;
  h=date:from:to:cc:subject:message-id;
  bh=iMvtGj1qF2mJT0R4gsVLajOjl38NKF+qUy2uqUn/05Y=;
  b=IEUz8iQjduwiVyE770zS+Jypx3lVK+D1x1m+Ek3EiSVOcTeU9REk2ZfJ
   U3T0lZ1UqsZjHEO/EopsgEPW92fhLlQtLBKgxMYD7mhNH+AFLfRuh/Tue
   2sVDDuUx/7wgWXdCVg1JwtfKsY6vmwqQQ2IEA0fRpSig+EuhwTiAAPCyC
   gaLDlazbmmxdjgqkLOe5N62acFn9bqhrsoeB0dWZGmjhdYn2U2Wfo85/U
   kdkTsNjh5ufTcb3cnw/t1dReip9netXriCqmKH/Tz+RS1DnGmht0Z5pUK
   YFaG8Lg9nLs8HP/mHBaBeTrbYe5gRTehOkSFCrIqWTQjo4JRvzhSBV3XL
   w==;
X-CSE-ConnectionGUID: Rh3FQO1/S2KXj7HCrJR22A==
X-CSE-MsgGUID: 7jSKYE0bSDa4yaP8m9t7JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91852530"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="91852530"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 20:54:23 -0700
X-CSE-ConnectionGUID: mpLFjPZjSRSIr1Py2EhbEQ==
X-CSE-MsgGUID: m+ARspihSUSGZFXUrUN+PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="245554537"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2026 20:54:22 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQzut-000000000fp-2DDT;
	Sun, 24 May 2026 03:54:19 +0000
Date: Sun, 24 May 2026 11:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvmclock_vs_tsc 11/46]
 arch/x86/kernel/tsc.c:952:22: warning: 'native_calibrate_cpu' defined but not
 used
Message-ID: <202605241104.Gsn7GnCI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/kvmclock_vs_tsc
head:   d7f9a699369cc661461109c6a51d02797303e6f1
commit: 335b45c43c2514dedc6d5b45a6bbbcc3bca11f75 [11/46] x86/tsc: Kill off x86_platform_ops.calibrate_{cpu,tsc}() hooks
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260524/202605241104.Gsn7GnCI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241104.Gsn7GnCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605241104.Gsn7GnCI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/tsc.c:952:22: warning: 'native_calibrate_cpu' defined but not used [-Wunused-function]
     952 | static unsigned long native_calibrate_cpu(void)
         |                      ^~~~~~~~~~~~~~~~~~~~


vim +/native_calibrate_cpu +952 arch/x86/kernel/tsc.c

03821f451d2d2d Pavel Tatashin 2018-07-19  947  
03821f451d2d2d Pavel Tatashin 2018-07-19  948  
03821f451d2d2d Pavel Tatashin 2018-07-19  949  /**
03821f451d2d2d Pavel Tatashin 2018-07-19  950   * native_calibrate_cpu - calibrate the cpu
03821f451d2d2d Pavel Tatashin 2018-07-19  951   */
8dbe438589f373 Pavel Tatashin 2018-07-19 @952  static unsigned long native_calibrate_cpu(void)
03821f451d2d2d Pavel Tatashin 2018-07-19  953  {
03821f451d2d2d Pavel Tatashin 2018-07-19  954  	unsigned long tsc_freq = native_calibrate_cpu_early();
03821f451d2d2d Pavel Tatashin 2018-07-19  955  
03821f451d2d2d Pavel Tatashin 2018-07-19  956  	if (!tsc_freq)
03821f451d2d2d Pavel Tatashin 2018-07-19  957  		tsc_freq = pit_hpet_ptimer_calibrate_cpu();
03821f451d2d2d Pavel Tatashin 2018-07-19  958  
03821f451d2d2d Pavel Tatashin 2018-07-19  959  	return tsc_freq;
03821f451d2d2d Pavel Tatashin 2018-07-19  960  }
03821f451d2d2d Pavel Tatashin 2018-07-19  961  

:::::: The code at line 952 was first introduced by commit
:::::: 8dbe438589f373544a1af8b4a859e4da853c0f90 x86/tsc: Make use of tsc_calibrate_cpu_early()

:::::: TO: Pavel Tatashin <pasha.tatashin@oracle.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
