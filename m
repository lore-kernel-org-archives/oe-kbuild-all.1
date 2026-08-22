Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278FE2749C1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Aug 2026 04:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787371536; cv=none; b=qohfrip389mpAitRR74JUi4cXFsuXDcZvl9dsnLB72aT1c2RahXcQB7Z+ebymNGfV3rW4qL6SjgqZOPUitL60bu2msMTzcDImE6cvpbKnA9UgRB0VLJlzas6XLM79PStfba4oOwkiUvOWeW7/x2d7XXPhtyJ+6UN4DKXzbK3YbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787371536; c=relaxed/simple;
	bh=aFEEgBgV44mEStC7XwUYf4t94q1DiUz2DyhGuBAtBk4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TNkft0n5E5F3QjRmrNlN5g6i1odayTpFnnxgcDSxVeIDq0Y2RtHNiX9vc2I68Mmbzmj0ddyLVKKliLKxMDgmWPReFui+YNwUGDV5tcSZiaeW6aDZaZHiwgo6RzQt50Dw/8JySwn+VMH9TC7Ifyd1juk8SPisYY1ADDzNbZbHkbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M26yM+8d; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M26yM+8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787371535; x=1818907535;
  h=date:from:to:cc:subject:message-id;
  bh=aFEEgBgV44mEStC7XwUYf4t94q1DiUz2DyhGuBAtBk4=;
  b=M26yM+8diIW6mqXhjzC6NtfiLMX1O8pa/MDkcfjYe3KyaQbY51Y/n6Cl
   2zME2fUKY9AWC0JQYS/14kzQPcXiSqbXcrMPlhoKSgqcAwG7fdIDggMtG
   zR9Y80maNzD6pHeg6LmbEBG0QPNq9gtQoNtoqBYpfDGEWAc/kGCaIw/am
   KPOSLQn6yt204Jt4fOx3PcBVO+Keivsx9lIda9w8TyRv/moU4VqWnI1Xl
   e1ZslRL7PEkgy1z8zGNDUPC7eCA4Rx5QF6TCIv4qwVj72sRhX1KJGqK9b
   ugkCF03j3HZruN6GQBJZIk3GT/DvPG4sBkiqmJJMHHihOJxW1eNONlw8X
   A==;
X-CSE-ConnectionGUID: Xlt10mLeSJy8OPFR4azxjA==
X-CSE-MsgGUID: anROn0MiQnCC2cFgjDbgJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="91790930"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="91790930"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 21:05:34 -0700
X-CSE-ConnectionGUID: DRScgyMfT86EYTSal1jOWw==
X-CSE-MsgGUID: jESV0qT7SzqdzTorNg3Xnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="268465664"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Aug 2026 21:05:32 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxcz3-00000000qsX-464l;
	Sat, 22 Aug 2026 04:05:29 +0000
Date: Sat, 22 Aug 2026 12:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:module-combine-init-allocations 1/8]
 mm/execmem.c:91:26: error: call to undeclared function
 'get_vm_area_page_order'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202608221129.uFlfO4n1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git module-combine-init-allocations
head:   a598b33b1d60eb215a71876eaf9e694fa22e48ba
commit: 727fc3c108b070521a093337b930b8a3f8eeaf73 [1/8] mm: execmem: Pass an offset to execmem_set_direct_map_valid()
config: riscv-randconfig-r131-20260822 (https://download.01.org/0day-ci/archive/20260822/202608221129.uFlfO4n1-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221129.uFlfO4n1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221129.uFlfO4n1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/execmem.c:22:
   In file included from mm/internal.h:13:
   In file included from include/linux/mm_inline.h:8:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> mm/execmem.c:91:26: error: call to undeclared function 'get_vm_area_page_order'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      91 |         unsigned int nr = (1 << get_vm_area_page_order(vm));
         |                                 ^
   mm/execmem.c:91:26: note: did you mean 'get_vm_area_caller'?
   include/linux/vmalloc.h:247:26: note: 'get_vm_area_caller' declared here
     247 | extern struct vm_struct *get_vm_area_caller(unsigned long size,
         |                          ^
   1 warning and 1 error generated.


vim +/get_vm_area_page_order +91 mm/execmem.c

    87	
    88	static int execmem_set_direct_map_valid(struct vm_struct *vm, bool valid,
    89						int offset)
    90	{
  > 91		unsigned int nr = (1 << get_vm_area_page_order(vm));
    92		unsigned int updated = 0;
    93		int err = 0;
    94	
    95		if (offset % nr)
    96			return -EINVAL;
    97	
    98		for (int i = offset >> PAGE_SHIFT; i < vm->nr_pages; i += nr) {
    99			err = set_direct_map_valid_noflush(vm->pages[i], nr, valid);
   100			if (err)
   101				goto err_restore;
   102			updated += nr;
   103		}
   104	
   105		return 0;
   106	
   107	err_restore:
   108		for (int i = offset >> PAGE_SHIFT; i < updated; i += nr)
   109			set_direct_map_valid_noflush(vm->pages[i], nr, !valid);
   110	
   111		return err;
   112	}
   113	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
