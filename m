Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0828FF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 20:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731788649; cv=none; b=tlbM48Udh5WTglyZCXOBlFGLj2VvysHo3xzp4ZRX53cvLL6WwdzGO4tQQWEFlSlqEN8zAyDYerQIyW5+nlauB1juOHNamabMf8ZlIiRWjvucv0JbH0CXQNNnNdgHQSsfEAUFu6tLrsy1Oeift+XRH7CSBVZkA9WadFsBk2IFe80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731788649; c=relaxed/simple;
	bh=nvXYa51oMFpMsEJKlhRpuGSXu8UfoibEYE+cZYE/23o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p8iDT8oz9h6gS8oUr6ZcwXqA1EWcJwHuKkcXj9I0VNNqQBQCPhuqPRxNFKT/f8Ri1u32QrLU5Wd3/2AZ5yRfBwkpZVJXr1TRQfkSlGYLzfd+240KsjEDXRZty40uBZdjV6AK0vckQXZsYPVqU1CxWdZY4Tu2Et1ItBdoJX4DDVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRJCzgOh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRJCzgOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731788648; x=1763324648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nvXYa51oMFpMsEJKlhRpuGSXu8UfoibEYE+cZYE/23o=;
  b=KRJCzgOhnOBoN50wC/44wsippOTY2AqouI5sOlVMo0R8FiGzcmPbEQRH
   ZEBKcgltgIW2B8t6wy1gEUYfa+v4l9lhmWosrtPbcEt2YmKIO9Eiq/YcQ
   B5Ge1Laf//tL4ns2ckmMjMQQka3BGTjHTOUiw+SJTvHg5PHwzD6zvth5+
   00WgtjiW4n9TlLLigDQyf2ILrs56fbrqdqyogv7fajxNkmS8eDiYgOVf6
   qspKw0WIahsep7V5td6OrsCdZwYL2pPV69KGb1FiQMatgeQMSZsYy08rA
   dcMee8vWsrUW+2wkXO+9OFkzHQkfgMdE5W/qBQ43U3v24plSPZdYMIS4f
   A==;
X-CSE-ConnectionGUID: GiLGXtvhTsOSF/Q58wL3bA==
X-CSE-MsgGUID: ZJ/HxABfSHaC/TwEWZHQsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42852761"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="42852761"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 12:24:07 -0800
X-CSE-ConnectionGUID: d8UUfnd/T2Sp0tFStP4XCg==
X-CSE-MsgGUID: ueEbB0rkTB2Wg9deVO9nrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="92937642"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Nov 2024 12:24:06 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCPKt-00016v-2p;
	Sat, 16 Nov 2024 20:24:03 +0000
Date: Sun, 17 Nov 2024 04:24:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop-pkvm-ia-2024-15-11-v1 206/259]
 arch/x86/coco/tdx/tdx.c:381:9: error: expected identifier or '(' before '}'
 token
Message-ID: <202411170454.R6ysfsHU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop-pkvm-ia-2024-15-11-v1
head:   ab957086535d11209d7d6dd96172900d714fb5fb
commit: c679d728be765bc07b0a2cff90e44768ed28804d [206/259] ANDROID: x86/tdx: Move virt exception handler code to virt_exception.c
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20241117/202411170454.R6ysfsHU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170454.R6ysfsHU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170454.R6ysfsHU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/coco/tdx/tdx.c:381:9: error: expected identifier or '(' before '}' token
     381 |         }
         |         ^
>> arch/x86/coco/tdx/tdx.c:383:9: error: expected identifier or '(' before 'if'
     383 |         if (!fault_in_kernel_space(ve->gla)) {
         |         ^~
   arch/x86/coco/tdx/tdx.c:317:12: warning: 'handle_cpuid' defined but not used [-Wunused-function]
     317 | static int handle_cpuid(struct pt_regs *regs, struct ve_info *ve)
         |            ^~~~~~~~~~~~
   arch/x86/coco/tdx/tdx.c:297:12: warning: 'write_msr' defined but not used [-Wunused-function]
     297 | static int write_msr(struct pt_regs *regs, struct ve_info *ve)
         |            ^~~~~~~~~
   arch/x86/coco/tdx/tdx.c:276:12: warning: 'read_msr' defined but not used [-Wunused-function]
     276 | static int read_msr(struct pt_regs *regs, struct ve_info *ve)
         |            ^~~~~~~~
   arch/x86/coco/tdx/tdx.c:255:12: warning: 'handle_halt' defined but not used [-Wunused-function]
     255 | static int handle_halt(struct ve_info *ve)
         |            ^~~~~~~~~~~
   arch/x86/coco/tdx/tdx.c:145:13: warning: 'tdx_parse_tdinfo' defined but not used [-Wunused-function]
     145 | static void tdx_parse_tdinfo(u64 *cc_mask)
         |             ^~~~~~~~~~~~~~~~


vim +381 arch/x86/coco/tdx/tdx.c

31d58c4e557d46 Kirill A. Shutemov         2022-04-06  380  
31d58c4e557d46 Kirill A. Shutemov         2022-04-06 @381  	}
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  382  
4c0c5dcb5471de Alexey Gladkov (Intel      2024-09-13 @383) 	if (!fault_in_kernel_space(ve->gla)) {
4c0c5dcb5471de Alexey Gladkov (Intel      2024-09-13  384) 		WARN_ONCE(1, "Access to userspace address is not supported");
4c0c5dcb5471de Alexey Gladkov (Intel      2024-09-13  385) 		return -EINVAL;
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  386  static bool handle_in(struct pt_regs *regs, int size, int port)
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  387  {
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  388  	struct tdx_hypercall_args args = {
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  389  		.r10 = TDX_HYPERCALL_STANDARD,
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  390  		.r11 = hcall_func(EXIT_REASON_IO_INSTRUCTION),
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  391  		.r12 = size,
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  392  		.r13 = PORT_READ,
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  393  		.r14 = port,
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  394  	};
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  395  	u64 mask = GENMASK(BITS_PER_BYTE * size, 0);
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  396  	bool success;
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  397  
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  398  	/*
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  399  	 * Emulate the I/O read via hypercall. More info about ABI can be found
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  400  	 * in TDX Guest-Host-Communication Interface (GHCI) section titled
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  401  	 * "TDG.VP.VMCALL<Instruction.IO>".
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  402  	 */
7a3a401874bea0 Kirill A. Shutemov         2023-03-21  403  	success = !__tdx_hypercall_ret(&args);
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  404  
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  405  	/* Update part of the register affected by the emulated instruction */
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  406  	regs->ax &= ~mask;
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  407  	if (success)
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  408  		regs->ax |= args.r11 & mask;
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  409  
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  410  	return success;
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  411  }
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  412  

:::::: The code at line 381 was first introduced by commit
:::::: 31d58c4e557d46fa7f8557714250fb6f89c941ae x86/tdx: Handle in-kernel MMIO

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
