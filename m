Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C60F2DB783
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 23:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160022; cv=none; b=RfM9uHEZMREO4erIxAyA8mCa8b6qUsDjGmt4/vBGK2gn1VxSNDT/TLzO5GQGi4p8w44HTRqYTbVc+ccnMqbkxiropUsBa1B7bqNolzeiuJSowW+fB/UTkUOmL2Teu2LYEOGrZ8RzYo9QewqIqu3wxUmUQCN+RYzY6DMZcB1Ptiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160022; c=relaxed/simple;
	bh=xl93z3hVwihaQuqWYx+Jq5lq+ONsoc5yS94FzDGLbSk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lwmqZSUMVju4dmJcYSDIStGwjVqaoiBJsbFlkY8T+FSm+fYqRuHuYm5GzAk95xc+I2KD3bAxsJmb1BrK6pseTlMumemQqIuChYv/HQ3xVWLABR8rMQqupx98RjQJ5WImFNZ1U3MLKFCCw2zWzo6zE9wFv8MsxVlwc5iCYY4CTlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wn3fypd1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wn3fypd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770160020; x=1801696020;
  h=date:from:to:cc:subject:message-id;
  bh=xl93z3hVwihaQuqWYx+Jq5lq+ONsoc5yS94FzDGLbSk=;
  b=Wn3fypd19WZMkrgjlmli7YhmmgcD06nB+uUOaOllU77oAW3q4bHpjUZ4
   nARGFuwtWhfqXAYST+yg1gypcyXNqoetKQAYXk4wt2MJUu0ttAj/VqOoE
   5PjY/6/1qHo6lYsOwqOnDi3Xi3tH+rZUtzLOQsPVgd+GzB48rTKgAjNMb
   5ZlM7bXUl0z9yNNRp3WruL0hoibrmY2eV4+WdqkE1wGzsIoogsw4/IfxX
   USPIi63MBLLYylzh0yzJ9sNH10vAKXro1SHT2G7pdFdiorG+snXnUpEgZ
   bRmNR/eq7UTPjrhLVLuwQ64JUicRh8j/cOyh465SElIPSzsP2Vugx/az5
   w==;
X-CSE-ConnectionGUID: o+BdO1Q/Rd2ySPeQ8Ly8tQ==
X-CSE-MsgGUID: EeaAuwXSSySG0kMTJ2V6CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70363130"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="70363130"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 15:06:59 -0800
X-CSE-ConnectionGUID: z4yzy2jkRz+UHSxZ3nf/9Q==
X-CSE-MsgGUID: XYxsYdt3QcyUNQ3CJDeKuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="214533736"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2026 15:06:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnPTy-00000000hHI-2eDy;
	Tue, 03 Feb 2026 23:06:54 +0000
Date: Wed, 04 Feb 2026 07:06:27 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_dbtr_v2 61/62]
 arch/riscv/kernel/hw_breakpoint.c:73:22: error: 'SBI_ERR_ALREADY_AVAILABLE'
 undeclared
Message-ID: <202602040755.3dhtcqep-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v2
head:   922a4bdf735544d2054881e7a06eefbeaf243aac
commit: dade078aff89281d02193ec8e353e2127e92e236 [61/62] riscv: Introduce support for hardware break/watchpoints
config: riscv-nommu_k210_sdcard_defconfig (https://download.01.org/0day-ci/archive/20260204/202602040755.3dhtcqep-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040755.3dhtcqep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040755.3dhtcqep-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_smp_setup_sbi_shmem':
   arch/riscv/kernel/hw_breakpoint.c:44:23: error: storage size of 'ret' isn't known
      44 |         struct sbiret ret;
         |                       ^~~
   In file included from include/asm-generic/percpu.h:9,
                    from ./arch/riscv/include/generated/asm/percpu.h:1,
                    from include/linux/alloc_tag.h:12,
                    from include/linux/percpu.h:5,
                    from include/asm-generic/local64.h:5,
                    from ./arch/riscv/include/generated/asm/local64.h:1,
                    from include/linux/perf_event.h:26,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/riscv/kernel/hw_breakpoint.c:6:
   include/linux/percpu-defs.h:221:59: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:239:9: note: in expansion of macro '__verify_pcpu_ptr'
     239 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:47:22: note: in expansion of macro 'per_cpu_ptr'
      47 |         dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
         |                      ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:55:15: error: implicit declaration of function 'sbi_ecall' [-Wimplicit-function-declaration]
      55 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |               ^~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:55:25: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
      55 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                         ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:55:25: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/kernel/hw_breakpoint.c:55:39: error: 'SBI_EXT_DBTR_SETUP_SHMEM' undeclared (first use in this function)
      55 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:60:22: error: 'SBI_ERR_DENIED' undeclared (first use in this function)
      60 |                 case SBI_ERR_DENIED:
         |                      ^~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:66:22: error: 'SBI_ERR_INVALID_PARAM' undeclared (first use in this function)
      66 |                 case SBI_ERR_INVALID_PARAM:
         |                      ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:67:22: error: 'SBI_ERR_INVALID_ADDRESS' undeclared (first use in this function)
      67 |                 case SBI_ERR_INVALID_ADDRESS:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:73:22: error: 'SBI_ERR_ALREADY_AVAILABLE' undeclared (first use in this function)
      73 |                 case SBI_ERR_ALREADY_AVAILABLE:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:79:22: error: 'SBI_ERR_FAILURE' undeclared (first use in this function)
      79 |                 case SBI_ERR_FAILURE:
         |                      ^~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:44:23: warning: unused variable 'ret' [-Wunused-variable]
      44 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_smp_teardown_sbi_shmem':
   arch/riscv/kernel/hw_breakpoint.c:99:23: error: storage size of 'ret' isn't known
      99 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c:102:25: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     102 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                         ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:102:39: error: 'SBI_EXT_DBTR_SETUP_SHMEM' undeclared (first use in this function)
     102 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:107:22: error: 'SBI_ERR_DENIED' undeclared (first use in this function)
     107 |                 case SBI_ERR_DENIED:
         |                      ^~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:112:22: error: 'SBI_ERR_INVALID_PARAM' undeclared (first use in this function)
     112 |                 case SBI_ERR_INVALID_PARAM:
         |                      ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:113:22: error: 'SBI_ERR_INVALID_ADDRESS' undeclared (first use in this function)
     113 |                 case SBI_ERR_INVALID_ADDRESS:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:118:22: error: 'SBI_ERR_ALREADY_AVAILABLE' undeclared (first use in this function)
     118 |                 case SBI_ERR_ALREADY_AVAILABLE:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:122:22: error: 'SBI_ERR_FAILURE' undeclared (first use in this function)
     122 |                 case SBI_ERR_FAILURE:
         |                      ^~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:99:23: warning: unused variable 'ret' [-Wunused-variable]
      99 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'init_sbi_dbtr':
   arch/riscv/kernel/hw_breakpoint.c:140:23: error: storage size of 'ret' isn't known
     140 |         struct sbiret ret;
         |                       ^~~
>> arch/riscv/kernel/hw_breakpoint.c:142:13: error: implicit declaration of function 'sbi_probe_extension' [-Wimplicit-function-declaration]
     142 |         if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
         |             ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:142:33: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     142 |         if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
         |                                 ^~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:148:39: error: 'SBI_EXT_DBTR_NUM_TRIGGERS' undeclared (first use in this function)
     148 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:140:23: warning: unused variable 'ret' [-Wunused-variable]
     140 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_install_hw_breakpoint':
   include/linux/percpu-defs.h:221:59: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:245:9: note: in expansion of macro '__verify_pcpu_ptr'
     245 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:256:27: note: in expansion of macro 'raw_cpu_ptr'
     256 | #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
         |                           ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:428:45: note: in expansion of macro 'this_cpu_ptr'
     428 |         union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
         |                                             ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:433:23: error: storage size of 'ret' isn't known
     433 |         struct sbiret ret;
         |                       ^~~
>> arch/riscv/kernel/hw_breakpoint.c:439:22: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     439 |         xmit = &shmem->data;
         |                      ^~
   arch/riscv/kernel/hw_breakpoint.c:440:22: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     440 |         recv = &shmem->id;
         |                      ^~
>> arch/riscv/kernel/hw_breakpoint.c:441:13: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     441 |         xmit->tdata1 = cpu_to_le(bp->tdata1);
         |             ^~
   arch/riscv/kernel/hw_breakpoint.c:442:13: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     442 |         xmit->tdata2 = cpu_to_le(bp->tdata2);
         |             ^~
   arch/riscv/kernel/hw_breakpoint.c:443:13: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     443 |         xmit->tdata3 = cpu_to_le(bp->tdata3);
         |             ^~
   arch/riscv/kernel/hw_breakpoint.c:445:25: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     445 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
         |                         ^~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:445:39: error: 'SBI_EXT_DBTR_TRIG_INSTALL' undeclared (first use in this function)
     445 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/riscv/include/uapi/asm/byteorder.h:10,
                    from include/uapi/linux/perf_event.h:20,
                    from include/linux/perf_event.h:17:
>> arch/riscv/kernel/hw_breakpoint.c:454:29: error: invalid use of undefined type 'struct sbi_dbtr_id_msg'
     454 |         idx = le_to_cpu(recv->idx);
         |                             ^~
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__le64_to_cpu'
      33 | #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
         |                                                   ^
   arch/riscv/include/asm/hw_breakpoint.h:17:19: note: in expansion of macro 'le64_to_cpu'
      17 | #define le_to_cpu le64_to_cpu
         |                   ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:454:15: note: in expansion of macro 'le_to_cpu'
     454 |         idx = le_to_cpu(recv->idx);
         |               ^~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:433:23: warning: unused variable 'ret' [-Wunused-variable]
     433 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_uninstall_hw_breakpoint':
   arch/riscv/kernel/hw_breakpoint.c:482:23: error: storage size of 'ret' isn't known
     482 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c:499:25: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     499 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
         |                         ^~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:499:39: error: 'SBI_EXT_DBTR_TRIG_UNINSTALL' undeclared (first use in this function)
     499 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:482:23: warning: unused variable 'ret' [-Wunused-variable]
     482 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_enable_hw_breakpoint':
   arch/riscv/kernel/hw_breakpoint.c:507:23: error: storage size of 'ret' isn't known
     507 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c:523:25: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     523 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
         |                         ^~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:523:39: error: 'SBI_EXT_DBTR_TRIG_ENABLE' undeclared (first use in this function)
     523 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:507:23: warning: unused variable 'ret' [-Wunused-variable]
     507 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_update_hw_breakpoint':
   include/linux/percpu-defs.h:221:59: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:245:9: note: in expansion of macro '__verify_pcpu_ptr'
     245 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:256:27: note: in expansion of macro 'raw_cpu_ptr'
     256 | #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
         |                           ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:536:45: note: in expansion of macro 'this_cpu_ptr'
     536 |         union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
         |                                             ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:539:23: error: storage size of 'ret' isn't known
     539 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c:557:22: error: invalid use of undefined type 'union sbi_dbtr_shmem_entry'
     557 |         xmit = &shmem->data;
         |                      ^~
   arch/riscv/kernel/hw_breakpoint.c:558:13: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     558 |         xmit->tdata1 = cpu_to_le(bp->tdata1);
         |             ^~
   arch/riscv/kernel/hw_breakpoint.c:559:13: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     559 |         xmit->tdata2 = cpu_to_le(bp->tdata2);
         |             ^~
   arch/riscv/kernel/hw_breakpoint.c:560:13: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
     560 |         xmit->tdata3 = cpu_to_le(bp->tdata3);
         |             ^~
   arch/riscv/kernel/hw_breakpoint.c:562:25: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     562 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
         |                         ^~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:562:39: error: 'SBI_EXT_DBTR_TRIG_UPDATE' undeclared (first use in this function)
     562 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:539:23: warning: unused variable 'ret' [-Wunused-variable]
     539 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_disable_hw_breakpoint':
   arch/riscv/kernel/hw_breakpoint.c:574:23: error: storage size of 'ret' isn't known
     574 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c:589:25: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     589 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
         |                         ^~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:589:39: error: 'SBI_EXT_DBTR_TRIG_DISABLE' undeclared (first use in this function)
     589 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:574:23: warning: unused variable 'ret' [-Wunused-variable]
     574 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_hw_breakpoint_init':
>> arch/riscv/kernel/hw_breakpoint.c:634:47: error: invalid application of 'sizeof' to incomplete type 'union sbi_dbtr_shmem_entry'
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                                               ^
   include/linux/alloc_tag.h:251:16: note: in definition of macro 'alloc_hooks_tag'
     251 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/percpu.h:142:9: note: in expansion of macro 'alloc_hooks'
     142 |         alloc_hooks(pcpu_alloc_noprof(_size, _align, false, GFP_KERNEL))
         |         ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:634:26: note: in expansion of macro '__alloc_percpu'
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                          ^~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:634:47: error: invalid application of 'sizeof' to incomplete type 'union sbi_dbtr_shmem_entry'
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                                               ^
   include/linux/alloc_tag.h:255:24: note: in definition of macro 'alloc_hooks_tag'
     255 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/percpu.h:142:9: note: in expansion of macro 'alloc_hooks'
     142 |         alloc_hooks(pcpu_alloc_noprof(_size, _align, false, GFP_KERNEL))
         |         ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:634:26: note: in expansion of macro '__alloc_percpu'
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                          ^~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:634:47: error: invalid application of 'sizeof' to incomplete type 'union sbi_dbtr_shmem_entry'
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                                               ^
   include/linux/alloc_tag.h:258:24: note: in definition of macro 'alloc_hooks_tag'
     258 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/percpu.h:142:9: note: in expansion of macro 'alloc_hooks'
     142 |         alloc_hooks(pcpu_alloc_noprof(_size, _align, false, GFP_KERNEL))
         |         ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:634:26: note: in expansion of macro '__alloc_percpu'
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                          ^~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:634:24: error: assignment to 'union sbi_dbtr_shmem_entry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                        ^


vim +/SBI_ERR_ALREADY_AVAILABLE +73 arch/riscv/kernel/hw_breakpoint.c

    39	
    40	static int arch_smp_setup_sbi_shmem(unsigned int cpu)
    41	{
    42		union sbi_dbtr_shmem_entry *dbtr_shmem;
    43		unsigned long shmem_pa;
  > 44		struct sbiret ret;
    45		int rc = 0;
    46	
    47		dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
    48		if (!dbtr_shmem) {
    49			pr_err("Invalid per-cpu shared memory for debug triggers\n");
    50			return -ENODEV;
    51		}
    52	
    53		shmem_pa = __pa(dbtr_shmem);
    54	
    55		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
    56				MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);
    57	
    58		if (ret.error) {
    59			switch (ret.error) {
    60			case SBI_ERR_DENIED:
    61				pr_warn("%s: Access denied for shared memory at %lx\n",
    62					__func__, shmem_pa);
    63				rc = -EPERM;
    64				break;
    65	
    66			case SBI_ERR_INVALID_PARAM:
    67			case SBI_ERR_INVALID_ADDRESS:
    68				pr_warn("%s: Invalid address parameter (%lu)\n",
    69					__func__, ret.error);
    70				rc = -EINVAL;
    71				break;
    72	
  > 73			case SBI_ERR_ALREADY_AVAILABLE:
    74				pr_warn("%s: Shared memory is already set\n",
    75					__func__);
    76				rc = -EADDRINUSE;
    77				break;
    78	
  > 79			case SBI_ERR_FAILURE:
    80				pr_err("%s: Internal sdtrig state error\n",
    81				       __func__);
    82				rc = -ENXIO;
    83				break;
    84	
    85			default:
    86				pr_warn("%s: Unknown error %lu\n", __func__, ret.error);
    87				rc = -ENXIO;
    88				break;
    89			}
    90		}
    91	
    92		pr_info("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
    93	
    94		return rc;
    95	}
    96	
    97	static int arch_smp_teardown_sbi_shmem(unsigned int cpu)
    98	{
    99		struct sbiret ret;
   100	
   101		/* Disable shared memory */
   102		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
   103				-1UL, -1UL, 0, 0, 0, 0);
   104	
   105		if (ret.error) {
   106			switch (ret.error) {
   107			case SBI_ERR_DENIED:
   108				pr_err("%s: Access denied for shared memory.\n",
   109				       __func__);
   110				break;
   111	
   112			case SBI_ERR_INVALID_PARAM:
   113			case SBI_ERR_INVALID_ADDRESS:
   114				pr_err("%s: Invalid address parameter (%lu)\n",
   115				       __func__, ret.error);
   116				break;
   117	
   118			case SBI_ERR_ALREADY_AVAILABLE:
   119				pr_err("%s: Shared memory is already set\n",
   120				       __func__);
   121				break;
   122			case SBI_ERR_FAILURE:
   123				pr_err("%s: Internal sdtrig state error\n",
   124				       __func__);
   125				break;
   126			default:
   127				pr_err("%s: Unknown error %lu\n", __func__, ret.error);
   128				break;
   129			}
   130		}
   131	
   132		pr_warn("CPU %d: HW Breakpoint shared memory disabled.\n", cpu);
   133	
   134		return 0;
   135	}
   136	
   137	static void init_sbi_dbtr(void)
   138	{
   139		unsigned long tdata1;
   140		struct sbiret ret;
   141	
 > 142		if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
   143			pr_warn("%s: SBI_EXT_DBTR is not supported\n", __func__);
   144			dbtr_total_num = 0;
   145			goto done;
   146		}
   147	
 > 148		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
   149				0, 0, 0, 0, 0, 0);
   150		if (ret.error) {
   151			pr_warn("%s: Failed to detect triggers\n", __func__);
   152			dbtr_total_num = 0;
   153			goto done;
   154		}
   155	
   156		tdata1 = 0;
   157		RV_DBTR_SET_TDATA1_TYPE(tdata1, RV_DBTR_TRIG_MCONTROL6);
   158	
   159		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
   160				tdata1, 0, 0, 0, 0, 0);
   161		if (ret.error) {
   162			pr_warn("%s: failed to detect mcontrol6 triggers\n", __func__);
   163		} else if (!ret.value) {
   164			pr_warn("%s: type 6 triggers not available\n", __func__);
   165		} else {
   166			dbtr_total_num = ret.value;
   167			dbtr_type = RV_DBTR_TRIG_MCONTROL6;
   168			pr_warn("%s: mcontrol6 trigger available.\n", __func__);
   169			goto done;
   170		}
   171	
   172		/* fallback to type 2 triggers if type 6 is not available */
   173	
   174		tdata1 = 0;
   175		RV_DBTR_SET_TDATA1_TYPE(tdata1, RV_DBTR_TRIG_MCONTROL);
   176	
   177		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
   178				tdata1, 0, 0, 0, 0, 0);
   179		if (ret.error) {
   180			pr_warn("%s: failed to detect mcontrol triggers\n", __func__);
   181		} else if (!ret.value) {
   182			pr_warn("%s: type 2 triggers not available\n", __func__);
   183		} else {
   184			dbtr_total_num = ret.value;
   185			dbtr_type = RV_DBTR_TRIG_MCONTROL;
   186			goto done;
   187		}
   188	
   189	done:
   190		dbtr_init = 1;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
