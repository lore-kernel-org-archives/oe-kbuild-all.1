Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA22F25
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 09:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678873126; x=1710409126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tDq1AVEkYWfnTb706OMEBg44g5NNmdqpRxgXGksE4zg=;
  b=kr0tQrhcQ/QZOtUxxZ+3Sepg+HLNj3/N8Dv3Af+TrhyqP4H+gctgkT34
   Fx7JmXOxdTzHkWERzK6KT2C8Y2OCO4o6COALXo6ExVltbHfDum3QcUmSi
   1O7q+SD2E90g3CyKf+GhY2xLgnDCGNigq8dKmDnvsGUFhCpcGUy0JckUX
   cnKbBdxkLip6ztZnIqNcpqUosf3BQHyE5cntCFCL32ezwLNHijoilQhBg
   2p96T0Gt/cG1dgr4ujN53q9kBtUIk46xRkTYI491jTJ911E+3oY2WTFpp
   UZbgY2/xm3Od/ND2Xu07EdIupMrfb7ZB38yJyr87pIGOHWxz7tJ6EM3I3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="321499105"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="321499105"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 02:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="679441713"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="679441713"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Mar 2023 02:38:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcNaj-0007aZ-0L;
	Wed, 15 Mar 2023 09:38:41 +0000
Date: Wed, 15 Mar 2023 17:38:19 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [linux-stable-rc:queue/5.15 107/116]
 drivers/virt/fsl_hypervisor.c:845:40: error: 'NO_IRQ' undeclared; did you
 mean 'NR_IRQS'?
Message-ID: <202303151712.DiCfP2GP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.15
head:   bd0370623a8a130cf1c0114235667f732277db32
commit: e42ff92a60a122047fd944f3e882342b858ee41f [107/116] powerpc: Check !irq instead of irq == NO_IRQ and remove NO_IRQ
config: powerpc-randconfig-r014-20230312 (https://download.01.org/0day-ci/archive/20230315/202303151712.DiCfP2GP-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=e42ff92a60a122047fd944f3e882342b858ee41f
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.15
        git checkout e42ff92a60a122047fd944f3e882342b858ee41f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/virt/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303151712.DiCfP2GP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virt/fsl_hypervisor.c: In function 'fsl_hypervisor_init':
>> drivers/virt/fsl_hypervisor.c:845:40: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'NR_IRQS'?
     845 |                 if (!handle || (irq == NO_IRQ)) {
         |                                        ^~~~~~
         |                                        NR_IRQS
   drivers/virt/fsl_hypervisor.c:845:40: note: each undeclared identifier is reported only once for each function it appears in


vim +845 drivers/virt/fsl_hypervisor.c

6db7199407ca56 Timur Tabi  2011-06-09  808  
6db7199407ca56 Timur Tabi  2011-06-09  809  /*
6db7199407ca56 Timur Tabi  2011-06-09  810   * Freescale hypervisor management driver init
6db7199407ca56 Timur Tabi  2011-06-09  811   *
6db7199407ca56 Timur Tabi  2011-06-09  812   * This function is called when this module is loaded.
6db7199407ca56 Timur Tabi  2011-06-09  813   *
6db7199407ca56 Timur Tabi  2011-06-09  814   * Register ourselves as a miscellaneous driver.  This will register the
6db7199407ca56 Timur Tabi  2011-06-09  815   * fops structure and create the right sysfs entries for udev.
6db7199407ca56 Timur Tabi  2011-06-09  816   */
6db7199407ca56 Timur Tabi  2011-06-09  817  static int __init fsl_hypervisor_init(void)
6db7199407ca56 Timur Tabi  2011-06-09  818  {
6db7199407ca56 Timur Tabi  2011-06-09  819  	struct device_node *np;
6db7199407ca56 Timur Tabi  2011-06-09  820  	struct doorbell_isr *dbisr, *n;
6db7199407ca56 Timur Tabi  2011-06-09  821  	int ret;
6db7199407ca56 Timur Tabi  2011-06-09  822  
6db7199407ca56 Timur Tabi  2011-06-09  823  	pr_info("Freescale hypervisor management driver\n");
6db7199407ca56 Timur Tabi  2011-06-09  824  
6db7199407ca56 Timur Tabi  2011-06-09  825  	if (!has_fsl_hypervisor()) {
6db7199407ca56 Timur Tabi  2011-06-09  826  		pr_info("fsl-hv: no hypervisor found\n");
6db7199407ca56 Timur Tabi  2011-06-09  827  		return -ENODEV;
6db7199407ca56 Timur Tabi  2011-06-09  828  	}
6db7199407ca56 Timur Tabi  2011-06-09  829  
6db7199407ca56 Timur Tabi  2011-06-09  830  	ret = misc_register(&fsl_hv_misc_dev);
6db7199407ca56 Timur Tabi  2011-06-09  831  	if (ret) {
6db7199407ca56 Timur Tabi  2011-06-09  832  		pr_err("fsl-hv: cannot register device\n");
6db7199407ca56 Timur Tabi  2011-06-09  833  		return ret;
6db7199407ca56 Timur Tabi  2011-06-09  834  	}
6db7199407ca56 Timur Tabi  2011-06-09  835  
6db7199407ca56 Timur Tabi  2011-06-09  836  	INIT_LIST_HEAD(&db_list);
6db7199407ca56 Timur Tabi  2011-06-09  837  	INIT_LIST_HEAD(&isr_list);
6db7199407ca56 Timur Tabi  2011-06-09  838  
6db7199407ca56 Timur Tabi  2011-06-09  839  	for_each_compatible_node(np, NULL, "epapr,hv-receive-doorbell") {
6db7199407ca56 Timur Tabi  2011-06-09  840  		unsigned int irq;
6db7199407ca56 Timur Tabi  2011-06-09  841  		const uint32_t *handle;
6db7199407ca56 Timur Tabi  2011-06-09  842  
6db7199407ca56 Timur Tabi  2011-06-09  843  		handle = of_get_property(np, "interrupts", NULL);
6db7199407ca56 Timur Tabi  2011-06-09  844  		irq = irq_of_parse_and_map(np, 0);
6db7199407ca56 Timur Tabi  2011-06-09 @845  		if (!handle || (irq == NO_IRQ)) {
55e18b18335132 Rob Herring 2017-06-06  846  			pr_err("fsl-hv: no 'interrupts' property in %pOF node\n",
55e18b18335132 Rob Herring 2017-06-06  847  				np);
6db7199407ca56 Timur Tabi  2011-06-09  848  			continue;
6db7199407ca56 Timur Tabi  2011-06-09  849  		}
6db7199407ca56 Timur Tabi  2011-06-09  850  
6db7199407ca56 Timur Tabi  2011-06-09  851  		dbisr = kzalloc(sizeof(*dbisr), GFP_KERNEL);
6db7199407ca56 Timur Tabi  2011-06-09  852  		if (!dbisr)
6db7199407ca56 Timur Tabi  2011-06-09  853  			goto out_of_memory;
6db7199407ca56 Timur Tabi  2011-06-09  854  
6db7199407ca56 Timur Tabi  2011-06-09  855  		dbisr->irq = irq;
6db7199407ca56 Timur Tabi  2011-06-09  856  		dbisr->doorbell = be32_to_cpup(handle);
6db7199407ca56 Timur Tabi  2011-06-09  857  
6db7199407ca56 Timur Tabi  2011-06-09  858  		if (of_device_is_compatible(np, "fsl,hv-shutdown-doorbell")) {
6db7199407ca56 Timur Tabi  2011-06-09  859  			/* The shutdown doorbell gets its own ISR */
6db7199407ca56 Timur Tabi  2011-06-09  860  			ret = request_irq(irq, fsl_hv_shutdown_isr, 0,
6db7199407ca56 Timur Tabi  2011-06-09  861  					  np->name, NULL);
6db7199407ca56 Timur Tabi  2011-06-09  862  		} else if (of_device_is_compatible(np,
6db7199407ca56 Timur Tabi  2011-06-09  863  			"fsl,hv-state-change-doorbell")) {
6db7199407ca56 Timur Tabi  2011-06-09  864  			/*
6db7199407ca56 Timur Tabi  2011-06-09  865  			 * The state change doorbell triggers a notification if
6db7199407ca56 Timur Tabi  2011-06-09  866  			 * the state of the managed partition changes to
6db7199407ca56 Timur Tabi  2011-06-09  867  			 * "stopped". We need a separate interrupt handler for
6db7199407ca56 Timur Tabi  2011-06-09  868  			 * that, and we also need to know the handle of the
6db7199407ca56 Timur Tabi  2011-06-09  869  			 * target partition, not just the handle of the
6db7199407ca56 Timur Tabi  2011-06-09  870  			 * doorbell.
6db7199407ca56 Timur Tabi  2011-06-09  871  			 */
6db7199407ca56 Timur Tabi  2011-06-09  872  			dbisr->partition = ret = get_parent_handle(np);
6db7199407ca56 Timur Tabi  2011-06-09  873  			if (ret < 0) {
55e18b18335132 Rob Herring 2017-06-06  874  				pr_err("fsl-hv: node %pOF has missing or "
55e18b18335132 Rob Herring 2017-06-06  875  				       "malformed parent\n", np);
6db7199407ca56 Timur Tabi  2011-06-09  876  				kfree(dbisr);
6db7199407ca56 Timur Tabi  2011-06-09  877  				continue;
6db7199407ca56 Timur Tabi  2011-06-09  878  			}
6db7199407ca56 Timur Tabi  2011-06-09  879  			ret = request_threaded_irq(irq, fsl_hv_state_change_isr,
6db7199407ca56 Timur Tabi  2011-06-09  880  						   fsl_hv_state_change_thread,
6db7199407ca56 Timur Tabi  2011-06-09  881  						   0, np->name, dbisr);
6db7199407ca56 Timur Tabi  2011-06-09  882  		} else
6db7199407ca56 Timur Tabi  2011-06-09  883  			ret = request_irq(irq, fsl_hv_isr, 0, np->name, dbisr);
6db7199407ca56 Timur Tabi  2011-06-09  884  
6db7199407ca56 Timur Tabi  2011-06-09  885  		if (ret < 0) {
55e18b18335132 Rob Herring 2017-06-06  886  			pr_err("fsl-hv: could not request irq %u for node %pOF\n",
55e18b18335132 Rob Herring 2017-06-06  887  			       irq, np);
6db7199407ca56 Timur Tabi  2011-06-09  888  			kfree(dbisr);
6db7199407ca56 Timur Tabi  2011-06-09  889  			continue;
6db7199407ca56 Timur Tabi  2011-06-09  890  		}
6db7199407ca56 Timur Tabi  2011-06-09  891  
6db7199407ca56 Timur Tabi  2011-06-09  892  		list_add(&dbisr->list, &isr_list);
6db7199407ca56 Timur Tabi  2011-06-09  893  
6db7199407ca56 Timur Tabi  2011-06-09  894  		pr_info("fsl-hv: registered handler for doorbell %u\n",
6db7199407ca56 Timur Tabi  2011-06-09  895  			dbisr->doorbell);
6db7199407ca56 Timur Tabi  2011-06-09  896  	}
6db7199407ca56 Timur Tabi  2011-06-09  897  
6db7199407ca56 Timur Tabi  2011-06-09  898  	return 0;
6db7199407ca56 Timur Tabi  2011-06-09  899  
6db7199407ca56 Timur Tabi  2011-06-09  900  out_of_memory:
6db7199407ca56 Timur Tabi  2011-06-09  901  	list_for_each_entry_safe(dbisr, n, &isr_list, list) {
6db7199407ca56 Timur Tabi  2011-06-09  902  		free_irq(dbisr->irq, dbisr);
6db7199407ca56 Timur Tabi  2011-06-09  903  		list_del(&dbisr->list);
6db7199407ca56 Timur Tabi  2011-06-09  904  		kfree(dbisr);
6db7199407ca56 Timur Tabi  2011-06-09  905  	}
6db7199407ca56 Timur Tabi  2011-06-09  906  
6db7199407ca56 Timur Tabi  2011-06-09  907  	misc_deregister(&fsl_hv_misc_dev);
6db7199407ca56 Timur Tabi  2011-06-09  908  
6db7199407ca56 Timur Tabi  2011-06-09  909  	return -ENOMEM;
6db7199407ca56 Timur Tabi  2011-06-09  910  }
6db7199407ca56 Timur Tabi  2011-06-09  911  

:::::: The code at line 845 was first introduced by commit
:::::: 6db7199407ca56f55bc0832fb124e1ad216ea57b drivers/virt: introduce Freescale hypervisor management driver

:::::: TO: Timur Tabi <timur@freescale.com>
:::::: CC: Kumar Gala <galak@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
