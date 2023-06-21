Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1246C168AA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 12:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687350548; x=1718886548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5lk6AmdRsuXtQVZewdn2e9G56aBUbX9ydU8Ase9QMPI=;
  b=fPQ+nOjZIM1dpsSvXb84rKK+D2VBvV9bTRMTz5K061LNI28+cgs+IUB2
   tQ16nKrOeDI95+sGRsXRtGJxqkmwaaJGIrolB+n+GQrE5Hp0JStEAEerP
   Ksh/4+8xwS8ZRURCmUZdZySCmcyRQgZFnVO+ChVarqOkuBye9fO6VEppX
   M5tVwhbhhZtULAWXUmhnemgH3iqCFpmRkTVcRst+rL0xhvTyZ4cBEUbt6
   aB8eNR5e2bnmqdKE3Lped08bQoOCoktvCVzzJDVLqUFXV2TDTAzp43C5V
   xAPSaLum5QzcyPynGVFyXegDXDRcbW8+GD3BfmPwK88dOKZoLzU2bxcko
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="339770417"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="339770417"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 05:29:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="961180019"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="961180019"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Jun 2023 05:29:07 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBwxO-0006pD-1J;
	Wed, 21 Jun 2023 12:29:06 +0000
Date: Wed, 21 Jun 2023 20:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v2.2 7/12] arch/arm64/include/asm/pgtable.h:25:33:
 warning: excess elements in scalar initializer
Message-ID: <202306212018.Qf3499bd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git jitalloc/v2.2
head:   4d3b7e33eca22e1fe243f586c13c875d248d29f6
commit: f45f0df4710043b02303450a8a06282972bdc8b1 [7/12] arm64, execmem: extend execmem_params for generated code definitions
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230621/202306212018.Qf3499bd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306212018.Qf3499bd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306212018.Qf3499bd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/module.c:34:18: error: 'struct execmem_range' has no member named 'text'
      34 |                 .text = {
         |                  ^~~~
   arch/arm64/kernel/module.c:34:17: warning: braces around scalar initializer
      34 |                 .text = {
         |                 ^
   arch/arm64/kernel/module.c:34:17: note: (near initialization for 'execmem_params.jit.start')
   arch/arm64/kernel/module.c:35:25: error: field name not in record or union initializer
      35 |                         .start = VMALLOC_START,
         |                         ^
   arch/arm64/kernel/module.c:35:25: note: (near initialization for 'execmem_params.jit.start')
   arch/arm64/kernel/module.c:36:25: error: field name not in record or union initializer
      36 |                         .end = VMALLOC_END,
         |                         ^
   arch/arm64/kernel/module.c:36:25: note: (near initialization for 'execmem_params.jit.start')
   In file included from include/linux/pgtable.h:6,
                    from arch/arm64/include/asm/io.h:12,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm64/include/asm/hardirq.h:17,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from arch/arm64/kernel/module.c:12:
>> arch/arm64/include/asm/pgtable.h:25:33: warning: excess elements in scalar initializer
      25 | #define VMALLOC_END             (VMEMMAP_START - SZ_256M)
         |                                 ^
   arch/arm64/kernel/module.c:36:32: note: in expansion of macro 'VMALLOC_END'
      36 |                         .end = VMALLOC_END,
         |                                ^~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:25:33: note: (near initialization for 'execmem_params.jit.start')
      25 | #define VMALLOC_END             (VMEMMAP_START - SZ_256M)
         |                                 ^
   arch/arm64/kernel/module.c:36:32: note: in expansion of macro 'VMALLOC_END'
      36 |                         .end = VMALLOC_END,
         |                                ^~~~~~~~~~~
   arch/arm64/kernel/module.c:37:25: error: field name not in record or union initializer
      37 |                         .alignment = 1,
         |                         ^
   arch/arm64/kernel/module.c:37:25: note: (near initialization for 'execmem_params.jit.start')
   arch/arm64/kernel/module.c:37:38: warning: excess elements in scalar initializer
      37 |                         .alignment = 1,
         |                                      ^
   arch/arm64/kernel/module.c:37:38: note: (near initialization for 'execmem_params.jit.start')
   arch/arm64/kernel/module.c: In function 'execmem_arch_params':
   arch/arm64/kernel/module.c:54:27: error: 'struct execmem_range' has no member named 'text'
      54 |         execmem_params.jit.text.pgprot = PAGE_KERNEL_ROX;
         |                           ^


vim +25 arch/arm64/include/asm/pgtable.h

4f04d8f0054511 Catalin Marinas 2012-03-05  16  
4f04d8f0054511 Catalin Marinas 2012-03-05  17  /*
3e1907d5bf5a1e Ard Biesheuvel  2016-03-30  18   * VMALLOC range.
08375198b01001 Catalin Marinas 2014-07-16  19   *
f9040773b7bbbd Ard Biesheuvel  2016-02-16  20   * VMALLOC_START: beginning of the kernel vmalloc space
a5315819c5e7e5 Mark Brown      2019-10-24  21   * VMALLOC_END: extends to the available space below vmemmap, PCI I/O space
3e1907d5bf5a1e Ard Biesheuvel  2016-03-30  22   *	and fixed mappings
4f04d8f0054511 Catalin Marinas 2012-03-05  23   */
f9040773b7bbbd Ard Biesheuvel  2016-02-16  24  #define VMALLOC_START		(MODULES_END)
9ad7c6d5e75b16 Ard Biesheuvel  2020-10-08 @25  #define VMALLOC_END		(VMEMMAP_START - SZ_256M)
4f04d8f0054511 Catalin Marinas 2012-03-05  26  

:::::: The code at line 25 was first introduced by commit
:::::: 9ad7c6d5e75b160c9ce5775db610d964af45b83f arm64: mm: tidy up top of kernel VA space

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
