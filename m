Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9961B18C2E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687364894; x=1718900894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cVF2Z54MLExGWnxqRidg/v/htgDC+1JiDpr/hib2YXE=;
  b=LP14zRrwVhrsUU3oJrUmX5fFzfLMNMH6EGE6pW02QiKP35AJ2qa6J44l
   YSB2Ok8YZQ95SzVrqAgfLkiiQSmJVepyhH5wYiaSC6IqBV4TZsLCGLLd7
   DnPECrbCE3r6FTEM/fJ5NToE5Carvm4f3S/hxRYngZVqIFfUpDs3Pkjbn
   clIE+hkidJ5Gz1NXGnsgPKmEWOfuTRiaI9J+VZK8RDYVl9MFdkokClecf
   TwNIgaFMKsy6VPHP+EQcAp9SytuKqUXXFa0gK8RE+R22G87LFOgGaP+yM
   2oDOmFb4YACEgl9epUrvpK0nw++aP2xHP/afTBIQfwBYJXyLn2w1y4VMC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360241086"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="360241086"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 09:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="859040595"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="859040595"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2023 09:28:12 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC0gl-0006wR-1l;
	Wed, 21 Jun 2023 16:28:11 +0000
Date: Thu, 22 Jun 2023 00:27:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v2.2 8/12] arch/riscv/include/asm/page.h:84:25:
 error: incompatible types when initializing type 'long unsigned int' using
 type 'pgprot_t'
Message-ID: <202306220051.Trm6p6s2-lkp@intel.com>
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
commit: 4e1dd6e3ddfed3f9777addb48b23e3aa8e4b8304 [8/12] riscv: extend execmem_params for kprobes allocations
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230622/202306220051.Trm6p6s2-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220051.Trm6p6s2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220051.Trm6p6s2-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/module.c:448:18: error: 'struct execmem_range' has no member named 'text'
     448 |                 .text = {
         |                  ^~~~
   arch/riscv/kernel/module.c:448:17: warning: braces around scalar initializer
     448 |                 .text = {
         |                 ^
   arch/riscv/kernel/module.c:448:17: note: (near initialization for 'execmem_params.jit.start')
   arch/riscv/kernel/module.c:449:25: error: field name not in record or union initializer
     449 |                         .pgprot = PAGE_KERNEL_READ_EXEC,
         |                         ^
   arch/riscv/kernel/module.c:449:25: note: (near initialization for 'execmem_params.jit.start')
   In file included from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/ipc.h:5,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from arch/riscv/kernel/module.c:7:
>> arch/riscv/include/asm/page.h:84:25: error: incompatible types when initializing type 'long unsigned int' using type 'pgprot_t'
      84 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                         ^
   arch/riscv/include/asm/pgtable.h:183:33: note: in expansion of macro '__pgprot'
     183 | #define PAGE_KERNEL_READ_EXEC   __pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
         |                                 ^~~~~~~~
   arch/riscv/kernel/module.c:449:35: note: in expansion of macro 'PAGE_KERNEL_READ_EXEC'
     449 |                         .pgprot = PAGE_KERNEL_READ_EXEC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/module.c:450:25: error: field name not in record or union initializer
     450 |                         .alignment = 1,
         |                         ^
   arch/riscv/kernel/module.c:450:25: note: (near initialization for 'execmem_params.jit.start')
   arch/riscv/kernel/module.c:450:38: warning: excess elements in scalar initializer
     450 |                         .alignment = 1,
         |                                      ^
   arch/riscv/kernel/module.c:450:38: note: (near initialization for 'execmem_params.jit.start')
   arch/riscv/kernel/module.c: In function 'execmem_arch_params':
   arch/riscv/kernel/module.c:465:27: error: 'struct execmem_range' has no member named 'text'
     465 |         execmem_params.jit.text.start = VMALLOC_START;
         |                           ^
   arch/riscv/kernel/module.c:466:27: error: 'struct execmem_range' has no member named 'text'
     466 |         execmem_params.jit.text.end = VMALLOC_END;
         |                           ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=n]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n]) && !GENERIC_ATOMIC64 [=n]


vim +84 arch/riscv/include/asm/page.h

07037db5d479f9 Palmer Dabbelt 2017-07-10  81  
07037db5d479f9 Palmer Dabbelt 2017-07-10  82  #define __pte(x)	((pte_t) { (x) })
07037db5d479f9 Palmer Dabbelt 2017-07-10  83  #define __pgd(x)	((pgd_t) { (x) })
07037db5d479f9 Palmer Dabbelt 2017-07-10 @84  #define __pgprot(x)	((pgprot_t) { (x) })
07037db5d479f9 Palmer Dabbelt 2017-07-10  85  

:::::: The code at line 84 was first introduced by commit
:::::: 07037db5d479f90377c998259a4f9a469c404edf RISC-V: Paging and MMU

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
