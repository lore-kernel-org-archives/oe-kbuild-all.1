Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5115F12EBDB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 03:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731297518; cv=none; b=knjNldnbWBzR1HzRCF5rcU6OZfoKup5JhWpHjEZ+3OtbclcKqOSMdTGxkYs2+f2DnalXrW8DqpxB8kcKDBwj8tX7jjkFAHuRpHYHhV0nq/6KJQDXE6xhQL/gDmTbgGg7gG1ezrJOLdzWAC1V7Pw+bq3r5CUYjo4GC/k/n0FJw+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731297518; c=relaxed/simple;
	bh=7dftOBenfsrHTN4GHTETpijwE1SSS0BFPVX6P+PqJH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yc+TgXCBxoprkmcZ3jTusHyCztyA+shJQhP7upb3CCxIQBfCbIgYciwrWt3x7sEzrVzRjEsGt+J6jtVLRPqkTo58mFqsbacDhkza5Kian+r/WYwc9L7DEgSP09bRm0A4z30pqGnI7dFn3udO8r8y65FoENwRhAfVnGCW08e1WGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdYTtJTM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdYTtJTM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731297516; x=1762833516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7dftOBenfsrHTN4GHTETpijwE1SSS0BFPVX6P+PqJH4=;
  b=hdYTtJTMo3keWJ9rWjC+MWtiVDD/ujadNQNkTG3d20HnmDWrp6JrBmBs
   4/chBFiDjflJjGYnkmtOrWxhvqC4BhQJAK1gTI7L0AW5SVXakUr4+17/N
   pqdoqtpCkRyjRGHgxSW0+nlAezELN7Hx/Rx5V780xUvqBL62HabmK6htu
   lnow2iy2s7QwFnDakQr86kWAGvI3uiBg1O99XKiY7WSDvlA3KeWHLjci+
   Vgpfa/GtXDXwguoyXfw3XoDZL0S2lhTFdgJaXeCUlANf/EEurTXB8e4dp
   m5bLkRsXAphEkpLQKZt2o7pALUkWLi3mTWwSYi4+UHkUxQqbMyW0i7lkK
   w==;
X-CSE-ConnectionGUID: ilHGM9i2RoWK+jBnuBUT2A==
X-CSE-MsgGUID: MUf9sKG0RX2JjXp30FlpPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53657206"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53657206"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 19:58:36 -0800
X-CSE-ConnectionGUID: bndGXzUKRkKjLk4wEawDRw==
X-CSE-MsgGUID: cYItB0zSScO/EN8d7rV7yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86676027"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Nov 2024 19:58:34 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tALZQ-0000g6-11;
	Mon, 11 Nov 2024 03:58:32 +0000
Date: Mon, 11 Nov 2024 11:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 18/19]
 arch/arm64/kernel/ftrace.c:203:33: sparse: sparse: cast to restricted __le32
Message-ID: <202411111420.efjmlOE1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   0b2c6214cb26d94f883e8935b878dcae1f76af1b
commit: ee530bd1add777c02ba82a7d8f942cfda0ae272a [18/19] ftrace: Add ftrace_get_symaddr to convert fentry_ip to symaddr
config: arm64-randconfig-r111-20241110 (https://download.01.org/0day-ci/archive/20241111/202411111420.efjmlOE1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241111/202411111420.efjmlOE1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411111420.efjmlOE1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/ftrace.c:203:33: sparse: sparse: cast to restricted __le32
>> arch/arm64/kernel/ftrace.c:203:33: sparse: sparse: cast to restricted __le32
>> arch/arm64/kernel/ftrace.c:203:33: sparse: sparse: cast to restricted __le32
>> arch/arm64/kernel/ftrace.c:203:33: sparse: sparse: cast to restricted __le32
>> arch/arm64/kernel/ftrace.c:203:33: sparse: sparse: cast to restricted __le32
>> arch/arm64/kernel/ftrace.c:203:33: sparse: sparse: cast to restricted __le32
   arch/arm64/kernel/ftrace.c: note: in included file (through include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +203 arch/arm64/kernel/ftrace.c

   145	
   146	/* Convert fentry_ip to the symbol address without kallsyms */
   147	unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
   148	{
   149		u32 insn;
   150	
   151		/*
   152		 * When using patchable-function-entry without pre-function NOPS, ftrace
   153		 * entry is the address of the first NOP after the function entry point.
   154		 *
   155		 * The compiler has either generated:
   156		 *
   157		 * func+00:	func:	NOP		// To be patched to MOV X9, LR
   158		 * func+04:		NOP		// To be patched to BL <caller>
   159		 *
   160		 * Or:
   161		 *
   162		 * func-04:		BTI	C
   163		 * func+00:	func:	NOP		// To be patched to MOV X9, LR
   164		 * func+04:		NOP		// To be patched to BL <caller>
   165		 *
   166		 * The fentry_ip is the address of `BL <caller>` which is at `func + 4`
   167		 * bytes in either case.
   168		 */
   169		if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
   170			return fentry_ip - AARCH64_INSN_SIZE;
   171	
   172		/*
   173		 * When using patchable-function-entry with pre-function NOPs, BTI is
   174		 * a bit different.
   175		 *
   176		 * func+00:	func:	NOP		// To be patched to MOV X9, LR
   177		 * func+04:		NOP		// To be patched to BL <caller>
   178		 *
   179		 * Or:
   180		 *
   181		 * func+00:	func:	BTI	C
   182		 * func+04:		NOP		// To be patched to MOV X9, LR
   183		 * func+08:		NOP		// To be patched to BL <caller>
   184		 *
   185		 * The fentry_ip is the address of `BL <caller>` which is at either
   186		 * `func + 4` or `func + 8` depends on whether there is a BTI.
   187		 */
   188	
   189		/* If there is no BTI, the func address should be one instruction before. */
   190		if (!IS_ENABLED(CONFIG_ARM64_BTI_KERNEL))
   191			return fentry_ip - AARCH64_INSN_SIZE;
   192	
   193		/* We want to be extra safe in case entry ip is on the page edge,
   194		 * but otherwise we need to avoid get_kernel_nofault()'s overhead.
   195		 */
   196		if ((fentry_ip & ~PAGE_MASK) < AARCH64_INSN_SIZE * 2) {
   197			if (get_kernel_nofault(insn, (u32 *)(fentry_ip - AARCH64_INSN_SIZE * 2)))
   198				return 0;
   199		} else {
   200			insn = *(u32 *)(fentry_ip - AARCH64_INSN_SIZE * 2);
   201		}
   202	
 > 203		if (aarch64_insn_is_bti(le32_to_cpu((__le32)insn)))
   204			return fentry_ip - AARCH64_INSN_SIZE * 2;
   205	
   206		return fentry_ip - AARCH64_INSN_SIZE;
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
