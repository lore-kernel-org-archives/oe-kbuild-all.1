Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082881E48A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730121185; cv=none; b=PZQ8gF+qBs4Nh7ViPTiSSJwahY4dRzqAMwBzWmlLMCaDujGDysTUSXPcGtqdgPs3Ca4mw3Xwq8jSVsODdqZURbXlvSA+yUlA3wrwdIhy2a3sZYducsM0C9TY/wdmZ8SswFxkly9Cl6P8JkqAwE7m19tUHJhMCaWqlDMGc2z1ngI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730121185; c=relaxed/simple;
	bh=V4OLsIBBI4R3hv0Er/CLIF04EmO6gCCV4xgmJcw2VD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n3XHEoRUdGXULmiMQPsTjlwtxtXkdASsMQGog3h/xx6kqxWos9RyvFpHqCTUY95S6Vf90Wgjldpcmai9dieXAyegi6J1jgTOX5ZsBou4ibcvrteZ941h8BhqCu54OaFHSwxp6Z/5K0hTheP6vWTmXUbR2VttaFLu5QkiDcD7rf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0xaHrV5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0xaHrV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730121183; x=1761657183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V4OLsIBBI4R3hv0Er/CLIF04EmO6gCCV4xgmJcw2VD4=;
  b=P0xaHrV5PcTuXYHovRjWDLVjQCYfJVxCPcvi+qIvezvjUnsUHC5OnL/A
   L9rPXAaRDldJJrKebenoOqXcmjc8ZMdHYc+0xi+NV0784fmUDXm0ARG8L
   VmeXz1CS/WRHJjRxM5Suh1Q7KyTc+17bEs4/eBWBGHaPtgvk82Ltide9l
   Lnms+TLvdrC4MmVr5eiFC4XQvnoacxPL8uMoG+EBDcUdp80zLTXPqb9VK
   xsqmFvl9sDRGOGDPZEs55PdLVJM8goYGvIU2oEJFP9JHVW4VzeYwU8DXL
   FqVHb6vJhZCdh3ta83sFWIZlkMwPOszt5R2quFQSoBrgnu1Z9speCcnUI
   Q==;
X-CSE-ConnectionGUID: pMaZB2W0Q/yyVLSAgTlFyQ==
X-CSE-MsgGUID: 1yR7cx/XSU+dt+M9m8snZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="33509865"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="33509865"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 06:13:02 -0700
X-CSE-ConnectionGUID: EEl5fi6iQUmBZDiFr6GNYg==
X-CSE-MsgGUID: fVArUcF+S/y+IN58sRvklQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81938856"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Oct 2024 06:13:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5PYJ-000cSo-1N;
	Mon, 28 Oct 2024 13:12:59 +0000
Date: Mon, 28 Oct 2024 21:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_5 19/26]
 arch/arm/include/asm/opcodes.h:92:34: error: passing argument 4 of
 'uprobe_write_opcode' makes pointer from integer without a cast
Message-ID: <202410282104.uq9H7ECC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_5
head:   748f02be1adc50c8aea1e580791e8085f8713c07
commit: 50e835aa3f397de2a9c72606596f055ec05e1445 [19/26] uprobes: Add len argument to uprobe_write_opcode
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241028/202410282104.uq9H7ECC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410282104.uq9H7ECC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410282104.uq9H7ECC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from arch/arm/probes/uprobes/core.c:9:
   arch/arm/probes/uprobes/core.c: In function 'set_swbp':
>> arch/arm/include/asm/opcodes.h:92:34: error: passing argument 4 of 'uprobe_write_opcode' makes pointer from integer without a cast [-Wint-conversion]
      92 | #define ___opcode_identity32(x) ((u32)(x))
         |                                 ~^~~~~~~~~
         |                                  |
         |                                  unsigned int
   arch/arm/include/asm/opcodes.h:109:32: note: in expansion of macro '___opcode_identity32'
     109 | #define __opcode_to_mem_arm(x) ___opcode_identity32(x)
         |                                ^~~~~~~~~~~~~~~~~~~~
   arch/arm/probes/uprobes/core.c:33:20: note: in expansion of macro '__opcode_to_mem_arm'
      33 |                    __opcode_to_mem_arm(auprobe->bpinsn));
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13:
   include/linux/uprobes.h:134:104: note: expected 'uprobe_opcode_t *' {aka 'unsigned int *'} but argument is of type 'unsigned int'
     134 | extern int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm, unsigned long vaddr, uprobe_opcode_t*, int);
         |                                                                                                        ^~~~~~~~~~~~~~~~
   arch/arm/probes/uprobes/core.c:32:16: error: too few arguments to function 'uprobe_write_opcode'
      32 |         return uprobe_write_opcode(auprobe, mm, vaddr,
         |                ^~~~~~~~~~~~~~~~~~~
   include/linux/uprobes.h:134:12: note: declared here
     134 | extern int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm, unsigned long vaddr, uprobe_opcode_t*, int);
         |            ^~~~~~~~~~~~~~~~~~~
   arch/arm/probes/uprobes/core.c:34:1: warning: control reaches end of non-void function [-Wreturn-type]
      34 | }
         | ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/uprobe_write_opcode +92 arch/arm/include/asm/opcodes.h

f5f5195487affe Dave Martin 2012-02-01  87  
0ce3de23f2a520 Dave Martin 2012-09-03  88  #define ___opcode_swab32(x) swab32(x)
0ce3de23f2a520 Dave Martin 2012-09-03  89  #define ___opcode_swab16(x) swab16(x)
0ce3de23f2a520 Dave Martin 2012-09-03  90  #define ___opcode_swahb32(x) swahb32(x)
0ce3de23f2a520 Dave Martin 2012-09-03  91  #define ___opcode_swahw32(x) swahw32(x)
0ce3de23f2a520 Dave Martin 2012-09-03 @92  #define ___opcode_identity32(x) ((u32)(x))
0ce3de23f2a520 Dave Martin 2012-09-03  93  #define ___opcode_identity16(x) ((u16)(x))
0ce3de23f2a520 Dave Martin 2012-09-03  94  

:::::: The code at line 92 was first introduced by commit
:::::: 0ce3de23f2a520a6ac8c2179fb8f88342c4992ef ARM: 7509/1: opcodes: Make opcode byteswapping macros assembly-compatible

:::::: TO: Dave Martin <dave.martin@linaro.org>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
