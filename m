Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5753565B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 07:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695540447; x=1727076447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ppE/PLVVVjAy9WK/cy2xOXFCF0/iBQlq0JHcCguEXE=;
  b=Uuc1XyX7K8FfgGFF+wMw5xzZ++PXOhvWYDCjHyTelz0lu+ThjFQ6Mo0W
   1mwIK29OiBYcHkkt3ptvqOnWrGQUFnbLbTNkGPnoGLL5BDoCsPMV2AMU/
   r+lOXrq1NrIOUejzkalPuAicMBZoHW8jqqom21EyBHIDWV7rlQorwH59X
   4SDauGPj9x31MUlvoESPeyhAvjvfYIeLpdQlULGiMheR9vC41bhH/I2ES
   3ATTIn9nLeEcTbn4EDvUNtis24nq8lggwosGuKJHrLWEaCr3Y269ejAqN
   gPOzs8aVHAk8D+3WAJ/3AyoS7J8p6BX/Dq/Vdw3RH3Xwq4hZv6b/Q396f
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="360470269"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="360470269"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 00:27:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="818252817"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="818252817"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 24 Sep 2023 00:27:25 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkJWV-0003LR-1J;
	Sun, 24 Sep 2023 07:27:23 +0000
Date: Sun, 24 Sep 2023 15:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-kunit 5/10]
 arch/riscv/include/asm/processor.h:18:33: error: 'TASK_SIZE_64' undeclared;
 did you mean 'TASK_SIZE_OF'?
Message-ID: <202309241548.CnE4WMDx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-kunit
head:   895a7ddefa3e00a497187cac3d4fb5e57d3059fe
commit: bcde5e744f6fbc010a9e4b97baa4eb3cc33e6fab [5/10] iov_iter: Create a function to prepare userspace VM for UBUF/IOVEC tests
config: riscv-randconfig-001-20230924 (https://download.01.org/0day-ci/archive/20230924/202309241548.CnE4WMDx-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309241548.CnE4WMDx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309241548.CnE4WMDx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:17,
                    from arch/riscv/include/asm/bitops.h:14,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from arch/riscv/include/asm/mmiowb.h:12,
                    from arch/riscv/include/asm/mmio.h:15,
                    from arch/riscv/include/asm/clint.h:10,
                    from arch/riscv/include/asm/timex.h:15,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from lib/kunit_iov_iter.c:10:
   lib/kunit_iov_iter.c: In function 'iov_kunit_create_user_buf':
>> arch/riscv/include/asm/processor.h:18:33: error: 'TASK_SIZE_64' undeclared (first use in this function); did you mean 'TASK_SIZE_OF'?
      18 | #define STACK_TOP_MAX           TASK_SIZE_64
         |                                 ^~~~~~~~~~~~
   lib/kunit_iov_iter.c:266:23: note: in expansion of macro 'STACK_TOP_MAX'
     266 |         vma->vm_end = STACK_TOP_MAX;
         |                       ^~~~~~~~~~~~~
   arch/riscv/include/asm/processor.h:18:33: note: each undeclared identifier is reported only once for each function it appears in
      18 | #define STACK_TOP_MAX           TASK_SIZE_64
         |                                 ^~~~~~~~~~~~
   lib/kunit_iov_iter.c:266:23: note: in expansion of macro 'STACK_TOP_MAX'
     266 |         vma->vm_end = STACK_TOP_MAX;
         |                       ^~~~~~~~~~~~~
   lib/kunit_iov_iter.c: At top level:
   lib/kunit_iov_iter.c:235:26: warning: 'iov_kunit_create_user_buf' defined but not used [-Wunused-function]
     235 | static u8 __user *__init iov_kunit_create_user_buf(struct kunit *test,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +18 arch/riscv/include/asm/processor.h

7db91e57a0acde Palmer Dabbelt  2017-07-10  15  
add2cc6b6515f7 Charlie Jenkins 2023-08-09  16  #ifdef CONFIG_64BIT
add2cc6b6515f7 Charlie Jenkins 2023-08-09  17  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
add2cc6b6515f7 Charlie Jenkins 2023-08-09 @18  #define STACK_TOP_MAX		TASK_SIZE_64
add2cc6b6515f7 Charlie Jenkins 2023-08-09  19  

:::::: The code at line 18 was first introduced by commit
:::::: add2cc6b6515f78d3a150f1fbbaf12c28c4bb20a RISC-V: mm: Restrict address space for sv39,sv48,sv57

:::::: TO: Charlie Jenkins <charlie@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
