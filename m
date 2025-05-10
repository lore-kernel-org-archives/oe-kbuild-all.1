Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2F81A83F9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 04:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746850297; cv=none; b=d2u6k+iiPkHi3wzyU3RNdbqbTTIcnVVLZ4yTqKb9HbKnPLThJymGJ7rY0yTQ+sZ5x7/dRBg3zFf1cuzxwFl7ScLTxWpix70JISPUXqiSIpGc9BoPxX/CrZmzulLr37pe+xiULBhl1GfV67PtqbG7e+m7MY0bfalpBfHazfyhm8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746850297; c=relaxed/simple;
	bh=B70jqznkRLT/pMbGgS9iqKoOwZMfzPDzWjyqk/AKfjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=msH3oAMbN+HW91A6HyX3+WADBe/IL+jY0Dbmx5MG0/jU84O48hpS3hTLdbkNiRZ/x1rQxNEWc92KadW/UyKbShjnyNHGf1Qtnus+btwTuQB28UIYRuP3PjA2dDpdnwJyXZ0B9oce71wKVV67CXLH9Zf+4/US6FyQJrjK5zQ3IBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKd1zaIk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKd1zaIk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746850296; x=1778386296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B70jqznkRLT/pMbGgS9iqKoOwZMfzPDzWjyqk/AKfjE=;
  b=gKd1zaIk730791RZ/f5F1cb2rtScUG31RiXhsg4AlIuyyq5OZTAoeGmZ
   iuKR21QAlUMS2Nr85N6Ty2nMEBM97gJPTBYbbllNfLiiPqUlF1cikRicq
   KQzz3B1pwD3Pq5tn3+iicRdSfr7DQEzXquUEPOds60ht0imjB5qPvsYjJ
   J9/wzKIJo7/4nlK7r5UoVhT3y5ShS+GJdxgkeyjcYY9tNYnH5QV8PSSH7
   XSleOKjf75zXP+2AgWUu/rOf76W0P8tHELFnlXjYw9xaFGXjONWkkD1jm
   CrvUZVbMrVB4sJzRqYPsE8eDAh6XzsfEc9UlilaBXvEv7lPt/x8qddTLz
   g==;
X-CSE-ConnectionGUID: 6ITtu4OQSwiVZUn8vRmLXQ==
X-CSE-MsgGUID: KzRzNKr9T9OaQejtXiEduA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52341327"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="52341327"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 21:11:35 -0700
X-CSE-ConnectionGUID: WXOOr3ahTvWIsGPfEpribA==
X-CSE-MsgGUID: KS9U4KFwRPm53klmPVDpZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136818602"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 May 2025 21:11:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDbYh-000CmV-0i;
	Sat, 10 May 2025 04:11:31 +0000
Date: Sat, 10 May 2025 12:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_raid6_rvv_v5 55/70]
 include/linux/percpu-defs.h:225:17: error: dereferencing pointer to
 incomplete type 'struct sbi_dbtr_shmem_entry'
Message-ID: <202505101234.AELZfnZY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_raid6_rvv_v5
head:   9a8fbd482048c0c291edee8359d202d030f24c53
commit: 8fb05f222ccd411de35ca6e6e5302268d23745bd [55/70] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-002-20250510 (https://download.01.org/0day-ci/archive/20250510/202505101234.AELZfnZY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101234.AELZfnZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101234.AELZfnZY-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_smp_setup_sbi_shmem':
   arch/riscv/kernel/hw_breakpoint.c:44:16: error: storage size of 'ret' isn't known
     struct sbiret ret;
                   ^~~
   In file included from include/asm-generic/percpu.h:7:0,
                    from ./arch/riscv/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from arch/riscv/include/asm/bitops.h:14,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/percpu.h:5,
                    from include/asm-generic/local64.h:5,
                    from ./arch/riscv/include/generated/asm/local64.h:1,
                    from include/linux/perf_event.h:26,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:6:
   include/linux/percpu-defs.h:220:52: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
     const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
                                                       ^
   include/linux/percpu-defs.h:238:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:47:15: note: in expansion of macro 'per_cpu_ptr'
     dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
                  ^~~~~~~~~~~
   In file included from include/linux/compiler_types.h:174:0,
                    from <command-line>:0:
>> include/linux/percpu-defs.h:225:17: error: dereferencing pointer to incomplete type 'struct sbi_dbtr_shmem_entry'
     (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
                    ^~~~~~
   include/linux/compiler-gcc.h:34:34: note: in definition of macro 'RELOC_HIDE'
     __asm__ ("" : "=r"(__ptr) : "0"(ptr));    \
                                     ^~~
   include/linux/percpu-defs.h:225:3: note: in expansion of macro 'TYPEOF_UNQUAL'
     (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:234:13: note: in expansion of macro 'PERCPU_PTR'
     RELOC_HIDE(PERCPU_PTR(__p), (__offset))
                ^~~~~~~~~~
   include/linux/percpu-defs.h:239:2: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));   \
     ^~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:47:15: note: in expansion of macro 'per_cpu_ptr'
     dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
                  ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:55:8: error: implicit declaration of function 'sbi_ecall'; did you mean 'si_syscall'? [-Werror=implicit-function-declaration]
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
           ^~~~~~~~~
           si_syscall
   arch/riscv/kernel/hw_breakpoint.c:55:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
                     ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:55:18: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/kernel/hw_breakpoint.c:55:32: error: 'SBI_EXT_DBTR_SETUP_SHMEM' undeclared (first use in this function); did you mean 'SBI_EXT_DBTR'?
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
                                   SBI_EXT_DBTR
   arch/riscv/kernel/hw_breakpoint.c:60:8: error: 'SBI_ERR_DENIED' undeclared (first use in this function); did you mean 'SBI_EXT_DBTR'?
      case SBI_ERR_DENIED:
           ^~~~~~~~~~~~~~
           SBI_EXT_DBTR
   arch/riscv/kernel/hw_breakpoint.c:66:8: error: 'SBI_ERR_INVALID_PARAM' undeclared (first use in this function)
      case SBI_ERR_INVALID_PARAM:
           ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:67:8: error: 'SBI_ERR_INVALID_ADDRESS' undeclared (first use in this function); did you mean 'SBI_ERR_INVALID_PARAM'?
      case SBI_ERR_INVALID_ADDRESS:
           ^~~~~~~~~~~~~~~~~~~~~~~
           SBI_ERR_INVALID_PARAM
   arch/riscv/kernel/hw_breakpoint.c:73:8: error: 'SBI_ERR_ALREADY_AVAILABLE' undeclared (first use in this function); did you mean 'DL_STATE_AVAILABLE'?
      case SBI_ERR_ALREADY_AVAILABLE:
           ^~~~~~~~~~~~~~~~~~~~~~~~~
           DL_STATE_AVAILABLE
   arch/riscv/kernel/hw_breakpoint.c:79:8: error: 'SBI_ERR_FAILURE' undeclared (first use in this function); did you mean 'IS_ERR_VALUE'?
      case SBI_ERR_FAILURE:
           ^~~~~~~~~~~~~~~
           IS_ERR_VALUE
   arch/riscv/kernel/hw_breakpoint.c:44:16: warning: unused variable 'ret' [-Wunused-variable]
     struct sbiret ret;
                   ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_smp_teardown_sbi_shmem':
   arch/riscv/kernel/hw_breakpoint.c:99:16: error: storage size of 'ret' isn't known
     struct sbiret ret;
                   ^~~
   arch/riscv/kernel/hw_breakpoint.c:102:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
                     ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:102:32: error: 'SBI_EXT_DBTR_SETUP_SHMEM' undeclared (first use in this function); did you mean 'SBI_EXT_DBTR'?
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
                                   SBI_EXT_DBTR
   arch/riscv/kernel/hw_breakpoint.c:107:8: error: 'SBI_ERR_DENIED' undeclared (first use in this function); did you mean 'SBI_EXT_DBTR'?
      case SBI_ERR_DENIED:
           ^~~~~~~~~~~~~~
           SBI_EXT_DBTR
   arch/riscv/kernel/hw_breakpoint.c:112:8: error: 'SBI_ERR_INVALID_PARAM' undeclared (first use in this function)
      case SBI_ERR_INVALID_PARAM:
           ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:113:8: error: 'SBI_ERR_INVALID_ADDRESS' undeclared (first use in this function); did you mean 'SBI_ERR_INVALID_PARAM'?
      case SBI_ERR_INVALID_ADDRESS:
           ^~~~~~~~~~~~~~~~~~~~~~~
           SBI_ERR_INVALID_PARAM
   arch/riscv/kernel/hw_breakpoint.c:118:8: error: 'SBI_ERR_ALREADY_AVAILABLE' undeclared (first use in this function); did you mean 'DL_STATE_AVAILABLE'?
      case SBI_ERR_ALREADY_AVAILABLE:
           ^~~~~~~~~~~~~~~~~~~~~~~~~
           DL_STATE_AVAILABLE
   arch/riscv/kernel/hw_breakpoint.c:122:8: error: 'SBI_ERR_FAILURE' undeclared (first use in this function); did you mean 'IS_ERR_VALUE'?
      case SBI_ERR_FAILURE:
           ^~~~~~~~~~~~~~~
           IS_ERR_VALUE
   arch/riscv/kernel/hw_breakpoint.c:99:16: warning: unused variable 'ret' [-Wunused-variable]
     struct sbiret ret;
                   ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'init_sbi_dbtr':
   arch/riscv/kernel/hw_breakpoint.c:140:16: error: storage size of 'ret' isn't known
     struct sbiret ret;
                   ^~~
   arch/riscv/kernel/hw_breakpoint.c:142:6: error: implicit declaration of function 'sbi_probe_extension'; did you mean 'radix_tree_exception'? [-Werror=implicit-function-declaration]
     if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
         ^~~~~~~~~~~~~~~~~~~
         radix_tree_exception
   arch/riscv/kernel/hw_breakpoint.c:142:26: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
                             ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:148:32: error: 'SBI_EXT_DBTR_NUM_TRIGGERS' undeclared (first use in this function)
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:140:16: warning: unused variable 'ret' [-Wunused-variable]
     struct sbiret ret;
                   ^~~
   In file included from include/asm-generic/percpu.h:7:0,
                    from ./arch/riscv/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from arch/riscv/include/asm/bitops.h:14,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/percpu.h:5,
                    from include/asm-generic/local64.h:5,
                    from ./arch/riscv/include/generated/asm/local64.h:1,
                    from include/linux/perf_event.h:26,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:6:
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_install_hw_breakpoint':
   include/linux/percpu-defs.h:220:52: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
     const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
                                                       ^
   include/linux/percpu-defs.h:244:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:255:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:428:39: note: in expansion of macro 'this_cpu_ptr'
     struct sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
                                          ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:433:16: error: storage size of 'ret' isn't known
     struct sbiret ret;
                   ^~~
>> arch/riscv/kernel/hw_breakpoint.c:441:6: error: dereferencing pointer to incomplete type 'struct sbi_dbtr_data_msg'
     xmit->tdata1 = cpu_to_le(bp->tdata1);
         ^~
   arch/riscv/kernel/hw_breakpoint.c:445:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
                     ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:445:32: error: 'SBI_EXT_DBTR_TRIG_INSTALL' undeclared (first use in this function)
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/byteorder/little_endian.h:5:0,
                    from arch/riscv/include/uapi/asm/byteorder.h:10,
                    from include/uapi/linux/perf_event.h:20,
                    from include/linux/perf_event.h:17,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:6:
>> arch/riscv/kernel/hw_breakpoint.c:454:22: error: dereferencing pointer to incomplete type 'struct sbi_dbtr_id_msg'
     idx = le_to_cpu(recv->idx);
                         ^
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__le64_to_cpu'
    #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
                                                      ^
   arch/riscv/include/asm/hw_breakpoint.h:17:19: note: in expansion of macro 'le64_to_cpu'
    #define le_to_cpu le64_to_cpu
                      ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:454:8: note: in expansion of macro 'le_to_cpu'
     idx = le_to_cpu(recv->idx);
           ^~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:433:16: warning: unused variable 'ret' [-Wunused-variable]
     struct sbiret ret;
                   ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_uninstall_hw_breakpoint':
   arch/riscv/kernel/hw_breakpoint.c:482:16: error: storage size of 'ret' isn't known
     struct sbiret ret;
                   ^~~
   arch/riscv/kernel/hw_breakpoint.c:499:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
                     ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:499:32: error: 'SBI_EXT_DBTR_TRIG_UNINSTALL' undeclared (first use in this function); did you mean 'RV_DBTR_TRIG_MCONTROL'?
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   RV_DBTR_TRIG_MCONTROL
   arch/riscv/kernel/hw_breakpoint.c:482:16: warning: unused variable 'ret' [-Wunused-variable]
     struct sbiret ret;
                   ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_enable_hw_breakpoint':
   arch/riscv/kernel/hw_breakpoint.c:507:16: error: storage size of 'ret' isn't known
     struct sbiret ret;
                   ^~~
   arch/riscv/kernel/hw_breakpoint.c:523:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
                     ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:523:32: error: 'SBI_EXT_DBTR_TRIG_ENABLE' undeclared (first use in this function); did you mean 'RV_DBTR_TRIG_NONE'?
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
                                   RV_DBTR_TRIG_NONE
   arch/riscv/kernel/hw_breakpoint.c:507:16: warning: unused variable 'ret' [-Wunused-variable]
     struct sbiret ret;
                   ^~~
   In file included from include/asm-generic/percpu.h:7:0,
                    from ./arch/riscv/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from arch/riscv/include/asm/bitops.h:14,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/percpu.h:5,
                    from include/asm-generic/local64.h:5,
                    from ./arch/riscv/include/generated/asm/local64.h:1,
                    from include/linux/perf_event.h:26,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:6:
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_update_hw_breakpoint':
   include/linux/percpu-defs.h:220:52: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
     const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
                                                       ^
   include/linux/percpu-defs.h:244:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:255:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:536:39: note: in expansion of macro 'this_cpu_ptr'
     struct sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
                                          ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:539:16: error: storage size of 'ret' isn't known
     struct sbiret ret;
                   ^~~
   arch/riscv/kernel/hw_breakpoint.c:558:6: error: dereferencing pointer to incomplete type 'struct sbi_dbtr_data_msg'
     xmit->tdata1 = cpu_to_le(bp->tdata1);
         ^~
   arch/riscv/kernel/hw_breakpoint.c:562:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
                     ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:562:32: error: 'SBI_EXT_DBTR_TRIG_UPDATE' undeclared (first use in this function); did you mean 'SBI_EXT_DBTR'?
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
                                   SBI_EXT_DBTR
   arch/riscv/kernel/hw_breakpoint.c:539:16: warning: unused variable 'ret' [-Wunused-variable]
     struct sbiret ret;
                   ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_disable_hw_breakpoint':
   arch/riscv/kernel/hw_breakpoint.c:574:16: error: storage size of 'ret' isn't known
     struct sbiret ret;
                   ^~~
   arch/riscv/kernel/hw_breakpoint.c:589:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
                     ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:589:32: error: 'SBI_EXT_DBTR_TRIG_DISABLE' undeclared (first use in this function)
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:574:16: warning: unused variable 'ret' [-Wunused-variable]
     struct sbiret ret;
                   ^~~


vim +225 include/linux/percpu-defs.h

9c28278a24c01c Tejun Heo   2014-06-17  223  
001217defda86d Uros Bizjak 2024-10-21  224  #define PERCPU_PTR(__p)							\
6a39fe05ecaa39 Uros Bizjak 2025-01-27 @225  	(TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
001217defda86d Uros Bizjak 2024-10-21  226  
62fde54123fb64 Tejun Heo   2014-06-17  227  #ifdef CONFIG_SMP
62fde54123fb64 Tejun Heo   2014-06-17  228  
62fde54123fb64 Tejun Heo   2014-06-17  229  /*
001217defda86d Uros Bizjak 2024-10-21  230   * Add an offset to a pointer.  Use RELOC_HIDE() to prevent the compiler
001217defda86d Uros Bizjak 2024-10-21  231   * from making incorrect assumptions about the pointer value.
62fde54123fb64 Tejun Heo   2014-06-17  232   */
eba117889ac444 Tejun Heo   2014-06-17  233  #define SHIFT_PERCPU_PTR(__p, __offset)					\
001217defda86d Uros Bizjak 2024-10-21  234  	RELOC_HIDE(PERCPU_PTR(__p), (__offset))
6fbc07bbe2b5a8 Tejun Heo   2014-06-17  235  
6fbc07bbe2b5a8 Tejun Heo   2014-06-17  236  #define per_cpu_ptr(ptr, cpu)						\
eba117889ac444 Tejun Heo   2014-06-17  237  ({									\
6fbc07bbe2b5a8 Tejun Heo   2014-06-17 @238  	__verify_pcpu_ptr(ptr);						\
6fbc07bbe2b5a8 Tejun Heo   2014-06-17  239  	SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));			\
62fde54123fb64 Tejun Heo   2014-06-17  240  })
62fde54123fb64 Tejun Heo   2014-06-17  241  

:::::: The code at line 225 was first introduced by commit
:::::: 6a39fe05ecaa3946ed0af9efd3e56689d519e420 percpu: use TYPEOF_UNQUAL() in *_cpu_ptr() accessors

:::::: TO: Uros Bizjak <ubizjak@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
