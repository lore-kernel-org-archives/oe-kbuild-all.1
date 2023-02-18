Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8873A4A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 18:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676746693; x=1708282693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dKzCtCI530VXezyR1Rmih4IfS6I7zrhgtaAmBROOiHY=;
  b=f4WjE0pYQAOToyQoS4tT5uHpKYZCT+ilV6vY9nHRWKggCrxnhEUQ4Kxh
   tKNQxDiFT0mXZGgZ3XCyi0VLlaIBWMH8G0yVxI76bYNtXPQJVRPfSdXSt
   hseiWZRI1x9an2vtQONvjoLT5mzAxVugmKSXJleHz1oiDgvFFyzQF7JuZ
   dMNlpEnMDWtoPKtpDlN5A3Mzl5OeZlZnUnX2Q3dYKg8vflkydiXx3SrX2
   h37xUcWX6QlehfZusU0+CMvDfCBO1Dm29jEf2N8+ze4NHSX5kKXGeMgYQ
   LiBIoAZjn8KfMby2liLvF7lzDyD4DJByRKnpdwNmU6ySp/FXWF0anRNGj
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="311825615"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="311825615"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 10:58:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="844915788"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="844915788"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Feb 2023 10:58:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTSPS-000Cf3-0j;
	Sat, 18 Feb 2023 18:58:10 +0000
Date: Sun, 19 Feb 2023 02:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [atishp04:dev/atishp/kvm_aptee_guest_rfc 15/109]
 drivers/irqchip/irq-riscv-imsic.c:541:9: error: unknown type name
 'msi_alloc_info_t'
Message-ID: <202302190239.5s4EvY0y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anup,

FYI, the error/warning still remains.

tree:   https://github.com/atishp04/linux dev/atishp/kvm_aptee_guest_rfc
head:   adf357593cff6780e32553a751d6cb7bb88dd6a6
commit: 50aead96bc64e93b2826b32c080b5d100218d160 [15/109] irqchip: Add RISC-V incoming MSI controller driver
config: riscv-randconfig-r014-20230219 (https://download.01.org/0day-ci/archive/20230219/202302190239.5s4EvY0y-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/50aead96bc64e93b2826b32c080b5d100218d160
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 dev/atishp/kvm_aptee_guest_rfc
        git checkout 50aead96bc64e93b2826b32c080b5d100218d160
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302190239.5s4EvY0y-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/irqchip/irq-riscv-imsic.c: In function 'imsic_irq_domain_alloc':
>> drivers/irqchip/irq-riscv-imsic.c:541:9: error: unknown type name 'msi_alloc_info_t'
     541 |         msi_alloc_info_t *info = args;
         |         ^~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-riscv-imsic.c:559:41: error: request for member 'desc' in something not a structure or union
     559 |         err = iommu_dma_prepare_msi(info->desc, msi_addr);
         |                                         ^~
   drivers/irqchip/irq-riscv-imsic.c: At top level:
>> drivers/irqchip/irq-riscv-imsic.c:632:15: error: variable 'imsic_plat_domain_ops' has initializer but incomplete type
     632 | static struct msi_domain_ops imsic_plat_domain_ops = {
         |               ^~~~~~~~~~~~~~
>> drivers/irqchip/irq-riscv-imsic.c:635:15: error: variable 'imsic_plat_domain_info' has initializer but incomplete type
     635 | static struct msi_domain_info imsic_plat_domain_info = {
         |               ^~~~~~~~~~~~~~~
>> drivers/irqchip/irq-riscv-imsic.c:636:10: error: 'struct msi_domain_info' has no member named 'flags'
     636 |         .flags  = (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS),
         |          ^~~~~
>> drivers/irqchip/irq-riscv-imsic.c:636:20: error: 'MSI_FLAG_USE_DEF_DOM_OPS' undeclared here (not in a function)
     636 |         .flags  = (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS),
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-riscv-imsic.c:636:47: error: 'MSI_FLAG_USE_DEF_CHIP_OPS' undeclared here (not in a function)
     636 |         .flags  = (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS),
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-riscv-imsic.c:636:19: warning: excess elements in struct initializer
     636 |         .flags  = (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS),
         |                   ^
   drivers/irqchip/irq-riscv-imsic.c:636:19: note: (near initialization for 'imsic_plat_domain_info')
>> drivers/irqchip/irq-riscv-imsic.c:637:10: error: 'struct msi_domain_info' has no member named 'ops'
     637 |         .ops    = &imsic_plat_domain_ops,
         |          ^~~
   drivers/irqchip/irq-riscv-imsic.c:637:19: warning: excess elements in struct initializer
     637 |         .ops    = &imsic_plat_domain_ops,
         |                   ^
   drivers/irqchip/irq-riscv-imsic.c:637:19: note: (near initialization for 'imsic_plat_domain_info')
>> drivers/irqchip/irq-riscv-imsic.c:638:10: error: 'struct msi_domain_info' has no member named 'chip'
     638 |         .chip   = &imsic_plat_irq_chip,
         |          ^~~~
   drivers/irqchip/irq-riscv-imsic.c:638:19: warning: excess elements in struct initializer
     638 |         .chip   = &imsic_plat_irq_chip,
         |                   ^
   drivers/irqchip/irq-riscv-imsic.c:638:19: note: (near initialization for 'imsic_plat_domain_info')
   drivers/irqchip/irq-riscv-imsic.c: In function 'imsic_irq_domains_init':
>> drivers/irqchip/irq-riscv-imsic.c:666:29: error: implicit declaration of function 'platform_msi_create_irq_domain' [-Werror=implicit-function-declaration]
     666 |         priv->plat_domain = platform_msi_create_irq_domain(fwnode,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-riscv-imsic.c:666:27: warning: assignment to 'struct irq_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     666 |         priv->plat_domain = platform_msi_create_irq_domain(fwnode,
         |                           ^
   drivers/irqchip/irq-riscv-imsic.c: At top level:
>> drivers/irqchip/irq-riscv-imsic.c:632:30: error: storage size of 'imsic_plat_domain_ops' isn't known
     632 | static struct msi_domain_ops imsic_plat_domain_ops = {
         |                              ^~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-riscv-imsic.c:635:31: error: storage size of 'imsic_plat_domain_info' isn't known
     635 | static struct msi_domain_info imsic_plat_domain_info = {
         |                               ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/msi_alloc_info_t +541 drivers/irqchip/irq-riscv-imsic.c

   534	
   535	static int imsic_irq_domain_alloc(struct irq_domain *domain,
   536					  unsigned int virq,
   537					  unsigned int nr_irqs,
   538					  void *args)
   539	{
   540		struct imsic_priv *priv = domain->host_data;
 > 541		msi_alloc_info_t *info = args;
   542		phys_addr_t msi_addr;
   543		int i, hwirq, err = 0;
   544		unsigned int cpu;
   545	
   546		err = imsic_get_cpu(priv, &priv->lmask, false, &cpu);
   547		if (err)
   548			return err;
   549	
   550		err = imsic_cpu_page_phys(cpu, 0, &msi_addr);
   551		if (err)
   552			return err;
   553	
   554		hwirq = imsic_ids_alloc(priv, priv->global.nr_ids,
   555					get_count_order(nr_irqs));
   556		if (hwirq < 0)
   557			return hwirq;
   558	
 > 559		err = iommu_dma_prepare_msi(info->desc, msi_addr);
   560		if (err)
   561			goto fail;
   562	
   563		for (i = 0; i < nr_irqs; i++) {
   564			imsic_id_set_target(priv, hwirq + i, cpu);
   565			irq_domain_set_info(domain, virq + i, hwirq + i,
   566					    &imsic_irq_base_chip, priv,
   567					    handle_simple_irq, NULL, NULL);
   568			irq_set_noprobe(virq + i);
   569			irq_set_affinity(virq + i, &priv->lmask);
   570		}
   571	
   572		return 0;
   573	
   574	fail:
   575		imsic_ids_free(priv, hwirq, get_count_order(nr_irqs));
   576		return err;
   577	}
   578	
   579	static void imsic_irq_domain_free(struct irq_domain *domain,
   580					  unsigned int virq,
   581					  unsigned int nr_irqs)
   582	{
   583		struct irq_data *d = irq_domain_get_irq_data(domain, virq);
   584		struct imsic_priv *priv = domain->host_data;
   585	
   586		imsic_ids_free(priv, d->hwirq, get_count_order(nr_irqs));
   587		irq_domain_free_irqs_parent(domain, virq, nr_irqs);
   588	}
   589	
   590	static const struct irq_domain_ops imsic_base_domain_ops = {
   591		.alloc		= imsic_irq_domain_alloc,
   592		.free		= imsic_irq_domain_free,
   593	};
   594	
   595	#ifdef CONFIG_RISCV_IMSIC_PCI
   596	
   597	static void imsic_pci_mask_irq(struct irq_data *d)
   598	{
   599		pci_msi_mask_irq(d);
   600		irq_chip_mask_parent(d);
   601	}
   602	
   603	static void imsic_pci_unmask_irq(struct irq_data *d)
   604	{
   605		pci_msi_unmask_irq(d);
   606		irq_chip_unmask_parent(d);
   607	}
   608	
   609	static struct irq_chip imsic_pci_irq_chip = {
   610		.name			= "RISC-V IMSIC-PCI",
   611		.irq_mask		= imsic_pci_mask_irq,
   612		.irq_unmask		= imsic_pci_unmask_irq,
   613		.irq_eoi		= irq_chip_eoi_parent,
   614	};
   615	
   616	static struct msi_domain_ops imsic_pci_domain_ops = {
   617	};
   618	
   619	static struct msi_domain_info imsic_pci_domain_info = {
   620		.flags	= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
   621			   MSI_FLAG_PCI_MSIX | MSI_FLAG_MULTI_PCI_MSI),
   622		.ops	= &imsic_pci_domain_ops,
   623		.chip	= &imsic_pci_irq_chip,
   624	};
   625	
   626	#endif
   627	
   628	static struct irq_chip imsic_plat_irq_chip = {
   629		.name			= "RISC-V IMSIC-PLAT",
   630	};
   631	
 > 632	static struct msi_domain_ops imsic_plat_domain_ops = {
   633	};
   634	
 > 635	static struct msi_domain_info imsic_plat_domain_info = {
 > 636		.flags	= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS),
 > 637		.ops	= &imsic_plat_domain_ops,
 > 638		.chip	= &imsic_plat_irq_chip,
   639	};
   640	
   641	static int __init imsic_irq_domains_init(struct imsic_priv *priv,
   642						 struct fwnode_handle *fwnode)
   643	{
   644		/* Create Base IRQ domain */
   645		priv->base_domain = irq_domain_create_tree(fwnode,
   646							&imsic_base_domain_ops, priv);
   647		if (!priv->base_domain) {
   648			pr_err("Failed to create IMSIC base domain\n");
   649			return -ENOMEM;
   650		}
   651		irq_domain_update_bus_token(priv->base_domain, DOMAIN_BUS_NEXUS);
   652	
   653	#ifdef CONFIG_RISCV_IMSIC_PCI
   654		/* Create PCI MSI domain */
   655		priv->pci_domain = pci_msi_create_irq_domain(fwnode,
   656							&imsic_pci_domain_info,
   657							priv->base_domain);
   658		if (!priv->pci_domain) {
   659			pr_err("Failed to create IMSIC PCI domain\n");
   660			irq_domain_remove(priv->base_domain);
   661			return -ENOMEM;
   662		}
   663	#endif
   664	
   665		/* Create Platform MSI domain */
 > 666		priv->plat_domain = platform_msi_create_irq_domain(fwnode,
   667							&imsic_plat_domain_info,
   668							priv->base_domain);
   669		if (!priv->plat_domain) {
   670			pr_err("Failed to create IMSIC platform domain\n");
   671			if (priv->pci_domain)
   672				irq_domain_remove(priv->pci_domain);
   673			irq_domain_remove(priv->base_domain);
   674			return -ENOMEM;
   675		}
   676	
   677		return 0;
   678	}
   679	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
