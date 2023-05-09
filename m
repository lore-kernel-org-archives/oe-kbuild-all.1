Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3380A160
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 00:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683590749; x=1715126749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=odVEc5lgnK+ZbuKHkJ7qCNLHAqLFvOqYJOAVfAXTovc=;
  b=FpX0CkvW949eMBc4Qo1ZzDKe1KmLigWcBA/xbGiPOc1UlYGDvp7AZOsK
   x+c9+H3Ja9moTcalMwson1UUiqcElW04LEm/cJoFY9nrodvR+1dJP4N/T
   /d+5+dy7fTG03J4Dw3DX6SXnQLhMwO03aOt3bsEwH85EPlfnxyeh+tfIz
   QgDf41VW2VOmz5BIm1RB0W62TeevrQTNhNjlxUpAoZfyuAOp8TCXQb1ir
   DsIiV37TKJN6NXTW6T11HhfePXLdoUCsFTGeHTBcln5TCjd2nFKvYKweN
   65KnWQ+kQFfStXAUAmVML3mLW6NivKnfa4AZ+CG5QCFJeuWB6nHwndJ3f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="330137899"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="330137899"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 17:05:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="698691926"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="698691926"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 May 2023 17:05:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwArR-0001TD-1P;
	Tue, 09 May 2023 00:05:45 +0000
Date: Tue, 9 May 2023 08:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: Manisha Chinthapally <manisha.chinthapally@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Faycal Benmlih <faycal.benmlih@intel.com>
Subject: drivers/platform/x86/socperf/npk_uncore.c:292:39: sparse: sparse:
 cast removes address space '__iomem' of expression
Message-ID: <202305090720.IQ1sWNHV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_10
head:   c55df4a2b60fc7c6c4d00fd9f9fb447087833513
commit: 4a8adda8065c4c6944ffedd3025605c845c262a5 SEP/SOCWATCH resolve build errors after rebasing to linux v5.6-rc3
date:   2 years, 7 months ago
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/20230509/202305090720.IQ1sWNHV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/mchinth/linux/commit/4a8adda8065c4c6944ffedd3025605c845c262a5
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth sep_socwatch_linux_5_10
        git checkout 4a8adda8065c4c6944ffedd3025605c845c262a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/socperf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090720.IQ1sWNHV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/socperf/npk_uncore.c:292:39: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/platform/x86/socperf/npk_uncore.c:492:10: sparse: sparse: Initializer entry defined twice
   drivers/platform/x86/socperf/npk_uncore.c:496:10: sparse:   also defined here
--
>> drivers/platform/x86/socperf/haswellunc_sa.c:203:39: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/platform/x86/socperf/haswellunc_sa.c:395:10: sparse: sparse: Initializer entry defined twice
   drivers/platform/x86/socperf/haswellunc_sa.c:399:10: sparse:   also defined here
--
>> drivers/platform/x86/socperf/soc_uncore.c:756:47: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/platform/x86/socperf/soc_uncore.c:889:10: sparse: sparse: Initializer entry defined twice
   drivers/platform/x86/socperf/soc_uncore.c:893:10: sparse:   also defined here

vim +/__iomem +292 drivers/platform/x86/socperf/npk_uncore.c

   162	
   163	/*!
   164	 * @fn          static VOID uncore_Write_PMU(VOID*)
   165	 *
   166	 * @brief       Initial write of PMU registers
   167	 *              Walk through the entries and write the value of the register accordingly.
   168	 *              When current_group = 0, then this is the first time this routine is called,
   169	 *
   170	 * @param       param - device index
   171	 *
   172	 * @return      None
   173	 *
   174	 * <I>Special Notes:</I>
   175	 */
   176	static VOID uncore_Write_PMU(VOID *param)
   177	{
   178		U32 dev_idx = *((U32 *)param);
   179		ECB pecb;
   180		DRV_PCI_DEVICE_ENTRY dpden;
   181		U32 pci_address;
   182		U32 bar_lo;
   183		U64 bar_hi;
   184		U64 final_bar;
   185		U64 physical_address;
   186		U32 dev_index = 0;
   187		S32 bar_list[SOC_NPK_UNCORE_MAX_PCI_DEVICES];
   188		U32 bar_index = 0;
   189		U64 virtual_address = 0;
   190		U32 bar_name = 0;
   191		DRV_PCI_DEVICE_ENTRY curr_pci_entry = NULL;
   192		U32 next_bar_offset = 0;
   193		U64 mmio_offset = 0;
   194		U32 i = 0;
   195		U32 map_size = 0;
   196		U32 cur_grp;
   197	
   198		if (device_uncore == NULL) {
   199			SOCPERF_PRINT_ERROR("ERROR: NULL device_uncore!\n");
   200			return;
   201		}
   202		cur_grp = LWPMU_DEVICE_cur_group(device_uncore);
   203	
   204		pecb = (ECB)LWPMU_DEVICE_PMU_register_data(device_uncore)[cur_grp];
   205		if (pecb == NULL) {
   206			SOCPERF_PRINT_ERROR("ERROR: null pecb!\n");
   207			return;
   208		}
   209	
   210		for (dev_index = 0; dev_index < SOC_NPK_UNCORE_MAX_PCI_DEVICES;
   211		     dev_index++) {
   212			bar_list[dev_index] = -1;
   213		}
   214	
   215		// initialize the per-counter overflow numbers
   216		for (i = 0; i < SOC_NPK_COUNTER_MAX_COUNTERS; i++) {
   217			counter_overflow[i] = 0;
   218			socperf_pcb[0].last_uncore_count[i] = 0;
   219		}
   220	
   221		ECB_pcidev_entry_list(pecb) = (DRV_PCI_DEVICE_ENTRY)(
   222			(S8 *)pecb + ECB_pcidev_list_offset(pecb));
   223		dpden = ECB_pcidev_entry_list(pecb);
   224	
   225		uncore_Reset_Counters(dev_idx);
   226	
   227		SOCPERF_PRINT_DEBUG(
   228			"Inside VISA Driver Write PMU: Number of entries=%d\n",
   229			ECB_num_pci_devices(pecb));
   230		for (dev_index = 0; dev_index < ECB_num_pci_devices(pecb);
   231		     dev_index++) {
   232			curr_pci_entry = &dpden[dev_index];
   233			bar_name = DRV_PCI_DEVICE_ENTRY_bar_name(curr_pci_entry);
   234			mmio_offset = DRV_PCI_DEVICE_ENTRY_base_offset_for_mmio(
   235				curr_pci_entry);
   236	
   237			// UNC_MMIO programming
   238			if (bar_list[bar_name] != -1) {
   239				bar_index = bar_list[bar_name];
   240				virtual_address = DRV_PCI_DEVICE_ENTRY_virtual_address(
   241					&dpden[bar_index]);
   242				DRV_PCI_DEVICE_ENTRY_virtual_address(curr_pci_entry) =
   243					DRV_PCI_DEVICE_ENTRY_virtual_address(
   244						&dpden[bar_index]);
   245				write_To_Register(virtual_address, mmio_offset,
   246						  (U32)DRV_PCI_DEVICE_ENTRY_value(
   247							  curr_pci_entry));
   248				continue;
   249			}
   250	
   251			pci_address = FORM_PCI_ADDR(
   252				DRV_PCI_DEVICE_ENTRY_bus_no(curr_pci_entry),
   253				DRV_PCI_DEVICE_ENTRY_dev_no(curr_pci_entry),
   254				DRV_PCI_DEVICE_ENTRY_func_no(curr_pci_entry),
   255				DRV_PCI_DEVICE_ENTRY_bar_offset(curr_pci_entry));
   256			bar_lo = SOCPERF_PCI_Read_Ulong(pci_address);
   257			SOCPERF_PRINT_DEBUG(
   258				"The bus=%x device=%x function=%x offset=%x\n",
   259				DRV_PCI_DEVICE_ENTRY_bus_no(curr_pci_entry),
   260				DRV_PCI_DEVICE_ENTRY_dev_no(curr_pci_entry),
   261				DRV_PCI_DEVICE_ENTRY_func_no(curr_pci_entry),
   262				DRV_PCI_DEVICE_ENTRY_bar_offset(curr_pci_entry));
   263			next_bar_offset =
   264				DRV_PCI_DEVICE_ENTRY_bar_offset(curr_pci_entry) +
   265				SOC_NPK_UNCORE_NEXT_ADDR_OFFSET;
   266			pci_address = FORM_PCI_ADDR(
   267				DRV_PCI_DEVICE_ENTRY_bus_no(curr_pci_entry),
   268				DRV_PCI_DEVICE_ENTRY_dev_no(curr_pci_entry),
   269				DRV_PCI_DEVICE_ENTRY_func_no(curr_pci_entry),
   270				next_bar_offset);
   271			bar_hi = SOCPERF_PCI_Read_Ulong(pci_address);
   272			SOCPERF_PRINT_DEBUG(
   273				"The bus=%x device=%x function=%x offset=%x\n",
   274				DRV_PCI_DEVICE_ENTRY_bus_no(curr_pci_entry),
   275				DRV_PCI_DEVICE_ENTRY_dev_no(curr_pci_entry),
   276				DRV_PCI_DEVICE_ENTRY_func_no(curr_pci_entry),
   277				next_bar_offset);
   278			final_bar = (bar_hi << SOC_NPK_UNCORE_BAR_ADDR_SHIFT) | bar_lo;
   279			if (bar_name == UNC_MCHBAR) {
   280				final_bar &= SOC_NPK_UNCORE_MCHBAR_ADDR_MASK;
   281				map_size = SOC_NPK_UNCORE_MCHBAR_MMIO_PAGE_SIZE;
   282			} else {
   283				final_bar &= SOC_NPK_UNCORE_BAR_ADDR_MASK;
   284				map_size = SOC_NPK_UNCORE_NPK_BAR_MMIO_PAGE_SIZE;
   285			}
   286			DRV_PCI_DEVICE_ENTRY_bar_address(curr_pci_entry) = final_bar;
   287			physical_address =
   288				DRV_PCI_DEVICE_ENTRY_bar_address(curr_pci_entry);
   289	
   290			if (physical_address) {
   291				DRV_PCI_DEVICE_ENTRY_virtual_address(curr_pci_entry) =
 > 292					(U64)(UIOP)ioremap_cache(physical_address,
   293								   map_size);
   294				virtual_address = DRV_PCI_DEVICE_ENTRY_virtual_address(
   295					curr_pci_entry);
   296	
   297				if (virtual_address) {
   298					write_To_Register(virtual_address, mmio_offset,
   299						  (U32)DRV_PCI_DEVICE_ENTRY_value(
   300							  curr_pci_entry));
   301					bar_list[bar_name] = dev_index;
   302					if (counter_virtual_address == 0) {
   303						counter_virtual_address = virtual_address;
   304					}
   305					if (mchbar_virtual_address == 0 &&
   306					    bar_name == UNC_MCHBAR) {
   307						mchbar_virtual_address = virtual_address;
   308						mchbar_offset = mmio_offset;
   309					}
   310				}
   311			}
   312		}
   313	}
   314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
