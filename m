Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2DD23A3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 07:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678865729; x=1710401729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YwNOluGUr6TAzIfDknULahapktFFr2Qc8bNi1e8kNj8=;
  b=DLIJGquJTIQAMwH76+4b598Kxuk5euRbKpEAjTVSxsCYu383BsmlSPRz
   Q+qhvRT+4eWdS6CmGJy8izsC1ihXu6d5LM7mwqx7s+TrwYraOpRyZI1vw
   +Q6ge0nXxvXLmMHHaDh1RewF/lnqOYwWVJuDu5YabV59G1UFV33U6IAqX
   j6DCA1VgauEkZMSxl++mnRJiyUQ5UCD4A3tzlmwlN/dvXHUqoS2mASE1U
   YgdQltgzgn3frl/7wwPW3btDwwIqyg+x/0r2UYBjUaGQTEZgAP1Ihid3q
   zueA1bS3nIxqpT1nHo1EJGfOsly+1eySztKWJ6KnsOV5Ifk7loDxHw+Pr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="321478399"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="321478399"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 00:35:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="853506490"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="853506490"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Mar 2023 00:35:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcLfR-0007WJ-0e;
	Wed, 15 Mar 2023 07:35:25 +0000
Date: Wed, 15 Mar 2023 15:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [linux-stable-rc:queue/5.10 77/85]
 drivers/usb/host/fhci-hcd.c:697:24: error: 'NO_IRQ' undeclared; did you mean
 'do_IRQ'?
Message-ID: <202303151512.vgAzDv9e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
head:   bb0818a7908bae8863a2ea628dd3fc43a9cdd702
commit: 4a3c7e913d4c3cdde0c38f5a51bf1bffa7aa2778 [77/85] powerpc: Check !irq instead of irq == NO_IRQ and remove NO_IRQ
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230315/202303151512.vgAzDv9e-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=4a3c7e913d4c3cdde0c38f5a51bf1bffa7aa2778
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.10
        git checkout 4a3c7e913d4c3cdde0c38f5a51bf1bffa7aa2778
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash M=drivers/usb/host

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303151512.vgAzDv9e-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/host/fhci-hcd.c: In function 'of_fhci_probe':
>> drivers/usb/host/fhci-hcd.c:697:24: error: 'NO_IRQ' undeclared (first use in this function); did you mean 'do_IRQ'?
     697 |         if (usb_irq == NO_IRQ) {
         |                        ^~~~~~
         |                        do_IRQ
   drivers/usb/host/fhci-hcd.c:697:24: note: each undeclared identifier is reported only once for each function it appears in


vim +697 drivers/usb/host/fhci-hcd.c

236dd4d18f293e Anton Vorontsov           2009-01-10  560  
41ac7b3ab7fe1d Bill Pemberton            2012-11-19  561  static int of_fhci_probe(struct platform_device *ofdev)
236dd4d18f293e Anton Vorontsov           2009-01-10  562  {
236dd4d18f293e Anton Vorontsov           2009-01-10  563  	struct device *dev = &ofdev->dev;
61c7a080a5a061 Grant Likely              2010-04-13  564  	struct device_node *node = dev->of_node;
236dd4d18f293e Anton Vorontsov           2009-01-10  565  	struct usb_hcd *hcd;
236dd4d18f293e Anton Vorontsov           2009-01-10  566  	struct fhci_hcd *fhci;
236dd4d18f293e Anton Vorontsov           2009-01-10  567  	struct resource usb_regs;
236dd4d18f293e Anton Vorontsov           2009-01-10  568  	unsigned long pram_addr;
236dd4d18f293e Anton Vorontsov           2009-01-10  569  	unsigned int usb_irq;
236dd4d18f293e Anton Vorontsov           2009-01-10  570  	const char *sprop;
236dd4d18f293e Anton Vorontsov           2009-01-10  571  	const u32 *iprop;
236dd4d18f293e Anton Vorontsov           2009-01-10  572  	int size;
236dd4d18f293e Anton Vorontsov           2009-01-10  573  	int ret;
236dd4d18f293e Anton Vorontsov           2009-01-10  574  	int i;
236dd4d18f293e Anton Vorontsov           2009-01-10  575  	int j;
236dd4d18f293e Anton Vorontsov           2009-01-10  576  
236dd4d18f293e Anton Vorontsov           2009-01-10  577  	if (usb_disabled())
236dd4d18f293e Anton Vorontsov           2009-01-10  578  		return -ENODEV;
236dd4d18f293e Anton Vorontsov           2009-01-10  579  
236dd4d18f293e Anton Vorontsov           2009-01-10  580  	sprop = of_get_property(node, "mode", NULL);
236dd4d18f293e Anton Vorontsov           2009-01-10  581  	if (sprop && strcmp(sprop, "host"))
236dd4d18f293e Anton Vorontsov           2009-01-10  582  		return -ENODEV;
236dd4d18f293e Anton Vorontsov           2009-01-10  583  
6866ac9db02ac1 Sachin Sant               2009-02-16  584  	hcd = usb_create_hcd(&fhci_driver, dev, dev_name(dev));
236dd4d18f293e Anton Vorontsov           2009-01-10  585  	if (!hcd) {
236dd4d18f293e Anton Vorontsov           2009-01-10  586  		dev_err(dev, "could not create hcd\n");
236dd4d18f293e Anton Vorontsov           2009-01-10  587  		return -ENOMEM;
236dd4d18f293e Anton Vorontsov           2009-01-10  588  	}
236dd4d18f293e Anton Vorontsov           2009-01-10  589  
236dd4d18f293e Anton Vorontsov           2009-01-10  590  	fhci = hcd_to_fhci(hcd);
236dd4d18f293e Anton Vorontsov           2009-01-10  591  	hcd->self.controller = dev;
236dd4d18f293e Anton Vorontsov           2009-01-10  592  	dev_set_drvdata(dev, hcd);
236dd4d18f293e Anton Vorontsov           2009-01-10  593  
236dd4d18f293e Anton Vorontsov           2009-01-10  594  	iprop = of_get_property(node, "hub-power-budget", &size);
236dd4d18f293e Anton Vorontsov           2009-01-10  595  	if (iprop && size == sizeof(*iprop))
236dd4d18f293e Anton Vorontsov           2009-01-10  596  		hcd->power_budget = *iprop;
236dd4d18f293e Anton Vorontsov           2009-01-10  597  
236dd4d18f293e Anton Vorontsov           2009-01-10  598  	/* FHCI registers. */
236dd4d18f293e Anton Vorontsov           2009-01-10  599  	ret = of_address_to_resource(node, 0, &usb_regs);
236dd4d18f293e Anton Vorontsov           2009-01-10  600  	if (ret) {
236dd4d18f293e Anton Vorontsov           2009-01-10  601  		dev_err(dev, "could not get regs\n");
236dd4d18f293e Anton Vorontsov           2009-01-10  602  		goto err_regs;
236dd4d18f293e Anton Vorontsov           2009-01-10  603  	}
236dd4d18f293e Anton Vorontsov           2009-01-10  604  
28f65c11f2ffb3 Joe Perches               2011-06-09  605  	hcd->regs = ioremap(usb_regs.start, resource_size(&usb_regs));
236dd4d18f293e Anton Vorontsov           2009-01-10  606  	if (!hcd->regs) {
236dd4d18f293e Anton Vorontsov           2009-01-10  607  		dev_err(dev, "could not ioremap regs\n");
236dd4d18f293e Anton Vorontsov           2009-01-10  608  		ret = -ENOMEM;
236dd4d18f293e Anton Vorontsov           2009-01-10  609  		goto err_regs;
236dd4d18f293e Anton Vorontsov           2009-01-10  610  	}
236dd4d18f293e Anton Vorontsov           2009-01-10  611  	fhci->regs = hcd->regs;
236dd4d18f293e Anton Vorontsov           2009-01-10  612  
236dd4d18f293e Anton Vorontsov           2009-01-10  613  	/* Parameter RAM. */
236dd4d18f293e Anton Vorontsov           2009-01-10  614  	iprop = of_get_property(node, "reg", &size);
236dd4d18f293e Anton Vorontsov           2009-01-10  615  	if (!iprop || size < sizeof(*iprop) * 4) {
236dd4d18f293e Anton Vorontsov           2009-01-10  616  		dev_err(dev, "can't get pram offset\n");
236dd4d18f293e Anton Vorontsov           2009-01-10  617  		ret = -EINVAL;
236dd4d18f293e Anton Vorontsov           2009-01-10  618  		goto err_pram;
236dd4d18f293e Anton Vorontsov           2009-01-10  619  	}
236dd4d18f293e Anton Vorontsov           2009-01-10  620  
39eb4ed556c145 Joakim Tjernlund          2011-08-23  621  	pram_addr = cpm_muram_alloc(FHCI_PRAM_SIZE, 64);
236dd4d18f293e Anton Vorontsov           2009-01-10  622  	if (IS_ERR_VALUE(pram_addr)) {
236dd4d18f293e Anton Vorontsov           2009-01-10  623  		dev_err(dev, "failed to allocate usb pram\n");
236dd4d18f293e Anton Vorontsov           2009-01-10  624  		ret = -ENOMEM;
236dd4d18f293e Anton Vorontsov           2009-01-10  625  		goto err_pram;
236dd4d18f293e Anton Vorontsov           2009-01-10  626  	}
39eb4ed556c145 Joakim Tjernlund          2011-08-23  627  
39eb4ed556c145 Joakim Tjernlund          2011-08-23  628  	qe_issue_cmd(QE_ASSIGN_PAGE_TO_DEVICE, QE_CR_SUBBLOCK_USB,
39eb4ed556c145 Joakim Tjernlund          2011-08-23  629  		     QE_CR_PROTOCOL_UNSPECIFIED, pram_addr);
236dd4d18f293e Anton Vorontsov           2009-01-10  630  	fhci->pram = cpm_muram_addr(pram_addr);
236dd4d18f293e Anton Vorontsov           2009-01-10  631  
236dd4d18f293e Anton Vorontsov           2009-01-10  632  	/* GPIOs and pins */
236dd4d18f293e Anton Vorontsov           2009-01-10  633  	for (i = 0; i < NUM_GPIOS; i++) {
236dd4d18f293e Anton Vorontsov           2009-01-10  634  		int gpio;
236dd4d18f293e Anton Vorontsov           2009-01-10  635  		enum of_gpio_flags flags;
236dd4d18f293e Anton Vorontsov           2009-01-10  636  
236dd4d18f293e Anton Vorontsov           2009-01-10  637  		gpio = of_get_gpio_flags(node, i, &flags);
236dd4d18f293e Anton Vorontsov           2009-01-10  638  		fhci->gpios[i] = gpio;
236dd4d18f293e Anton Vorontsov           2009-01-10  639  		fhci->alow_gpios[i] = flags & OF_GPIO_ACTIVE_LOW;
236dd4d18f293e Anton Vorontsov           2009-01-10  640  
236dd4d18f293e Anton Vorontsov           2009-01-10  641  		if (!gpio_is_valid(gpio)) {
236dd4d18f293e Anton Vorontsov           2009-01-10  642  			if (i < GPIO_SPEED) {
236dd4d18f293e Anton Vorontsov           2009-01-10  643  				dev_err(dev, "incorrect GPIO%d: %d\n",
236dd4d18f293e Anton Vorontsov           2009-01-10  644  					i, gpio);
236dd4d18f293e Anton Vorontsov           2009-01-10  645  				goto err_gpios;
236dd4d18f293e Anton Vorontsov           2009-01-10  646  			} else {
236dd4d18f293e Anton Vorontsov           2009-01-10  647  				dev_info(dev, "assuming board doesn't have "
236dd4d18f293e Anton Vorontsov           2009-01-10  648  					"%s gpio\n", i == GPIO_SPEED ?
236dd4d18f293e Anton Vorontsov           2009-01-10  649  					"speed" : "power");
236dd4d18f293e Anton Vorontsov           2009-01-10  650  				continue;
236dd4d18f293e Anton Vorontsov           2009-01-10  651  			}
236dd4d18f293e Anton Vorontsov           2009-01-10  652  		}
236dd4d18f293e Anton Vorontsov           2009-01-10  653  
6866ac9db02ac1 Sachin Sant               2009-02-16  654  		ret = gpio_request(gpio, dev_name(dev));
236dd4d18f293e Anton Vorontsov           2009-01-10  655  		if (ret) {
236dd4d18f293e Anton Vorontsov           2009-01-10  656  			dev_err(dev, "failed to request gpio %d", i);
236dd4d18f293e Anton Vorontsov           2009-01-10  657  			goto err_gpios;
236dd4d18f293e Anton Vorontsov           2009-01-10  658  		}
236dd4d18f293e Anton Vorontsov           2009-01-10  659  
236dd4d18f293e Anton Vorontsov           2009-01-10  660  		if (i >= GPIO_SPEED) {
236dd4d18f293e Anton Vorontsov           2009-01-10  661  			ret = gpio_direction_output(gpio, 0);
236dd4d18f293e Anton Vorontsov           2009-01-10  662  			if (ret) {
236dd4d18f293e Anton Vorontsov           2009-01-10  663  				dev_err(dev, "failed to set gpio %d as "
236dd4d18f293e Anton Vorontsov           2009-01-10  664  					"an output\n", i);
236dd4d18f293e Anton Vorontsov           2009-01-10  665  				i++;
236dd4d18f293e Anton Vorontsov           2009-01-10  666  				goto err_gpios;
236dd4d18f293e Anton Vorontsov           2009-01-10  667  			}
236dd4d18f293e Anton Vorontsov           2009-01-10  668  		}
236dd4d18f293e Anton Vorontsov           2009-01-10  669  	}
236dd4d18f293e Anton Vorontsov           2009-01-10  670  
236dd4d18f293e Anton Vorontsov           2009-01-10  671  	for (j = 0; j < NUM_PINS; j++) {
61c7a080a5a061 Grant Likely              2010-04-13  672  		fhci->pins[j] = qe_pin_request(node, j);
236dd4d18f293e Anton Vorontsov           2009-01-10  673  		if (IS_ERR(fhci->pins[j])) {
236dd4d18f293e Anton Vorontsov           2009-01-10  674  			ret = PTR_ERR(fhci->pins[j]);
236dd4d18f293e Anton Vorontsov           2009-01-10  675  			dev_err(dev, "can't get pin %d: %d\n", j, ret);
236dd4d18f293e Anton Vorontsov           2009-01-10  676  			goto err_pins;
236dd4d18f293e Anton Vorontsov           2009-01-10  677  		}
236dd4d18f293e Anton Vorontsov           2009-01-10  678  	}
236dd4d18f293e Anton Vorontsov           2009-01-10  679  
236dd4d18f293e Anton Vorontsov           2009-01-10  680  	/* Frame limit timer and its interrupt. */
236dd4d18f293e Anton Vorontsov           2009-01-10  681  	fhci->timer = gtm_get_timer16();
236dd4d18f293e Anton Vorontsov           2009-01-10  682  	if (IS_ERR(fhci->timer)) {
236dd4d18f293e Anton Vorontsov           2009-01-10  683  		ret = PTR_ERR(fhci->timer);
236dd4d18f293e Anton Vorontsov           2009-01-10  684  		dev_err(dev, "failed to request qe timer: %i", ret);
236dd4d18f293e Anton Vorontsov           2009-01-10  685  		goto err_get_timer;
236dd4d18f293e Anton Vorontsov           2009-01-10  686  	}
236dd4d18f293e Anton Vorontsov           2009-01-10  687  
236dd4d18f293e Anton Vorontsov           2009-01-10  688  	ret = request_irq(fhci->timer->irq, fhci_frame_limit_timer_irq,
b5dd18d8747010 Yong Zhang                2011-09-07  689  			  0, "qe timer (usb)", hcd);
236dd4d18f293e Anton Vorontsov           2009-01-10  690  	if (ret) {
236dd4d18f293e Anton Vorontsov           2009-01-10  691  		dev_err(dev, "failed to request timer irq");
236dd4d18f293e Anton Vorontsov           2009-01-10  692  		goto err_timer_irq;
236dd4d18f293e Anton Vorontsov           2009-01-10  693  	}
236dd4d18f293e Anton Vorontsov           2009-01-10  694  
236dd4d18f293e Anton Vorontsov           2009-01-10  695  	/* USB Host interrupt. */
236dd4d18f293e Anton Vorontsov           2009-01-10  696  	usb_irq = irq_of_parse_and_map(node, 0);
236dd4d18f293e Anton Vorontsov           2009-01-10 @697  	if (usb_irq == NO_IRQ) {
236dd4d18f293e Anton Vorontsov           2009-01-10  698  		dev_err(dev, "could not get usb irq\n");
236dd4d18f293e Anton Vorontsov           2009-01-10  699  		ret = -EINVAL;
236dd4d18f293e Anton Vorontsov           2009-01-10  700  		goto err_usb_irq;
236dd4d18f293e Anton Vorontsov           2009-01-10  701  	}
236dd4d18f293e Anton Vorontsov           2009-01-10  702  
236dd4d18f293e Anton Vorontsov           2009-01-10  703  	/* Clocks. */
236dd4d18f293e Anton Vorontsov           2009-01-10  704  	sprop = of_get_property(node, "fsl,fullspeed-clock", NULL);
236dd4d18f293e Anton Vorontsov           2009-01-10  705  	if (sprop) {
236dd4d18f293e Anton Vorontsov           2009-01-10  706  		fhci->fullspeed_clk = qe_clock_source(sprop);
236dd4d18f293e Anton Vorontsov           2009-01-10  707  		if (fhci->fullspeed_clk == QE_CLK_DUMMY) {
236dd4d18f293e Anton Vorontsov           2009-01-10  708  			dev_err(dev, "wrong fullspeed-clock\n");
236dd4d18f293e Anton Vorontsov           2009-01-10  709  			ret = -EINVAL;
236dd4d18f293e Anton Vorontsov           2009-01-10  710  			goto err_clocks;
236dd4d18f293e Anton Vorontsov           2009-01-10  711  		}
236dd4d18f293e Anton Vorontsov           2009-01-10  712  	}
236dd4d18f293e Anton Vorontsov           2009-01-10  713  
236dd4d18f293e Anton Vorontsov           2009-01-10  714  	sprop = of_get_property(node, "fsl,lowspeed-clock", NULL);
236dd4d18f293e Anton Vorontsov           2009-01-10  715  	if (sprop) {
236dd4d18f293e Anton Vorontsov           2009-01-10  716  		fhci->lowspeed_clk = qe_clock_source(sprop);
236dd4d18f293e Anton Vorontsov           2009-01-10  717  		if (fhci->lowspeed_clk == QE_CLK_DUMMY) {
236dd4d18f293e Anton Vorontsov           2009-01-10  718  			dev_err(dev, "wrong lowspeed-clock\n");
236dd4d18f293e Anton Vorontsov           2009-01-10  719  			ret = -EINVAL;
236dd4d18f293e Anton Vorontsov           2009-01-10  720  			goto err_clocks;
236dd4d18f293e Anton Vorontsov           2009-01-10  721  		}
236dd4d18f293e Anton Vorontsov           2009-01-10  722  	}
236dd4d18f293e Anton Vorontsov           2009-01-10  723  
236dd4d18f293e Anton Vorontsov           2009-01-10  724  	if (fhci->fullspeed_clk == QE_CLK_NONE &&
236dd4d18f293e Anton Vorontsov           2009-01-10  725  			fhci->lowspeed_clk == QE_CLK_NONE) {
236dd4d18f293e Anton Vorontsov           2009-01-10  726  		dev_err(dev, "no clocks specified\n");
236dd4d18f293e Anton Vorontsov           2009-01-10  727  		ret = -EINVAL;
236dd4d18f293e Anton Vorontsov           2009-01-10  728  		goto err_clocks;
236dd4d18f293e Anton Vorontsov           2009-01-10  729  	}
236dd4d18f293e Anton Vorontsov           2009-01-10  730  
236dd4d18f293e Anton Vorontsov           2009-01-10  731  	dev_info(dev, "at 0x%p, irq %d\n", hcd->regs, usb_irq);
236dd4d18f293e Anton Vorontsov           2009-01-10  732  
236dd4d18f293e Anton Vorontsov           2009-01-10  733  	fhci_config_transceiver(fhci, FHCI_PORT_POWER_OFF);
236dd4d18f293e Anton Vorontsov           2009-01-10  734  
236dd4d18f293e Anton Vorontsov           2009-01-10  735  	/* Start with full-speed, if possible. */
236dd4d18f293e Anton Vorontsov           2009-01-10  736  	if (fhci->fullspeed_clk != QE_CLK_NONE) {
236dd4d18f293e Anton Vorontsov           2009-01-10  737  		fhci_config_transceiver(fhci, FHCI_PORT_FULL);
236dd4d18f293e Anton Vorontsov           2009-01-10  738  		qe_usb_clock_set(fhci->fullspeed_clk, USB_CLOCK);
236dd4d18f293e Anton Vorontsov           2009-01-10  739  	} else {
236dd4d18f293e Anton Vorontsov           2009-01-10  740  		fhci_config_transceiver(fhci, FHCI_PORT_LOW);
236dd4d18f293e Anton Vorontsov           2009-01-10  741  		qe_usb_clock_set(fhci->lowspeed_clk, USB_CLOCK >> 3);
236dd4d18f293e Anton Vorontsov           2009-01-10  742  	}
236dd4d18f293e Anton Vorontsov           2009-01-10  743  
236dd4d18f293e Anton Vorontsov           2009-01-10  744  	/* Clear and disable any pending interrupts. */
cf61fdb944534f Guilherme Maciel Ferreira 2012-06-23  745  	out_be16(&fhci->regs->usb_usber, 0xffff);
cf61fdb944534f Guilherme Maciel Ferreira 2012-06-23  746  	out_be16(&fhci->regs->usb_usbmr, 0);
236dd4d18f293e Anton Vorontsov           2009-01-10  747  
b5dd18d8747010 Yong Zhang                2011-09-07  748  	ret = usb_add_hcd(hcd, usb_irq, 0);
236dd4d18f293e Anton Vorontsov           2009-01-10  749  	if (ret < 0)
236dd4d18f293e Anton Vorontsov           2009-01-10  750  		goto err_add_hcd;
236dd4d18f293e Anton Vorontsov           2009-01-10  751  
3c9740a117d40a Peter Chen                2013-11-05  752  	device_wakeup_enable(hcd->self.controller);
3c9740a117d40a Peter Chen                2013-11-05  753  
236dd4d18f293e Anton Vorontsov           2009-01-10  754  	fhci_dfs_create(fhci);
236dd4d18f293e Anton Vorontsov           2009-01-10  755  
236dd4d18f293e Anton Vorontsov           2009-01-10  756  	return 0;
236dd4d18f293e Anton Vorontsov           2009-01-10  757  
236dd4d18f293e Anton Vorontsov           2009-01-10  758  err_add_hcd:
236dd4d18f293e Anton Vorontsov           2009-01-10  759  err_clocks:
236dd4d18f293e Anton Vorontsov           2009-01-10  760  	irq_dispose_mapping(usb_irq);
236dd4d18f293e Anton Vorontsov           2009-01-10  761  err_usb_irq:
236dd4d18f293e Anton Vorontsov           2009-01-10  762  	free_irq(fhci->timer->irq, hcd);
236dd4d18f293e Anton Vorontsov           2009-01-10  763  err_timer_irq:
236dd4d18f293e Anton Vorontsov           2009-01-10  764  	gtm_put_timer16(fhci->timer);
236dd4d18f293e Anton Vorontsov           2009-01-10  765  err_get_timer:
236dd4d18f293e Anton Vorontsov           2009-01-10  766  err_pins:
236dd4d18f293e Anton Vorontsov           2009-01-10  767  	while (--j >= 0)
236dd4d18f293e Anton Vorontsov           2009-01-10  768  		qe_pin_free(fhci->pins[j]);
236dd4d18f293e Anton Vorontsov           2009-01-10  769  err_gpios:
236dd4d18f293e Anton Vorontsov           2009-01-10  770  	while (--i >= 0) {
236dd4d18f293e Anton Vorontsov           2009-01-10  771  		if (gpio_is_valid(fhci->gpios[i]))
236dd4d18f293e Anton Vorontsov           2009-01-10  772  			gpio_free(fhci->gpios[i]);
236dd4d18f293e Anton Vorontsov           2009-01-10  773  	}
236dd4d18f293e Anton Vorontsov           2009-01-10  774  	cpm_muram_free(pram_addr);
236dd4d18f293e Anton Vorontsov           2009-01-10  775  err_pram:
236dd4d18f293e Anton Vorontsov           2009-01-10  776  	iounmap(hcd->regs);
236dd4d18f293e Anton Vorontsov           2009-01-10  777  err_regs:
236dd4d18f293e Anton Vorontsov           2009-01-10  778  	usb_put_hcd(hcd);
236dd4d18f293e Anton Vorontsov           2009-01-10  779  	return ret;
236dd4d18f293e Anton Vorontsov           2009-01-10  780  }
236dd4d18f293e Anton Vorontsov           2009-01-10  781  

:::::: The code at line 697 was first introduced by commit
:::::: 236dd4d18f293e3c9798f35c08272196826a980d USB: Driver for Freescale QUICC Engine USB Host Controller

:::::: TO: Anton Vorontsov <avorontsov@ru.mvista.com>
:::::: CC: Greg Kroah-Hartman <gregkh@kvm.kroah.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
