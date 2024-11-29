Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EF919F423
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 19:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732908168; cv=none; b=p8aKIAcpS7QHaHTOcjUztRvYmaXkfwDedGJ7FNPWglPhqTAsjOtVAR6clnCxQsT8PP4e6FtX2rXG5CHM25f7BRSQR7eToKzvO00tC/cuVVEdnFcUzILGBvZDC7YCpiCXJMskD+Ls6TLbq+0ZfnwR/Fx71u348u283JvLlYB2fBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732908168; c=relaxed/simple;
	bh=zGN0lFKJqZ/bsAZLPtWCUMtw8UIFWAXETbC7ucX197E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PXCJz2GTy3pjxIlDsP8ZLVVm8QeaFRIyRIhlYSD84B71KQh5X3EQEbGB4Nv/7kOVcvxBjLSaGMljOIgUbTMdh1Qp1I4pwxAkolhopYlKDVLMnUmQ51ytGcDAyo1ihhXgDIAdfFDqXLKsjxBbT2Pq5fXFeN52L++3wvqgZip/IpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRvzdCie; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRvzdCie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732908166; x=1764444166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zGN0lFKJqZ/bsAZLPtWCUMtw8UIFWAXETbC7ucX197E=;
  b=KRvzdCiesJKNSmuxppMN6dh0jEjPnbSzyvcvJQr8nHI7WmPHO6WwhxFB
   Geb8+q9fAf9PkeGmxGr8ObqTT5aGiEc3PfIt52qV8DzbX7s4p18JuSzEf
   pm00e7sELluCzvuXl3sS64sGFdaf+aeZ+AXv5/Ko42zkfKoEYr4vNbApt
   Zcz7LIWQeExG9S+3I5fylgeiW0r64HDZXqv3lejslno8tJ3dF8KVqLTId
   hXWjpFzBVr5loUg+m7A0eWgwNycqlA/xaCMcRfziXb7bHiNba1guTpO6z
   yW5sIdHCDJfha5ORHFTIckUotEgmAY1xun895dcaI58N7o6yiSbjITVFV
   Q==;
X-CSE-ConnectionGUID: FY1yrVRISmG6uw16Bg3MwA==
X-CSE-MsgGUID: hbIjNQQ1SSe5vSBkF4XgEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36008586"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="36008586"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 11:22:45 -0800
X-CSE-ConnectionGUID: ts140f2kRTaVXHmnz6Slzw==
X-CSE-MsgGUID: FLqth7EUTCeYfUBvVfkTrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="92464762"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Nov 2024 11:22:44 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH6Ze-0000e5-0M;
	Fri, 29 Nov 2024 19:22:42 +0000
Date: Sat, 30 Nov 2024 03:22:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt 4/12] include/linux/stddef.h:8:14:
 error: passing argument 5 of 'uprobe_write_opcode' makes integer from
 pointer without a cast
Message-ID: <202411300322.wFOMBzQ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt
head:   e1ae80d388ea2e1e3501ac7ddac7090137c4a70c
commit: 0619df561eeb118725e9982d7af503e770cc986f [4/12] uprobes: Add data argument to uprobe_write_opcode function
config: arm-randconfig-004-20241130 (https://download.01.org/0day-ci/archive/20241130/202411300322.wFOMBzQ3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300322.wFOMBzQ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300322.wFOMBzQ3-lkp@intel.com/

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
   arch/arm/include/asm/opcodes.h:92:34: error: passing argument 4 of 'uprobe_write_opcode' makes pointer from integer without a cast [-Wint-conversion]
      92 | #define ___opcode_identity32(x) ((u32)(x))
         |                                 ~^~~~~~~~~
         |                                  |
         |                                  unsigned int
   arch/arm/include/asm/opcodes.h:109:32: note: in expansion of macro '___opcode_identity32'
     109 | #define __opcode_to_mem_arm(x) ___opcode_identity32(x)
         |                                ^~~~~~~~~~~~~~~~~~~~
   arch/arm/probes/uprobes/core.c:33:20: note: in expansion of macro '__opcode_to_mem_arm'
      33 |                    __opcode_to_mem_arm(auprobe->bpinsn), NULL);
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13:
   include/linux/uprobes.h:185:49: note: expected 'uprobe_opcode_t *' {aka 'unsigned int *'} but argument is of type 'unsigned int'
     185 |                                uprobe_opcode_t *insn, int nbytes, void *data);
         |                                ~~~~~~~~~~~~~~~~~^~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:317,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from arch/arm/probes/uprobes/core.c:6:
>> include/linux/stddef.h:8:14: error: passing argument 5 of 'uprobe_write_opcode' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   arch/arm/probes/uprobes/core.c:33:58: note: in expansion of macro 'NULL'
      33 |                    __opcode_to_mem_arm(auprobe->bpinsn), NULL);
         |                                                          ^~~~
   include/linux/uprobes.h:185:59: note: expected 'int' but argument is of type 'void *'
     185 |                                uprobe_opcode_t *insn, int nbytes, void *data);
         |                                                       ~~~~^~~~~~
   arch/arm/probes/uprobes/core.c:32:16: error: too few arguments to function 'uprobe_write_opcode'
      32 |         return uprobe_write_opcode(auprobe, mm, vaddr,
         |                ^~~~~~~~~~~~~~~~~~~
   include/linux/uprobes.h:184:12: note: declared here
     184 | extern int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm, unsigned long vaddr,
         |            ^~~~~~~~~~~~~~~~~~~
   arch/arm/probes/uprobes/core.c:34:1: warning: control reaches end of non-void function [-Wreturn-type]
      34 | }
         | ^


vim +/uprobe_write_opcode +8 include/linux/stddef.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  6  
^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e218287432472 Richard Knutsson 2006-09-30  9  

:::::: The code at line 8 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
