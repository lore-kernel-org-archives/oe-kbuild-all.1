Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCC81F76D7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 07:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737097687; cv=none; b=Imxxl3NCTjn6KEQrEV8AfcExU7TmvtHm01aCAyEa6CYoAce19FoK/zlblyirtnwNYTZ1l6Ta7QUhqoUZX7hlX4FiTQDHF7qIUlrcWEPv4vhvHSwtuJctNsgqcN9CZn7aAaSYkdhWQ7HQ1+FxoaGEVUiTdEyAaer5cX0nIzkKunE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737097687; c=relaxed/simple;
	bh=mYe0MCEw8Mgcx3ZjE8RH9bLSI4T7AD5C7j2/DkWSyLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iRzCtKRyk7umBnxp8Oy7b65BJ0Xjx7Bn3z9s+25E1p9n8lIfT80AMXkFZNiHbtJ2D4eFSr8g+0rk3P6nMGdG5jHpA734qh5mhq+rzi3XS2YpFN5NmTqQG8sqwZOl4etz6Ka7g259m/D3kSpvbdvH+UzbeuC+UYaKX7CSXWM9vs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=agnQWvQA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agnQWvQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737097686; x=1768633686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mYe0MCEw8Mgcx3ZjE8RH9bLSI4T7AD5C7j2/DkWSyLs=;
  b=agnQWvQAp+RrNc9ejVzTmrAuvENSXcR0b5xU8jwRel9xh8Vl4K63BkHy
   funLm3N2SBOLe7ZvA2pCEaA0f19K/i4x0cJKeXL3Zty80OJ1J+1LTX/KM
   FjBxrQy0M9yGazk6r1vFDbdBdcj05UHR0lBFAAPyaOqYE+JBO73KS4bl+
   gxXKCLhM8868NwUqi3nKC07XGMEUpQnR0LR5cABQm8ov+sXL156hTfZnP
   Zr8Zy2boNp1IvQQM/M4I4/iiN2Vkq3nJ96AdfzDEExprVBPaYJ5RJcOvv
   n3IwcT0/e52UScalHUUUD/vAKTxl50C9cefxcRSgUyEkmeYHDcKiFfbrr
   Q==;
X-CSE-ConnectionGUID: vaPSxrEUTxaDiLeIOKBEYQ==
X-CSE-MsgGUID: 3Ht8YosQSeKy3PQRJmf7BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="62893083"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="62893083"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 23:08:05 -0800
X-CSE-ConnectionGUID: nh4WYkWsT9+jBvXLjZBueQ==
X-CSE-MsgGUID: E1Rf6Y8dS3eDiySLaQ4P2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105568994"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jan 2025 23:08:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYgSW-000Su0-0N;
	Fri, 17 Jan 2025 07:08:00 +0000
Date: Fri, 17 Jan 2025 15:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v3 48/52]
 arch/riscv/kernel/hw_breakpoint.c:44:23: error: storage size of 'ret' isn't
 known
Message-ID: <202501171531.G0dGnYcA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v3
head:   39516917b0c89a7f679aeeeb94778173c8680af5
commit: 3075e7e9b707ae926864edfd52709256920fee46 [48/52] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-001-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171531.G0dGnYcA-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171531.G0dGnYcA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171531.G0dGnYcA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_smp_setup_sbi_shmem':
>> arch/riscv/kernel/hw_breakpoint.c:44:23: error: storage size of 'ret' isn't known
      44 |         struct sbiret ret;
         |                       ^~~
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
>> include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:265:9: note: in expansion of macro '__verify_pcpu_ptr'
     265 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:47:22: note: in expansion of macro 'per_cpu_ptr'
      47 |         dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
         |                      ^~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:55:15: error: implicit declaration of function 'sbi_ecall' [-Wimplicit-function-declaration]
      55 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |               ^~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:55:25: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
      55 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                         ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:55:25: note: each undeclared identifier is reported only once for each function it appears in
>> arch/riscv/kernel/hw_breakpoint.c:55:39: error: 'SBI_EXT_DBTR_SETUP_SHMEM' undeclared (first use in this function)
      55 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:60:22: error: 'SBI_ERR_DENIED' undeclared (first use in this function)
      60 |                 case SBI_ERR_DENIED:
         |                      ^~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:66:22: error: 'SBI_ERR_INVALID_PARAM' undeclared (first use in this function)
      66 |                 case SBI_ERR_INVALID_PARAM:
         |                      ^~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:67:22: error: 'SBI_ERR_INVALID_ADDRESS' undeclared (first use in this function)
      67 |                 case SBI_ERR_INVALID_ADDRESS:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:73:22: error: 'SBI_ERR_ALREADY_AVAILABLE' undeclared (first use in this function)
      73 |                 case SBI_ERR_ALREADY_AVAILABLE:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:79:22: error: 'SBI_ERR_FAILURE' undeclared (first use in this function)
      79 |                 case SBI_ERR_FAILURE:
         |                      ^~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:44:23: warning: unused variable 'ret' [-Wunused-variable]
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
>> include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:265:9: note: in expansion of macro '__verify_pcpu_ptr'
     265 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:33: note: in expansion of macro 'per_cpu_ptr'
     269 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~
   include/linux/percpu-defs.h:270:33: note: in expansion of macro 'raw_cpu_ptr'
     270 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:428:46: note: in expansion of macro 'this_cpu_ptr'
     428 |         struct sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
         |                                              ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:433:23: error: storage size of 'ret' isn't known
     433 |         struct sbiret ret;
         |                       ^~~
>> arch/riscv/kernel/hw_breakpoint.c:439:22: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
     439 |         xmit = &shmem->data;
         |                      ^~
   arch/riscv/kernel/hw_breakpoint.c:440:22: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
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
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   arch/riscv/include/asm/hw_breakpoint.h:20:19: note: in expansion of macro 'le32_to_cpu'
      20 | #define le_to_cpu le32_to_cpu
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
>> include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:265:9: note: in expansion of macro '__verify_pcpu_ptr'
     265 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:33: note: in expansion of macro 'per_cpu_ptr'
     269 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~
   include/linux/percpu-defs.h:270:33: note: in expansion of macro 'raw_cpu_ptr'
     270 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:536:46: note: in expansion of macro 'this_cpu_ptr'
     536 |         struct sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
         |                                              ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:539:23: error: storage size of 'ret' isn't known
     539 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c:557:22: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
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
   arch/riscv/kernel/hw_breakpoint.c:562:39: error: 'SBI_EXT_DBTR_TRIG_UPDATE' undeclared (first use in this function)
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
   arch/riscv/kernel/hw_breakpoint.c:589:39: error: 'SBI_EXT_DBTR_TRIG_DISABLE' undeclared (first use in this function)
     589 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:574:23: warning: unused variable 'ret' [-Wunused-variable]
     574 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_hw_breakpoint_init':
   arch/riscv/kernel/hw_breakpoint.c:634:47: error: invalid application of 'sizeof' to incomplete type 'struct sbi_dbtr_shmem_entry'
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                                               ^
   include/linux/alloc_tag.h:228:16: note: in definition of macro 'alloc_hooks_tag'
     228 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   include/linux/percpu.h:146:9: note: in expansion of macro 'alloc_hooks'
     146 |         alloc_hooks(pcpu_alloc_noprof(_size, _align, false, GFP_KERNEL))
         |         ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:634:26: note: in expansion of macro '__alloc_percpu'
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                          ^~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:634:47: error: invalid application of 'sizeof' to incomplete type 'struct sbi_dbtr_shmem_entry'
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                                               ^
   include/linux/alloc_tag.h:228:34: note: in definition of macro 'alloc_hooks_tag'
     228 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                                  ^~~~~~~~~
   include/linux/percpu.h:146:9: note: in expansion of macro 'alloc_hooks'
     146 |         alloc_hooks(pcpu_alloc_noprof(_size, _align, false, GFP_KERNEL))
         |         ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:634:26: note: in expansion of macro '__alloc_percpu'
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                          ^~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:634:24: error: assignment to 'struct sbi_dbtr_shmem_entry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                        ^


vim +44 arch/riscv/kernel/hw_breakpoint.c

    39	
    40	static int arch_smp_setup_sbi_shmem(unsigned int cpu)
    41	{
    42		struct sbi_dbtr_shmem_entry *dbtr_shmem;
    43		unsigned long shmem_pa;
  > 44		struct sbiret ret;
    45		int rc;
    46	
  > 47		dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
    48		if (!dbtr_shmem) {
    49			pr_err("Invalid per-cpu shared memory for debug triggers\n");
    50			return -ENODEV;
    51		}
    52	
    53		shmem_pa = __pa(dbtr_shmem);
    54	
  > 55		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
    56				MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);
    57	
    58		if (ret.error) {
    59			switch(ret.error) {
  > 60			case SBI_ERR_DENIED:
    61				pr_warn("%s: Access denied for shared memory at %lx\n",
    62					__func__, shmem_pa);
    63				rc = -EPERM;
    64				break;
    65	
  > 66			case SBI_ERR_INVALID_PARAM:
  > 67			case SBI_ERR_INVALID_ADDRESS:
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
    92		pr_warn("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
    93	
    94		return rc;
    95	}
    96	
    97	static int arch_smp_teardown_sbi_shmem(unsigned int cpu)
    98	{
  > 99		struct sbiret ret;
   100	
   101		/* Disable shared memory */
   102		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
   103				-1UL, -1UL, 0, 0, 0, 0);
   104	
   105		if (ret.error) {
   106			switch(ret.error) {
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
 > 140		struct sbiret ret;
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
