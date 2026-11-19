Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097305;
	b=qTTpD5b+1yF710GeVZA6NCJcE4gTj6AzOoXq0n1AoReIRprpTE/jLvBWIED4SaB1RnDR
	 gBzaVq+N0VEMvGiJvMeD5ViwGoKkv5TCLuzA05M4sEJhCzbBxy65G0x6vSXi72AxoOyKU
	 2zop0FuE5gEo0EMKTAoK2EdreWZAprqn/7JJgCllmHfCcOoQWQmU4IS0G9/UAHSO+YDsE
	 Tv8OcSJxd0ykkZWwJ4NpvBA8AP2hsabsgKjon3OsXJkvThpQfRFbFJydOUn+Z/UFKPeo7
	 2BP2fuOuOX5lkwSPwWwTHbsyJbo9yJ9AsNYvMf02rmWRdIXwPjwcfnhyC3NMoG9FhFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097305;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fEhh8c4473fPIfOgAG4gXuScFxmj3gXTVxJ2w+wVQJw=;
	b=jZS3jLaxWcP3RgdxvTQKfGItwuyBywqtI8Mpyr1KdiN+C3iFJrhLHenTtDDLjzNRNlQ9
	 1o1m/GxZowN7RYh37YeVxZ3wdJcP+NEU02H90WnkSqaluH+KwfnFBJxDXoE7Iw5D68KbN
	 6Wd+2s4Nidh/5D2qXj3iX8heNhcInQzimN0a06WJnSjbIOfeTmtZPWDuq6QbhIJwZPYWS
	 0vUSZi/MbsOLD3jdKZkQ85D/R+GWtIxLRfG3pTnoeNOBcbmnvdCsB1+GoYQaDx30oMfHA
	 fjtZ6IW56tTtePhxEPdbCIVGnilZV15uiFjZh6FhxJseLIDG/ifOw3FixH0lgs2vbQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MgUv8hMr;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CBB606A320
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 14:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78CBB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MgUv8hMr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795097304; x=1826633304;
  h=date:from:to:cc:subject:message-id;
  bh=fEcvYV7aoA8vlcPQrrN7DzdQCpWXZtoeassw82M0gpA=;
  b=MgUv8hMrFi3duSjWrrnPFNotk8B0m2Mm9W9uumaCMmZLoeRk7fdqQD+V
   DiYSqHfjbYtuQuCiszxUOCUvNbBUezo47/207dOeDcu4QaxVzC/pmXOp8
   L5KGXZ7zXK6ukwJ4E+WjfJ7Kar2jI82CYvchFQED91dYJDUoynhUuHMq5
   9lQKVRaC6TJ5p7O94F1BLoiz18jwNS8Xsu2lvGMzzktJc+2qvMF+ULz2r
   1ULt8ncv904xrPMz9tkjbNI0lWjUQ6WjGo2BTO1qjl+YlsBiUGT0H5mrg
   FinPCaX77Sgy2/JogmY5Sh3kvWWrGEsQx6JZPcWV0Ddu7iy3U4XgroebC
   g==;
X-CSE-ConnectionGUID: ahDjBZOrRhS/LSSGfZxHFQ==
X-CSE-MsgGUID: kdazLA9kS7qukEKRl1eQMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3834678"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3834678"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:04:32 -0800
X-CSE-ConnectionGUID: flfYYBcXQZC7UddgnKL6ow==
X-CSE-MsgGUID: /4q8XPxGRMiMXNejtup9xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10475338"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 19 Nov 2026 06:04:30 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU2kV-000000003n7-2XHg;
	Thu, 19 Nov 2026 14:04:27 +0000
Date: Thu, 19 Nov 2026 15:04:21 +0100
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_watchdog_v3 102/123]
 arch/loongarch/include/asm/loongarch.h:191:31: error: implicit declaration of
 function '__csrwr_d'; did you mean '__iocsrwr_w'?
Message-ID: <20261119150249.dSBPYhsg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sbi_watchdog_v3
head:   ac1077ad1098450b0752cf0c862edf36f43de299
commit: c8fdc593cf3174fdad60a64df0e84942ee5c7108 [102/123] gtrace: Add perf driver for tracing using perf tool
config: loongarch-randconfig-r2311-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119150249.dSBPYhsg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119150249.dSBPYhsg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119150249.dSBPYhsg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/loongarch/kernel/ptrace.c: In function 'ptrace_hbptriggered':
>> arch/loongarch/kernel/ptrace.c:402:40: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     402 |         force_sig_ptrace_errno_trap(i, (void __user *)bkpt->address);
         |                                        ^
   In file included from arch/loongarch/include/asm/cpu-info.h:11,
                    from arch/loongarch/include/asm/cpu-features.h:13,
                    from arch/loongarch/include/asm/cmpxchg.h:11,
                    from arch/loongarch/include/asm/atomic.h:12,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/loongarch/include/asm/bitops.h:38,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from arch/loongarch/kernel/ptrace.c:17:
   arch/loongarch/kernel/ptrace.c: In function 'set_single_step':
>> arch/loongarch/include/asm/loongarch.h:191:31: error: implicit declaration of function '__csrwr_d'; did you mean '__iocsrwr_w'? [-Wimplicit-function-declaration]
     191 | #define csr_write64(val, reg) __csrwr_d(val, reg)
         |                               ^~~~~~~~~
   arch/loongarch/kernel/ptrace.c:1073:17: note: in expansion of macro 'csr_write64'
    1073 |                 csr_write64(attr.bp_addr, LOONGARCH_CSR_IB0ADDR);
         |                 ^~~~~~~~~~~
--
   In file included from arch/loongarch/include/asm/percpu.h:8,
                    from arch/loongarch/include/asm/current.h:9,
                    from include/linux/sched.h:12,
                    from include/linux/ptrace.h:6,
                    from arch/loongarch/include/uapi/asm/bpf_perf_event.h:5,
                    from include/uapi/linux/bpf_perf_event.h:11,
                    from include/linux/perf_event.h:18,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/loongarch/kernel/hw_breakpoint.c:7:
   arch/loongarch/kernel/hw_breakpoint.c: In function 'read_wb_reg':
>> arch/loongarch/include/asm/loongarch.h:189:25: error: implicit declaration of function '__csrrd_d'; did you mean '__iocsrrd_w'? [-Wimplicit-function-declaration]
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^~~~~~~~~
   arch/loongarch/include/asm/hw_breakpoint.h:60:23: note: in expansion of macro 'csr_read64'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^~~~~~~~~~
   arch/loongarch/kernel/hw_breakpoint.c:38:17: note: in expansion of macro 'LOONGARCH_CSR_WATCH_READ'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/hw_breakpoint.c:47:9: note: in expansion of macro 'READ_WB_REG_CASE'
      47 |         READ_WB_REG_CASE(OFF, 0, REG, T, VAL);          \
         |         ^~~~~~~~~~~~~~~~
   arch/loongarch/kernel/hw_breakpoint.c:83:9: note: in expansion of macro 'GEN_READ_WB_REG_CASES'
      83 |         GEN_READ_WB_REG_CASES(CSR_CFG_ADDR, ADDR, t, val);
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/hw_breakpoint.c: In function 'write_wb_reg':
>> arch/loongarch/include/asm/loongarch.h:191:31: error: implicit declaration of function '__csrwr_d'; did you mean '__iocsrwr_w'? [-Wimplicit-function-declaration]
     191 | #define csr_write64(val, reg) __csrwr_d(val, reg)
         |                               ^~~~~~~~~
   arch/loongarch/include/asm/hw_breakpoint.h:68:17: note: in expansion of macro 'csr_write64'
      68 |                 csr_write64(VAL, LOONGARCH_CSR_##IB##N##REG);   \
         |                 ^~~~~~~~~~~
   arch/loongarch/kernel/hw_breakpoint.c:43:17: note: in expansion of macro 'LOONGARCH_CSR_WATCH_WRITE'
      43 |                 LOONGARCH_CSR_WATCH_WRITE(N, REG, T, VAL);      \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/hw_breakpoint.c:63:9: note: in expansion of macro 'WRITE_WB_REG_CASE'
      63 |         WRITE_WB_REG_CASE(OFF, 0, REG, T, VAL);         \
         |         ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/hw_breakpoint.c:98:9: note: in expansion of macro 'GEN_WRITE_WB_REG_CASES'
      98 |         GEN_WRITE_WB_REG_CASES(CSR_CFG_ADDR, ADDR, t, val);
         |         ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/loongarch/include/asm/cpu-info.h:11,
                    from arch/loongarch/include/asm/cpu-features.h:13,
                    from arch/loongarch/include/asm/cmpxchg.h:11,
                    from arch/loongarch/include/asm/atomic.h:12,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:10,
                    from arch/loongarch/kernel/perf_event.c:13:
   arch/loongarch/kernel/perf_event.c: In function 'loongarch_pmu_read_counter':
>> arch/loongarch/include/asm/loongarch.h:189:25: error: implicit declaration of function '__csrrd_d'; did you mean '__iocsrrd_w'? [-Wimplicit-function-declaration]
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^~~~~~~~~
   arch/loongarch/include/asm/loongarch.h:1383:41: note: in expansion of macro 'csr_read64'
    1383 | #define read_csr_perfcntr0()            csr_read64(LOONGARCH_CSR_PERFCNTR0)
         |                                         ^~~~~~~~~~
   arch/loongarch/kernel/perf_event.c:167:23: note: in expansion of macro 'read_csr_perfcntr0'
     167 |                 val = read_csr_perfcntr0();
         |                       ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/perf_event.c: In function 'loongarch_pmu_write_counter':
>> arch/loongarch/include/asm/loongarch.h:191:31: error: implicit declaration of function '__csrwr_d'; did you mean '__iocsrwr_w'? [-Wimplicit-function-declaration]
     191 | #define csr_write64(val, reg) __csrwr_d(val, reg)
         |                               ^~~~~~~~~
   arch/loongarch/include/asm/loongarch.h:1391:41: note: in expansion of macro 'csr_write64'
    1391 | #define write_csr_perfcntr0(val)        csr_write64(val, LOONGARCH_CSR_PERFCNTR0)
         |                                         ^~~~~~~~~~~
   arch/loongarch/kernel/perf_event.c:190:17: note: in expansion of macro 'write_csr_perfcntr0'
     190 |                 write_csr_perfcntr0(val);
         |                 ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PERF_EVENTS
   Depends on [n]: HAVE_PERF_EVENTS [=n]
   Selected by [y]:
   - GTRACE [=y] && OF [=y]


vim +191 arch/loongarch/include/asm/loongarch.h

f2ac457a61389b Huacai Chen 2022-05-31  186  
f2ac457a61389b Huacai Chen 2022-05-31  187  /* CSR */
53a4858ccd0d27 WANG Xuerui 2023-06-29  188  #define csr_read32(reg) __csrrd_w(reg)
53a4858ccd0d27 WANG Xuerui 2023-06-29 @189  #define csr_read64(reg) __csrrd_d(reg)
53a4858ccd0d27 WANG Xuerui 2023-06-29  190  #define csr_write32(val, reg) __csrwr_w(val, reg)
53a4858ccd0d27 WANG Xuerui 2023-06-29 @191  #define csr_write64(val, reg) __csrwr_d(val, reg)
53a4858ccd0d27 WANG Xuerui 2023-06-29  192  #define csr_xchg32(val, mask, reg) __csrxchg_w(val, mask, reg)
53a4858ccd0d27 WANG Xuerui 2023-06-29  193  #define csr_xchg64(val, mask, reg) __csrxchg_d(val, mask, reg)
f2ac457a61389b Huacai Chen 2022-05-31  194  

:::::: The code at line 191 was first introduced by commit
:::::: 53a4858ccd0d27538f9ab1ac2bead002fca97edc LoongArch: Make the CPUCFG&CSR ops simple aliases of compiler built-ins

:::::: TO: WANG Xuerui <git@xen0n.name>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
