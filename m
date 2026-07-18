Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10BC368287
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 20:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405432; cv=none; b=bQYmcN1LIq2tf6ueYqaJLlXBI6RtoztK92FvTmJu5J8ao5fuTv0rtJ+QXhuI8NvWFPcFxILnMONPdoEF+Nqc2PJFiNijcMeHdEWRbZ5hcU/Yc7kwGKyLbTWS0JZVnRnaeU4zamYVYRzkuUMDvC4o+Hjxrs7XVh07/9/iPjQ0tZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405432; c=relaxed/simple;
	bh=2bhkg2zhWKzrobMGHWO20WDnFwxfyRj1hGyjLLFgnHY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QitcVEOiGELJvSf3B03SH2+KyPIyzw5Su4cF/1+Iq/Pqqp+/JPx4uL2AEI5gCVALTDw9XURYizNE3cNy++J3xlobItk4JfKsvQrmKLj0/Lhxc+NXh9g5W2n0qbD6kiHwMycgt2Bs18R6AO+lKdfcUyK1v79dmy1zQ7bBj/RIjSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mTx5Ymhd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mTx5Ymhd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784405429; x=1815941429;
  h=date:from:to:cc:subject:message-id;
  bh=2bhkg2zhWKzrobMGHWO20WDnFwxfyRj1hGyjLLFgnHY=;
  b=mTx5YmhdE+cU9PZisKvDPSZrCw6FEbnrLv6Mq/vFzGESQo7zhn6qRDXd
   wJU2qUziEiMQNkgjgkiEQZYWYpIp8tTRzqzK9eTdajNnd8yWdPZuW67vu
   dlk/DWWXVp/Vs+S1g1aAvhSqr0XWFXCWWcyAQ3ZoMlPxWSqKfngCknvgW
   le/3weGSpHrCB4coplfKSjR6dRJnp3rL2H6+YeCpM2m5zUUJaTjxxdRzF
   U4+tbCYFPukccxq+BjTm4ixvlbPjEGt9E5fViYnFJIHJsDsx9qddzQYm4
   bvEmINCAd9bSsy9d4BRFGkqVpojQU2JbcLg+s4Gndir04AzGtKIuUcVNQ
   A==;
X-CSE-ConnectionGUID: LV0n/j26TNmHE6yXKzNhdw==
X-CSE-MsgGUID: lFR3qOcFQUSW1eZsJh0JLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="95637462"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="95637462"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 13:10:29 -0700
X-CSE-ConnectionGUID: I52RU+SbTt2AqBjHiWW8JQ==
X-CSE-MsgGUID: IMEcWmk1SzGMogFYGDVp7Q==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jul 2026 13:10:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlBMO-00000000V5F-3ysG;
	Sat, 18 Jul 2026 20:10:18 +0000
Date: Sun, 19 Jul 2026 04:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Subject: [linux-next:master 6206/7584]
 arch/riscv/include/asm/pgtable.h:584:47: error: variable 'asid' is
 uninitialized when used here
Message-ID: <202607190303.yJvChj80-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
commit: 6dfbb04908eb630ae6a592454b28c2f666a20a5a [6206/7584] riscv: mm: Apply Svinval in update_mmu_cache()
config: riscv-randconfig-r063-20260718 (https://download.01.org/0day-ci/archive/20260719/202607190303.yJvChj80-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190303.yJvChj80-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607190303.yJvChj80-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:10:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/riscv/include/asm/uaccess.h:13:
>> arch/riscv/include/asm/pgtable.h:584:47: error: variable 'asid' is uninitialized when used here [-Werror,-Wuninitialized]
     584 |                         local_sinval_vma(address + nr * PAGE_SIZE, asid);
         |                                                                    ^~~~
   arch/riscv/include/asm/pgtable.h:571:20: note: initialize the variable 'asid' to silence this warning
     571 |         unsigned long asid;
         |                           ^
         |                            = 0
   1 error generated.


vim +/asid +584 arch/riscv/include/asm/pgtable.h

   561	
   562	#define pgd_ERROR(e) \
   563		pr_err("%s:%d: bad pgd " PTE_FMT ".\n", __FILE__, __LINE__, pgd_val(e))
   564	
   565	
   566	/* Commit new configuration to MMU hardware */
   567	static inline void update_mmu_cache_range(struct vm_fault *vmf,
   568			struct vm_area_struct *vma, unsigned long address,
   569			pte_t *ptep, unsigned int nr)
   570	{
   571		unsigned long asid;
   572	
   573		/*
   574		 * Svvptc guarantees that the new valid pte will be visible within
   575		 * a bounded timeframe, so when the uarch does not cache invalid
   576		 * entries, we don't have to do anything.
   577		 */
   578		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC))
   579			return;
   580	
   581		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)) {
   582			local_sfence_w_inval();
   583			while (nr--)
 > 584				local_sinval_vma(address + nr * PAGE_SIZE, asid);
   585			local_sfence_inval_ir();
   586			return;
   587		}
   588	
   589		/*
   590		 * The kernel assumes that TLBs don't cache invalid entries, but
   591		 * in RISC-V, SFENCE.VMA specifies an ordering constraint, not a
   592		 * cache flush; it is necessary even after writing invalid entries.
   593		 * Relying on flush_tlb_fix_spurious_fault would suffice, but
   594		 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
   595		 */
   596		asid = get_mm_asid(vma->vm_mm);
   597		while (nr--)
   598			local_flush_tlb_page_asid(address + nr * PAGE_SIZE, asid);
   599	}
   600	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
