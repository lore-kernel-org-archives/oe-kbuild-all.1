Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766BE263F4A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jul 2026 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783281880; cv=none; b=g3O1gyvvX92h5OAaB3D4HXg5K9byNFiZOjA8NU5tFkI+jyhMdqqQeYLOceHKjDn1HiD4GKsN3Ac924JYYBhZKcYY+jMtR8hAgy7DKvcYuxD4MdBVW8MWXMKYNIfgxzKyN6HgCvmjm3rZaoUq2M9nnEaNpfnugQCMulX81BdZs6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783281880; c=relaxed/simple;
	bh=ec/cr06++CuL/z93+35+P6pgbLl9pnXMvNJ6DLMAO5c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bQFzD1TGPq9wI9yVUO1AxLRsNTf/KBzS2AWBowZ9VVburI8pZ7zxQDOloAXih6yNFPFvk/mIRAcV8VJbI3Nm1dcIOuxowBDnevLeaBjUJI2pihKazNlT/YewXl4Y3vyz/JAkSAyG8o0UXIPGryr8IF+BMKvI2rU/rgfEzu0VoLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWyYfGru; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWyYfGru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783281878; x=1814817878;
  h=date:from:to:cc:subject:message-id;
  bh=ec/cr06++CuL/z93+35+P6pgbLl9pnXMvNJ6DLMAO5c=;
  b=nWyYfGruijzt8DJJ+Tl4JpI/2YqfsCFXqZK2FcnyCmuqDmVQWCy3FSjE
   l7bDiRxAh1LTm9ERdFg1tl/jFdpkGQU0A1gKeU5xdYBrcn1fGkhNY9u56
   7hvVKwoj4otKaucd5iuIqXkBk/BMh+ZJbSeWCM0clgPOQi54D0fxjT18E
   xqsYT3SyiaK0q0Hn1p6fcoT/AXHGIDhcHSNz3bevtPab/hv7iMR4+KAKh
   mH5AjlaAxzQGrmdoGHUh+8DhT9YggTdHihfcI9UOCD8OvczAd2ogg550o
   R9Xf+6fR5mDfK1r804/k8y9otN4yyf8Mcu7U2niYXjrXjj3ujxpLCqyV6
   Q==;
X-CSE-ConnectionGUID: qBzeP3cSTAKhnak67MnOcg==
X-CSE-MsgGUID: 7tguFdLTQLS+0VGw4vJ3TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="101468302"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="101468302"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 13:04:37 -0700
X-CSE-ConnectionGUID: HhWYUbO/SGqrGvwZ4A8L6w==
X-CSE-MsgGUID: xr31GBHTRZ6txiEMs/b4uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="251803787"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 05 Jul 2026 13:04:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgT4m-00000000Dmb-2Oly;
	Sun, 05 Jul 2026 20:04:28 +0000
Date: Mon, 06 Jul 2026 04:03:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sven:efi-psci 3/6] arch/arm64/kernel/setup.c:323:2: error:
 call to undeclared function 'arm64_efi_init'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202607060311.9uhCpVvG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git efi-psci
head:   f3e5c7a4c95dadd837bde2519a6226b5cd610415
commit: c11e5fb532e28ab8f8b418760df31ac7bea7e0ba [3/6] arm64/efi: Add and parse custom PSCI EFI configuration table
config: arm64-randconfig-002-20260706 (https://download.01.org/0day-ci/archive/20260706/202607060311.9uhCpVvG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607060311.9uhCpVvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607060311.9uhCpVvG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/setup.c:323:2: error: call to undeclared function 'arm64_efi_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     323 |         arm64_efi_init();
         |         ^
   arch/arm64/kernel/setup.c:323:2: note: did you mean 'arm64_rsi_init'?
   arch/arm64/include/asm/rsi.h:17:13: note: 'arm64_rsi_init' declared here
      17 | void __init arm64_rsi_init(void);
         |             ^
   1 error generated.


vim +/arm64_efi_init +323 arch/arm64/kernel/setup.c

   280	
   281	void __init __no_sanitize_address setup_arch(char **cmdline_p)
   282	{
   283		setup_initial_init_mm(_text, _etext, _edata, _end);
   284	
   285		*cmdline_p = boot_command_line;
   286	
   287		kaslr_init();
   288	
   289		early_fixmap_init();
   290		early_ioremap_init();
   291	
   292		setup_machine_fdt(__fdt_pointer);
   293	
   294		/*
   295		 * Initialise the static keys early as they may be enabled by the
   296		 * cpufeature code and early parameters.
   297		 */
   298		jump_label_init();
   299		parse_early_param();
   300	
   301		dynamic_scs_init();
   302	
   303		/*
   304		 * The primary CPU enters the kernel with all DAIF exceptions masked.
   305		 *
   306		 * We must unmask Debug and SError before preemption or scheduling is
   307		 * possible to ensure that these are consistently unmasked across
   308		 * threads, and we want to unmask SError as soon as possible after
   309		 * initializing earlycon so that we can report any SErrors immediately.
   310		 *
   311		 * IRQ and FIQ will be unmasked after the root irqchip has been
   312		 * detected and initialized.
   313		 */
   314		local_daif_restore(DAIF_PROCCTX_NOIRQ);
   315	
   316		/*
   317		 * TTBR0 is only used for the identity mapping at this stage. Make it
   318		 * point to zero page to avoid speculatively fetching new entries.
   319		 */
   320		cpu_uninstall_idmap();
   321	
   322		xen_early_init();
 > 323		arm64_efi_init();
   324	
   325		if (!efi_enabled(EFI_BOOT)) {
   326			if ((u64)_text % MIN_KIMG_ALIGN)
   327				pr_warn(FW_BUG "Kernel image misaligned at boot, please fix your bootloader!");
   328			WARN_TAINT(mmu_enabled_at_boot, TAINT_FIRMWARE_WORKAROUND,
   329				   FW_BUG "Booted with MMU enabled!");
   330		}
   331	
   332		arm64_memblock_init();
   333	
   334		paging_init();
   335	
   336		acpi_table_upgrade();
   337	
   338		/* Parse the ACPI tables for possible boot-time configuration */
   339		acpi_boot_table_init();
   340	
   341		if (acpi_disabled)
   342			unflatten_device_tree();
   343	
   344		bootmem_init();
   345	
   346		kasan_init();
   347	
   348		request_standard_resources();
   349	
   350		early_ioremap_reset();
   351	
   352		if (acpi_disabled)
   353			psci_dt_init();
   354		else
   355			psci_acpi_init();
   356	
   357		arm64_rsi_init();
   358	
   359		init_bootcpu_ops();
   360		smp_init_cpus();
   361		smp_build_mpidr_hash();
   362	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
