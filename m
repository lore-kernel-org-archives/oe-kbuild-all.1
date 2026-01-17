Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D1825D216
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 09:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768641833; cv=none; b=iI7l5CLqaQwzdvTMLbeuoxc4tdQSejnY1MAd1Zf3CPq8JHOvPub8uy8KLV6hL9SfgJ6Zxcw1enzl7LGEuCm0P6Cg4bVuVeHjDF4zr+Z9LjWrCjG3gFEYRP4a3d4vQvh/bUstuVC/sBNq1lCWpN5diMLG6yr4vKypCKK/zEl0r0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768641833; c=relaxed/simple;
	bh=AXsvWsvZN/imM3r1gZWJz0a4rtgfYPUH2NqmevP+2Hs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sSi+l4meIBSlw/AxqNy4wVgaBeYkmtWPYY4FzxTPiSal5fUf1uEI3cgdgPHQne7lKf9CRpPSYUlpi4PZEOWk1nnZCYY7EwwHg6UAEWcNFEK0Ven6y17VUUDHpSZx/PsQHTYgUp50D9ZN3zfuFF+IIc6DRJIYAn2tTvlkokob9Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jq+v5kPe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jq+v5kPe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768641831; x=1800177831;
  h=date:from:to:cc:subject:message-id;
  bh=AXsvWsvZN/imM3r1gZWJz0a4rtgfYPUH2NqmevP+2Hs=;
  b=Jq+v5kPe35mPcpU5GP3YiDRfnboyv6/2gAgztHRKnBQRRtWXYc+uTtH8
   ySe5Q7Eq0MkeCdDrxvnLeeu1x9hedE1TcdI4C42vSlWwKHgV7rDsKUq/4
   D2Cd/LZWEBPAmNVFB3vZHZRCZ5k/xgu+VGdaRpSsyA7m+/E+NxZHO+12A
   jTwa6siuW8IkBcVMyvJhZDFt+CfeL4GIc1KEq5YI57r+guMpFGJulpGFl
   vkTneXIQKfq0dQoKnnnmb9CsPcr06yLwxAUPeUeVB4Z7ceaQHMol7Kr1c
   IgKw6P1sLv+F87L0boLGTMjnRQ6tuIcoF0vROX3DGy7fuguCOC6Yv+qBA
   g==;
X-CSE-ConnectionGUID: lQtBov4SQDKEolfLnlxofQ==
X-CSE-MsgGUID: DgFuucntRhWcRgyZsiDY6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="68951445"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="68951445"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 01:23:50 -0800
X-CSE-ConnectionGUID: GfEgO+lXQnipMMlyBLSsyA==
X-CSE-MsgGUID: 99jSnwnVSTqyDwJpNroocA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="236716302"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jan 2026 01:23:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh2X4-00000000LiC-0cJP;
	Sat, 17 Jan 2026 09:23:46 +0000
Date: Sat, 17 Jan 2026 17:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: arch/arm64/kernel/ftrace.c:203:33: sparse: sparse: cast to
 restricted __le32
Message-ID: <202601171840.CjA4jCQ2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d3eeb99bbc99cc5eb94a4a75ed4415a0272254ef
commit: 2bc56fdae1ba3fc80ee37a648346abc5f152357d ftrace: Add ftrace_get_symaddr to convert fentry_ip to symaddr
date:   1 year, 1 month ago
config: arm64-randconfig-r121-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171840.CjA4jCQ2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171840.CjA4jCQ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171840.CjA4jCQ2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/ftrace.c:203:33: sparse: sparse: cast to restricted __le32

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
