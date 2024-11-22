Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DFA1885AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 23:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732317755; cv=none; b=MaNAZRr79PckEdLxV1uwvWNyFrtTMcosxKPUbmEEXHKY5ZudMkqK6tUmNmGgFAr+DepQmVgiAwSIRTEcb5AjGOHKAkJC44trjZCCD5Dfi0c1s5yuHhBL4AZIjqwVeTJRlog1ks1d52jJ7EwqocCKukKlms1aOP/WPhyQSsD3QUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732317755; c=relaxed/simple;
	bh=8JC4E66H1UUzgEjivp5PQK8W4HIQ+f3Js15Ye5HQvb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X/vSUVk8+kFn7/NXcQ5Fics8ePR18CnmL5FB37snGBFgSld0BciNGOLADU+iyvHkYHKomPH15cMpvFnACPqC9rgQjbbP2Ogrv97qSelLSdef/9tiMmBTvtjNg/Li/8jLP8e71ovmwbh7NGjNRbj/rkE43NytPfAxK9mZp6o+ars=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxuYuq2I; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxuYuq2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732317754; x=1763853754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8JC4E66H1UUzgEjivp5PQK8W4HIQ+f3Js15Ye5HQvb4=;
  b=LxuYuq2IED+HIC3jCZIxY/agNG9KQdzvuhwRIWeQlkbEZY0ap9aR5weB
   EYuOhCEmxBMp0iHVYkmvP4LjxpiKszdVjmMLQh5ATXLFG+Rft+AOj+MDQ
   tlJc4MWDDBl4hwpW1PVOzq1iorgTwrYbRI82bDUxkdy4I+jliOw7Ma0Cb
   LwqTbazYDa0ZCkk0YKPMQHYg6bRc0/hVWW/iKM26KFSvLJq3jTnMXiUWn
   fxz1Mk84RrCZnlL1ihYZRTejoS6IYCwLfWPXcfMxsCv5/wvd8r4MkEBYF
   Z7ROVo1xk4keMYAlwszuEgHKmLNa1YidlU8MuIhWZsuLd5cjSk4cV030P
   Q==;
X-CSE-ConnectionGUID: y9wy8jclQ6OnGYFpdDLkPw==
X-CSE-MsgGUID: IkmvXRWhT/mlsQPvW8gtvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43886549"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="43886549"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 15:22:33 -0800
X-CSE-ConnectionGUID: lftwFtRRQJaBhdwoeTApFw==
X-CSE-MsgGUID: HrvvLib2QeuEHpNrpCOJZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="91507956"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Nov 2024 15:22:32 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEcys-0004HT-07;
	Fri, 22 Nov 2024 23:22:30 +0000
Date: Sat, 23 Nov 2024 07:21:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug 3/16] arch/x86/kernel/relocate_kernel_64.S:257:
 undefined reference to `saved_context'
Message-ID: <202411230726.JaI9hFLA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug
head:   4ce379fe2c9332e340e1969fdc89ce756f382ab7
commit: 397c3df4d62afe238c46874cb5e3fd099954aa4c [3/16] x86/kexec: Restore GDT on return from preserve_context kexec
config: x86_64-randconfig-002-20241123 (https://download.01.org/0day-ci/archive/20241123/202411230726.JaI9hFLA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230726.JaI9hFLA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230726.JaI9hFLA-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `virtual_mapped':
>> arch/x86/kernel/relocate_kernel_64.S:257: undefined reference to `saved_context'
>> ld: arch/x86/kernel/relocate_kernel_64.S:258: undefined reference to `saved_context_gdt_desc'


vim +257 arch/x86/kernel/relocate_kernel_64.S

   244	
   245	SYM_CODE_START_LOCAL_NOALIGN(virtual_mapped)
   246		UNWIND_HINT_END_OF_STACK
   247		ANNOTATE_NOENDBR // RET target, above
   248		movq	RSP(%r8), %rsp
   249		movq	CR4(%r8), %rax
   250		movq	%rax, %cr4
   251		movq	CR3(%r8), %rax
   252		movq	CR0(%r8), %r8
   253		movq	%rax, %cr3
   254		movq	%r8, %cr0
   255	
   256		/* Saved in save_processor_state. */
 > 257		movq    $saved_context, %rax
 > 258		lgdt    saved_context_gdt_desc(%rax)
   259	
   260		movq	%rbp, %rax
   261	
   262		popf
   263		popq	%r15
   264		popq	%r14
   265		popq	%r13
   266		popq	%r12
   267		popq	%rbp
   268		popq	%rbx
   269		ANNOTATE_UNRET_SAFE
   270		ret
   271		int3
   272	SYM_CODE_END(virtual_mapped)
   273	
   274		/* Do the copies */
   275	SYM_CODE_START_LOCAL_NOALIGN(swap_pages)
   276		UNWIND_HINT_END_OF_STACK
   277		movq	%rdi, %rcx	/* Put the indirection_page in %rcx */
   278		xorl	%edi, %edi
   279		xorl	%esi, %esi
   280		jmp	.Lstart		/* Should start with an indirection record */
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
