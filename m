Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A019390229
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 19:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134269; cv=none; b=KARvpx6ZyXYCmAEiTTKSgQXtx9UMtGVMX3uYFCFfOfNxxkfiJ9osU88WWlPrloptDX19zkoTfpZ6GKTfqVYGCu3OT6rvliem+EFh5HgkzvE4v4NMkmx51Gj8A27ZlvRcf3j3/PvxzXVGCDcdRc5HJtyN/Pi+7jrdQ//68Pow2OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134269; c=relaxed/simple;
	bh=XuQzT/9q2aiO0HHkini75kQyjYADOvx1GxTpJQPtJN4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F2FYbTQxEOuZaKN8DmKoHLuR/fOznNg6wu3B4ULxr1qJs6wyZL5BYW83UcLdHj8QaVAXykgWB1Uwu0ckIzOTZselnOZh42ZkA7oFmzmooCaDwJW+tkHxbzSiLDejvnEDMbUFiVA89v4N3qOuvK6nVn6W8ZIkBTTWVEt+IHhvnnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYhLDK30; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYhLDK30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779134268; x=1810670268;
  h=date:from:to:cc:subject:message-id;
  bh=XuQzT/9q2aiO0HHkini75kQyjYADOvx1GxTpJQPtJN4=;
  b=VYhLDK30xVHHRM/RUKRtrwquRK+eeWW06IZC+eXsOhR1Xtlq5iy8aZDv
   0iwXeA5uTgZh8JPn57e2ByM8aOH9lyc3UeGcAp7uXnN2KuDY9GA3BILoM
   obdLsUxV3B0C2gLk2XHTqVX7TVN/xIfkkm7xNCMHzXOXOaTCWWaaYfqgg
   Iuvkxxva6cDA1JU309zmomVzqUmB9GkoGvdTRLSYvBpytCL7yVQCbfQwi
   hd39ibmq6T79cjqFx6u+s9AfivdwW/XYdflxSCpvd2yB68CV0XgS8CCmi
   bvVkEs4w6oQPka9LvOpMYcvTat/WMPh1VBz4mZ5HWccjrmvTxvh7sBS1c
   Q==;
X-CSE-ConnectionGUID: j8Zrfo03RRWX70e8Y1wV9Q==
X-CSE-MsgGUID: u0uMP6aZTBK7uhJzRcE+Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="102674725"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="102674725"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 12:57:47 -0700
X-CSE-ConnectionGUID: 788B0BJoSnWFZmdw+uGp4g==
X-CSE-MsgGUID: +0Nun+jqR5iKCJksuw8KdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="277642292"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 May 2026 12:57:45 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP45v-000000003LU-0GAY;
	Mon, 18 May 2026 19:57:43 +0000
Date: Tue, 19 May 2026 03:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 110/238]
 drivers/pci/controller/pcie-rzg3s-host.c:766:20: error: assignment to 'long
 unsigned int' from 'void *' makes integer from pointer without a cast
Message-ID: <202605190307.Zjf9O04I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 5e333910ab4a4568b501b9ebb83c53098a939f2f [110/238] PCI: rzg3s-host: replace __get_free_pages() with kmalloc()
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260519/202605190307.Zjf9O04I-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190307.Zjf9O04I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190307.Zjf9O04I-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/pcie-rzg3s-host.c: In function 'rzg3s_pcie_msi_setup':
>> drivers/pci/controller/pcie-rzg3s-host.c:766:20: error: assignment to 'long unsigned int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     766 |         msi->pages = kmalloc(PAGE_SIZE, GFP_KERNEL | GFP_DMA);
         |                    ^


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
