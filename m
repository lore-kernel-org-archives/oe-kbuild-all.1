Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595F71E501C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 23:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757806862; cv=none; b=Nup+CkFNyANn/w/MtYk/uinUkBLi06TXdsQti6eGDgk2V4k2RfJjYAJMnl1R5eu6T7hU+c8Sq6Gp7wCVM4Nml+KmDItsPsjQBj7TqByQYukowymaI7f56j9kRoltD+8pbStMxUsK1s3SVxteXXtda7ogPXXc7Ca32IvQJd8gXew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757806862; c=relaxed/simple;
	bh=dwOBBpcIQIbIPrb4I7r8gPYQoboERGYbbgLzJ/Z4WwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nP0BlJnH+tpOlkrX+N+s1KmjzsaPHM6KrFZkoevA/pmMmCYz71NzY+dkJJflG8INWJiLXKTb0cLyKnROoVu8NcCeYah2V2bfLHpC9ChXHgNFqXdqSm1NJQCdGialxZjMAmMz/Vf+RxNMIrQmknVQQ+ECUOrmjkj8+iG65opQ0Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAT+R33f; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAT+R33f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757806860; x=1789342860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dwOBBpcIQIbIPrb4I7r8gPYQoboERGYbbgLzJ/Z4WwI=;
  b=oAT+R33fi6bVzo7da40eRGFq6ptgVq1JIeXKBBMg3zF4cOT+MKNXrJsH
   83+IeYHd+7qiTIVCw0zCyYB5yvfwx5RO46y1u09Jp95WV6ZORMv/g6zin
   MbQhqrhtIFOeWqWb5tNiNYv3GI+/E5ubLsNeBhDIJ2S/geLAQGz+QeDkK
   Y75fRc++QcyIvkm86bBRmnzXKEFdVpNkEBLWIW/2TJwUK3rhdX4HM4pUQ
   qxxbdyHzLGga6E5Ws33qidaG7MZv7zO8JmYRibrmSpSZ7mIWTaV/JAuu7
   s0CLzP86E+H5wbpoMrkHz3XmhIRZMxAK4wOGG7bDS+MMwVf391CVbrKQP
   g==;
X-CSE-ConnectionGUID: IjSNMYFxTe+3x2e76+h+sg==
X-CSE-MsgGUID: zrvU64sDTWeqb3HwFHZy7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="59805059"
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="59805059"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 16:40:59 -0700
X-CSE-ConnectionGUID: n2n51KlrS+62NXp/MrxOgA==
X-CSE-MsgGUID: D6kwJsaIQV64CHlBimoVwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="173585460"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 13 Sep 2025 16:40:58 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxZrT-0001we-1D;
	Sat, 13 Sep 2025 23:40:55 +0000
Date: Sun, 14 Sep 2025 07:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_first_size 31/38]
 drivers/pci/controller/dwc/pci-dra7xx.c:223:13: error: invalid storage class
 for function 'dra7xx_pcie_handle_msi_irq'
Message-ID: <202509140700.OVjtw1lB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_first_size
head:   19fff28fbf729956258aeb0cd260f8dc1186952f
commit: 6096b790f1e896e0add2679630eba8bb0659022e [31/38] PCI: dra7xx: switch dra7xx_pcie_handle_msi() to using for_each()
config: csky-randconfig-001-20250914 (https://download.01.org/0day-ci/archive/20250914/202509140700.OVjtw1lB-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509140700.OVjtw1lB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509140700.OVjtw1lB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/dwc/pci-dra7xx.c: In function 'dra7xx_pcie_handle_msi':
>> drivers/pci/controller/dwc/pci-dra7xx.c:223:13: error: invalid storage class for function 'dra7xx_pcie_handle_msi_irq'
     223 | static void dra7xx_pcie_handle_msi_irq(struct dw_pcie_rp *pp)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:250:13: error: invalid storage class for function 'dra7xx_pcie_msi_irq_handler'
     250 | static void dra7xx_pcie_msi_irq_handler(struct irq_desc *desc)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:284:20: error: invalid storage class for function 'dra7xx_pcie_irq_handler'
     284 | static irqreturn_t dra7xx_pcie_irq_handler(int irq, void *arg)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:343:12: error: invalid storage class for function 'dra7xx_pcie_init_irq_domain'
     343 | static int dra7xx_pcie_init_irq_domain(struct dw_pcie_rp *pp)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:373:13: error: invalid storage class for function 'dra7xx_pcie_ep_init'
     373 | static void dra7xx_pcie_ep_init(struct dw_pcie_ep *ep)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:385:13: error: invalid storage class for function 'dra7xx_pcie_raise_intx_irq'
     385 | static void dra7xx_pcie_raise_intx_irq(struct dra7xx_pcie *dra7xx)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:392:13: error: invalid storage class for function 'dra7xx_pcie_raise_msi_irq'
     392 | static void dra7xx_pcie_raise_msi_irq(struct dra7xx_pcie *dra7xx,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:402:12: error: invalid storage class for function 'dra7xx_pcie_raise_irq'
     402 | static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:429:1: error: invalid storage class for function 'dra7xx_pcie_get_features'
     429 | dra7xx_pcie_get_features(struct dw_pcie_ep *ep)
         | ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:435:17: error: initializer element is not constant
     435 |         .init = dra7xx_pcie_ep_init,
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:435:17: note: (near initialization for 'pcie_ep_ops.init')
   drivers/pci/controller/dwc/pci-dra7xx.c:436:22: error: initializer element is not constant
     436 |         .raise_irq = dra7xx_pcie_raise_irq,
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:436:22: note: (near initialization for 'pcie_ep_ops.raise_irq')
   drivers/pci/controller/dwc/pci-dra7xx.c:437:25: error: initializer element is not constant
     437 |         .get_features = dra7xx_pcie_get_features,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:437:25: note: (near initialization for 'pcie_ep_ops.get_features')
>> drivers/pci/controller/dwc/pci-dra7xx.c:440:12: error: invalid storage class for function 'dra7xx_add_pcie_ep'
     440 | static int dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:478:12: error: invalid storage class for function 'dra7xx_add_pcie_port'
     478 | static int dra7xx_add_pcie_port(struct dra7xx_pcie *dra7xx,
         |            ^~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:519:13: error: invalid storage class for function 'dra7xx_pcie_disable_phy'
     519 | static void dra7xx_pcie_disable_phy(struct dra7xx_pcie *dra7xx)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:529:12: error: invalid storage class for function 'dra7xx_pcie_enable_phy'
     529 | static int dra7xx_pcie_enable_phy(struct dra7xx_pcie *dra7xx)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:630:12: error: invalid storage class for function 'dra7xx_pcie_unaligned_memaccess'
     630 | static int dra7xx_pcie_unaligned_memaccess(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:651:12: error: invalid storage class for function 'dra7xx_pcie_configure_two_lane'
     651 | static int dra7xx_pcie_configure_two_lane(struct device *dev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:674:12: error: invalid storage class for function 'dra7xx_pcie_probe'
     674 | static int dra7xx_pcie_probe(struct platform_device *pdev)
         |            ^~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:862:12: error: invalid storage class for function 'dra7xx_pcie_suspend'
     862 | static int dra7xx_pcie_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:879:12: error: invalid storage class for function 'dra7xx_pcie_resume'
     879 | static int dra7xx_pcie_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-dra7xx.c:896:12: error: invalid storage class for function 'dra7xx_pcie_suspend_noirq'
     896 | static int dra7xx_pcie_suspend_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:905:12: error: invalid storage class for function 'dra7xx_pcie_resume_noirq'
     905 | static int dra7xx_pcie_resume_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:919:13: error: invalid storage class for function 'dra7xx_pcie_shutdown'
     919 | static void dra7xx_pcie_shutdown(struct platform_device *pdev)
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:944:18: error: initializer element is not constant
     944 |         .probe = dra7xx_pcie_probe,
         |                  ^~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:944:18: note: (near initialization for 'dra7xx_pcie_driver.probe')
   drivers/pci/controller/dwc/pci-dra7xx.c:951:21: error: initializer element is not constant
     951 |         .shutdown = dra7xx_pcie_shutdown,
         |                     ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:951:21: note: (near initialization for 'dra7xx_pcie_driver.shutdown')
   In file included from include/linux/device.h:32,
                    from drivers/pci/controller/dwc/pci-dra7xx.c:12:
   drivers/pci/controller/dwc/pci-dra7xx.c:953:24: error: invalid storage class for function 'dra7xx_pcie_driver_init'
     953 | module_platform_driver(dra7xx_pcie_driver);
         |                        ^~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:258:19: note: in definition of macro 'module_driver'
     258 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:953:1: note: in expansion of macro 'module_platform_driver'
     953 | module_platform_driver(dra7xx_pcie_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:6,
                    from include/linux/kernel.h:31,
                    from include/linux/clk.h:13,
                    from drivers/pci/controller/dwc/pci-dra7xx.c:10:
   drivers/pci/controller/dwc/pci-dra7xx.c:953:24: error: initializer element is not constant
     953 | module_platform_driver(dra7xx_pcie_driver);
         |                        ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:272:55: note: in definition of macro '____define_initcall'
     272 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
   include/linux/init.h:282:9: note: in expansion of macro '__unique_initcall'
     282 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:284:35: note: in expansion of macro '___define_initcall'
     284 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:313:41: note: in expansion of macro '__define_initcall'
     313 | #define device_initcall(fn)             __define_initcall(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:318:24: note: in expansion of macro 'device_initcall'
     318 | #define __initcall(fn) device_initcall(fn)
         |                        ^~~~~~~~~~~~~~~
   include/linux/module.h:89:25: note: in expansion of macro '__initcall'
      89 | #define module_init(x)  __initcall(x);
         |                         ^~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:953:1: note: in expansion of macro 'module_platform_driver'
     953 | module_platform_driver(dra7xx_pcie_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:953:24: error: invalid storage class for function 'dra7xx_pcie_driver_exit'
     953 | module_platform_driver(dra7xx_pcie_driver);
         |                        ^~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:263:20: note: in definition of macro 'module_driver'
     263 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:953:1: note: in expansion of macro 'module_platform_driver'
     953 | module_platform_driver(dra7xx_pcie_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:953:24: error: initializer element is not constant
     953 | module_platform_driver(dra7xx_pcie_driver);
         |                        ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:321:57: note: in definition of macro '__exitcall'
     321 |         static exitcall_t __exitcall_##fn __exit_call = fn
         |                                                         ^~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:953:1: note: in expansion of macro 'module_platform_driver'
     953 | module_platform_driver(dra7xx_pcie_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:957:1: error: expected declaration or statement at end of input
     957 | MODULE_LICENSE("GPL v2");
         | ^~~~~~~~~~~~~~


vim +/dra7xx_pcie_handle_msi_irq +223 drivers/pci/controller/dwc/pci-dra7xx.c

47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  222  
60b3c27fb9b92b drivers/pci/controller/dwc/pci-dra7xx.c Serge Semin            2022-06-24 @223  static void dra7xx_pcie_handle_msi_irq(struct dw_pcie_rp *pp)
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  224  {
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  225  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  226  	int ret, i, count, num_ctrls;
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  227  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  228  	num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  229  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  230  	/**
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  231  	 * Need to make sure all MSI status bits read 0 before exiting.
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  232  	 * Else, new MSI IRQs are not registered by the wrapper. Have an
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  233  	 * upperbound for the loop and exit the IRQ in case of IRQ flood
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  234  	 * to avoid locking up system in interrupt context.
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  235  	 */
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  236  	count = 0;
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  237  	do {
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  238  		ret = 0;
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  239  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  240  		for (i = 0; i < num_ctrls; i++)
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  241  			ret |= dra7xx_pcie_handle_msi(pp, i);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  242  		count++;
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  243  	} while (ret && count <= 1000);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  244  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  245  	if (count > 1000)
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  246  		dev_warn_ratelimited(pci->dev,
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  247  				     "Too many MSI IRQs to handle\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  248  }
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  249  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27 @250  static void dra7xx_pcie_msi_irq_handler(struct irq_desc *desc)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  251  {
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  252  	struct irq_chip *chip = irq_desc_get_chip(desc);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  253  	struct dra7xx_pcie *dra7xx;
60b3c27fb9b92b drivers/pci/controller/dwc/pci-dra7xx.c Serge Semin            2022-06-24  254  	struct dw_pcie_rp *pp;
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  255  	struct dw_pcie *pci;
09b2d20349e37a drivers/pci/dwc/pci-dra7xx.c            Vignesh R              2017-12-29  256  	unsigned long reg;
d21faba11693c1 drivers/pci/controller/dwc/pci-dra7xx.c Marc Zyngier           2021-08-02  257  	u32 bit;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  258  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  259  	chained_irq_enter(chip, desc);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  260  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  261  	pp = irq_desc_get_handler_data(desc);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  262  	pci = to_dw_pcie_from_pp(pp);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  263  	dra7xx = to_dra7xx_pcie(pci);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  264  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  265  	reg = dra7xx_pcie_readl(dra7xx, PCIECTRL_DRA7XX_CONF_IRQSTATUS_MSI);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  266  	dra7xx_pcie_writel(dra7xx, PCIECTRL_DRA7XX_CONF_IRQSTATUS_MSI, reg);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  267  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  268  	switch (reg) {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  269  	case MSI:
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  270  		dra7xx_pcie_handle_msi_irq(pp);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  271  		break;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  272  	case INTA:
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  273  	case INTB:
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  274  	case INTC:
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  275  	case INTD:
d21faba11693c1 drivers/pci/controller/dwc/pci-dra7xx.c Marc Zyngier           2021-08-02  276  		for_each_set_bit(bit, &reg, PCI_NUM_INTX)
d21faba11693c1 drivers/pci/controller/dwc/pci-dra7xx.c Marc Zyngier           2021-08-02  277  			generic_handle_domain_irq(dra7xx->irq_domain, bit);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  278  		break;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  279  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  280  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  281  	chained_irq_exit(chip, desc);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  282  }
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  283  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22 @284  static irqreturn_t dra7xx_pcie_irq_handler(int irq, void *arg)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  285  {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  286  	struct dra7xx_pcie *dra7xx = arg;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  287  	struct dw_pcie *pci = dra7xx->pci;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  288  	struct device *dev = pci->dev;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  289  	struct dw_pcie_ep *ep = &pci->ep;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  290  	u32 reg;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  291  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  292  	reg = dra7xx_pcie_readl(dra7xx, PCIECTRL_DRA7XX_CONF_IRQSTATUS_MAIN);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  293  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  294  	if (reg & ERR_SYS)
c7f8146b7c56f7 drivers/pci/host/pci-dra7xx.c           Bjorn Helgaas          2016-10-06  295  		dev_dbg(dev, "System Error\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  296  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  297  	if (reg & ERR_FATAL)
c7f8146b7c56f7 drivers/pci/host/pci-dra7xx.c           Bjorn Helgaas          2016-10-06  298  		dev_dbg(dev, "Fatal Error\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  299  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  300  	if (reg & ERR_NONFATAL)
c7f8146b7c56f7 drivers/pci/host/pci-dra7xx.c           Bjorn Helgaas          2016-10-06  301  		dev_dbg(dev, "Non Fatal Error\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  302  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  303  	if (reg & ERR_COR)
c7f8146b7c56f7 drivers/pci/host/pci-dra7xx.c           Bjorn Helgaas          2016-10-06  304  		dev_dbg(dev, "Correctable Error\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  305  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  306  	if (reg & ERR_AXI)
c7f8146b7c56f7 drivers/pci/host/pci-dra7xx.c           Bjorn Helgaas          2016-10-06  307  		dev_dbg(dev, "AXI tag lookup fatal Error\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  308  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  309  	if (reg & ERR_ECRC)
c7f8146b7c56f7 drivers/pci/host/pci-dra7xx.c           Bjorn Helgaas          2016-10-06  310  		dev_dbg(dev, "ECRC Error\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  311  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  312  	if (reg & PME_TURN_OFF)
c7f8146b7c56f7 drivers/pci/host/pci-dra7xx.c           Bjorn Helgaas          2016-10-06  313  		dev_dbg(dev,
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  314  			"Power Management Event Turn-Off message received\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  315  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  316  	if (reg & PME_TO_ACK)
c7f8146b7c56f7 drivers/pci/host/pci-dra7xx.c           Bjorn Helgaas          2016-10-06  317  		dev_dbg(dev,
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  318  			"Power Management Turn-Off Ack message received\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  319  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  320  	if (reg & PM_PME)
c7f8146b7c56f7 drivers/pci/host/pci-dra7xx.c           Bjorn Helgaas          2016-10-06  321  		dev_dbg(dev, "PM Power Management Event message received\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  322  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  323  	if (reg & LINK_REQ_RST)
c7f8146b7c56f7 drivers/pci/host/pci-dra7xx.c           Bjorn Helgaas          2016-10-06  324  		dev_dbg(dev, "Link Request Reset\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  325  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  326  	if (reg & LINK_UP_EVT) {
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  327  		if (dra7xx->mode == DW_PCIE_EP_TYPE)
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  328  			dw_pcie_ep_linkup(ep);
c7f8146b7c56f7 drivers/pci/host/pci-dra7xx.c           Bjorn Helgaas          2016-10-06  329  		dev_dbg(dev, "Link-up state change\n");
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  330  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  331  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  332  	if (reg & CFG_BME_EVT)
c7f8146b7c56f7 drivers/pci/host/pci-dra7xx.c           Bjorn Helgaas          2016-10-06  333  		dev_dbg(dev, "CFG 'Bus Master Enable' change\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  334  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  335  	if (reg & CFG_MSE_EVT)
c7f8146b7c56f7 drivers/pci/host/pci-dra7xx.c           Bjorn Helgaas          2016-10-06  336  		dev_dbg(dev, "CFG 'Memory Space Enable' change\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  337  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  338  	dra7xx_pcie_writel(dra7xx, PCIECTRL_DRA7XX_CONF_IRQSTATUS_MAIN, reg);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  339  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  340  	return IRQ_HANDLED;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  341  }
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  342  
60b3c27fb9b92b drivers/pci/controller/dwc/pci-dra7xx.c Serge Semin            2022-06-24 @343  static int dra7xx_pcie_init_irq_domain(struct dw_pcie_rp *pp)
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  344  {
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  345  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  346  	struct device *dev = pci->dev;
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  347  	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  348  	struct device_node *node = dev->of_node;
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  349  	struct device_node *pcie_intc_node =  of_get_next_child(node, NULL);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  350  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  351  	if (!pcie_intc_node) {
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  352  		dev_err(dev, "No PCIe Intc node found\n");
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  353  		return -ENODEV;
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  354  	}
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  355  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  356  	irq_set_chained_handler_and_data(pp->irq, dra7xx_pcie_msi_irq_handler,
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  357  					 pp);
4b5e1d97154df4 drivers/pci/controller/dwc/pci-dra7xx.c Jiri Slaby (SUSE       2025-03-19  358) 	dra7xx->irq_domain = irq_domain_create_linear(of_fwnode_handle(pcie_intc_node),
4b5e1d97154df4 drivers/pci/controller/dwc/pci-dra7xx.c Jiri Slaby (SUSE       2025-03-19  359) 						      PCI_NUM_INTX, &intx_domain_ops, pp);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  360  	of_node_put(pcie_intc_node);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  361  	if (!dra7xx->irq_domain) {
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  362  		dev_err(dev, "Failed to get a INTx IRQ domain\n");
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  363  		return -ENODEV;
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  364  	}
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  365  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  366  	return 0;
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  367  }
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  368  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  369  static const struct dw_pcie_host_ops dra7xx_pcie_host_ops = {
aea370b2aec9d3 drivers/pci/controller/dwc/pci-dra7xx.c Yoshihiro Shimoda      2023-12-20  370  	.init = dra7xx_pcie_host_init,
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  371  };
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  372  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27 @373  static void dra7xx_pcie_ep_init(struct dw_pcie_ep *ep)
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  374  {
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  375  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  376  	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
85aa13997444d7 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-08-18  377  	enum pci_barno bar;
85aa13997444d7 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-08-18  378  
c9c13ba428ef90 drivers/pci/controller/dwc/pci-dra7xx.c Denis Efremov          2019-09-28  379  	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
85aa13997444d7 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-08-18  380  		dw_pcie_ep_reset_bar(pci, bar);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  381  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  382  	dra7xx_pcie_enable_wrapper_interrupts(dra7xx);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  383  }
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  384  
c5d973a07bb141 drivers/pci/controller/dwc/pci-dra7xx.c Damien Le Moal         2023-11-22 @385  static void dra7xx_pcie_raise_intx_irq(struct dra7xx_pcie *dra7xx)
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  386  {
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  387  	dra7xx_pcie_writel(dra7xx, PCIECTRL_TI_CONF_INTX_ASSERT, 0x1);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  388  	mdelay(1);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  389  	dra7xx_pcie_writel(dra7xx, PCIECTRL_TI_CONF_INTX_DEASSERT, 0x1);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  390  }
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  391  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27 @392  static void dra7xx_pcie_raise_msi_irq(struct dra7xx_pcie *dra7xx,
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  393  				      u8 interrupt_num)
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  394  {
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  395  	u32 reg;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  396  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  397  	reg = (interrupt_num - 1) << MSI_VECTOR_SHIFT;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  398  	reg |= MSI_REQ_GRANT;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  399  	dra7xx_pcie_writel(dra7xx, PCIECTRL_TI_CONF_MSI_XMT, reg);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  400  }
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  401  
16093362d66ac2 drivers/pci/dwc/pci-dra7xx.c            Bjorn Helgaas          2018-02-01 @402  static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
74955cb8ccc385 drivers/pci/controller/dwc/pci-dra7xx.c Damien Le Moal         2023-11-22  403  				 unsigned int type, u16 interrupt_num)
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  404  {
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  405  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  406  	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  407  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  408  	switch (type) {
74955cb8ccc385 drivers/pci/controller/dwc/pci-dra7xx.c Damien Le Moal         2023-11-22  409  	case PCI_IRQ_INTX:
c5d973a07bb141 drivers/pci/controller/dwc/pci-dra7xx.c Damien Le Moal         2023-11-22  410  		dra7xx_pcie_raise_intx_irq(dra7xx);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  411  		break;
74955cb8ccc385 drivers/pci/controller/dwc/pci-dra7xx.c Damien Le Moal         2023-11-22  412  	case PCI_IRQ_MSI:
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  413  		dra7xx_pcie_raise_msi_irq(dra7xx, interrupt_num);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  414  		break;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  415  	default:
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  416  		dev_err(pci->dev, "UNKNOWN IRQ type\n");
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  417  	}
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  418  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  419  	return 0;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  420  }
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  421  

:::::: The code at line 223 was first introduced by commit
:::::: 60b3c27fb9b92b8b55cd8bdcc444c3f7cb556652 PCI: dwc: Rename struct pcie_port to dw_pcie_rp

:::::: TO: Serge Semin <Sergey.Semin@baikalelectronics.ru>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
