Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2187482
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 21:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748034818; cv=none; b=kjMCv0fRPJjvrLQVFxhBCpL0IUnUT+7NW749L8rcCstVNMfw2y8GSSIq41kPmFvwAjuS/bR3OSWWtMuON/Sg8/6oq4fuNixaIWPmkqTMsXBXRDUt9OYhgxx/NanEFaFm6vehN6luXX7+pFLNFkrJD9q6D0dVSwNT0Qa/ssBmNqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748034818; c=relaxed/simple;
	bh=/8mQZalgtu+He59zNTWTn0RpYeRq6uviAStI5Qi+MWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VbfE/mQnfFoi/wTFbDeHneoshYERs7fYpKBTBTPPFbs2sptzdW9AL6PrwDIUyht5rEM96pPlAaEAOyDxOXUcn17D7VVxZTCIWryXcqmZgQYWGgWb8tg+l9oBCBGx+SRLxwuFaBYrhrFxJoSLhRGEGOcSFX+qe7H8aB/aCfgk3I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLFKUsBA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLFKUsBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748034816; x=1779570816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/8mQZalgtu+He59zNTWTn0RpYeRq6uviAStI5Qi+MWc=;
  b=FLFKUsBAXj8PIwc+lRgCnwQBy/XMzuTN0sZRc0Fv9iRr1oXw/ha/w5YT
   0Kvtr0UOorZ5uXTYvqr8b6a2QLSohlFCeltzY8Yv2KXFxN9Bim2GToyLX
   dx8/kSm3hFHK0ACFjh1lJlnu4NE8lZKUTLZsLRCqHCNGdJ3weMhmM9gNT
   ScBfHBVDa80B2AGSlPYoNr2elWd7MnDLDwMMrPOiKh0vv+0VPmxm3JF8f
   z6JgKpYmpEyScx9VSUmAKzXnMTAOc29p2+VQeYI2jS5Jeo9jN9ilw8t8w
   LC/4Fzlv26kyJCkOwzWg6H20fNr4q1xY6O78idZqN1HOYF3tPsKPe2QqO
   w==;
X-CSE-ConnectionGUID: Qe3m+qd+Q1+P6lUwsl+MwQ==
X-CSE-MsgGUID: mFUDpwCHSr6HBcnBMDg7bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53894363"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="53894363"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 14:13:35 -0700
X-CSE-ConnectionGUID: DlM3C3PmT524EibBYKmicQ==
X-CSE-MsgGUID: wtR6fObPQmGwt11WR7twFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="142254880"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 May 2025 14:13:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIZhq-000Qjk-2s;
	Fri, 23 May 2025 21:13:30 +0000
Date: Sat, 24 May 2025 05:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/next-20250522/clang-kstack-erase 12/15]
 arch/x86/kernel/setup.c:971: undefined reference to
 `efi_memblock_x86_reserve_range'
Message-ID: <202505240536.Co7ZYLrT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/next-20250522/clang-kstack-erase
head:   681194c2c1e885a1eeaff640c0b3bcc071fea17d
commit: 18d9b0483506c238adfd8e7799daeb2f5303efb4 [12/15] init.h: Disable sanitizer coverage for __init and __head
config: x86_64-buildonly-randconfig-006-20250523 (https://download.01.org/0day-ci/archive/20250524/202505240536.Co7ZYLrT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240536.Co7ZYLrT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240536.Co7ZYLrT-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: early_page_ext_enabled+0x8 (section: .text) -> early_page_ext (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: early_page_ext_enabled+0x13 (section: .text) -> early_page_ext (section: .init.data)
--
ld: vmlinux.o: in function `setup_arch':
>> arch/x86/kernel/setup.c:971: undefined reference to `efi_memblock_x86_reserve_range'
ld: arch/x86/kernel/setup.c:987: undefined reference to `efi_init'
>> ld: arch/x86/kernel/setup.c:1251: undefined reference to `efi_mem_type'


vim +971 arch/x86/kernel/setup.c

4faa0e5d6d79fc4 arch/x86/kernel/setup.c    Julian Stecklina          2024-03-28   917  
4faa0e5d6d79fc4 arch/x86/kernel/setup.c    Julian Stecklina          2024-03-28   918  	strscpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
4faa0e5d6d79fc4 arch/x86/kernel/setup.c    Julian Stecklina          2024-03-28   919  	*cmdline_p = command_line;
4faa0e5d6d79fc4 arch/x86/kernel/setup.c    Julian Stecklina          2024-03-28   920  
9863c90f682fba3 arch/x86/kernel/setup.c    Alok Kataria              2010-08-23   921  	/*
9863c90f682fba3 arch/x86/kernel/setup.c    Alok Kataria              2010-08-23   922  	 * If we have OLPC OFW, we might end up relocating the fixmap due to
9863c90f682fba3 arch/x86/kernel/setup.c    Alok Kataria              2010-08-23   923  	 * reserve_top(), so do this before touching the ioremap area.
9863c90f682fba3 arch/x86/kernel/setup.c    Alok Kataria              2010-08-23   924  	 */
fd699c76552bbfa arch/x86/kernel/setup.c    Andres Salomon            2010-06-18   925  	olpc_ofw_detect();
fd699c76552bbfa arch/x86/kernel/setup.c    Andres Salomon            2010-06-18   926  
433f8924fa8e55a arch/x86/kernel/setup.c    Thomas Gleixner           2017-08-28   927  	idt_setup_early_traps();
9e882c9282512cc arch/x86/kernel/setup.c    Jeremy Fitzhardinge       2008-07-21   928  	early_cpu_init();
8990cac6e5ea7fa arch/x86/kernel/setup.c    Pavel Tatashin            2018-07-19   929  	jump_label_init();
a945c8345ec0dec arch/x86/kernel/setup.c    Peter Zijlstra            2020-08-18   930  	static_call_init();
1a98fd14f44cfad arch/x86/kernel/setup.c    Jeremy Fitzhardinge       2008-06-29   931  	early_ioremap_init();
1a98fd14f44cfad arch/x86/kernel/setup.c    Jeremy Fitzhardinge       2008-06-29   932  
fd699c76552bbfa arch/x86/kernel/setup.c    Andres Salomon            2010-06-18   933  	setup_olpc_ofw_pgd();
fd699c76552bbfa arch/x86/kernel/setup.c    Andres Salomon            2010-06-18   934  
d45dd0a9b27ee8b arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14   935) 	parse_boot_params();
7465252ea0121c9 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-23   936  
42bbdb43b16d233 arch/x86/kernel/setup.c    Thomas Gleixner           2009-08-20   937  	x86_init.oem.arch_setup();
2215e69d2cf5024 arch/x86/kernel/setup_32.c Ying Huang                2008-01-30   938  
8aa83e6395ce047 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   939  	/*
8aa83e6395ce047 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   940  	 * Do some memory reservations *before* memory is added to memblock, so
8aa83e6395ce047 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   941  	 * memblock allocations won't overwrite it.
8aa83e6395ce047 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   942  	 *
8aa83e6395ce047 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   943  	 * After this point, everything still needed from the boot loader or
8aa83e6395ce047 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   944  	 * firmware or kernel text should be early reserved or marked not RAM in
8aa83e6395ce047 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   945  	 * e820. All other memory is free game.
8aa83e6395ce047 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   946  	 *
8aa83e6395ce047 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   947  	 * This call needs to happen before e820__memory_setup() which calls the
8aa83e6395ce047 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   948  	 * xen_memory_setup() on Xen dom0 which relies on the fact that those
8aa83e6395ce047 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   949  	 * early reservations have happened already.
8aa83e6395ce047 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   950  	 */
8aa83e6395ce047 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   951  	early_reserve_memory();
8aa83e6395ce047 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   952  
419afdf53cca794 arch/x86/kernel/setup.c    Bjorn Helgaas             2010-10-26   953  	iomem_resource.end = (1ULL << boot_cpu_data.x86_phys_bits) - 1;
103e206309639b6 arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28   954  	e820__memory_setup();
28bb22379513ca3 arch/x86/kernel/setup.c    Yinghai Lu                2008-06-30   955  	parse_setup_data();
28bb22379513ca3 arch/x86/kernel/setup.c    Yinghai Lu                2008-06-30   956  
^1da177e4c3f415 arch/i386/kernel/setup.c   Linus Torvalds            2005-04-16   957  	copy_edd();
^1da177e4c3f415 arch/i386/kernel/setup.c   Linus Torvalds            2005-04-16   958  
30120d72a41e0e2 arch/x86/kernel/setup.c    Kefeng Wang               2021-07-07   959  	setup_initial_init_mm(_text, _etext, _edata, (void *)_brk_end);
fe3d197f84319d3 arch/x86/kernel/setup.c    Dave Hansen               2014-11-14   960  
fbe6183998546f8 arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   961  	/*
fbe6183998546f8 arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   962  	 * x86_configure_nx() is called before parse_early_param() to detect
fbe6183998546f8 arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   963  	 * whether hardware doesn't support NX (so that the early EHCI debug
76ea0025a214cdf arch/x86/kernel/setup.c    Borislav Petkov           2022-01-27   964  	 * console setup can safely call set_fixmap()).
fbe6183998546f8 arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   965  	 */
fbe6183998546f8 arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   966  	x86_configure_nx();
fbe6183998546f8 arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   967  
fbe6183998546f8 arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   968  	parse_early_param();
fbe6183998546f8 arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   969  
2f5b3514c33feca arch/x86/kernel/setup.c    Mike Rapoport             2021-12-13   970  	if (efi_enabled(EFI_BOOT))
2f5b3514c33feca arch/x86/kernel/setup.c    Mike Rapoport             2021-12-13  @971  		efi_memblock_x86_reserve_range();
2f5b3514c33feca arch/x86/kernel/setup.c    Mike Rapoport             2021-12-13   972  
4b0f3b81eb33ef1 arch/x86/kernel/setup.c    Kees Cook                 2009-11-13   973  	x86_report_nx();
0ad5bce7409d681 arch/x86/kernel/setup.c    Jeremy Fitzhardinge       2008-09-11   974  
bef4f379e953af4 arch/x86/kernel/setup.c    Thomas Gleixner           2023-08-08   975  	apic_setup_apic_calls();
bef4f379e953af4 arch/x86/kernel/setup.c    Thomas Gleixner           2023-08-08   976  
3c999f142665265 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-20   977  	if (acpi_mps_check()) {
3eb11edc1321e14 arch/x86/kernel/setup_32.c Ingo Molnar               2008-06-23   978  #ifdef CONFIG_X86_LOCAL_APIC
49062454a3eb4a2 arch/x86/kernel/setup.c    Thomas Gleixner           2023-08-08   979  		apic_is_disabled = true;
3eb11edc1321e14 arch/x86/kernel/setup_32.c Ingo Molnar               2008-06-23   980  #endif
988781dc3e1d920 arch/x86/kernel/setup.c    Yinghai Lu                2008-07-21   981  		setup_clear_cpu_cap(X86_FEATURE_APIC);
3c999f142665265 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-20   982  	}
3c999f142665265 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-20   983  
9641bdafd8571e2 arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28   984  	e820__finish_early_params();
1a3f239ddf9208f arch/i386/kernel/setup.c   Rusty Russell             2006-09-26   985  
83e68189745ad93 arch/x86/kernel/setup.c    Matt Fleming              2012-11-14   986  	if (efi_enabled(EFI_BOOT))
ff0c0874905fb31 arch/x86/kernel/setup.c    Brian Maly                2009-03-03   987  		efi_init();
ff0c0874905fb31 arch/x86/kernel/setup.c    Brian Maly                2009-03-03   988  
9338c2233b97f97 arch/x86/kernel/setup.c    Ross Lagerwall            2023-06-05   989  	reserve_ibft_region();
0f4a1e80989aca1 arch/x86/kernel/setup.c    Kevin Loughlin            2024-03-13   990  	x86_init.resources.dmi_setup();
2216d199b1430d1 arch/x86/kernel/setup.c    Yinghai Lu                2008-09-22   991  
88b094fb8d4fe43 arch/x86/kernel/setup.c    Alok Kataria              2008-10-27   992  	/*
88b094fb8d4fe43 arch/x86/kernel/setup.c    Alok Kataria              2008-10-27   993  	 * VMware detection requires dmi to be available, so this
0fca08122eaf5c9 arch/x86/kernel/setup.c    Robert Richter            2019-03-28   994  	 * needs to be done after dmi_setup(), for the boot CPU.
29055dc74287467 arch/x86/kernel/setup.c    Juergen Gross             2023-05-02   995  	 * For some guest types (Xen PV, SEV-SNP, TDX) it is required to be
29055dc74287467 arch/x86/kernel/setup.c    Juergen Gross             2023-05-02   996  	 * called before cache_bp_init() for setting up MTRR state.
88b094fb8d4fe43 arch/x86/kernel/setup.c    Alok Kataria              2008-10-27   997  	 */
2d826404f0bdcac arch/x86/kernel/setup.c    Thomas Gleixner           2009-08-20   998  	init_hypervisor_platform();
88b094fb8d4fe43 arch/x86/kernel/setup.c    Alok Kataria              2008-10-27   999  
cf7a63ef4e0203f arch/x86/kernel/setup.c    Pavel Tatashin            2018-07-19  1000  	tsc_early_init();
f7cf5a5b8c0e59e arch/x86/kernel/setup.c    Thomas Gleixner           2009-08-19  1001  	x86_init.resources.probe_roms();
41c094fd3ca54f1 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-16  1002  
297fb82ebaad50e arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14  1003) 	/*
297fb82ebaad50e arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14  1004) 	 * Add resources for kernel text and data to the iomem_resource.
297fb82ebaad50e arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14  1005) 	 * Do it after parse_early_param, so it can be debugged.
297fb82ebaad50e arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14  1006) 	 */
297fb82ebaad50e arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14  1007) 	setup_kernel_resources();
4046d6e81f33b7e arch/x86/kernel/setup.c    Linus Torvalds            2016-04-14  1008  
b422a3091748c38 arch/x86/kernel/setup.c    Yinghai Lu                2013-01-24  1009  	e820_add_kernel_range();
1b5576e69a5fe16 arch/x86/kernel/setup.c    Yinghai Lu                2010-01-22  1010  	trim_bios_range();
76934ed4b33b650 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-25  1011  #ifdef CONFIG_X86_32
cc9f7a0ccf000d4 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-16  1012  	if (ppro_with_ram_bug()) {
09821ff1d50a1ec arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1013  		e820__range_update(0x70000000ULL, 0x40000ULL, E820_TYPE_RAM,
09821ff1d50a1ec arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1014  				  E820_TYPE_RESERVED);
f9748fa04585104 arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1015  		e820__update_table(e820_table);
cc9f7a0ccf000d4 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-16  1016  		printk(KERN_INFO "fixed physical RAM map:\n");
be0c3f0fcade7ad arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1017  		e820__print_table("bad_ppro");
cc9f7a0ccf000d4 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-16  1018  	}
76934ed4b33b650 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-25  1019  #else
76934ed4b33b650 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-25  1020  	early_gart_iommu_check();
76934ed4b33b650 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-25  1021  #endif
cc9f7a0ccf000d4 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-16  1022  
7b2a0a6c4866cac arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-03  1023  	/*
7b2a0a6c4866cac arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-03  1024  	 * partially used pages are not usable - thus
7b2a0a6c4866cac arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-03  1025  	 * we are rounding upwards:
7b2a0a6c4866cac arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-03  1026  	 */
0c6fc11ac343c82 arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1027  	max_pfn = e820__end_of_ram_pfn();
7b2a0a6c4866cac arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-03  1028  
093af8d7f0ba3c6 arch/x86/kernel/setup_32.c Yinghai Lu                2008-01-30  1029  	/* update e820 for memory not covered by WB MTRRs */
0b9a6a8bedbfb38 arch/x86/kernel/setup.c    Juergen Gross             2022-11-02  1030  	cache_bp_init();
2dc807b37b7b8c7 arch/x86/kernel/setup.c    Yinghai Lu                2008-07-08  1031  	if (mtrr_trim_uncached_memory(max_pfn))
0c6fc11ac343c82 arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1032  		max_pfn = e820__end_of_ram_pfn();
76c324182bbd29d arch/x86/kernel/setup_32.c Yinghai Lu                2008-03-23  1033  
8dd3303001976aa arch/x86/kernel/setup.c    Igor Mammedov             2015-12-04  1034  	max_possible_pfn = max_pfn;
8dd3303001976aa arch/x86/kernel/setup.c    Igor Mammedov             2015-12-04  1035  
c7d2361f7524f36 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1036  	/*
c7d2361f7524f36 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1037  	 * Define random base addresses for memory sections after max_pfn is
c7d2361f7524f36 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1038  	 * defined and before each memory section base is used.
c7d2361f7524f36 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1039  	 */
c7d2361f7524f36 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1040  	kernel_randomize_memory();
c7d2361f7524f36 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1041  

:::::: The code at line 971 was first introduced by commit
:::::: 2f5b3514c33fecad4003ce0f22ca9691492d310b x86/boot: Move EFI range reservation after cmdline parsing

:::::: TO: Mike Rapoport <rppt@kernel.org>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
