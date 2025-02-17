Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157F0215766
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 09:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739784796; cv=none; b=lw4ksI8eYqWmbnMOqkQwsIqpJaXhWBGMt47/SPYYXUzKEK3vyYcxVQKQru9IH2GgPLU82zudvUMMMmshrX+ZJ1QFjNsnlupdOGgAovyx6uCbVf/vve0SmhFmO1S8RnEHBtlc78aySiHzCERfCnl/GNbwVY90Qe1tlfdX5bXUZhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739784796; c=relaxed/simple;
	bh=/qU26O7NW6ODjv+5twqWk4b6xyYP57A4f5/p6wv0qWM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jOOaDnrj/NObK/radq9Te74eWxz/q22HU2mBmvSGqRr3y3bx8EDk4/cgxhgqj94faOHFrLKuM/Mwek9v46ECWRPaWlBFYHUVcoJK/vGSdYgawD4jwsUVj4e5R9cTlZZJWFvIbnWneCnbeVn21euE0DIHuyTNz+Wq0BE+K7n0eow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJqPGLlb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJqPGLlb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739784795; x=1771320795;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/qU26O7NW6ODjv+5twqWk4b6xyYP57A4f5/p6wv0qWM=;
  b=kJqPGLlb/Ka5b+0uh9tspY8yzOy6zC/0DXA26mO3/0MWxsirPw5lBRzm
   7UYu8tBmSQ24DtHCo6qMXE7/tjJGJfAZIVIIcDAFMzBtmIKTDMLyPSshD
   DFSKTJ/zZORODYXeFzcslu2aX4yywp52S8YhAd/ckbuNFDOeOf1WqnFAr
   l/DGy7FaEUoG/PDVKgLYHvhMXEoYoR9ijqqqJjPCe7WZxOInZP8u0Er13
   FkGwqcaiAO8SQjFHPaU1l5OqixmEFESxR28f0cGBvWFWPsp2sLHDOl4W0
   VeD/MHkxSV1Z2dYQkcej07P+DEM1yH1H/4H9VzU9eHcKnm7Fq3YHfY4fC
   A==;
X-CSE-ConnectionGUID: K/UzrQGyQtW90KRI3eXpZA==
X-CSE-MsgGUID: yQzObaOFTL+ujrkJWYPqYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="62930944"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="62930944"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 01:33:14 -0800
X-CSE-ConnectionGUID: 3Sd0LNUIRE24kxOrPstA4w==
X-CSE-MsgGUID: +YjwKmDhQ4yz6qPdCvXFWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="114700119"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Feb 2025 01:33:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjxV1-001Ctr-0z
	for oe-kbuild-all@lists.linux.dev;
	Mon, 17 Feb 2025 09:33:11 +0000
Date: Mon, 17 Feb 2025 17:32:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] arch/riscv/include/asm/irqflags.h:42: Error:
 unrecognized opcode `csrrc s1,0x100,a5', extension `zicsr' required
Message-ID: <202502171748.XxmxE1rR-lkp@intel.com>
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
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20250217/202502171748.XxmxE1rR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502171748.XxmxE1rR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502171748.XxmxE1rR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/random.c:2345:6: warning: no previous prototype for 'add_hwgenerator_randomness' [-Wmissing-prototypes]
    2345 | void add_hwgenerator_randomness(const char *buffer, size_t count,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc t1,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,t1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,t1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s4,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s0,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s0,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s0,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a0,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a5', extension `zicsr' required
>> arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,0x100,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s2', extension `zicsr' required
   drivers/char/random.c:1971: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   drivers/char/random.c:1971: Error: unrecognized opcode `csrc sstatus,a3', extension `zicsr' required
   drivers/char/random.c:1983: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   drivers/char/random.c:1983: Error: unrecognized opcode `csrc sstatus,a3', extension `zicsr' required
   drivers/char/random.c:1987: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   drivers/char/random.c:1987: Error: unrecognized opcode `csrc sstatus,a3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s3,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s3', extension `zicsr' required
   drivers/char/random.c:1977: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   drivers/char/random.c:1977: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s0,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a1,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s0,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc t6,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,t6', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a0,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s0,0x100,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs 0x100,s0', extension `zicsr' required


vim +42 arch/riscv/include/asm/irqflags.h

    38	
    39	/* get status and disable interrupts */
    40	static inline unsigned long arch_local_irq_save(void)
    41	{
  > 42		return csr_read_clear(CSR_SSTATUS, SR_SIE);
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
