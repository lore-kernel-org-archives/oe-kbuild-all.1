Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6A118AFE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 15:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689088462; x=1720624462;
  h=date:from:cc:subject:message-id:mime-version;
  bh=IJaWvznMZHcHBgUkBxOt5ojHK2GiquUZKMz7Tok3jEM=;
  b=dBLCfZuqKkKeDBMJ09OozxGNvQK3Ul+FV2zICdqRxbde63ATzicaiZkt
   KASDmo18HdrKAn5azx/chvDgsIduNrPW/EZsRBE+8fuaixAaBd8uZNpGO
   QpxN4wSHBR6f3jDf58s1hvImWjWfAYaO8pdAswwhFnBEXjQc6RsvQ1A2V
   nY0gbn6UMAXJc4ahk14ZquoZftsco1JA0dJigvSoNn7gNuTgi/xhWhd0o
   rMNqIkIXuI7WM32uv5Z1JaPvGpk3r+4biyeCEqMkJkgyINX7klvJCbvsp
   Zu1gTxLmXcFzePdeklix2WY58qo5RotvqUSmS4UfyIj1o9b1/FemDb+MG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="367225458"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="367225458"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 08:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="698460180"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="698460180"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Jul 2023 08:14:05 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJF40-0004sx-35
	for oe-kbuild-all@lists.linux.dev;
	Tue, 11 Jul 2023 15:14:04 +0000
Date: Tue, 11 Jul 2023 23:13:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 6994/30000] <stdin>:1341:2: warning:
 syscall pidfd_open not implemented
Message-ID: <202307112310.cFe3ebrs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christian,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   d86cf6f06c9415a617dd1a1e3c9dc081a3cf0f8f
commit: 6c0620339fa75a3df127fd63c3f145c7dab9d523 [6994/30000] BACKPORT: arch: wire-up pidfd_open()
config: mips-randconfig-r034-20230710 (https://download.01.org/0day-ci/archive/20230711/202307112310.cFe3ebrs-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307112310.cFe3ebrs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307112310.cFe3ebrs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1338:2: warning: syscall pidfd_send_signal not implemented [-W#warnings]
   #warning syscall pidfd_send_signal not implemented
    ^
>> <stdin>:1341:2: warning: syscall pidfd_open not implemented [-W#warnings]
   #warning syscall pidfd_open not implemented
    ^
   2 warnings generated.
--
   include/linux/page-flags.h:163:21: warning: comparison of integers of different signs: 'const unsigned long' and 'long' [-Wsign-compare]
           return page->flags == PAGE_POISON_PATTERN;
                  ~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~
   In file included from arch/mips/kernel/asm-offsets.c:15:
   In file included from include/linux/mm.h:1167:
   include/linux/vmstat.h:221:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_online_cpu(cpu)
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:778:36: note: expanded from macro 'for_each_online_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:9: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                    ~~~  ^ ~~~~~~~~~~
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/cgroup.h:28:
   include/linux/cgroup-defs.h:475:16: warning: field 'cgrp' with variable sized type 'struct cgroup' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct cgroup cgrp;
                         ^
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:31:
   In file included from include/linux/writeback.h:184:
   include/linux/bio.h:412:14: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           if (sectors >= bio_sectors(bio))
               ~~~~~~~ ^  ~~~~~~~~~~~~~~~~
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   include/linux/memcontrol.h:587:22: warning: comparison of integers of different signs: 'long' and 'unsigned int' [-Wsign-compare]
           if (unlikely(abs(x) > MEMCG_CHARGE_BATCH)) {
               ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   include/linux/memcontrol.h:587:22: warning: comparison of integers of different signs: 'long' and 'unsigned int' [-Wsign-compare]
           if (unlikely(abs(x) > MEMCG_CHARGE_BATCH)) {
               ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   include/linux/memcontrol.h:673:22: warning: comparison of integers of different signs: 'long' and 'unsigned int' [-Wsign-compare]
           if (unlikely(abs(x) > MEMCG_CHARGE_BATCH)) {
               ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   In file included from arch/mips/kernel/asm-offsets.c:17:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   include/linux/memcontrol.h:673:22: warning: comparison of integers of different signs: 'long' and 'unsigned int' [-Wsign-compare]
           if (unlikely(abs(x) > MEMCG_CHARGE_BATCH)) {
               ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   In file included from arch/mips/kernel/asm-offsets.c:24:
   In file included from include/linux/kvm_host.h:39:
   arch/mips/include/asm/kvm_host.h:186:19: warning: field 'gpa_mm' with variable sized type 'struct mm_struct' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct mm_struct gpa_mm;
                            ^
   arch/mips/include/asm/kvm_host.h:375:19: warning: field 'guest_kernel_mm' with variable sized type 'struct mm_struct' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct mm_struct guest_kernel_mm, guest_user_mm;
                            ^
   arch/mips/include/asm/kvm_host.h:375:36: warning: field 'guest_user_mm' with variable sized type 'struct mm_struct' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct mm_struct guest_kernel_mm, guest_user_mm;
                                             ^
   In file included from arch/mips/kernel/asm-offsets.c:24:
   include/linux/kvm_host.h:277:23: warning: field 'arch' with variable sized type 'struct kvm_vcpu_arch' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct kvm_vcpu_arch arch;
                                ^
   include/linux/kvm_host.h:427:18: warning: field 'arch' with variable sized type 'struct kvm_arch' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct kvm_arch arch;
                           ^
   21 warnings generated.
   <stdin>:1338:2: warning: syscall pidfd_send_signal not implemented [-W#warnings]
   #warning syscall pidfd_send_signal not implemented
    ^
>> <stdin>:1341:2: warning: syscall pidfd_open not implemented [-W#warnings]
   #warning syscall pidfd_open not implemented
    ^
   2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
