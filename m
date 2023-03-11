Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4517E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Mar 2023 23:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678575906; x=1710111906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZhHNFJ0sON+WLQzZJi10KE1CU5j8sqZVXUtvE/CTRdg=;
  b=IrwIsjlxW034XPXR8tdF8dvFleuUmtniwefwhFdFF5tXzhU7N5dBScqX
   tCgJmpSP57qQQ8IjdL7GSAA6VrqoiFTUsR2N+Sc1DD8XAmTZpzBUwn/AK
   hVDjvUPicZP3PpVjpybWIjKm/sQaCGK5npMDFEANq9g1A7QPOfrAHtzLg
   sXC67qDr/pPryiDoNEcfu59f19n2RXRyhoINdjSDOep7SWNxxDj8xnQtx
   TST1mMRicPSjFaHTBeF4ozlw8ehkDMSvGu+ecSEME3U+nYcH2pGrEhxrM
   Fzvdxkb/V0e1ko3OxzZLFWEDxKvcNUkhBXWarzkbNTg9tfHpUD/WbOAsg
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="336967831"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="336967831"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 15:05:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="742405763"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="742405763"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Mar 2023 15:05:04 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb8Gu-0004qS-0A;
	Sat, 11 Mar 2023 23:05:04 +0000
Date: Sun, 12 Mar 2023 07:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/test 18/18] drivers/irqchip/irq-loongson-eiointc.c:420:9:
 error: implicit declaration of function 'cpuhp_setup_state_nocalls'
Message-ID: <202303120635.INsqXWlH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/test
head:   a44acb6722672badc6478a7adf3c949e911a6deb
commit: a44acb6722672badc6478a7adf3c949e911a6deb [18/18] of_device: stop including cpu.h
config: loongarch-randconfig-r002-20230312 (https://download.01.org/0day-ci/archive/20230312/202303120635.INsqXWlH-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=a44acb6722672badc6478a7adf3c949e911a6deb
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/test
        git checkout a44acb6722672badc6478a7adf3c949e911a6deb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120635.INsqXWlH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-loongson-eiointc.c: In function 'eiointc_acpi_init':
>> drivers/irqchip/irq-loongson-eiointc.c:420:9: error: implicit declaration of function 'cpuhp_setup_state_nocalls' [-Werror=implicit-function-declaration]
     420 |         cpuhp_setup_state_nocalls(CPUHP_AP_IRQ_LOONGARCH_STARTING,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-loongson-eiointc.c:420:35: error: 'CPUHP_AP_IRQ_LOONGARCH_STARTING' undeclared (first use in this function)
     420 |         cpuhp_setup_state_nocalls(CPUHP_AP_IRQ_LOONGARCH_STARTING,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongson-eiointc.c:420:35: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/cpuhp_setup_state_nocalls +420 drivers/irqchip/irq-loongson-eiointc.c

dd281e1a1a937e Huacai Chen  2022-07-20  375  
dd281e1a1a937e Huacai Chen  2022-07-20  376  int __init eiointc_acpi_init(struct irq_domain *parent,
dd281e1a1a937e Huacai Chen  2022-07-20  377  				     struct acpi_madt_eio_pic *acpi_eiointc)
dd281e1a1a937e Huacai Chen  2022-07-20  378  {
3d12938dbc048e Huacai Chen  2022-10-20  379  	int i, ret, parent_irq;
dd281e1a1a937e Huacai Chen  2022-07-20  380  	unsigned long node_map;
dd281e1a1a937e Huacai Chen  2022-07-20  381  	struct eiointc_priv *priv;
dd281e1a1a937e Huacai Chen  2022-07-20  382  
dd281e1a1a937e Huacai Chen  2022-07-20  383  	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
dd281e1a1a937e Huacai Chen  2022-07-20  384  	if (!priv)
dd281e1a1a937e Huacai Chen  2022-07-20  385  		return -ENOMEM;
dd281e1a1a937e Huacai Chen  2022-07-20  386  
7e4fd7a1a6fdf2 Marc Zyngier 2022-08-08  387  	priv->domain_handle = irq_domain_alloc_named_id_fwnode("EIOPIC",
7e4fd7a1a6fdf2 Marc Zyngier 2022-08-08  388  							       acpi_eiointc->node);
dd281e1a1a937e Huacai Chen  2022-07-20  389  	if (!priv->domain_handle) {
dd281e1a1a937e Huacai Chen  2022-07-20  390  		pr_err("Unable to allocate domain handle\n");
dd281e1a1a937e Huacai Chen  2022-07-20  391  		goto out_free_priv;
dd281e1a1a937e Huacai Chen  2022-07-20  392  	}
dd281e1a1a937e Huacai Chen  2022-07-20  393  
dd281e1a1a937e Huacai Chen  2022-07-20  394  	priv->node = acpi_eiointc->node;
dd281e1a1a937e Huacai Chen  2022-07-20  395  	node_map = acpi_eiointc->node_map ? : -1ULL;
dd281e1a1a937e Huacai Chen  2022-07-20  396  
dd281e1a1a937e Huacai Chen  2022-07-20  397  	for_each_possible_cpu(i) {
dd281e1a1a937e Huacai Chen  2022-07-20  398  		if (node_map & (1ULL << cpu_to_eio_node(i))) {
dd281e1a1a937e Huacai Chen  2022-07-20  399  			node_set(cpu_to_eio_node(i), priv->node_map);
dd281e1a1a937e Huacai Chen  2022-07-20  400  			cpumask_or(&priv->cpuspan_map, &priv->cpuspan_map, cpumask_of(i));
dd281e1a1a937e Huacai Chen  2022-07-20  401  		}
dd281e1a1a937e Huacai Chen  2022-07-20  402  	}
dd281e1a1a937e Huacai Chen  2022-07-20  403  
dd281e1a1a937e Huacai Chen  2022-07-20  404  	/* Setup IRQ domain */
dd281e1a1a937e Huacai Chen  2022-07-20  405  	priv->eiointc_domain = irq_domain_create_linear(priv->domain_handle, VEC_COUNT,
dd281e1a1a937e Huacai Chen  2022-07-20  406  					&eiointc_domain_ops, priv);
dd281e1a1a937e Huacai Chen  2022-07-20  407  	if (!priv->eiointc_domain) {
dd281e1a1a937e Huacai Chen  2022-07-20  408  		pr_err("loongson-eiointc: cannot add IRQ domain\n");
dd281e1a1a937e Huacai Chen  2022-07-20  409  		goto out_free_handle;
dd281e1a1a937e Huacai Chen  2022-07-20  410  	}
dd281e1a1a937e Huacai Chen  2022-07-20  411  
dd281e1a1a937e Huacai Chen  2022-07-20  412  	eiointc_priv[nr_pics++] = priv;
dd281e1a1a937e Huacai Chen  2022-07-20  413  
dd281e1a1a937e Huacai Chen  2022-07-20  414  	eiointc_router_init(0);
dd281e1a1a937e Huacai Chen  2022-07-20  415  
dd281e1a1a937e Huacai Chen  2022-07-20  416  	parent_irq = irq_create_mapping(parent, acpi_eiointc->cascade);
dd281e1a1a937e Huacai Chen  2022-07-20  417  	irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch, priv);
dd281e1a1a937e Huacai Chen  2022-07-20  418  
a90335c2dfb4ff Huacai Chen  2022-10-20  419  	register_syscore_ops(&eiointc_syscore_ops);
dd281e1a1a937e Huacai Chen  2022-07-20 @420  	cpuhp_setup_state_nocalls(CPUHP_AP_IRQ_LOONGARCH_STARTING,

:::::: The code at line 420 was first introduced by commit
:::::: dd281e1a1a937ee2f13bd0db5be78e5f5b811ca7 irqchip: Add Loongson Extended I/O interrupt controller support

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
