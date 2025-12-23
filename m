Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688C5234973
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 05:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766468469; cv=none; b=lsCqJ+/O40+Ch0V2BALsmd+bUunxpzpn4lIrO5KkdPjb3gdhv2umAy4xIt6S9tS9Og9IDFCB9eMkfEBKm0BamrV8ZV/uLUWOumfnFhAsEroA6q66Rltw6OT9iyc67HMX6ZmKeUm+/K2dKM0y5+KM62ZWugA4lmrcTTqt4R/jmw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766468469; c=relaxed/simple;
	bh=D7QVKoFD6xZlu9KyTiZGim1zlG2QXxuT1Psn6sQJeWA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rFegeCx98f4vnayec3Th1wahBu6A8/YcWNklRXmdoh2QcnyLFHkyy2EtNPMejddNlytrxmhgu0HGTzdnG2sBnhzOhY2PZ+Z3pTfc10rMW+jcuECwtzZmAYCxb0nM9OwnOJjmBC0zCkazaDRxl6YOCw95oIK+gXVRqywEP+bl5KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHdPDUpM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHdPDUpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766468469; x=1798004469;
  h=date:from:to:cc:subject:message-id;
  bh=D7QVKoFD6xZlu9KyTiZGim1zlG2QXxuT1Psn6sQJeWA=;
  b=SHdPDUpM3inNxbtBeb0aHe5ZIWJ1l8PNZWwkqvG8aE9BvIjhHaOzfrC5
   UNHQbG15FwtpVQfwEkp+BHkkbYuEHEDLIy0JJgAOiTQTSyTZ3lajQK2QD
   pExHSpOuzZnoK8TcBx80tzA5r+7ZoPsjsaslZK9VXDriv90ERmRLusy1U
   l5AwWlwZ1/yeA8+q5Ko4ShPOSWx1aGeHoch+QeXx69xkHaPqq2TEKEW2U
   ivmyj1iOw82XcTOhJyG9QULwZvr1cEsTUdUXcB4rtKeKJGd/RZ6ewgnEc
   iDGm70zEgB/qq1Ja39l/uVA4F4Yilg5s9vQwbeolXMAhmdP1+m3TBmcVf
   g==;
X-CSE-ConnectionGUID: Esvi2OdmSgK0+MuXMbnyYg==
X-CSE-MsgGUID: 4YkkrM+lQ+uF20NeL5ZhVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68213610"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68213610"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 21:40:46 -0800
X-CSE-ConnectionGUID: hJN14u05SieO9b0U0985WQ==
X-CSE-MsgGUID: 7GizMRCDRDWcSB171ls4lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="198944224"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2025 21:40:45 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXv8P-000000001VL-2cSw;
	Tue, 23 Dec 2025 05:40:39 +0000
Date: Tue, 23 Dec 2025 13:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1]
 arch/arm64/include/asm/pgtable.h:871:44: error: implicit declaration of
 function 'pud_user_exec'; did you mean 'pmd_user_exec'?
Message-ID: <202512231328.OMbM2cHV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Liu,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b952cc514e6f0e92951693f5131909bb1264ded3
commit: a006aaffd78ff70efcffa44e325633c0840b2bf2 [1/1] arm64/mm: add pud_user_exec() check in pud_user_accessible_page()
config: arm64-randconfig-004-20251223 (https://download.01.org/0day-ci/archive/20251223/202512231328.OMbM2cHV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231328.OMbM2cHV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231328.OMbM2cHV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from include/linux/elfcore.h:11,
                    from include/linux/crash_core.h:6,
                    from include/linux/kexec.h:18,
                    from arch/arm64/kernel/asm-offsets.c:12:
   arch/arm64/include/asm/pgtable.h: In function 'pud_user_accessible_page':
>> arch/arm64/include/asm/pgtable.h:871:44: error: implicit declaration of function 'pud_user_exec'; did you mean 'pmd_user_exec'? [-Werror=implicit-function-declaration]
     871 |  return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
         |                                            ^~~~~~~~~~~~~
         |                                            pmd_user_exec
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:118: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=16748791
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1270: prepare0] Error 2 shuffle=16748791
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:231: __sub-make] Error 2 shuffle=16748791
   make: Target 'prepare' not remade because of errors.


vim +871 arch/arm64/include/asm/pgtable.h

   868	
   869	static inline bool pud_user_accessible_page(pud_t pud)
   870	{
 > 871		return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
   872	}
   873	#endif
   874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
