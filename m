Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A6A37EFF3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205845; cv=none; b=SIkwlxYHZxd3jO2+MwGSi1WhDar+LWrm6e8U1u5YH3fRkZ/SuGf88HW+vapdyPoMxQvErNKeqq8BjsKcV4Zp6Xk/3Ja95eC7YTWooxG172aM9ifBgMFFHAxOj25HmDcm/BoPEGqMPAqC8wRupecxNw3jubm4A20OTwtQ3v2cQuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205845; c=relaxed/simple;
	bh=P7aMyE90HMTuxYj2nOMwTns+6gIzaM6KlTJ3uoYVfZw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WrE/LUJB9p1mdkXHvkatjsAqW0dHzZ/Yf9XygAFDqlTfhH86vTTE0l7MdguHZhiBySRUIz+m2z2Dl5T1RPbwvN4HoFRWHMMSjSs3/HqmR3O136PSkOKu6XHMmaxnmUkuphYznwwMsebbpXjI0ayQei5UccM599BXdQWlcGBkV1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtThxTHC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtThxTHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205843; x=1806741843;
  h=date:from:to:cc:subject:message-id;
  bh=P7aMyE90HMTuxYj2nOMwTns+6gIzaM6KlTJ3uoYVfZw=;
  b=mtThxTHCXqpP5N8PBEE7MP0upFnMqt1AYhRi22aXt7yxwMHHSAGHSair
   ZaQF4Fl/e9cGWVEIqaOHjokmSoLCFK8eAZmZgIIW1znbM/7JKzYcIdJYZ
   X4naQJz8R88cMG+WgYG4XrVjlAv63C0iODL/0nnpKr+puMod8L9IbjzAL
   a97Y6NmQBiV6s0f1e4eFg4GiA3A7NErvxapplwd+iPALuqBRMJNibwaXU
   2fzKnK0xKep4ashn/hZ/G4442BDjiJiUlS1VejDhkZLzfauuFIElsCg6P
   EYXx9AI7Es+LfXMoZDzvShuOCQSvQjR6wresUZmO7a+wbxefimkREJkO2
   A==;
X-CSE-ConnectionGUID: C0XDaDz/T3yMb2exJF02JQ==
X-CSE-MsgGUID: oIUvM1uuT2q3Iz1AxUpLiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93852247"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93852247"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:44:00 -0700
X-CSE-ConnectionGUID: Q6sjTwDdQOqLxP0w2QeINg==
X-CSE-MsgGUID: 7Grw+1abTT+SYoouhWKx4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="223943434"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2026 01:43:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a8C-0000000014g-0SPe;
	Fri, 03 Apr 2026 08:43:56 +0000
Date: Fri, 03 Apr 2026 16:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: arch/riscv/mm/init.c:354 relocate_kernel() warn: always true
 condition '(relocated_addr >= (((0)))) => (0-u32max >= 0)'
Message-ID: <202604030129.dUfFBGXI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9147566d801602c9e7fc7f85e989735735bf38ba
commit: ea2bde36a46d5724c1b44d80cc9fafbd73c2ecf9 riscv: Support CONFIG_RELOCATABLE on riscv32
date:   1 year ago
config: riscv-randconfig-r073-20260402 (https://download.01.org/0day-ci/archive/20260403/202604030129.dUfFBGXI-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ea2bde36a46d ("riscv: Support CONFIG_RELOCATABLE on riscv32")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030129.dUfFBGXI-lkp@intel.com/

smatch warnings:
arch/riscv/mm/init.c:354 relocate_kernel() warn: always true condition '(relocated_addr >= (((0)))) => (0-u32max >= 0)'

vim +354 arch/riscv/mm/init.c

51b766c79a3d741 Samuel Holland 2024-10-26  326  
51b766c79a3d741 Samuel Holland 2024-10-26  327  static void __init relocate_kernel(void)
51b766c79a3d741 Samuel Holland 2024-10-26  328  {
ea2bde36a46d572 Samuel Holland 2024-10-26  329  	Elf_Rela *rela = (Elf_Rela *)&__rela_dyn_start;
51b766c79a3d741 Samuel Holland 2024-10-26  330  	/*
51b766c79a3d741 Samuel Holland 2024-10-26  331  	 * This holds the offset between the linked virtual address and the
51b766c79a3d741 Samuel Holland 2024-10-26  332  	 * relocated virtual address.
51b766c79a3d741 Samuel Holland 2024-10-26  333  	 */
51b766c79a3d741 Samuel Holland 2024-10-26  334  	uintptr_t reloc_offset = kernel_map.virt_addr - KERNEL_LINK_ADDR;
51b766c79a3d741 Samuel Holland 2024-10-26  335  	/*
51b766c79a3d741 Samuel Holland 2024-10-26  336  	 * This holds the offset between kernel linked virtual address and
51b766c79a3d741 Samuel Holland 2024-10-26  337  	 * physical address.
51b766c79a3d741 Samuel Holland 2024-10-26  338  	 */
51b766c79a3d741 Samuel Holland 2024-10-26  339  	uintptr_t va_kernel_link_pa_offset = KERNEL_LINK_ADDR - kernel_map.phys_addr;
51b766c79a3d741 Samuel Holland 2024-10-26  340  
ea2bde36a46d572 Samuel Holland 2024-10-26  341  	for ( ; rela < (Elf_Rela *)&__rela_dyn_end; rela++) {
ea2bde36a46d572 Samuel Holland 2024-10-26  342  		Elf_Addr addr = (rela->r_offset - va_kernel_link_pa_offset);
ea2bde36a46d572 Samuel Holland 2024-10-26  343  		Elf_Addr relocated_addr = rela->r_addend;
51b766c79a3d741 Samuel Holland 2024-10-26  344  
51b766c79a3d741 Samuel Holland 2024-10-26  345  		if (rela->r_info != R_RISCV_RELATIVE)
51b766c79a3d741 Samuel Holland 2024-10-26  346  			continue;
51b766c79a3d741 Samuel Holland 2024-10-26  347  
51b766c79a3d741 Samuel Holland 2024-10-26  348  		/*
51b766c79a3d741 Samuel Holland 2024-10-26  349  		 * Make sure to not relocate vdso symbols like rt_sigreturn
51b766c79a3d741 Samuel Holland 2024-10-26  350  		 * which are linked from the address 0 in vmlinux since
51b766c79a3d741 Samuel Holland 2024-10-26  351  		 * vdso symbol addresses are actually used as an offset from
51b766c79a3d741 Samuel Holland 2024-10-26  352  		 * mm->context.vdso in VDSO_OFFSET macro.
51b766c79a3d741 Samuel Holland 2024-10-26  353  		 */
51b766c79a3d741 Samuel Holland 2024-10-26 @354  		if (relocated_addr >= KERNEL_LINK_ADDR)
51b766c79a3d741 Samuel Holland 2024-10-26  355  			relocated_addr += reloc_offset;
51b766c79a3d741 Samuel Holland 2024-10-26  356  
ea2bde36a46d572 Samuel Holland 2024-10-26  357  		*(Elf_Addr *)addr = relocated_addr;
51b766c79a3d741 Samuel Holland 2024-10-26  358  	}
51b766c79a3d741 Samuel Holland 2024-10-26  359  }
51b766c79a3d741 Samuel Holland 2024-10-26  360  #endif /* CONFIG_RELOCATABLE */
51b766c79a3d741 Samuel Holland 2024-10-26  361  

:::::: The code at line 354 was first introduced by commit
:::::: 51b766c79a3d741fb97419c3da1c58fce5e66f0e riscv: Support CONFIG_RELOCATABLE on NOMMU

:::::: TO: Samuel Holland <samuel.holland@sifive.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
