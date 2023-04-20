Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358A72F22
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 08:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681977753; x=1713513753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gahgCZMtrzwBCBozdE1X/7CsTJs1X3BNItg3p+2aQBE=;
  b=eHyDmDzb5Bz9hVzl+G7KBDzFGDsghQffHQ0ivNMiOzVgHTCnLtcMU5Nt
   kh9BmlLnDZAPvrpnNYYJCG6Lo+cYZwDamtSe173HAt6eL+egDowB0Qdc7
   +s6+iPIxUze9yWVTYUP6va9EH90//eMh2D0x+hk7YGtm4EbwQUPF4THE3
   +5QZgcPjmsmVcmjhMRgJ9hEfJBkk+vdCJeGoKjyUGOCmOu5FKQem+ldrT
   HSXCj5XIS/QDHL7xRkK9mcQ3bKVsUK0rRC8u4fFcnqA4bRLa7ye/msO0W
   ps5eNceK92c47t3x30phAVIvuFL9eY3sIewN6O4nre7c64839xf2/3QjD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="431944953"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="431944953"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 01:02:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="669275010"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="669275010"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Apr 2023 01:02:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppPFP-000fbS-18;
	Thu, 20 Apr 2023 08:02:31 +0000
Date: Thu, 20 Apr 2023 16:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-x86-zboot 10/10]
 drivers/firmware/efi/libstub/x86-zboot.c:64: Warning: found `movsd';
 assuming `movsl' was meant
Message-ID: <202304201647.KxUkfhW2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-x86-zboot
head:   b442525d3c465de95c5fa7810520133dd049b146
commit: b442525d3c465de95c5fa7810520133dd049b146 [10/10] efi/zboot: x86: Add mixed mode support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230420/202304201647.KxUkfhW2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=b442525d3c465de95c5fa7810520133dd049b146
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb efi-x86-zboot
        git checkout b442525d3c465de95c5fa7810520133dd049b146
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/firmware/efi/libstub/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201647.KxUkfhW2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/libstub/x86-zboot.c: Assembler messages:
>> drivers/firmware/efi/libstub/x86-zboot.c:64: Warning: found `movsd'; assuming `movsl' was meant


vim +64 drivers/firmware/efi/libstub/x86-zboot.c

    36	
    37	asmlinkage u32 __naked efi_zboot_compat_entry(u32 handle32, u32 systab32)
    38	{
    39		/*
    40		 * Check whether paging and PAE are enabled, and if so, preserve the
    41		 * firmware's GDT/IDT and segment selectors before replacing them with
    42		 * ones that can be used to switch into long mode and invoke the 64-bit
    43		 * EFI entrypoint.
    44		 */
    45		asm("	.code32							\n\t"
    46		    "	movl	%[unsupported], %%eax				\n\t"
    47		    "	movl	%%cr0, %%edx					\n\t"
    48		    "	btrl	%[pg], %%edx					\n\t"
    49		    "	jnc	0f						\n\t"
    50		    "	movl	%%cr4, %%ecx					\n\t"
    51		    "	btl	%[pae], %%ecx					\n\t"
    52		    "	jnc	0f						\n\t"
    53	
    54		    /* Disable interrupts and paging before proceeding */
    55		    "	cli							\n\t"
    56		    "	movl	%%edx, %%cr0					\n\t"
    57		    "	call	1f						\n\t"
    58		    "0:	ret							\n\t"
    59		    "1:	pop	%%ebx						\n\t"
    60		    "	movb	$0, (efi_is64 - 0b)(%%ebx)			\n\t"
    61	
    62		    /* Copy the 4 root PAE entries into a new level 3 table */
    63		    "	lea	(pud - 0b)(%%ebx), %%edi			\n\t"
  > 64		    "	lea	%c[pgtable](%%edi), %%edx			\n\t"
    65		    "	mov	%%cr3, %%esi					\n\t"
    66		    "	movw	$8, %%cx					\n\t"
    67		    "	cld							\n\t"
    68		    "	rep	movsd						\n\t"
    69	
    70		    /* Set the 'writable' bit, which doesn't exist on legacy PAE */
    71		    "	orl	%[pgtable], (pud - 0b)(%%ebx)			\n\t"
    72		    "	orl	%[pgtable], (pud - 0b + 8)(%%ebx)  		\n\t"
    73		    "	orl	%[pgtable], (pud - 0b + 16)(%%ebx)		\n\t"
    74		    "	orl	%[pgtable], (pud - 0b + 24)(%%ebx)		\n\t"
    75	
    76		    /* Create a root table and insert an entry for the level 3 table */
    77		    "	lea	(pgd - 0b)(%%ebx), %%ecx			\n\t"
    78		    "	mov	%%edx, (%%ecx)					\n\t"
    79		    "	mov	%%ecx, %%cr3					\n\t"
    80	
    81		    /* Save firmware's GDT/IDT and selector values */
    82		    "	sgdtl	(efi32_boot_gdt - 0b)(%%ebx)			\n\t"
    83		    "	sidtl	(efi32_boot_idt - 0b)(%%ebx)			\n\t"
    84		    "	movw	%%cs, (efi32_boot_cs - 0b)(%%ebx)		\n\t"
    85		    "	movw	%%ds, (efi32_boot_ds - 0b)(%%ebx)		\n\t"
    86	
    87		    /* Install our own GDT and select __KERNEL_DS */
    88		    "	leal	(gdt - 0b)(%%ebx), %%eax			\n\t"
    89		    "	movl	%%eax, (%%esp)					\n\t"
    90		    "	subl	$4, %%esp					\n\t"
    91		    "	movw	%[gdtlimit], 2(%%esp)				\n\t"
    92		    "	lgdtl	2(%%esp)					\n\t"
    93		    "	movw	%[ds], %%ax					\n\t"
    94		    "	movw	%%ax, %%ds					\n\t"
    95		    "	movw	%%ax, %%es					\n\t"
    96		    "	movw	%%ax, %%fs					\n\t"
    97		    "	movw	%%ax, %%gs					\n\t"
    98		    "	movw	%%ax, %%ss					\n\t"
    99	
   100		    /* Prepare for the jump to long mode */
   101		    "	movl	%[msr_efer], %%ecx				\n\t"
   102		    "	rdmsr							\n\t"
   103		    "	btsl	%[efer_lme], %%eax				\n\t"
   104		    "	wrmsr							\n\t"
   105	
   106		    /* Use MS calling convention for params and align the stack */
   107		    "	lea	(__efistub_efi_zboot_entry - 0b)(%%ebx), %%ebx	\n\t"
   108		    "	movl	8(%%esp), %%ecx					\n\t"
   109		    "	movl	12(%%esp), %%edx				\n\t"
   110		    "	andl	$~0xf, %%esp					\n\t"
   111		    "	movl	%[cs], 4(%%esp)					\n\t"
   112		    "	movl	%%ebx, (%%esp)					\n\t"
   113		    "	movl	%[cr0_state], %%eax				\n\t"
   114		    "	movl	%%eax, %%cr0					\n\t"
   115		    "	lret							\n\t"
   116		    "	.code64							\n\t"
   117		    :
   118		    : [unsupported]	"i"(0x80000003),
   119		      [pg]		"i"(X86_CR0_PG_BIT),
   120		      [pae]		"i"(X86_CR4_PAE_BIT),
   121		      [gdtlimit]	"i"(sizeof(gdt) - 1),
   122		      [cs]		"i"(__KERNEL_CS),
   123		      [ds]		"i"(__KERNEL_DS),
   124		      [pgtable]		"i"(_KERNPG_TABLE_NOENC),
   125		      [msr_efer]	"i"(MSR_EFER),
   126		      [efer_lme]	"i"(_EFER_LME),
   127		      [cr0_state]	"i"(CR0_STATE));
   128	}
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
