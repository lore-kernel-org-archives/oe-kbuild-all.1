Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BFBFBEC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMqdkrgy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698489801; x=1730025801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ITMy4qAvgv8oR36rXCQpeBEf5+Nif0aUJvRzUhK/QKA=;
  b=NMqdkrgyGX+nLeYsmiyBaiaDb213PnPpPNHzYtML3GnX1JG5JaGGbcdl
   ixvT4aC/RUymAQYnBTcBFKexbbyPRSWv8icY0NitQD3Gd4aPJnmVhu4vL
   voIG5Z9gaLTKoKlw2GwB0+s2EQeRaz8ys6T6a803B2ZUnn/nXgj/uGPGQ
   oFXw/8J6MxZpuTMjviVliXyTVZdaWb1H2yuAUblL2b3MzzAC3S5qYau9u
   NhEIDjbqYDwDD46W8bSFrp+EbbSse8apTxGPot+XJrkmA7Ox0YnyKFX1W
   hRBxBB0CtsIi6wVjRqPWyGQUEWiJbLpGTL6eOFSGQSZfKovJTfAV/3id7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="390754632"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="390754632"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 03:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="850490999"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="850490999"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Oct 2023 03:43:19 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwgmj-000Bfj-0e;
	Sat, 28 Oct 2023 10:43:17 +0000
Date: Sat, 28 Oct 2023 18:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Haibo Xu <haibo1.xu@intel.com>
Subject: [avpatel:riscv_acpi_b2_v2 97/102]
 drivers/irqchip/irq-sifive-plic.c:442:17: error: implicit declaration of
 function 'acpi_get_plic_nr_contexts'
Message-ID: <202310281813.KL2yMEMU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v2
head:   2240a0f7255cc50372fa4cf3ebdb9e7db3da1256
commit: c48941bfe5fd28f41ecc58bb2a335735f7581764 [97/102] irqchip: irq-sifive-plic: Add ACPI support
config: riscv-randconfig-001-20231028 (https://download.01.org/0day-ci/archive/20231028/202310281813.KL2yMEMU-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310281813.KL2yMEMU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310281813.KL2yMEMU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-sifive-plic.c: In function 'plic_parse_nr_irqs_and_contexts':
>> drivers/irqchip/irq-sifive-plic.c:442:17: error: implicit declaration of function 'acpi_get_plic_nr_contexts' [-Werror=implicit-function-declaration]
     442 |                 acpi_get_plic_nr_contexts(plic->id, nr_contexts);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-sifive-plic.c: In function 'plic_parse_context_parent_hwirq':
>> drivers/irqchip/irq-sifive-plic.c:481:22: error: implicit declaration of function 'acpi_get_ext_intc_parent_hartid' [-Werror=implicit-function-declaration]
     481 |                 rc = acpi_get_ext_intc_parent_hartid(id, context, parent_hartid);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-sifive-plic.c: In function 'plic_probe':
>> drivers/irqchip/irq-sifive-plic.c:636:30: error: implicit declaration of function 'acpi_get_plic_context' [-Werror=implicit-function-declaration]
     636 |                         rc = acpi_get_plic_context(priv->id, i, &context_id);
         |                              ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/acpi_get_plic_nr_contexts +442 drivers/irqchip/irq-sifive-plic.c

   425	
   426	static int plic_parse_nr_irqs_and_contexts(struct platform_device *pdev,
   427						   u32 *nr_irqs, u32 *nr_contexts,
   428						   u32 *gsi_base, u32 *id)
   429	{
   430		struct device *dev = &pdev->dev;
   431		struct acpi_madt_plic *plic;
   432		int rc;
   433	
   434		if (!is_of_node(dev->fwnode)) {
   435			plic = *(struct acpi_madt_plic **)dev_get_platdata(dev);
   436			if (!plic) {
   437				dev_err(dev, "PLIC platform data is NULL!\n");
   438				return -EINVAL;
   439			}
   440	
   441			*nr_irqs = plic->num_irqs;
 > 442			acpi_get_plic_nr_contexts(plic->id, nr_contexts);
   443			if (WARN_ON(!*nr_contexts)) {
   444				dev_err(dev, "no PLIC context available\n");
   445				return -EINVAL;
   446			}
   447	
   448			*gsi_base = plic->gsi_base;
   449			*id = plic->id;
   450			return 0;
   451		}
   452	
   453		rc = of_property_read_u32(to_of_node(dev->fwnode),
   454					  "riscv,ndev", nr_irqs);
   455		if (rc) {
   456			dev_err(dev, "riscv,ndev property not available\n");
   457			return rc;
   458		}
   459	
   460		*nr_contexts = of_irq_count(to_of_node(dev->fwnode));
   461		if (WARN_ON(!(*nr_contexts))) {
   462			dev_err(dev, "no PLIC context available\n");
   463			return -EINVAL;
   464		}
   465	
   466		*gsi_base = 0;
   467		*id = 0;
   468	
   469		return 0;
   470	}
   471	
   472	static int plic_parse_context_parent_hwirq(struct platform_device *pdev,
   473						   u32 context, u32 id, u32 *parent_hwirq,
   474						   unsigned long *parent_hartid)
   475	{
   476		struct device *dev = &pdev->dev;
   477		struct of_phandle_args parent;
   478		int rc;
   479	
   480		if (!is_of_node(dev->fwnode)) {
 > 481			rc = acpi_get_ext_intc_parent_hartid(id, context, parent_hartid);
   482			if (rc)
   483				return rc;
   484	
   485			*parent_hwirq = RV_IRQ_EXT;
   486			return 0;
   487		}
   488	
   489		rc = of_irq_parse_one(to_of_node(dev->fwnode), context, &parent);
   490		if (rc)
   491			return rc;
   492	
   493		rc = riscv_of_parent_hartid(parent.np, parent_hartid);
   494		if (rc)
   495			return rc;
   496	
   497		*parent_hwirq = parent.args[0];
   498		return 0;
   499	}
   500	
   501	#ifdef CONFIG_ACPI
   502	
   503	LIST_HEAD(plic_list);
   504	struct plic_priv_list {
   505		struct plic_priv *priv;
   506		struct list_head list;
   507	};
   508	
   509	struct fwnode_handle *plic_get_gsi_domain_id(u32 gsi)
   510	{
   511		struct plic_priv_list *plic_element;
   512		struct list_head *i, *tmp;
   513	
   514		/* Find the PLIC that manages this GSI. */
   515		list_for_each_safe(i, tmp, &plic_list) {
   516			plic_element = list_entry(i, struct plic_priv_list, list);
   517			if (gsi >= plic_element->priv->gsi_base &&
   518			    gsi <= (plic_element->priv->gsi_base + plic_element->priv->nr_irqs))
   519				return plic_element->priv->dev->fwnode;
   520		}
   521	
   522		return NULL;
   523	}
   524	
   525	#endif
   526	
   527	static int plic_probe(struct platform_device *pdev)
   528	{
   529		int rc, nr_contexts, nr_handlers = 0, i, cpu;
   530		unsigned long plic_quirks = 0, hartid;
   531		struct device *dev = &pdev->dev;
   532		struct plic_handler *handler;
   533		u32 nr_irqs, parent_hwirq;
   534		struct irq_domain *domain;
   535		struct plic_priv *priv;
   536		irq_hw_number_t hwirq;
   537		struct resource *res;
   538		int id, context_id;
   539		bool cpuhp_setup;
   540		u32 gsi_base;
   541	
   542		if (is_of_node(dev->fwnode)) {
   543			const struct of_device_id *id;
   544	
   545			id = of_match_node(plic_match, to_of_node(dev->fwnode));
   546			if (id)
   547				plic_quirks = (unsigned long)id->data;
   548		}
   549	
   550		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   551		if (!priv)
   552			return -ENOMEM;
   553		priv->dev = dev;
   554		priv->plic_quirks = plic_quirks;
   555	
   556		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   557		if (!res) {
   558			dev_err(dev, "failed to get MMIO resource\n");
   559			return -EINVAL;
   560		}
   561		priv->regs = devm_ioremap(dev, res->start, resource_size(res));
   562		if (!priv->regs) {
   563			dev_err(dev, "failed map MMIO registers\n");
   564			return -EIO;
   565		}
   566	
   567		rc = plic_parse_nr_irqs_and_contexts(pdev, &nr_irqs, &nr_contexts, &gsi_base, &id);
   568		if (rc) {
   569			dev_err(dev, "failed to parse irqs and contexts\n");
   570			return rc;
   571		}
   572		priv->nr_irqs = nr_irqs;
   573		priv->gsi_base = gsi_base;
   574		priv->id = id;
   575	
   576		priv->prio_save = devm_bitmap_zalloc(dev, nr_irqs, GFP_KERNEL);
   577		if (!priv->prio_save)
   578			return -ENOMEM;
   579	
   580		for (i = 0; i < nr_contexts; i++) {
   581			rc = plic_parse_context_parent_hwirq(pdev, i, priv->id,
   582							     &parent_hwirq, &hartid);
   583			if (rc) {
   584				dev_warn(dev, "hwirq for context%d not found\n", i);
   585				continue;
   586			}
   587	
   588			/*
   589			 * Skip contexts other than external interrupts for our
   590			 * privilege level.
   591			 */
   592			if (parent_hwirq != RV_IRQ_EXT) {
   593				/* Disable S-mode enable bits if running in M-mode. */
   594				if (IS_ENABLED(CONFIG_RISCV_M_MODE)) {
   595					void __iomem *enable_base = priv->regs +
   596						CONTEXT_ENABLE_BASE +
   597						i * CONTEXT_ENABLE_SIZE;
   598	
   599					for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
   600						__plic_toggle(enable_base, hwirq, 0);
   601				}
   602				continue;
   603			}
   604	
   605			cpu = riscv_hartid_to_cpuid(hartid);
   606			if (cpu < 0) {
   607				dev_warn(dev, "Invalid cpuid for context %d\n", i);
   608				continue;
   609			}
   610	
   611			/* Find parent domain and register chained handler */
   612			domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(),
   613							  DOMAIN_BUS_ANY);
   614			if (!plic_parent_irq && domain) {
   615				plic_parent_irq = irq_create_mapping(domain, RV_IRQ_EXT);
   616				if (plic_parent_irq)
   617					irq_set_chained_handler(plic_parent_irq,
   618								plic_handle_irq);
   619			}
   620	
   621			/*
   622			 * When running in M-mode we need to ignore the S-mode handler.
   623			 * Here we assume it always comes later, but that might be a
   624			 * little fragile.
   625			 */
   626			handler = per_cpu_ptr(&plic_handlers, cpu);
   627			if (handler->present) {
   628				dev_warn(dev, "handler already present for context%d.\n", i);
   629				plic_set_threshold(handler, PLIC_DISABLE_THRESHOLD);
   630				goto done;
   631			}
   632	
   633			if (is_of_node(dev->fwnode)) {
   634				context_id = i;
   635			} else {
 > 636				rc = acpi_get_plic_context(priv->id, i, &context_id);
   637				if (rc) {
   638					dev_warn(dev, "invalid context id for context%d\n", i);
   639					continue;
   640				}
   641			}
   642	
   643			cpumask_set_cpu(cpu, &priv->lmask);
   644			handler->present = true;
   645			handler->hart_base = priv->regs + CONTEXT_BASE +
   646				context_id * CONTEXT_SIZE;
   647			raw_spin_lock_init(&handler->enable_lock);
   648			handler->enable_base = priv->regs + CONTEXT_ENABLE_BASE +
   649				context_id * CONTEXT_ENABLE_SIZE;
   650			handler->priv = priv;
   651	
   652			handler->enable_save =  devm_kcalloc(dev,
   653							DIV_ROUND_UP(nr_irqs, 32),
   654							sizeof(*handler->enable_save),
   655							GFP_KERNEL);
   656			if (!handler->enable_save)
   657				return -ENOMEM;
   658	
   659	done:
   660			for (hwirq = 1; hwirq <= nr_irqs; hwirq++) {
   661				plic_toggle(handler, hwirq, 0);
   662				writel(1, priv->regs + PRIORITY_BASE +
   663					  hwirq * PRIORITY_PER_ID);
   664			}
   665			nr_handlers++;
   666		}
   667	
   668		priv->irqdomain = irq_domain_create_linear(dev->fwnode, nr_irqs + 1,
   669							   &plic_irqdomain_ops, priv);
   670		if (WARN_ON(!priv->irqdomain))
   671			return -ENOMEM;
   672	
   673		/*
   674		 * We can have multiple PLIC instances so setup cpuhp state
   675		 * and register syscore operations only after context handlers
   676		 * of all online CPUs are initialized.
   677		 */
   678		cpuhp_setup = true;
   679		for_each_online_cpu(cpu) {
   680			handler = per_cpu_ptr(&plic_handlers, cpu);
   681			if (!handler->present) {
   682				cpuhp_setup = false;
   683				break;
   684			}
   685		}
   686		if (cpuhp_setup) {
   687			cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
   688					  "irqchip/sifive/plic:starting",
   689					  plic_starting_cpu, plic_dying_cpu);
   690			register_syscore_ops(&plic_irq_syscore_ops);
   691		}
   692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
