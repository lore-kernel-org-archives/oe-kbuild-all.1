Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2988B392828
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jul 2026 22:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784156394; cv=none; b=vGHocoKdnFocDjgV9zwXOZGG7UtC1CgxB09QeX+dL/rpdUcNv1lLrFQvuVCeTpWTnqBs2bMKbhD7AjEgbsb7eW9Ckd8aDuBAoFHg7McKs6UhcRbhaPFDpv3e/Zn8PZfqc1mG7oS8/US4A+DbOfwDI6AdK+Tgcbthx/3ndt76Dqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784156394; c=relaxed/simple;
	bh=jR7Q0RzdG/FWdL0NBuWrb4gBn/wPdpZd+Kauk2QIUwA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QyUhKcOX2as83SbSwUtHzVTlovWtRzJZvDoIQeC/gAm2dkBGiJbuxABob4ifYT5W2m6s4Z/lPe9uWrrYYhFY5NpK1DcSvcnSUeqNJczjsTjoXxsblYMgyPPYXos9uK5yejJHlcndgGi8EcUIC0TvQrG0041DBmsLQgly6mQhtGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ng+5jZ8a; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ng+5jZ8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784156392; x=1815692392;
  h=date:from:to:cc:subject:message-id;
  bh=jR7Q0RzdG/FWdL0NBuWrb4gBn/wPdpZd+Kauk2QIUwA=;
  b=ng+5jZ8amaxvcAlLdCznJWssC248kmJ/fGL2SKg1NYxvyXW6NNzafoz7
   hjdgUo6LAEcSpsAnvggzAWmsFXNx2d3+ZHG0/JE85aj7pDKefwFGj2oHI
   UW7jEkjnIDaXcznWq1qvcZYA8HOPSkxQP/8nLo7nK9oPfGW8h2ESuBH8l
   A6x7hMou6vx1dKRxNXJlqY9R0RvN5tOvSiAcvpMdFcG+uul6c9J3Wwe7C
   4z/LIbXa1LX6K80ymjVusWiHFAv5H4Opg+PsUuSveLeng9dfioK4IB1l3
   u7dx+GW6fA0RtZBhH/Rxgpt66Jx9/KpXF93G9r09/ZncsWMSi8qK7Sm66
   g==;
X-CSE-ConnectionGUID: gRSFVu6ER7Ss7Z7O7gChTA==
X-CSE-MsgGUID: MFOhkbN0TnyYiV8Dk8E3bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88636196"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="88636196"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 15:59:51 -0700
X-CSE-ConnectionGUID: iAH+l0+bT3ekNSQcOFcRGg==
X-CSE-MsgGUID: 2zlKsY7dQnW7bkbnig+K1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="256378223"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 Jul 2026 15:59:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wk8Zu-00000000O4A-3nSO;
	Wed, 15 Jul 2026 22:59:46 +0000
Date: Thu, 16 Jul 2026 06:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>
Subject: arch/riscv/include/asm/timex.h:31:16: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202607160619.14G8GHp5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58717b2a1365d06c8c64b72aa948541b53fe31eb
commit: c03ad15f7cf60999681a3e5784404a73a93e6506 riscv: Reuse measure_cycles() in check_vector_unaligned_access()
date:   3 months ago
config: riscv-randconfig-r111-20260715 (https://download.01.org/0day-ci/archive/20260716/202607160619.14G8GHp5-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607160619.14G8GHp5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c03ad15f7cf6 ("riscv: Reuse measure_cycles() in check_vector_unaligned_access()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607160619.14G8GHp5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
   arch/riscv/kernel/unaligned_access_speed.c: note: in included file (through include/linux/timex.h, include/linux/time32.h, include/linux/time.h, include/linux/jiffies.h, ...):
>> arch/riscv/include/asm/timex.h:31:16: sparse: sparse: cast removes address space '__iomem' of expression
>> arch/riscv/include/asm/timex.h:31:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:31:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:31:16: sparse:     got unsigned int [usertype] *
>> arch/riscv/include/asm/timex.h:31:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:31:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:31:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:25:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
>> arch/riscv/include/asm/timex.h:31:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:31:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:31:16: sparse:     got unsigned int [usertype] *
>> arch/riscv/include/asm/timex.h:31:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:31:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:31:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *

vim +/__iomem +31 arch/riscv/include/asm/timex.h

d5be89a8d118a8e Palmer Dabbelt 2020-09-14  28  
d5be89a8d118a8e Palmer Dabbelt 2020-09-14  29  static inline u32 get_cycles_hi(void)
d5be89a8d118a8e Palmer Dabbelt 2020-09-14  30  {
d5be89a8d118a8e Palmer Dabbelt 2020-09-14 @31  	return readl_relaxed(((u32 *)clint_time_val) + 1);
d5be89a8d118a8e Palmer Dabbelt 2020-09-14  32  }
d5be89a8d118a8e Palmer Dabbelt 2020-09-14  33  #define get_cycles_hi get_cycles_hi
d5be89a8d118a8e Palmer Dabbelt 2020-09-14  34  #endif /* CONFIG_64BIT */
d5be89a8d118a8e Palmer Dabbelt 2020-09-14  35  

:::::: The code at line 31 was first introduced by commit
:::::: d5be89a8d118a8e8d09cd74a921a808f17fbdd09 RISC-V: Resurrect the MMIO timer implementation for M-mode systems

:::::: TO: Palmer Dabbelt <palmerdabbelt@google.com>
:::::: CC: Palmer Dabbelt <palmerdabbelt@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
