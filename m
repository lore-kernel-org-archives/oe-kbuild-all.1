Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD42D25B091
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jul 2026 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783245118; cv=none; b=r0rtwTwJR70jbmiC+kFUVBZ+coKgbTWaVX8CVqhW9n+0UONRrdEEOCmS7cyj75lU4lfHl0s8LTYYbv93q/hLKMU7tUHd5wTbkH3CzJc7O9anTv/r5zoq36djndzZQd0tzgkEgltIbcZN0HEv6f6Z/jCHr8S1YA/tXy9E8w/q6kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783245118; c=relaxed/simple;
	bh=35Y65YFvL/B8TkQdS9E1joRBqKDZD7HmNbR4p1vVvdM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DoKuP8KnkgPQdFo5NwL4H9/UFcvX4VnpCn6xC+YTDQdqc76UdhWj+5iJW6EOx+FfUVdnm3ZcVIfX8ZTxOYx+MIDKgAhje1jFgqpN3mhwAy/CqJ34RSvxtUPlkTkaRKzRMBtz5utXyOGnF4cHnTXe1dPC950WSJdyrT2+NO5d518=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPh7oiBW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPh7oiBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783245115; x=1814781115;
  h=date:from:to:cc:subject:message-id;
  bh=35Y65YFvL/B8TkQdS9E1joRBqKDZD7HmNbR4p1vVvdM=;
  b=cPh7oiBWjT8SCiN6rZcmCsMWDSqEn/mBcAj6EPK2E+zFla80yzYytOB+
   DzYqN3siD6NgZM25zes3k7cVknmZRfE2rcn+pmaz7Wk2bLLYCMpvVOQce
   SodVKmUjD4G9ughwkec+Dcdt+vFIQ2l9Dyls7AhaDm+eHi9UvsM1O/N7y
   bPesjYlg0V+5U6FRYkBPT/vDY2jyiFwDfeq1ASzKjqOUmUw9kq37RuzjD
   FeclM7cwzHuVarRu6lqDo5wjcf86YpuJplbyjiFwe5X6ln6FPDqU99egQ
   Ycvrr2+r57X4ZsgXETlZKQ3iUhf3MnhuM283BM1VK8+6DAfyQD4lkpkCe
   A==;
X-CSE-ConnectionGUID: 6qIKCNwURamkdi8F3hpfEw==
X-CSE-MsgGUID: a7s4/7icSZiBeuRSnYRcww==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="83776146"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83776146"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 02:51:54 -0700
X-CSE-ConnectionGUID: 2geen0aPR1ObzVHBdrLujw==
X-CSE-MsgGUID: faiqxou2QPu50vaQnfB4hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="252386512"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 05 Jul 2026 02:51:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgJVa-00000000DWV-3FYf;
	Sun, 05 Jul 2026 09:51:30 +0000
Date: Sun, 05 Jul 2026 17:50:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sven:efi-psci 3/6] arch/arm64/kernel/setup.c:323:9: error:
 implicit declaration of function 'arm64_efi_init'; did you mean
 'arm64_rsi_init'?
Message-ID: <202607051752.5tObEBmE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git efi-psci
head:   f3e5c7a4c95dadd837bde2519a6226b5cd610415
commit: c11e5fb532e28ab8f8b418760df31ac7bea7e0ba [3/6] arm64/efi: Add and parse custom PSCI EFI configuration table
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260705/202607051752.5tObEBmE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260705/202607051752.5tObEBmE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607051752.5tObEBmE-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/setup.c: In function 'setup_arch':
>> arch/arm64/kernel/setup.c:323:9: error: implicit declaration of function 'arm64_efi_init'; did you mean 'arm64_rsi_init'? [-Wimplicit-function-declaration]
     323 |         arm64_efi_init();
         |         ^~~~~~~~~~~~~~
         |         arm64_rsi_init


vim +323 arch/arm64/kernel/setup.c

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
