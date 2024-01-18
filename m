Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AEAB641
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 03:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705550200; cv=none; b=U/QIgS1gLBB5Jq/c1M5JSJBsNyEi1b77UIzsVSIoI1hKkER7/85KTYLPYxeOwPA/NzJuc2L1VUYMreOKM3Y22DO0pQvuTjdXv/DxPY49TKUCM9W22kd2EzRaZpHi+W9Gn5cNbTXyX7mHJ1HiRi5z6T+CLatHH1gPsgPQKffeYO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705550200; c=relaxed/simple;
	bh=vMC8kZhs1eReUu9e3RgPumeLuDn+xK1XYpL3wosPi+U=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=Qf+hhRvMeVQC1Bi4MLomAMvpcgZ5Az8JitWjeHTsa2cLDjsjD2kRisJ3tnXYTsVa85gfayYVxKTdyvhxFmFLttashv5r0t1fAkzmmZgf/fJk4hvxgBafBEYNKHmu90ioxJhPPkMqmH6jgohdujKFGfW7iJRtiEpLRrDdEDIhugk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHpQnfVi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHpQnfVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705550198; x=1737086198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vMC8kZhs1eReUu9e3RgPumeLuDn+xK1XYpL3wosPi+U=;
  b=QHpQnfViFsaqu53A0zUCjeETfmhDBPvB7qrr16lNV+H16Nv3uA+SzI7V
   BoCtAb1j7vTa1EF8KJC+FEUpBLssXaZLtN2MpCsSJYX0uRKwcKsFeDl8L
   gjtQcke7SaHnwMk1sqXUckw7nfL+TJjoPh5QAoaZBnAVH7jGhQlx0BgtF
   3uEPiHvWAG3rLnga+IBhsqMu5av/3T+wSTTjVOfN8TquqRYkO226VebOk
   2GFi1P7vi5Rxy58iv4zEgM0/c5FK4ecYQbDI5pMHyajQNX8zLmdYor//K
   GCsK7O2Q4jubn7qr43F7aQKcUcjv4QfOGTdYtD0RfrcQnTvTLUeEkiqYo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="246180"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="246180"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 19:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="854874623"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="854874623"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jan 2024 19:56:35 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQJW4-0002bG-2p;
	Thu, 18 Jan 2024 03:56:32 +0000
Date: Thu, 18 Jan 2024 11:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 777/2428]
 arch/loongarch/kernel/legacy_boot.c:106:48: error: implicit declaration of
 function 'nid_to_addrbase'
Message-ID: <202401181124.lY3ISI6l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   806899e400eae3c5730b4729944dc0b1bb565e47
commit: db5bb24abc8dd120fd81b7ce21819e96578d011e [777/2428] LoongArch: Old BPI compatibility
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20240118/202401181124.lY3ISI6l-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401181124.lY3ISI6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401181124.lY3ISI6l-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/mem.c:12:
>> arch/loongarch/kernel/legacy_boot.h:81:43: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
      81 | extern int __init cpuintc_acpi_init(union acpi_subtable_headers *header,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/legacy_boot.h:84:26: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
      84 | pch_pic_parse_madt(union acpi_subtable_headers *header,
         |                          ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/legacy_boot.h:87:26: warning: 'union acpi_subtable_headers' declared inside parameter list will not be visible outside of this definition or declaration
      87 | pch_msi_parse_madt(union acpi_subtable_headers *header,
         |                          ^~~~~~~~~~~~~~~~~~~~~
--
>> arch/loongarch/kernel/legacy_boot.c:94:6: warning: no previous prototype for 'register_default_pic' [-Wmissing-prototypes]
      94 | void register_default_pic(int id, u32 address, u32 irq_base)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/legacy_boot.c: In function 'register_default_pic':
>> arch/loongarch/kernel/legacy_boot.c:106:48: error: implicit declaration of function 'nid_to_addrbase' [-Werror=implicit-function-declaration]
     106 |                 pchpic_default[idx].address |= nid_to_addrbase(id) | HT1LO_OFFSET;
         |                                                ^~~~~~~~~~~~~~~
   arch/loongarch/kernel/legacy_boot.c: At top level:
>> arch/loongarch/kernel/legacy_boot.c:242:13: warning: no previous prototype for 'fw_init_cmdline' [-Wmissing-prototypes]
     242 | __init void fw_init_cmdline(unsigned long argc, unsigned long cmdp)
         |             ^~~~~~~~~~~~~~~
>> arch/loongarch/kernel/legacy_boot.c:341:14: warning: no previous prototype for 'bpi_init' [-Wmissing-prototypes]
     341 | unsigned int bpi_init(void)
         |              ^~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/irqchip/irq-loongarch-cpu.c:144:20: warning: no previous prototype for 'get_cpudomain' [-Wmissing-prototypes]
     144 | struct irq_domain *get_cpudomain(void)
         |                    ^~~~~~~~~~~~~
>> drivers/irqchip/irq-loongarch-cpu.c:149:12: warning: no previous prototype for 'cpuintc_acpi_init' [-Wmissing-prototypes]
     149 | int __init cpuintc_acpi_init(union acpi_subtable_headers *header,
         |            ^~~~~~~~~~~~~~~~~
--
>> drivers/irqchip/irq-loongson-eiointc.c:331:12: warning: no previous prototype for 'pch_pic_parse_madt' [-Wmissing-prototypes]
     331 | int __init pch_pic_parse_madt(union acpi_subtable_headers *header,
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-loongson-eiointc.c:344:12: warning: no previous prototype for 'pch_msi_parse_madt' [-Wmissing-prototypes]
     344 | int __init pch_msi_parse_madt(union acpi_subtable_headers *header,
         |            ^~~~~~~~~~~~~~~~~~
--
>> drivers/irqchip/irq-loongson-pch-pic.c:55:20: warning: no previous prototype for 'get_pchpic_irq_domain' [-Wmissing-prototypes]
      55 | struct irq_domain *get_pchpic_irq_domain(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~


vim +/nid_to_addrbase +106 arch/loongarch/kernel/legacy_boot.c

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
 > 106			pchpic_default[idx].address |= nid_to_addrbase(id) | HT1LO_OFFSET;
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
   139	static int
   140	acpi_parse_legacy_pch_pic(union acpi_subtable_headers *header, const unsigned long end)
   141	{
   142		struct acpi_madt_io_apic *pch_pic = NULL;
   143	
   144		pch_pic = (struct acpi_madt_io_apic *)header;
   145	
   146		if (BAD_MADT_ENTRY(pch_pic, end))
   147			return -EINVAL;
   148	
   149		acpi_table_print_madt_entry(&header->common);
   150	
   151		register_default_pic(pch_pic->id, pch_pic->address,
   152				pch_pic->global_irq_base);
   153	
   154		return 0;
   155	}
   156	
   157	__init int legacy_madt_table_init(void)
   158	{
   159		/* Parse MADT LAPIC entries */
   160		acpi_table_parse_madt(ACPI_MADT_TYPE_LOCAL_APIC, acpi_parse_lapic, MAX_CORE_PIC);
   161		acpi_table_parse_madt(ACPI_MADT_TYPE_IO_APIC, acpi_parse_legacy_pch_pic, MAX_IO_PICS);
   162	
   163		acpi_liointc = &liointc_default;
   164		acpi_pchlpc = &pchlpc_default;
   165	
   166		return 0;
   167	}
   168	
   169	int setup_legacy_IRQ(void)
   170	{
   171		int i, ret;
   172		struct irq_domain *pic_domain;
   173	
   174		if (!acpi_eiointc[0])
   175			cpu_data[0].options &= ~LOONGARCH_CPU_EXTIOI;
   176	
   177		ret = cpuintc_acpi_init(NULL, 0);
   178		if (ret) {
   179			pr_err("CPU domain init error!\n");
   180			return -1;
   181		}
   182		cpu_domain = get_cpudomain();
   183		ret = liointc_acpi_init(cpu_domain, acpi_liointc);
   184		if (ret) {
   185			pr_err("Liointc domain init error!\n");
   186			return -1;
   187		}
   188		liointc_domain = irq_find_matching_fwnode(liointc_handle, DOMAIN_BUS_ANY);
   189		if (cpu_has_extioi) {
   190			pr_info("Using EIOINTC interrupt mode\n");
   191			for (i = 0; i < nr_io_pics; i++) {
   192				ret = eiointc_acpi_init(cpu_domain, acpi_eiointc[i]);
   193				if (ret) {
   194					pr_err("Eiointc domain init error!\n");
   195					return -1;
   196				}
   197	
   198				pch_pic_parse_madt((union acpi_subtable_headers *)acpi_pchpic[i], 0);
   199				pch_msi_parse_madt((union acpi_subtable_headers *)acpi_pchmsi[i], 0);
   200			}
   201		/* HTVECINTC maybe not use */
   202		} else {
   203			pr_info("Using HTVECINTC interrupt mode\n");
   204			ret = htvec_acpi_init(liointc_domain, acpi_htintc);
   205			if (ret) {
   206				pr_err("HTVECintc domain init error!\n");
   207				return -1;
   208			}
   209			pch_pic_parse_madt((union acpi_subtable_headers *)acpi_pchpic[0], 0);
   210			pch_msi_parse_madt((union acpi_subtable_headers *)acpi_pchmsi[0], 0);
   211		}
   212	
   213		pic_domain = get_pchpic_irq_domain();
   214		if (pic_domain)
   215			pch_lpc_acpi_init(pic_domain, acpi_pchlpc);
   216	
   217		return 0;
   218	}
   219	
   220	/*
   221	 * Manage initrd
   222	 */
   223	#ifdef CONFIG_BLK_DEV_INITRD
   224	static __init int rd_start_early(char *p)
   225	{
   226		phys_initrd_start = __pa(memparse(p, NULL));
   227	
   228		return 0;
   229	}
   230	early_param("rd_start", rd_start_early);
   231	
   232	static __init int rd_size_early(char *p)
   233	{
   234		phys_initrd_size = memparse(p, NULL);
   235	
   236		return 0;
   237	}
   238	early_param("rd_size", rd_size_early);
   239	
   240	#endif
   241	
 > 242	__init void fw_init_cmdline(unsigned long argc, unsigned long cmdp)
   243	{
   244		int i;
   245		char **_fw_argv;
   246	
   247		_fw_argv = (char **)cmdp;
   248	
   249		arcs_cmdline[0] = '\0';
   250		for (i = 1; i < argc; i++) {
   251			strlcat(arcs_cmdline, _fw_argv[i], COMMAND_LINE_SIZE);
   252			if (i < (argc - 1))
   253				strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
   254		}
   255		strscpy(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
   256	}
   257	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
