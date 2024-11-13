Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC002003C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731499149; cv=none; b=beajVSWlDv+vRKUHsGxb5djOEmUR1hkWVdWxseRf2+Qo3xlet0kQ9vpir6W24MHczf0ZNvR0qKBHY3FBtpYD33OwW8HIQS9aVnXT9CnswPmBMk7CkyyRPnVvVftRuqsudGzB1pGXTyEs2jxeofNGq8S9Y7DHJ+VarMZ/D0kSh6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731499149; c=relaxed/simple;
	bh=Aocsd2F1wI3kmK+tTnWrc2WHMuHTbA6JVSlmtEEl/+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m0JoAl+MWxexTETMi57lt4mm4UtRAafVl3KVt/2sOygKCCKJJzpdKoqUfByQJemGIANttnvOqZ1EXsUWvQFlNHRQ/mS5+2ewlO7vUtHwtay0Pfs9dPQY4KYQZU+dux8i9+9occYzc2xiScE8K8JDJ/YGiWTW6oexXexI+jpNQuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5Kqv0X7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5Kqv0X7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731499147; x=1763035147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aocsd2F1wI3kmK+tTnWrc2WHMuHTbA6JVSlmtEEl/+4=;
  b=b5Kqv0X7US+klMqRIcgfDFT+c4aH5ExijlwuvjZv6xKt8mIGoshrsaVV
   dbiyEtgNLMHEm+Tg+6BEU5NS11ndHsAE4chh/vDRMi0RyToyx9QOBMUON
   IVHJY6/pxmKeb6YpFLjhjqObqw2hKCdsxW8JIoitmT0gndaJ5btkGGh7F
   dQXhN9yuEhNPYj+nlgRhOknaO3ecCAD3GZYw2TdLWHmUh84CwE0xb62td
   4SnKWtCqe/mc9OQvx+X6iK5mKcJwmfxSjDFgXGyq2LRN1gj6qlF/gEF8q
   9+XtuuNVwVt3Hv5C77JOst5ctxhxg0wkAlMgn3q8MBrk/E0LStNOiAu/E
   w==;
X-CSE-ConnectionGUID: txUhFChEQPyCZ0s0NTRJew==
X-CSE-MsgGUID: O78+gfeNTzOcR+DQA1406Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42503587"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42503587"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 03:59:07 -0800
X-CSE-ConnectionGUID: 9nSjowOZR4ahtrLE8juyaA==
X-CSE-MsgGUID: Zk27yqBBSxeXqcIuYOEG8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="118687234"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Nov 2024 03:59:06 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBC1X-0000Kx-0b;
	Wed, 13 Nov 2024 11:59:03 +0000
Date: Wed, 13 Nov 2024 19:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [linux-next:master 4574/11277]
 arch/riscv/kernel/unaligned_access_speed.c:23:1: sparse: sparse: symbol
 '__pcpu_scope_vector_misaligned_access' was not declared. Should it be
 static?
Message-ID: <202411131938.GPjwlaYd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bd05b9a700c10473c2f52bf12c5c5938c30e80b0
commit: d1703dc7bc8ec7adb91f5ceaf1556ff1ed212858 [4574/11277] RISC-V: Detect unaligned vector accesses supported
config: riscv-randconfig-r112-20241113 (https://download.01.org/0day-ci/archive/20241113/202411131938.GPjwlaYd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce: (https://download.01.org/0day-ci/archive/20241113/202411131938.GPjwlaYd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131938.GPjwlaYd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/unaligned_access_speed.c:23:1: sparse: sparse: symbol '__pcpu_scope_vector_misaligned_access' was not declared. Should it be static?
   arch/riscv/kernel/unaligned_access_speed.c: note: in included file (through include/linux/timex.h, include/linux/time32.h, include/linux/time.h, ...):
   arch/riscv/include/asm/timex.h:31:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/riscv/include/asm/timex.h:31:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:31:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:31:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:31:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:31:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:31:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:25:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:31:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:31:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:31:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:31:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:31:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:31:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:31:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:31:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:31:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:31:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:31:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:31:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:31:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:31:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:31:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:31:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:31:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:31:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *

vim +/__pcpu_scope_vector_misaligned_access +23 arch/riscv/kernel/unaligned_access_speed.c

    21	
    22	DEFINE_PER_CPU(long, misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
  > 23	DEFINE_PER_CPU(long, vector_misaligned_access) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
