Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019B01F4191
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Sep 2025 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757328688; cv=none; b=Qv6GSWiwukZK9VbcMFsPVZ6ABPfxDTCmYX+mhYrko5TbnFFOdCi+6DtJ3Amwr3uZcegXT5MnEioWOIXVyonG/rzTJMfGFfzovOj6Auu17KYdHmHPUu0VU/gJU6o6Gk7h3p5BY+pqaaJUg5yEGEI8fYxAc/fTdPaB+yVlIVTK4M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757328688; c=relaxed/simple;
	bh=ZeBc7U9V0AG+NGRemigLOjB3oKHlks+vaVOEP2FkNe0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=llJgY9jh+Ne6etjKAsLvzTH3k+ttAJT2KpQ5jLbF1tw4zV4IEdTeP+GXI/TEEyVn0zJ25R8cO2MVckUKId2++YAh2NPnTGUJRA4RGduvnyKM2/PAB++4VOPTrXm0WSq6CSRHyFUdPfgSx4BBKQ47zSrSbEL1HH9fiYkgkHwjDBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nz41byZF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nz41byZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757328687; x=1788864687;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ZeBc7U9V0AG+NGRemigLOjB3oKHlks+vaVOEP2FkNe0=;
  b=nz41byZFgsKQhZ7KGj7xMnSp17JiFu0/72R9RqxB94AFueRmijXY50d/
   12jpYDqqYOS7weGduIVC90R599Q6IdnRd7Tu5Sdfb3w+aZnae+ZNuJKCO
   gGnooVIoWPg7JwIUlsPI45Jyukcwt9294HDTkzfMBUlbG6bJkMKuJX2nP
   /Pmw+E4YJQCrjHXeXiUQgftKUq0s8fByKggOytfQu58YggWY6JMtIGiwf
   s/vpD0ZePGGIKAzy7ha3nSsGbKRuXWFXulb8F0wfAkKUCpukUTtGD2OQL
   aayMsiPYY/+5kkEvJVlKbNmGVgSpXWtdkv+D/3RjTubIfM7FlXuhN0+d7
   A==;
X-CSE-ConnectionGUID: fLxin84VT72pIR+JhfO8CA==
X-CSE-MsgGUID: 8+5mq+QDSHK/sfUc6fyttQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59439905"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="59439905"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 03:51:27 -0700
X-CSE-ConnectionGUID: 3lYHDK48RQaF3jRti3tWJQ==
X-CSE-MsgGUID: Mr61lpfyTCyqXdqEKhfyeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="203726638"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2025 03:51:25 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvZT1-0003kF-1H
	for oe-kbuild-all@lists.linux.dev;
	Mon, 08 Sep 2025 10:51:23 +0000
Date: Mon, 8 Sep 2025 18:50:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/linux 1/1] include/linux/kasan.h:50:37: error:
 'MAX_PTRS_PER_PTE' undeclared here (not in a function); did you mean
 'PTRS_PER_PTE'?
Message-ID: <202509081833.yADJylKg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qun-Wei,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   5ec173aed5e19cd2bb993682eccbcdd8d7005a2a
commit: fd7b4f9f46d46acbc7af3a439bb0d869efdc5c58 [1/1] sched/task_stack: fix object_is_on_stack() for KASAN tagged pointers
config: riscv-randconfig-002-20250908 (https://download.01.org/0day-ci/archive/20250908/202509081833.yADJylKg-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250908/202509081833.yADJylKg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509081833.yADJylKg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched/task_stack.h:12,
                    from arch/riscv/include/asm/compat.h:12,
                    from arch/riscv/include/asm/pgtable.h:115,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from arch/riscv/kernel/asm-offsets.c:8:
>> include/linux/kasan.h:50:37: error: 'MAX_PTRS_PER_PTE' undeclared here (not in a function); did you mean 'PTRS_PER_PTE'?
      50 | extern pte_t kasan_early_shadow_pte[MAX_PTRS_PER_PTE + PTE_HWTABLE_PTRS];
         |                                     ^~~~~~~~~~~~~~~~
         |                                     PTRS_PER_PTE
>> include/linux/kasan.h:51:8: error: unknown type name 'pmd_t'
      51 | extern pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD];
         |        ^~~~~
>> include/linux/kasan.h:51:37: error: 'MAX_PTRS_PER_PMD' undeclared here (not in a function); did you mean 'PTRS_PER_PGD'?
      51 | extern pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD];
         |                                     ^~~~~~~~~~~~~~~~
         |                                     PTRS_PER_PGD
   include/linux/kasan.h:52:8: error: unknown type name 'pud_t'
      52 | extern pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD];
         |        ^~~~~
>> include/linux/kasan.h:52:37: error: 'MAX_PTRS_PER_PUD' undeclared here (not in a function); did you mean 'PTRS_PER_PGD'?
      52 | extern pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD];
         |                                     ^~~~~~~~~~~~~~~~
         |                                     PTRS_PER_PGD
   include/linux/kasan.h:53:8: error: unknown type name 'p4d_t'
      53 | extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
         |        ^~~~~
>> include/linux/kasan.h:53:37: error: 'MAX_PTRS_PER_P4D' undeclared here (not in a function); did you mean 'PTRS_PER_PGD'?
      53 | extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
         |                                     ^~~~~~~~~~~~~~~~
         |                                     PTRS_PER_PGD
   make[3]: *** [scripts/Makefile.build:102: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=861334570
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2 shuffle=861334570
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2 shuffle=861334570
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2 shuffle=861334570
   make: Target 'prepare' not remade because of errors.


vim +50 include/linux/kasan.h

29970dc24faf00 Hailong Liu      2021-01-12  48  
9577dd74864877 Andrey Konovalov 2018-12-28  49  extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
cb32c9c5d45662 Daniel Axtens    2021-06-28 @50  extern pte_t kasan_early_shadow_pte[MAX_PTRS_PER_PTE + PTE_HWTABLE_PTRS];
cb32c9c5d45662 Daniel Axtens    2021-06-28 @51  extern pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD];
cb32c9c5d45662 Daniel Axtens    2021-06-28 @52  extern pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD];
9577dd74864877 Andrey Konovalov 2018-12-28 @53  extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
69786cdb379bbc Andrey Ryabinin  2015-08-13  54  

:::::: The code at line 50 was first introduced by commit
:::::: cb32c9c5d45662770160e0055cb672fd6e0813e8 kasan: use MAX_PTRS_PER_* for early shadow tables

:::::: TO: Daniel Axtens <dja@axtens.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
