Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AE6398
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 10:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690023505; x=1721559505;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PkjtRmfzyuOEJWl7IRwsucSXfsr50n6THJe/xrxywGM=;
  b=HxcpNLWASKQdq8B+xuFSxY0AgAxI3/y3jzY4y784qWw7kSvNOUKJYK95
   zlv7sJ1OmrS3fKa6qtHDzto+/evSrwcoDcbh57H+RBsSZ43KS5krWeOn9
   nO/eFeEaehR2NImuc5cPb3GTsfO4pIpYMhnRDJ4U1G9NmHbfLhiM3Bqkm
   RpfbfIfRy6K8l1ubunMuCYgyyugx0o29whukVmFIHVirNX5anzDUceu4k
   AlwP7+oi11jtBTgUYgv5PZnBAy2WchpJSztytAxO/nQi28HkqNGzcWbF2
   BV7sJJrmjWvkvhmylc9LNi7EFhPjWzua7vqQC+F4esCVyt+qQGXFRarXT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="398078692"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="398078692"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 03:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="838852018"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="838852018"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2023 03:58:23 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNAJa-0008GR-1V;
	Sat, 22 Jul 2023 10:58:22 +0000
Date: Sat, 22 Jul 2023 18:57:41 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 104/106] arch/powerpc/sysdev/fsl_msi.c:396:36:
 error: unused variable 'match'
Message-ID: <202307221837.rZLv6Wh3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   7beaa9a181711c2419017fa2a75c70fef24991f5
commit: 02f7b4ddcae35ec8925995b6d2774e2b0efbe5ca [104/106] Use of_device_get_match_data
config: powerpc-randconfig-r091-20230721 (https://download.01.org/0day-ci/archive/20230722/202307221837.rZLv6Wh3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221837.rZLv6Wh3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221837.rZLv6Wh3-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/sysdev/fsl_msi.c: In function 'fsl_of_msi_probe':
>> arch/powerpc/sysdev/fsl_msi.c:396:36: error: unused variable 'match' [-Werror=unused-variable]
     396 |         const struct of_device_id *match;
         |                                    ^~~~~
   cc1: all warnings being treated as errors


vim +/match +396 arch/powerpc/sysdev/fsl_msi.c

6820fead714d57 Scott Wood         2011-01-17  392  
b1608d69cb804e Grant Likely       2011-05-18  393  static const struct of_device_id fsl_of_msi_ids[];
cad5cef62a5a0c Greg Kroah-Hartman 2012-12-21  394  static int fsl_of_msi_probe(struct platform_device *dev)
34e36c1541fe70 Jason Jin          2008-05-23  395  {
b1608d69cb804e Grant Likely       2011-05-18 @396  	const struct of_device_id *match;
34e36c1541fe70 Jason Jin          2008-05-23  397  	struct fsl_msi *msi;
f31dd9443afd35 Minghuan Lian      2013-06-21  398  	struct resource res, msiir;
6820fead714d57 Scott Wood         2011-01-17  399  	int err, i, j, irq_index, count;
34e36c1541fe70 Jason Jin          2008-05-23  400  	const u32 *p;
f318f1d75b9bdc Uwe Kleine-König   2012-05-21  401  	const struct fsl_msi_feature *features;
061ca4adfb2e3c Li Yang            2010-04-22  402  	int len;
061ca4adfb2e3c Li Yang            2010-04-22  403  	u32 offset;
00e25397032f59 Daniel Axtens      2015-04-14  404  	struct pci_controller *phb;
34e36c1541fe70 Jason Jin          2008-05-23  405  
02f7b4ddcae35e Rob Herring        2023-07-14  406  	features = of_device_get_match_data(&dev->dev);
000061245a6797 Grant Likely       2011-02-22  407  
34e36c1541fe70 Jason Jin          2008-05-23  408  	printk(KERN_DEBUG "Setting up Freescale MSI support\n");
34e36c1541fe70 Jason Jin          2008-05-23  409  
34e36c1541fe70 Jason Jin          2008-05-23  410  	msi = kzalloc(sizeof(struct fsl_msi), GFP_KERNEL);
34e36c1541fe70 Jason Jin          2008-05-23  411  	if (!msi) {
34e36c1541fe70 Jason Jin          2008-05-23  412  		dev_err(&dev->dev, "No memory for MSI structure\n");
480599933a69a8 Li Yang            2010-04-22  413  		return -ENOMEM;
34e36c1541fe70 Jason Jin          2008-05-23  414  	}
6c4c82e20a1b47 Milton Miller      2011-05-10  415  	platform_set_drvdata(dev, msi);
34e36c1541fe70 Jason Jin          2008-05-23  416  
a8db8cf0d894df Grant Likely       2012-02-14  417  	msi->irqhost = irq_domain_add_linear(dev->dev.of_node,
f31dd9443afd35 Minghuan Lian      2013-06-21  418  				      NR_MSI_IRQS_MAX, &fsl_msi_host_ops, msi);
611cd90c91494d Michael Ellerman   2008-08-06  419  
34e36c1541fe70 Jason Jin          2008-05-23  420  	if (msi->irqhost == NULL) {
34e36c1541fe70 Jason Jin          2008-05-23  421  		dev_err(&dev->dev, "No memory for MSI irqhost\n");
34e36c1541fe70 Jason Jin          2008-05-23  422  		err = -ENOMEM;
34e36c1541fe70 Jason Jin          2008-05-23  423  		goto error_out;
34e36c1541fe70 Jason Jin          2008-05-23  424  	}
34e36c1541fe70 Jason Jin          2008-05-23  425  
446bc1ffe4f2ca Timur Tabi         2011-12-13  426  	/*
446bc1ffe4f2ca Timur Tabi         2011-12-13  427  	 * Under the Freescale hypervisor, the msi nodes don't have a 'reg'
446bc1ffe4f2ca Timur Tabi         2011-12-13  428  	 * property.  Instead, we use hypercalls to access the MSI.
446bc1ffe4f2ca Timur Tabi         2011-12-13  429  	 */
446bc1ffe4f2ca Timur Tabi         2011-12-13  430  	if ((features->fsl_pic_ip & FSL_PIC_IP_MASK) != FSL_PIC_IP_VMPIC) {
61c7a080a5a061 Grant Likely       2010-04-13  431  		err = of_address_to_resource(dev->dev.of_node, 0, &res);
34e36c1541fe70 Jason Jin          2008-05-23  432  		if (err) {
b7c670d673d118 Rob Herring        2017-08-21  433  			dev_err(&dev->dev, "invalid resource for node %pOF\n",
b7c670d673d118 Rob Herring        2017-08-21  434  				dev->dev.of_node);
34e36c1541fe70 Jason Jin          2008-05-23  435  			goto error_out;
34e36c1541fe70 Jason Jin          2008-05-23  436  		}
34e36c1541fe70 Jason Jin          2008-05-23  437  
28f65c11f2ffb3 Joe Perches        2011-06-09  438  		msi->msi_regs = ioremap(res.start, resource_size(&res));
34e36c1541fe70 Jason Jin          2008-05-23  439  		if (!msi->msi_regs) {
b53804c7025800 Liu Shuo           2012-03-08  440  			err = -ENOMEM;
b7c670d673d118 Rob Herring        2017-08-21  441  			dev_err(&dev->dev, "could not map node %pOF\n",
b7c670d673d118 Rob Herring        2017-08-21  442  				dev->dev.of_node);
34e36c1541fe70 Jason Jin          2008-05-23  443  			goto error_out;
34e36c1541fe70 Jason Jin          2008-05-23  444  		}
446bc1ffe4f2ca Timur Tabi         2011-12-13  445  		msi->msiir_offset =
446bc1ffe4f2ca Timur Tabi         2011-12-13  446  			features->msiir_offset + (res.start & 0xfffff);
f31dd9443afd35 Minghuan Lian      2013-06-21  447  
f31dd9443afd35 Minghuan Lian      2013-06-21  448  		/*
f31dd9443afd35 Minghuan Lian      2013-06-21  449  		 * First read the MSIIR/MSIIR1 offset from dts
f31dd9443afd35 Minghuan Lian      2013-06-21  450  		 * On failure use the hardcode MSIIR offset
f31dd9443afd35 Minghuan Lian      2013-06-21  451  		 */
f31dd9443afd35 Minghuan Lian      2013-06-21  452  		if (of_address_to_resource(dev->dev.of_node, 1, &msiir))
f31dd9443afd35 Minghuan Lian      2013-06-21  453  			msi->msiir_offset = features->msiir_offset +
f31dd9443afd35 Minghuan Lian      2013-06-21  454  					    (res.start & MSIIR_OFFSET_MASK);
f31dd9443afd35 Minghuan Lian      2013-06-21  455  		else
f31dd9443afd35 Minghuan Lian      2013-06-21  456  			msi->msiir_offset = msiir.start & MSIIR_OFFSET_MASK;
446bc1ffe4f2ca Timur Tabi         2011-12-13  457  	}
34e36c1541fe70 Jason Jin          2008-05-23  458  
692d1037e6914a Anton Vorontsov    2008-05-23  459  	msi->feature = features->fsl_pic_ip;
34e36c1541fe70 Jason Jin          2008-05-23  460  
ff015659b63162 Hongtao Jia        2015-02-26  461  	/* For erratum PIC1 on MPIC version 2.0*/
ff015659b63162 Hongtao Jia        2015-02-26  462  	if ((features->fsl_pic_ip & FSL_PIC_IP_MASK) == FSL_PIC_IP_MPIC
ff015659b63162 Hongtao Jia        2015-02-26  463  			&& (fsl_mpic_primary_get_version() == 0x0200))
ff015659b63162 Hongtao Jia        2015-02-26  464  		msi->feature |= MSI_HW_ERRATA_ENDIAN;
ff015659b63162 Hongtao Jia        2015-02-26  465  
895d603f945baf Timur Tabi         2011-10-31  466  	/*
895d603f945baf Timur Tabi         2011-10-31  467  	 * Remember the phandle, so that we can match with any PCI nodes
895d603f945baf Timur Tabi         2011-10-31  468  	 * that have an "fsl,msi" property.
895d603f945baf Timur Tabi         2011-10-31  469  	 */
895d603f945baf Timur Tabi         2011-10-31  470  	msi->phandle = dev->dev.of_node->phandle;
895d603f945baf Timur Tabi         2011-10-31  471  
f8dc6eb757c335 Wei Yongjun        2013-05-07  472  	err = fsl_msi_init_allocator(msi);
f8dc6eb757c335 Wei Yongjun        2013-05-07  473  	if (err) {
34e36c1541fe70 Jason Jin          2008-05-23  474  		dev_err(&dev->dev, "Error allocating MSI bitmap\n");
34e36c1541fe70 Jason Jin          2008-05-23  475  		goto error_out;
34e36c1541fe70 Jason Jin          2008-05-23  476  	}
34e36c1541fe70 Jason Jin          2008-05-23  477  
6820fead714d57 Scott Wood         2011-01-17  478  	p = of_get_property(dev->dev.of_node, "msi-available-ranges", &len);
f31dd9443afd35 Minghuan Lian      2013-06-21  479  
67e35c3a79b734 Tudor Laurentiu    2014-08-13  480  	if (of_device_is_compatible(dev->dev.of_node, "fsl,mpic-msi-v4.3") ||
67e35c3a79b734 Tudor Laurentiu    2014-08-13  481  	    of_device_is_compatible(dev->dev.of_node, "fsl,vmpic-msi-v4.3")) {
f31dd9443afd35 Minghuan Lian      2013-06-21  482  		msi->srs_shift = MSIIR1_SRS_SHIFT;
f31dd9443afd35 Minghuan Lian      2013-06-21  483  		msi->ibs_shift = MSIIR1_IBS_SHIFT;
f31dd9443afd35 Minghuan Lian      2013-06-21  484  		if (p)
f31dd9443afd35 Minghuan Lian      2013-06-21  485  			dev_warn(&dev->dev, "%s: dose not support msi-available-ranges property\n",
f31dd9443afd35 Minghuan Lian      2013-06-21  486  				__func__);
f31dd9443afd35 Minghuan Lian      2013-06-21  487  
f31dd9443afd35 Minghuan Lian      2013-06-21  488  		for (irq_index = 0; irq_index < NR_MSI_REG_MSIIR1;
f31dd9443afd35 Minghuan Lian      2013-06-21  489  		     irq_index++) {
f31dd9443afd35 Minghuan Lian      2013-06-21  490  			err = fsl_msi_setup_hwirq(msi, dev,
f31dd9443afd35 Minghuan Lian      2013-06-21  491  						  irq_index, irq_index);
f31dd9443afd35 Minghuan Lian      2013-06-21  492  			if (err)
f31dd9443afd35 Minghuan Lian      2013-06-21  493  				goto error_out;
f31dd9443afd35 Minghuan Lian      2013-06-21  494  		}
f31dd9443afd35 Minghuan Lian      2013-06-21  495  	} else {
f31dd9443afd35 Minghuan Lian      2013-06-21  496  		static const u32 all_avail[] =
f31dd9443afd35 Minghuan Lian      2013-06-21  497  			{ 0, NR_MSI_REG_MSIIR * IRQS_PER_MSI_REG };
f31dd9443afd35 Minghuan Lian      2013-06-21  498  
f31dd9443afd35 Minghuan Lian      2013-06-21  499  		msi->srs_shift = MSIIR_SRS_SHIFT;
f31dd9443afd35 Minghuan Lian      2013-06-21  500  		msi->ibs_shift = MSIIR_IBS_SHIFT;
f31dd9443afd35 Minghuan Lian      2013-06-21  501  
6820fead714d57 Scott Wood         2011-01-17  502  		if (p && len % (2 * sizeof(u32)) != 0) {
6820fead714d57 Scott Wood         2011-01-17  503  			dev_err(&dev->dev, "%s: Malformed msi-available-ranges property\n",
6820fead714d57 Scott Wood         2011-01-17  504  				__func__);
6820fead714d57 Scott Wood         2011-01-17  505  			err = -EINVAL;
34e36c1541fe70 Jason Jin          2008-05-23  506  			goto error_out;
34e36c1541fe70 Jason Jin          2008-05-23  507  		}
6820fead714d57 Scott Wood         2011-01-17  508  
2228511833e267 Timur Tabi         2011-09-13  509  		if (!p) {
6820fead714d57 Scott Wood         2011-01-17  510  			p = all_avail;
2228511833e267 Timur Tabi         2011-09-13  511  			len = sizeof(all_avail);
2228511833e267 Timur Tabi         2011-09-13  512  		}
6820fead714d57 Scott Wood         2011-01-17  513  
6820fead714d57 Scott Wood         2011-01-17  514  		for (irq_index = 0, i = 0; i < len / (2 * sizeof(u32)); i++) {
6820fead714d57 Scott Wood         2011-01-17  515  			if (p[i * 2] % IRQS_PER_MSI_REG ||
6820fead714d57 Scott Wood         2011-01-17  516  			    p[i * 2 + 1] % IRQS_PER_MSI_REG) {
b7c670d673d118 Rob Herring        2017-08-21  517  				pr_warn("%s: %pOF: msi available range of %u at %u is not IRQ-aligned\n",
b7c670d673d118 Rob Herring        2017-08-21  518  				       __func__, dev->dev.of_node,
6820fead714d57 Scott Wood         2011-01-17  519  				       p[i * 2 + 1], p[i * 2]);
34e36c1541fe70 Jason Jin          2008-05-23  520  				err = -EINVAL;
34e36c1541fe70 Jason Jin          2008-05-23  521  				goto error_out;
34e36c1541fe70 Jason Jin          2008-05-23  522  			}
6820fead714d57 Scott Wood         2011-01-17  523  
6820fead714d57 Scott Wood         2011-01-17  524  			offset = p[i * 2] / IRQS_PER_MSI_REG;
6820fead714d57 Scott Wood         2011-01-17  525  			count = p[i * 2 + 1] / IRQS_PER_MSI_REG;
6820fead714d57 Scott Wood         2011-01-17  526  
6820fead714d57 Scott Wood         2011-01-17  527  			for (j = 0; j < count; j++, irq_index++) {
f31dd9443afd35 Minghuan Lian      2013-06-21  528  				err = fsl_msi_setup_hwirq(msi, dev, offset + j,
f31dd9443afd35 Minghuan Lian      2013-06-21  529  							  irq_index);
6820fead714d57 Scott Wood         2011-01-17  530  				if (err)
02adac6051b0ff Li Yang            2010-04-22  531  					goto error_out;
02adac6051b0ff Li Yang            2010-04-22  532  			}
34e36c1541fe70 Jason Jin          2008-05-23  533  		}
f31dd9443afd35 Minghuan Lian      2013-06-21  534  	}
34e36c1541fe70 Jason Jin          2008-05-23  535  
694a7a3611a1c0 Li Yang            2010-04-22  536  	list_add_tail(&msi->list, &msi_head);
34e36c1541fe70 Jason Jin          2008-05-23  537  
00e25397032f59 Daniel Axtens      2015-04-14  538  	/*
00e25397032f59 Daniel Axtens      2015-04-14  539  	 * Apply the MSI ops to all the controllers.
00e25397032f59 Daniel Axtens      2015-04-14  540  	 * It doesn't hurt to reassign the same ops,
00e25397032f59 Daniel Axtens      2015-04-14  541  	 * but bail out if we find another MSI driver.
00e25397032f59 Daniel Axtens      2015-04-14  542  	 */
00e25397032f59 Daniel Axtens      2015-04-14  543  	list_for_each_entry(phb, &hose_list, list_node) {
00e25397032f59 Daniel Axtens      2015-04-14  544  		if (!phb->controller_ops.setup_msi_irqs) {
00e25397032f59 Daniel Axtens      2015-04-14  545  			phb->controller_ops.setup_msi_irqs = fsl_setup_msi_irqs;
00e25397032f59 Daniel Axtens      2015-04-14  546  			phb->controller_ops.teardown_msi_irqs = fsl_teardown_msi_irqs;
00e25397032f59 Daniel Axtens      2015-04-14  547  		} else if (phb->controller_ops.setup_msi_irqs != fsl_setup_msi_irqs) {
8081881327d479 Lan Chunhe-B25806  2010-03-15  548  			dev_err(&dev->dev, "Different MSI driver already installed!\n");
8081881327d479 Lan Chunhe-B25806  2010-03-15  549  			err = -ENODEV;
8081881327d479 Lan Chunhe-B25806  2010-03-15  550  			goto error_out;
8081881327d479 Lan Chunhe-B25806  2010-03-15  551  		}
00e25397032f59 Daniel Axtens      2015-04-14  552  	}
34e36c1541fe70 Jason Jin          2008-05-23  553  	return 0;
34e36c1541fe70 Jason Jin          2008-05-23  554  error_out:
480599933a69a8 Li Yang            2010-04-22  555  	fsl_of_msi_remove(dev);
34e36c1541fe70 Jason Jin          2008-05-23  556  	return err;
34e36c1541fe70 Jason Jin          2008-05-23  557  }
34e36c1541fe70 Jason Jin          2008-05-23  558  

:::::: The code at line 396 was first introduced by commit
:::::: b1608d69cb804e414d0887140ba08a9398e4e638 drivercore: revert addition of of_match to struct device

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
