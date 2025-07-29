Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F6C258A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753778130; cv=none; b=OodoJekDHXoxKw8MByminhEy5DI9ZTnvQtN3uBg6eMtbxlORX6QHvOA8GQb28KWtWiizBOmqoVzUEux8TkAHcN+w5qj26aVo5r92UvZ7Ma+vhI1k+WyYQ5K79fsMb1qwsA00IP5hUhGF5i27x26cspcM6DjZ0r5bNcDhGKwyv4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753778130; c=relaxed/simple;
	bh=WVbfXXlTupJc2ELw5SIoxivsQaRB3Rii5jLPBcYQA4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Niy/wo6GC6d/Vq2ZktnU0D2TCHJ7l7foQ1D57NjXvpOJnjdwqBJB/mz28LPCdHjkfZ6yE6A35qdl1ic4jRFc3Qh9JDjxOJsbWhJaH1Q+2LkHJD61EBboSO8HgtHfDjV2beOoT1Rd6d0w+rW6fFEThcl1Uh6JfMRd8FebkPIRKeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afx02rfT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afx02rfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753778128; x=1785314128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WVbfXXlTupJc2ELw5SIoxivsQaRB3Rii5jLPBcYQA4k=;
  b=afx02rfTWXZS6cUOxkWTYizGmPmxwneMBHLYZk5Yqxu6DD2USVi00G8R
   h/4rW/OK857hbAhuU1QNwI6/wL1irmqHEeM6DDiI0IPplsgPU1gbD+NaY
   gF6ppZ32sD5kAagsLrUAbBtaZFQIsFUP20S6sHvfHVNHIduVV81E63c+N
   LSnp5oyueoiC9CjSGV7TRy7U7eYFbj918UDr0siTv5G9tzy0MoDipBHr8
   zWWcEnMmyuMpJ8OvOpD6+Z8U9BD+gnofMCUNcJPIcjkOYlfyElWYjrom/
   odhCJ4sc0ie9vV4VUaQqwe+McWLX2BfFxo7g9q6NbFUvyLwQT4UrS+7ow
   w==;
X-CSE-ConnectionGUID: OYVV8daiSnKI1w3D28nrxg==
X-CSE-MsgGUID: mrYi6BFwRreT/kzPZEZS2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66605567"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="66605567"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 01:35:27 -0700
X-CSE-ConnectionGUID: gUNknSN8Qtee8f/nNNpyRQ==
X-CSE-MsgGUID: mVjyHfRaS5GPUET7euOntw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="166813571"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jul 2025 01:35:26 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugfnw-0000cl-1C;
	Tue, 29 Jul 2025 08:35:24 +0000
Date: Tue, 29 Jul 2025 10:34:56 +0200
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12341/12680] arch/x86/kernel/setup.c:971:
 undefined reference to `efi_memblock_x86_reserve_range'
Message-ID: <202507291023.HBuEiQHk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   54efec8782214652b331c50646013f8526570e8d
commit: aff3dec740a27106fa0d302c7af107362e4080cc [12341/12680] init.h: Disable sanitizer coverage for __init and __head
config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20250729/202507291023.HBuEiQHk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291023.HBuEiQHk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291023.HBuEiQHk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/setup.o: in function `setup_arch':
>> arch/x86/kernel/setup.c:971: undefined reference to `efi_memblock_x86_reserve_range'
>> ld: arch/x86/kernel/setup.c:987: undefined reference to `efi_init'
   ld: arch/x86/kernel/cpu/mshyperv.o: in function `ms_hyperv_init_platform':
>> arch/x86/kernel/cpu/mshyperv.c:494: undefined reference to `isolation_type_snp'
>> ld: arch/x86/kernel/cpu/mshyperv.c:496: undefined reference to `isolation_type_tdx'
   ld: drivers/acpi/osl.o: in function `acpi_os_get_root_pointer':
>> drivers/acpi/osl.c:210: undefined reference to `efi'
>> ld: drivers/acpi/osl.c:210: undefined reference to `efi'
>> ld: drivers/acpi/osl.c:210: undefined reference to `efi'
   ld: drivers/acpi/osl.c:212: undefined reference to `efi'
   ld: drivers/acpi/osl.c:212: undefined reference to `efi'
   ld: drivers/acpi/osl.o:drivers/acpi/osl.c:212: more undefined references to `efi' follow


vim +971 arch/x86/kernel/setup.c

4faa0e5d6d79fc arch/x86/kernel/setup.c    Julian Stecklina          2024-03-28   917  
4faa0e5d6d79fc arch/x86/kernel/setup.c    Julian Stecklina          2024-03-28   918  	strscpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
4faa0e5d6d79fc arch/x86/kernel/setup.c    Julian Stecklina          2024-03-28   919  	*cmdline_p = command_line;
4faa0e5d6d79fc arch/x86/kernel/setup.c    Julian Stecklina          2024-03-28   920  
9863c90f682fba arch/x86/kernel/setup.c    Alok Kataria              2010-08-23   921  	/*
9863c90f682fba arch/x86/kernel/setup.c    Alok Kataria              2010-08-23   922  	 * If we have OLPC OFW, we might end up relocating the fixmap due to
9863c90f682fba arch/x86/kernel/setup.c    Alok Kataria              2010-08-23   923  	 * reserve_top(), so do this before touching the ioremap area.
9863c90f682fba arch/x86/kernel/setup.c    Alok Kataria              2010-08-23   924  	 */
fd699c76552bbf arch/x86/kernel/setup.c    Andres Salomon            2010-06-18   925  	olpc_ofw_detect();
fd699c76552bbf arch/x86/kernel/setup.c    Andres Salomon            2010-06-18   926  
433f8924fa8e55 arch/x86/kernel/setup.c    Thomas Gleixner           2017-08-28   927  	idt_setup_early_traps();
9e882c9282512c arch/x86/kernel/setup.c    Jeremy Fitzhardinge       2008-07-21   928  	early_cpu_init();
8990cac6e5ea7f arch/x86/kernel/setup.c    Pavel Tatashin            2018-07-19   929  	jump_label_init();
a945c8345ec0de arch/x86/kernel/setup.c    Peter Zijlstra            2020-08-18   930  	static_call_init();
1a98fd14f44cfa arch/x86/kernel/setup.c    Jeremy Fitzhardinge       2008-06-29   931  	early_ioremap_init();
1a98fd14f44cfa arch/x86/kernel/setup.c    Jeremy Fitzhardinge       2008-06-29   932  
fd699c76552bbf arch/x86/kernel/setup.c    Andres Salomon            2010-06-18   933  	setup_olpc_ofw_pgd();
fd699c76552bbf arch/x86/kernel/setup.c    Andres Salomon            2010-06-18   934  
d45dd0a9b27ee8 arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14   935) 	parse_boot_params();
7465252ea0121c arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-23   936  
42bbdb43b16d23 arch/x86/kernel/setup.c    Thomas Gleixner           2009-08-20   937  	x86_init.oem.arch_setup();
2215e69d2cf502 arch/x86/kernel/setup_32.c Ying Huang                2008-01-30   938  
8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   939  	/*
8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   940  	 * Do some memory reservations *before* memory is added to memblock, so
8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   941  	 * memblock allocations won't overwrite it.
8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   942  	 *
8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   943  	 * After this point, everything still needed from the boot loader or
8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   944  	 * firmware or kernel text should be early reserved or marked not RAM in
8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   945  	 * e820. All other memory is free game.
8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   946  	 *
8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   947  	 * This call needs to happen before e820__memory_setup() which calls the
8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   948  	 * xen_memory_setup() on Xen dom0 which relies on the fact that those
8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   949  	 * early reservations have happened already.
8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   950  	 */
8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   951  	early_reserve_memory();
8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   952  
419afdf53cca79 arch/x86/kernel/setup.c    Bjorn Helgaas             2010-10-26   953  	iomem_resource.end = (1ULL << boot_cpu_data.x86_phys_bits) - 1;
103e206309639b arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28   954  	e820__memory_setup();
28bb22379513ca arch/x86/kernel/setup.c    Yinghai Lu                2008-06-30   955  	parse_setup_data();
28bb22379513ca arch/x86/kernel/setup.c    Yinghai Lu                2008-06-30   956  
^1da177e4c3f41 arch/i386/kernel/setup.c   Linus Torvalds            2005-04-16   957  	copy_edd();
^1da177e4c3f41 arch/i386/kernel/setup.c   Linus Torvalds            2005-04-16   958  
30120d72a41e0e arch/x86/kernel/setup.c    Kefeng Wang               2021-07-07   959  	setup_initial_init_mm(_text, _etext, _edata, (void *)_brk_end);
fe3d197f84319d arch/x86/kernel/setup.c    Dave Hansen               2014-11-14   960  
fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   961  	/*
fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   962  	 * x86_configure_nx() is called before parse_early_param() to detect
fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   963  	 * whether hardware doesn't support NX (so that the early EHCI debug
76ea0025a214cd arch/x86/kernel/setup.c    Borislav Petkov           2022-01-27   964  	 * console setup can safely call set_fixmap()).
fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   965  	 */
fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   966  	x86_configure_nx();
fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   967  
fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   968  	parse_early_param();
fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   969  
2f5b3514c33fec arch/x86/kernel/setup.c    Mike Rapoport             2021-12-13   970  	if (efi_enabled(EFI_BOOT))
2f5b3514c33fec arch/x86/kernel/setup.c    Mike Rapoport             2021-12-13  @971  		efi_memblock_x86_reserve_range();
2f5b3514c33fec arch/x86/kernel/setup.c    Mike Rapoport             2021-12-13   972  
4b0f3b81eb33ef arch/x86/kernel/setup.c    Kees Cook                 2009-11-13   973  	x86_report_nx();
0ad5bce7409d68 arch/x86/kernel/setup.c    Jeremy Fitzhardinge       2008-09-11   974  
bef4f379e953af arch/x86/kernel/setup.c    Thomas Gleixner           2023-08-08   975  	apic_setup_apic_calls();
bef4f379e953af arch/x86/kernel/setup.c    Thomas Gleixner           2023-08-08   976  
3c999f14266526 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-20   977  	if (acpi_mps_check()) {
3eb11edc1321e1 arch/x86/kernel/setup_32.c Ingo Molnar               2008-06-23   978  #ifdef CONFIG_X86_LOCAL_APIC
49062454a3eb4a arch/x86/kernel/setup.c    Thomas Gleixner           2023-08-08   979  		apic_is_disabled = true;
3eb11edc1321e1 arch/x86/kernel/setup_32.c Ingo Molnar               2008-06-23   980  #endif
988781dc3e1d92 arch/x86/kernel/setup.c    Yinghai Lu                2008-07-21   981  		setup_clear_cpu_cap(X86_FEATURE_APIC);
3c999f14266526 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-20   982  	}
3c999f14266526 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-20   983  
9641bdafd8571e arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28   984  	e820__finish_early_params();
1a3f239ddf9208 arch/i386/kernel/setup.c   Rusty Russell             2006-09-26   985  
83e68189745ad9 arch/x86/kernel/setup.c    Matt Fleming              2012-11-14   986  	if (efi_enabled(EFI_BOOT))
ff0c0874905fb3 arch/x86/kernel/setup.c    Brian Maly                2009-03-03  @987  		efi_init();
ff0c0874905fb3 arch/x86/kernel/setup.c    Brian Maly                2009-03-03   988  
9338c2233b97f9 arch/x86/kernel/setup.c    Ross Lagerwall            2023-06-05   989  	reserve_ibft_region();
0f4a1e80989aca arch/x86/kernel/setup.c    Kevin Loughlin            2024-03-13   990  	x86_init.resources.dmi_setup();
2216d199b1430d arch/x86/kernel/setup.c    Yinghai Lu                2008-09-22   991  
88b094fb8d4fe4 arch/x86/kernel/setup.c    Alok Kataria              2008-10-27   992  	/*
88b094fb8d4fe4 arch/x86/kernel/setup.c    Alok Kataria              2008-10-27   993  	 * VMware detection requires dmi to be available, so this
0fca08122eaf5c arch/x86/kernel/setup.c    Robert Richter            2019-03-28   994  	 * needs to be done after dmi_setup(), for the boot CPU.
29055dc7428746 arch/x86/kernel/setup.c    Juergen Gross             2023-05-02   995  	 * For some guest types (Xen PV, SEV-SNP, TDX) it is required to be
29055dc7428746 arch/x86/kernel/setup.c    Juergen Gross             2023-05-02   996  	 * called before cache_bp_init() for setting up MTRR state.
88b094fb8d4fe4 arch/x86/kernel/setup.c    Alok Kataria              2008-10-27   997  	 */
2d826404f0bdca arch/x86/kernel/setup.c    Thomas Gleixner           2009-08-20   998  	init_hypervisor_platform();
88b094fb8d4fe4 arch/x86/kernel/setup.c    Alok Kataria              2008-10-27   999  
cf7a63ef4e0203 arch/x86/kernel/setup.c    Pavel Tatashin            2018-07-19  1000  	tsc_early_init();
f7cf5a5b8c0e59 arch/x86/kernel/setup.c    Thomas Gleixner           2009-08-19  1001  	x86_init.resources.probe_roms();
41c094fd3ca54f arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-16  1002  
297fb82ebaad50 arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14  1003) 	/*
297fb82ebaad50 arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14  1004) 	 * Add resources for kernel text and data to the iomem_resource.
297fb82ebaad50 arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14  1005) 	 * Do it after parse_early_param, so it can be debugged.
297fb82ebaad50 arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14  1006) 	 */
297fb82ebaad50 arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14  1007) 	setup_kernel_resources();
4046d6e81f33b7 arch/x86/kernel/setup.c    Linus Torvalds            2016-04-14  1008  
b422a3091748c3 arch/x86/kernel/setup.c    Yinghai Lu                2013-01-24  1009  	e820_add_kernel_range();
1b5576e69a5fe1 arch/x86/kernel/setup.c    Yinghai Lu                2010-01-22  1010  	trim_bios_range();
76934ed4b33b65 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-25  1011  #ifdef CONFIG_X86_32
cc9f7a0ccf000d arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-16  1012  	if (ppro_with_ram_bug()) {
09821ff1d50a1e arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1013  		e820__range_update(0x70000000ULL, 0x40000ULL, E820_TYPE_RAM,
09821ff1d50a1e arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1014  				  E820_TYPE_RESERVED);
f9748fa0458510 arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1015  		e820__update_table(e820_table);
cc9f7a0ccf000d arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-16  1016  		printk(KERN_INFO "fixed physical RAM map:\n");
be0c3f0fcade7a arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1017  		e820__print_table("bad_ppro");
cc9f7a0ccf000d arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-16  1018  	}
76934ed4b33b65 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-25  1019  #else
76934ed4b33b65 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-25  1020  	early_gart_iommu_check();
76934ed4b33b65 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-25  1021  #endif
cc9f7a0ccf000d arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-16  1022  
7b2a0a6c4866ca arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-03  1023  	/*
7b2a0a6c4866ca arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-03  1024  	 * partially used pages are not usable - thus
7b2a0a6c4866ca arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-03  1025  	 * we are rounding upwards:
7b2a0a6c4866ca arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-03  1026  	 */
0c6fc11ac343c8 arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1027  	max_pfn = e820__end_of_ram_pfn();
7b2a0a6c4866ca arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-03  1028  
093af8d7f0ba3c arch/x86/kernel/setup_32.c Yinghai Lu                2008-01-30  1029  	/* update e820 for memory not covered by WB MTRRs */
0b9a6a8bedbfb3 arch/x86/kernel/setup.c    Juergen Gross             2022-11-02  1030  	cache_bp_init();
2dc807b37b7b8c arch/x86/kernel/setup.c    Yinghai Lu                2008-07-08  1031  	if (mtrr_trim_uncached_memory(max_pfn))
0c6fc11ac343c8 arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1032  		max_pfn = e820__end_of_ram_pfn();
76c324182bbd29 arch/x86/kernel/setup_32.c Yinghai Lu                2008-03-23  1033  
8dd3303001976a arch/x86/kernel/setup.c    Igor Mammedov             2015-12-04  1034  	max_possible_pfn = max_pfn;
8dd3303001976a arch/x86/kernel/setup.c    Igor Mammedov             2015-12-04  1035  
c7d2361f7524f3 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1036  	/*
c7d2361f7524f3 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1037  	 * Define random base addresses for memory sections after max_pfn is
c7d2361f7524f3 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1038  	 * defined and before each memory section base is used.
c7d2361f7524f3 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1039  	 */
c7d2361f7524f3 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1040  	kernel_randomize_memory();
c7d2361f7524f3 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1041  

:::::: The code at line 971 was first introduced by commit
:::::: 2f5b3514c33fecad4003ce0f22ca9691492d310b x86/boot: Move EFI range reservation after cmdline parsing

:::::: TO: Mike Rapoport <rppt@kernel.org>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
