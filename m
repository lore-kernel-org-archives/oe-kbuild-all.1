Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38F431ED97
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 06:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766038843; cv=none; b=WqXKjpl8rNU/Q70HNjiM0uFPhPIgC2FioBsmGjs5k7lnZ+2nklzJoF5ESTgmSnRfahnhmP6mxm7tj1ZCp9a5L36QWq3O71oqfgTy04A118piHnBp00sw7McNMo3Gvl2FSWESimVF0vOkEjcPxiH4cPzX1iobNI2I+5SvOGD59zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766038843; c=relaxed/simple;
	bh=VNcAVDCUmhuMXGKC5pzPfEveKKtgudsjKSSHD1LW0I4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rq+33UawnNlbZCErHcvtaWw/ObQDBZ0m6jGpfFsiO8IMotJQv14ThXm8Dh36maSIJ9c6KUwMEN/iaMLIXhWFItf5v9MQDGjlaMj0orZYeUwFaQeDuTBd6ZPKpTDqP4wT4mvB9338h0BKIPAxPCIjnHPA6hCJ0RVnkQjd1+MC64I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fsTRBMQR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fsTRBMQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766038842; x=1797574842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VNcAVDCUmhuMXGKC5pzPfEveKKtgudsjKSSHD1LW0I4=;
  b=fsTRBMQRJxfzOteAqhu1f5cYQk82zjQa31s7R1S6YRTNJZ4QRgcvFjTJ
   TwONO9K3LTjaO7hdQ6dpKmThXKHZR+XM0MRTgkiYlvEDBHenW2BY9wrnv
   JNWJhZyjdQVmVKqaMOKfb31HFa3cP1uNgjNleDtJqH7lkiA6wvaM2RF2l
   kf0kGsgu9x2Ifr0EjfDIIDOHwPjuJ3ZxX5z8Kn22Yek4bY+OMWyx+4imC
   5TYRQXED2y+4BHerXtbvJkBRsDASE0bMwLQp5nMXhW7mD568lxKAItpBr
   ETSGufHfuVjrvekt9kATxrtr/IFRwBJFrrX13edhQkA+NX9ynw3YY+fJJ
   A==;
X-CSE-ConnectionGUID: 71vu4gcSRCW/ShJ/REOmyA==
X-CSE-MsgGUID: V4KlkSA8RnuCSblU0GOU9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67955982"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67955982"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 22:20:42 -0800
X-CSE-ConnectionGUID: ZZTwPSdHSgO8eP26P9JXUQ==
X-CSE-MsgGUID: c291+XkKTG6y85Hb7KSD0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198749883"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Dec 2025 22:20:40 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW7NN-000000001g3-3VPc;
	Thu, 18 Dec 2025 06:20:37 +0000
Date: Thu, 18 Dec 2025 14:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: arch/riscv/mm/init.c:356 relocate_kernel() warn: always true
 condition '(relocated_addr >= (((0)))) => (0-u64max >= 0)'
Message-ID: <202512181449.vp2Fwpvr-lkp@intel.com>
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
commit: 51b766c79a3d741fb97419c3da1c58fce5e66f0e riscv: Support CONFIG_RELOCATABLE on NOMMU
date:   9 months ago
config: riscv-randconfig-r072-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181449.vp2Fwpvr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181449.vp2Fwpvr-lkp@intel.com/

smatch warnings:
arch/riscv/mm/init.c:356 relocate_kernel() warn: always true condition '(relocated_addr >= (((0)))) => (0-u64max >= 0)'

vim +356 arch/riscv/mm/init.c

   328	
   329	static void __init relocate_kernel(void)
   330	{
   331		Elf64_Rela *rela = (Elf64_Rela *)&__rela_dyn_start;
   332		/*
   333		 * This holds the offset between the linked virtual address and the
   334		 * relocated virtual address.
   335		 */
   336		uintptr_t reloc_offset = kernel_map.virt_addr - KERNEL_LINK_ADDR;
   337		/*
   338		 * This holds the offset between kernel linked virtual address and
   339		 * physical address.
   340		 */
   341		uintptr_t va_kernel_link_pa_offset = KERNEL_LINK_ADDR - kernel_map.phys_addr;
   342	
   343		for ( ; rela < (Elf64_Rela *)&__rela_dyn_end; rela++) {
   344			Elf64_Addr addr = (rela->r_offset - va_kernel_link_pa_offset);
   345			Elf64_Addr relocated_addr = rela->r_addend;
   346	
   347			if (rela->r_info != R_RISCV_RELATIVE)
   348				continue;
   349	
   350			/*
   351			 * Make sure to not relocate vdso symbols like rt_sigreturn
   352			 * which are linked from the address 0 in vmlinux since
   353			 * vdso symbol addresses are actually used as an offset from
   354			 * mm->context.vdso in VDSO_OFFSET macro.
   355			 */
 > 356			if (relocated_addr >= KERNEL_LINK_ADDR)
   357				relocated_addr += reloc_offset;
   358	
   359			*(Elf64_Addr *)addr = relocated_addr;
   360		}
   361	}
   362	#endif /* CONFIG_RELOCATABLE */
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
