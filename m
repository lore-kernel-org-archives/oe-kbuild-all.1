Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88E814A9D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 05:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689054351; x=1720590351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s+5scRyoWVv0LJZSE3PmC53qXjGwANIGu5UcApqGh8w=;
  b=T76AhhVj75G742AgaAyNR76AzHPT0wqpMRQEfWBG50rVniot4ErmgGbW
   D61JSjznPyCGdddYqNDFNGWPI5IARsujqmdOaM3tViFw8a03PbwfVYyzn
   1aRdq2R6aO3f4SlGwte8Sv69rbVqiZ1n3QomNp0Pq5EIkQKD1zSbj43hA
   j3jYWLl4VnfToZTc6Z0nCG+r/gr4oaMWSRkJBqEaY8M2uqeGSQCyet6ca
   Azk++wdPbpQv+80t0T+Ieum/N4oAnZR4z60RevVrMIHrvezJL2o+FuBqK
   vXolkO4+MME7JPFuwIsgAQtYB9vM17fnwm6HQmFvf4fMxma1cxOkdzVQm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="430617593"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="430617593"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 22:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="750597422"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="750597422"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Jul 2023 22:45:43 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ6By-0004Mf-1g;
	Tue, 11 Jul 2023 05:45:42 +0000
Date: Tue, 11 Jul 2023 13:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 15/15] arch/sparc/mm/iommu.c:72:37: error:
 invalid use of undefined type 'struct platform_device'
Message-ID: <202307111339.wT25LVhl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   92a0590e6af4168d400aa0d285a1160122f54c1c
commit: 92a0590e6af4168d400aa0d285a1160122f54c1c [15/15] of: header cleanups
config: sparc-randconfig-r005-20230710 (https://download.01.org/0day-ci/archive/20230711/202307111339.wT25LVhl-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111339.wT25LVhl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111339.wT25LVhl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/sparc/mm/iommu.c: In function 'sbus_iommu_init':
>> arch/sparc/mm/iommu.c:72:37: error: invalid use of undefined type 'struct platform_device'
      72 |         iommu->regs = of_ioremap(&op->resource[0], 0, PAGE_SIZE * 3,
         |                                     ^~
   arch/sparc/mm/iommu.c:131:11: error: invalid use of undefined type 'struct platform_device'
     131 |         op->dev.archdata.iommu = iommu;
         |           ^~
   arch/sparc/mm/iommu.c:134:19: error: invalid use of undefined type 'struct platform_device'
     134 |                 op->dev.dma_ops = &sbus_iommu_dma_gflush_ops;
         |                   ^~
   arch/sparc/mm/iommu.c:136:19: error: invalid use of undefined type 'struct platform_device'
     136 |                 op->dev.dma_ops = &sbus_iommu_dma_pflush_ops;
         |                   ^~
   arch/sparc/mm/iommu.c: In function 'iommu_init':
>> arch/sparc/mm/iommu.c:144:46: error: implicit declaration of function 'of_find_device_by_node'; did you mean 'bus_find_device_by_fwnode'? [-Werror=implicit-function-declaration]
     144 |                 struct platform_device *op = of_find_device_by_node(dp);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~
         |                                              bus_find_device_by_fwnode
>> arch/sparc/mm/iommu.c:144:46: error: initialization of 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
   cc1: all warnings being treated as errors
--
   arch/sparc/mm/io-unit.c: In function 'iounit_iommu_init':
>> arch/sparc/mm/io-unit.c:59:29: error: invalid use of undefined type 'struct platform_device'
      59 |         xpt = of_ioremap(&op->resource[2], 0, PAGE_SIZE * 16, "XPT");
         |                             ^~
   arch/sparc/mm/io-unit.c:65:11: error: invalid use of undefined type 'struct platform_device'
      65 |         op->dev.archdata.iommu = iounit;
         |           ^~
   arch/sparc/mm/io-unit.c:73:11: error: invalid use of undefined type 'struct platform_device'
      73 |         op->dev.dma_ops = &iounit_dma_ops;
         |           ^~
   arch/sparc/mm/io-unit.c: In function 'iounit_init':
>> arch/sparc/mm/io-unit.c:82:46: error: implicit declaration of function 'of_find_device_by_node'; did you mean 'bus_find_device_by_fwnode'? [-Werror=implicit-function-declaration]
      82 |                 struct platform_device *op = of_find_device_by_node(dp);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~
         |                                              bus_find_device_by_fwnode
>> arch/sparc/mm/io-unit.c:82:46: error: initialization of 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
   cc1: all warnings being treated as errors
--
   arch/sparc/kernel/pmc.c:57:29: error: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      57 | static int pmc_probe(struct platform_device *op)
         |                             ^~~~~~~~~~~~~~~
   arch/sparc/kernel/pmc.c: In function 'pmc_probe':
>> arch/sparc/kernel/pmc.c:59:30: error: invalid use of undefined type 'struct platform_device'
      59 |         regs = of_ioremap(&op->resource[0], 0,
         |                              ^~
   arch/sparc/kernel/pmc.c:60:44: error: invalid use of undefined type 'struct platform_device'
      60 |                           resource_size(&op->resource[0]), PMC_OBPNAME);
         |                                            ^~
   arch/sparc/kernel/pmc.c: At top level:
>> arch/sparc/kernel/pmc.c:83:15: error: variable 'pmc_driver' has initializer but incomplete type
      83 | static struct platform_driver pmc_driver = {
         |               ^~~~~~~~~~~~~~~
>> arch/sparc/kernel/pmc.c:84:10: error: 'struct platform_driver' has no member named 'driver'
      84 |         .driver = {
         |          ^~~~~~
>> arch/sparc/kernel/pmc.c:84:19: error: extra brace group at end of initializer
      84 |         .driver = {
         |                   ^
   arch/sparc/kernel/pmc.c:84:19: note: (near initialization for 'pmc_driver')
   arch/sparc/kernel/pmc.c:84:19: error: excess elements in struct initializer [-Werror]
   arch/sparc/kernel/pmc.c:84:19: note: (near initialization for 'pmc_driver')
>> arch/sparc/kernel/pmc.c:88:10: error: 'struct platform_driver' has no member named 'probe'
      88 |         .probe          = pmc_probe,
         |          ^~~~~
   arch/sparc/kernel/pmc.c:88:27: error: excess elements in struct initializer [-Werror]
      88 |         .probe          = pmc_probe,
         |                           ^~~~~~~~~
   arch/sparc/kernel/pmc.c:88:27: note: (near initialization for 'pmc_driver')
   arch/sparc/kernel/pmc.c: In function 'pmc_init':
>> arch/sparc/kernel/pmc.c:93:16: error: implicit declaration of function 'platform_driver_register' [-Werror=implicit-function-declaration]
      93 |         return platform_driver_register(&pmc_driver);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/kernel/pmc.c: At top level:
>> arch/sparc/kernel/pmc.c:83:31: error: storage size of 'pmc_driver' isn't known
      83 | static struct platform_driver pmc_driver = {
         |                               ^~~~~~~~~~
   cc1: all warnings being treated as errors
--
   arch/sparc/kernel/of_device_common.c: In function 'irq_of_parse_and_map':
>> arch/sparc/kernel/of_device_common.c:20:31: error: invalid use of undefined type 'struct platform_device'
      20 |         if (!op || index >= op->archdata.num_irqs)
         |                               ^~
   arch/sparc/kernel/of_device_common.c:23:18: error: invalid use of undefined type 'struct platform_device'
      23 |         return op->archdata.irqs[index];
         |                  ^~
   arch/sparc/kernel/of_device_common.c: In function 'of_address_to_resource':
   arch/sparc/kernel/of_device_common.c:32:31: error: invalid use of undefined type 'struct platform_device'
      32 |         if (!op || index >= op->num_resources)
         |                               ^~
   In file included from include/linux/string.h:20,
                    from arch/sparc/kernel/of_device_common.c:2:
   arch/sparc/kernel/of_device_common.c:35:22: error: invalid use of undefined type 'struct platform_device'
      35 |         memcpy(r, &op->archdata.resource[index], sizeof(*r));
         |                      ^~
   arch/sparc/include/asm/string.h:15:45: note: in definition of macro 'memcpy'
      15 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                                             ^
   arch/sparc/kernel/of_device_common.c: In function 'of_iomap':
   arch/sparc/kernel/of_device_common.c:45:31: error: invalid use of undefined type 'struct platform_device'
      45 |         if (!op || index >= op->num_resources)
         |                               ^~
   arch/sparc/kernel/of_device_common.c:48:16: error: invalid use of undefined type 'struct platform_device'
      48 |         r = &op->archdata.resource[index];
         |                ^~
   arch/sparc/kernel/of_device_common.c: At top level:
>> arch/sparc/kernel/of_device_common.c:57:6: error: no previous prototype for 'of_propagate_archdata' [-Werror=missing-prototypes]
      57 | void of_propagate_archdata(struct platform_device *bus)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/sparc/kernel/of_device_common.c: In function 'of_propagate_archdata':
   arch/sparc/kernel/of_device_common.c:59:43: error: invalid use of undefined type 'struct platform_device'
      59 |         struct dev_archdata *bus_sd = &bus->dev.archdata;
         |                                           ^~
   arch/sparc/kernel/of_device_common.c:60:41: error: invalid use of undefined type 'struct platform_device'
      60 |         struct device_node *bus_dp = bus->dev.of_node;
         |                                         ^~
   arch/sparc/kernel/of_device_common.c:66:19: error: invalid use of undefined type 'struct platform_device'
      66 |                 op->dev.archdata.iommu = bus_sd->iommu;
         |                   ^~
>> arch/sparc/kernel/of_device_common.c:66:48: error: invalid use of undefined type 'struct dev_archdata'
      66 |                 op->dev.archdata.iommu = bus_sd->iommu;
         |                                                ^~
   arch/sparc/kernel/of_device_common.c:67:19: error: invalid use of undefined type 'struct platform_device'
      67 |                 op->dev.archdata.stc = bus_sd->stc;
         |                   ^~
   arch/sparc/kernel/of_device_common.c:67:46: error: invalid use of undefined type 'struct dev_archdata'
      67 |                 op->dev.archdata.stc = bus_sd->stc;
         |                                              ^~
   arch/sparc/kernel/of_device_common.c:68:19: error: invalid use of undefined type 'struct platform_device'
      68 |                 op->dev.archdata.host_controller = bus_sd->host_controller;
         |                   ^~
   arch/sparc/kernel/of_device_common.c:68:58: error: invalid use of undefined type 'struct dev_archdata'
      68 |                 op->dev.archdata.host_controller = bus_sd->host_controller;
         |                                                          ^~
   arch/sparc/kernel/of_device_common.c:69:19: error: invalid use of undefined type 'struct platform_device'
      69 |                 op->dev.archdata.numa_node = bus_sd->numa_node;
         |                   ^~
   arch/sparc/kernel/of_device_common.c:69:52: error: invalid use of undefined type 'struct dev_archdata'
      69 |                 op->dev.archdata.numa_node = bus_sd->numa_node;
         |                                                    ^~
   arch/sparc/kernel/of_device_common.c:70:19: error: invalid use of undefined type 'struct platform_device'
      70 |                 op->dev.dma_ops = bus->dev.dma_ops;
         |                   ^~
   arch/sparc/kernel/of_device_common.c:70:38: error: invalid use of undefined type 'struct platform_device'
      70 |                 op->dev.dma_ops = bus->dev.dma_ops;
         |                                      ^~
   arch/sparc/kernel/of_device_common.c: In function 'irq_of_parse_and_map':
   arch/sparc/kernel/of_device_common.c:24:1: error: control reaches end of non-void function [-Werror=return-type]
      24 | }
         | ^
   cc1: all warnings being treated as errors
--
   arch/sparc/kernel/apc.c: In function 'apc_free':
>> arch/sparc/kernel/apc.c:76:23: error: invalid use of undefined type 'struct platform_device'
      76 |         of_iounmap(&op->resource[0], regs, resource_size(&op->resource[0]));
         |                       ^~
   arch/sparc/kernel/apc.c:76:61: error: invalid use of undefined type 'struct platform_device'
      76 |         of_iounmap(&op->resource[0], regs, resource_size(&op->resource[0]));
         |                                                             ^~
   arch/sparc/kernel/apc.c: In function 'apc_probe':
   arch/sparc/kernel/apc.c:147:30: error: invalid use of undefined type 'struct platform_device'
     147 |         regs = of_ioremap(&op->resource[0], 0,
         |                              ^~
   arch/sparc/kernel/apc.c:148:44: error: invalid use of undefined type 'struct platform_device'
     148 |                           resource_size(&op->resource[0]), APC_OBPNAME);
         |                                            ^~
   arch/sparc/kernel/apc.c: At top level:
>> arch/sparc/kernel/apc.c:179:15: error: variable 'apc_driver' has initializer but incomplete type
     179 | static struct platform_driver apc_driver = {
         |               ^~~~~~~~~~~~~~~
>> arch/sparc/kernel/apc.c:180:10: error: 'struct platform_driver' has no member named 'driver'
     180 |         .driver = {
         |          ^~~~~~
>> arch/sparc/kernel/apc.c:180:19: error: extra brace group at end of initializer
     180 |         .driver = {
         |                   ^
   arch/sparc/kernel/apc.c:180:19: note: (near initialization for 'apc_driver')
   arch/sparc/kernel/apc.c:180:19: error: excess elements in struct initializer [-Werror]
   arch/sparc/kernel/apc.c:180:19: note: (near initialization for 'apc_driver')
>> arch/sparc/kernel/apc.c:184:10: error: 'struct platform_driver' has no member named 'probe'
     184 |         .probe          = apc_probe,
         |          ^~~~~
   arch/sparc/kernel/apc.c:184:27: error: excess elements in struct initializer [-Werror]
     184 |         .probe          = apc_probe,
         |                           ^~~~~~~~~
   arch/sparc/kernel/apc.c:184:27: note: (near initialization for 'apc_driver')
   arch/sparc/kernel/apc.c: In function 'apc_init':
>> arch/sparc/kernel/apc.c:189:16: error: implicit declaration of function 'platform_driver_register' [-Werror=implicit-function-declaration]
     189 |         return platform_driver_register(&apc_driver);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/kernel/apc.c: At top level:
>> arch/sparc/kernel/apc.c:179:31: error: storage size of 'apc_driver' isn't known
     179 | static struct platform_driver apc_driver = {
         |                               ^~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from drivers/usb/host/uhci-hcd.c:850:
   drivers/usb/host/uhci-grlib.c: In function 'uhci_hcd_grlib_probe':
>> drivers/usb/host/uhci-grlib.c:92:36: error: invalid use of undefined type 'struct platform_device'
      92 |         struct device_node *dn = op->dev.of_node;
         |                                    ^~
   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from drivers/usb/host/uhci-hcd.c:27:
   drivers/usb/host/uhci-grlib.c:102:20: error: invalid use of undefined type 'struct platform_device'
     102 |         dev_dbg(&op->dev, "initializing GRUSBHC UHCI USB Controller\n");
         |                    ^~
   include/linux/dev_printk.h:129:36: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                    ^~~
   drivers/usb/host/uhci-grlib.c:102:9: note: in expansion of macro 'dev_dbg'
     102 |         dev_dbg(&op->dev, "initializing GRUSBHC UHCI USB Controller\n");
         |         ^~~~~~~
   drivers/usb/host/uhci-grlib.c:109:11: error: invalid use of undefined type 'struct platform_device'
     109 |         op->dev.dma_mask = &op->dev.coherent_dma_mask;
         |           ^~
   drivers/usb/host/uhci-grlib.c:109:31: error: invalid use of undefined type 'struct platform_device'
     109 |         op->dev.dma_mask = &op->dev.coherent_dma_mask;
         |                               ^~
   drivers/usb/host/uhci-grlib.c:110:56: error: invalid use of undefined type 'struct platform_device'
     110 |         hcd = usb_create_hcd(&uhci_grlib_hc_driver, &op->dev,
         |                                                        ^~
   drivers/usb/host/uhci-grlib.c:125:46: error: invalid use of undefined type 'struct platform_device'
     125 |         hcd->regs = devm_ioremap_resource(&op->dev, &res);
         |                                              ^~
   drivers/usb/host/uhci-grlib.c: In function 'uhci_hcd_grlib_remove':
>> drivers/usb/host/uhci-grlib.c:152:31: error: implicit declaration of function 'platform_get_drvdata'; did you mean 'pci_get_drvdata'? [-Werror=implicit-function-declaration]
     152 |         struct usb_hcd *hcd = platform_get_drvdata(op);
         |                               ^~~~~~~~~~~~~~~~~~~~
         |                               pci_get_drvdata
>> drivers/usb/host/uhci-grlib.c:152:31: warning: initialization of 'struct usb_hcd *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/usb/host/uhci-grlib.c:154:20: error: invalid use of undefined type 'struct platform_device'
     154 |         dev_dbg(&op->dev, "stopping GRLIB GRUSBHC UHCI USB Controller\n");
         |                    ^~
   include/linux/dev_printk.h:129:36: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                    ^~~
   drivers/usb/host/uhci-grlib.c:154:9: note: in expansion of macro 'dev_dbg'
     154 |         dev_dbg(&op->dev, "stopping GRLIB GRUSBHC UHCI USB Controller\n");
         |         ^~~~~~~
   drivers/usb/host/uhci-grlib.c: In function 'uhci_hcd_grlib_shutdown':
   drivers/usb/host/uhci-grlib.c:171:31: warning: initialization of 'struct usb_hcd *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     171 |         struct usb_hcd *hcd = platform_get_drvdata(op);
         |                               ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/uhci-grlib.c: At top level:
>> drivers/usb/host/uhci-grlib.c:184:15: error: variable 'uhci_grlib_driver' has initializer but incomplete type
     184 | static struct platform_driver uhci_grlib_driver = {
         |               ^~~~~~~~~~~~~~~
>> drivers/usb/host/uhci-grlib.c:185:10: error: 'struct platform_driver' has no member named 'probe'
     185 |         .probe          = uhci_hcd_grlib_probe,
         |          ^~~~~
>> drivers/usb/host/uhci-grlib.c:185:27: warning: excess elements in struct initializer
     185 |         .probe          = uhci_hcd_grlib_probe,
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/uhci-grlib.c:185:27: note: (near initialization for 'uhci_grlib_driver')
>> drivers/usb/host/uhci-grlib.c:186:10: error: 'struct platform_driver' has no member named 'remove_new'
     186 |         .remove_new     = uhci_hcd_grlib_remove,
         |          ^~~~~~~~~~
   drivers/usb/host/uhci-grlib.c:186:27: warning: excess elements in struct initializer
     186 |         .remove_new     = uhci_hcd_grlib_remove,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/uhci-grlib.c:186:27: note: (near initialization for 'uhci_grlib_driver')
>> drivers/usb/host/uhci-grlib.c:187:10: error: 'struct platform_driver' has no member named 'shutdown'
     187 |         .shutdown       = uhci_hcd_grlib_shutdown,
         |          ^~~~~~~~
   drivers/usb/host/uhci-grlib.c:187:27: warning: excess elements in struct initializer
     187 |         .shutdown       = uhci_hcd_grlib_shutdown,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/uhci-grlib.c:187:27: note: (near initialization for 'uhci_grlib_driver')
>> drivers/usb/host/uhci-grlib.c:188:10: error: 'struct platform_driver' has no member named 'driver'
     188 |         .driver = {
         |          ^~~~~~
>> drivers/usb/host/uhci-grlib.c:188:19: error: extra brace group at end of initializer
     188 |         .driver = {
         |                   ^
   drivers/usb/host/uhci-grlib.c:188:19: note: (near initialization for 'uhci_grlib_driver')
   drivers/usb/host/uhci-grlib.c:188:19: warning: excess elements in struct initializer
   drivers/usb/host/uhci-grlib.c:188:19: note: (near initialization for 'uhci_grlib_driver')
   drivers/usb/host/uhci-hcd.c: In function 'uhci_hcd_init':
>> drivers/usb/host/uhci-hcd.c:885:18: error: implicit declaration of function 'platform_driver_register' [-Werror=implicit-function-declaration]
     885 |         retval = platform_driver_register(&PLATFORM_DRIVER);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/uhci-hcd.c:902:9: error: implicit declaration of function 'platform_driver_unregister'; did you mean 'driver_unregister'? [-Werror=implicit-function-declaration]
     902 |         platform_driver_unregister(&PLATFORM_DRIVER);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         driver_unregister
   drivers/usb/host/uhci-grlib.c: At top level:
>> drivers/usb/host/uhci-grlib.c:184:31: error: storage size of 'uhci_grlib_driver' isn't known
     184 | static struct platform_driver uhci_grlib_driver = {
         |                               ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +72 arch/sparc/mm/iommu.c

255a69a94b8cbb Christoph Hellwig 2020-03-23   56  
cd4cd7306a403f Grant Likely      2010-07-22   57  static void __init sbus_iommu_init(struct platform_device *op)
^1da177e4c3f41 Linus Torvalds    2005-04-16   58  {
^1da177e4c3f41 Linus Torvalds    2005-04-16   59  	struct iommu_struct *iommu;
e003934876e75f David S. Miller   2008-08-25   60  	unsigned int impl, vers;
^1da177e4c3f41 Linus Torvalds    2005-04-16   61  	unsigned long *bitmap;
f977ea49ae24c3 Sam Ravnborg      2014-05-16   62  	unsigned long control;
f977ea49ae24c3 Sam Ravnborg      2014-05-16   63  	unsigned long base;
e003934876e75f David S. Miller   2008-08-25   64  	unsigned long tmp;
e003934876e75f David S. Miller   2008-08-25   65  
71cd03b0044183 Julia Lawall      2010-08-02   66  	iommu = kmalloc(sizeof(struct iommu_struct), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16   67  	if (!iommu) {
^1da177e4c3f41 Linus Torvalds    2005-04-16   68  		prom_printf("Unable to allocate iommu structure\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16   69  		prom_halt();
^1da177e4c3f41 Linus Torvalds    2005-04-16   70  	}
e003934876e75f David S. Miller   2008-08-25   71  
046e26a8ba10b8 David S. Miller   2008-08-27  @72  	iommu->regs = of_ioremap(&op->resource[0], 0, PAGE_SIZE * 3,
e003934876e75f David S. Miller   2008-08-25   73  				 "iommu_regs");
^1da177e4c3f41 Linus Torvalds    2005-04-16   74  	if (!iommu->regs) {
^1da177e4c3f41 Linus Torvalds    2005-04-16   75  		prom_printf("Cannot map IOMMU registers\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16   76  		prom_halt();
^1da177e4c3f41 Linus Torvalds    2005-04-16   77  	}
f977ea49ae24c3 Sam Ravnborg      2014-05-16   78  
f977ea49ae24c3 Sam Ravnborg      2014-05-16   79  	control = sbus_readl(&iommu->regs->control);
f977ea49ae24c3 Sam Ravnborg      2014-05-16   80  	impl = (control & IOMMU_CTRL_IMPL) >> 28;
f977ea49ae24c3 Sam Ravnborg      2014-05-16   81  	vers = (control & IOMMU_CTRL_VERS) >> 24;
f977ea49ae24c3 Sam Ravnborg      2014-05-16   82  	control &= ~(IOMMU_CTRL_RNGE);
f977ea49ae24c3 Sam Ravnborg      2014-05-16   83  	control |= (IOMMU_RNGE_256MB | IOMMU_CTRL_ENAB);
f977ea49ae24c3 Sam Ravnborg      2014-05-16   84  	sbus_writel(control, &iommu->regs->control);
f977ea49ae24c3 Sam Ravnborg      2014-05-16   85  
^1da177e4c3f41 Linus Torvalds    2005-04-16   86  	iommu_invalidate(iommu->regs);
^1da177e4c3f41 Linus Torvalds    2005-04-16   87  	iommu->start = IOMMU_START;
^1da177e4c3f41 Linus Torvalds    2005-04-16   88  	iommu->end = 0xffffffff;
^1da177e4c3f41 Linus Torvalds    2005-04-16   89  
^1da177e4c3f41 Linus Torvalds    2005-04-16   90  	/* Allocate IOMMU page table */
^1da177e4c3f41 Linus Torvalds    2005-04-16   91  	/* Stupid alignment constraints give me a headache. 
^1da177e4c3f41 Linus Torvalds    2005-04-16   92  	   We need 256K or 512K or 1M or 2M area aligned to
^1da177e4c3f41 Linus Torvalds    2005-04-16   93             its size and current gfp will fortunately give
^1da177e4c3f41 Linus Torvalds    2005-04-16   94             it to us. */
^1da177e4c3f41 Linus Torvalds    2005-04-16   95          tmp = __get_free_pages(GFP_KERNEL, IOMMU_ORDER);
^1da177e4c3f41 Linus Torvalds    2005-04-16   96  	if (!tmp) {
5da444aae54f64 Akinobu Mita      2012-09-29   97  		prom_printf("Unable to allocate iommu table [0x%lx]\n",
^1da177e4c3f41 Linus Torvalds    2005-04-16   98  			    IOMMU_NPTES * sizeof(iopte_t));
^1da177e4c3f41 Linus Torvalds    2005-04-16   99  		prom_halt();
^1da177e4c3f41 Linus Torvalds    2005-04-16  100  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  101  	iommu->page_table = (iopte_t *)tmp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  102  
^1da177e4c3f41 Linus Torvalds    2005-04-16  103  	/* Initialize new table. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  104  	memset(iommu->page_table, 0, IOMMU_NPTES*sizeof(iopte_t));
^1da177e4c3f41 Linus Torvalds    2005-04-16  105  	flush_cache_all();
^1da177e4c3f41 Linus Torvalds    2005-04-16  106  	flush_tlb_all();
f977ea49ae24c3 Sam Ravnborg      2014-05-16  107  
f977ea49ae24c3 Sam Ravnborg      2014-05-16  108  	base = __pa((unsigned long)iommu->page_table) >> 4;
f977ea49ae24c3 Sam Ravnborg      2014-05-16  109  	sbus_writel(base, &iommu->regs->base);
^1da177e4c3f41 Linus Torvalds    2005-04-16  110  	iommu_invalidate(iommu->regs);
^1da177e4c3f41 Linus Torvalds    2005-04-16  111  
^1da177e4c3f41 Linus Torvalds    2005-04-16  112  	bitmap = kmalloc(IOMMU_NPTES>>3, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  113  	if (!bitmap) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  114  		prom_printf("Unable to allocate iommu bitmap [%d]\n",
^1da177e4c3f41 Linus Torvalds    2005-04-16  115  			    (int)(IOMMU_NPTES>>3));
^1da177e4c3f41 Linus Torvalds    2005-04-16  116  		prom_halt();
^1da177e4c3f41 Linus Torvalds    2005-04-16  117  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  118  	bit_map_init(&iommu->usemap, bitmap, IOMMU_NPTES);
^1da177e4c3f41 Linus Torvalds    2005-04-16  119  	/* To be coherent on HyperSparc, the page color of DVMA
^1da177e4c3f41 Linus Torvalds    2005-04-16  120  	 * and physical addresses must match.
^1da177e4c3f41 Linus Torvalds    2005-04-16  121  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  122  	if (srmmu_modtype == HyperSparc)
^1da177e4c3f41 Linus Torvalds    2005-04-16  123  		iommu->usemap.num_colors = vac_cache_size >> PAGE_SHIFT;
^1da177e4c3f41 Linus Torvalds    2005-04-16  124  	else
^1da177e4c3f41 Linus Torvalds    2005-04-16  125  		iommu->usemap.num_colors = 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  126  
046e26a8ba10b8 David S. Miller   2008-08-27  127  	printk(KERN_INFO "IOMMU: impl %d vers %d table 0x%p[%d B] map [%d b]\n",
^1da177e4c3f41 Linus Torvalds    2005-04-16  128  	       impl, vers, iommu->page_table,
^1da177e4c3f41 Linus Torvalds    2005-04-16  129  	       (int)(IOMMU_NPTES*sizeof(iopte_t)), (int)IOMMU_NPTES);
^1da177e4c3f41 Linus Torvalds    2005-04-16  130  
e003934876e75f David S. Miller   2008-08-25  131  	op->dev.archdata.iommu = iommu;
255a69a94b8cbb Christoph Hellwig 2020-03-23  132  
255a69a94b8cbb Christoph Hellwig 2020-03-23  133  	if (flush_page_for_dma_global)
255a69a94b8cbb Christoph Hellwig 2020-03-23  134  		op->dev.dma_ops = &sbus_iommu_dma_gflush_ops;
255a69a94b8cbb Christoph Hellwig 2020-03-23  135  	 else
255a69a94b8cbb Christoph Hellwig 2020-03-23  136  		op->dev.dma_ops = &sbus_iommu_dma_pflush_ops;
^1da177e4c3f41 Linus Torvalds    2005-04-16  137  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  138  
046e26a8ba10b8 David S. Miller   2008-08-27  139  static int __init iommu_init(void)
046e26a8ba10b8 David S. Miller   2008-08-27  140  {
046e26a8ba10b8 David S. Miller   2008-08-27  141  	struct device_node *dp;
046e26a8ba10b8 David S. Miller   2008-08-27  142  
046e26a8ba10b8 David S. Miller   2008-08-27  143  	for_each_node_by_name(dp, "iommu") {
cd4cd7306a403f Grant Likely      2010-07-22 @144  		struct platform_device *op = of_find_device_by_node(dp);
046e26a8ba10b8 David S. Miller   2008-08-27  145  
046e26a8ba10b8 David S. Miller   2008-08-27  146  		sbus_iommu_init(op);
046e26a8ba10b8 David S. Miller   2008-08-27  147  		of_propagate_archdata(op);
046e26a8ba10b8 David S. Miller   2008-08-27  148  	}
046e26a8ba10b8 David S. Miller   2008-08-27  149  
046e26a8ba10b8 David S. Miller   2008-08-27  150  	return 0;
046e26a8ba10b8 David S. Miller   2008-08-27  151  }
046e26a8ba10b8 David S. Miller   2008-08-27  152  

:::::: The code at line 72 was first introduced by commit
:::::: 046e26a8ba10b8ceff822f8d91451ab6c1e08c4e sparc: Remove generic SBUS probing layer.

:::::: TO: David S. Miller <davem@davemloft.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
