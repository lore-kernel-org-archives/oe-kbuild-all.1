Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782BB139D0A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 10:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748340118; cv=none; b=nRoYOn3TCc4RORj/HeDJEIf0mb7a83nL3+8YM3G1u9vW5wDy7NdDLrU3I6iX7B+nO6u6MCh2L0UTHtjU4w28CO0ciMCTkgkacrClzIXLyzn/0c+hnnd6vc+VpdlXeQasEoRgR58s2nzMiZeiBqm+B/rjQRuxpJOaaDiFtBplqLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748340118; c=relaxed/simple;
	bh=zx9SMKIOMacTDSXxzVZpAYuLy7yPsHnIxficb4Zudmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oa4YA1Wd3300TrSmgRnXinGA6EnM59a0O/TTFbdD+1NuPrf1uWUGc0VwUqMYAJWXYQ1fRK7VGapcl0KCxu/DPUPwUCo+6LAUzu08P5dioWjEgLl5xVHmhpu5DpM0FW9GJw0hB0o/zEtOvVzz34pXnsLAi5oCjtNB5FTAA+Eb7nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZD/acssz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZD/acssz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748340117; x=1779876117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zx9SMKIOMacTDSXxzVZpAYuLy7yPsHnIxficb4Zudmk=;
  b=ZD/acssz213ACqB+J9znD3Mzzif/UelUw4dtalhrPzITeMbpD4QCgmXN
   8IJqxKaeP9eusvb/a+5YBqe5vd390etmtEgkWdA/ZvNVOIYe65usIAW+g
   l8cmDFzQK0JeK1dTxiERfQDlZFQbXyfEi6TUfTPxPisCCPZx0p0fCQ9pg
   vFgq9BXpMJmlUUsu0AQbE6aB1OyFSs14XQXChx9mYRaQN7ixOPgXa/ecT
   E3ix43LUSiBRZxReC42x1GG0bPiCpBP5gkAnK4Ma2lpIPq95OD3q7oHxI
   r5WR20kXtc7qqzGYn4uFEGzrdaQSTXPtTTdy03ORx3vXAxb2pLGcRAh1y
   A==;
X-CSE-ConnectionGUID: N5wQdvs1Q3+OUC/NP8hBew==
X-CSE-MsgGUID: yASsddPtRhij1K9KQHK2hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60953447"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="60953447"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 03:01:56 -0700
X-CSE-ConnectionGUID: RRQZ7YkbTKiAK1x0+OdIfA==
X-CSE-MsgGUID: 35Oam1XlTS+Zkv2kH1FFBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="142599908"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 May 2025 03:01:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJr84-000T6G-1v;
	Tue, 27 May 2025 10:01:52 +0000
Date: Tue, 27 May 2025 18:01:16 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_defconfig_v1 54/77]
 arch/riscv/kernel/hw_breakpoint.c:634:17: warning: assignment to 'struct
 sbi_dbtr_shmem_entry *' from 'int' makes pointer from integer without a cast
Message-ID: <202505271712.BcHHXCiC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_defconfig_v1
head:   bd9f757ef4bfde0edc1b68dd9af6e35e1f999fb3
commit: 6c28c1fa733b31e13c67fe27dbe07da70e0eed58 [54/77] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r052-20250527 (https://download.01.org/0day-ci/archive/20250527/202505271712.BcHHXCiC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271712.BcHHXCiC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271712.BcHHXCiC-lkp@intel.com/

All warnings (new ones prefixed by >>):

                    from arch/riscv/kernel/hw_breakpoint.c:6:
   arch/riscv/kernel/hw_breakpoint.c:454:22: error: dereferencing pointer to incomplete type 'struct sbi_dbtr_id_msg'
     idx = le_to_cpu(recv->idx);
                         ^~
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
   In file included from include/asm-generic/percpu.h:7,
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
   include/linux/percpu-defs.h:251:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
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
   arch/riscv/kernel/hw_breakpoint.c:562:32: error: 'SBI_EXT_DBTR_TRIG_UPDATE' undeclared (first use in this function); did you mean 'RV_DBTR_TRIG_LEGACY'?
     ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
                                   RV_DBTR_TRIG_LEGACY
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
>> arch/riscv/kernel/hw_breakpoint.c:634:17: warning: assignment to 'struct sbi_dbtr_shmem_entry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
