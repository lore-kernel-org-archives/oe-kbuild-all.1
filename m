Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AE51AA7A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 22:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693519812; x=1725055812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XIeVjt+cqpSfUXqFqIQqr1Cp2c1zXl/t3FZwNTtLvyI=;
  b=bYD6MYt4MIrOWOmHhySgSoz4el2/fZD/TLESToHZmE9D96R2AXiUz8MN
   vOlNbLuy48XYlVpmDNuVoU0RzaKyhISqpaR7QKLf8CX5QX9Aeoe259pfI
   HLAM+LjHxeUzFZwksJUZa14n2AA1kZuSSMJwUGV/9N5e+mcQ5gkND86Os
   D9bpTg5XKSAtIUjYgQqhLS3pP73i7sMXtfcCsXHMQ9L1liOglYB882xxv
   fXxHKxiONpRH4SZ0lFMOLpMDs61r6bB8txmrpIZQ3sXp0rQbzeVhccPCy
   /FoO6IaKc+aR73CD4xNx0JWJUPw2mt1MCIlqqdnRwR1Dri61awzcR/1+T
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="374983505"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="374983505"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 15:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="768959675"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="768959675"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 31 Aug 2023 15:10:10 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbprb-0000ab-2C;
	Thu, 31 Aug 2023 22:10:07 +0000
Date: Fri, 1 Sep 2023 06:09:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:ktext 1/19] arch/arm64/kernel/head.S:425: Error: too many
 positional arguments
Message-ID: <202309010623.fXZfmAP2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm ktext
head:   16aca73ecf7f0b44a8eea9b550258c8f5e61afb1
commit: 09fdd3534cdba5fa529bcb83ec03df792695c65f [1/19] arm64: place kernel in its own L0 page table entry
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20230901/202309010623.fXZfmAP2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010623.fXZfmAP2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010623.fXZfmAP2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/head.S:27:
   arch/arm64/include/asm/kernel-pgtable.h:129:41: warning: "PUD_SHIFT" is not defined, evaluates to 0 [-Wundef]
     129 | #define ARM64_MEMSTART_SHIFT            PUD_SHIFT
         |                                         ^~~~~~~~~
   arch/arm64/include/asm/kernel-pgtable.h:142:5: note: in expansion of macro 'ARM64_MEMSTART_SHIFT'
     142 | #if ARM64_MEMSTART_SHIFT < SECTION_SIZE_BITS
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/head.S: Assembler messages:
>> arch/arm64/kernel/head.S:425: Error: too many positional arguments
   arch/arm64/kernel/head.S:790: Error: too many positional arguments


vim +425 arch/arm64/kernel/head.S

e42ade29e3bcb3 Ard Biesheuvel           2022-06-24  422  
e42ade29e3bcb3 Ard Biesheuvel           2022-06-24  423  SYM_FUNC_START_LOCAL(create_kernel_mapping)
2b5548b68199c1 Jun Yao                  2018-09-24  424  	adrp	x0, init_pg_dir
120dc60d0bdbad Ard Biesheuvel           2020-08-25 @425  	mov_q	x5, KIMAGE_VADDR		// compile time __va(_text)
e62b9e6f25fc99 Ard Biesheuvel           2022-08-27  426  #ifdef CONFIG_RELOCATABLE
f80fb3a3d50843 Ard Biesheuvel           2016-01-26  427  	add	x5, x5, x23			// add KASLR displacement
e62b9e6f25fc99 Ard Biesheuvel           2022-08-27  428  #endif
18b9c0d6419382 Ard Biesheuvel           2016-04-18  429  	adrp	x6, _end			// runtime __pa(_end)
18b9c0d6419382 Ard Biesheuvel           2016-04-18  430  	adrp	x3, _text			// runtime __pa(_text)
18b9c0d6419382 Ard Biesheuvel           2016-04-18  431  	sub	x6, x6, x3			// _end - _text
18b9c0d6419382 Ard Biesheuvel           2016-04-18  432  	add	x6, x6, x5			// runtime __va(_end)
f0af339fc408a5 Joey Gouly               2023-06-06  433  	mov_q	x7, SWAPPER_RW_MMUFLAGS
0370b31e48454d Steve Capper             2018-01-11  434  
53519ddf589447 Ard Biesheuvel           2022-06-24  435  	map_memory x0, x1, x5, x6, x7, x3, (VA_BITS - PGDIR_SHIFT), x10, x11, x12, x13, x14
034edabe6cf1d0 Laura Abbott             2014-11-21  436  
6495b9ba62711b Ard Biesheuvel           2022-06-24  437  	dsb	ishst				// sync with page table walker
6495b9ba62711b Ard Biesheuvel           2022-06-24  438  	ret
e42ade29e3bcb3 Ard Biesheuvel           2022-06-24  439  SYM_FUNC_END(create_kernel_mapping)
034edabe6cf1d0 Laura Abbott             2014-11-21  440  
7d7b720a4b8049 Madhavan T. Venkataraman 2021-05-10  441  	/*
8e334d729bc478 Mark Rutland             2021-05-20  442  	 * Initialize CPU registers with task-specific and cpu-specific context.
8e334d729bc478 Mark Rutland             2021-05-20  443  	 *
7d7b720a4b8049 Madhavan T. Venkataraman 2021-05-10  444  	 * Create a final frame record at task_pt_regs(current)->stackframe, so
7d7b720a4b8049 Madhavan T. Venkataraman 2021-05-10  445  	 * that the unwinder can identify the final frame record of any task by
7d7b720a4b8049 Madhavan T. Venkataraman 2021-05-10  446  	 * its location in the task stack. We reserve the entire pt_regs space
7d7b720a4b8049 Madhavan T. Venkataraman 2021-05-10  447  	 * for consistency with user tasks and kthreads.
7d7b720a4b8049 Madhavan T. Venkataraman 2021-05-10  448  	 */
3d8c1a013d78f3 Mark Rutland             2021-05-20  449  	.macro	init_cpu_task tsk, tmp1, tmp2
8e334d729bc478 Mark Rutland             2021-05-20  450  	msr	sp_el0, \tsk
8e334d729bc478 Mark Rutland             2021-05-20  451  
3d8c1a013d78f3 Mark Rutland             2021-05-20  452  	ldr	\tmp1, [\tsk, #TSK_STACK]
3d8c1a013d78f3 Mark Rutland             2021-05-20  453  	add	sp, \tmp1, #THREAD_SIZE
7d7b720a4b8049 Madhavan T. Venkataraman 2021-05-10  454  	sub	sp, sp, #PT_REGS_SIZE
8e334d729bc478 Mark Rutland             2021-05-20  455  
7d7b720a4b8049 Madhavan T. Venkataraman 2021-05-10  456  	stp	xzr, xzr, [sp, #S_STACKFRAME]
7d7b720a4b8049 Madhavan T. Venkataraman 2021-05-10  457  	add	x29, sp, #S_STACKFRAME
8e334d729bc478 Mark Rutland             2021-05-20  458  
2198d07c509f1d Ard Biesheuvel           2023-01-09  459  	scs_load_current
3d8c1a013d78f3 Mark Rutland             2021-05-20  460  
3d8c1a013d78f3 Mark Rutland             2021-05-20  461  	adr_l	\tmp1, __per_cpu_offset
bcf9033e5449bd Ard Biesheuvel           2021-09-14  462  	ldr	w\tmp2, [\tsk, #TSK_TI_CPU]
3d8c1a013d78f3 Mark Rutland             2021-05-20  463  	ldr	\tmp1, [\tmp1, \tmp2, lsl #3]
3d8c1a013d78f3 Mark Rutland             2021-05-20  464  	set_this_cpu_offset \tmp1
7d7b720a4b8049 Madhavan T. Venkataraman 2021-05-10  465  	.endm
7d7b720a4b8049 Madhavan T. Venkataraman 2021-05-10  466  

:::::: The code at line 425 was first introduced by commit
:::::: 120dc60d0bdbadcad7460222f74c9ed15cdeb73e arm64: get rid of TEXT_OFFSET

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
