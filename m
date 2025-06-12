Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC5379E1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 21:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749764526; cv=none; b=S1rza0c9e8RAB9FJmvBoAhB6XYDpPknG+aD42ETrXj5UuUi7b7I8+jFT/h9EVeZt4UFtvjZ3VAJj8HzIuSxZliVy3+4ew4wqmJ5PQNz1vPLfOkIW8e9oyp3ppIDnqMCvNk3jTZ3aS+pjlmI0TQLMv+qYMnFft0vYpoKsKGs/DWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749764526; c=relaxed/simple;
	bh=EO78q6Po2vkB/pgJax/1eati7P4OwHH4huVs4RdH2XM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aRUIQ1nd6jb2+djuL7SL0l+IaTrBGAo+QpNziNEqzlq++DkunfWysdLf/EeuuRTDFRC5Q6TMdF0Tp6EMrnOurXH+Us+IHaypI5rO+7ZRcIBvvRPy1TM7O+9RCmO79xFpcLvZPKYGSOlM2msoWyP3YC/iIzorBNaPFtAUx+WUft8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCF9eQUJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCF9eQUJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749764524; x=1781300524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EO78q6Po2vkB/pgJax/1eati7P4OwHH4huVs4RdH2XM=;
  b=CCF9eQUJDw7C4RLdP2aAzY1pQWVfdmrD5GKI5pzIPUfUn2UF7NHg864B
   9By1n8kyoLko+YRb11iQ3thMZxIW5CaCJ3T08x90CQjLX+5fplG8tIhYn
   LWOS+XPGPIEBLHPPIxvRZmNI5VM2Hkd8ZMnqv71CWVUV0BIbcCf7Wx7/g
   ggKDGe7YBqTiB6x8wLYOGVhZtE4sMjACxnZAXplJxmLV0gzoSjjdLkJuf
   KmC9f1niDhlnv3a6SW04W6sjizWNb3zRdMm0X4Tx0uSaER2JYjrdlTm5F
   c0eBX7dib8rK2ykQkFv9Wt7Irg6hPuh3lBevlKVGuioeNVPpErW9BX5SM
   w==;
X-CSE-ConnectionGUID: wNGOQYS8SxO8XWsi8Py4ig==
X-CSE-MsgGUID: NfrbqB4JSXKRdB5xdAASrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="77366777"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="77366777"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 14:42:03 -0700
X-CSE-ConnectionGUID: TWtQ0QXpTgKg0FBtgXL/uw==
X-CSE-MsgGUID: rTqcb3RnSqOMVPcnwM4udQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="148001098"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jun 2025 14:42:02 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPpgO-000Bz8-1w;
	Thu, 12 Jun 2025 21:42:00 +0000
Date: Fri, 13 Jun 2025 05:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v3 43/62]
 drivers/iommu/riscv/iommu-ir.c:118:19: warning: assignment to 'struct
 riscv_iommu_msipte *' from 'int' makes pointer from integer without a cast
Message-ID: <202506130537.VOwWWprE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v3
head:   734e8651f598d3b6b6f4bc2493a47993a03ac695
commit: 75fca604c231df0d822b78f817622d799a76ebd3 [43/62] iommu/riscv: Add IRQ domain for interrupt remapping
config: riscv-randconfig-001-20250613 (https://download.01.org/0day-ci/archive/20250613/202506130537.VOwWWprE-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130537.VOwWWprE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130537.VOwWWprE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/riscv/iommu-ir.c: In function 'riscv_iommu_irq_domain_create':
   drivers/iommu/riscv/iommu-ir.c:118:21: error: implicit declaration of function 'iommu_alloc_pages_node'; did you mean 'iommu_alloc_pages_node_sz'? [-Werror=implicit-function-declaration]
     domain->msi_root = iommu_alloc_pages_node(domain->numa_node,
                        ^~~~~~~~~~~~~~~~~~~~~~
                        iommu_alloc_pages_node_sz
>> drivers/iommu/riscv/iommu-ir.c:118:19: warning: assignment to 'struct riscv_iommu_msipte *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     domain->msi_root = iommu_alloc_pages_node(domain->numa_node,
                      ^
   drivers/iommu/riscv/iommu-ir.c:125:3: error: too many arguments to function 'iommu_free_pages'
      iommu_free_pages(domain->msi_root, domain->msi_order);
      ^~~~~~~~~~~~~~~~
   In file included from drivers/iommu/riscv/iommu-ir.c:10:
   drivers/iommu/riscv/../iommu-pages.h:50:6: note: declared here
    void iommu_free_pages(void *virt);
         ^~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c:133:3: error: too many arguments to function 'iommu_free_pages'
      iommu_free_pages(domain->msi_root, domain->msi_order);
      ^~~~~~~~~~~~~~~~
   In file included from drivers/iommu/riscv/iommu-ir.c:10:
   drivers/iommu/riscv/../iommu-pages.h:50:6: note: declared here
    void iommu_free_pages(void *virt);
         ^~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c:143:3: error: too many arguments to function 'iommu_free_pages'
      iommu_free_pages(domain->msi_root, domain->msi_order);
      ^~~~~~~~~~~~~~~~
   In file included from drivers/iommu/riscv/iommu-ir.c:10:
   drivers/iommu/riscv/../iommu-pages.h:50:6: note: declared here
    void iommu_free_pages(void *virt);
         ^~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c: In function 'riscv_iommu_irq_domain_remove':
   drivers/iommu/riscv/iommu-ir.c:196:2: error: too many arguments to function 'iommu_free_pages'
     iommu_free_pages(domain->msi_root, domain->msi_order);
     ^~~~~~~~~~~~~~~~
   In file included from drivers/iommu/riscv/iommu-ir.c:10:
   drivers/iommu/riscv/../iommu-pages.h:50:6: note: declared here
    void iommu_free_pages(void *virt);
         ^~~~~~~~~~~~~~~~
   At top level:
   drivers/iommu/riscv/iommu-ir.c:46:15: warning: 'riscv_iommu_ir_nr_msiptes' defined but not used [-Wunused-function]
    static size_t riscv_iommu_ir_nr_msiptes(struct riscv_iommu_domain *domain)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c:34:35: warning: 'riscv_iommu_ir_get_msipte' defined but not used [-Wunused-function]
    static struct riscv_iommu_msipte *riscv_iommu_ir_get_msipte(struct riscv_iommu_domain *domain,
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +118 drivers/iommu/riscv/iommu-ir.c

    94	
    95	int riscv_iommu_irq_domain_create(struct riscv_iommu_domain *domain,
    96					  struct device *dev)
    97	{
    98		struct riscv_iommu_device *iommu = dev_to_iommu(dev);
    99		struct fwnode_handle *fn;
   100		char *fwname;
   101	
   102		if (domain->irqdomain) {
   103			dev_set_msi_domain(dev, domain->irqdomain);
   104			return 0;
   105		}
   106	
   107		if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_MSI_FLAT)) {
   108			dev_warn(iommu->dev, "Cannot enable interrupt remapping\n");
   109			return 0;
   110		}
   111	
   112		spin_lock_init(&domain->msi_lock);
   113		/*
   114		 * TODO: The hypervisor should be in control of this size. For now
   115		 * we just allocate enough space for 512 VCPUs.
   116		 */
   117		domain->msi_order = 1;
 > 118		domain->msi_root = iommu_alloc_pages_node(domain->numa_node,
   119							  GFP_KERNEL_ACCOUNT, domain->msi_order);
   120		if (!domain->msi_root)
   121			return -ENOMEM;
   122	
   123		fwname = kasprintf(GFP_KERNEL, "IOMMU-IR-%s", dev_name(dev));
   124		if (!fwname) {
   125			iommu_free_pages(domain->msi_root, domain->msi_order);
   126			return -ENOMEM;
   127		}
   128	
   129		fn = irq_domain_alloc_named_fwnode(fwname);
   130		kfree(fwname);
   131		if (!fn) {
   132			dev_err(iommu->dev, "Couldn't allocate fwnode\n");
   133			iommu_free_pages(domain->msi_root, domain->msi_order);
   134			return -ENOMEM;
   135		}
   136	
   137		domain->irqdomain = irq_domain_create_hierarchy(dev_get_msi_domain(dev),
   138								0, 0, fn,
   139								&riscv_iommu_irq_domain_ops,
   140								domain);
   141		if (!domain->irqdomain) {
   142			dev_err(iommu->dev, "Failed to create IOMMU irq domain\n");
   143			iommu_free_pages(domain->msi_root, domain->msi_order);
   144			irq_domain_free_fwnode(fn);
   145			return -ENOMEM;
   146		}
   147	
   148		domain->irqdomain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT |
   149					    IRQ_DOMAIN_FLAG_ISOLATED_MSI;
   150		domain->irqdomain->msi_parent_ops = &riscv_iommu_msi_parent_ops;
   151		irq_domain_update_bus_token(domain->irqdomain, DOMAIN_BUS_MSI_REMAP);
   152		dev_set_msi_domain(dev, domain->irqdomain);
   153	
   154		return 0;
   155	}
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
