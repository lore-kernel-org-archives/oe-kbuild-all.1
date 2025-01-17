Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EC61537AC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 05:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737093117; cv=none; b=JL0wrwNUBa4hRM3xy+QHn1GaAV5Ngt4aIQiZ2WSoyKANLzGabjk+AauDF3M+hc+oPIJlID2Qe6s1FjkStvn5u4ylx+tPFowo2MPuTzDC2IgO2LAuKClV4j+aS1QVhmp09YPXyRHqQ7l+Ep8JsRTGMWMhPIRxTZgLOrUwFwgiX/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737093117; c=relaxed/simple;
	bh=Bj4OVw5pdxk3QrydoRc8fDs+u87JTet55MxvX8kO868=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ctRos03o3DNuCUOqJbqBgv8XZBmWEUA4hT7mIPF9m5FGHp0pyeCUVV/R0wzMEzdhbSsxMfHJakMUrLbYvtCg09jTQyKVUuCbhHodLGC47ZRcuQJd9I1+kVrmaxpUPjnrEC6Yiw8o0rAkrWwULndyrKCdjvoOqdz03B/IPyzU/jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7hF1VPt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7hF1VPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737093117; x=1768629117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bj4OVw5pdxk3QrydoRc8fDs+u87JTet55MxvX8kO868=;
  b=R7hF1VPtEOE+avBhudCr7lmJKRpTzgjSLLDqAQ0FmB3CT6xYN3OWZbzm
   23zKCqEYXur7v7ULS0furS0SQOlvyy7/RC2rJ7WA86ZeC+92uY+oo4VCW
   B+gq9IX+XncpSaPBzvPgyxyBkbCz6GqAihxicGJOqLTF1xW7eJwbTZ50P
   ZIcDqUkbdEADDVx1BUb3JxMom3YkaLiCqVxUPR5TBNbYjNMk9o8gETtiq
   x+5SQfxrZ5OPIvE47LyZxBnm5WCPRCMPP0k5fUTkSE+EioG1gGW8e/5ny
   mAeVM8ed/uerAbvFTBnaW06kdRrD5eSOqczVQAHVoja0pJ4x6bnlw8dsj
   g==;
X-CSE-ConnectionGUID: V7EpPiCCQzi0hypol6tDEw==
X-CSE-MsgGUID: vBeyu5HwSrauGRtoRDotNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="54925793"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="54925793"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 21:51:56 -0800
X-CSE-ConnectionGUID: UBF7eyHjR92PY2vYzjAiuA==
X-CSE-MsgGUID: /vhCJTR1Qdix9m6Icm+VKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="105670766"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jan 2025 21:51:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYfGp-000Sow-1d;
	Fri, 17 Jan 2025 05:51:51 +0000
Date: Fri, 17 Jan 2025 13:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v3 48/52]
 arch/riscv/kernel/hw_breakpoint.c:44:23: warning: unused variable 'ret'
Message-ID: <202501171317.4WoQoEqK-lkp@intel.com>
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
config: riscv-randconfig-001-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171317.4WoQoEqK-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171317.4WoQoEqK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171317.4WoQoEqK-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:265:9: note: in expansion of macro '__verify_pcpu_ptr'
     265 |         __verify_pcpu_ptr(ptr);                                         \
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
   include/linux/percpu-defs.h:219:59: error: invalid use of undefined type 'struct sbi_dbtr_shmem_entry'
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
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   arch/riscv/include/asm/hw_breakpoint.h:20:19: note: in expansion of macro 'le32_to_cpu'
      20 | #define le_to_cpu le32_to_cpu
         |                   ^~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:454:15: note: in expansion of macro 'le_to_cpu'


vim +/ret +44 arch/riscv/kernel/hw_breakpoint.c

    39	
    40	static int arch_smp_setup_sbi_shmem(unsigned int cpu)
    41	{
    42		struct sbi_dbtr_shmem_entry *dbtr_shmem;
    43		unsigned long shmem_pa;
  > 44		struct sbiret ret;
    45		int rc;
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
    59			switch(ret.error) {
    60			case SBI_ERR_DENIED:
    61				pr_warn("%s: Access denied for shared memory at %lx\n",
    62					__func__, shmem_pa);
    63				rc = -EPERM;
    64				break;
    65	
    66			case SBI_ERR_INVALID_PARAM:
  > 67			case SBI_ERR_INVALID_ADDRESS:
    68				pr_warn("%s: Invalid address parameter (%lu)\n",
    69					__func__, ret.error);
    70				rc = -EINVAL;
    71				break;
    72	
    73			case SBI_ERR_ALREADY_AVAILABLE:
    74				pr_warn("%s: Shared memory is already set\n",
    75					__func__);
    76				rc = -EADDRINUSE;
    77				break;
    78	
    79			case SBI_ERR_FAILURE:
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
