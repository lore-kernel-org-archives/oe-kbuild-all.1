Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EA61E284C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 05:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740027806; cv=none; b=NUjX11+bPT/xj91xMpgN5VeOesgYchi+rReFP7VqSsyn/XvHe4nz+sICVUBgNX3K4JNK41OgC6HhXgwaLxw+qUjgcbhudmZit6MBrhjtbftkOLckzX5yHjM6GC2kDx+CeHTz5DNlR2mejxjKa4FzCh/atjrHCkqfRNCypUsGmqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740027806; c=relaxed/simple;
	bh=3cQo1ytQIczUVxAHAfEgEE76g9b7RqGDITjlq2c3+II=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UG8yVYoulvALu7pzhVGAmRX9Lp+09M9So6TAaAEvVrcpkPq2A8dhDwWtJI3DyFYYy/R1LSNq3Zkpw3iJY1bjK/I63nvrHjCg15XeU5m/747KPIvW/Nru7nDTwJnL6FuBVWE+igByArCLI9Oda4IVOU03cIY14k7occI4bCD8/N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgShvYNw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgShvYNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740027805; x=1771563805;
  h=date:from:cc:subject:message-id:mime-version;
  bh=3cQo1ytQIczUVxAHAfEgEE76g9b7RqGDITjlq2c3+II=;
  b=HgShvYNwgD7Kz/w2D018ZS0rxoTQ9ROkkadottGSKcy7fvdS4qn5L8Sm
   Y8rPixe/XOUKDvk/9UkvjefDL89gpmkx8Y6MsA9gcF6vA33wsvfqAMSW5
   U0+ojAScrHRLTS5jpwxc8udW74O/0yLKkI9rnAz4QNSQjQHehITLE/SP8
   mkXZS9HSKZCYksfZwaD3lIbe2c8P4GIxCd9ra2057UGxITVoVvB2bN0hU
   3T6Vog1cd83ZXl+/E4R5TJpzyAZCIMaiBsoVsftWQOIt3PYq2GPBfU0E8
   8WFOrWgs20YiVwb+5FBjPH1WLljgRUvS6BEdaok4rFseQ/eo9KY2yUHie
   Q==;
X-CSE-ConnectionGUID: Ks0ipHbSSYCN7EI1TbJQjA==
X-CSE-MsgGUID: 1NjPvlK7RFqv3Ji1AT0ePw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="63269768"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="63269768"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 21:03:24 -0800
X-CSE-ConnectionGUID: oHTJl4xtQXWWUVbH4HhurA==
X-CSE-MsgGUID: 9YENgdVjQdSzczC0/nk67w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114781108"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 Feb 2025 21:03:23 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkyiW-0003sl-2x
	for oe-kbuild-all@lists.linux.dev;
	Thu, 20 Feb 2025 05:03:20 +0000
Date: Thu, 20 Feb 2025 13:02:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] arch/riscv/kernel/smp.c:98: Error:
 unrecognized opcode `csrc 0x144,2', extension `zicsr' required
Message-ID: <202502201325.6ZRDoyGS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: a3182c91ef4e7dda90ff080a4132efd3ecb8786a [1/1] RISC-V: Access CSRs using CSR numbers
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20250220/202502201325.6ZRDoyGS-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502201325.6ZRDoyGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502201325.6ZRDoyGS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/smp.c:74:6: warning: no previous prototype for 'arch_match_cpu_phys_id' [-Wmissing-prototypes]
      74 | bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/smp.c:80:5: warning: no previous prototype for 'setup_profiling_timer' [-Wmissing-prototypes]
      80 | int setup_profiling_timer(unsigned int multiplier)
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/smp.c: Assembler messages:
>> arch/riscv/kernel/smp.c:98: Error: unrecognized opcode `csrc 0x144,2', extension `zicsr' required
   arch/riscv/include/asm/cacheflush.h:25: Error: unrecognized opcode `fence.i', extension `zifencei' required
--
   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a1,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
>> arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,0x100,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
--
   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a2,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s6,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s6', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s3,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a0,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,t3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,t3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s4,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a0,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,t3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,t3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s4,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc t3,0x100,2', extension `zicsr' required
>> arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,t0', extension `zicsr' required
>> arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,t0', extension `zicsr' required
>> arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc t4,0x100,2', extension `zicsr' required
>> arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,t4', extension `zicsr' required
>> arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,t4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc t3,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,t3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,t3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr a5,0x100', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs 0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a0,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,t3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,t3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s4,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s4', extension `zicsr' required


vim +98 arch/riscv/kernel/smp.c

    73	
  > 74	bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
    75	{
    76		return phys_id == cpuid_to_hartid_map(cpu);
    77	}
    78	
    79	/* Unsupported */
    80	int setup_profiling_timer(unsigned int multiplier)
    81	{
    82		return -EINVAL;
    83	}
    84	
    85	static void ipi_stop(void)
    86	{
    87		set_cpu_online(smp_processor_id(), false);
    88		while (1)
    89			wait_for_interrupt();
    90	}
    91	
    92	void riscv_software_interrupt(void)
    93	{
    94		unsigned long *pending_ipis = &ipi_data[smp_processor_id()].bits;
    95		unsigned long *stats = ipi_data[smp_processor_id()].stats;
    96	
    97		/* Clear pending IPI */
  > 98		csr_clear(CSR_SIP, SIE_SSIE);
    99	
   100		while (true) {
   101			unsigned long ops;
   102	
   103			/* Order bit clearing and data access. */
   104			mb();
   105	
   106			ops = xchg(pending_ipis, 0);
   107			if (ops == 0)
   108				return;
   109	
   110			if (ops & (1 << IPI_RESCHEDULE)) {
   111				stats[IPI_RESCHEDULE]++;
   112				scheduler_ipi();
   113			}
   114	
   115			if (ops & (1 << IPI_CALL_FUNC)) {
   116				stats[IPI_CALL_FUNC]++;
   117				generic_smp_call_function_interrupt();
   118			}
   119	
   120			if (ops & (1 << IPI_CPU_STOP)) {
   121				stats[IPI_CPU_STOP]++;
   122				ipi_stop();
   123			}
   124	
   125			BUG_ON((ops >> IPI_MAX) != 0);
   126	
   127			/* Order data access and bit testing. */
   128			mb();
   129		}
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
