Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9BF30E821
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 02:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156799; cv=none; b=U3/CvIGrNN1/J7TQmElqNb+MueIIXl+PCH4gNVMjslKHY5ZOtbq3E+3TbHMX7BfgjlFRGYe3cx6h63s/lMed2nRMlMI0c0csqA26oQiHrUNwwMYns3+gUQ5UE1geoVoPV2VrPvasWjEsFtEFEMvupsDmcZBDa6MCl/N823cX/2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156799; c=relaxed/simple;
	bh=T361aohuWp261SnocVQ4jBKcGahCYp+mDRdCbMPdEbA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i/1rdH2/AtZPpWAvdK9soQncWZyX6JfvyCEfJF6/gVFevCtbj8HLTYVHj1cWhCADutnvCWOFeFU+u+QXxRQ0xyEZuNrUWqmz2j5Fbxp/jxvhvyjRcLAG2rwO5nO4TKv7h1qi15M7Yec/fZF7Iyjmdman/2ZiNDmWDXkys6PGvcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjirQ17d; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjirQ17d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779156797; x=1810692797;
  h=date:from:to:cc:subject:message-id;
  bh=T361aohuWp261SnocVQ4jBKcGahCYp+mDRdCbMPdEbA=;
  b=fjirQ17dqkokEAJKe98MJUl/iUB3UE6z87hXokvNYJHxHl429ZdxpcWq
   VCfwx8QX1dc9Rwj28qDL1RiCJoido/bMi6d8T7A6OoEvbeURLUxy80/91
   6Id2Zf8d4APfew6ohvznZfY8ijtU2o+/uaLDrLt8uJfhSZ2jqQMFYeUnx
   TfzGGB7s/7gW4xAllwGlxcL0pVdzkyo4c5ffxqos6H5qBKpK9kMop4QLk
   55eH2GiSkRpz40uK8a9Cbp1Gdu2J+tYyIFj0JUegF2sKQo4yEDByIW2a6
   b1XQPeJLMx5wTLVLuGSlQP1XjnFlcjTG8ESpYO/4nVLNGUMsq+sl4SX5p
   g==;
X-CSE-ConnectionGUID: jqxDAP7jSxyjWXXY8O4tfg==
X-CSE-MsgGUID: dQ8moaORRgWpDOu1Kvos+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="67553801"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="67553801"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:13:15 -0700
X-CSE-ConnectionGUID: 4be2T+IRT4G86bvL+taotA==
X-CSE-MsgGUID: +h5fb3ZcRr69AuVzKy0+Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239684832"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 May 2026 19:13:14 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP9xH-00000000040-2oQl;
	Tue, 19 May 2026 02:13:11 +0000
Date: Tue, 19 May 2026 07:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 110/238]
 drivers/pci/controller/pcie-rzg3s-host.c:766:20: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202605190718.tvt250RO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 5e333910ab4a4568b501b9ebb83c53098a939f2f [110/238] PCI: rzg3s-host: replace __get_free_pages() with kmalloc()
config: sparc64-randconfig-r134-20260519 (https://download.01.org/0day-ci/archive/20260519/202605190718.tvt250RO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190718.tvt250RO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190718.tvt250RO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pcie-rzg3s-host.c:766:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long pages @@     got void *[assigned] _res @@
   drivers/pci/controller/pcie-rzg3s-host.c:766:20: sparse:     expected unsigned long pages
   drivers/pci/controller/pcie-rzg3s-host.c:766:20: sparse:     got void *[assigned] _res

vim +766 drivers/pci/controller/pcie-rzg3s-host.c

   758	
   759	static int rzg3s_pcie_msi_setup(struct rzg3s_pcie_host *host)
   760	{
   761		size_t size = RZG3S_PCI_MSI_INT_NR * sizeof(u32);
   762		struct rzg3s_pcie_msi *msi = &host->msi;
   763		struct device *dev = host->dev;
   764		int id, ret;
   765	
 > 766		msi->pages = kmalloc(PAGE_SIZE, GFP_KERNEL | GFP_DMA);
   767		if (!msi->pages)
   768			return -ENOMEM;
   769	
   770		msi->dma_addr = dma_map_single(dev, (void *)msi->pages, size * 2,
   771					       DMA_BIDIRECTIONAL);
   772		if (dma_mapping_error(dev, msi->dma_addr)) {
   773			ret = -ENOMEM;
   774			goto free_pages;
   775		}
   776	
   777		/*
   778		 * According to the RZ/G3S HW manual (Rev.1.10, section 34.4.5.2 Setting
   779		 * the MSI Window) the MSI window needs to fall within one of the
   780		 * enabled AXI windows. Find an enabled AXI window to setup the MSI
   781		 * window.
   782		 */
   783		for (id = 0; id < RZG3S_MAX_WINDOWS; id++) {
   784			u64 base, basel, baseu;
   785			u64 mask, maskl, masku;
   786	
   787			basel = readl_relaxed(host->axi + RZG3S_PCI_AWBASEL(id));
   788			/* Skip checking this AXI window if it's not enabled */
   789			if (!(basel & RZG3S_PCI_AWBASEL_WIN_ENA))
   790				continue;
   791	
   792			baseu = readl_relaxed(host->axi + RZG3S_PCI_AWBASEU(id));
   793			base = baseu << 32 | basel;
   794	
   795			maskl = readl_relaxed(host->axi + RZG3S_PCI_AWMASKL(id));
   796			masku = readl_relaxed(host->axi + RZG3S_PCI_AWMASKU(id));
   797			mask = masku << 32 | maskl;
   798	
   799			if (msi->dma_addr < base || msi->dma_addr > base + mask)
   800				continue;
   801	
   802			break;
   803		}
   804	
   805		if (id == RZG3S_MAX_WINDOWS) {
   806			ret = -EINVAL;
   807			goto dma_unmap;
   808		}
   809	
   810		/* The MSI base address must be aligned to the MSI size */
   811		msi->window_base = ALIGN(msi->dma_addr, size);
   812		if (msi->window_base < msi->dma_addr) {
   813			ret = -EINVAL;
   814			goto dma_unmap;
   815		}
   816	
   817		rzg3s_pcie_msi_hw_setup(host);
   818	
   819		return 0;
   820	
   821	dma_unmap:
   822		dma_unmap_single(dev, msi->dma_addr, size * 2, DMA_BIDIRECTIONAL);
   823	free_pages:
   824		kfree((void *)msi->pages);
   825		return ret;
   826	}
   827	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
