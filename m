Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F005CB9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683532408; x=1715068408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aOXoJ4cKU/qojok95uRGjDX2DkMC1Y2T/d9vYGQiCSw=;
  b=I/xY/39Elsr7L2nXzRSYRZc2g9F2LVckabotQBIOobml8h5N56bjaXC1
   ejAxYa5aOLzs7Hk5R/KABdW4qOBCyo3voG6YNKG54mdLlEn5OQQDAnftx
   cXdHDFbbQs+hBgw8wjNzqzvNzC7D7/p2pvWd4AckbuC8+F+teadiTidXU
   j5djH4nc0TPGcpjMTG1OhOyTv91jMLhFVmeyrX4RVy5HMzqsnKu+dobIU
   BcKrK12XN8v0QGWME0mWGCmE9HyovsS1mAEEwbg6HsDRAZWyNhVXunj1V
   VQqMhhGvYQSkaySpeTkppqtZIh7quzH+8U+p5+orES16a7cQjzo2Z1o6e
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="349615657"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="349615657"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 00:53:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="1028328730"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="1028328730"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 May 2023 00:53:26 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvvgT-00017n-2D;
	Mon, 08 May 2023 07:53:25 +0000
Date: Mon, 8 May 2023 15:52:42 +0800
From: kernel test robot <lkp@intel.com>
To: Manisha Chinthapally <manisha.chinthapally@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mchinth:sep_socwatch_linux_5_16 1/1]
 drivers/platform/x86/socperf/pci.c:76:12: sparse: sparse: function
 'SOCPERF_PCI_Read_From_Memory_Address' with external linkage has definition
Message-ID: <202305081542.hcD7iEbs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_16
head:   4cbfca15a262729ae8557758b49226fe4769f582
commit: 4cbfca15a262729ae8557758b49226fe4769f582 [1/1] Platform/x86 Updated SEP/SOCPERF drivers to latest version
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230508/202305081542.hcD7iEbs-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/mchinth/linux/commit/4cbfca15a262729ae8557758b49226fe4769f582
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth sep_socwatch_linux_5_16
        git checkout 4cbfca15a262729ae8557758b49226fe4769f582
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/socperf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305081542.hcD7iEbs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/socperf/pci.c:76:12: sparse: sparse: function 'SOCPERF_PCI_Read_From_Memory_Address' with external linkage has definition
>> drivers/platform/x86/socperf/pci.c:122:12: sparse: sparse: function 'SOCPERF_PCI_Write_To_Memory_Address' with external linkage has definition
>> drivers/platform/x86/socperf/pci.c:163:12: sparse: sparse: function 'SOCPERF_PCI_Read_Ulong' with external linkage has definition
>> drivers/platform/x86/socperf/pci.c:185:13: sparse: sparse: function 'SOCPERF_PCI_Write_Ulong' with external linkage has definition
>> drivers/platform/x86/socperf/pci.c:94:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[usertype] base @@     got void [noderef] __iomem * @@
   drivers/platform/x86/socperf/pci.c:94:14: sparse:     expected void *[usertype] base
   drivers/platform/x86/socperf/pci.c:94:14: sparse:     got void [noderef] __iomem *
>> drivers/platform/x86/socperf/pci.c:99:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/platform/x86/socperf/pci.c:99:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/pci.c:99:28: sparse:     got void *
>> drivers/platform/x86/socperf/pci.c:105:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[usertype] base @@
   drivers/platform/x86/socperf/pci.c:105:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/pci.c:105:17: sparse:     got void *[usertype] base
   drivers/platform/x86/socperf/pci.c:140:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[usertype] base @@     got void [noderef] __iomem * @@
   drivers/platform/x86/socperf/pci.c:140:14: sparse:     expected void *[usertype] base
   drivers/platform/x86/socperf/pci.c:140:14: sparse:     got void [noderef] __iomem *
>> drivers/platform/x86/socperf/pci.c:145:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/platform/x86/socperf/pci.c:145:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/pci.c:145:26: sparse:     got void *
   drivers/platform/x86/socperf/pci.c:147:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[usertype] base @@
   drivers/platform/x86/socperf/pci.c:147:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/pci.c:147:17: sparse:     got void *[usertype] base
--
>> drivers/platform/x86/socperf/haswellunc_sa.c:127:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/platform/x86/socperf/haswellunc_sa.c:127:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/haswellunc_sa.c:127:33: sparse:     got unsigned int [usertype] *
   drivers/platform/x86/socperf/haswellunc_sa.c:160:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/platform/x86/socperf/haswellunc_sa.c:160:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/haswellunc_sa.c:160:33: sparse:     got unsigned int [usertype] *
>> drivers/platform/x86/socperf/haswellunc_sa.c:209:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/platform/x86/socperf/haswellunc_sa.c:209:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/haswellunc_sa.c:209:42: sparse:     got unsigned int [usertype] *
   drivers/platform/x86/socperf/haswellunc_sa.c:212:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/platform/x86/socperf/haswellunc_sa.c:212:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/haswellunc_sa.c:212:42: sparse:     got unsigned int [usertype] *
   drivers/platform/x86/socperf/haswellunc_sa.c:220:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/platform/x86/socperf/haswellunc_sa.c:220:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/haswellunc_sa.c:220:33: sparse:     got unsigned int [usertype] *
   drivers/platform/x86/socperf/haswellunc_sa.c:257:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/platform/x86/socperf/haswellunc_sa.c:257:41: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/haswellunc_sa.c:257:41: sparse:     got unsigned int [usertype] *
>> drivers/platform/x86/socperf/haswellunc_sa.c:271:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/platform/x86/socperf/haswellunc_sa.c:271:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/haswellunc_sa.c:271:42: sparse:     got void *
   drivers/platform/x86/socperf/haswellunc_sa.c:363:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/platform/x86/socperf/haswellunc_sa.c:363:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/haswellunc_sa.c:363:33: sparse:     got unsigned int [usertype] *
   drivers/platform/x86/socperf/haswellunc_sa.c:367:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/platform/x86/socperf/haswellunc_sa.c:367:33: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/haswellunc_sa.c:367:33: sparse:     got unsigned int [usertype] *
--
>> drivers/platform/x86/socperf/control.c:99:13: sparse: sparse: function 'SOCPERF_Invoke_Cpu' with external linkage has definition
>> drivers/platform/x86/socperf/control.c:127:13: sparse: sparse: function 'SOCPERF_Invoke_Parallel_Service' with external linkage has definition
>> drivers/platform/x86/socperf/control.c:356:13: sparse: sparse: function 'SOCPERF_Memory_Tracker_Init' with external linkage has definition
>> drivers/platform/x86/socperf/control.c:382:13: sparse: sparse: function 'SOCPERF_Memory_Tracker_Free' with external linkage has definition
>> drivers/platform/x86/socperf/control.c:443:13: sparse: sparse: function 'SOCPERF_Memory_Tracker_Compaction' with external linkage has definition
>> drivers/platform/x86/socperf/control.c:582:14: sparse: sparse: function 'SOCPERF_Allocate_Memory' with external linkage has definition
>> drivers/platform/x86/socperf/control.c:646:14: sparse: sparse: function 'SOCPERF_Allocate_KMemory' with external linkage has definition
>> drivers/platform/x86/socperf/control.c:704:14: sparse: sparse: function 'SOCPERF_Free_Memory' with external linkage has definition
--
>> drivers/platform/x86/socperf/soc_uncore.c:422:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/platform/x86/socperf/soc_uncore.c:422:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/soc_uncore.c:422:33: sparse:     got unsigned int [usertype] *
>> drivers/platform/x86/socperf/soc_uncore.c:593:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/platform/x86/socperf/soc_uncore.c:593:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/soc_uncore.c:593:26: sparse:     got void *
>> drivers/platform/x86/socperf/soc_uncore.c:890:79: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/platform/x86/socperf/soc_uncore.c:890:79: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/soc_uncore.c:890:79: sparse:     got unsigned long long [usertype] *
--
>> drivers/platform/x86/socperf/npk_uncore.c:92:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/platform/x86/socperf/npk_uncore.c:92:36: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/npk_uncore.c:92:36: sparse:     got unsigned int [usertype] *
>> drivers/platform/x86/socperf/npk_uncore.c:119:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/platform/x86/socperf/npk_uncore.c:119:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/npk_uncore.c:119:17: sparse:     got unsigned int [usertype] *
>> drivers/platform/x86/socperf/npk_uncore.c:340:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/platform/x86/socperf/npk_uncore.c:340:34: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/npk_uncore.c:340:34: sparse:     got void *
   drivers/platform/x86/socperf/npk_uncore.c:345:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/platform/x86/socperf/npk_uncore.c:345:34: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socperf/npk_uncore.c:345:34: sparse:     got void *
--
>> drivers/platform/x86/socperf/pmu_list.c:246:17: sparse: sparse: function 'PMU_LIST_Check_MMIO' with external linkage has definition
>> drivers/platform/x86/socperf/pmu_list.c:303:18: sparse: sparse: function 'PMU_LIST_Initialize' with external linkage has definition
>> drivers/platform/x86/socperf/pmu_list.c:327:18: sparse: sparse: function 'PMU_LIST_Build_MMIO_List' with external linkage has definition
>> drivers/platform/x86/socperf/pmu_list.c:380:18: sparse: sparse: function 'PMU_LIST_Clean_Up' with external linkage has definition
--
>> drivers/platform/x86/socperf/utility.c:75:13: sparse: sparse: function 'SOCPERF_UTILITY_Read_TSC' with external linkage has definition
>> drivers/platform/x86/socperf/utility.c:104:13: sparse: sparse: function 'SOCPERF_UTILITY_Read_Cpuid' with external linkage has definition
>> drivers/platform/x86/socperf/utility.c:136:17: sparse: sparse: function 'SOCPERF_UTILITY_Configure_CPU' with external linkage has definition

vim +/SOCPERF_PCI_Read_From_Memory_Address +76 drivers/platform/x86/socperf/pci.c

    63	
    64	/* ------------------------------------------------------------------------- */
    65	/*!
    66	 * @fn extern int SOCPERF_PCI_Read_From_Memory_Address(addr, val)
    67	 *
    68	 * @param    addr    - physical address in mmio
    69	 * @param   *value  - value at this address
    70	 *
    71	 * @return  status
    72	 *
    73	 * @brief   Read memory mapped i/o physical location
    74	 *
    75	 */
  > 76	extern int SOCPERF_PCI_Read_From_Memory_Address(U32 addr, U32 *val)
    77	{
    78		U32 aligned_addr, offset, value;
    79		PVOID base;
    80	
    81		if (addr <= 0) {
    82			return OS_INVALID;
    83		}
    84	
    85		SOCPERF_PRINT_DEBUG(
    86			"SOCPERF_PCI_Read_From_Memory_Address: reading physical address:%x\n",
    87			addr);
    88		offset = addr & ~PAGE_MASK;
    89		aligned_addr = addr & PAGE_MASK;
    90		SOCPERF_PRINT_DEBUG(
    91			"SOCPERF_PCI_Read_From_Memory_Address: aligned physical address:%x,offset:%x\n",
    92			aligned_addr, offset);
    93	
  > 94		base = ioremap(aligned_addr, PAGE_SIZE);
    95		if (base == NULL) {
    96			return OS_INVALID;
    97		}
    98	
  > 99		value = readl(base + offset);
   100		*val = value;
   101		SOCPERF_PRINT_DEBUG(
   102			"SOCPERF_PCI_Read_From_Memory_Address: value at this physical address:%x\n",
   103			value);
   104	
 > 105		iounmap(base);
   106	
   107		return OS_SUCCESS;
   108	}
   109	
   110	/* ------------------------------------------------------------------------- */
   111	/*!
   112	 * @fn extern int SOCPERF_PCI_Write_To_Memory_Address(addr, val)
   113	 *
   114	 * @param   addr   - physical address in mmio
   115	 * @param   value  - value to be written
   116	 *
   117	 * @return  status
   118	 *
   119	 * @brief   Write to memory mapped i/o physical location
   120	 *
   121	 */
 > 122	extern int SOCPERF_PCI_Write_To_Memory_Address(U32 addr, U32 val)
   123	{
   124		U32 aligned_addr, offset;
   125		PVOID base;
   126	
   127		if (addr <= 0) {
   128			return OS_INVALID;
   129		}
   130	
   131		SOCPERF_PRINT_DEBUG(
   132			"SOCPERF_PCI_Write_To_Memory_Address: writing physical address:%x with value:%x\n",
   133			addr, val);
   134		offset = addr & ~PAGE_MASK;
   135		aligned_addr = addr & PAGE_MASK;
   136		SOCPERF_PRINT_DEBUG(
   137			"SOCPERF_PCI_Write_To_Memory_Address: aligned physical address:%x,offset:%x\n",
   138			aligned_addr, offset);
   139	
   140		base = ioremap(aligned_addr, PAGE_SIZE);
   141		if (base == NULL) {
   142			return OS_INVALID;
   143		}
   144	
 > 145		writel(val, base + offset);
   146	
   147		iounmap(base);
   148	
   149		return OS_SUCCESS;
   150	}
   151	
   152	/* ------------------------------------------------------------------------- */
   153	/*!
   154	 * @fn extern int SOCPERF_PCI_Read_Ulong(pci_address)
   155	 *
   156	 * @param    pci_address - PCI configuration address
   157	 *
   158	 * @return  value at this location
   159	 *
   160	 * @brief   Reads a ULONG from PCI configuration space
   161	 *
   162	 */
 > 163	extern int SOCPERF_PCI_Read_Ulong(U32 pci_address)
   164	{
   165		U32 temp_ulong = 0;
   166	
   167		outl(pci_address, PCI_ADDR_IO);
   168		temp_ulong = inl(PCI_DATA_IO);
   169	
   170		return temp_ulong;
   171	}
   172	
   173	/* ------------------------------------------------------------------------- */
   174	/*!
   175	 * @fn extern int SOCPERF_PCI_Write_Ulong(addr, val)
   176	 *
   177	 * @param    pci_address - PCI configuration address
   178	 * @param    value - Value to be written
   179	 *
   180	 * @return  status
   181	 *
   182	 * @brief   Writes a ULONG to PCI configuration space
   183	 *
   184	 */
 > 185	extern void SOCPERF_PCI_Write_Ulong(U32 pci_address, U32 value)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
