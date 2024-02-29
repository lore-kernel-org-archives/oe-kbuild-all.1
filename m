Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DB142A8C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 23:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709250694; cv=none; b=YnVZfDYMhlLEylkvNcac+6u+QnHWIdnr0IXPOBqjzbf+Bjcv5o+g1lmy2C6xKZKl79VQOIwpcWR5sz7pUlp3RESfTYBU40o2jKVaj855CBul3vT+1ZtKLH8nWKz5EAAeTD4I8yVuXdyH/wbGHdvtgkkKqR/KnEEqbSdCeyD3fxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709250694; c=relaxed/simple;
	bh=3afL44A9OfRgjGCXkEVjm949oRnDi6c9ScBM9BityGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IMLEP3I4qrfsyRIktl2gn4aS2PLi9uOfrixakBZYwtYVKE7EXwaHqSdKfBZ95f/bONZO2jd0w2gonAP/s+WJ2z4knb6y29hDs+xEeV4ZBHZo+E0cKUq0GJMtu05HrlS9EzNyAOZZm00f31b3BtNcCyhdA07vtLxUzd+A+Z1sjt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eQmLqrHZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eQmLqrHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709250692; x=1740786692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3afL44A9OfRgjGCXkEVjm949oRnDi6c9ScBM9BityGs=;
  b=eQmLqrHZrBtjmuOeMxQSiR4vvFvIruU7WbwIlVL1yNx/CWnIj0tkyKT+
   3K+hUPFuiHHPolFijfbDCjosXsc6p8BiVo9EmNSXp6f5GJ3eMC1PHfL2L
   N+qGNWb+/1dfnmNdYkm3dh2IK6u93mCvnzCOWyCdnHGJKqb0c50nP/uvy
   q4axt5eQbg+RZIWkdTCOLObl2nbYQzfLz2Xk5NZFJz4IIjSr9epieBi8r
   Dd4edPfNNFDkX2C+/WMUsDopUnPtGnmrXiX9Q1YKM6tMWs4NiSrek13q0
   sWP8AM0y214Wzyfrkgfot/jlQjJwbBxEuZIXZv6ioGGQOj3KdBOphhfuj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14405089"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14405089"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 15:51:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7922407"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Feb 2024 15:51:27 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfqBH-000DMh-0p;
	Thu, 29 Feb 2024 23:51:16 +0000
Date: Fri, 1 Mar 2024 07:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/core 2/6] arch/x86/kernel/process.c:962: undefined
 reference to `arch_needs_tick_broadcast'
Message-ID: <202403010750.FsLGD1sH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/core
head:   d42b836ad1ab53c53f6b7016a79fad44d96854aa
commit: e6ca848f8fee8742f078dc7f458475e45ec4549c [2/6] x86/idle: Sanitize X86_BUG_AMD_E400 handling
config: i386-randconfig-014-20240301 (https://download.01.org/0day-ci/archive/20240301/202403010750.FsLGD1sH-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010750.FsLGD1sH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010750.FsLGD1sH-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/process.o: in function `arch_post_acpi_subsys_init':
>> arch/x86/kernel/process.c:962: undefined reference to `arch_needs_tick_broadcast'


vim +962 arch/x86/kernel/process.c

   940	
   941	void __init arch_post_acpi_subsys_init(void)
   942	{
   943		u32 lo, hi;
   944	
   945		if (!boot_cpu_has_bug(X86_BUG_AMD_E400))
   946			return;
   947	
   948		/*
   949		 * AMD E400 detection needs to happen after ACPI has been enabled. If
   950		 * the machine is affected K8_INTP_C1E_ACTIVE_MASK bits are set in
   951		 * MSR_K8_INT_PENDING_MSG.
   952		 */
   953		rdmsr(MSR_K8_INT_PENDING_MSG, lo, hi);
   954		if (!(lo & K8_INTP_C1E_ACTIVE_MASK))
   955			return;
   956	
   957		boot_cpu_set_bug(X86_BUG_AMD_APIC_C1E);
   958	
   959		if (!boot_cpu_has(X86_FEATURE_NONSTOP_TSC))
   960			mark_tsc_unstable("TSC halt in AMD C1E");
   961	
 > 962		static_branch_enable(&arch_needs_tick_broadcast);
   963		pr_info("System has AMD C1E erratum E400. Workaround enabled.\n");
   964	}
   965	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
