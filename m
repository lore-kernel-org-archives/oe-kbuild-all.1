Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B6C1F09A5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 00:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780532381; cv=none; b=IyQRJtPNfLL7aTKadCwzDTChZ6BEsf2+9VPA93vl8RwKfzRSuhY8MTSfizzQvTNiezD/0HY1zpJMz2HZcd0P6rN8DjeDlF6tfDoM8/A27mcFRGVFOykzZnK1o82nXUoSOXr7RwYoVtD0ln+cBO4KtKz+5Yqo9O8bYb3xbs8Bkno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780532381; c=relaxed/simple;
	bh=H0T1sFLyPG95TIjYzD7BeBNHGnBv7gDN2PDHzucFKQY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SK+rWeB/NP9yuc/5QhccIcr4ip4kOjmQf0mWYpylsvqdAq2pL3YsBWiQx79gQ9YHz2ojGi2EOFe91AUfy7rDNZVxfvfJRPZyA8NlS3IbGwdwiPae5bHF6W6MBPePUtwtU6lzAiwnuVcl3MzrdrwxjDBRZJohaTl0atjtsA3Xt4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6wwTGj9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6wwTGj9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780532378; x=1812068378;
  h=date:from:to:cc:subject:message-id;
  bh=H0T1sFLyPG95TIjYzD7BeBNHGnBv7gDN2PDHzucFKQY=;
  b=W6wwTGj9LFIHGMrzKA4l/5Q/LGnnafbOVAthnSK6ZMVQmcj9ihoMHDf8
   yHKMQXfZlGxkDTqZwODi57/TE4xeQvQhZyj+IdvhVagSkZ+wcneKk/MuZ
   Xn9IFAjQYCz2cC2x46xIhvPWb3LVNynvIiFrJk0HQaapZcgXg7xOB3yDg
   2ZqiCQE3Aanwxdaha8wv4p//WcCD4W+bJNbV71VPqdWEvg4liwjNEcQAe
   /CU2l8GoLnkcLDPOLQWWuen2lP6EfQ2YPKYDZRZtPMVFugeqrMlr2Zv3A
   DVMg2aYuW18Pi8ZA74Z29MZ5XfVvNr184FmviFj8JOAfBukpNfohjkb8d
   g==;
X-CSE-ConnectionGUID: Gbqp1SOwTfi7VlbEAqnB3w==
X-CSE-MsgGUID: lWwlw+L2Qv66rdI9lbAVRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="85208922"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="85208922"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 17:19:38 -0700
X-CSE-ConnectionGUID: +ZDnrKfLQr2YTUsmiq/fcg==
X-CSE-MsgGUID: Bx9fr7FaR0SbSCPftBW7lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="268050949"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jun 2026 17:19:36 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUvo5-00000000E3W-2NTd;
	Thu, 04 Jun 2026 00:19:33 +0000
Date: Thu, 04 Jun 2026 08:19:30 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>
Subject: arch/riscv/include/asm/timex.h:31:16: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202606040825.U6Sodwz8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
commit: c03ad15f7cf60999681a3e5784404a73a93e6506 riscv: Reuse measure_cycles() in check_vector_unaligned_access()
date:   9 weeks ago
config: riscv-randconfig-r111-20260604 (https://download.01.org/0day-ci/archive/20260604/202606040825.U6Sodwz8-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606040825.U6Sodwz8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c03ad15f7cf6 ("riscv: Reuse measure_cycles() in check_vector_unaligned_access()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606040825.U6Sodwz8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zabha'
   arch/riscv/kernel/unaligned_access_speed.c:25:1: sparse: sparse: symbol '__pcpu_scope_vector_misaligned_access' was not declared. Should it be static?
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
