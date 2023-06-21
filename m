Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FF8C2DE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687338724; x=1718874724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jvRN/G7kuBoE71V7KY3neGBBwoBoiaEmYSexjZMMCy0=;
  b=Tbsci24jdjThd8ZJcqt+I6MfY9lJ6RhtVoZQjAq0DWHDitMyIU2y7fnn
   WVfX57gWUPKtk8TJmYsmhvV6W0KCYlO0Z6a9IpE1P8AVVWO6SFRybeZl4
   giqBA2lTsQjHW7skQrt1j35wnLy7lY2lIAtUhD2gaM0Jyv/cAVP4QAVfK
   7S0lkqjJS4aQkbdjnypf8xZ7CMUhkOPQTHaMJGZ+NFltlduSkS34fAU+J
   wHgfV/15Po183gynmbJqhm0augpbYyao7GkALBq3+dXEM7zFcHwXd8dVc
   WStU32/EOTEhIvnHWHv1I34yLGwlW/XU7tAY0DNErtRFbe0+LqqKOoJHZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="357613744"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="357613744"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 02:12:03 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="748570922"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="748570922"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Jun 2023 02:12:02 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBtsf-0006h9-2Y;
	Wed, 21 Jun 2023 09:12:01 +0000
Date: Wed, 21 Jun 2023 17:11:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v2.2 10/12] arch/riscv/mm/init.c:1377:17: warning:
 braces around scalar initializer
Message-ID: <202306211733.y4BB81WC-lkp@intel.com>
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
commit: 5f24f0d18c8afbea8c6adc7274c588f256197685 [10/12] arch: make execmem setup available regardless of CONFIG_MODULES
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230621/202306211733.y4BB81WC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211733.y4BB81WC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211733.y4BB81WC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/mm/init.c:1377:18: error: 'struct execmem_range' has no member named 'text'
    1377 |                 .text = {
         |                  ^~~~
>> arch/riscv/mm/init.c:1377:17: warning: braces around scalar initializer
    1377 |                 .text = {
         |                 ^
   arch/riscv/mm/init.c:1377:17: note: (near initialization for 'execmem_params.jit.start')
   arch/riscv/mm/init.c:1378:25: error: field name not in record or union initializer
    1378 |                         .pgprot = PAGE_KERNEL_READ_EXEC,
         |                         ^
   arch/riscv/mm/init.c:1378:25: note: (near initialization for 'execmem_params.jit.start')
   In file included from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/mm/init.c:10:
   arch/riscv/include/asm/page.h:84:25: error: incompatible types when initializing type 'long unsigned int' using type 'pgprot_t'
      84 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                         ^
   arch/riscv/include/asm/pgtable.h:183:33: note: in expansion of macro '__pgprot'
     183 | #define PAGE_KERNEL_READ_EXEC   __pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
         |                                 ^~~~~~~~
   arch/riscv/mm/init.c:1378:35: note: in expansion of macro 'PAGE_KERNEL_READ_EXEC'
    1378 |                         .pgprot = PAGE_KERNEL_READ_EXEC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/mm/init.c:1379:25: error: field name not in record or union initializer
    1379 |                         .alignment = 1,
         |                         ^
   arch/riscv/mm/init.c:1379:25: note: (near initialization for 'execmem_params.jit.start')
>> arch/riscv/mm/init.c:1379:38: warning: excess elements in scalar initializer
    1379 |                         .alignment = 1,
         |                                      ^
   arch/riscv/mm/init.c:1379:38: note: (near initialization for 'execmem_params.jit.start')
   arch/riscv/mm/init.c: In function 'execmem_arch_params':
   arch/riscv/mm/init.c:1394:27: error: 'struct execmem_range' has no member named 'text'
    1394 |         execmem_params.jit.text.start = VMALLOC_START;
         |                           ^
   arch/riscv/mm/init.c:1395:27: error: 'struct execmem_range' has no member named 'text'
    1395 |         execmem_params.jit.text.end = VMALLOC_END;
         |                           ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=n]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n]) && !GENERIC_ATOMIC64 [=n]


vim +1377 arch/riscv/mm/init.c

  1367	
  1368	#if defined(CONFIG_MMU) && defined(CONFIG_EXECMEM)
  1369	static struct execmem_params execmem_params __ro_after_init = {
  1370		.modules = {
  1371			.text = {
  1372				.pgprot = PAGE_KERNEL,
  1373				.alignment = 1,
  1374			},
  1375		},
  1376		.jit = {
> 1377			.text = {
  1378				.pgprot = PAGE_KERNEL_READ_EXEC,
> 1379				.alignment = 1,
  1380			},
  1381		},
  1382	};
  1383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
