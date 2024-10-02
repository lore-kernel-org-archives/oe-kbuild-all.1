Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4181FA4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 00:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727829319; cv=none; b=i1Bzwt+keVEaXdFLxSYpqCshDpVlaPsiTgRcrtkkl3LDDdsyBLT8r3FNJPyKeu2eNSVyXmoV2xO/yR939g6nmG5Rr5NUGiTNl7QwyUYwzDL1O3AtGYJPNc1Jh8Subo8+XLnW+yoEEMc4h+Y8ku76bRhMv2HCUj431tpEYnrOLiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727829319; c=relaxed/simple;
	bh=lj/ur+5DxBV7DOiO0j/lB6nP+CG1sbO3+GMycL8xdSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QVgGYFnTBVzWKHV9Yyfc1xr9Fl29emjdq8KOBWTnMLUlpyoNGYG3CXtILl4CahnaGKdWStmbGwu9LB9EwcdzYjJiIQ7k/pBUAQ9d74TucYMYmOxLbCKCFuyYhmJgQXB/Oa1bg3pU1ttlb+ZtQNLAlNVfOiXUamVWjavvEgZDLUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYs1/p8y; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYs1/p8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727829317; x=1759365317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lj/ur+5DxBV7DOiO0j/lB6nP+CG1sbO3+GMycL8xdSc=;
  b=BYs1/p8yJnyinphy2GinZc2qPJ34nmXQyBDX3A7zndc9iS/9mJqiyHi7
   jiqsNzKEQQbXzmmPNU7uG1xu6Fez4hdMfzMSZLkjs+jE/C7q6/xVG7CO6
   /aMJjUiQk72drDNLwUTk58d0cRdg+sS1B2I/lWhARXWk7xscb/GWISPK8
   aLQ94QmBixIckb3vcwhqoAKpKSO/BhXrAxNqikyQANg3V8oEQVrb2MpPf
   9Z0NiRWQ5Ch7mKt3ZmIo3zijkHznwAYQQ6CasGdw604KbmzLwniNkO3w4
   pcRxXuuDhiu6Y29LPmgeguE0xd3P8+n5ocIAoRvDADQknF4AOX/PGpMPv
   A==;
X-CSE-ConnectionGUID: dB4xSp+2TWqFIECDwLtwVA==
X-CSE-MsgGUID: 5Cm1IcX8RO+fsS23W3J69w==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27163968"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="27163968"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 17:35:17 -0700
X-CSE-ConnectionGUID: OUjOPG4NQVOUGsisDtcy/w==
X-CSE-MsgGUID: vX4B7pFFTRyav/avrndTeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="78381601"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Oct 2024 17:35:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svnKk-000RMS-0B;
	Wed, 02 Oct 2024 00:35:14 +0000
Date: Wed, 2 Oct 2024 08:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 754/1491]
 arch/x86/kernel/setup.c:1258: undefined reference to
 `topology_apply_cmdline_limits_early'
Message-ID: <202410020824.JdxrmWob-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: b9d0120e64b91fdd9c8288c69025e2ce4622c683 [754/1491] UPSTREAM: x86/cpu/topology: Rework possible CPU management
config: i386-buildonly-randconfig-004-20241002 (https://download.01.org/0day-ci/archive/20241002/202410020824.JdxrmWob-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020824.JdxrmWob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020824.JdxrmWob-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/setup.o: in function `setup_arch':
>> arch/x86/kernel/setup.c:1258: undefined reference to `topology_apply_cmdline_limits_early'
>> ld: arch/x86/kernel/setup.c:1270: undefined reference to `topology_init_possible_cpus'


vim +1258 arch/x86/kernel/setup.c

  1146	
  1147		/*
  1148		 * Find free memory for the real mode trampoline and place it there. If
  1149		 * there is not enough free memory under 1M, on EFI-enabled systems
  1150		 * there will be additional attempt to reclaim the memory for the real
  1151		 * mode trampoline at efi_free_boot_services().
  1152		 *
  1153		 * Unconditionally reserve the entire first 1M of RAM because BIOSes
  1154		 * are known to corrupt low memory and several hundred kilobytes are not
  1155		 * worth complex detection what memory gets clobbered. Windows does the
  1156		 * same thing for very similar reasons.
  1157		 *
  1158		 * Moreover, on machines with SandyBridge graphics or in setups that use
  1159		 * crashkernel the entire 1M is reserved anyway.
  1160		 */
  1161		x86_platform.realmode_reserve();
  1162	
  1163		init_mem_mapping();
  1164	
  1165		idt_setup_early_pf();
  1166	
  1167		/*
  1168		 * Update mmu_cr4_features (and, indirectly, trampoline_cr4_features)
  1169		 * with the current CR4 value.  This may not be necessary, but
  1170		 * auditing all the early-boot CR4 manipulation would be needed to
  1171		 * rule it out.
  1172		 *
  1173		 * Mask off features that don't work outside long mode (just
  1174		 * PCIDE for now).
  1175		 */
  1176		mmu_cr4_features = __read_cr4() & ~X86_CR4_PCIDE;
  1177	
  1178		memblock_set_current_limit(get_max_mapped());
  1179	
  1180		/*
  1181		 * NOTE: On x86-32, only from this point on, fixmaps are ready for use.
  1182		 */
  1183	
  1184	#ifdef CONFIG_PROVIDE_OHCI1394_DMA_INIT
  1185		if (init_ohci1394_dma_early)
  1186			init_ohci1394_dma_on_all_controllers();
  1187	#endif
  1188		/* Allocate bigger log buffer */
  1189		setup_log_buf(1);
  1190	
  1191		if (efi_enabled(EFI_BOOT)) {
  1192			switch (boot_params.secure_boot) {
  1193			case efi_secureboot_mode_disabled:
  1194				pr_info("Secure boot disabled\n");
  1195				break;
  1196			case efi_secureboot_mode_enabled:
  1197				pr_info("Secure boot enabled\n");
  1198				break;
  1199			default:
  1200				pr_info("Secure boot could not be determined\n");
  1201				break;
  1202			}
  1203		}
  1204	
  1205		reserve_initrd();
  1206	
  1207		acpi_table_upgrade();
  1208		/* Look for ACPI tables and reserve memory occupied by them. */
  1209		acpi_boot_table_init();
  1210	
  1211		vsmp_init();
  1212	
  1213		io_delay_init();
  1214	
  1215		early_platform_quirks();
  1216	
  1217		/* Some platforms need the APIC registered for NUMA configuration */
  1218		early_acpi_boot_init();
  1219		x86_init.mpparse.early_parse_smp_cfg();
  1220	
  1221		initmem_init();
  1222		dma_contiguous_reserve(max_pfn_mapped << PAGE_SHIFT);
  1223	
  1224		if (boot_cpu_has(X86_FEATURE_GBPAGES))
  1225			hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
  1226	
  1227		/*
  1228		 * Reserve memory for crash kernel after SRAT is parsed so that it
  1229		 * won't consume hotpluggable memory.
  1230		 */
  1231		reserve_crashkernel();
  1232	
  1233		memblock_find_dma_reserve();
  1234	
  1235		if (!early_xdbc_setup_hardware())
  1236			early_xdbc_register_console();
  1237	
  1238		x86_init.paging.pagetable_init();
  1239	
  1240		kasan_init();
  1241	
  1242		/*
  1243		 * Sync back kernel address range.
  1244		 *
  1245		 * FIXME: Can the later sync in setup_cpu_entry_areas() replace
  1246		 * this call?
  1247		 */
  1248		sync_initial_page_table();
  1249	
  1250		tboot_probe();
  1251	
  1252		map_vsyscall();
  1253	
  1254		x86_32_probe_apic();
  1255	
  1256		early_quirks();
  1257	
> 1258		topology_apply_cmdline_limits_early();
  1259	
  1260		/*
  1261		 * Parse SMP configuration. Try ACPI first and then the platform
  1262		 * specific parser.
  1263		 */
  1264		acpi_boot_init();
  1265		x86_init.mpparse.parse_smp_cfg();
  1266	
  1267		/* Last opportunity to detect and map the local APIC */
  1268		init_apic_mappings();
  1269	
> 1270		topology_init_possible_cpus();
  1271	
  1272		init_cpu_to_node();
  1273		init_gi_nodes();
  1274	
  1275		io_apic_init_mappings();
  1276	
  1277		x86_init.hyper.guest_late_init();
  1278	
  1279		e820__reserve_resources();
  1280		e820__register_nosave_regions(max_pfn);
  1281	
  1282		x86_init.resources.reserve_resources();
  1283	
  1284		e820__setup_pci_gap();
  1285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
