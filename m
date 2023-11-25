Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9075DD50B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 12:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1BwQkrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700916525; x=1732452525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rRH7vnFVNYd8UFM+InCeYRih/q9zHghla5Fz/3UuZuY=;
  b=b1BwQkrh1QStGhbTsAv2vbP9rvgIJ9fcu8NXmS3QllY4ADoRTQXZxJM6
   tDHCi5/FzlwX5EuUhPCXQhw/0skI5rAP/uDm9D6ZlMCAW7yqgO/H81dfl
   0bZHbyMCqy0IJL+Wn/uVdEfyncFlOS1D+KyNCIkVHsJ4xpQqY7D+sx2wZ
   Eekrfm2GwqwD0gc/oWx7YhKFe+j9EEnESaf/vZHDKgxWZLZcuihh7EcQ6
   ObUl6M3TYEm2eIs2yrrzrKORS8xGYkZVAOneEy5A3dMP3gQmpIjcyX/9r
   x0tWRXOBIJpWmfr1Lliq1/WTOBLGn4wZDdFl8ClucPR3CKicCb3FCs6+m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5745029"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="5745029"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 04:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="9363878"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2023 04:48:40 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6s5O-0003ym-0V;
	Sat, 25 Nov 2023 12:48:38 +0000
Date: Sat, 25 Nov 2023 20:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 38/41]
 drivers/iommu/arm/arm-smmu/arm-smmu.c:178:1: error: expected identifier or
 '(' before '{' token
Message-ID: <202311251819.wBfMTAk4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   c87a72108f7683a608ec2eb459ee92b3eeca7406
commit: 1edf61c2267928bf8ca21acf257018342828b13b [38/41] iommu/arm-smmu: Move to iommu_of_xlate()
config: arc-randconfig-r071-20231125 (https://download.01.org/0day-ci/archive/20231125/202311251819.wBfMTAk4-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251819.wBfMTAk4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251819.wBfMTAk4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu/arm-smmu.c:21:
   include/linux/acpi_iort.h:75:1: error: expected identifier or '(' before '{' token
      75 | { }
         | ^
>> drivers/iommu/arm/arm-smmu/arm-smmu.c:178:1: error: expected identifier or '(' before '{' token
     178 | {
         | ^
>> include/linux/acpi_iort.h:72:6: warning: 'iort_iommu_get_resv_regions' used but never defined
      72 | void iort_iommu_get_resv_regions(struct device *dev, struct list_head *head,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu/arm-smmu.c:177:1: warning: 'arm_smmu_register_legacy_master' used but never defined
     177 | arm_smmu_register_legacy_master(struct device *dev);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +178 drivers/iommu/arm/arm-smmu/arm-smmu.c

a9a1b0b53d8b7c drivers/iommu/arm-smmu.c              Will Deacon     2014-05-01  130  
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  131  static struct arm_smmu_master_cfg *
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  132  arm_smmu_register_legacy_master(struct device *dev)
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon     2013-06-24  133  {
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  134  	struct arm_smmu_master_cfg *cfg;
adfec2e709d2a4 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-12  135  	struct device *smmu_dev;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  136  	struct device_node *np;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  137  	struct of_phandle_iterator it;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  138  	void *data = &it;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  139  	__be32 pci_sid;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  140  	int err;
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon     2013-06-24  141  
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  142  	np = dev_get_dev_node(dev);
a6c9e3874e5759 drivers/iommu/arm/arm-smmu/arm-smmu.c Rob Herring     2023-03-10  143  	if (!np || !of_property_present(np, "#stream-id-cells")) {
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  144  		of_node_put(np);
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  145  		return ERR_PTR(-ENODEV);
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon     2013-06-24  146  	}
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon     2013-06-24  147  
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  148  	it.node = np;
d6fc5d977671d1 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-12  149  	err = driver_for_each_device(&arm_smmu_driver.driver, NULL, &data,
d6fc5d977671d1 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-12  150  				     __find_legacy_master_phandle);
adfec2e709d2a4 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-12  151  	smmu_dev = data;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  152  	of_node_put(np);
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  153  	if (err == 0)
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  154  		return ERR_PTR(-ENODEV);
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  155  	if (err < 0)
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  156  		return ERR_PTR(err);
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon     2013-06-24  157  
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  158  	if (dev_is_pci(dev)) {
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  159  		/* "mmu-masters" assumes Stream ID == Requester ID */
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  160  		pci_for_each_dma_alias(to_pci_dev(dev), __arm_smmu_get_pci_sid,
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  161  				       &pci_sid);
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  162  		it.cur = &pci_sid;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  163  		it.cur_count = 1;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  164  	}
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon     2013-06-24  165  
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  166  	cfg = kzalloc(struct_size(cfg, ids, it.cur_count), GFP_KERNEL);
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  167  	if (!cfg)
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  168  		return ERR_PTR(-ENOMEM);
44680eedf9409d drivers/iommu/arm-smmu.c              Will Deacon     2014-06-25  169  
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  170  	cfg->num_ids = it.cur_count;
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  171  	cfg->smmu = dev_get_drvdata(smmu_dev);
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  172  	of_phandle_iterator_args(&it, cfg->ids, it.cur_count);
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  173  	return 0;
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon     2013-06-24  174  }
cd221bd24ff556 drivers/iommu/arm-smmu.c              Will Deacon     2019-12-19  175  #else
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  176  static struct arm_smmu_master_cfg *
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23 @177  arm_smmu_register_legacy_master(struct device *dev);
cd221bd24ff556 drivers/iommu/arm-smmu.c              Will Deacon     2019-12-19 @178  {
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  179  	return ERR_PTR(-ENODEV);
cd221bd24ff556 drivers/iommu/arm-smmu.c              Will Deacon     2019-12-19  180  }
cd221bd24ff556 drivers/iommu/arm-smmu.c              Will Deacon     2019-12-19  181  #endif /* CONFIG_ARM_SMMU_LEGACY_DT_BINDINGS */
cd221bd24ff556 drivers/iommu/arm-smmu.c              Will Deacon     2019-12-19  182  

:::::: The code at line 178 was first introduced by commit
:::::: cd221bd24ff5567bbcc11ec0c303141a7c2b71bf iommu/arm-smmu: Allow building as a module

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
