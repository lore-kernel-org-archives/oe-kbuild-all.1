Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F70F231C8D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 04:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728792758; cv=none; b=k+dCL2UmXIqNqj/HHyHCt6WcPSGgMMZ0Y2gYsMjm9cVxhNbaKM8QYFncE7ZiMh9dOZTOdzu8vLk7g5E0evPgSA5rUBPPg+pclyBERllXKW+6FI0FvXnjWdtGrusfjzEnHlVTV0DUsVfxsJH5Tgn7fkUbGlNoyn1/1FU+ipv1als=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728792758; c=relaxed/simple;
	bh=sECfi7O2R//u2CnV1wiMgkKPCHzrBjrniurDu/bZY1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WgrSfxyYxAwJmm4PT9Lqv4zI+zvFWFy4lDH7tdHKkCsprM0RNrKTOSICiG4cMjlxbVRhWtXA9ctPF4G7BmV4Ex+hkNUjiyZUfCuvZixWYsPN2mOoy/ajX/IKUrOezwmIsoIJ8RmqljzplcO8Amu76KUgW4QP/EABgkDnJziqDT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cn+KFWyf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cn+KFWyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728792756; x=1760328756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sECfi7O2R//u2CnV1wiMgkKPCHzrBjrniurDu/bZY1A=;
  b=cn+KFWyfBPWblK/pxB3xvmj+Dnoc8gZX/2wweQs2GJFMcCClytVDEkJy
   jEr1Tq8oX2TxMFdN/robcoN6I+g+ytVvpTaanlngwR/MrF8bHxcCYtFJu
   SDk3/BqGYvyXlJLvB8vWHS55cRAcWmsR0/CHIO0x0Hw9S5EozHOPZnDIf
   lHaqGzdg6H6u+5eB2N3I0+ltEYlk6JKQ3YL0+rXujf0CYifLspS62PLYq
   Fa6Nesnde+grjlUTNqMjy6mozeQihtkulz0AxkKipHTd5pltsce3kb5E5
   w6qMrE4wfDgYUWpeYZShfVy1bOiVfkfB/L4yohmpB11qh2uYoGj7cDKoS
   Q==;
X-CSE-ConnectionGUID: ijt4sT6tSziFkvox6N3lOw==
X-CSE-MsgGUID: A5XD4IeyQ1W2BYSjNnSuoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38798912"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="38798912"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 21:12:35 -0700
X-CSE-ConnectionGUID: QHZ4FvTyTSW0Q3evfww+Mw==
X-CSE-MsgGUID: EUs3hpoCT/qzTz0bD+Ixeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="77273862"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Oct 2024 21:12:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szpy3-000E4M-2u;
	Sun, 13 Oct 2024 04:12:31 +0000
Date: Sun, 13 Oct 2024 12:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20241012 3/27]
 drivers/iommu/intel/pasid.c:600: warning: Function parameter or struct
 member 'old' not described in 'intel_pasid_setup_nested'
Message-ID: <202410131239.4a6m6sue-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20241012
head:   fc0bed7a82f4d9d1ad56b8f6417de844dc0965d0
commit: 3e6425d7be6ffd3aae116e82bdee6bceee533040 [3/27] iommu/vt-d: Pass old domain to the pasid setup helpers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241013/202410131239.4a6m6sue-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131239.4a6m6sue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131239.4a6m6sue-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/intel/pasid.c:600: warning: Function parameter or struct member 'old' not described in 'intel_pasid_setup_nested'


vim +600 drivers/iommu/intel/pasid.c

111bf85c68f6ed Lu Baolu 2023-10-25  585  
111bf85c68f6ed Lu Baolu 2023-10-25  586  /**
111bf85c68f6ed Lu Baolu 2023-10-25  587   * intel_pasid_setup_nested() - Set up PASID entry for nested translation.
111bf85c68f6ed Lu Baolu 2023-10-25  588   * @iommu:      IOMMU which the device belong to
111bf85c68f6ed Lu Baolu 2023-10-25  589   * @dev:        Device to be set up for translation
111bf85c68f6ed Lu Baolu 2023-10-25  590   * @pasid:      PASID to be programmed in the device PASID table
111bf85c68f6ed Lu Baolu 2023-10-25  591   * @domain:     User stage-1 domain nested on a stage-2 domain
111bf85c68f6ed Lu Baolu 2023-10-25  592   *
111bf85c68f6ed Lu Baolu 2023-10-25  593   * This is used for nested translation. The input domain should be
111bf85c68f6ed Lu Baolu 2023-10-25  594   * nested type and nested on a parent with 'is_nested_parent' flag
111bf85c68f6ed Lu Baolu 2023-10-25  595   * set.
111bf85c68f6ed Lu Baolu 2023-10-25  596   */
111bf85c68f6ed Lu Baolu 2023-10-25  597  int intel_pasid_setup_nested(struct intel_iommu *iommu, struct device *dev,
3e6425d7be6ffd Yi Liu   2024-10-11  598  			     u32 pasid, struct dmar_domain *domain,
3e6425d7be6ffd Yi Liu   2024-10-11  599  			     struct iommu_domain *old)
111bf85c68f6ed Lu Baolu 2023-10-25 @600  {
111bf85c68f6ed Lu Baolu 2023-10-25  601  	struct iommu_hwpt_vtd_s1 *s1_cfg = &domain->s1_cfg;
111bf85c68f6ed Lu Baolu 2023-10-25  602  	pgd_t *s1_gpgd = (pgd_t *)(uintptr_t)domain->s1_pgtbl;
111bf85c68f6ed Lu Baolu 2023-10-25  603  	struct dmar_domain *s2_domain = domain->s2_domain;
111bf85c68f6ed Lu Baolu 2023-10-25  604  	u16 did = domain_id_iommu(domain, iommu);
111bf85c68f6ed Lu Baolu 2023-10-25  605  	struct dma_pte *pgd = s2_domain->pgd;
111bf85c68f6ed Lu Baolu 2023-10-25  606  	struct pasid_entry *pte;
111bf85c68f6ed Lu Baolu 2023-10-25  607  
111bf85c68f6ed Lu Baolu 2023-10-25  608  	/* Address width should match the address width supported by hardware */
111bf85c68f6ed Lu Baolu 2023-10-25  609  	switch (s1_cfg->addr_width) {
111bf85c68f6ed Lu Baolu 2023-10-25  610  	case ADDR_WIDTH_4LEVEL:
111bf85c68f6ed Lu Baolu 2023-10-25  611  		break;
111bf85c68f6ed Lu Baolu 2023-10-25  612  	case ADDR_WIDTH_5LEVEL:
111bf85c68f6ed Lu Baolu 2023-10-25  613  		if (!cap_fl5lp_support(iommu->cap)) {
111bf85c68f6ed Lu Baolu 2023-10-25  614  			dev_err_ratelimited(dev,
111bf85c68f6ed Lu Baolu 2023-10-25  615  					    "5-level paging not supported\n");
111bf85c68f6ed Lu Baolu 2023-10-25  616  			return -EINVAL;
111bf85c68f6ed Lu Baolu 2023-10-25  617  		}
111bf85c68f6ed Lu Baolu 2023-10-25  618  		break;
111bf85c68f6ed Lu Baolu 2023-10-25  619  	default:
111bf85c68f6ed Lu Baolu 2023-10-25  620  		dev_err_ratelimited(dev, "Invalid stage-1 address width %d\n",
111bf85c68f6ed Lu Baolu 2023-10-25  621  				    s1_cfg->addr_width);
111bf85c68f6ed Lu Baolu 2023-10-25  622  		return -EINVAL;
111bf85c68f6ed Lu Baolu 2023-10-25  623  	}
111bf85c68f6ed Lu Baolu 2023-10-25  624  
111bf85c68f6ed Lu Baolu 2023-10-25  625  	if ((s1_cfg->flags & IOMMU_VTD_S1_SRE) && !ecap_srs(iommu->ecap)) {
111bf85c68f6ed Lu Baolu 2023-10-25  626  		pr_err_ratelimited("No supervisor request support on %s\n",
111bf85c68f6ed Lu Baolu 2023-10-25  627  				   iommu->name);
111bf85c68f6ed Lu Baolu 2023-10-25  628  		return -EINVAL;
111bf85c68f6ed Lu Baolu 2023-10-25  629  	}
111bf85c68f6ed Lu Baolu 2023-10-25  630  
111bf85c68f6ed Lu Baolu 2023-10-25  631  	if ((s1_cfg->flags & IOMMU_VTD_S1_EAFE) && !ecap_eafs(iommu->ecap)) {
111bf85c68f6ed Lu Baolu 2023-10-25  632  		pr_err_ratelimited("No extended access flag support on %s\n",
111bf85c68f6ed Lu Baolu 2023-10-25  633  				   iommu->name);
111bf85c68f6ed Lu Baolu 2023-10-25  634  		return -EINVAL;
111bf85c68f6ed Lu Baolu 2023-10-25  635  	}
111bf85c68f6ed Lu Baolu 2023-10-25  636  
111bf85c68f6ed Lu Baolu 2023-10-25  637  	spin_lock(&iommu->lock);
111bf85c68f6ed Lu Baolu 2023-10-25  638  	pte = intel_pasid_get_entry(dev, pasid);
111bf85c68f6ed Lu Baolu 2023-10-25  639  	if (!pte) {
111bf85c68f6ed Lu Baolu 2023-10-25  640  		spin_unlock(&iommu->lock);
111bf85c68f6ed Lu Baolu 2023-10-25  641  		return -ENODEV;
111bf85c68f6ed Lu Baolu 2023-10-25  642  	}
111bf85c68f6ed Lu Baolu 2023-10-25  643  	if (pasid_pte_is_present(pte)) {
111bf85c68f6ed Lu Baolu 2023-10-25  644  		spin_unlock(&iommu->lock);
111bf85c68f6ed Lu Baolu 2023-10-25  645  		return -EBUSY;
111bf85c68f6ed Lu Baolu 2023-10-25  646  	}
111bf85c68f6ed Lu Baolu 2023-10-25  647  
111bf85c68f6ed Lu Baolu 2023-10-25  648  	pasid_clear_entry(pte);
111bf85c68f6ed Lu Baolu 2023-10-25  649  
111bf85c68f6ed Lu Baolu 2023-10-25  650  	if (s1_cfg->addr_width == ADDR_WIDTH_5LEVEL)
111bf85c68f6ed Lu Baolu 2023-10-25  651  		pasid_set_flpm(pte, 1);
111bf85c68f6ed Lu Baolu 2023-10-25  652  
111bf85c68f6ed Lu Baolu 2023-10-25  653  	pasid_set_flptr(pte, (uintptr_t)s1_gpgd);
111bf85c68f6ed Lu Baolu 2023-10-25  654  
111bf85c68f6ed Lu Baolu 2023-10-25  655  	if (s1_cfg->flags & IOMMU_VTD_S1_SRE) {
111bf85c68f6ed Lu Baolu 2023-10-25  656  		pasid_set_sre(pte);
111bf85c68f6ed Lu Baolu 2023-10-25  657  		if (s1_cfg->flags & IOMMU_VTD_S1_WPE)
111bf85c68f6ed Lu Baolu 2023-10-25  658  			pasid_set_wpe(pte);
111bf85c68f6ed Lu Baolu 2023-10-25  659  	}
111bf85c68f6ed Lu Baolu 2023-10-25  660  
111bf85c68f6ed Lu Baolu 2023-10-25  661  	if (s1_cfg->flags & IOMMU_VTD_S1_EAFE)
111bf85c68f6ed Lu Baolu 2023-10-25  662  		pasid_set_eafe(pte);
111bf85c68f6ed Lu Baolu 2023-10-25  663  
111bf85c68f6ed Lu Baolu 2023-10-25  664  	if (s2_domain->force_snooping)
111bf85c68f6ed Lu Baolu 2023-10-25  665  		pasid_set_pgsnp(pte);
111bf85c68f6ed Lu Baolu 2023-10-25  666  
111bf85c68f6ed Lu Baolu 2023-10-25  667  	pasid_set_slptr(pte, virt_to_phys(pgd));
111bf85c68f6ed Lu Baolu 2023-10-25  668  	pasid_set_fault_enable(pte);
111bf85c68f6ed Lu Baolu 2023-10-25  669  	pasid_set_domain_id(pte, did);
111bf85c68f6ed Lu Baolu 2023-10-25  670  	pasid_set_address_width(pte, s2_domain->agaw);
111bf85c68f6ed Lu Baolu 2023-10-25  671  	pasid_set_page_snoop(pte, !!ecap_smpwc(iommu->ecap));
1f0198fce68340 Yi Liu   2024-02-19  672  	if (s2_domain->dirty_tracking)
1f0198fce68340 Yi Liu   2024-02-19  673  		pasid_set_ssade(pte);
111bf85c68f6ed Lu Baolu 2023-10-25  674  	pasid_set_translation_type(pte, PASID_ENTRY_PGTT_NESTED);
111bf85c68f6ed Lu Baolu 2023-10-25  675  	pasid_set_present(pte);
111bf85c68f6ed Lu Baolu 2023-10-25  676  	spin_unlock(&iommu->lock);
111bf85c68f6ed Lu Baolu 2023-10-25  677  
111bf85c68f6ed Lu Baolu 2023-10-25  678  	pasid_flush_caches(iommu, pte, pasid, did);
111bf85c68f6ed Lu Baolu 2023-10-25  679  
111bf85c68f6ed Lu Baolu 2023-10-25  680  	return 0;
111bf85c68f6ed Lu Baolu 2023-10-25  681  }
81e921fd321614 Lu Baolu 2024-03-05  682  

:::::: The code at line 600 was first introduced by commit
:::::: 111bf85c68f6edb2d06c6705faab9d1649348bdb iommu/vt-d: Add helper to setup pasid nested translation

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
