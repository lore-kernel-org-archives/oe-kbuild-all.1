Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F15F361DCB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 17:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642335; cv=none; b=HhDlQ1Vuzx0Y/3TCvQrXtbbVkQP9TfwWgck5xiBjbjjSsuvMRhOZVAwaVo+Be4M7ylL8Wsws+nWSe7OzHR6QkYwrSJbkMvUpZMORCHD7Skwu6GEpBp+zWvnrF5jPXA2FdZIDuCotALxPn2qnPy9oFt89VQ6RXkZPxwYprsAT3AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642335; c=relaxed/simple;
	bh=wrJWawP/O8+lMgudQLHB4xJ87XljGHIHgQew/EcqEq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tKHOlX4a9eByI7OtdWKY/uj2+71XnbkJkuEDGnNndxdaXxX8Dr18AcZbhHAz40khPVuC9+lkayMxWeIFl1VziA+roJMvg87LWVvSroiytbevHagCf3YedRorbTJT4jlOA16a0FNmUNhC2L6cux+T+DX2J83H2Ee7cJ/X6z8eQ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUsAF5Yb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUsAF5Yb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786642334; x=1818178334;
  h=date:from:to:cc:subject:message-id;
  bh=wrJWawP/O8+lMgudQLHB4xJ87XljGHIHgQew/EcqEq0=;
  b=PUsAF5Ybjpw8BYNrCN2tdox6V6bEqXvlh6wjteC5D1s6nDnHxY/MYQVD
   jPrmSf8FUMlcAMGanq9agRQepe7aQ4NxHqKKpWBV/1hkrZCI0agqSQ7yg
   jcrT6YWqpmTFB/p29Jd1iN1yR8lQyhuJoPa81CDWcrfQ/3LhFTyLbQXUs
   IW2e0w7ouRLpwxjvkrBhqiX5+sWOo1K41LQc+45+tUTdomRSUEzdX2ns8
   OWECoH4ypCzOO93ceUQNVQs486Nb+TKZqmfYOdVAKizeJvcNejMgiuRse
   fqkI9qoq+6rlq7xROXs3ULBwjiFU51wvq9cM7XiNUhGo4KwUs+Ga1aWUL
   w==;
X-CSE-ConnectionGUID: plfE88YnTg6YEyrGk2YAhg==
X-CSE-MsgGUID: 9zKY5DhkRb+gGyWhUHpV+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87247642"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87247642"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 10:32:12 -0700
X-CSE-ConnectionGUID: r6FQ2nbMQxy8BSbxIdViFw==
X-CSE-MsgGUID: zj8PIxXHRBinvHg/Fz2RLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="264581955"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Aug 2026 10:32:12 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuZHl-00000000W2E-0gb0;
	Thu, 13 Aug 2026 17:32:09 +0000
Date: Fri, 14 Aug 2026 01:31:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-arm-memmap-dtprop 14/16]
 arch/loongarch/kernel/efi.c:133:16: error: 'struct efi' has no member named
 'boot_memmap'
Message-ID: <202608140119.gIP3X2Bj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-arm-memmap-dtprop
head:   670a91515cfd9dbb8db662b15783b03d1e817649
commit: c68fc14ebcb6d2facd1a0e7f9feb538399244b76 [14/16] efi: Turn boot memmap handling into shared code
config: loongarch-randconfig-002-20260813 (https://download.01.org/0day-ci/archive/20260814/202608140119.gIP3X2Bj-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140119.gIP3X2Bj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608140119.gIP3X2Bj-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kernel/efi.c: In function 'efi_init':
>> arch/loongarch/kernel/efi.c:133:16: error: 'struct efi' has no member named 'boot_memmap'
     133 |         if (efi.boot_memmap == EFI_INVALID_TABLE_ADDR)
         |                ^
   arch/loongarch/kernel/efi.c:136:36: error: 'struct efi' has no member named 'boot_memmap'
     136 |         tbl = early_memremap_ro(efi.boot_memmap, sizeof(*tbl));
         |                                    ^
   arch/loongarch/kernel/efi.c:140:46: error: 'struct efi' has no member named 'boot_memmap'
     140 |                 data.phys_map           = efi.boot_memmap + sizeof(*tbl);
         |                                              ^
   arch/loongarch/kernel/efi.c:157:50: error: 'struct efi' has no member named 'boot_memmap'
     157 |                 memblock_reserve((phys_addr_t)efi.boot_memmap, sizeof(*tbl) + data.size);
         |                                                  ^


vim +133 arch/loongarch/kernel/efi.c

    99	
   100	void __init efi_init(void)
   101	{
   102		int size;
   103		void *config_tables;
   104		struct efi_boot_memmap *tbl;
   105	
   106		if (!efi_system_table)
   107			return;
   108	
   109		efi_systab = (efi_system_table_t *)early_memremap_ro(efi_system_table, sizeof(*efi_systab));
   110		if (!efi_systab) {
   111			pr_err("Can't find EFI system table.\n");
   112			return;
   113		}
   114	
   115		efi_systab_report_header(&efi_systab->hdr, efi_systab->fw_vendor);
   116	
   117		if (IS_ENABLED(CONFIG_64BIT))
   118			set_bit(EFI_64BIT, &efi.flags);
   119	
   120		efi_nr_tables	 = efi_systab->nr_tables;
   121		efi_config_table = (unsigned long)efi_systab->tables;
   122	
   123		size = sizeof(efi_config_table_t);
   124		config_tables = early_memremap(efi_config_table, efi_nr_tables * size);
   125		efi_config_parse_tables(config_tables, efi_systab->nr_tables, arch_tables);
   126		early_memunmap(config_tables, efi_nr_tables * size);
   127	
   128		set_bit(EFI_CONFIG_TABLES, &efi.flags);
   129	
   130		if (IS_ENABLED(CONFIG_EFI_EARLYCON) || IS_ENABLED(CONFIG_SYSFB))
   131			init_primary_display();
   132	
 > 133		if (efi.boot_memmap == EFI_INVALID_TABLE_ADDR)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
