Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77298C07
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731145484; cv=none; b=XgZ/1oKheBkdk/vLgPPtUFnE6ZUqwuzQtZGlx3MhjDVSes/01zA19SL9IYLsWfmz5QIsanN1/V2L5V28K13fD8jf4HqgyEPQMoyLeFIFS+vkOGsHD6PhytmKBkrlPLoXKDOWUzfZviXkBmbY7chRvb9Nqx5sbL8UNklNZqzPHzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731145484; c=relaxed/simple;
	bh=JHTBHe0PzCV9tDA4963vpNj0Eza43734SDYxIsQX6Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N36+InuUO0w0gTOSScIhdgT1I5Klz9mWoF68rx05TIwDlNnxP6vQd91fvscf3w/KhlUttO/I0ShuClqLN8Iu+I8TADDNVK+BP0K9Wb0rB2NYRx/uWBS4/S2Aize9XkR3IMFTT2/MQA75bcUVV18ZudCUfs4YuzOLxAZOMGZv9TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoAgCl50; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoAgCl50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731145482; x=1762681482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JHTBHe0PzCV9tDA4963vpNj0Eza43734SDYxIsQX6Lw=;
  b=YoAgCl50udXXo6D4kmKu9adrmtsW7mvux6HkOu8bp9nImtyZMAI4bVu7
   ki0ZbdMZ9zXs5UOWC7UKYRbAb9aiHwrOpKGqEEp6af77CrarELjk+Y14N
   50rWN4vLTQYilyJsYfvNEwXzoWgGJJ6QC4LUgMiEwT3e1DmPEA2+9lyO6
   mHTjBpkjEBM8Bis26aB3mqipacXI7xpiN3zrvoJjl3tn4t2St6e3YG0uq
   CP4az1biOXGdIdgqPlsxfunnZdJmRN2a2VuQADhZU7OBDEd8MlLq+Fo4w
   qtANCzJcsWXGk86knRrmnvg2s7LD1gYvuW3IshVTw2N92WEpyJp6pdeWC
   w==;
X-CSE-ConnectionGUID: jZ0h2m2kSgW53rJOul1qnQ==
X-CSE-MsgGUID: aFlTADyWSy2HF5+NZ7VcLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34810301"
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="34810301"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 01:44:42 -0800
X-CSE-ConnectionGUID: +1Vuw69MRMK0AfuC0vcleA==
X-CSE-MsgGUID: GuAsk6OjQkWM0Jw00O2AqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="90817686"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Nov 2024 01:44:40 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9i1G-000sG6-0c;
	Sat, 09 Nov 2024 09:44:38 +0000
Date: Sat, 9 Nov 2024 17:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFCv1 3/7] PCI/MSI: Pass in msi_iova to
 msi_domain_insert_msi_desc
Message-ID: <202411091750.nGnflLUO-lkp@intel.com>
References: <32fe78c5ec4a08bf0414d80ce9ed9121270b9cb0.1731130093.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32fe78c5ec4a08bf0414d80ce9ed9121270b9cb0.1731130093.git.nicolinc@nvidia.com>

Hi Nicolin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus awilliam-vfio/next tip/irq/core linus/master awilliam-vfio/for-linus v6.12-rc6 next-20241108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/genirq-msi-Allow-preset-IOVA-in-struct-msi_desc-for-MSI-doorbell-address/20241109-135311
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/32fe78c5ec4a08bf0414d80ce9ed9121270b9cb0.1731130093.git.nicolinc%40nvidia.com
patch subject: [PATCH RFCv1 3/7] PCI/MSI: Pass in msi_iova to msi_domain_insert_msi_desc
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241109/202411091750.nGnflLUO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091750.nGnflLUO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091750.nGnflLUO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/msi/msi.c:357: warning: Function parameter or struct member 'iova' not described in 'msi_capability_init'


vim +357 drivers/pci/msi/msi.c

f144d1496b47e74 drivers/pci/msi.c     Benjamin Herrenschmidt 2014-10-03  342  
^1da177e4c3f415 drivers/pci/msi.c     Linus Torvalds         2005-04-16  343  /**
^1da177e4c3f415 drivers/pci/msi.c     Linus Torvalds         2005-04-16  344   * msi_capability_init - configure device's MSI capability structure
^1da177e4c3f415 drivers/pci/msi.c     Linus Torvalds         2005-04-16  345   * @dev: pointer to the pci_dev data structure of MSI device function
1c8d7b0a562da06 drivers/pci/msi.c     Matthew Wilcox         2009-03-17  346   * @nvec: number of interrupts to allocate
f6b6aefee70aa52 drivers/pci/msi.c     Bjorn Helgaas          2019-05-30  347   * @affd: description of automatic IRQ affinity assignments (may be %NULL)
^1da177e4c3f415 drivers/pci/msi.c     Linus Torvalds         2005-04-16  348   *
1c8d7b0a562da06 drivers/pci/msi.c     Matthew Wilcox         2009-03-17  349   * Setup the MSI capability structure of the device with the requested
1c8d7b0a562da06 drivers/pci/msi.c     Matthew Wilcox         2009-03-17  350   * number of interrupts.  A return value of zero indicates the successful
f6b6aefee70aa52 drivers/pci/msi.c     Bjorn Helgaas          2019-05-30  351   * setup of an entry with the new MSI IRQ.  A negative return value indicates
1c8d7b0a562da06 drivers/pci/msi.c     Matthew Wilcox         2009-03-17  352   * an error, and a positive return value indicates the number of interrupts
1c8d7b0a562da06 drivers/pci/msi.c     Matthew Wilcox         2009-03-17  353   * which could have been allocated.
1c8d7b0a562da06 drivers/pci/msi.c     Matthew Wilcox         2009-03-17  354   */
61e1c5905290efe drivers/pci/msi.c     Christoph Hellwig      2016-11-08  355  static int msi_capability_init(struct pci_dev *dev, int nvec,
77c6ca404bd701e drivers/pci/msi/msi.c Nicolin Chen           2024-11-08  356  			       struct irq_affinity *affd, dma_addr_t iova)
^1da177e4c3f415 drivers/pci/msi.c     Linus Torvalds         2005-04-16 @357  {
5512c5eaf533a98 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-06  358  	struct irq_affinity_desc *masks = NULL;
9eee5330656bf92 drivers/pci/msi/msi.c Mostafa Saleh          2024-06-24  359  	struct msi_desc *entry, desc;
f465136d7287538 drivers/pci/msi.c     Gavin Shan             2013-04-04  360  	int ret;
^1da177e4c3f415 drivers/pci/msi.c     Linus Torvalds         2005-04-16  361  
d2a463b297415ca drivers/pci/msi/msi.c Thomas Gleixner        2022-11-11  362  	/* Reject multi-MSI early on irq domain enabled architectures */
d2a463b297415ca drivers/pci/msi/msi.c Thomas Gleixner        2022-11-11  363  	if (nvec > 1 && !pci_msi_domain_supports(dev, MSI_FLAG_MULTI_PCI_MSI, ALLOW_LEGACY))
d2a463b297415ca drivers/pci/msi/msi.c Thomas Gleixner        2022-11-11  364  		return 1;
d2a463b297415ca drivers/pci/msi/msi.c Thomas Gleixner        2022-11-11  365  
c7ecb95ca6a80b2 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-10  366  	/*
c7ecb95ca6a80b2 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-10  367  	 * Disable MSI during setup in the hardware, but mark it enabled
c7ecb95ca6a80b2 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-10  368  	 * so that setup code can evaluate it.
c7ecb95ca6a80b2 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-10  369  	 */
c7ecb95ca6a80b2 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-10  370  	pci_msi_set_enable(dev, 0);
c7ecb95ca6a80b2 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-10  371  	dev->msi_enabled = 1;
110828c9cdce6e8 drivers/pci/msi.c     Matthew Wilcox         2009-06-16  372  
5512c5eaf533a98 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-06  373  	if (affd)
5512c5eaf533a98 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-06  374  		masks = irq_create_affinity_masks(nvec, affd);
5512c5eaf533a98 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-06  375  
5512c5eaf533a98 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-06  376  	msi_lock_descs(&dev->dev);
77c6ca404bd701e drivers/pci/msi/msi.c Nicolin Chen           2024-11-08  377  	ret = msi_setup_msi_desc(dev, nvec, iova, masks);
71020a3c0dff4a0 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-06  378  	if (ret)
c7ecb95ca6a80b2 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-10  379  		goto fail;
1ce03373a7f4b5f drivers/pci/msi.c     Eric W. Biederman      2006-10-04  380  
f6b6aefee70aa52 drivers/pci/msi.c     Bjorn Helgaas          2019-05-30  381  	/* All MSIs are unmasked by default; mask them all */
ae24e28fef14687 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-06  382  	entry = msi_first_desc(&dev->dev, MSI_DESC_ALL);
446a98b19fd6da9 drivers/pci/msi.c     Thomas Gleixner        2021-07-29  383  	pci_msi_mask(entry, msi_multi_mask(entry));
9eee5330656bf92 drivers/pci/msi/msi.c Mostafa Saleh          2024-06-24  384  	/*
9eee5330656bf92 drivers/pci/msi/msi.c Mostafa Saleh          2024-06-24  385  	 * Copy the MSI descriptor for the error path because
9eee5330656bf92 drivers/pci/msi/msi.c Mostafa Saleh          2024-06-24  386  	 * pci_msi_setup_msi_irqs() will free it for the hierarchical
9eee5330656bf92 drivers/pci/msi/msi.c Mostafa Saleh          2024-06-24  387  	 * interrupt domain case.
9eee5330656bf92 drivers/pci/msi/msi.c Mostafa Saleh          2024-06-24  388  	 */
9eee5330656bf92 drivers/pci/msi/msi.c Mostafa Saleh          2024-06-24  389  	memcpy(&desc, entry, sizeof(desc));
f2440d9acbe866b drivers/pci/msi.c     Matthew Wilcox         2009-03-17  390  
^1da177e4c3f415 drivers/pci/msi.c     Linus Torvalds         2005-04-16  391  	/* Configure MSI capability structure */
8e047adae969701 drivers/pci/msi.c     Jiang Liu              2014-11-15  392  	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSI);
8eb5ce3f78a5e5d drivers/pci/msi.c     Thomas Gleixner        2021-07-29  393  	if (ret)
8eb5ce3f78a5e5d drivers/pci/msi.c     Thomas Gleixner        2021-07-29  394  		goto err;
f7feaca77d6ad6b drivers/pci/msi.c     Eric W. Biederman      2007-01-28  395  
f144d1496b47e74 drivers/pci/msi.c     Benjamin Herrenschmidt 2014-10-03  396  	ret = msi_verify_entries(dev);
8eb5ce3f78a5e5d drivers/pci/msi.c     Thomas Gleixner        2021-07-29  397  	if (ret)
8eb5ce3f78a5e5d drivers/pci/msi.c     Thomas Gleixner        2021-07-29  398  		goto err;
f144d1496b47e74 drivers/pci/msi.c     Benjamin Herrenschmidt 2014-10-03  399  
^1da177e4c3f415 drivers/pci/msi.c     Linus Torvalds         2005-04-16  400  	/* Set MSI enabled bits	*/
ba698ad4b7e466c drivers/pci/msi.c     David Miller           2007-10-25  401  	pci_intx_for_msi(dev, 0);
61b64abd399fa4b drivers/pci/msi.c     Michael S. Tsirkin     2015-05-07  402  	pci_msi_set_enable(dev, 1);
^1da177e4c3f415 drivers/pci/msi.c     Linus Torvalds         2005-04-16  403  
5f2269916b0e509 drivers/pci/msi.c     Jiang Liu              2015-07-30  404  	pcibios_free_irq(dev);
7fe3730de729b75 drivers/pci/msi.c     Michael Ellerman       2007-04-18  405  	dev->irq = entry->irq;
5512c5eaf533a98 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-06  406  	goto unlock;
8eb5ce3f78a5e5d drivers/pci/msi.c     Thomas Gleixner        2021-07-29  407  
8eb5ce3f78a5e5d drivers/pci/msi.c     Thomas Gleixner        2021-07-29  408  err:
9eee5330656bf92 drivers/pci/msi/msi.c Mostafa Saleh          2024-06-24  409  	pci_msi_unmask(&desc, msi_multi_mask(&desc));
b12d0bec385b7a5 drivers/pci/msi/msi.c Ahmed S. Darwish       2022-11-11  410  	pci_free_msi_irqs(dev);
c7ecb95ca6a80b2 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-10  411  fail:
c7ecb95ca6a80b2 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-10  412  	dev->msi_enabled = 0;
5512c5eaf533a98 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-06  413  unlock:
5512c5eaf533a98 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-06  414  	msi_unlock_descs(&dev->dev);
5512c5eaf533a98 drivers/pci/msi/msi.c Thomas Gleixner        2021-12-06  415  	kfree(masks);
8eb5ce3f78a5e5d drivers/pci/msi.c     Thomas Gleixner        2021-07-29  416  	return ret;
^1da177e4c3f415 drivers/pci/msi.c     Linus Torvalds         2005-04-16  417  }
^1da177e4c3f415 drivers/pci/msi.c     Linus Torvalds         2005-04-16  418  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
