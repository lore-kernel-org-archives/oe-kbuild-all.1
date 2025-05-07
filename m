Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD42D347B4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 12:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619779; cv=none; b=Dvl/P3FlWM9+Q21faZMTNh2TZRrmO324KJd9bUBW+3S4zZdgVsEB8VmzjOTICaTc9+4XZk/vL/Zu8ioCh+//pXFELlJu4IujPO+2IyxAq7WYQmaRBiYnRT9Rqrik0GqDEWuAUw+G9xyZVqGwkgfC/piOAF+4Qh8p/Na8HDdcuzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619779; c=relaxed/simple;
	bh=0oKUX3w1117F7eo6SyKxWw3SciT2wjsZU47F8K9ryTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eth3s3frmuvsyGd9I/XYAwQDfrgfYDOF9rff3o0+jPrNfWFsRf7TiaTblZeYMzlm/vuTDldFyfiH84FJHDHtGcfzJsLrbdqkpnPwNh6VW/I9gIgE8Hsl14k9GSgVEWj3KPhx2lXU9QqrhG4ubXEr91xM1gHx8r4sK0MKCc14Cic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RvpMPZfL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RvpMPZfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746619777; x=1778155777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0oKUX3w1117F7eo6SyKxWw3SciT2wjsZU47F8K9ryTs=;
  b=RvpMPZfLavLypX9wMmXDnnrFKbyfhz7KpiSLFN+GUHZiR6vWYzu4rFHd
   vQjSvnU5/YRGNg62LTQsEbo1Nb+NVvshFZk8YdMgXEeMjvTV35fIHm5Vd
   ZN2O9PFZEDIkgOAy6UvwZhAmPj5l3Zm3N0EThjPoo0flZPDy7SSDEGxXF
   fMEN5MTEsHhiw2bZtXVaA6GgHfd0WmIiWS0LFkDZpGr4n0emal36wh+Od
   Fg14232J4Kl7J42yHYTWNz4bdxDo9MIgxzERz0OCxPbNPi18dK3f9GgW3
   FOloJ+GcvSwYlv9ADtLd6rh4GO276OkwZp0XJXlT2BBr2Dn1paOdgP50G
   w==;
X-CSE-ConnectionGUID: LSm8HaGlSkeuk8RjrK+Z9g==
X-CSE-MsgGUID: kE/n42gXTUWa3BpXFbLJGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="51998544"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="51998544"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:09:37 -0700
X-CSE-ConnectionGUID: A8oz/XWCS3C9frfPYNBhsw==
X-CSE-MsgGUID: JJCO+oFzQVG2akHuit3QuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135955867"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 05:09:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCdae-0007kt-25;
	Wed, 07 May 2025 12:09:32 +0000
Date: Wed, 7 May 2025 20:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_raid6_rvv_v3 42/58]
 include/linux/percpu-defs.h:220:59: error: invalid use of undefined type
 'struct sbi_dbtr_shmem_entry'
Message-ID: <202505072007.aZn4ZnxA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_raid6_rvv_v3
head:   5c5a7e6795406fdac17fd52dfc4ac3c5b0f6e25f
commit: 27efa9d6d5ee0de25edcc278388909f36832e5bc [42/58] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250507/202505072007.aZn4ZnxA-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072007.aZn4ZnxA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072007.aZn4ZnxA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_smp_setup_sbi_shmem':
   arch/riscv/kernel/hw_breakpoint.c:44:23: error: storage size of 'ret' isn't known
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
>> include/linux/percpu-defs.h:220:59: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
     220 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:238:9: note: in expansion of macro '__verify_pcpu_ptr'
     238 |         __verify_pcpu_ptr(ptr);                                         \
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
   arch/riscv/kernel/hw_breakpoint.c:73:22: error: 'SBI_ERR_ALREADY_AVAILABLE' undeclared (first use in this function)
      73 |                 case SBI_ERR_ALREADY_AVAILABLE:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:79:22: error: 'SBI_ERR_FAILURE' undeclared (first use in this function)
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
   arch/riscv/kernel/hw_breakpoint.c:142:13: error: implicit declaration of function 'sbi_probe_extension' [-Wimplicit-function-declaration]
     142 |         if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
         |             ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:142:33: error: 'SBI_EXT_DBTR' undeclared (first use in this function)
     142 |         if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
         |                                 ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:148:39: error: 'SBI_EXT_DBTR_NUM_TRIGGERS' undeclared (first use in this function)
     148 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:140:23: warning: unused variable 'ret' [-Wunused-variable]
     140 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_install_hw_breakpoint':
>> include/linux/percpu-defs.h:220:59: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
     220 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:244:9: note: in expansion of macro '__verify_pcpu_ptr'
     244 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:255:27: note: in expansion of macro 'raw_cpu_ptr'
     255 | #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
         |                           ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:428:46: note: in expansion of macro 'this_cpu_ptr'
     428 |         struct sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
         |                                              ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:433:23: error: storage size of 'ret' isn't known
     433 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c:439:22: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
     439 |         xmit = &shmem->data;
         |                      ^~
   arch/riscv/kernel/hw_breakpoint.c:440:22: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
     440 |         recv = &shmem->id;
         |                      ^~
   arch/riscv/kernel/hw_breakpoint.c:441:13: error: invalid use of undefined type 'struct sbi_dbtr_data_msg'
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
   arch/riscv/kernel/hw_breakpoint.c:445:39: error: 'SBI_EXT_DBTR_TRIG_INSTALL' undeclared (first use in this function)
     445 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/riscv/include/uapi/asm/byteorder.h:10,
                    from include/uapi/linux/perf_event.h:20,
                    from include/linux/perf_event.h:17:
   arch/riscv/kernel/hw_breakpoint.c:454:29: error: invalid use of undefined type 'struct sbi_dbtr_id_msg'
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
   arch/riscv/kernel/hw_breakpoint.c:499:39: error: 'SBI_EXT_DBTR_TRIG_UNINSTALL' undeclared (first use in this function)
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
   arch/riscv/kernel/hw_breakpoint.c:523:39: error: 'SBI_EXT_DBTR_TRIG_ENABLE' undeclared (first use in this function)
     523 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:507:23: warning: unused variable 'ret' [-Wunused-variable]
     507 |         struct sbiret ret;
         |                       ^~~
   arch/riscv/kernel/hw_breakpoint.c: In function 'arch_update_hw_breakpoint':
>> include/linux/percpu-defs.h:220:59: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
     220 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:244:9: note: in expansion of macro '__verify_pcpu_ptr'
     244 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:255:27: note: in expansion of macro 'raw_cpu_ptr'
     255 | #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
         |                           ^~~~~~~~~~~
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
   include/linux/alloc_tag.h:227:16: note: in definition of macro 'alloc_hooks_tag'
     227 |         typeof(_do_alloc) _res;                                         \
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
   include/linux/alloc_tag.h:231:24: note: in definition of macro 'alloc_hooks_tag'
     231 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/percpu.h:146:9: note: in expansion of macro 'alloc_hooks'
     146 |         alloc_hooks(pcpu_alloc_noprof(_size, _align, false, GFP_KERNEL))
         |         ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:634:26: note: in expansion of macro '__alloc_percpu'
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                          ^~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:634:47: error: invalid application of 'sizeof' to incomplete type 'struct sbi_dbtr_shmem_entry'
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                                               ^
   include/linux/alloc_tag.h:234:24: note: in definition of macro 'alloc_hooks_tag'
     234 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/percpu.h:146:9: note: in expansion of macro 'alloc_hooks'
     146 |         alloc_hooks(pcpu_alloc_noprof(_size, _align, false, GFP_KERNEL))
         |         ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:634:26: note: in expansion of macro '__alloc_percpu'
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                          ^~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:634:24: error: assignment to 'struct sbi_dbtr_shmem_entry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     634 |         sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
         |                        ^


vim +220 include/linux/percpu-defs.h

62fde54123fb648 Tejun Heo 2014-06-17  206  
9c28278a24c01c0 Tejun Heo 2014-06-17  207  /*
6fbc07bbe2b5a89 Tejun Heo 2014-06-17  208   * __verify_pcpu_ptr() verifies @ptr is a percpu pointer without evaluating
6fbc07bbe2b5a89 Tejun Heo 2014-06-17  209   * @ptr and is invoked once before a percpu area is accessed by all
6fbc07bbe2b5a89 Tejun Heo 2014-06-17  210   * accessors and operations.  This is performed in the generic part of
6fbc07bbe2b5a89 Tejun Heo 2014-06-17  211   * percpu and arch overrides don't need to worry about it; however, if an
6fbc07bbe2b5a89 Tejun Heo 2014-06-17  212   * arch wants to implement an arch-specific percpu accessor or operation,
6fbc07bbe2b5a89 Tejun Heo 2014-06-17  213   * it may use __verify_pcpu_ptr() to verify the parameters.
9c28278a24c01c0 Tejun Heo 2014-06-17  214   *
9c28278a24c01c0 Tejun Heo 2014-06-17  215   * + 0 is required in order to convert the pointer type from a
9c28278a24c01c0 Tejun Heo 2014-06-17  216   * potential array type to a pointer to a single item of the array.
9c28278a24c01c0 Tejun Heo 2014-06-17  217   */
eba117889ac444b Tejun Heo 2014-06-17  218  #define __verify_pcpu_ptr(ptr)						\
eba117889ac444b Tejun Heo 2014-06-17  219  do {									\
9c28278a24c01c0 Tejun Heo 2014-06-17 @220  	const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;	\
9c28278a24c01c0 Tejun Heo 2014-06-17  221  	(void)__vpp_verify;						\
9c28278a24c01c0 Tejun Heo 2014-06-17  222  } while (0)
9c28278a24c01c0 Tejun Heo 2014-06-17  223  

:::::: The code at line 220 was first introduced by commit
:::::: 9c28278a24c01c0073fb89e53c1d2a605ab9587d percpu: reorder macros in percpu header files

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
