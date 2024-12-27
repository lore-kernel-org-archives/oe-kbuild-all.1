Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3892042A93
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 21:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735333428; cv=none; b=mxHYGvU5g5waoNW4/Wuuo9/FqyZAOW0X7pvzUenLlNvO5Y7DldmZcQah5o2pueiwZtl5prmeDzkkHUo8grEhl4wtH4JqKtx1voR5PbiMOqQvh7cvLMONAa0easR99tTtHLLscFp+DdhMr2u+E4TmP0bdr7H8QonZXWbFq0mJEBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735333428; c=relaxed/simple;
	bh=1e4N/XiaZHdZMBhKB8HXIcfkTUFYMbvwLIk6KkH2vD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ctu7CCGMH/pW4fRv+F260lHCDCFyO3da2AhUtr/uiFF+k5mEPDuDMpmETPi+2Lw8mSHRXMvYKBg5mNWi21WiLIph0tXrjHh2FToXt7gx+EFojmYRHcfe9nXdtb4k1Dlts/NQ+0A13pkGGcEv29zVss8NYWfmcUKmMie1vYQpKMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DeXx7n4B; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DeXx7n4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735333426; x=1766869426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1e4N/XiaZHdZMBhKB8HXIcfkTUFYMbvwLIk6KkH2vD0=;
  b=DeXx7n4BUEFOwBLGplD5o5/6PJXEuneafHQazRHYZkvFAwD6dVu+C2te
   an6vS/K8RkpFavZqxdLXRvPd6Sg3ImEnyrmR5J48/zXcS/IKr77joFphG
   jFDfUGibqwfqgbfljiU64bHgHsmYzsal302/afoQ4/wAWuFGiYlP5La4p
   AzuLQwr622TjCM7qh5J5gktbWlZrDPJWL1eNKG1WmuYWPg1ha+iM6zMT5
   6/wvoZeCHPnSWmzM4mftkm8MUfBRFV196ivZ3fl7y9qk/OneE7sy3FIfd
   vM96nMRK1iTE3WKIQrLgo7PIoon6FIkQmzhWTHMnUFxwA5/br9rbkMKkR
   Q==;
X-CSE-ConnectionGUID: zUZHIhG3TK28ebzn/rsl3A==
X-CSE-MsgGUID: lVW9SN5SQxaue/Ghr37k3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="34995525"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="34995525"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 13:03:44 -0800
X-CSE-ConnectionGUID: atYQbLKiTzyNZ+xtrVdRFw==
X-CSE-MsgGUID: 3RZLWBK1TyOdCaEF5v2jww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="100743355"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Dec 2024 13:03:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRHUi-0003cY-1Y;
	Fri, 27 Dec 2024 21:03:40 +0000
Date: Sat, 28 Dec 2024 05:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 10/13]
 arch/x86/kernel/cpu/zhaoxin.c:39:53: error: macro "rdmsr" requires 3
 arguments, but only 2 given
Message-ID: <202412280433.ikWOnA2w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   04e87989806be09036718fa57acd80ea138c2319
commit: 027fda52cb9f7f1c6eabf9620adcf63d0a8918e8 [10/13] x86/msr: Replace wrmsr() with wrmsrl()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241228/202412280433.ikWOnA2w-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280433.ikWOnA2w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280433.ikWOnA2w-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/zhaoxin.c: In function 'init_zhaoxin_cap':
>> arch/x86/kernel/cpu/zhaoxin.c:39:53: error: macro "rdmsr" requires 3 arguments, but only 2 given
      39 |                         rdmsr(MSR_ZHAOXIN_FCR57, val);
         |                                                     ^
   In file included from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/uprobes.h:18,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from arch/x86/include/asm/cpu.h:5,
                    from arch/x86/kernel/cpu/zhaoxin.c:5:
   arch/x86/include/asm/msr.h:244: note: macro "rdmsr" defined here
     244 | #define rdmsr(msr, low, high)                                   \
         | 
>> arch/x86/kernel/cpu/zhaoxin.c:39:25: error: 'rdmsr' undeclared (first use in this function)
      39 |                         rdmsr(MSR_ZHAOXIN_FCR57, val);
         |                         ^~~~~
   arch/x86/kernel/cpu/zhaoxin.c:39:25: note: each undeclared identifier is reported only once for each function it appears in


vim +/rdmsr +39 arch/x86/kernel/cpu/zhaoxin.c

    19	
    20	static void init_zhaoxin_cap(struct cpuinfo_x86 *c)
    21	{
    22		u64 val;
    23	
    24		/* Test for Extended Feature Flags presence */
    25		if (cpuid_eax(0xC0000000) >= 0xC0000001) {
    26			u32 tmp = cpuid_edx(0xC0000001);
    27	
    28			/* Enable ACE unit, if present and disabled */
    29			if ((tmp & (ACE_PRESENT | ACE_ENABLED)) == ACE_PRESENT) {
    30				rdmsrl(MSR_ZHAOXIN_FCR57, val);
    31				/* Enable ACE unit */
    32				val |= ACE_FCR;
    33				wrmsrl(MSR_ZHAOXIN_FCR57, val);
    34				pr_info("CPU: Enabled ACE h/w crypto\n");
    35			}
    36	
    37			/* Enable RNG unit, if present and disabled */
    38			if ((tmp & (RNG_PRESENT | RNG_ENABLED)) == RNG_PRESENT) {
  > 39				rdmsr(MSR_ZHAOXIN_FCR57, val);
    40				/* Enable RNG unit */
    41				val |= RNG_ENABLE;
    42				wrmsrl(MSR_ZHAOXIN_FCR57, val);
    43				pr_info("CPU: Enabled h/w RNG\n");
    44			}
    45	
    46			/*
    47			 * Store Extended Feature Flags as word 5 of the CPU
    48			 * capability bit array
    49			 */
    50			c->x86_capability[CPUID_C000_0001_EDX] = cpuid_edx(0xC0000001);
    51		}
    52	
    53		if (c->x86 >= 0x6)
    54			set_cpu_cap(c, X86_FEATURE_REP_GOOD);
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
