Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E681CF86
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 18:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUZ+K0wM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697309008; x=1728845008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sn33WLZSPWZ40K/sayVZ+bpcYHGwIOExip/cqZcVX6Q=;
  b=IUZ+K0wMIIC1JTdRmW911cVuafZc+h+Lg5AAsCOwFC1EGKdCg7MQ/Fts
   NC1PWlzS+PJ4sJhNcGnppF2nZFsOIjo+DXp3F5NLOi41c12DNLBAe2C9f
   IDDc9mJNe1a/VgUD5i1Nysd3xLaODFlydFeLrQzRhS+pjQLTV2XXhRSJY
   7zprWf9lIP/vn2ty1SnXJ1IFK60NhX+GfC4D2UR6Yc8ZqHOB1K7kz4zOx
   m3wLETBfjONcIx+ITy3Uabvrba22cqPP//eLrsuc9irXbtbuLrNbhTsQ5
   kRGiPihFYneOKQQO4KFS4wd6wDnEr50thkLXfXpE2r0OgSvJhmVhxEw5C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416407110"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="416407110"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 11:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="784536178"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="784536178"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Oct 2023 11:43:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrjbf-0006WN-2C;
	Sat, 14 Oct 2023 18:43:23 +0000
Date: Sun, 15 Oct 2023 02:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3912/24603]
 drivers/pci/controller/dwc/pci-layerscape.c:457:13: warning:
 'ls_pcie_pm_check' defined but not used
Message-ID: <202310150233.yZgH0AhI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: dad37ae2c1c897dab943f28b4aeeb546783085fa [3912/24603] PCI: layerscape: Add power management support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310150233.yZgH0AhI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150233.yZgH0AhI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150233.yZgH0AhI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pci-layerscape.c:457:13: warning: 'ls_pcie_pm_check' defined but not used [-Wunused-function]
     457 | static bool ls_pcie_pm_check(struct ls_pcie *pcie)
         |             ^~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-layerscape.c:319:13: warning: 'ls_pcie_set_dstate' defined but not used [-Wunused-function]
     319 | static void ls_pcie_set_dstate(struct ls_pcie *pcie, u32 dstate)
         |             ^~~~~~~~~~~~~~~~~~


vim +/ls_pcie_pm_check +457 drivers/pci/controller/dwc/pci-layerscape.c

   318	
 > 319	static void ls_pcie_set_dstate(struct ls_pcie *pcie, u32 dstate)
   320	{
   321		struct dw_pcie *pci = pcie->pci;
   322		u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_PM);
   323		u32 val;
   324	
   325		val = dw_pcie_readw_dbi(pci, offset + PCI_PM_CTRL);
   326		val &= ~PCI_PM_CTRL_STATE_MASK;
   327		val |= dstate;
   328		dw_pcie_writew_dbi(pci, offset + PCI_PM_CTRL, val);
   329	}
   330	
   331	static int ls_pcie_host_init(struct pcie_port *pp)
   332	{
   333		struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
   334		struct ls_pcie *pcie = to_ls_pcie(pci);
   335	
   336		ls_pcie_fix_error_response(pcie);
   337	
   338		dw_pcie_dbi_ro_wr_en(pci);
   339		ls_pcie_clear_multifunction(pcie);
   340		dw_pcie_dbi_ro_wr_dis(pci);
   341	
   342		ls_pcie_drop_msg_tlp(pcie);
   343	
   344		return 0;
   345	}
   346	
   347	static struct ls_pcie_host_pm_ops ls1021a_pcie_host_pm_ops = {
   348		.pm_init = &ls1021a_pcie_pm_init,
   349		.send_turn_off_message = &ls1021a_pcie_send_turnoff_msg,
   350		.exit_from_l2 = &ls1021a_pcie_exit_from_l2,
   351	};
   352	
   353	static struct ls_pcie_host_pm_ops ls1043a_pcie_host_pm_ops = {
   354		.pm_init = &ls1021a_pcie_pm_init,
   355		.send_turn_off_message = &ls1043a_pcie_send_turnoff_msg,
   356		.exit_from_l2 = &ls1043a_pcie_exit_from_l2,
   357	};
   358	
   359	static struct ls_pcie_host_pm_ops ls_pcie_host_pm_ops = {
   360		.pm_init = &ls_pcie_pm_init,
   361		.send_turn_off_message = &ls_pcie_send_turnoff_msg,
   362		.exit_from_l2 = &ls_pcie_exit_from_l2,
   363	};
   364	
   365	static const struct dw_pcie_host_ops ls_pcie_host_ops = {
   366		.host_init = ls_pcie_host_init,
   367	};
   368	
   369	static const struct ls_pcie_drvdata ls1021a_drvdata = {
   370		.ops = &ls_pcie_host_ops,
   371		.pm_ops = &ls1021a_pcie_host_pm_ops,
   372	};
   373	
   374	static const struct ls_pcie_drvdata ls1043a_drvdata = {
   375		.ops = &ls_pcie_host_ops,
   376		.lut_off = 0x10000,
   377		.pm_ops = &ls1043a_pcie_host_pm_ops,
   378	};
   379	
   380	static const struct ls_pcie_drvdata layerscape_drvdata = {
   381		.ops = &ls_pcie_host_ops,
   382		.lut_off = 0x80000,
   383		.pf_off = 0xc0000,
   384		.pm_ops = &ls_pcie_host_pm_ops,
   385	};
   386	
   387	static const struct of_device_id ls_pcie_of_match[] = {
   388		{ .compatible = "fsl,ls1012a-pcie", .data = &layerscape_drvdata },
   389		{ .compatible = "fsl,ls1021a-pcie", .data = &ls1021a_drvdata },
   390		{ .compatible = "fsl,ls1028a-pcie", .data = &layerscape_drvdata },
   391		{ .compatible = "fsl,ls1043a-pcie", .data = &ls1043a_drvdata },
   392		{ .compatible = "fsl,ls1046a-pcie", .data = &layerscape_drvdata },
   393		{ .compatible = "fsl,ls2080a-pcie", .data = &layerscape_drvdata },
   394		{ .compatible = "fsl,ls2085a-pcie", .data = &layerscape_drvdata },
   395		{ .compatible = "fsl,ls2088a-pcie", .data = &layerscape_drvdata },
   396		{ .compatible = "fsl,ls1088a-pcie", .data = &layerscape_drvdata },
   397		{ },
   398	};
   399	
   400	static int ls_pcie_probe(struct platform_device *pdev)
   401	{
   402		struct device *dev = &pdev->dev;
   403		struct dw_pcie *pci;
   404		struct ls_pcie *pcie;
   405		struct resource *dbi_base;
   406		int ret;
   407	
   408		pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
   409		if (!pcie)
   410			return -ENOMEM;
   411	
   412		pci = devm_kzalloc(dev, sizeof(*pci), GFP_KERNEL);
   413		if (!pci)
   414			return -ENOMEM;
   415	
   416		pcie->drvdata = of_device_get_match_data(dev);
   417	
   418		pci->dev = dev;
   419		pci->pp.ops = pcie->drvdata->ops;
   420	
   421		pcie->pci = pci;
   422	
   423		dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
   424		pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
   425		if (IS_ERR(pci->dbi_base))
   426			return PTR_ERR(pci->dbi_base);
   427	
   428		pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
   429	
   430		if (pcie->drvdata->lut_off)
   431			pcie->lut_base = pci->dbi_base + pcie->drvdata->lut_off;
   432	
   433		if (pcie->drvdata->pf_off)
   434			pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
   435	
   436		if (!ls_pcie_is_bridge(pcie))
   437			return -ENODEV;
   438	
   439		platform_set_drvdata(pdev, pcie);
   440	
   441		ret = dw_pcie_host_init(&pci->pp);
   442		if (ret)
   443			return ret;
   444	
   445		if (dw_pcie_link_up(pci)) {
   446			dev_dbg(pci->dev, "Endpoint is present\n");
   447			pcie->ep_presence = true;
   448		}
   449	
   450		if (pcie->drvdata->pm_ops && pcie->drvdata->pm_ops->pm_init &&
   451		    !pcie->drvdata->pm_ops->pm_init(pcie))
   452			pcie->pm_support = true;
   453	
   454		return 0;
   455	}
   456	
 > 457	static bool ls_pcie_pm_check(struct ls_pcie *pcie)
   458	{
   459		if (!pcie->ep_presence) {
   460			dev_dbg(pcie->pci->dev, "Endpoint isn't present\n");
   461			return false;
   462		}
   463	
   464		if (!pcie->pm_support)
   465			return false;
   466	
   467		return true;
   468	}
   469	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
