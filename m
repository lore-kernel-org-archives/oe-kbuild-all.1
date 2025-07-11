Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D3279DC5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 09:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752226817; cv=none; b=Vow6SgAHmn/X4fl3TJzTGDwzHE5M8dPCbaQOBjV9c1Z4mbUhnZ7BAC0wTuLeZzaUpJFScKIRp7Yz8Lfw8TUAiVbL+tN+FDvP3mNyAKZLDpD4xJVmegTm0XWdgNnErNxFGzDa4pJQlMJgEblExNzKWJ2+6qKhsC4MKQz8yVBPIhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752226817; c=relaxed/simple;
	bh=Ga7GOdAhaP1O1Sus3SebdGYMRuoaC3eirseVf0Yx1fI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFzPJJMm1ppUN7pE0xlw88gh4ll1XnImNF76MROT5cx272vFuHtJGVxOfDuDLarXoZqtmIJsSWOkUKpJeFmiLJAmumUQK06aJv7lYiO/7qDrww26xnmnURGs7wDuFc0TgMNDlf8DQGJvTmplWo6rr3v4lDz4RrP0iwJ1A6e/wYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeOh6jK+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeOh6jK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752226815; x=1783762815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ga7GOdAhaP1O1Sus3SebdGYMRuoaC3eirseVf0Yx1fI=;
  b=QeOh6jK+03OKA/QLgBIeV0nPJu9+4vPdaKAwgpBM88oInsRjYDYmMZmU
   fxcjFCYeJQs1+an8/H1axr6TYxRucZ7TzHMd3/h3g2vQ237ijQ3+GCpAe
   b2lbmwv6mHxODPWNkshUKl3Dk9NgMZq3zgFum5EAm0rYtbtPod0AXcZWZ
   +gS9dwkCshNfAbZW8eIQ3i2gPhs02DLWu2R7g6ZsrAhqrBZsvSMk1Rjyg
   sa2jx0Qc28PpvlpyOOkvdTOmmJICJtdIocoAMkuZebrZbSfG7PlIVq07Z
   7+fddumovX0S4KMOVpEjbAUh9lpKsYi7W4IvttW9hY1pCEqdd5xtRW12O
   Q==;
X-CSE-ConnectionGUID: KIEsaloRR1SQbOmWtbedTg==
X-CSE-MsgGUID: coeceOBARBeF3Ur7ozWGqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53630318"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="53630318"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 02:40:14 -0700
X-CSE-ConnectionGUID: DdJuxY8PQmuFvlJ2ppyRBw==
X-CSE-MsgGUID: UVnjnROpQQa/So8B3OyVmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="193528615"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jul 2025 02:40:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaAEj-0006Cx-1a;
	Fri, 11 Jul 2025 09:40:09 +0000
Date: Fri, 11 Jul 2025 17:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 2/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <202507111733.mRGg8LQR-lkp@intel.com>
References: <20250710125231.653967-3-hchauhan@ventanamicro.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710125231.653967-3-hchauhan@ventanamicro.com>

Hi Himanshu,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc5 next-20250710]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himanshu-Chauhan/riscv-Add-SBI-debug-trigger-extension-and-function-ids/20250710-205738
base:   linus/master
patch link:    https://lore.kernel.org/r/20250710125231.653967-3-hchauhan%40ventanamicro.com
patch subject: [PATCH v1 2/2] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r071-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111733.mRGg8LQR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111733.mRGg8LQR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507111733.mRGg8LQR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_smp_setup_sbi_shmem':
   arch/riscv/kernel/hw_breakpoint.c:44:16: error: storage size of 'ret' isn't known
      44 |  struct sbiret ret;
         |                ^~~
   In file included from include/asm-generic/percpu.h:7,
                    from ./arch/riscv/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from arch/riscv/include/asm/bitops.h:14,
                    from include/linux/bitops.h:67,
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
>> include/linux/percpu-defs.h:220:52: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     220 |  const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
         |                                                    ^
   include/linux/percpu-defs.h:263:2: note: in expansion of macro '__verify_pcpu_ptr'
     263 |  __verify_pcpu_ptr(ptr);      \
         |  ^~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:47:15: note: in expansion of macro 'per_cpu_ptr'
      47 |  dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
         |               ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:55:8: error: implicit declaration of function 'sbi_ecall' [-Werror=implicit-function-declaration]
      55 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |        ^~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:55:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
      55 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                  ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:55:18: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/kernel/hw_breakpoint.c:55:32: error: 'SBI_EXT_DBTR_SETUP_SHMEM' undeclared (first use in this function)
      55 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:60:8: error: 'SBI_ERR_DENIED' undeclared (first use in this function)
      60 |   case SBI_ERR_DENIED:
         |        ^~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:66:8: error: 'SBI_ERR_INVALID_PARAM' undeclared (first use in this function)
      66 |   case SBI_ERR_INVALID_PARAM:
         |        ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:67:8: error: 'SBI_ERR_INVALID_ADDRESS' undeclared (first use in this function)
      67 |   case SBI_ERR_INVALID_ADDRESS:
         |        ^~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:73:8: error: 'SBI_ERR_ALREADY_AVAILABLE' undeclared (first use in this function)
      73 |   case SBI_ERR_ALREADY_AVAILABLE:
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:79:8: error: 'SBI_ERR_FAILURE' undeclared (first use in this function)
      79 |   case SBI_ERR_FAILURE:
         |        ^~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:44:16: warning: unused variable 'ret' [-Wunused-variable]
      44 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_smp_teardown_sbi_shmem':
   arch/riscv/kernel/hw_breakpoint.c:99:16: error: storage size of 'ret' isn't known
      99 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c:102:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     102 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                  ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:102:32: error: 'SBI_EXT_DBTR_SETUP_SHMEM' undeclared (first use in this function)
     102 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:107:8: error: 'SBI_ERR_DENIED' undeclared (first use in this function)
     107 |   case SBI_ERR_DENIED:
         |        ^~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:112:8: error: 'SBI_ERR_INVALID_PARAM' undeclared (first use in this function)
     112 |   case SBI_ERR_INVALID_PARAM:
         |        ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:113:8: error: 'SBI_ERR_INVALID_ADDRESS' undeclared (first use in this function)
     113 |   case SBI_ERR_INVALID_ADDRESS:
         |        ^~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:118:8: error: 'SBI_ERR_ALREADY_AVAILABLE' undeclared (first use in this function)
     118 |   case SBI_ERR_ALREADY_AVAILABLE:
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:122:8: error: 'SBI_ERR_FAILURE' undeclared (first use in this function)
     122 |   case SBI_ERR_FAILURE:
         |        ^~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:99:16: warning: unused variable 'ret' [-Wunused-variable]
      99 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'init_sbi_dbtr':
   arch/riscv/kernel/hw_breakpoint.c:140:16: error: storage size of 'ret' isn't known
     140 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c:142:6: error: implicit declaration of function 'sbi_probe_extension' [-Werror=implicit-function-declaration]
     142 |  if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
         |      ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:142:26: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     142 |  if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
         |                          ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:148:32: error: 'SBI_EXT_DBTR_NUM_TRIGGERS' undeclared (first use in this function)
     148 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:140:16: warning: unused variable 'ret' [-Wunused-variable]
     140 |  struct sbiret ret;
         |                ^~~
   In file included from include/asm-generic/percpu.h:7,
                    from ./arch/riscv/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from arch/riscv/include/asm/bitops.h:14,
                    from include/linux/bitops.h:67,
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
>> include/linux/percpu-defs.h:220:52: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     220 |  const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
         |                                                    ^
   include/linux/percpu-defs.h:263:2: note: in expansion of macro '__verify_pcpu_ptr'
     263 |  __verify_pcpu_ptr(ptr);      \
         |  ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
     267 | #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
         |                          ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
     268 | #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
         |                           ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:428:38: note: in expansion of macro 'this_cpu_ptr'
     428 |  union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
         |                                      ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:433:16: error: storage size of 'ret' isn't known
     433 |  struct sbiret ret;
         |                ^~~
>> arch/riscv/kernel/hw_breakpoint.c:439:15: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     439 |  xmit = &shmem->data;
         |               ^~
   arch/riscv/kernel/hw_breakpoint.c:440:15: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     440 |  recv = &shmem->id;
         |               ^~
   arch/riscv/kernel/hw_breakpoint.c:441:6: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     441 |  xmit->tdata1 = cpu_to_le(bp->tdata1);
         |      ^~
   arch/riscv/kernel/hw_breakpoint.c:442:6: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     442 |  xmit->tdata2 = cpu_to_le(bp->tdata2);
         |      ^~
   arch/riscv/kernel/hw_breakpoint.c:443:6: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     443 |  xmit->tdata3 = cpu_to_le(bp->tdata3);
         |      ^~
   arch/riscv/kernel/hw_breakpoint.c:445:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     445 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
         |                  ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:445:32: error: 'SBI_EXT_DBTR_TRIG_INSTALL' undeclared (first use in this function)
     445 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/riscv/include/uapi/asm/byteorder.h:10,
                    from include/uapi/linux/perf_event.h:20,
                    from include/linux/perf_event.h:17,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:6:
   arch/riscv/kernel/hw_breakpoint.c:454:22: error: invalid use of undefined type 'struct sbi_dbtr_id_msg'
     454 |  idx = le_to_cpu(recv->idx);
         |                      ^~
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__le64_to_cpu'
      33 | #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
         |                                                   ^
   arch/riscv/include/asm/hw_breakpoint.h:17:19: note: in expansion of macro 'le64_to_cpu'
      17 | #define le_to_cpu le64_to_cpu
         |                   ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:454:8: note: in expansion of macro 'le_to_cpu'
     454 |  idx = le_to_cpu(recv->idx);
         |        ^~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:433:16: warning: unused variable 'ret' [-Wunused-variable]
     433 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_uninstall_hw_breakpoint':
   arch/riscv/kernel/hw_breakpoint.c:482:16: error: storage size of 'ret' isn't known
     482 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c:499:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     499 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
         |                  ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:499:32: error: 'SBI_EXT_DBTR_TRIG_UNINSTALL' undeclared (first use in this function)
     499 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:482:16: warning: unused variable 'ret' [-Wunused-variable]
     482 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_enable_hw_breakpoint':
   arch/riscv/kernel/hw_breakpoint.c:507:16: error: storage size of 'ret' isn't known
     507 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c:523:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     523 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
         |                  ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:523:32: error: 'SBI_EXT_DBTR_TRIG_ENABLE' undeclared (first use in this function)
     523 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:507:16: warning: unused variable 'ret' [-Wunused-variable]
     507 |  struct sbiret ret;
         |                ^~~
   In file included from include/asm-generic/percpu.h:7,
                    from ./arch/riscv/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from arch/riscv/include/asm/bitops.h:14,
                    from include/linux/bitops.h:67,
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
>> include/linux/percpu-defs.h:220:52: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     220 |  const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
         |                                                    ^
   include/linux/percpu-defs.h:263:2: note: in expansion of macro '__verify_pcpu_ptr'
     263 |  __verify_pcpu_ptr(ptr);      \
         |  ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
     267 | #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
         |                          ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
     268 | #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
         |                           ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:536:38: note: in expansion of macro 'this_cpu_ptr'
     536 |  union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
         |                                      ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:539:16: error: storage size of 'ret' isn't known
     539 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c:557:15: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     557 |  xmit = &shmem->data;
         |               ^~
   arch/riscv/kernel/hw_breakpoint.c:558:6: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     558 |  xmit->tdata1 = cpu_to_le(bp->tdata1);
         |      ^~
   arch/riscv/kernel/hw_breakpoint.c:559:6: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     559 |  xmit->tdata2 = cpu_to_le(bp->tdata2);
         |      ^~
   arch/riscv/kernel/hw_breakpoint.c:560:6: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     560 |  xmit->tdata3 = cpu_to_le(bp->tdata3);
         |      ^~
   arch/riscv/kernel/hw_breakpoint.c:562:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     562 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
         |                  ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:562:32: error: 'SBI_EXT_DBTR_TRIG_UPDATE' undeclared (first use in this function)
     562 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:539:16: warning: unused variable 'ret' [-Wunused-variable]
     539 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_disable_hw_breakpoint':
   arch/riscv/kernel/hw_breakpoint.c:574:16: error: storage size of 'ret' isn't known
     574 |  struct sbiret ret;
         |                ^~~
   arch/riscv/kernel/hw_breakpoint.c:589:18: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     589 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
         |                  ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:589:32: error: 'SBI_EXT_DBTR_TRIG_DISABLE' undeclared (first use in this function)
     589 |  ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:574:16: warning: unused variable 'ret' [-Wunused-variable]
     574 |  struct sbiret ret;
         |                ^~~
   In file included from include/linux/percpu.h:5,
                    from include/asm-generic/local64.h:5,
                    from ./arch/riscv/include/generated/asm/local64.h:1,
                    from include/linux/perf_event.h:26,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:6:
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_hw_breakpoint_init':
>> arch/riscv/kernel/hw_breakpoint.c:634:40: error: invalid application of 'sizeof' to incomplete type 'union sbi_dbtr_shmem_entry'
     634 |  sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                                        ^
   include/linux/alloc_tag.h:239:9: note: in definition of macro 'alloc_hooks_tag'
     239 |  typeof(_do_alloc) _res;      \
         |         ^~~~~~~~~
   include/linux/percpu.h:142:2: note: in expansion of macro 'alloc_hooks'
     142 |  alloc_hooks(pcpu_alloc_noprof(_size, _align, false, GFP_KERNEL))
         |  ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:634:19: note: in expansion of macro '__alloc_percpu'
     634 |  sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                   ^~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:634:40: error: invalid application of 'sizeof' to incomplete type 'union sbi_dbtr_shmem_entry'
     634 |  sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                                        ^
   include/linux/alloc_tag.h:243:10: note: in definition of macro 'alloc_hooks_tag'
     243 |   _res = _do_alloc;     \
         |          ^~~~~~~~~
   include/linux/percpu.h:142:2: note: in expansion of macro 'alloc_hooks'
     142 |  alloc_hooks(pcpu_alloc_noprof(_size, _align, false, GFP_KERNEL))
         |  ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:634:19: note: in expansion of macro '__alloc_percpu'
     634 |  sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                   ^~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:634:40: error: invalid application of 'sizeof' to incomplete type 'union sbi_dbtr_shmem_entry'
     634 |  sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                                        ^
   include/linux/alloc_tag.h:246:10: note: in definition of macro 'alloc_hooks_tag'
     246 |   _res = _do_alloc;     \
         |          ^~~~~~~~~
   include/linux/percpu.h:142:2: note: in expansion of macro 'alloc_hooks'
     142 |  alloc_hooks(pcpu_alloc_noprof(_size, _align, false, GFP_KERNEL))
         |  ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:634:19: note: in expansion of macro '__alloc_percpu'
     634 |  sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                   ^~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:634:17: warning: assignment to 'union sbi_dbtr_shmem_entry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     634 |  sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                 ^
   cc1: some warnings being treated as errors


vim +220 include/linux/percpu-defs.h

62fde54123fb64 Tejun Heo 2014-06-17  206  
9c28278a24c01c Tejun Heo 2014-06-17  207  /*
6fbc07bbe2b5a8 Tejun Heo 2014-06-17  208   * __verify_pcpu_ptr() verifies @ptr is a percpu pointer without evaluating
6fbc07bbe2b5a8 Tejun Heo 2014-06-17  209   * @ptr and is invoked once before a percpu area is accessed by all
6fbc07bbe2b5a8 Tejun Heo 2014-06-17  210   * accessors and operations.  This is performed in the generic part of
6fbc07bbe2b5a8 Tejun Heo 2014-06-17  211   * percpu and arch overrides don't need to worry about it; however, if an
6fbc07bbe2b5a8 Tejun Heo 2014-06-17  212   * arch wants to implement an arch-specific percpu accessor or operation,
6fbc07bbe2b5a8 Tejun Heo 2014-06-17  213   * it may use __verify_pcpu_ptr() to verify the parameters.
9c28278a24c01c Tejun Heo 2014-06-17  214   *
9c28278a24c01c Tejun Heo 2014-06-17  215   * + 0 is required in order to convert the pointer type from a
9c28278a24c01c Tejun Heo 2014-06-17  216   * potential array type to a pointer to a single item of the array.
9c28278a24c01c Tejun Heo 2014-06-17  217   */
eba117889ac444 Tejun Heo 2014-06-17  218  #define __verify_pcpu_ptr(ptr)						\
eba117889ac444 Tejun Heo 2014-06-17  219  do {									\
9c28278a24c01c Tejun Heo 2014-06-17 @220  	const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;	\
9c28278a24c01c Tejun Heo 2014-06-17  221  	(void)__vpp_verify;						\
9c28278a24c01c Tejun Heo 2014-06-17  222  } while (0)
9c28278a24c01c Tejun Heo 2014-06-17  223  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
