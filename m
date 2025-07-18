Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F362310957
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 23:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752880991; cv=none; b=Wqb2soLuFS95t2cwD8Uqak11n5aokEHV0V+C4H1wtRPw8/jZLa0iDlAaNvLYUP8Rbu6eU9uce/eDQ0VztkqI8RIMwbdM+NruiHo8quYhpaIPK6uOEfAFCVPk1zwKHomVcr1Qo3SO6LdwAHErX9t27fKowKjzVW83TLxo8UQvLn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752880991; c=relaxed/simple;
	bh=B5CAEHQ0jyo5HOngWl6o8FVMc6XVLxuL2VnyenfNi1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kkcEDy0fQaI2U48A6gJ/6TXDE4/1a7Kb2CzJOTx/S2wO81H4ccM6sSeCTzwuaOVvek7o0VzT3Lm8eICrnhPk6z5PJ+UzhQNuHAL1qlH65QKU/QR5tOFGXtdft/wAUaMj2pkeyakinGuDjw/ByBrZXqZ72o486cQaWpmsQNCj3Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxNPVFCJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxNPVFCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752880990; x=1784416990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B5CAEHQ0jyo5HOngWl6o8FVMc6XVLxuL2VnyenfNi1A=;
  b=jxNPVFCJPFYRii9888Wus9zCj/CXwpOtsUrHLZJmoYD1tWVqgoKjF8Yl
   iCxbO5SH0Tf0F2QBBPxIyHuXiRuj8ITysJBQXl4uYncIbiJj4JyISm1xm
   zFAv8UbTLRGQNHRF1U4sdvl53ysCxnsdRJoCSqg3GYY84RyKjM6Xzhg5M
   cc/hzv3LHjnaY4bCI60uSEfgK8ShSqxWqhIyD68s5HZEtD6mBAZbL/Zx0
   /4P8SAiuYLr2kx9acYc1icy7vIc3TsC74JfGusPqQBZBxcKXhbarDEbou
   sgUUCdf2y68n44UGKz0QN1+RAtrHMbSxpYaDdSJE5raFfn6bt3cZIhGeA
   g==;
X-CSE-ConnectionGUID: NXlna8QCQ3mlIuapoo98dg==
X-CSE-MsgGUID: Z1H38S7kQH24d+Q4T8hkRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="77716879"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="77716879"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 16:23:10 -0700
X-CSE-ConnectionGUID: SMhFfUbiRG6hBjSnsgcZkw==
X-CSE-MsgGUID: jNHR5zs3Su+hKpfPfPfEwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="162886624"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jul 2025 16:23:08 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucuPy-000F8H-07;
	Fri, 18 Jul 2025 23:23:06 +0000
Date: Sat, 19 Jul 2025 07:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [kvm-riscv:riscv_kvm_queue 21/25]
 arch/riscv/include/asm/csr.h:211:29: warning: conversion from 'long long
 unsigned int' to 'long unsigned int' changes value from '8589934592' to '0'
Message-ID: <202507190732.hj0EAGDk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kvm-riscv/linux.git riscv_kvm_queue
head:   9812ba1039cfd71015a27af90971b049fb70806c
commit: 9f585bd8f40b05487a17efae772ff0bd172060d7 [21/25] RISC-V: KVM: Add support for SBI_FWFT_POINTER_MASKING_PMLEN
config: riscv-randconfig-r072-20250719 (https://download.01.org/0day-ci/archive/20250719/202507190732.hj0EAGDk-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190732.hj0EAGDk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190732.hj0EAGDk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/ptrace.h:10,
                    from arch/riscv/include/asm/processor.h:15,
                    from arch/riscv/include/asm/cmpxchg.h:16,
                    from arch/riscv/include/asm/barrier.h:14,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/riscv/kvm/vcpu_sbi_fwft.c:11:
   arch/riscv/kvm/vcpu_sbi_fwft.c: In function 'kvm_sbi_fwft_pointer_masking_pmlen_supported':
>> arch/riscv/include/asm/csr.h:211:29: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '8589934592' to '0' [-Woverflow]
    #define ENVCFG_PMM_PMLEN_7  (_AC(0x2, ULL) << 32)
                                ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_sbi_fwft.c:119:41: note: in expansion of macro 'ENVCFG_PMM_PMLEN_7'
     fwft->have_vs_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
                                            ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/csr.h:212:30: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '12884901888' to '0' [-Woverflow]
    #define ENVCFG_PMM_PMLEN_16  (_AC(0x3, ULL) << 32)
                                 ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_sbi_fwft.c:120:42: note: in expansion of macro 'ENVCFG_PMM_PMLEN_16'
     fwft->have_vs_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
                                             ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu_sbi_fwft.c: In function 'kvm_sbi_fwft_set_pointer_masking_pmlen':
>> arch/riscv/include/asm/csr.h:211:29: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '8589934592' to '0' [-Woverflow]
    #define ENVCFG_PMM_PMLEN_7  (_AC(0x2, ULL) << 32)
                                ^
   arch/riscv/kvm/vcpu_sbi_fwft.c:135:9: note: in expansion of macro 'ENVCFG_PMM_PMLEN_7'
      pmm = ENVCFG_PMM_PMLEN_7;
            ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/csr.h:212:30: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '12884901888' to '0' [-Woverflow]
    #define ENVCFG_PMM_PMLEN_16  (_AC(0x3, ULL) << 32)
                                 ^
   arch/riscv/kvm/vcpu_sbi_fwft.c:137:9: note: in expansion of macro 'ENVCFG_PMM_PMLEN_16'
      pmm = ENVCFG_PMM_PMLEN_16;
            ^~~~~~~~~~~~~~~~~~~


vim +211 arch/riscv/include/asm/csr.h

d6f5f6e904be62 Anup Patel     2022-01-18  204  
6bb2e00ea304ff Anup Patel     2022-07-29  205  /* xENVCFG flags */
6bb2e00ea304ff Anup Patel     2022-07-29  206  #define ENVCFG_STCE			(_AC(1, ULL) << 63)
6bb2e00ea304ff Anup Patel     2022-07-29  207  #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
94a7734d0967e8 Yong-Xuan Wang 2024-07-26  208  #define ENVCFG_ADUE			(_AC(1, ULL) << 61)
29eedc7d1587f4 Samuel Holland 2024-10-16  209  #define ENVCFG_PMM			(_AC(0x3, ULL) << 32)
29eedc7d1587f4 Samuel Holland 2024-10-16  210  #define ENVCFG_PMM_PMLEN_0		(_AC(0x0, ULL) << 32)
29eedc7d1587f4 Samuel Holland 2024-10-16 @211  #define ENVCFG_PMM_PMLEN_7		(_AC(0x2, ULL) << 32)
29eedc7d1587f4 Samuel Holland 2024-10-16  212  #define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
6bb2e00ea304ff Anup Patel     2022-07-29  213  #define ENVCFG_CBZE			(_AC(1, UL) << 7)
6bb2e00ea304ff Anup Patel     2022-07-29  214  #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
6bb2e00ea304ff Anup Patel     2022-07-29  215  #define ENVCFG_CBIE_SHIFT		4
6bb2e00ea304ff Anup Patel     2022-07-29  216  #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
6bb2e00ea304ff Anup Patel     2022-07-29  217  #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
6bb2e00ea304ff Anup Patel     2022-07-29  218  #define ENVCFG_CBIE_FLUSH		_AC(0x1, UL)
6bb2e00ea304ff Anup Patel     2022-07-29  219  #define ENVCFG_CBIE_INV			_AC(0x3, UL)
6bb2e00ea304ff Anup Patel     2022-07-29  220  #define ENVCFG_FIOM			_AC(0x1, UL)
6bb2e00ea304ff Anup Patel     2022-07-29  221  

:::::: The code at line 211 was first introduced by commit
:::::: 29eedc7d1587f42f33ae209be45c89c424ee9c00 riscv: Add CSR definitions for pointer masking

:::::: TO: Samuel Holland <samuel.holland@sifive.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
