Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A24931A076
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 03:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765769349; cv=none; b=t0oVEntXeqqpj5xlUC4YZJuuAHqjpyz4MdDTTdnigwv6U/G2Oowjhx1FOQuYTCaL9JwBD1Lv9w7m8iRqX176eS8Ji+3s9DmcbNjlWK8dfLGBEFC2GErIkuNUWKLGxz6fgCNcarYFgedBBA+J539aNpZPFumuiUDFcP93cW/yp98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765769349; c=relaxed/simple;
	bh=hg/0RkCb8haWSJMSh2tMs5mDD6U9Q7gnuGs22eblgGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iZcxfHcE9vojKKGp/wxJLXXsft1ECAgFwqFsI0vz9l3EBLLkgbR4oxu7IL4fRpWf63Jf2snocq6LO/fSQLC/6Bpt/JLKi5INx6VWjCJoZJeeGl0ZzXTfCPXJtm/GCus+k7zTwO5IGy76QFidrPvQohWkFyDVDptlYCKM+qehISI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYiQX1G0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYiQX1G0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765769347; x=1797305347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hg/0RkCb8haWSJMSh2tMs5mDD6U9Q7gnuGs22eblgGU=;
  b=SYiQX1G0me7bpGuDGk6vqL43ersuUXXN971yXTB5XgWEDqeS03v9TzJm
   QxT1lSo0vMnpKxFnoFlS8Bk61pL72+tv+ieKFY7Xam5/7oOP5i9Q+sPMc
   nXVUq73tb+/keWH/iZf209WhncNLO+M+CkUUpB6vOTS/Lsy7u5wcOPWUj
   TePmX9q6it+ayotmPXIaEPMV5aZ6FhW1LOfbzl7IF0RAwVbLw7We9TutD
   cS7+YC6M5mKFJx5X/TzEd+BcxoCyEiu2VyvOQOnzD//qTRleQCXcb/Ljt
   r6lEdG690IZOl+MIqfdyg9T88sC8luU9RcZaFolFH1ZY74s4EbM645I2R
   g==;
X-CSE-ConnectionGUID: PFVBp1NAS/2k+xQGWiMrjQ==
X-CSE-MsgGUID: RluoKwv7R+mu7mCQ/qOKpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67739376"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67739376"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 19:29:07 -0800
X-CSE-ConnectionGUID: Bq2JqFYURAyct+GD3qAwNQ==
X-CSE-MsgGUID: 9JPkMFbiSqSiZ3T7+5up5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="196690998"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Dec 2025 19:29:05 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUzGh-000000009ge-0GGS;
	Mon, 15 Dec 2025 03:29:03 +0000
Date: Mon, 15 Dec 2025 11:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: arch/arm64/kernel/ftrace.c:203:33: sparse: sparse: cast to
 restricted __le32
Message-ID: <202512151134.zkcBSJgf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 2bc56fdae1ba3fc80ee37a648346abc5f152357d ftrace: Add ftrace_get_symaddr to convert fentry_ip to symaddr
date:   12 months ago
config: arm64-randconfig-r113-20251215 (https://download.01.org/0day-ci/archive/20251215/202512151134.zkcBSJgf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151134.zkcBSJgf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151134.zkcBSJgf-lkp@intel.com/

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
