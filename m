Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA30A433A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 21:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264473; cv=none; b=Sxw1whe5O1+Bx+4YuaFXrAVZj+95dJpm2JC7sxI5Y39TynPaf2zxIxiu+/Ffqusb3XYP+UvxmIjU6dJbqrKJdnZv3rnAUHd3Mz0bGZJtcJsoC23xT+WdCeNvU7wwvTvvTqJuy5m5w9u1oMO1EkrAWp9BUtJCPm9y2H0opQPOdLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264473; c=relaxed/simple;
	bh=A39JtmcXQns0HPYBjBae3BBE7u++spvlpOF1IRn7DHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BhjjvpR/FXAWSJ8gnSeJ7SxeXwEyoRZb44ZiIZfmIala4CqNDSJHVw7yuyAdZ/RtGTvE72VV8RzudImlqOFTG78b0uex/CKIqEKUDC33RncoYS0zBvUA6XT8d2OOKAQNMGjfBjbV66aKWZ1yPunA+WuJO0NFYo11rFZCovXmQkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rc7e64Hg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rc7e64Hg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726264472; x=1757800472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A39JtmcXQns0HPYBjBae3BBE7u++spvlpOF1IRn7DHs=;
  b=Rc7e64HgSGx8x5zgiRS0N1xAqABrgkNATA7f1BG0ZZqpsrThc8JDuHvb
   khnxyjqdSIcxNgpCntlKENjW5Vn0r1ATrFP539Oyrpi+a8N4YQdh1JPIn
   3H9dfCTW5qcdogzygkSCXUmx3EUMY+49NlvvtA5rWG+wj7/yDdwTWWOCe
   1NJGZtreDSgwqSjYE8JOf6TRWpiuxik/yu16GwGIyQaQk2rmHUo3gf16Q
   kyWKPjYHLPXYfa4ye0tA0kN4nnJ6+nzBVDsnOYBejvTFm8MhrYWhO5P9Y
   lokGr+YtkeSEG9PjQSsHJ4ZqLLV+3vRUPT6Kc3tAs0cuKzD4EScxtFgP9
   w==;
X-CSE-ConnectionGUID: WZ2N3B1xTSa+zmW0dh+HAg==
X-CSE-MsgGUID: A6+8syJuQTeNb6zIvaf9+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28964268"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="28964268"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 14:54:30 -0700
X-CSE-ConnectionGUID: uU5pTHwaS9C9XxwAyRPGhA==
X-CSE-MsgGUID: SNLTsTxfQuWTqfek9TfXcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="105657718"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Sep 2024 14:54:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spEFF-00074g-25;
	Fri, 13 Sep 2024 21:54:25 +0000
Date: Sat, 14 Sep 2024 05:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 777/13930]
 arch/loongarch/kernel/legacy_boot.c:39:19: sparse: sparse: symbol
 'liointc_domain' was not declared. Should it be static?
Message-ID: <202409140536.RxJEdWyM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   13706c950ff941dc015e16f76812077f9861e378
commit: db5bb24abc8dd120fd81b7ce21819e96578d011e [777/13930] LoongArch: Old BPI compatibility
config: loongarch-randconfig-r133-20240913 (https://download.01.org/0day-ci/archive/20240914/202409140536.RxJEdWyM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240914/202409140536.RxJEdWyM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140536.RxJEdWyM-lkp@intel.com/

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
