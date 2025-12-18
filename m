Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3FD349B17
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070691; cv=none; b=H6xBuvWZ+lsWxGF+r/0WA8NOvizBMBFDNbAD1lg4cIuyHiBe8BQbk5S7XTkPK0hGzsYRbtGEJmHbkhXKLuxsop87mk+bcUXVEHl189jt0+IQH3SEpoPldK0Ri7/frsBc5RgVnLU2ZLr8vnV0dGXpxhLaX4IJwDv6d19aGrefcCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070691; c=relaxed/simple;
	bh=BbjPiFJTaMDdG0gyIyTGyUe6lXZM+YiyQ9+7cZ4nvwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LCxHvTv7gYxSG1NfpTJma9aijIcTCfPOt8nfvOs2nqoGO0A1YsewJz+zFuVIGIaGwbcsWSUgZqZRIZY0rGghpWNmElljrlsoxD4Tf4U/F8Ojoy7EzGJhq/N/jEKrHyVTH3ZuiwNs7BD+0QEYXOmCWFkEAK+fKmKfqfnfrTcHMyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vby3OTAi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vby3OTAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766070689; x=1797606689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BbjPiFJTaMDdG0gyIyTGyUe6lXZM+YiyQ9+7cZ4nvwY=;
  b=Vby3OTAiu/lx8kg/KoT7/ugzWtZGyUShP3VSPawWPsvxofopYdSJOFiF
   MrF5hRcsdYJ/9ctHtr2iJJiKLzbbxiiiw6pwflyN9Y07AD2PisuRnVI7l
   i+xMeCmbOdTDxDHzh/gBqMKwCm5dfq2H10D1Nea5lFdlp/JsopwoBktCW
   EFHeFpSfmcEgnYH7ZkvcicutKM2rJM481QlQz0ogaYTLN/attBUX3KAIl
   WoBKVqaD/TCoE3hmGTrp1vuiNXkvnIPD6ZmYpEWgJdkfx2BNuwzjHdhzM
   NfwPkOMZ/Pg7zLlHqxGlxM1KwHmN50qgx0OxpWlPE/3c7yche+R/cLkfB
   A==;
X-CSE-ConnectionGUID: 7Ee3mzIWTjiaX5sr7pH1rg==
X-CSE-MsgGUID: lt+lEyq8TTST5t5hnDS5vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68180104"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="68180104"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 07:11:11 -0800
X-CSE-ConnectionGUID: utlAmZsoS5Cv/mPMqt2VHw==
X-CSE-MsgGUID: EPcnVJDPQDikt4Rm0h5ggg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="197856206"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Dec 2025 07:11:10 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWFel-000000002Dq-24eg;
	Thu, 18 Dec 2025 15:11:07 +0000
Date: Thu, 18 Dec 2025 23:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: arch/riscv/mm/init.c:354 relocate_kernel() warn: always true
 condition '(relocated_addr >= (((0)))) => (0-u32max >= 0)'
Message-ID: <202512182235.yNlhiVre-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: ea2bde36a46d5724c1b44d80cc9fafbd73c2ecf9 riscv: Support CONFIG_RELOCATABLE on riscv32
date:   9 months ago
config: riscv-randconfig-r073-20251218 (https://download.01.org/0day-ci/archive/20251218/202512182235.yNlhiVre-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512182235.yNlhiVre-lkp@intel.com/

smatch warnings:
arch/riscv/mm/init.c:354 relocate_kernel() warn: always true condition '(relocated_addr >= (((0)))) => (0-u32max >= 0)'

vim +354 arch/riscv/mm/init.c

51b766c79a3d74 Samuel Holland 2024-10-26  326  
51b766c79a3d74 Samuel Holland 2024-10-26  327  static void __init relocate_kernel(void)
51b766c79a3d74 Samuel Holland 2024-10-26  328  {
ea2bde36a46d57 Samuel Holland 2024-10-26  329  	Elf_Rela *rela = (Elf_Rela *)&__rela_dyn_start;
51b766c79a3d74 Samuel Holland 2024-10-26  330  	/*
51b766c79a3d74 Samuel Holland 2024-10-26  331  	 * This holds the offset between the linked virtual address and the
51b766c79a3d74 Samuel Holland 2024-10-26  332  	 * relocated virtual address.
51b766c79a3d74 Samuel Holland 2024-10-26  333  	 */
51b766c79a3d74 Samuel Holland 2024-10-26  334  	uintptr_t reloc_offset = kernel_map.virt_addr - KERNEL_LINK_ADDR;
51b766c79a3d74 Samuel Holland 2024-10-26  335  	/*
51b766c79a3d74 Samuel Holland 2024-10-26  336  	 * This holds the offset between kernel linked virtual address and
51b766c79a3d74 Samuel Holland 2024-10-26  337  	 * physical address.
51b766c79a3d74 Samuel Holland 2024-10-26  338  	 */
51b766c79a3d74 Samuel Holland 2024-10-26  339  	uintptr_t va_kernel_link_pa_offset = KERNEL_LINK_ADDR - kernel_map.phys_addr;
51b766c79a3d74 Samuel Holland 2024-10-26  340  
ea2bde36a46d57 Samuel Holland 2024-10-26  341  	for ( ; rela < (Elf_Rela *)&__rela_dyn_end; rela++) {
ea2bde36a46d57 Samuel Holland 2024-10-26  342  		Elf_Addr addr = (rela->r_offset - va_kernel_link_pa_offset);
ea2bde36a46d57 Samuel Holland 2024-10-26  343  		Elf_Addr relocated_addr = rela->r_addend;
51b766c79a3d74 Samuel Holland 2024-10-26  344  
51b766c79a3d74 Samuel Holland 2024-10-26  345  		if (rela->r_info != R_RISCV_RELATIVE)
51b766c79a3d74 Samuel Holland 2024-10-26  346  			continue;
51b766c79a3d74 Samuel Holland 2024-10-26  347  
51b766c79a3d74 Samuel Holland 2024-10-26  348  		/*
51b766c79a3d74 Samuel Holland 2024-10-26  349  		 * Make sure to not relocate vdso symbols like rt_sigreturn
51b766c79a3d74 Samuel Holland 2024-10-26  350  		 * which are linked from the address 0 in vmlinux since
51b766c79a3d74 Samuel Holland 2024-10-26  351  		 * vdso symbol addresses are actually used as an offset from
51b766c79a3d74 Samuel Holland 2024-10-26  352  		 * mm->context.vdso in VDSO_OFFSET macro.
51b766c79a3d74 Samuel Holland 2024-10-26  353  		 */
51b766c79a3d74 Samuel Holland 2024-10-26 @354  		if (relocated_addr >= KERNEL_LINK_ADDR)
51b766c79a3d74 Samuel Holland 2024-10-26  355  			relocated_addr += reloc_offset;
51b766c79a3d74 Samuel Holland 2024-10-26  356  
ea2bde36a46d57 Samuel Holland 2024-10-26  357  		*(Elf_Addr *)addr = relocated_addr;
51b766c79a3d74 Samuel Holland 2024-10-26  358  	}
51b766c79a3d74 Samuel Holland 2024-10-26  359  }
51b766c79a3d74 Samuel Holland 2024-10-26  360  #endif /* CONFIG_RELOCATABLE */
51b766c79a3d74 Samuel Holland 2024-10-26  361  

:::::: The code at line 354 was first introduced by commit
:::::: 51b766c79a3d741fb97419c3da1c58fce5e66f0e riscv: Support CONFIG_RELOCATABLE on NOMMU

:::::: TO: Samuel Holland <samuel.holland@sifive.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
