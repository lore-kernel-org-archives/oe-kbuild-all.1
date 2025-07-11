Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13F835950
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 06:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752214791; cv=none; b=CrFYaGzzRbJPVtNKwlQw9tt+DfDzcgjx+3TtLmhW5qsXSYBgNurGnnMMvDQ3X/rdZi2B+7DSEpYykl4B7hTo6NcmcvkzGUh73jR14BUsmHgxx7MJtNJHmWABsWpllhhSUrJWdBUORcpXJD/j4uWHsHWOlKBaCvAkcRM/1ISA3hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752214791; c=relaxed/simple;
	bh=Xeft9UL3BecBaDDtj7Cw1m+XyoxoBLjU7f1ize1aTLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLm8kEX6kbGay8hr2UMQuptji0m+M5Jlj/1RRcJz0xP+fiSns0ZJaQ1Ixv5jHtwVpp06OcxS62M53VbT/t/rru3ceI0d205WL5nFsHi3Y0ukEbE6JChvLSVu453lfeD/gJ5w1hExoMQT+Ivn+ByLdo3SUSF5GUD6tF3qF06Y1Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMXpKi1G; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMXpKi1G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752214790; x=1783750790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xeft9UL3BecBaDDtj7Cw1m+XyoxoBLjU7f1ize1aTLI=;
  b=gMXpKi1GEnw6HO/lQ4QABnDfS11vjifp5KLSeSsYSJSlHeuy9+AD70Fo
   z510X/8vUUxYu2cDU0NTfdweh/4Ugz8Mk7I5Vlpf5EQSqWif6aAypel0q
   9RRn9/1xImh5x8kUm9s+dEBAiU5uqFj6d67K4oPF7YKejZqmLN8QE6Ste
   hibeFCq+BkQoBFuhlwkmictxncqkN8PAgKcePqYcTu/3goIJi/JoEJ1Rh
   i4lRYh/TxhC1vOVTi31W3BB3FbOzbq/r96jgBG0h9uvFclhMn0kcRXxXm
   Cj3ps/LX/V08SyUyEn5FiRTGGiHwJ1atkhw4IO+KUoGNXDOgvkFfnlZNc
   w==;
X-CSE-ConnectionGUID: dDSWaFjgROK7xgAj9LlU8g==
X-CSE-MsgGUID: PhwimVDRQRO7+8DdQFWc/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54444047"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="54444047"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 23:19:49 -0700
X-CSE-ConnectionGUID: ex2GYIAQRhmsaQwDxhpdQg==
X-CSE-MsgGUID: 8mWXecuUQuywnMSAajrwFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="193495968"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jul 2025 23:19:48 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua76n-0005wx-2E;
	Fri, 11 Jul 2025 06:19:45 +0000
Date: Fri, 11 Jul 2025 14:19:26 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 2/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <202507111419.Snh8ePO7-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc5 next-20250710]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himanshu-Chauhan/riscv-Add-SBI-debug-trigger-extension-and-function-ids/20250710-205738
base:   linus/master
patch link:    https://lore.kernel.org/r/20250710125231.653967-3-hchauhan%40ventanamicro.com
patch subject: [PATCH v1 2/2] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r071-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111419.Snh8ePO7-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111419.Snh8ePO7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507111419.Snh8ePO7-lkp@intel.com/

All warnings (new ones prefixed by >>):

                    from ./arch/riscv/include/generated/asm/local64.h:1,
                    from include/linux/perf_event.h:26,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:6:
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_update_hw_breakpoint':
   include/linux/percpu-defs.h:220:52: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
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
   arch/riscv/kernel/hw_breakpoint.c:634:40: error: invalid application of 'sizeof' to incomplete type 'union sbi_dbtr_shmem_entry'
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
   arch/riscv/kernel/hw_breakpoint.c:634:40: error: invalid application of 'sizeof' to incomplete type 'union sbi_dbtr_shmem_entry'
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
   arch/riscv/kernel/hw_breakpoint.c:634:40: error: invalid application of 'sizeof' to incomplete type 'union sbi_dbtr_shmem_entry'
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
>> arch/riscv/kernel/hw_breakpoint.c:634:17: warning: assignment to 'union sbi_dbtr_shmem_entry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     634 |  sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                 ^
   cc1: some warnings being treated as errors


vim +634 arch/riscv/kernel/hw_breakpoint.c

   613	
   614	static int __init arch_hw_breakpoint_init(void)
   615	{
   616		unsigned int cpu;
   617		int rc = 0;
   618	
   619		for_each_possible_cpu(cpu)
   620			raw_spin_lock_init(&per_cpu(ecall_lock, cpu));
   621	
   622		if (!dbtr_init)
   623			init_sbi_dbtr();
   624	
   625		if (dbtr_total_num) {
   626			pr_info("%s: total number of type %d triggers: %u\n",
   627				__func__, dbtr_type, dbtr_total_num);
   628		} else {
   629			pr_info("%s: No hardware triggers available\n", __func__);
   630			goto out;
   631		}
   632	
   633		/* Allocate per-cpu shared memory */
 > 634		sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
