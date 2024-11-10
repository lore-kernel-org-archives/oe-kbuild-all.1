Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DB12AD20
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 07:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731223786; cv=none; b=YzwU0cliykKOzFn0ameThDSV1A4DvC6Jrz6JrQtRhPjbLbbAhL3A2rKvKm+kRK7yYvpyVabH1Uai6dtORUhtRrVipj9OXpxk3q/fajylzY9Up2QVYnJx7zggNEWw0z8pIOmFXvg8uyP6h/r4o2LPf7G3vLk7HNnDJMAMlARYp1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731223786; c=relaxed/simple;
	bh=n/YUBUXLhf4ZLdw6pJ8Gxeq7+Ra+m6W/ECeYYfQsaRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PNGgMdauveP7t5QSd4k8QCetLlLwppn+ZOC4r9/iKDxtyHT/byw1h/7Ic9nAluNNzlleYqSUfHp7NTQwYb+8ngFTxUCA+2gJBm0+9jmGvqZ0slJ3Haq0Gtx15pMJ70+qfkPazYZWe87MR4wAuV5CmZoDwtT0Ec7lOd0ItSo61o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YraPHf6R; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YraPHf6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731223785; x=1762759785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n/YUBUXLhf4ZLdw6pJ8Gxeq7+Ra+m6W/ECeYYfQsaRo=;
  b=YraPHf6RZPVwD5JZUIPu9OupKFir90V0htBNv2kpt4aCFf0wDuB2+zkA
   BM7uAErqALINcdWWQiKk1Ue0cyKulBEG9lXztUNvQXuHeK8WsLOE8g88M
   Zqd4sN4aFuIpPWK0ZU7CRMBRhGbnYi6W6yrk0ZNqXmf57PSEN6TAb6WEf
   wfq7GXebyiW0xeUCJqgJdU0gT4egKE0OqeXD/znxRA3d3RvKSYSG3pHdB
   Lrlo4HXLnO3GY1f0qwrYFK6cFKPEeFnPnYI7u2fG5oy+J15r5e7VBRqTq
   nVWJ81QVerVJYY4cP21wiHe5qxHG72o6YTDg114yYUI4bZ0XIYi9EiqaT
   w==;
X-CSE-ConnectionGUID: XbF3xV3gQmy2DO8xkKgpHg==
X-CSE-MsgGUID: cmKBaGnUTyKNsw+GVAFqow==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="34842644"
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="34842644"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 23:29:39 -0800
X-CSE-ConnectionGUID: 9vCSC28KSkC7d/3CNz2k9Q==
X-CSE-MsgGUID: 2kojNjG3S/e7iI4C08xoxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="91426609"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Nov 2024 23:29:37 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tA2O7-00001p-0P;
	Sun, 10 Nov 2024 07:29:35 +0000
Date: Sun, 10 Nov 2024 15:28:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 18/19]
 arch/arm64/kernel/ftrace.c:147:15: warning: no previous prototype for
 'arch_ftrace_get_symaddr'
Message-ID: <202411101546.DAbUjmQW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   4c4bd9c0c8cdbefa8d3ae3b53bc2546220803661
commit: ee530bd1add777c02ba82a7d8f942cfda0ae272a [18/19] ftrace: Add ftrace_get_symaddr to convert fentry_ip to symaddr
config: arm64-randconfig-003-20241110 (https://download.01.org/0day-ci/archive/20241110/202411101546.DAbUjmQW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411101546.DAbUjmQW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411101546.DAbUjmQW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/ftrace.c:147:15: warning: no previous prototype for 'arch_ftrace_get_symaddr' [-Wmissing-prototypes]
     147 | unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
         |               ^~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_ftrace_get_symaddr +147 arch/arm64/kernel/ftrace.c

   145	
   146	/* Convert fentry_ip to the symbol address without kallsyms */
 > 147	unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
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
   203		if (aarch64_insn_is_bti(le32_to_cpu((__le32)insn)))
   204			return fentry_ip - AARCH64_INSN_SIZE * 2;
   205	
   206		return fentry_ip - AARCH64_INSN_SIZE;
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
