Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1D83C01
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 17:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748367278; cv=none; b=iIZkLwOn9kF6GW7hJoa2HnTZRNK+3S276IMiLZCdw+AVJ4k3BsIJUfPFScuGYIdNEUIrJnppptv55HGt4vvmmztQ++UWx39vJ+ozkGmx0DWH5YTzHPZpV6QEDSTZANOCjb+wcJ29EeyDKAXbd9YnGoeDn9jAEPfmhBlWCWtS80E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748367278; c=relaxed/simple;
	bh=/SgtuekCV/4IfLgI/WpGQltS/FPaa6jaoVWVjVnF0Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MdU7fWmDaSqwkamrA1PhOBtHHW6oeIAbruDkMgNWki59Xt25giiynVyCavg3E07cyXKGdRZUbdguUnUkPWTpsmZeKaxiohXTJKUTKXfiba8GfZI3QodO9LaV1Kua2DqtiS8FAxw6hb0yTcIYBa7XuBO7BxIWbqA4tIV3mUPEZWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OW62rOjB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OW62rOjB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748367277; x=1779903277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/SgtuekCV/4IfLgI/WpGQltS/FPaa6jaoVWVjVnF0Vs=;
  b=OW62rOjBR0FzyDzocYSbK+dpRZblsfxYEpBwwB97ag4vgQZrdbxrYw0H
   kGZRRB5FFjj5qE8Zk8W7VaPXbh2X9vuujCwHRPk9R0iDJeatzd3hVA8xG
   90ZxireGz55hfKNVf3KMazcQ57wdH2FOytya3jSjYZcsUP7OLRQ41qE/J
   I41vMKa9bWgRRq200vmAQzs2mfuyFvZtDIkUU/l04akWA1iOEi6++KeLd
   6CLNiKiFP2q6IXLdedLANVm1LQRS/5sr6MvPCOn6iJpX2tj8JfM347tXq
   d5jIPkD1CUcTt1n+AFv5HJr1DbvsiVHy/uG/mREukGZZVtQq+vaGNiBq+
   g==;
X-CSE-ConnectionGUID: USJ6vA1vS1qxDCz9chDIdQ==
X-CSE-MsgGUID: 3Rb4zHaYSK+4QoG2cjTuow==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="72908107"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="72908107"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 10:34:20 -0700
X-CSE-ConnectionGUID: m2JCg1VzQ2OmXfPnyTJ8PA==
X-CSE-MsgGUID: VIoO5/V0Qs+GOL63kGpuGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="147940313"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 May 2025 10:34:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJyBa-000UHk-1h;
	Tue, 27 May 2025 17:33:58 +0000
Date: Wed, 28 May 2025 01:33:14 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: [linux-next:master 10187/13594] drivers/pci/pcie/ptm.c:498:25:
 error: redefinition of 'pcie_ptm_create_debugfs'
Message-ID: <202505280148.rGiCfv4x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fefff2755f2aa4125dce2a1edfe7e545c7c621f2
commit: 132833405e61463d47d6badff1b8080b09b5808e [10187/13594] PCI: Add debugfs support for exposing PTM context
config: alpha-randconfig-r071-20250527 (https://download.01.org/0day-ci/archive/20250528/202505280148.rGiCfv4x-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280148.rGiCfv4x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280148.rGiCfv4x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/pcie/ptm.c:498:25: error: redefinition of 'pcie_ptm_create_debugfs'
     498 | struct pci_ptm_debugfs *pcie_ptm_create_debugfs(struct device *dev, void *pdata,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/pci/pcie/ptm.c:11:
   include/linux/pci.h:1910:2: note: previous definition of 'pcie_ptm_create_debugfs' with type 'struct pci_ptm_debugfs *(struct device *, void *, const struct pcie_ptm_ops *)'
    1910 | *pcie_ptm_create_debugfs(struct device *dev, void *pdata,
         |  ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/pcie/ptm.c:546:6: error: redefinition of 'pcie_ptm_destroy_debugfs'
     546 | void pcie_ptm_destroy_debugfs(struct pci_ptm_debugfs *ptm_debugfs)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:1913:1: note: previous definition of 'pcie_ptm_destroy_debugfs' with type 'void(struct pci_ptm_debugfs *)'
    1913 | pcie_ptm_destroy_debugfs(struct pci_ptm_debugfs *ptm_debugfs) { }
         | ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/pcie_ptm_create_debugfs +498 drivers/pci/pcie/ptm.c

   479	
   480	#define pcie_ptm_create_debugfs_file(pdata, mode, attr)			\
   481		do {								\
   482			if (ops->attr##_visible && ops->attr##_visible(pdata))	\
   483				debugfs_create_file(#attr, mode, ptm_debugfs->debugfs, \
   484						    ptm_debugfs, &attr##_fops);	\
   485		} while (0)
   486	
   487	/*
   488	 * pcie_ptm_create_debugfs() - Create debugfs entries for the PTM context
   489	 * @dev: PTM capable component device
   490	 * @pdata: Private data of the PTM capable component device
   491	 * @ops: PTM callback structure
   492	 *
   493	 * Create debugfs entries for exposing the PTM context of the PTM capable
   494	 * components such as Root Complex and Endpoint controllers.
   495	 *
   496	 * Return: Pointer to 'struct pci_ptm_debugfs' if success, NULL otherwise.
   497	 */
 > 498	struct pci_ptm_debugfs *pcie_ptm_create_debugfs(struct device *dev, void *pdata,
   499				  const struct pcie_ptm_ops *ops)
   500	{
   501		struct pci_ptm_debugfs *ptm_debugfs;
   502		char *dirname;
   503		int ret;
   504	
   505		/* Caller must provide check_capability() callback */
   506		if (!ops->check_capability)
   507			return NULL;
   508	
   509		/* Check for PTM capability before creating debugfs attrbutes */
   510		ret = ops->check_capability(pdata);
   511		if (!ret) {
   512			dev_dbg(dev, "PTM capability not present\n");
   513			return NULL;
   514		}
   515	
   516		ptm_debugfs = kzalloc(sizeof(*ptm_debugfs), GFP_KERNEL);
   517		if (!ptm_debugfs)
   518			return NULL;
   519	
   520		dirname = devm_kasprintf(dev, GFP_KERNEL, "pcie_ptm_%s", dev_name(dev));
   521		if (!dirname)
   522			return NULL;
   523	
   524		ptm_debugfs->debugfs = debugfs_create_dir(dirname, NULL);
   525		ptm_debugfs->pdata = pdata;
   526		ptm_debugfs->ops = ops;
   527		mutex_init(&ptm_debugfs->lock);
   528	
   529		pcie_ptm_create_debugfs_file(pdata, 0644, context_update);
   530		pcie_ptm_create_debugfs_file(pdata, 0644, context_valid);
   531		pcie_ptm_create_debugfs_file(pdata, 0444, local_clock);
   532		pcie_ptm_create_debugfs_file(pdata, 0444, master_clock);
   533		pcie_ptm_create_debugfs_file(pdata, 0444, t1);
   534		pcie_ptm_create_debugfs_file(pdata, 0444, t2);
   535		pcie_ptm_create_debugfs_file(pdata, 0444, t3);
   536		pcie_ptm_create_debugfs_file(pdata, 0444, t4);
   537	
   538		return ptm_debugfs;
   539	}
   540	EXPORT_SYMBOL_GPL(pcie_ptm_create_debugfs);
   541	
   542	/*
   543	 * pcie_ptm_destroy_debugfs() - Destroy debugfs entries for the PTM context
   544	 * @ptm_debugfs: Pointer to the PTM debugfs struct
   545	 */
 > 546	void pcie_ptm_destroy_debugfs(struct pci_ptm_debugfs *ptm_debugfs)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
