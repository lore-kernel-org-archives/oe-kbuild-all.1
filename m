Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ADB3CB2FA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 22:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782943699; cv=none; b=UtBTtiXaQOyr7qucqFqjAlSsWMA7KtVz4PZVohCE9SSnR3F8fL3YDLBxzw5i26KfYDafYWevOkBfHB14z+JpDq5wpcGyBXCUenRnzlAqDewyKuklu+axmn6WYPqovdj87VRFCNJxsHpVxcd0FAQHkBL68MGRDfI3l8MF118yRes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782943699; c=relaxed/simple;
	bh=hjff3CdZJcGBbfilOdm+bfXpBj0rNO1QeZ5aHbQ5ivs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sf0t2mqeBp1y0V8OUReoOfN5GyXF5oEpcPU4uRncXA8YNxrUxMzoib9ck1Cm04Y8FPFjnEnT707A70l2G2x1twjQuk5Py8Oa7Q3DcBLZQ6OIRdTrLjELcyVuiuy/FKclEfp2ODznK5RFo7GoRD+MVslNymvEBzHPnS7N5cZfteo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IjSkWerq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjSkWerq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782943694; x=1814479694;
  h=date:from:to:cc:subject:message-id;
  bh=hjff3CdZJcGBbfilOdm+bfXpBj0rNO1QeZ5aHbQ5ivs=;
  b=IjSkWerqj3U63Peze2w09uFMgiVB7hwdIOwd+VLn+LnloGYZ+cNdJyHy
   2deoLgHUyJgJqFZ5gtQ0RW+stWxbXesFaP0DcMdADBwKkI2CFAKcQZZd6
   BTaxXi6vBN/W0itR6+6v+EXpxGIQvO82J1sX+Qo4d3Tj9uG+OmOviBGSW
   WjsausjUtN+vfzgVRqN59n2Fu6YsAUMBXyrHl2sR63j5yl+0rEfH8/Pfx
   NsDGGdP9R5X7sak9l9n73Pgf2NsYlCW5wZJuI7dddiNYcyfoNrzB4MYJv
   pZ6wy1LTwUGk5RiqhzJaF8LIvFvLDVdsKw30vyrCH0N6buPNKVvu1m9gT
   A==;
X-CSE-ConnectionGUID: o542o2n6SzCDtAFZAq170w==
X-CSE-MsgGUID: mN+ybN2VQWqcvKG1ElBMYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94846681"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="94846681"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 15:08:10 -0700
X-CSE-ConnectionGUID: 2Ovwvp1yThywqqFMTc1/ew==
X-CSE-MsgGUID: kQaeCK2xQJ2ceu92OQGoEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="282756105"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Jul 2026 15:08:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf36C-000000009fn-1NXs;
	Wed, 01 Jul 2026 22:08:04 +0000
Date: Thu, 02 Jul 2026 06:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_dbtr_v3 63/64]
 arch/riscv/kernel/hw_breakpoint.c:634:17: warning: assignment to 'union
 sbi_dbtr_shmem_entry *' from 'int' makes pointer from integer without a cast
Message-ID: <202607020528.akxwXuSm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v3
head:   dc427f45c78ef4a4158898a13df1e1119af95be3
commit: b85d9f545481fd4c956f5bc45ec5c6e2cb3d72ab [63/64] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r111-20260701 (https://download.01.org/0day-ci/archive/20260702/202607020528.akxwXuSm-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020528.akxwXuSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020528.akxwXuSm-lkp@intel.com/

All warnings (new ones prefixed by >>):

                    from arch/riscv/include/uapi/asm/byteorder.h:10,
                    from include/uapi/linux/perf_event.h:20,
                    from include/linux/perf_event.h:17,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:6:
   arch/riscv/kernel/hw_breakpoint.c:454:22: error: dereferencing pointer to incomplete type 'struct sbi_dbtr_id_msg'
     idx = le_to_cpu(recv->idx);
                         ^~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                      ^
   arch/riscv/include/asm/hw_breakpoint.h:20:19: note: in expansion of macro 'le32_to_cpu'
    #define le_to_cpu le32_to_cpu
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
   In file included from include/asm-generic/percpu.h:9,
                    from ./arch/riscv/include/generated/asm/percpu.h:1,
                    from include/linux/alloc_tag.h:12,
                    from include/linux/percpu.h:5,
                    from include/asm-generic/local64.h:5,
                    from ./arch/riscv/include/generated/asm/local64.h:1,
                    from include/linux/perf_event.h:26,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:6:
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_update_hw_breakpoint':
   include/linux/percpu-defs.h:221:52: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
                                                       ^
   include/linux/percpu-defs.h:245:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:256:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:536:38: note: in expansion of macro 'this_cpu_ptr'
     union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
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
>> arch/riscv/kernel/hw_breakpoint.c:634:17: warning: assignment to 'union sbi_dbtr_shmem_entry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
