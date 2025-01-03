Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A597418AE2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 05:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735881193; cv=none; b=htKT3yofFCsff1PhFvRmUZtl5d18H8I9EGPFbNl5TUwkv04TjThbgGWT+KZNsj9d9KGIdKFFETq3zjJpcr4XUJRn/ge9I94pw0Ya9KCYsAa/DZyeZYWQ6jzLvKo5x0TatAimIO7UJ5kk3zlrrNlCDTETTJQGeI3HGOofw0DRug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735881193; c=relaxed/simple;
	bh=PX+alqlk3yL6hpYtrQ74f39fzz5mSQwgDy685QukwTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JkpqR37Upp6LoRAeJttaO00tQuCmaEnwh38lhkVh05J+q864od5ERvVO6TQOr51orBVRjK/fqX5fKvhLwp8O9puQHgMDndzILPpnGyYz2YUBUzqGN57sfLkGtrGAX5/qJ7dUx/HvCt+fE5L7usOSdP3UyCZXy+GKPONAHp9A+go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKKZPJOG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKKZPJOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735881192; x=1767417192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PX+alqlk3yL6hpYtrQ74f39fzz5mSQwgDy685QukwTI=;
  b=fKKZPJOGyhDgZwBFcrVz2B1TFGEGrw9vJtpbuj2iFe0dHkgwtrBFFrbt
   7NZNScPTrBRqcnntpR1qU8gXEhauvTeg91IEn1IJxMtYCuKbAXVjbpq9Q
   5rvbi1ZVe7qmr+2cU9j/iY2MxxgS9HLxdLU+U/AOOZT1frl3+1cq5QG5Z
   12j4vpfarmV8Y6RABHeoY9vcFLG+8YBkoUNv/WXYje7CFmEDWFzZbVq6W
   0ApS8GpcY9VZxLme2Vq0PetNI83Q+VhFNTM9dbKtm8sxIG0un4ITLfxP6
   yU80oALu76Fn4/0DNRkwJfif7KAQt8jfMfC1Lz405liShcfYbZNwXmRkP
   A==;
X-CSE-ConnectionGUID: qOAqDSrTSgu1ADTdwZf2Lg==
X-CSE-MsgGUID: RAC0qFGPTUKqNoiinuYM9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="58594834"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="58594834"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 21:13:11 -0800
X-CSE-ConnectionGUID: DThBLCWMRJSeSlbGEssWeg==
X-CSE-MsgGUID: rJ/Bf/CTRiKwzWC4OtpIfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101498038"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jan 2025 21:13:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTZzf-0009FO-1k;
	Fri, 03 Jan 2025 05:13:07 +0000
Date: Fri, 3 Jan 2025 13:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 6/14]
 arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from
 constant value (8000000000000000 becomes 0)
Message-ID: <202501031322.ZbtR75Vj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   eaa81ab93145df5a8414e5d1c00c9228a947cced
commit: 6ebb91ca8c107df651ecd668673761c860351f42 [6/14] x86/msr: Replace __wrmsr() with native_wrmsrl()
config: i386-randconfig-062-20241229 (https://download.01.org/0day-ci/archive/20250103/202501031322.ZbtR75Vj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031322.ZbtR75Vj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031322.ZbtR75Vj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/hyperv/hv_init.c:73:20: sparse: sparse: cast removes address space '__iomem' of expression
   arch/x86/hyperv/hv_init.c:241:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/x86/hyperv/hv_init.c:241:33: sparse:     expected void volatile [noderef] __iomem *addr
   arch/x86/hyperv/hv_init.c:241:33: sparse:     got void *
   arch/x86/hyperv/hv_init.c: note: in included file (through arch/x86/include/asm/tsc.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
--
   arch/x86/events/intel/uncore_snb.c: note: in included file (through arch/x86/include/asm/tsc.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from constant value (1000000ff becomes ff)
--
   arch/x86/events/intel/uncore_nhmex.c: note: in included file (through arch/x86/include/asm/tsc.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
>> arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)

vim +149 arch/x86/include/asm/msr.h

   142	
   143	/* Can be uninlined because referenced by paravirt */
   144	static inline void notrace
   145	native_write_msr(unsigned int msr, u32 low, u32 high)
   146	{
   147		u64 val = (u64)high << 32 | low;
   148	
 > 149		native_wrmsrl(msr, val);
   150	
   151		if (tracepoint_enabled(write_msr))
   152			do_trace_write_msr(msr, val, 0);
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
