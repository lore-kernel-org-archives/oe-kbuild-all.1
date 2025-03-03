Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7571EEA2A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 22:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741042068; cv=none; b=WCANnOIj2du+4dVvmWdnjHpnZQwQFt+hu0zWV6FeNbsH7TAwRbpz832ak02zMhE6QUXpZiAYJ7lnD4myD1BGrRxb6RFd1n4XRVUM2fOtIW37bmnotX+Gdw+6Gyb3KutFseFLDh0410+h0kT2IUqEWUR+l5I5mpGUy++jAHbVTfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741042068; c=relaxed/simple;
	bh=em8abUujTT2dmvVmxpFVeiQbJ4Mx4F4GYkhSH97xz/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FZ5ZV6jhMXXh/p33VfC1nUD6uBcxxshel98Ukt9htNv2hQuHPmfMKEg2wh+LX2RMVFMEq4SaI87VXQSG3NYsKVaRkHplJoJ86IE5Qit9fGYhhmCxVG0O1qzv5q58tTWBNxDrR5E4GW91MVCCLAhl0hSG1AB0xvK3RnmBIFnIPZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdHwE3y9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdHwE3y9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741042066; x=1772578066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=em8abUujTT2dmvVmxpFVeiQbJ4Mx4F4GYkhSH97xz/c=;
  b=CdHwE3y9Gb2PMwHtWPNPbZibii0F/3NROCSktidIhacppnrYyK3AkEEB
   gYV5A5A1UazosnvSgzIwANpJqsMNPcBeF8WIzg3AOQqY1Krok2v95tlvc
   5p7oc49ArUpdMQOI45LiXkOqx0L1gG9+6suZYJLz0upuqRVGD4xfZC9Qb
   fugC8lGgGAW30RJP+KXiBA3JKIKOv/Dn1zKCdpU0ZSanfGq9uSgCFdFrK
   VR6VPdWkUP0KhycKTpMRaIw5+hZrAFlX5xRX0BukRKc1zJAIDumCXZwiL
   XFh756JSDyb0Ak75gtpiecVBy+cQt2ZmkNVa1sdhmNu6k7vpFc8DQd0Yu
   A==;
X-CSE-ConnectionGUID: Y6vsxRAVTneuH6BrZQOwFA==
X-CSE-MsgGUID: v/P+NA41Q6CQwFJl5/iZcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="42058930"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="42058930"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 14:47:45 -0800
X-CSE-ConnectionGUID: DaY/GhiPRoSuPRsytY7oTA==
X-CSE-MsgGUID: Qh3MUMtOQASPfguyhsJyqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149096996"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Mar 2025 14:47:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpEZZ-000J0K-32;
	Mon, 03 Mar 2025 22:47:41 +0000
Date: Tue, 4 Mar 2025 06:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 59/89] drivers/irqchip/irq-renesas-rzg2l.c:578:47:
 error: passing argument 4 of 'irq_domain_create_hierarchy' from incompatible
 pointer type
Message-ID: <202503040638.Z7Qq1VS5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   2e34f839068291b65952cdcabb82b977d40d165c
commit: d6c501a336104227712b722d4549298e70ea8b02 [59/89] drop irq_domain_add_hierarchy
config: x86_64-buildonly-randconfig-003-20250304 (https://download.01.org/0day-ci/archive/20250304/202503040638.Z7Qq1VS5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503040638.Z7Qq1VS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503040638.Z7Qq1VS5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-renesas-rzg2l.c: In function 'rzg2l_irqc_common_init':
>> drivers/irqchip/irq-renesas-rzg2l.c:578:47: error: passing argument 4 of 'irq_domain_create_hierarchy' from incompatible pointer type [-Werror=incompatible-pointer-types]
     578 |                                               node, &rzg2l_irqc_domain_ops,
         |                                               ^~~~
         |                                               |
         |                                               struct device_node *
   In file included from include/linux/of_irq.h:8,
                    from include/linux/irqchip.h:17,
                    from drivers/irqchip/irq-renesas-rzg2l.c:15:
   include/linux/irqdomain.h:595:67: note: expected 'struct fwnode_handle *' but argument is of type 'struct device_node *'
     595 |                                             struct fwnode_handle *fwnode,
         |                                             ~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +/irq_domain_create_hierarchy +578 drivers/irqchip/irq-renesas-rzg2l.c

3fed09559cd8be Lad Prabhakar     2022-07-07  530  
d011c022efe275 Lad Prabhakar     2024-06-04  531  static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *parent,
d011c022efe275 Lad Prabhakar     2024-06-04  532  				  const struct irq_chip *irq_chip)
3fed09559cd8be Lad Prabhakar     2022-07-07  533  {
d038109ac1c6bf Fabrizio Castro   2024-10-11  534  	struct platform_device *pdev = of_find_device_by_node(node);
d038109ac1c6bf Fabrizio Castro   2024-10-11  535  	struct device *dev __free(put_device) = pdev ? &pdev->dev : NULL;
3fed09559cd8be Lad Prabhakar     2022-07-07  536  	struct irq_domain *irq_domain, *parent_domain;
3fed09559cd8be Lad Prabhakar     2022-07-07  537  	struct reset_control *resetn;
3fed09559cd8be Lad Prabhakar     2022-07-07  538  	int ret;
3fed09559cd8be Lad Prabhakar     2022-07-07  539  
3fed09559cd8be Lad Prabhakar     2022-07-07  540  	if (!pdev)
3fed09559cd8be Lad Prabhakar     2022-07-07  541  		return -ENODEV;
3fed09559cd8be Lad Prabhakar     2022-07-07  542  
3fed09559cd8be Lad Prabhakar     2022-07-07  543  	parent_domain = irq_find_host(parent);
4bd0317ce63c26 Fabrizio Castro   2025-02-12  544  	if (!parent_domain)
4bd0317ce63c26 Fabrizio Castro   2025-02-12  545  		return dev_err_probe(dev, -ENODEV, "cannot find parent domain\n");
3fed09559cd8be Lad Prabhakar     2022-07-07  546  
dd4e17c309445e Fabrizio Castro   2025-02-12  547  	rzg2l_irqc_data = devm_kzalloc(dev, sizeof(*rzg2l_irqc_data), GFP_KERNEL);
74d2ef5f6f4b24 Claudiu Beznea    2023-11-20  548  	if (!rzg2l_irqc_data)
3fed09559cd8be Lad Prabhakar     2022-07-07  549  		return -ENOMEM;
3fed09559cd8be Lad Prabhakar     2022-07-07  550  
d011c022efe275 Lad Prabhakar     2024-06-04  551  	rzg2l_irqc_data->irqchip = irq_chip;
d011c022efe275 Lad Prabhakar     2024-06-04  552  
dd4e17c309445e Fabrizio Castro   2025-02-12  553  	rzg2l_irqc_data->base = devm_of_iomap(dev, dev->of_node, 0, NULL);
74d2ef5f6f4b24 Claudiu Beznea    2023-11-20  554  	if (IS_ERR(rzg2l_irqc_data->base))
74d2ef5f6f4b24 Claudiu Beznea    2023-11-20  555  		return PTR_ERR(rzg2l_irqc_data->base);
3fed09559cd8be Lad Prabhakar     2022-07-07  556  
74d2ef5f6f4b24 Claudiu Beznea    2023-11-20  557  	ret = rzg2l_irqc_parse_interrupts(rzg2l_irqc_data, node);
4bd0317ce63c26 Fabrizio Castro   2025-02-12  558  	if (ret)
4bd0317ce63c26 Fabrizio Castro   2025-02-12  559  		return dev_err_probe(dev, ret, "cannot parse interrupts: %d\n", ret);
3fed09559cd8be Lad Prabhakar     2022-07-07  560  
78f384dad082af Fabrizio Castro   2025-02-12  561  	resetn = devm_reset_control_get_exclusive_deasserted(dev, NULL);
78f384dad082af Fabrizio Castro   2025-02-12  562  	if (IS_ERR(resetn)) {
4bd0317ce63c26 Fabrizio Castro   2025-02-12  563  		return dev_err_probe(dev, PTR_ERR(resetn),
4bd0317ce63c26 Fabrizio Castro   2025-02-12  564  				     "failed to acquire deasserted reset: %d\n", ret);
3fed09559cd8be Lad Prabhakar     2022-07-07  565  	}
3fed09559cd8be Lad Prabhakar     2022-07-07  566  
7de11369ef3037 Fabrizio Castro   2025-02-12  567  	ret = devm_pm_runtime_enable(dev);
0699e578e27910 Fabrizio Castro   2025-02-12  568  	if (ret)
4bd0317ce63c26 Fabrizio Castro   2025-02-12  569  		return dev_err_probe(dev, ret, "devm_pm_runtime_enable failed: %d\n", ret);
7de11369ef3037 Fabrizio Castro   2025-02-12  570  
dd4e17c309445e Fabrizio Castro   2025-02-12  571  	ret = pm_runtime_resume_and_get(dev);
0699e578e27910 Fabrizio Castro   2025-02-12  572  	if (ret)
4bd0317ce63c26 Fabrizio Castro   2025-02-12  573  		return dev_err_probe(dev, ret, "pm_runtime_resume_and_get failed: %d\n", ret);
3fed09559cd8be Lad Prabhakar     2022-07-07  574  
74d2ef5f6f4b24 Claudiu Beznea    2023-11-20  575  	raw_spin_lock_init(&rzg2l_irqc_data->lock);
3fed09559cd8be Lad Prabhakar     2022-07-07  576  
d6c501a3361042 Jiri Slaby (SUSE  2025-03-03  577) 	irq_domain = irq_domain_create_hierarchy(of_fwnode_handle(parent_domain), 0, IRQC_NUM_IRQ,
3fed09559cd8be Lad Prabhakar     2022-07-07 @578  					      node, &rzg2l_irqc_domain_ops,
74d2ef5f6f4b24 Claudiu Beznea    2023-11-20  579  					      rzg2l_irqc_data);
3fed09559cd8be Lad Prabhakar     2022-07-07  580  	if (!irq_domain) {
bec8a371294328 Fabrizio Castro   2025-02-12  581  		pm_runtime_put(dev);
4bd0317ce63c26 Fabrizio Castro   2025-02-12  582  		return dev_err_probe(dev, -ENOMEM, "failed to add irq domain\n");
3fed09559cd8be Lad Prabhakar     2022-07-07  583  	}
3fed09559cd8be Lad Prabhakar     2022-07-07  584  
74d2ef5f6f4b24 Claudiu Beznea    2023-11-20  585  	register_syscore_ops(&rzg2l_irqc_syscore_ops);
74d2ef5f6f4b24 Claudiu Beznea    2023-11-20  586  
d038109ac1c6bf Fabrizio Castro   2024-10-11  587  	/*
d038109ac1c6bf Fabrizio Castro   2024-10-11  588  	 * Prevent the cleanup function from invoking put_device by assigning
d038109ac1c6bf Fabrizio Castro   2024-10-11  589  	 * NULL to dev.
d038109ac1c6bf Fabrizio Castro   2024-10-11  590  	 *
d038109ac1c6bf Fabrizio Castro   2024-10-11  591  	 * make coccicheck will complain about missing put_device calls, but
d038109ac1c6bf Fabrizio Castro   2024-10-11  592  	 * those are false positives, as dev will be automatically "put" via
d038109ac1c6bf Fabrizio Castro   2024-10-11  593  	 * __free_put_device on the failing path.
d038109ac1c6bf Fabrizio Castro   2024-10-11  594  	 * On the successful path we don't actually want to "put" dev.
d038109ac1c6bf Fabrizio Castro   2024-10-11  595  	 */
d038109ac1c6bf Fabrizio Castro   2024-10-11  596  	dev = NULL;
d038109ac1c6bf Fabrizio Castro   2024-10-11  597  
3fed09559cd8be Lad Prabhakar     2022-07-07  598  	return 0;
3fed09559cd8be Lad Prabhakar     2022-07-07  599  }
3fed09559cd8be Lad Prabhakar     2022-07-07  600  

:::::: The code at line 578 was first introduced by commit
:::::: 3fed09559cd8be79568d368ce02bf7f2d56259b6 irqchip: Add RZ/G2L IA55 Interrupt Controller driver

:::::: TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
