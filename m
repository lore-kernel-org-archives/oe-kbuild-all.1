Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BD244C7C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735384125; cv=none; b=SoWOS6UCgDaXRrLDc2DprzdYxQaI6LXL1n9FtIrW9vok9cwk9CtFhs/EA02hUWgLFdi32r5kpsKqHUpjUARznHKRH6kG6G9tkNlw5JzUTWedb9ix3iMBansQa5/4yyk6i1HDBbiuMHTJjA50cb3xhrxt+nFeUCFbtn6ECLZs+pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735384125; c=relaxed/simple;
	bh=5i97neSLq7fv5IxdMty3xM/735OmAR8LvE31YzRwfZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rcJ/PPqPaPJ4StTr4jKV1w0Dlypr9oZrzb1tvuZvmOclHz+NQFmnSjtgurSM247oTvN4asHq3nOdYJ7ppg+AvWVBiKhg/y7ELGhGFHa6gqvtiALBFYpYxSkp+niSA1rZG1S1RS7ZME+XerhuWcwjIjnlnihmYzMpQ7B/KdxJNlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVUeWjH2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVUeWjH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735384124; x=1766920124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5i97neSLq7fv5IxdMty3xM/735OmAR8LvE31YzRwfZQ=;
  b=QVUeWjH21aCRJVQyEzuCS2pzM93PjTvJefSYdrYc+jNhO42RFbjHJ7Dq
   vs+envWW3bLD07uTMBCooJb0nRKV+ihodqX/Vjrgbc195wLc+ENyBAGSQ
   rPM2Mgl8zK+YCrlY0bv2P3Lbm6qm2GhAvu4WvcViToXXgrDStsvKsIOOI
   ZT3sg2i+8Ku96rV+Wmm908/g2Fn+Iovv13yfoldSDsbNiyQ8lhCR6BpWA
   OJFuwXyOhst8pRsTcDoxCxCvSswgrGFDYwAWQYt/xD8SHbFw60kgOnY08
   gonU3rJvssBMbXRqw/SaUaZSXOEHfvDWCTcpYGOYfF6E6goL81t0HcQ7g
   g==;
X-CSE-ConnectionGUID: muaH5rNjRM2LoET7O/1SZA==
X-CSE-MsgGUID: ORVZsW+TRZGGqggNPXqy/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="46248653"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="46248653"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 03:08:43 -0800
X-CSE-ConnectionGUID: 3mBwNqYCQ1G8K+g7xueGKg==
X-CSE-MsgGUID: yEybwQ+ORkCKQjx3bKkAfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="100528409"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Dec 2024 03:08:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRUgS-00041v-0A;
	Sat, 28 Dec 2024 11:08:40 +0000
Date: Sat, 28 Dec 2024 19:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 12/13]
 drivers/cpufreq/powernow-k6.c:91:2: error: call to undeclared function
 'wrmsr'; ISO C99 and later do not support implicit function declarations
Message-ID: <202412281916.sRdNdmH3-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281916.sRdNdmH3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281916.sRdNdmH3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281916.sRdNdmH3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpufreq/powernow-k6.c:91:2: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      91 |         wrmsr(MSR_K6_EPMR, msrval, 0); /* enable the PowerNow port */
         |         ^
   drivers/cpufreq/powernow-k6.c:91:2: note: did you mean 'wrmsrl'?
   arch/x86/include/asm/msr.h:251:20: note: 'wrmsrl' declared here
     251 | static inline void wrmsrl(u32 msr, u64 val)
         |                    ^
   drivers/cpufreq/powernow-k6.c:121:2: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     121 |         wrmsr(MSR_K6_EPMR, msrval, 0); /* enable the PowerNow port */
         |         ^
   2 errors generated.
--
>> drivers/cpufreq/e_powersaver.c:126:2: error: call to undeclared function 'wrmsr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |         wrmsr(MSR_IA32_PERF_CTL, dest_state & 0xffff, 0);
         |         ^
   drivers/cpufreq/e_powersaver.c:126:2: note: did you mean 'wrmsrl'?
   arch/x86/include/asm/msr.h:251:20: note: 'wrmsrl' declared here
     251 | static inline void wrmsrl(u32 msr, u64 val)
         |                    ^
   1 error generated.


vim +/wrmsr +91 drivers/cpufreq/powernow-k6.c

^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   76  
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   77  /**
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   78   * powernow_k6_get_cpu_multiplier - returns the current FSB multiplier
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   79   *
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   80   * Returns the current setting of the frequency multiplier. Core clock
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   81   * speed is frequency of the Front-Side Bus multiplied with this value.
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   82   */
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   83  static int powernow_k6_get_cpu_multiplier(void)
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   84  {
e20e1d0ac02308 drivers/cpufreq/powernow-k6.c              Mikulas Patocka 2013-12-11   85  	unsigned long invalue = 0;
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   86  	u32 msrval;
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   87  
e20e1d0ac02308 drivers/cpufreq/powernow-k6.c              Mikulas Patocka 2013-12-11   88  	local_irq_disable();
e20e1d0ac02308 drivers/cpufreq/powernow-k6.c              Mikulas Patocka 2013-12-11   89  
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   90  	msrval = POWERNOW_IOPORT + 0x1;
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16  @91  	wrmsr(MSR_K6_EPMR, msrval, 0); /* enable the PowerNow port */
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   92  	invalue = inl(POWERNOW_IOPORT + 0x8);
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   93  	msrval = POWERNOW_IOPORT + 0x0;
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   94  	wrmsr(MSR_K6_EPMR, msrval, 0); /* disable it again */
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   95  
e20e1d0ac02308 drivers/cpufreq/powernow-k6.c              Mikulas Patocka 2013-12-11   96  	local_irq_enable();
e20e1d0ac02308 drivers/cpufreq/powernow-k6.c              Mikulas Patocka 2013-12-11   97  
22c73795b10159 drivers/cpufreq/powernow-k6.c              Mikulas Patocka 2013-12-11   98  	return clock_ratio[register_to_index[(invalue >> 5)&7]].driver_data;
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16   99  }
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/powernow-k6.c Linus Torvalds  2005-04-16  100  

:::::: The code at line 91 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
