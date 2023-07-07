Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487A81876
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 04:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688703173; x=1720239173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6OpUPwwUncVMomghvhXKwMvvHPM/4RocCy2Juqg1z9k=;
  b=gJZlZwcciIWpqAGxCIQ5kgleIg+WoiPlNVLGD9+L2DsrZmlPcip8SCAx
   /XSGIxpJF/peqKAAZSQZR2fFilsA8LZkidOAtrwSo6+PFR14ir3N1bucE
   +UPq/cLs/MzoGN2M/e4kt8Tmh0BNvzB3iv4dNPthPHBh8R5znexrBMo41
   z9UiL9jWD0OsTRJWMk6QVWUlX5gwqFSiMyFYtcL93g8/kc1/Z70XMRWVY
   1xv4yAHDFSzAervxcVJ9wDuC3f8ft2T8WJlrrD8R9UOKRbE/GBiFTuRYU
   K7GvQLbwVYMobvKhdPUjVtKhwIlidb8Pg009iuU4zHbV/Rw2q5a/tVRML
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="362663787"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="362663787"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 21:12:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="966480561"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="966480561"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Jul 2023 21:12:51 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHcpu-0001kU-0T;
	Fri, 07 Jul 2023 04:12:50 +0000
Date: Fri, 7 Jul 2023 12:12:29 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-xvuart-host-driver 3/3]
 drivers/soc/aspeed/aspeed-host-bmc-dev.c:189:9: error: implicit declaration
 of function 'pci_release_region'; did you mean 'pci_release_regions'?
Message-ID: <202307071239.pQHSvVlN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-xvuart-host-driver
head:   8384d7b383c2aff772d5503ddddd8a938e48c43f
commit: 8384d7b383c2aff772d5503ddddd8a938e48c43f [3/3] soc/aspeed: Add BMC host driver
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230707/202307071239.pQHSvVlN-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071239.pQHSvVlN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071239.pQHSvVlN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/aspeed/aspeed-host-bmc-dev.c: In function 'aspeed_pci_host_bmc_device_probe':
>> drivers/soc/aspeed/aspeed-host-bmc-dev.c:189:9: error: implicit declaration of function 'pci_release_region'; did you mean 'pci_release_regions'? [-Werror=implicit-function-declaration]
     189 |         pci_release_region(pdev, 1);
         |         ^~~~~~~~~~~~~~~~~~
         |         pci_release_regions
   cc1: some warnings being treated as errors


vim +189 drivers/soc/aspeed/aspeed-host-bmc-dev.c

    75	
    76	#define BMC_MSI_IDX_BASE	4
    77	static int aspeed_pci_host_bmc_device_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
    78	{
    79		struct uart_8250_port uart[VUART_MAX_PARMS];
    80		struct aspeed_pci_bmc_dev *pci_bmc_dev;
    81		struct device *dev = &pdev->dev;
    82		u16 config_cmd_val;
    83		int nr_entries;
    84		int rc = 0;
    85		int i = 0;
    86	
    87		pr_info("ASPEED BMC PCI ID %04x:%04x, IRQ=%u\n", pdev->vendor, pdev->device, pdev->irq);
    88	
    89		pci_bmc_dev = kzalloc(sizeof(*pci_bmc_dev), GFP_KERNEL);
    90		if (!pci_bmc_dev) {
    91			rc = -ENOMEM;
    92			dev_err(&pdev->dev, "kmalloc() returned NULL memory.\n");
    93			goto out_err;
    94		}
    95	
    96		rc = pci_enable_device(pdev);
    97		if (rc != 0) {
    98			dev_err(&pdev->dev, "pci_enable_device() returned error %d\n", rc);
    99			goto out_err;
   100		}
   101	
   102		/* set PCI host mastering  */
   103		pci_set_master(pdev);
   104	
   105		nr_entries = pci_alloc_irq_vectors(pdev, 1, BMC_MULTI_MSI,
   106					PCI_IRQ_MSIX | PCI_IRQ_MSI);
   107		if (nr_entries < 0) {
   108			pr_info("ASPEED BMC using legacy IRQs\n");
   109			pci_bmc_dev->legacy_irq = 1;
   110			pci_read_config_word(pdev, PCI_COMMAND, &config_cmd_val);
   111			config_cmd_val &= ~PCI_COMMAND_INTX_DISABLE;
   112			pci_write_config_word((struct pci_dev *)pdev, PCI_COMMAND, config_cmd_val);
   113	
   114		} else {
   115			pr_info("ASPEED BMC using MSI IRQs\n");
   116			pci_bmc_dev->legacy_irq = 0;
   117			pci_read_config_word(pdev, PCI_COMMAND, &config_cmd_val);
   118			config_cmd_val |= PCI_COMMAND_INTX_DISABLE;
   119			pci_write_config_word((struct pci_dev *)pdev, PCI_COMMAND, config_cmd_val);
   120			pdev->irq = pci_irq_vector(pdev, BMC_MSI_IDX_BASE);
   121		}
   122	
   123		pr_info("ASPEED BMC PCI ID %04x:%04x, IRQ=%u\n", pdev->vendor, pdev->device, pdev->irq);
   124	
   125		//Get MEM bar
   126		pci_bmc_dev->mem_bar_base = pci_resource_start(pdev, 0);
   127		pci_bmc_dev->mem_bar_size = pci_resource_len(pdev, 0);
   128	
   129		pr_info("BAR0 I/O Mapped Base Address is: %08lx End %08lx\n", pci_bmc_dev->mem_bar_base, pci_bmc_dev->mem_bar_size);
   130	
   131		pci_bmc_dev->mem_bar_reg = pci_ioremap_bar(pdev, 0);
   132		if (!pci_bmc_dev->mem_bar_reg) {
   133			rc = -ENOMEM;
   134			goto out_free0;
   135		}
   136	
   137	    //Get MSG BAR info
   138		pci_bmc_dev->message_bar_base = pci_resource_start(pdev, 1);
   139		pci_bmc_dev->message_bar_size = pci_resource_len(pdev, 1);
   140	
   141		pr_info("MSG BAR1 Memory Mapped Base Address is: %08lx End %08lx\n", pci_bmc_dev->message_bar_base, pci_bmc_dev->message_bar_size);
   142	
   143		pci_bmc_dev->msg_bar_reg = pci_ioremap_bar(pdev, 1);
   144		if (!pci_bmc_dev->msg_bar_reg) {
   145			rc = -ENOMEM;
   146			goto out_free1;
   147		}
   148	
   149		/* ERRTA40: dummy read */
   150		(void)__raw_readl((void __iomem *)pci_bmc_dev->msg_bar_reg);
   151	
   152		pci_set_drvdata(pdev, pci_bmc_dev);
   153	
   154		/* setup VUART */
   155		memset(uart, 0, sizeof(uart));
   156	
   157		for (i = 0; i < VUART_MAX_PARMS; i++) {
   158			pr_info("ASPEED BMC setting up VUART%d\n", i);
   159	
   160			vuart_ioport[i] = 0x3F8 - (i * 0x100);
   161			vuart_sirq[i] = 0x10 + 4 - i - BMC_MSI_IDX_BASE;
   162			uart[i].port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ;
   163			uart[i].port.uartclk = 115200 * 16;
   164	
   165			if (pci_bmc_dev->legacy_irq)
   166				uart[i].port.irq = pdev->irq;
   167			else
   168				uart[i].port.irq = pci_irq_vector(pdev, vuart_sirq[i]);
   169			uart[i].port.dev = &pdev->dev;
   170			uart[i].port.iotype = UPIO_MEM32;
   171			uart[i].port.iobase = 0;
   172			uart[i].port.mapbase = pci_bmc_dev->message_bar_base + (vuart_ioport[i] << 2);
   173			uart[i].port.membase = 0;
   174			uart[i].port.type = PORT_16550A;
   175			uart[i].port.flags |= (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE);
   176			uart[i].port.regshift = 2;
   177	
   178			rc = serial8250_register_8250_port(&uart[i]);
   179			if (rc < 0) {
   180				dev_err(dev, "cannot setup VUART@%xh over PCIe, rc=%d\n", vuart_ioport[i], rc);
   181				goto out_unreg;
   182			}
   183		}
   184	
   185		return 0;
   186	
   187	out_unreg:
   188	out_free1:
 > 189		pci_release_region(pdev, 1);
   190	out_free0:
   191		pci_release_region(pdev, 0);
   192		kfree(pci_bmc_dev);
   193	out_err:
   194		pci_disable_device(pdev);
   195	
   196		return rc;
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
