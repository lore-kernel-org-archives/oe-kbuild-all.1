Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224681C695
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 16:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710691709; cv=none; b=HWdcWORtZ4ftzF42HkUsCZ2p8YAeff0068dyDC82n6aZnE1FXe6nHVbZbKBRoRF33+sCTRE/lm2HF1rm3GLjWqAgIY8zxJE5GZN6y3oBR0i3rB9423KeggKm+ZEoIELf1eD2SNCu0DJS4F+p4HFRM2d5rCnCBgZNvfha20JHpns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710691709; c=relaxed/simple;
	bh=i1gipBS8Yq7qHQS3A1al1fUZIHrt0EHldUrdfqNTD0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KGHUop6cjdwOPjEqa9b9bKh2GPk4IozSJMHkoHhkAYNdIPEIaZ4/wzS0X7obzS7zkM8xnSrF5pJAWY3bBxeESOG8UwmCeUFvwCNj+sllLNGmyNd95CeIVJ2+fDD42a8/hsNTo39BDXEm36fp00IJlf42leNv2Kq+nx7RN6ACW9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gs9ELK9b; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gs9ELK9b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710691707; x=1742227707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i1gipBS8Yq7qHQS3A1al1fUZIHrt0EHldUrdfqNTD0U=;
  b=gs9ELK9b5KRDLAL/E7YBU+si5eEefxaD5RG0E+NqzH5GtGu+obqCCJHw
   BciR5F3T/0sWYTRbMN3AKVpaUMR2Zkvoeg+SoROlUMQ9EjYUcqQ9nIjD2
   VMsx8NdEN6v+DQvbVA6r5umDDeAuxy+8tdiFMvXfTq9PP21mrGEORCxGk
   RhSTG8M5nYdKIXFIXZp2tll/EryfeOk1QsL+Pz2MGktUUFS0bJyW/Awvk
   GuYdAb2Coh6cWVZ5Kpn2HKDObf03iLXIJLM/P4u/rEJKVbOJ0EdEJmbDt
   fiI9h4M9PjogEm8S7J91OdP0iI6c2HgClw/Z/R2+/lefD+8RIVsUEqZuh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="9281006"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="9281006"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 09:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="44149633"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Mar 2024 09:08:24 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlt3d-000GKd-0w;
	Sun, 17 Mar 2024 16:08:21 +0000
Date: Mon, 18 Mar 2024 00:07:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 777/4034]
 arch/loongarch/kernel/legacy_boot.c:39:19: sparse: sparse: symbol
 'liointc_domain' was not declared. Should it be static?
Message-ID: <202403180017.WZB6OP2s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   22a313585b0ee196eb843e8b7182402b92d12ce6
commit: db5bb24abc8dd120fd81b7ce21819e96578d011e [777/4034] LoongArch: Old BPI compatibility
config: loongarch-randconfig-r132-20240317 (https://download.01.org/0day-ci/archive/20240318/202403180017.WZB6OP2s-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240318/202403180017.WZB6OP2s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403180017.WZB6OP2s-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/legacy_boot.c:39:19: sparse: sparse: symbol 'liointc_domain' was not declared. Should it be static?
>> arch/loongarch/kernel/legacy_boot.c:40:19: sparse: sparse: symbol 'pch_lpc_domain' was not declared. Should it be static?
>> arch/loongarch/kernel/legacy_boot.c:41:19: sparse: sparse: symbol 'pch_msi_domain' was not declared. Should it be static?
>> arch/loongarch/kernel/legacy_boot.c:42:19: sparse: sparse: symbol 'pch_pic_domain' was not declared. Should it be static?
>> arch/loongarch/kernel/legacy_boot.c:45:5: sparse: sparse: symbol 'nr_io_pics' was not declared. Should it be static?
>> arch/loongarch/kernel/legacy_boot.c:48:26: sparse: sparse: symbol 'liointc_default' was not declared. Should it be static?
>> arch/loongarch/kernel/legacy_boot.c:55:26: sparse: sparse: symbol 'pchlpc_default' was not declared. Should it be static?
>> arch/loongarch/kernel/legacy_boot.c:61:26: sparse: sparse: symbol 'eiointc_default' was not declared. Should it be static?
>> arch/loongarch/kernel/legacy_boot.c:62:26: sparse: sparse: symbol 'pchmsi_default' was not declared. Should it be static?
>> arch/loongarch/kernel/legacy_boot.c:63:26: sparse: sparse: symbol 'pchpic_default' was not declared. Should it be static?
>> arch/loongarch/kernel/legacy_boot.c:94:6: sparse: sparse: symbol 'register_default_pic' was not declared. Should it be static?
>> arch/loongarch/kernel/legacy_boot.c:341:14: sparse: sparse: symbol 'bpi_init' was not declared. Should it be static?

vim +/liointc_domain +39 arch/loongarch/kernel/legacy_boot.c

    37	
    38	struct irq_domain *cpu_domain;
  > 39	struct irq_domain *liointc_domain;
  > 40	struct irq_domain *pch_lpc_domain;
  > 41	struct irq_domain *pch_msi_domain[MAX_IO_PICS];
  > 42	struct irq_domain *pch_pic_domain[MAX_IO_PICS];
    43	
    44	char arcs_cmdline[COMMAND_LINE_SIZE];
  > 45	int nr_io_pics;
    46	int bpi_version;
    47	
  > 48	struct acpi_madt_lio_pic liointc_default = {
    49			.address = LOONGSON_REG_BASE + 0x1400,
    50			.size = 256,
    51			.cascade = {2, 3},
    52			.cascade_map = {0x00FFFFFF, 0xff000000},
    53	};
    54	
  > 55	struct acpi_madt_lpc_pic pchlpc_default = {
    56		.address = LS7A_LPC_REG_BASE,
    57		.size = SZ_4K,
    58		.cascade = 19,
    59	};
    60	
  > 61	struct acpi_madt_eio_pic eiointc_default[MAX_IO_PICS];
  > 62	struct acpi_madt_msi_pic pchmsi_default[MAX_IO_PICS];
  > 63	struct acpi_madt_bio_pic pchpic_default[MAX_IO_PICS];
    64	
    65	static int
    66	acpi_parse_lapic(union acpi_subtable_headers *header, const unsigned long end)
    67	{
    68		struct acpi_madt_local_apic *processor = NULL;
    69	
    70		processor = (struct acpi_madt_local_apic *)header;
    71		if (BAD_MADT_ENTRY(processor, end))
    72			return -EINVAL;
    73	
    74		acpi_table_print_madt_entry(&header->common);
    75		set_processor_mask(processor->id, processor->lapic_flags);
    76	
    77		return 0;
    78	}
    79	
    80	static int bad_pch_pic(unsigned long address)
    81	{
    82		if (nr_io_pics >= MAX_IO_PICS) {
    83			pr_warn("WARNING: Max # of I/O PCH_PICs (%d) exceeded (found %d), skipping\n",
    84				MAX_IO_PICS, nr_io_pics);
    85			return 1;
    86		}
    87		if (!address) {
    88			pr_warn("WARNING: Bogus (zero) I/O PCH_PIC address found in table, skipping!\n");
    89			return 1;
    90		}
    91		return 0;
    92	}
    93	
  > 94	void register_default_pic(int id, u32 address, u32 irq_base)
    95	{
    96		int idx, entries;
    97		unsigned long addr;
    98	
    99		if (bad_pch_pic(address))
   100			return;
   101	
   102		idx = nr_io_pics;
   103	
   104		pchpic_default[idx].address = address;
   105		if (idx)
   106			pchpic_default[idx].address |= nid_to_addrbase(id) | HT1LO_OFFSET;
   107		pchpic_default[idx].id = id;
   108		pchpic_default[idx].version = 0;
   109		pchpic_default[idx].size = 0x1000;
   110		pchpic_default[idx].gsi_base = irq_base;
   111	
   112		msi_group[nr_io_pics].pci_segment = nr_io_pics;
   113		pch_group[nr_io_pics].node = msi_group[nr_io_pics].node = id;
   114	
   115		addr = pchpic_default[idx].address;
   116		/* Read INT_ID.int_num */
   117		entries = (((unsigned long)ls7a_readq(addr) >> 48) & 0xff) + 1;
   118		pchmsi_default[idx].msg_address = MSI_MSG_ADDRESS;
   119		pchmsi_default[idx].start = entries;
   120		pchmsi_default[idx].count = MSI_MSG_DEFAULT_COUNT;
   121	
   122		eiointc_default[idx].cascade = 3;
   123		eiointc_default[idx].node = id;
   124		eiointc_default[idx].node_map = 1;
   125	
   126		if (idx) {
   127			eiointc_default[idx].cascade = 0x4;
   128			eiointc_default[0].node_map = 0x1DF;
   129			eiointc_default[idx].node_map = 0xFE20;
   130		}
   131	
   132		acpi_pchpic[idx] = &pchpic_default[idx];
   133		acpi_pchmsi[idx] = &pchmsi_default[idx];
   134		acpi_eiointc[idx] = &eiointc_default[idx];
   135	
   136		nr_io_pics++;
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
