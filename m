Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CABB1C26
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Aug 2023 06:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691302446; x=1722838446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gF3fqUudaj28p9fOfuZiquNNPMtEEcCBr5jGNlfnbxs=;
  b=VM1bVyvZZ37YapCTBmE7kw9HusdBLVrMY3VnvfX89y6gOu9mvAfZx0wS
   6Wj9Qhe9liH6te8OacFGOjNqMlnTxSi1cvzDzUeHchgHFPHQF4bYObXYe
   IUC8DUFu9iijce/P98agxnPGXV44DSK5xge/fxG6VT3FJ088ezG+3Mn+S
   JGmsUDz6FRBFfiwBHHFHi5QgIgR8FkFroAhASbEGOotPZVnrroicMljGX
   mxYHKMMbNBtWSQiWr/yDslL6Bv5cvNN1cY9BKEhKMQBvCUK4kEr0qVR+u
   LnRDz5qXsk5bFVmt17PdGTLKpZEpJXvk2q/CeJMU74wKnJ2JXma0cj3g0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="373110082"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="373110082"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 23:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="724136143"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="724136143"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Aug 2023 23:14:04 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSX1f-00044t-0z;
	Sun, 06 Aug 2023 06:14:03 +0000
Date: Sun, 6 Aug 2023 14:13:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v1 87/91]
 drivers/acpi/riscv/irqchip.c:303:13: warning: no previous prototype for
 'riscv_acpi_aplic_platform_init'
Message-ID: <202308061457.W6TiLH02-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v1
head:   b09364548457cec51680b8f8b1a5e917b5e74cf5
commit: 1e43843fbed95aec33a929dab9e89204171ce94d [87/91] ACPI: RISC-V: Create APLIC platform device
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230806/202308061457.W6TiLH02-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308061457.W6TiLH02-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308061457.W6TiLH02-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/riscv/irqchip.c:110:13: warning: no previous prototype for 'riscv_acpi_imsic_platform_init' [-Wmissing-prototypes]
     110 | void __init riscv_acpi_imsic_platform_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/acpi/riscv/irqchip.c:303:13: warning: no previous prototype for 'riscv_acpi_aplic_platform_init' [-Wmissing-prototypes]
     303 | void __init riscv_acpi_aplic_platform_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/riscv_acpi_aplic_platform_init +303 drivers/acpi/riscv/irqchip.c

   109	
 > 110	void __init riscv_acpi_imsic_platform_init(void)
   111	{
   112		struct platform_device *pdev;
   113		int ret;
   114	
   115		if (!acpi_riscv_get_msi_fwnode(NULL)) {
   116			pci_no_msi();
   117			return;
   118		}
   119	
   120		pdev = platform_device_alloc("riscv-imsic", 0);
   121		if (!pdev)
   122			return;
   123	
   124		pdev->dev.fwnode = acpi_riscv_get_msi_fwnode(NULL);
   125		ret = platform_device_add(pdev);
   126		if (ret)
   127			platform_device_put(pdev);
   128	}
   129	
   130	/*
   131	 * The ext_intc_id format is as follows:
   132	 * Bits [31:24] APLIC/PLIC ID
   133	 * Bits [15:0] APLIC IDC ID / PLIC S-Mode Context ID for this hart
   134	 */
   135	#define APLIC_PLIC_ID(x) ((x) >> 24)
   136	#define IDC_CONTEXT_ID(x) ((x) & 0x0000ffff)
   137	
   138	static struct fwnode_handle *acpi_ext_intc_get_rintc_fwnode(u8 aplic_plic_id, u16 index)
   139	{
   140		struct riscv_irqchip_list *rintc_element;
   141		struct fwnode_handle *fwnode;
   142		struct list_head *i, *tmp;
   143		u32 id;
   144		int rc;
   145	
   146		list_for_each_safe(i, tmp, &rintc_list) {
   147			rintc_element = list_entry(i, struct riscv_irqchip_list, list);
   148			fwnode = rintc_element->fwnode;
   149			rc = fwnode_property_read_u32_array(fwnode, "riscv,ext-intc-id", &id, 1);
   150			if (rc)
   151				continue;
   152	
   153			if ((APLIC_PLIC_ID(id) == aplic_plic_id) && (IDC_CONTEXT_ID(id) == index))
   154				return fwnode;
   155		}
   156	
   157		return NULL;
   158	}
   159	
   160	static struct fwnode_handle *acpi_aplic_create_fwnode(struct acpi_madt_aplic *aplic)
   161	{
   162		struct fwnode_handle *fwnode, *parent_fwnode;
   163		struct riscv_irqchip_list *aplic_element;
   164		struct software_node_ref_args *refs;
   165		struct property_entry props[8] = {};
   166		unsigned int i;
   167	
   168		props[0] = PROPERTY_ENTRY_U32("riscv,gsi-base", aplic->gsi_base);
   169		props[1] = PROPERTY_ENTRY_U32("riscv,num-sources", aplic->num_sources);
   170		props[2] = PROPERTY_ENTRY_U32("riscv,num-idcs", aplic->num_idcs);
   171		props[3] = PROPERTY_ENTRY_U32("riscv,aplic-id", aplic->id);
   172		props[4] = PROPERTY_ENTRY_U64("riscv,aplic-base", aplic->base_addr);
   173		props[5] = PROPERTY_ENTRY_U32("riscv,aplic-size", aplic->size);
   174		if (aplic->num_idcs) {
   175			refs = kcalloc(aplic->num_idcs, sizeof(*refs), GFP_KERNEL);
   176			if (!refs)
   177				return NULL;
   178	
   179			for (i = 0; i < aplic->num_idcs; i++) {
   180				parent_fwnode = acpi_ext_intc_get_rintc_fwnode(aplic->id, i);
   181				refs[i] = SOFTWARE_NODE_REFERENCE(to_software_node(parent_fwnode),
   182								  RV_IRQ_EXT);
   183			}
   184			props[6] = PROPERTY_ENTRY_REF_ARRAY_LEN("interrupts-extended",
   185								refs, aplic->num_idcs);
   186		} else {
   187			props[6] = PROPERTY_ENTRY_BOOL("msi-parent");
   188		}
   189	
   190		fwnode = fwnode_create_software_node_early(props, NULL);
   191	
   192		if (fwnode) {
   193			aplic_element = kzalloc(sizeof(*aplic_element), GFP_KERNEL);
   194			if (!aplic_element) {
   195				fwnode_remove_software_node(fwnode);
   196				return NULL;
   197			}
   198	
   199			aplic_element->fwnode = fwnode;
   200			list_add_tail(&aplic_element->list, &aplic_list);
   201		}
   202	
   203		return fwnode;
   204	}
   205	
   206	static struct fwnode_handle *aplic_get_gsi_domain_id(u32 gsi)
   207	{
   208		struct riscv_irqchip_list *aplic_element;
   209		struct fwnode_handle *fwnode;
   210		struct list_head *i, *tmp;
   211		u32 gsi_base;
   212		u32 nr_irqs;
   213		int rc;
   214	
   215		list_for_each_safe(i, tmp, &aplic_list) {
   216			aplic_element = list_entry(i, struct riscv_irqchip_list, list);
   217			fwnode = aplic_element->fwnode;
   218			rc = fwnode_property_read_u32_array(fwnode, "riscv,gsi-base", &gsi_base, 1);
   219			if (!rc) {
   220				rc = fwnode_property_read_u32_array(fwnode, "riscv,num-sources",
   221								    &nr_irqs, 1);
   222				if (!rc && (gsi >= gsi_base && gsi < gsi_base + nr_irqs))
   223					return fwnode;
   224			}
   225		}
   226	
   227		return NULL;
   228	}
   229	
   230	static u32 __init aplic_gsi_to_irq(u32 gsi)
   231	{
   232		return acpi_register_gsi(NULL, gsi, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_HIGH);
   233	}
   234	
   235	static int __init aplic_create_platform_device(struct fwnode_handle *fwnode)
   236	{
   237		struct platform_device *pdev;
   238		u32 aplic_size, aplic_id;
   239		struct resource *res;
   240		u64 aplic_base;
   241		int ret;
   242	
   243		if (!fwnode)
   244			return -ENODEV;
   245	
   246		ret = fwnode_property_read_u64_array(fwnode, "riscv,aplic-base", &aplic_base, 1);
   247		if (ret)
   248			return -ENODEV;
   249	
   250		ret = fwnode_property_read_u32_array(fwnode, "riscv,aplic-size", &aplic_size, 1);
   251		if (ret)
   252			return -ENODEV;
   253	
   254		ret = fwnode_property_read_u32_array(fwnode, "riscv,aplic-id", &aplic_id, 1);
   255		if (ret)
   256			return -ENODEV;
   257	
   258		pdev = platform_device_alloc("riscv-aplic", aplic_id);
   259		if (!pdev)
   260			return -ENOMEM;
   261	
   262		res = kcalloc(1, sizeof(*res), GFP_KERNEL);
   263		if (!res) {
   264			ret = -ENOMEM;
   265			goto dev_put;
   266		}
   267	
   268		res->start = aplic_base;
   269		res->end = res->start + aplic_size - 1;
   270		res->flags = IORESOURCE_MEM;
   271		ret = platform_device_add_resources(pdev, res, 1);
   272		/*
   273		 * Resources are duplicated in platform_device_add_resources,
   274		 * free their allocated memory
   275		 */
   276		kfree(res);
   277	
   278		pdev->dev.fwnode = fwnode;
   279		ret = platform_device_add(pdev);
   280		if (ret)
   281			goto dev_put;
   282	
   283		return 0;
   284	
   285	dev_put:
   286		platform_device_put(pdev);
   287		return ret;
   288	}
   289	
   290	static int __init aplic_parse_madt(union acpi_subtable_headers *header,
   291					   const unsigned long end)
   292	{
   293		struct acpi_madt_aplic *aplic = (struct acpi_madt_aplic *)header;
   294		struct fwnode_handle *fwnode;
   295	
   296		fwnode = acpi_aplic_create_fwnode(aplic);
   297		if (fwnode)
   298			aplic_create_platform_device(fwnode);
   299	
   300		return 0;
   301	}
   302	
 > 303	void __init riscv_acpi_aplic_platform_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
