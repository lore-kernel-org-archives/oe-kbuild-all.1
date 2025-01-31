Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F57EAC6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 14:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738334120; cv=none; b=ROQxRzfuwywBsQMu65Gnzkby8Mkkj/cJ0v8HtYg7XekZ/SuDxRn9mt+g6HRSZqyXc0C5qPRwdZbferV8aXlJLhwXW4u+GP42OeMwqZhl+Bm0qYqHroU6HgVrZ+q0ZeSjnFBvRq15hi3sv4+q33TylwDLgvqNhfvzrM97Y4i/l2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738334120; c=relaxed/simple;
	bh=+2TRKAH3XazZV/ha0be/c+LlLRx8TwvV6gg1oanLd+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BF80DPzb0WTU0rafBiCs2dpPwdPWZBA0nf0GdhG4iLOhesqeuA7MiTWPYSU+PhO6sCxzd8i/oXu/9mBr6/s/BpOPn9SdeYkbUnNjHgnGPFjHKzXxxcXhzf0k1sZNQe4PVHDM/sXYNV5SHoaxrjFtvcNPOvZUROA70XytGgqN9Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nshNtYri; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nshNtYri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738334118; x=1769870118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+2TRKAH3XazZV/ha0be/c+LlLRx8TwvV6gg1oanLd+c=;
  b=nshNtYri4TQOwxe1b6qatLFIUgfphiRBiCB+6M+5L4uYTqVcjsk8Bg/+
   jUXdowRUp8sS8LFQYTfjrxLmTM+sA8xOCwdUWKxKQxRgc3j6SIwyQ1Ejf
   Wdy3ILqUbAr95kzHx/KlcBlpC9004avF0VzZYfqmtliMHcpubxUmVQBml
   cq9yiKSpRUk4TU9C4QINJdV5++HLPqoup06Koo8OFgQwtk2HQxdz+Cgmf
   HxuG3HfmqqYMDDj8q5lB4R4V5AjjWXbHNzUjNX1fiAyDVg9xcd2AFNSp3
   2A5UPM2eWsuY34CIz1m+J59PklTtB86Y31Ok+cnJH4qpJREvJPxiSWP1n
   w==;
X-CSE-ConnectionGUID: lUU3keKtSiGZKhiF9+AjZg==
X-CSE-MsgGUID: EqX2fu+iTwS1ruzIXZxIdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39041726"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="39041726"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 06:35:18 -0800
X-CSE-ConnectionGUID: xU95q3CqQJCjwOuD6ki9Rg==
X-CSE-MsgGUID: rjNqUnW+SY2Cew+rhc7d0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="114638118"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Jan 2025 06:35:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tds70-000mT0-3A;
	Fri, 31 Jan 2025 14:35:14 +0000
Date: Fri, 31 Jan 2025 22:35:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvmclock_vs_tsc 6/16] arch/x86/kernel/tsc.c:1525:17:
 error: implicit declaration of function 'tdx_tsc_init'; did you mean
 'tsc_init'?
Message-ID: <202501312225.Q4wGdgmj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/kvmclock_vs_tsc
head:   39ec46a246988da8e58ee3caccb2b5ff6d07666a
commit: e02c3f9b45df22178674c33ee15e37bfa9bf3e3c [6/16] x86/tdx: Override PV calibration routines with CPUID-based calibration
config: x86_64-buildonly-randconfig-004-20250131 (https://download.01.org/0day-ci/archive/20250131/202501312225.Q4wGdgmj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501312225.Q4wGdgmj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501312225.Q4wGdgmj-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/tsc.c: In function 'tsc_early_init':
>> arch/x86/kernel/tsc.c:1525:17: error: implicit declaration of function 'tdx_tsc_init'; did you mean 'tsc_init'? [-Werror=implicit-function-declaration]
    1525 |                 tdx_tsc_init();
         |                 ^~~~~~~~~~~~
         |                 tsc_init
   cc1: some warnings being treated as errors


vim +1525 arch/x86/kernel/tsc.c

  1508	
  1509	void __init tsc_early_init(void)
  1510	{
  1511		if (!boot_cpu_has(X86_FEATURE_TSC))
  1512			return;
  1513		/* Don't change UV TSC multi-chassis synchronization */
  1514		if (is_early_uv_system())
  1515			return;
  1516	
  1517		/*
  1518		 * Do CoCo specific "secure" TSC initialization *after* hypervisor
  1519		 * platform initialization so that the secure variant can override the
  1520		 * hypervisor's PV calibration routine with a more trusted method.
  1521		 */
  1522		if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
  1523			snp_secure_tsc_init();
  1524		else if (boot_cpu_has(X86_FEATURE_TDX_GUEST))
> 1525			tdx_tsc_init();
  1526	
  1527		if (!determine_cpu_tsc_frequencies(true))
  1528			return;
  1529		tsc_enable_sched_clock();
  1530	}
  1531	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
