Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1682A156F5D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 02:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746843447; cv=none; b=jMlWx7DGNv5Yi8ct5yxJ1tM07zacnAXLWqKB0S2kaIh1XH7kwEoLLvD0zYYLat943vwlwixMixP7RhZz7qyHJbM9mfUdJmIkiLPt1U9acg9d5ruTrMve7xyF0K8+ILjDhH4Z6bibpMdmHg0oG316mXsvegMkLnsyZrtYk9r4VLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746843447; c=relaxed/simple;
	bh=pcZ1RIlRUBPADVI1thBZSt8zstD/xxF+WnLqyye29aU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qc1m0fyb5UJEFbZvqhKnLjvtudgEGysbSaFPOCBIz+Ksr6xJlsPXQEg1mA1dVMDagM+xpDiUIazBxSZ64LSTHqUwlvdksw5HxEtoBb+5e1TuducISXhvx/F6ruO+1ph9mi6XBi5qISNgu3CyAwxsfiEaxSOJegL1e0vq4I2ZNvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncZ6FzGp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncZ6FzGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746843445; x=1778379445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pcZ1RIlRUBPADVI1thBZSt8zstD/xxF+WnLqyye29aU=;
  b=ncZ6FzGpRo0BiKNzy0G+FrIsiMzJFbxePzLwo2dWUBs1/IqemAPanBJ3
   YUptoXSZ5TyrbkBSkoV6+RSxuauWAa72ekpVJxhPaY+oFT3xZBgdEQWuR
   1L8NQDi2OqZLYJNdqXeFAfH/yAlis9zwv9+rtC01wceNkureK5u1H9IR2
   ZLY0zfosqzOBq67jDA4m/zhVko0WhUnd0/x41Xf8KhtVU6FhgnpNKWxdc
   YhHG8jNOL4O4hyJ9LmonYEUbXWOXFzBHFdvcvDYl8GayNM1CputTxCT9I
   sjPYC6I6rhSFFS2kDd+NfyxazHgnNeJl/QqwN0gdJL1CzPvf7XVDZWnum
   g==;
X-CSE-ConnectionGUID: FtVh+uIeTw+yZTkrYndhTg==
X-CSE-MsgGUID: 93INIJYqTzq9ns4/cnhj2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71199385"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="71199385"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 19:17:24 -0700
X-CSE-ConnectionGUID: cBRlGQGvSPSS2SJnVBsjHA==
X-CSE-MsgGUID: FIw9BtYiSyyRMBPm1C3VJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="141558850"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 May 2025 19:17:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDZmD-000Chf-0d;
	Sat, 10 May 2025 02:17:21 +0000
Date: Sat, 10 May 2025 10:16:30 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_raid6_rvv_v5 55/70]
 arch/riscv/kernel/hw_breakpoint.c:634:17: warning: assignment makes pointer
 from integer without a cast
Message-ID: <202505101004.fx8OxlZu-lkp@intel.com>
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
config: riscv-randconfig-002-20250510 (https://download.01.org/0day-ci/archive/20250510/202505101004.fx8OxlZu-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101004.fx8OxlZu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101004.fx8OxlZu-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_hw_breakpoint_init':
>> arch/riscv/kernel/hw_breakpoint.c:634:17: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
                    ^
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
