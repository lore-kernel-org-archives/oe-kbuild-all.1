Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A78B1B87F5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 22:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733438293; cv=none; b=CD1cjh43ZkkHS7/qR3BI4ROI3gU2Og99IA+lsB0ErmZhUbLataNoqSPjz96Gfk08VCZxoClMbxfsJ8ccltZHO3Csh5Gkc7U4DzRk9HdhZUe6qwgkEPVQUO/BN28oMMBRZzCcIkxuIsf2MUzKFvs48+4EZWIDVxFi819gFlUjyLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733438293; c=relaxed/simple;
	bh=j31R3RXvUbGx0bN8ufyGb3EB9u3CCuAKnqC56LV+fI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cA/WRVMRgpyvzloovKodyyqHoOWr7j3K5ri9WdLHcstLVIjtvv8ata0mbBupi4lZnxA6Ez/IvE3mDPG/9a5dymulQbQ/R8BZ4dJHdcrlJWNAKJDmdJyIju+Kmaom4yKjBUL+sMrQQDrknz+zk3vdOqCQCyxwJ/vU6LrKWoGWZR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CzdPM90G; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CzdPM90G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733438291; x=1764974291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j31R3RXvUbGx0bN8ufyGb3EB9u3CCuAKnqC56LV+fI4=;
  b=CzdPM90Ge7uCdBkUkLioPzZ6C7bn5BqTwQVehUzBQQMBf7BpJ4vbvViy
   IxTdZmVIBx87+SauI5/xqS8GDYsU5nEsGuxCORlZkb21whWEJtjhkbS0C
   qaHWbw491Np2hPtVnzugGyJFhUvMG5pO5WizJbaM/NX+W7NVelQ1ADlpz
   h8H4NABZEqlOIoV1Y8xT31VZg7b9MaflMpKDZAmsawKcox42RaqR5+E+y
   yEy387juYkXtLaq2PzokNmuU/Bb77F8JMDxCsR0Fp+qhQEOYv8175cskv
   soDV7Y+Lx0LEVPmotoJFmnndEzzKT8stzYwm8n0C0LyvQMxwipW7ZHQw6
   A==;
X-CSE-ConnectionGUID: DSC6aoTgR5umuvvF+s1l0w==
X-CSE-MsgGUID: U2Jldt00SESWW4vl4VxTmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="34021758"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="34021758"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 14:38:08 -0800
X-CSE-ConnectionGUID: oy6FlUhCRteJeYZO+UBjfg==
X-CSE-MsgGUID: hw/CAqBoSDyWA+9vs2vChQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="94041487"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Dec 2024 14:38:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJKU0-0000SF-2n;
	Thu, 05 Dec 2024 22:38:04 +0000
Date: Fri, 6 Dec 2024 06:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/3] ata: Allocate PCI iomap table statically
Message-ID: <202412060621.mg983z1V-lkp@intel.com>
References: <20241204171033.86804-3-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204171033.86804-3-pstanner@redhat.com>

Hi Philipp,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc1 next-20241205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/ata-Allocate-PCI-iomap-table-statically/20241205-014059
base:   linus/master
patch link:    https://lore.kernel.org/r/20241204171033.86804-3-pstanner%40redhat.com
patch subject: [RFC PATCH 1/3] ata: Allocate PCI iomap table statically
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20241206/202412060621.mg983z1V-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060621.mg983z1V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060621.mg983z1V-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ata/pata_macio.c: In function 'pata_macio_common_init':
>> drivers/ata/pata_macio.c:1089:27: error: assignment to expression with array type
    1089 |         priv->host->iomap = &priv->tfregs;
         |                           ^


vim +1089 drivers/ata/pata_macio.c

88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1048  
0ec24914675c482 Greg Kroah-Hartman     2012-12-21  1049  static int pata_macio_common_init(struct pata_macio_priv *priv,
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1050  				  resource_size_t tfregs,
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1051  				  resource_size_t dmaregs,
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1052  				  resource_size_t fcregs,
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1053  				  unsigned long irq)
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1054  {
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1055  	struct ata_port_info		pinfo;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1056  	const struct ata_port_info	*ppi[] = { &pinfo, NULL };
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1057  	void __iomem			*dma_regs = NULL;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1058  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1059  	/* Fill up privates with various invariants collected from the
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1060  	 * device-tree
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1061  	 */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1062  	pata_macio_invariants(priv);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1063  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1064  	/* Make sure we have sane initial timings in the cache */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1065  	pata_macio_default_timings(priv);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1066  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1067  	/* Allocate libata host for 1 port */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1068  	memset(&pinfo, 0, sizeof(struct ata_port_info));
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1069  	pmac_macio_calc_timing_masks(priv, &pinfo);
9cbe056f6c467e7 Sergei Shtylyov        2011-02-04  1070  	pinfo.flags		= ATA_FLAG_SLAVE_POSS;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1071  	pinfo.port_ops		= &pata_macio_ops;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1072  	pinfo.private_data	= priv;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1073  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1074  	priv->host = ata_host_alloc_pinfo(priv->dev, ppi, 1);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1075  	if (priv->host == NULL) {
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1076  		dev_err(priv->dev, "Failed to allocate ATA port structure\n");
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1077  		return -ENOMEM;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1078  	}
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1079  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1080  	/* Setup the private data in host too */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1081  	priv->host->private_data = priv;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1082  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1083  	/* Map base registers */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1084  	priv->tfregs = devm_ioremap(priv->dev, tfregs, 0x100);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1085  	if (priv->tfregs == NULL) {
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1086  		dev_err(priv->dev, "Failed to map ATA ports\n");
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1087  		return -ENOMEM;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1088  	}
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01 @1089  	priv->host->iomap = &priv->tfregs;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1090  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1091  	/* Map DMA regs */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1092  	if (dmaregs != 0) {
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1093  		dma_regs = devm_ioremap(priv->dev, dmaregs,
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1094  					sizeof(struct dbdma_regs));
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1095  		if (dma_regs == NULL)
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1096  			dev_warn(priv->dev, "Failed to map ATA DMA registers\n");
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1097  	}
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1098  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1099  	/* If chip has local feature control, map those regs too */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1100  	if (fcregs != 0) {
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1101  		priv->kauai_fcr = devm_ioremap(priv->dev, fcregs, 4);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1102  		if (priv->kauai_fcr == NULL) {
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1103  			dev_err(priv->dev, "Failed to map ATA FCR register\n");
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1104  			return -ENOMEM;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1105  		}
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1106  	}
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1107  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1108  	/* Setup port data structure */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1109  	pata_macio_setup_ios(&priv->host->ports[0]->ioaddr,
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1110  			     priv->tfregs, dma_regs);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1111  	priv->host->ports[0]->private_data = priv;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1112  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1113  	/* hard-reset the controller */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1114  	pata_macio_reset_hw(priv, 0);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1115  	pata_macio_apply_timings(priv->host->ports[0], 0);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1116  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1117  	/* Enable bus master if necessary */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1118  	if (priv->pdev && dma_regs)
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1119  		pci_set_master(priv->pdev);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1120  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1121  	dev_info(priv->dev, "Activating pata-macio chipset %s, Apple bus ID %d\n",
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1122  		 macio_ata_names[priv->kind], priv->aapl_bus_id);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1123  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1124  	/* Start it up */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1125  	priv->irq = irq;
c3b2889424c26f3 Tejun Heo              2010-05-19  1126  	return ata_host_activate(priv->host, irq, ata_bmdma_interrupt, 0,
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1127  				 &pata_macio_sht);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1128  }
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
