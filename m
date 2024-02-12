Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9AD149E12
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 03:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707707727; cv=none; b=loYN23mMFPy6lH+RU+/+0diepwX8SrmaqKfXGdtE+Yo+IJ3f6K/7jA5nrlskNP//3zjuzUvJAG0sRFXdZnkiKt5ag/5sKyYXeAJM4Z5G+hH8CezJS/8L2NS8lDz8/dohpIW3ScH8Sz43ahvZp1b4SN2eDvxIDfsLrC8rBB5xric=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707707727; c=relaxed/simple;
	bh=wDROlH0ag1yrC+0K3q64ed//6juynqzXUx/k3kVpTE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tyrxHHiF+PVBbuEeW2yNcc5EKhDm1IliWdC/rvzed6ZwW+7QPhL8kL+0HjOCPDPnOnv3hJ2dhNnJXr0s1hYvFACuw2r7pXRk7uV67aIRFiGPxpUmITuUZiMu+cho7LlgtFhlHpvsMBC0jaEgPlsho8fKeCyySMICEHc3nX7jBQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DGdqFm/P; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGdqFm/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707707725; x=1739243725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wDROlH0ag1yrC+0K3q64ed//6juynqzXUx/k3kVpTE8=;
  b=DGdqFm/PPBusF/02iLhcPBSmqi0OuPqv3HBdNUq0qETdla1OhWMRYY1r
   05jMg10in/Oa7TK/sQR4zZMB7IoR5w6zTGW697re2rYL1ZWvDSNMhxggV
   yrEfKTDm+z3Et+h/TKZaqCoVuwEWjI6Q2v0pA3e+agmfjy77Fx8RDzTwX
   OwPC2foo3gDTObKWrCAkOWViEN7kCSBeQIwryeeJPzy7G5o6dpIDgcnzZ
   Bsy4Z4c+XHRR/VUfzVnVcVvi/8YbrpXDJjcCk+IyjXkT4s11wEfB64rRE
   ZUNkiOh1flWG2qoOJVlV0nEwzUT7kCFj58tUu8y+qt35cOSvWHzi44925
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="5506229"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="5506229"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 19:15:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="2797672"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Feb 2024 19:15:23 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZMmv-0006sw-0S;
	Mon, 12 Feb 2024 03:15:21 +0000
Date: Mon, 12 Feb 2024 11:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap-split 1/2] drivers/iommu/tegra-smmu.c:1121:14:
 warning: incompatible integer to pointer conversion assigning to 'unsigned
 long *' from 'int'
Message-ID: <202402121100.QFvWbwAi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux bitmap-split
head:   66ecb308874cc02d98589cc983af0ac5a5f9f7e4
commit: 23228578687634d7bb126bd87e3750780f409e66 [1/2] aaa
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240212/202402121100.QFvWbwAi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402121100.QFvWbwAi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402121100.QFvWbwAi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/tegra-smmu.c:1121:16: error: implicit declaration of function 'devm_bitmap_zalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           smmu->asids = devm_bitmap_zalloc(dev, soc->num_asids, GFP_KERNEL);
                         ^
   drivers/iommu/tegra-smmu.c:1121:16: note: did you mean 'iova_bitmap_alloc'?
   include/linux/iova_bitmap.h:28:35: note: 'iova_bitmap_alloc' declared here
   static inline struct iova_bitmap *iova_bitmap_alloc(unsigned long iova,
                                     ^
>> drivers/iommu/tegra-smmu.c:1121:14: warning: incompatible integer to pointer conversion assigning to 'unsigned long *' from 'int' [-Wint-conversion]
           smmu->asids = devm_bitmap_zalloc(dev, soc->num_asids, GFP_KERNEL);
                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
   drivers/irqchip/irq-ls-scfg-msi.c:362:19: error: implicit declaration of function 'devm_bitmap_zalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           msi_data->used = devm_bitmap_zalloc(&pdev->dev, msi_data->irqs_num, GFP_KERNEL);
                            ^
   drivers/irqchip/irq-ls-scfg-msi.c:362:19: note: did you mean 'iova_bitmap_alloc'?
   include/linux/iova_bitmap.h:28:35: note: 'iova_bitmap_alloc' declared here
   static inline struct iova_bitmap *iova_bitmap_alloc(unsigned long iova,
                                     ^
>> drivers/irqchip/irq-ls-scfg-msi.c:362:17: warning: incompatible integer to pointer conversion assigning to 'unsigned long *' from 'int' [-Wint-conversion]
           msi_data->used = devm_bitmap_zalloc(&pdev->dev, msi_data->irqs_num, GFP_KERNEL);
                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
   drivers/pci/controller/pcie-iproc-msi.c:262:10: error: implicit declaration of function 'bitmap_find_free_region' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           hwirq = bitmap_find_free_region(msi->bitmap, msi->nr_msi_vecs,
                   ^
   drivers/pci/controller/pcie-iproc-msi.c:290:2: error: implicit declaration of function 'bitmap_release_region' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           bitmap_release_region(msi->bitmap, hwirq,
           ^
   drivers/pci/controller/pcie-iproc-msi.c:591:16: error: implicit declaration of function 'devm_bitmap_zalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           msi->bitmap = devm_bitmap_zalloc(pcie->dev, msi->nr_msi_vecs,
                         ^
   drivers/pci/controller/pcie-iproc-msi.c:591:16: note: did you mean 'bitmap_zalloc'?
   include/linux/bitmap-core.h:22:16: note: 'bitmap_zalloc' declared here
   unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
                  ^
>> drivers/pci/controller/pcie-iproc-msi.c:591:14: warning: incompatible integer to pointer conversion assigning to 'unsigned long *' from 'int' [-Wint-conversion]
           msi->bitmap = devm_bitmap_zalloc(pcie->dev, msi->nr_msi_vecs,
                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 3 errors generated.
--
   drivers/pci/controller/dwc/pcie-designware-ep.c:691:22: error: implicit declaration of function 'devm_bitmap_zalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ep->ib_window_map = devm_bitmap_zalloc(dev, pci->num_ib_windows,
                               ^
   drivers/pci/controller/dwc/pcie-designware-ep.c:691:22: note: did you mean 'bitmap_zalloc'?
   include/linux/bitmap-core.h:22:16: note: 'bitmap_zalloc' declared here
   unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
                  ^
>> drivers/pci/controller/dwc/pcie-designware-ep.c:691:20: warning: incompatible integer to pointer conversion assigning to 'unsigned long *' from 'int' [-Wint-conversion]
           ep->ib_window_map = devm_bitmap_zalloc(dev, pci->num_ib_windows,
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-designware-ep.c:696:20: warning: incompatible integer to pointer conversion assigning to 'unsigned long *' from 'int' [-Wint-conversion]
           ep->ob_window_map = devm_bitmap_zalloc(dev, pci->num_ob_windows,
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.


vim +1121 drivers/iommu/tegra-smmu.c

d1313e7896e932 Thierry Reding     2015-01-23  1098  
89184651631713 Thierry Reding     2014-04-16  1099  struct tegra_smmu *tegra_smmu_probe(struct device *dev,
89184651631713 Thierry Reding     2014-04-16  1100  				    const struct tegra_smmu_soc *soc,
89184651631713 Thierry Reding     2014-04-16  1101  				    struct tegra_mc *mc)
89184651631713 Thierry Reding     2014-04-16  1102  {
89184651631713 Thierry Reding     2014-04-16  1103  	struct tegra_smmu *smmu;
89184651631713 Thierry Reding     2014-04-16  1104  	u32 value;
89184651631713 Thierry Reding     2014-04-16  1105  	int err;
0760e8faa960f8 Hiroshi Doyu       2012-06-25  1106  
89184651631713 Thierry Reding     2014-04-16  1107  	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
89184651631713 Thierry Reding     2014-04-16  1108  	if (!smmu)
89184651631713 Thierry Reding     2014-04-16  1109  		return ERR_PTR(-ENOMEM);
0760e8faa960f8 Hiroshi Doyu       2012-06-25  1110  
765a9d1d02b2f5 Nicolin Chen       2021-02-18  1111  	/*
765a9d1d02b2f5 Nicolin Chen       2021-02-18  1112  	 * This is a bit of a hack. Ideally we'd want to simply return this
48a7c5080a28ab Robin Murphy       2022-08-15  1113  	 * value. However iommu_device_register() will attempt to add
48a7c5080a28ab Robin Murphy       2022-08-15  1114  	 * all devices to the IOMMU before we get that far. In order
765a9d1d02b2f5 Nicolin Chen       2021-02-18  1115  	 * not to rely on global variables to track the IOMMU instance, we
765a9d1d02b2f5 Nicolin Chen       2021-02-18  1116  	 * set it here so that it can be looked up from the .probe_device()
765a9d1d02b2f5 Nicolin Chen       2021-02-18  1117  	 * callback via the IOMMU device's .drvdata field.
765a9d1d02b2f5 Nicolin Chen       2021-02-18  1118  	 */
765a9d1d02b2f5 Nicolin Chen       2021-02-18  1119  	mc->smmu = smmu;
765a9d1d02b2f5 Nicolin Chen       2021-02-18  1120  
89374244a43e51 Christophe JAILLET 2021-09-26 @1121  	smmu->asids = devm_bitmap_zalloc(dev, soc->num_asids, GFP_KERNEL);
89184651631713 Thierry Reding     2014-04-16  1122  	if (!smmu->asids)
89184651631713 Thierry Reding     2014-04-16  1123  		return ERR_PTR(-ENOMEM);
7a31f6f48bb6e3 Hiroshi DOYU       2011-11-17  1124  
7f4c9176f760f4 Thierry Reding     2017-10-12  1125  	INIT_LIST_HEAD(&smmu->groups);
89184651631713 Thierry Reding     2014-04-16  1126  	mutex_init(&smmu->lock);
7a31f6f48bb6e3 Hiroshi DOYU       2011-11-17  1127  
89184651631713 Thierry Reding     2014-04-16  1128  	smmu->regs = mc->regs;
89184651631713 Thierry Reding     2014-04-16  1129  	smmu->soc = soc;
89184651631713 Thierry Reding     2014-04-16  1130  	smmu->dev = dev;
89184651631713 Thierry Reding     2014-04-16  1131  	smmu->mc = mc;
7a31f6f48bb6e3 Hiroshi DOYU       2011-11-17  1132  
82fa58e81d9edc Nicolin Chen       2020-09-11  1133  	smmu->pfn_mask =
82fa58e81d9edc Nicolin Chen       2020-09-11  1134  		BIT_MASK(mc->soc->num_address_bits - SMMU_PTE_SHIFT) - 1;
804cb54cbb3dda Thierry Reding     2015-03-27  1135  	dev_dbg(dev, "address bits: %u, PFN mask: %#lx\n",
804cb54cbb3dda Thierry Reding     2015-03-27  1136  		mc->soc->num_address_bits, smmu->pfn_mask);
d5c152c3409ac1 Nicolin Chen       2020-09-17  1137  	smmu->tlb_mask = (1 << fls(smmu->soc->num_tlb_lines)) - 1;
11cec15bf3fb49 Thierry Reding     2015-08-06  1138  	dev_dbg(dev, "TLB lines: %u, mask: %#lx\n", smmu->soc->num_tlb_lines,
11cec15bf3fb49 Thierry Reding     2015-08-06  1139  		smmu->tlb_mask);
804cb54cbb3dda Thierry Reding     2015-03-27  1140  
89184651631713 Thierry Reding     2014-04-16  1141  	value = SMMU_PTC_CONFIG_ENABLE | SMMU_PTC_CONFIG_INDEX_MAP(0x3f);
7a31f6f48bb6e3 Hiroshi DOYU       2011-11-17  1142  
89184651631713 Thierry Reding     2014-04-16  1143  	if (soc->supports_request_limit)
89184651631713 Thierry Reding     2014-04-16  1144  		value |= SMMU_PTC_CONFIG_REQ_LIMIT(8);
7a31f6f48bb6e3 Hiroshi DOYU       2011-11-17  1145  
89184651631713 Thierry Reding     2014-04-16  1146  	smmu_writel(smmu, value, SMMU_PTC_CONFIG);
39abf8aa7dfad0 Hiroshi Doyu       2012-08-02  1147  
89184651631713 Thierry Reding     2014-04-16  1148  	value = SMMU_TLB_CONFIG_HIT_UNDER_MISS |
11cec15bf3fb49 Thierry Reding     2015-08-06  1149  		SMMU_TLB_CONFIG_ACTIVE_LINES(smmu);
7a31f6f48bb6e3 Hiroshi DOYU       2011-11-17  1150  
89184651631713 Thierry Reding     2014-04-16  1151  	if (soc->supports_round_robin_arbitration)
89184651631713 Thierry Reding     2014-04-16  1152  		value |= SMMU_TLB_CONFIG_ROUND_ROBIN_ARBITRATION;
7a31f6f48bb6e3 Hiroshi DOYU       2011-11-17  1153  
89184651631713 Thierry Reding     2014-04-16  1154  	smmu_writel(smmu, value, SMMU_TLB_CONFIG);
7a31f6f48bb6e3 Hiroshi DOYU       2011-11-17  1155  
b8fe03827b192a Russell King       2015-07-27  1156  	smmu_flush_ptc_all(smmu);
89184651631713 Thierry Reding     2014-04-16  1157  	smmu_flush_tlb(smmu);
89184651631713 Thierry Reding     2014-04-16  1158  	smmu_writel(smmu, SMMU_CONFIG_ENABLE, SMMU_CONFIG);
89184651631713 Thierry Reding     2014-04-16  1159  	smmu_flush(smmu);
7a31f6f48bb6e3 Hiroshi DOYU       2011-11-17  1160  
89184651631713 Thierry Reding     2014-04-16  1161  	tegra_smmu_ahb_enable();
7a31f6f48bb6e3 Hiroshi DOYU       2011-11-17  1162  
0b480e44700614 Joerg Roedel       2017-08-09  1163  	err = iommu_device_sysfs_add(&smmu->iommu, dev, NULL, dev_name(dev));
0b480e44700614 Joerg Roedel       2017-08-09  1164  	if (err)
0b480e44700614 Joerg Roedel       2017-08-09  1165  		return ERR_PTR(err);
0b480e44700614 Joerg Roedel       2017-08-09  1166  
2d471b20c55e13 Robin Murphy       2021-04-01  1167  	err = iommu_device_register(&smmu->iommu, &tegra_smmu_ops, dev);
48a7c5080a28ab Robin Murphy       2022-08-15  1168  	if (err) {
48a7c5080a28ab Robin Murphy       2022-08-15  1169  		iommu_device_sysfs_remove(&smmu->iommu);
48a7c5080a28ab Robin Murphy       2022-08-15  1170  		return ERR_PTR(err);
48a7c5080a28ab Robin Murphy       2022-08-15  1171  	}
96302d89a03524 Joerg Roedel       2017-08-30  1172  
d1313e7896e932 Thierry Reding     2015-01-23  1173  	if (IS_ENABLED(CONFIG_DEBUG_FS))
d1313e7896e932 Thierry Reding     2015-01-23  1174  		tegra_smmu_debugfs_init(smmu);
d1313e7896e932 Thierry Reding     2015-01-23  1175  
89184651631713 Thierry Reding     2014-04-16  1176  	return smmu;
89184651631713 Thierry Reding     2014-04-16  1177  }
d1313e7896e932 Thierry Reding     2015-01-23  1178  

:::::: The code at line 1121 was first introduced by commit
:::::: 89374244a43e51137ade6d22849ef73876f94a2b iommu/tegra-smmu: Use devm_bitmap_zalloc when applicable

:::::: TO: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
