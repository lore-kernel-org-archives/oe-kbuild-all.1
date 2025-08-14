Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C1A2EA72D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 13:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755177771; cv=none; b=ZlsUhVAtXASyAeoxdyi1MjujpwoyJWenuhQeeZIVOid4I8JSMy5DTX55GrU5O7+qveCa+RCsjCnti1K5VA95wvF2EaSMoQ0FLu/CmKdH3rxZEvnYj8M5jqRb6gqiqGKzIKxbGYTgNU3SLm6uOrTip/Q7JkSCzSv0Lc/5r3HEqbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755177771; c=relaxed/simple;
	bh=wPKAg9nHnOuAh/csqFy2+nDMmaeM2ljp2o7z7gieg0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=btE+bS8azMbM5NhBToBZlgIv8xpQDmYwXCaXwgDkin5qsKR//fPNSL57W4cjS+TzmpbcLF56piZOS4ee6emCVyo3o54zb10J9Z9koEX05KEafY3aZ1JBP3ZovJnjysEp3ywjU9NXjgTFCdYLy/wZeNpjIQVHbwxTTCQxP0d2t/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hz4NV7LB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hz4NV7LB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755177770; x=1786713770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wPKAg9nHnOuAh/csqFy2+nDMmaeM2ljp2o7z7gieg0I=;
  b=Hz4NV7LBxvmhDvhrNdl684WhoWRhsxtMH0/IMYTk2Vc2Juop2TxCwBrN
   /8v2RgPSsUX60XGhnf9ebCdCFj3Kmj3gvyKD/sqcfr4Xjy9jzI9QEBJoH
   ox4r5HznAX1CUvSnut7sg33ZvpL3X4OTpI2qafTkoNAYFj16aKnr856Z2
   cpBFwyuTHkpi5+7HWu3TbKwkEPRb5cvW6us2kX0Pnp/0TtYps80bdcTGm
   4jBF/dpOGuf4qEvJVywRh5lBpm28YdIJf8xDVu2QJ8iTtoHb30SBJ77NJ
   hyd6dTsd4NIF8tcgDqPyxn0deEZmDzEOnIZZxHWBtg0ZeEPpL7iF2ydrR
   Q==;
X-CSE-ConnectionGUID: DcbPkkc8Rtq+BF9xeuM8cg==
X-CSE-MsgGUID: JyMfXTbOTz+EuFukEA7clw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68572829"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68572829"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 06:22:49 -0700
X-CSE-ConnectionGUID: aKAgQ1tIQpqCa8qogGg9CQ==
X-CSE-MsgGUID: 9X14NVIrRTKKkGxCGcuzbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="167017349"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2025 06:22:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umXuT-000Ayy-0r;
	Thu, 14 Aug 2025 13:22:29 +0000
Date: Thu, 14 Aug 2025 21:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v1 32/59]
 arch/riscv/kernel/kgdb.c:38:38: warning: passing argument 3 of 'get_insn'
 makes pointer from integer without a cast
Message-ID: <202508142145.ZHFolVUw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   a186d4c58325610367072323cfc9a7d5cccc2fb9
commit: 87868b1826434a428632177d565fce3d8ebe43dd [32/59] riscv: Add insn.c, consolidate instruction decoding
config: riscv-randconfig-r062-20250814 (https://download.01.org/0day-ci/archive/20250814/202508142145.ZHFolVUw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508142145.ZHFolVUw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508142145.ZHFolVUw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/kgdb.c: In function 'do_single_step':
>> arch/riscv/kernel/kgdb.c:38:38: warning: passing argument 3 of 'get_insn' makes pointer from integer without a cast [-Wint-conversion]
      38 |         error = get_insn(regs, addr, stepped_opcode);
         |                                      ^~~~~~~~~~~~~~
         |                                      |
         |                                      unsigned int
   In file included from arch/riscv/kernel/kgdb.c:14:
   arch/riscv/include/asm/insn.h:555:54: note: expected 'ulong *' {aka 'long unsigned int *'} but argument is of type 'unsigned int'
     555 | int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn);
         |                                               ~~~~~~~^~~~~~


vim +/get_insn +38 arch/riscv/kernel/kgdb.c

    25	
    26	static int do_single_step(struct pt_regs *regs)
    27	{
    28		/* Determine where the target instruction will send us to */
    29		unsigned long addr, insn;
    30		int error = get_insn(regs, regs->epc, &insn);
    31	
    32		if (error)
    33			return error;
    34	
    35		addr = get_step_address(regs, insn);
    36	
    37		/* Store the op code in the stepped address */
  > 38		error = get_insn(regs, addr, stepped_opcode);
    39		if (error)
    40			return error;
    41	
    42		stepped_address = addr;
    43	
    44		/* Replace the op code with the break instruction */
    45		error = copy_to_kernel_nofault((void *)stepped_address,
    46					   arch_kgdb_ops.gdb_bpt_instr,
    47					   BREAK_INSTR_SIZE);
    48		/* Flush and return */
    49		if (!error) {
    50			flush_icache_range(addr, addr + BREAK_INSTR_SIZE);
    51			kgdb_single_step = 1;
    52			atomic_set(&kgdb_cpu_doing_single_step,
    53				   raw_smp_processor_id());
    54		} else {
    55			stepped_address = 0;
    56			stepped_opcode = 0;
    57		}
    58		return error;
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
