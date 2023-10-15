Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AD9185E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 12:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PE2pkM7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697371784; x=1728907784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1xXU8Hc1Jbyb4xsZWqpuUp7j6jj4b0/IwKO4spy+Q1w=;
  b=PE2pkM7FUrelULoiH96EfsgfMuMWyIx0E56ALLjqYNkxuMwbl8fplkLr
   oFzpDjcf5mHXTndyJL2QB4z4u/j1kEMP59g5u+6iGa0EpANR8PWRAvDbt
   lAPn6U37KKXeLTv24Ue5RbKVzkNl7NYnbkTEl6kjOGvBSk9glVe7ncrhf
   JKiXWjzwJSzArvF7PKUYDzwgB6HLw/r4F2Wai5wJILfuIVpdx+bECnVLg
   RZ8Nqzih80EEmxZZa9jrQFODHAUHe7L4HWHSe83FjVykTx5kmrVG6pmfB
   fuKdTIMoUflR9lK7x5FE1WW8ZPWLEqE3EkNSHfFNLschsIS3RfAtnMtO6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="6949513"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="6949513"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 05:09:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="846068935"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="846068935"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2023 05:09:42 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrzw9-0007OZ-2z;
	Sun, 15 Oct 2023 12:09:38 +0000
Date: Sun, 15 Oct 2023 20:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:ktext 3/20] arch/arm64/include/asm/memory.h:57:6: warning:
 "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0
Message-ID: <202310151939.sikjxH3P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext
head:   7fa946ce05c273d5ff092c814efe64978e5faf45
commit: e4881183f9059ed8aaa3f16857fd9e0c1db5c168 [3/20] arm64: place kernel in its own L0 page table entry
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231015/202310151939.sikjxH3P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151939.sikjxH3P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151939.sikjxH3P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
>> arch/arm64/include/asm/memory.h:57:6: warning: "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0 [-Wundef]
      57 |     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/memory.h:58:6: warning: "CONFIG_ARM64_64K_PAGES" is not defined, evaluates to 0 [-Wundef]
      58 |     (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from arch/arm64/kernel/sys.c:11:
>> arch/arm64/include/asm/memory.h:57:6: warning: "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0 [-Wundef]
      57 |     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/memory.h:58:6: warning: "CONFIG_ARM64_64K_PAGES" is not defined, evaluates to 0 [-Wundef]
      58 |     (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: warning: initialized field overwritten [-Woverride-init]
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:29:37: note: in expansion of macro '__SYSCALL'
      29 | #define __SC_COMP(_nr, _sys, _comp) __SYSCALL(_nr, _sys)
         |                                     ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:34:1: note: in expansion of macro '__SC_COMP'
      34 | __SC_COMP(__NR_io_setup, sys_io_setup, compat_sys_io_setup)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table[0]')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:29:37: note: in expansion of macro '__SYSCALL'
      29 | #define __SC_COMP(_nr, _sys, _comp) __SYSCALL(_nr, _sys)
         |                                     ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:34:1: note: in expansion of macro '__SC_COMP'
      34 | __SC_COMP(__NR_io_setup, sys_io_setup, compat_sys_io_setup)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: warning: initialized field overwritten [-Woverride-init]
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:36:1: note: in expansion of macro '__SYSCALL'
      36 | __SYSCALL(__NR_io_destroy, sys_io_destroy)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table[1]')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:36:1: note: in expansion of macro '__SYSCALL'
      36 | __SYSCALL(__NR_io_destroy, sys_io_destroy)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: warning: initialized field overwritten [-Woverride-init]
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:29:37: note: in expansion of macro '__SYSCALL'
      29 | #define __SC_COMP(_nr, _sys, _comp) __SYSCALL(_nr, _sys)
         |                                     ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:38:1: note: in expansion of macro '__SC_COMP'
      38 | __SC_COMP(__NR_io_submit, sys_io_submit, compat_sys_io_submit)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table[2]')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:29:37: note: in expansion of macro '__SYSCALL'
      29 | #define __SC_COMP(_nr, _sys, _comp) __SYSCALL(_nr, _sys)
         |                                     ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:38:1: note: in expansion of macro '__SC_COMP'
      38 | __SC_COMP(__NR_io_submit, sys_io_submit, compat_sys_io_submit)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: warning: initialized field overwritten [-Woverride-init]
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:40:1: note: in expansion of macro '__SYSCALL'
      40 | __SYSCALL(__NR_io_cancel, sys_io_cancel)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table[3]')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:40:1: note: in expansion of macro '__SYSCALL'
      40 | __SYSCALL(__NR_io_cancel, sys_io_cancel)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: warning: initialized field overwritten [-Woverride-init]
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:22:34: note: in expansion of macro '__SYSCALL'
      22 | #define __SC_3264(_nr, _32, _64) __SYSCALL(_nr, _64)
         |                                  ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:44:1: note: in expansion of macro '__SC_3264'
      44 | __SC_3264(__NR_io_getevents, sys_io_getevents_time32, sys_io_getevents)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table[4]')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:22:34: note: in expansion of macro '__SYSCALL'
      22 | #define __SC_3264(_nr, _32, _64) __SYSCALL(_nr, _64)
         |                                  ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:44:1: note: in expansion of macro '__SC_3264'
      44 | __SC_3264(__NR_io_getevents, sys_io_getevents_time32, sys_io_getevents)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: warning: initialized field overwritten [-Woverride-init]
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:48:1: note: in expansion of macro '__SYSCALL'
      48 | __SYSCALL(__NR_setxattr, sys_setxattr)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table[5]')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:48:1: note: in expansion of macro '__SYSCALL'
      48 | __SYSCALL(__NR_setxattr, sys_setxattr)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: warning: initialized field overwritten [-Woverride-init]
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:50:1: note: in expansion of macro '__SYSCALL'
      50 | __SYSCALL(__NR_lsetxattr, sys_lsetxattr)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table[6]')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
--
   In file included from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from arch/arm64/include/asm/percpu.h:8,
                    from include/linux/irqflags.h:18,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/context_tracking.h:5,
                    from arch/arm64/kernel/traps.c:10:
>> arch/arm64/include/asm/memory.h:57:6: warning: "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0 [-Wundef]
      57 |     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/memory.h:58:6: warning: "CONFIG_ARM64_64K_PAGES" is not defined, evaluates to 0 [-Wundef]
      58 |     (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:854:43: warning: initialized field overwritten [-Woverride-init]
     854 |         [ESR_ELx_EC_UNKNOWN]            = "Unknown/Uncategorized",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:854:43: note: (near initialization for 'esr_class_str[0]')
   arch/arm64/kernel/traps.c:855:43: warning: initialized field overwritten [-Woverride-init]
     855 |         [ESR_ELx_EC_WFx]                = "WFI/WFE",
         |                                           ^~~~~~~~~
   arch/arm64/kernel/traps.c:855:43: note: (near initialization for 'esr_class_str[1]')
   arch/arm64/kernel/traps.c:856:43: warning: initialized field overwritten [-Woverride-init]
     856 |         [ESR_ELx_EC_CP15_32]            = "CP15 MCR/MRC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:856:43: note: (near initialization for 'esr_class_str[3]')
   arch/arm64/kernel/traps.c:857:43: warning: initialized field overwritten [-Woverride-init]
     857 |         [ESR_ELx_EC_CP15_64]            = "CP15 MCRR/MRRC",
         |                                           ^~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:857:43: note: (near initialization for 'esr_class_str[4]')
   arch/arm64/kernel/traps.c:858:43: warning: initialized field overwritten [-Woverride-init]
     858 |         [ESR_ELx_EC_CP14_MR]            = "CP14 MCR/MRC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:858:43: note: (near initialization for 'esr_class_str[5]')
   arch/arm64/kernel/traps.c:859:43: warning: initialized field overwritten [-Woverride-init]
     859 |         [ESR_ELx_EC_CP14_LS]            = "CP14 LDC/STC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:859:43: note: (near initialization for 'esr_class_str[6]')
   arch/arm64/kernel/traps.c:860:43: warning: initialized field overwritten [-Woverride-init]
     860 |         [ESR_ELx_EC_FP_ASIMD]           = "ASIMD",
         |                                           ^~~~~~~
   arch/arm64/kernel/traps.c:860:43: note: (near initialization for 'esr_class_str[7]')
   arch/arm64/kernel/traps.c:861:43: warning: initialized field overwritten [-Woverride-init]
     861 |         [ESR_ELx_EC_CP10_ID]            = "CP10 MRC/VMRS",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:861:43: note: (near initialization for 'esr_class_str[8]')
   arch/arm64/kernel/traps.c:862:43: warning: initialized field overwritten [-Woverride-init]
     862 |         [ESR_ELx_EC_PAC]                = "PAC",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:862:43: note: (near initialization for 'esr_class_str[9]')
   arch/arm64/kernel/traps.c:863:43: warning: initialized field overwritten [-Woverride-init]
     863 |         [ESR_ELx_EC_CP14_64]            = "CP14 MCRR/MRRC",
         |                                           ^~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:863:43: note: (near initialization for 'esr_class_str[12]')
   arch/arm64/kernel/traps.c:864:43: warning: initialized field overwritten [-Woverride-init]
     864 |         [ESR_ELx_EC_BTI]                = "BTI",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:864:43: note: (near initialization for 'esr_class_str[13]')
   arch/arm64/kernel/traps.c:865:43: warning: initialized field overwritten [-Woverride-init]
     865 |         [ESR_ELx_EC_ILL]                = "PSTATE.IL",
         |                                           ^~~~~~~~~~~
   arch/arm64/kernel/traps.c:865:43: note: (near initialization for 'esr_class_str[14]')
   arch/arm64/kernel/traps.c:866:43: warning: initialized field overwritten [-Woverride-init]
     866 |         [ESR_ELx_EC_SVC32]              = "SVC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:866:43: note: (near initialization for 'esr_class_str[17]')
   arch/arm64/kernel/traps.c:867:43: warning: initialized field overwritten [-Woverride-init]
     867 |         [ESR_ELx_EC_HVC32]              = "HVC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:867:43: note: (near initialization for 'esr_class_str[18]')
   arch/arm64/kernel/traps.c:868:43: warning: initialized field overwritten [-Woverride-init]
     868 |         [ESR_ELx_EC_SMC32]              = "SMC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:868:43: note: (near initialization for 'esr_class_str[19]')
   arch/arm64/kernel/traps.c:869:43: warning: initialized field overwritten [-Woverride-init]
     869 |         [ESR_ELx_EC_SVC64]              = "SVC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:869:43: note: (near initialization for 'esr_class_str[21]')
   arch/arm64/kernel/traps.c:870:43: warning: initialized field overwritten [-Woverride-init]
     870 |         [ESR_ELx_EC_HVC64]              = "HVC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:870:43: note: (near initialization for 'esr_class_str[22]')
   arch/arm64/kernel/traps.c:871:43: warning: initialized field overwritten [-Woverride-init]
     871 |         [ESR_ELx_EC_SMC64]              = "SMC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:871:43: note: (near initialization for 'esr_class_str[23]')
   arch/arm64/kernel/traps.c:872:43: warning: initialized field overwritten [-Woverride-init]
     872 |         [ESR_ELx_EC_SYS64]              = "MSR/MRS (AArch64)",
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:872:43: note: (near initialization for 'esr_class_str[24]')
   arch/arm64/kernel/traps.c:873:43: warning: initialized field overwritten [-Woverride-init]
     873 |         [ESR_ELx_EC_SVE]                = "SVE",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:873:43: note: (near initialization for 'esr_class_str[25]')
   arch/arm64/kernel/traps.c:874:43: warning: initialized field overwritten [-Woverride-init]
     874 |         [ESR_ELx_EC_ERET]               = "ERET/ERETAA/ERETAB",
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:874:43: note: (near initialization for 'esr_class_str[26]')
   arch/arm64/kernel/traps.c:875:43: warning: initialized field overwritten [-Woverride-init]
     875 |         [ESR_ELx_EC_FPAC]               = "FPAC",
         |                                           ^~~~~~
   arch/arm64/kernel/traps.c:875:43: note: (near initialization for 'esr_class_str[28]')
   arch/arm64/kernel/traps.c:876:43: warning: initialized field overwritten [-Woverride-init]
     876 |         [ESR_ELx_EC_SME]                = "SME",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:876:43: note: (near initialization for 'esr_class_str[29]')
   arch/arm64/kernel/traps.c:877:43: warning: initialized field overwritten [-Woverride-init]
     877 |         [ESR_ELx_EC_IMP_DEF]            = "EL3 IMP DEF",
         |                                           ^~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:877:43: note: (near initialization for 'esr_class_str[31]')
   arch/arm64/kernel/traps.c:878:43: warning: initialized field overwritten [-Woverride-init]
     878 |         [ESR_ELx_EC_IABT_LOW]           = "IABT (lower EL)",
--
   In file included from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from arch/arm64/include/asm/percpu.h:8,
                    from include/linux/irqflags.h:18,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from arch/arm64/kernel/cpu_errata.c:10:
>> arch/arm64/include/asm/memory.h:57:6: warning: "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0 [-Wundef]
      57 |     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/memory.h:58:6: warning: "CONFIG_ARM64_64K_PAGES" is not defined, evaluates to 0 [-Wundef]
      58 |     (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:141:20: warning: initialized field overwritten [-Woverride-init]
     141 |         .matches = is_affected_midr_range,                      \
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:153:9: note: in expansion of macro 'CAP_MIDR_RANGE'
     153 |         CAP_MIDR_RANGE(model, v_min, r_min, v_max, r_max)
         |         ^~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:161:9: note: in expansion of macro 'ERRATA_MIDR_RANGE'
     161 |         ERRATA_MIDR_RANGE(m, var, r_min, var, r_max)
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:347:17: note: in expansion of macro 'ERRATA_MIDR_REV_RANGE'
     347 |                 ERRATA_MIDR_REV_RANGE(MIDR_CORTEX_A53, 0, 0, 4),
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:141:20: note: (near initialization for 'erratum_843419_list[0].matches')
     141 |         .matches = is_affected_midr_range,                      \
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:153:9: note: in expansion of macro 'CAP_MIDR_RANGE'
     153 |         CAP_MIDR_RANGE(model, v_min, r_min, v_max, r_max)
         |         ^~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:161:9: note: in expansion of macro 'ERRATA_MIDR_RANGE'
     161 |         ERRATA_MIDR_RANGE(m, var, r_min, var, r_max)
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:347:17: note: in expansion of macro 'ERRATA_MIDR_REV_RANGE'
     347 |                 ERRATA_MIDR_REV_RANGE(MIDR_CORTEX_A53, 0, 0, 4),
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:141:20: warning: initialized field overwritten [-Woverride-init]
     141 |         .matches = is_affected_midr_range,                      \
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:153:9: note: in expansion of macro 'CAP_MIDR_RANGE'
     153 |         CAP_MIDR_RANGE(model, v_min, r_min, v_max, r_max)
         |         ^~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:165:9: note: in expansion of macro 'ERRATA_MIDR_RANGE'
     165 |         ERRATA_MIDR_RANGE(model, var, rev, var, rev)
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:353:17: note: in expansion of macro 'ERRATA_MIDR_REV'
     353 |                 ERRATA_MIDR_REV(MIDR_BRAHMA_B53, 0, 0),
         |                 ^~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:141:20: note: (near initialization for 'erratum_843419_list[1].matches')
     141 |         .matches = is_affected_midr_range,                      \
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:153:9: note: in expansion of macro 'CAP_MIDR_RANGE'
     153 |         CAP_MIDR_RANGE(model, v_min, r_min, v_max, r_max)
         |         ^~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:165:9: note: in expansion of macro 'ERRATA_MIDR_RANGE'
     165 |         ERRATA_MIDR_RANGE(model, var, rev, var, rev)
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:353:17: note: in expansion of macro 'ERRATA_MIDR_REV'
     353 |                 ERRATA_MIDR_REV(MIDR_BRAHMA_B53, 0, 0),
         |                 ^~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/ptrace.h:11,
                    from arch/arm64/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:17:
   arch/arm64/include/asm/cpufeature.h:285:9: warning: initialized field overwritten [-Woverride-init]
     285 |         (ARM64_CPUCAP_SCOPE_LOCAL_CPU | ARM64_CPUCAP_OPTIONAL_FOR_LATE_CPU)
         |         ^
   arch/arm64/kernel/cpu_errata.c:174:17: note: in expansion of macro 'ARM64_CPUCAP_LOCAL_CPU_ERRATUM'
     174 |         .type = ARM64_CPUCAP_LOCAL_CPU_ERRATUM,                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:485:17: note: in expansion of macro 'ERRATA_MIDR_RANGE_LIST'
     485 |                 ERRATA_MIDR_RANGE_LIST(cavium_erratum_23154_cpus),
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cpufeature.h:285:9: note: (near initialization for 'arm64_errata[5].type')
     285 |         (ARM64_CPUCAP_SCOPE_LOCAL_CPU | ARM64_CPUCAP_OPTIONAL_FOR_LATE_CPU)
         |         ^
   arch/arm64/kernel/cpu_errata.c:174:17: note: in expansion of macro 'ARM64_CPUCAP_LOCAL_CPU_ERRATUM'
     174 |         .type = ARM64_CPUCAP_LOCAL_CPU_ERRATUM,                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:485:17: note: in expansion of macro 'ERRATA_MIDR_RANGE_LIST'
     485 |                 ERRATA_MIDR_RANGE_LIST(cavium_erratum_23154_cpus),
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cpufeature.h:302:9: warning: initialized field overwritten [-Woverride-init]
     302 |         (ARM64_CPUCAP_SCOPE_LOCAL_CPU           |       \
         |         ^
   arch/arm64/kernel/cpu_errata.c:576:25: note: in expansion of macro 'ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE'
     576 |                 .type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cpufeature.h:302:9: note: (near initialization for 'arm64_errata[16].type')
     302 |         (ARM64_CPUCAP_SCOPE_LOCAL_CPU           |       \
         |         ^
   arch/arm64/kernel/cpu_errata.c:576:25: note: in expansion of macro 'ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE'
     576 |                 .type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:600:28: warning: initialized field overwritten [-Woverride-init]
     600 |                 .matches = needs_tx2_tvm_workaround,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:600:28: note: (near initialization for 'arm64_errata[19].matches')
..


vim +/CONFIG_ARM64_16K_PAGES +57 arch/arm64/include/asm/memory.h

    46	
    47	/*
    48	 * Setting KIMAGE_VADDR has got a lot harder, ideally we'd like to use
    49	 * min(PGDIR_SIZE, MODULES_VSIZE) but this can't work because this is used
    50	 * both in assembly as C, where it causes problems. min_t() solves the
    51	 * C problems but can't be used in assembly.
    52	 * CONFIG_ARM64_4K_PAGES, PGDIR_SIZE is 2M, 1G, 512G
    53	 * CONFIG_ARM64_16K_PAGES, PGDIR_SIZE is 32M, 64G or 128T
    54	 * CONFIG_ARM64_64K_PAGES, PGDIR_SIZE is 512M or 4T
    55	 */
    56	#if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
  > 57	    (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
  > 58	    (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
    59	#define KIMAGE_OFFSET		MODULES_VSIZE
    60	#else
    61	#define KIMAGE_OFFSET		PGDIR_SIZE
    62	#endif
    63	#define KIMAGE_VADDR		(_PAGE_END(VA_BITS_MIN) + KIMAGE_OFFSET)
    64	#define MODULES_END		(KIMAGE_VADDR)
    65	#define MODULES_VADDR		(MODULES_END - MODULES_VSIZE)
    66	#define MODULES_VSIZE		(SZ_2G)
    67	#define VMEMMAP_START		(-(UL(1) << (VA_BITS - VMEMMAP_SHIFT)))
    68	#define VMEMMAP_END		(VMEMMAP_START + VMEMMAP_SIZE)
    69	#define PCI_IO_END		(VMEMMAP_START - SZ_8M)
    70	#define PCI_IO_START		(PCI_IO_END - PCI_IO_SIZE)
    71	#define FIXADDR_TOP		(VMEMMAP_START - SZ_32M)
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
