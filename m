Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2887D14D708
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 11:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735211349; cv=none; b=B4bDWDHzmO8vh2ew3WAfvFiIPOPA0H17Upl7ZMSE5TKR7t7aLrDUKcK+BKu5hUYfJoDHxP+gg6Lo2y6T8EznyzDhJVTj900gQpFVHbc5bNvGB9bV4g9X5clzmhSGcoyh4JVKB39TgZwfmAGKWzKSf2F2KfKKccrsxfqfkmt3aMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735211349; c=relaxed/simple;
	bh=pQXncJYTLJExniLEBZd69gshLKrVPNY6xiAarq6sfvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RAu/pWFQFQECbWTL6CJxXInksyUKFy1iU/qX0Pt923XAzqwvQHy0JP2ZwjiXUTwvW9nkrqRxL7ICAFaHwWkDFVh70tzVFs6bpqLG/gbq1k8qTFms+IMVo7wI3tpwvSrAaWLzzlniLkXyQ7KoE8Yqy84C8p4ndxZbCJQxQbnrrmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bthEy2MW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bthEy2MW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735211347; x=1766747347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pQXncJYTLJExniLEBZd69gshLKrVPNY6xiAarq6sfvs=;
  b=bthEy2MWqNbH/AKhyaDWLHN0WRwluQa+nzIPULX2W01fhHw7lNPraHLO
   0vc7n4jB/n8uxCnVMuomDDV48ZQbWn3IfQqByp2Kf9xoawldf67FoQMSP
   qSbCF7OH80z5XmAa/vZg2Zt6NUmZsbA8O8vu1qwmd3YS8kpW6RTlU4Lyf
   3CPMEJUE8bisQ/BBnUTqvJJmjmLLAvZRUchFdSV6VZbE+hP4P/6hx5KDS
   ma9rj0w2Ejgi2FM5yR5dq3RxtO129HIvnlR9IJOrdivb5WJlRJun/wlKB
   7JMRuu5GaqS1Tl+yJxPT4E0ojpabHV66FlQOCXQoYG9yd7UQSpVNbvhvu
   g==;
X-CSE-ConnectionGUID: 39d4TtPKRh6P04Ctiaqz6A==
X-CSE-MsgGUID: bqsB3OEgRKO+E8ZuOhRvDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="61009954"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="61009954"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 03:09:06 -0800
X-CSE-ConnectionGUID: GSl9lPm2Q/OTzyAUBLc1kQ==
X-CSE-MsgGUID: fAONYLG9Rsq/FMf0lEusBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="99746884"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Dec 2024 03:09:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQlji-0002XA-2n;
	Thu, 26 Dec 2024 11:09:02 +0000
Date: Thu, 26 Dec 2024 19:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1662/1662]
 arch/x86/kernel/zhaoxin_kh40000.c:155:26: sparse: sparse: symbol
 'kh40000_dma_direct_ops' was not declared. Should it be static?
Message-ID: <202412261949.sqULJFrV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9e7f01f21883b8c1e74302dbac8030cf2771b5ae
commit: 11557c1ae4529f133483879b7ee00b7d8c653be7 [1662/1662] x86/cpu/zhaoxin: Encapsulate access to kh40000_dma_direct_ops within function
config: x86_64-randconfig-123-20241226 (https://download.01.org/0day-ci/archive/20241226/202412261949.sqULJFrV-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412261949.sqULJFrV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412261949.sqULJFrV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kernel/zhaoxin_kh40000.c:33:15: sparse: sparse: symbol 'zhaoxin_patch_code' was not declared. Should it be static?
>> arch/x86/kernel/zhaoxin_kh40000.c:155:26: sparse: sparse: symbol 'kh40000_dma_direct_ops' was not declared. Should it be static?
   arch/x86/kernel/zhaoxin_kh40000.c:325:26: sparse: sparse: symbol 'kh40000_dma_iommu_ops' was not declared. Should it be static?

vim +/kh40000_dma_direct_ops +155 arch/x86/kernel/zhaoxin_kh40000.c

4332dbb0718135 leoliu-oc 2024-05-13   32  
4332dbb0718135 leoliu-oc 2024-05-13  @33  unsigned long zhaoxin_patch_code = ZHAOXIN_PATCH_CODE_DEFAULT;
4332dbb0718135 leoliu-oc 2024-05-13   34  
4332dbb0718135 leoliu-oc 2024-05-13   35  static int __init zhaoxin_patch_code_setup(char *str)
4332dbb0718135 leoliu-oc 2024-05-13   36  {
4332dbb0718135 leoliu-oc 2024-05-13   37  	int err = kstrtoul(str, 0, &zhaoxin_patch_code);
4332dbb0718135 leoliu-oc 2024-05-13   38  
4332dbb0718135 leoliu-oc 2024-05-13   39  	if (err || (zhaoxin_patch_code > ZHAOXIN_PATCH_CODE_MAX)) {
4332dbb0718135 leoliu-oc 2024-05-13   40  		pr_err("cmdline 'zhaoxin_patch_bitmask=%s' inappropriate\n", str);
4332dbb0718135 leoliu-oc 2024-05-13   41  		zhaoxin_patch_code = ZHAOXIN_PATCH_CODE_DEFAULT;
4332dbb0718135 leoliu-oc 2024-05-13   42  		return err;
4332dbb0718135 leoliu-oc 2024-05-13   43  	}
4332dbb0718135 leoliu-oc 2024-05-13   44  
a4738ea3785a75 leoliu-oc 2024-05-23   45  	if (ZHAOXIN_P2CW_NODE_CHECK & zhaoxin_patch_code)
4332dbb0718135 leoliu-oc 2024-05-13   46  		pr_info("zhaoxin dma patch node check is enabled\n");
4332dbb0718135 leoliu-oc 2024-05-13   47  
4332dbb0718135 leoliu-oc 2024-05-13   48  	return 0;
4332dbb0718135 leoliu-oc 2024-05-13   49  }
4332dbb0718135 leoliu-oc 2024-05-13   50  __setup("zhaoxin_patch_bitmask=", zhaoxin_patch_code_setup);
4332dbb0718135 leoliu-oc 2024-05-13   51  
4332dbb0718135 leoliu-oc 2024-05-13   52  static struct pci_dev *kh40000_get_pci_dev(struct device *dev)
4332dbb0718135 leoliu-oc 2024-05-13   53  {
4332dbb0718135 leoliu-oc 2024-05-13   54  	if (dev_is_pci(dev))
4332dbb0718135 leoliu-oc 2024-05-13   55  		return to_pci_dev(dev);
4332dbb0718135 leoliu-oc 2024-05-13   56  
4332dbb0718135 leoliu-oc 2024-05-13   57  	if (dev->parent)
4332dbb0718135 leoliu-oc 2024-05-13   58  		return kh40000_get_pci_dev(dev->parent);
4332dbb0718135 leoliu-oc 2024-05-13   59  
4332dbb0718135 leoliu-oc 2024-05-13   60  	return NULL;
4332dbb0718135 leoliu-oc 2024-05-13   61  }
4332dbb0718135 leoliu-oc 2024-05-13   62  
4332dbb0718135 leoliu-oc 2024-05-13   63  static void kh40000_sync_single_dma_for_cpu(struct device *dev, dma_addr_t paddr,
4332dbb0718135 leoliu-oc 2024-05-13   64  		enum dma_data_direction dir, bool is_iommu)
4332dbb0718135 leoliu-oc 2024-05-13   65  {
4332dbb0718135 leoliu-oc 2024-05-13   66  	u8 vid;
4332dbb0718135 leoliu-oc 2024-05-13   67  	struct pci_dev *pci;
4332dbb0718135 leoliu-oc 2024-05-13   68  	u64 dma_mask = *dev->dma_mask;
4332dbb0718135 leoliu-oc 2024-05-13   69  
4332dbb0718135 leoliu-oc 2024-05-13   70  	/* check direction */
4332dbb0718135 leoliu-oc 2024-05-13   71  	if ((dir != DMA_FROM_DEVICE) && (dir != DMA_BIDIRECTIONAL))
4332dbb0718135 leoliu-oc 2024-05-13   72  		return;
4332dbb0718135 leoliu-oc 2024-05-13   73  
4332dbb0718135 leoliu-oc 2024-05-13   74  	/* check dma capability */
4332dbb0718135 leoliu-oc 2024-05-13   75  	if (dma_mask <= DMA_BIT_MASK(32))
4332dbb0718135 leoliu-oc 2024-05-13   76  		return;
4332dbb0718135 leoliu-oc 2024-05-13   77  
4332dbb0718135 leoliu-oc 2024-05-13   78  	/* check device type */
4332dbb0718135 leoliu-oc 2024-05-13   79  	pci = kh40000_get_pci_dev(dev);
4332dbb0718135 leoliu-oc 2024-05-13   80  	if (pci == NULL)
4332dbb0718135 leoliu-oc 2024-05-13   81  		return;
4332dbb0718135 leoliu-oc 2024-05-13   82  
4332dbb0718135 leoliu-oc 2024-05-13   83  	/* get real physical address */
4332dbb0718135 leoliu-oc 2024-05-13   84  	if (is_iommu) {
4332dbb0718135 leoliu-oc 2024-05-13   85  		struct iommu_domain *domain = iommu_get_dma_domain(dev);
4332dbb0718135 leoliu-oc 2024-05-13   86  
4332dbb0718135 leoliu-oc 2024-05-13   87  		paddr = iommu_iova_to_phys(domain, paddr);
4332dbb0718135 leoliu-oc 2024-05-13   88  		if (!paddr)
4332dbb0718135 leoliu-oc 2024-05-13   89  			return;
4332dbb0718135 leoliu-oc 2024-05-13   90  	}
4332dbb0718135 leoliu-oc 2024-05-13   91  
4332dbb0718135 leoliu-oc 2024-05-13   92  	/* check node or not */
4332dbb0718135 leoliu-oc 2024-05-13   93  	if ((zhaoxin_patch_code & ZHAOXIN_P2CW_NODE_CHECK)
4332dbb0718135 leoliu-oc 2024-05-13   94  	   && pfn_to_nid(PFN_DOWN(paddr)) == dev_to_node(dev))
4332dbb0718135 leoliu-oc 2024-05-13   95  		return;
4332dbb0718135 leoliu-oc 2024-05-13   96  
4332dbb0718135 leoliu-oc 2024-05-13   97  	/* flush data by one pci read cycle */
4332dbb0718135 leoliu-oc 2024-05-13   98  	pci_read_config_byte(pci, PCI_VENDOR_ID, &vid);
4332dbb0718135 leoliu-oc 2024-05-13   99  }
4332dbb0718135 leoliu-oc 2024-05-13  100  
4332dbb0718135 leoliu-oc 2024-05-13  101  /* zhaoxin kh-40000 direct dma ops */
4332dbb0718135 leoliu-oc 2024-05-13  102  static void *kh40000_dma_direct_alloc(struct device *dev, size_t size,
4332dbb0718135 leoliu-oc 2024-05-13  103  		dma_addr_t *addr, gfp_t gfp, unsigned long attrs)
4332dbb0718135 leoliu-oc 2024-05-13  104  {
4332dbb0718135 leoliu-oc 2024-05-13  105  	if (dev->coherent_dma_mask > DMA_BIT_MASK(32))
4332dbb0718135 leoliu-oc 2024-05-13  106  		gfp |= __GFP_THISNODE;
4332dbb0718135 leoliu-oc 2024-05-13  107  
4332dbb0718135 leoliu-oc 2024-05-13  108  	return dma_direct_alloc(dev, size, addr, gfp, attrs);
4332dbb0718135 leoliu-oc 2024-05-13  109  }
4332dbb0718135 leoliu-oc 2024-05-13  110  
4332dbb0718135 leoliu-oc 2024-05-13  111  static void kh40000_dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
4332dbb0718135 leoliu-oc 2024-05-13  112  		size_t size, enum dma_data_direction dir, unsigned long attrs)
4332dbb0718135 leoliu-oc 2024-05-13  113  {
4332dbb0718135 leoliu-oc 2024-05-13  114  	kh40000_sync_single_dma_for_cpu(dev, addr, dir, 0);
4332dbb0718135 leoliu-oc 2024-05-13  115  	dma_direct_unmap_page(dev, addr, size, dir, attrs);
4332dbb0718135 leoliu-oc 2024-05-13  116  }
4332dbb0718135 leoliu-oc 2024-05-13  117  
4332dbb0718135 leoliu-oc 2024-05-13  118  static void kh40000_dma_direct_sync_sg_for_cpu(struct device *dev,
4332dbb0718135 leoliu-oc 2024-05-13  119  		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
4332dbb0718135 leoliu-oc 2024-05-13  120  {
4332dbb0718135 leoliu-oc 2024-05-13  121  	struct scatterlist *sg;
4332dbb0718135 leoliu-oc 2024-05-13  122  	int i;
4332dbb0718135 leoliu-oc 2024-05-13  123  
4332dbb0718135 leoliu-oc 2024-05-13  124  	for_each_sg(sgl,  sg, nents, i)
4332dbb0718135 leoliu-oc 2024-05-13  125  		kh40000_sync_single_dma_for_cpu(dev, sg_dma_address(sg), dir, 0);
4332dbb0718135 leoliu-oc 2024-05-13  126  
4332dbb0718135 leoliu-oc 2024-05-13  127  	dma_direct_sync_sg_for_cpu(dev, sgl, nents, dir);
4332dbb0718135 leoliu-oc 2024-05-13  128  }
4332dbb0718135 leoliu-oc 2024-05-13  129  
4332dbb0718135 leoliu-oc 2024-05-13  130  static void kh40000_dma_direct_sync_single_for_cpu(struct device *dev,
4332dbb0718135 leoliu-oc 2024-05-13  131  		dma_addr_t addr, size_t size, enum dma_data_direction dir)
4332dbb0718135 leoliu-oc 2024-05-13  132  {
4332dbb0718135 leoliu-oc 2024-05-13  133  	kh40000_sync_single_dma_for_cpu(dev, addr, dir, 0);
4332dbb0718135 leoliu-oc 2024-05-13  134  	dma_direct_sync_single_for_cpu(dev, addr, size, dir);
4332dbb0718135 leoliu-oc 2024-05-13  135  }
4332dbb0718135 leoliu-oc 2024-05-13  136  
4332dbb0718135 leoliu-oc 2024-05-13  137  static void kh40000_dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
4332dbb0718135 leoliu-oc 2024-05-13  138  		int nents, enum dma_data_direction dir, unsigned long attrs)
4332dbb0718135 leoliu-oc 2024-05-13  139  {
4332dbb0718135 leoliu-oc 2024-05-13  140  	struct scatterlist *sg;
4332dbb0718135 leoliu-oc 2024-05-13  141  	int i;
4332dbb0718135 leoliu-oc 2024-05-13  142  
4332dbb0718135 leoliu-oc 2024-05-13  143  	for_each_sg(sgl,  sg, nents, i)
4332dbb0718135 leoliu-oc 2024-05-13  144  		kh40000_sync_single_dma_for_cpu(dev, sg_dma_address(sg), dir, 0);
4332dbb0718135 leoliu-oc 2024-05-13  145  
4332dbb0718135 leoliu-oc 2024-05-13  146  	dma_direct_unmap_sg(dev, sgl, nents, dir, attrs);
4332dbb0718135 leoliu-oc 2024-05-13  147  }
4332dbb0718135 leoliu-oc 2024-05-13  148  
4332dbb0718135 leoliu-oc 2024-05-13  149  static void kh40000_dma_direct_unmap_resource(struct device *dev, dma_addr_t addr,
4332dbb0718135 leoliu-oc 2024-05-13  150  		size_t size, enum dma_data_direction dir, unsigned long attrs)
4332dbb0718135 leoliu-oc 2024-05-13  151  {
4332dbb0718135 leoliu-oc 2024-05-13  152  	kh40000_sync_single_dma_for_cpu(dev, addr, dir, 0);
4332dbb0718135 leoliu-oc 2024-05-13  153  }
4332dbb0718135 leoliu-oc 2024-05-13  154  
4332dbb0718135 leoliu-oc 2024-05-13 @155  const struct dma_map_ops kh40000_dma_direct_ops = {
4332dbb0718135 leoliu-oc 2024-05-13  156  	.flags			= DMA_F_PCI_P2PDMA_SUPPORTED,
4332dbb0718135 leoliu-oc 2024-05-13  157  	.alloc			= kh40000_dma_direct_alloc,
4332dbb0718135 leoliu-oc 2024-05-13  158  	.sync_sg_for_cpu	= kh40000_dma_direct_sync_sg_for_cpu,
4332dbb0718135 leoliu-oc 2024-05-13  159  	.unmap_page		= kh40000_dma_direct_unmap_page,
4332dbb0718135 leoliu-oc 2024-05-13  160  	.sync_single_for_cpu	= kh40000_dma_direct_sync_single_for_cpu,
4332dbb0718135 leoliu-oc 2024-05-13  161  	.unmap_sg		= kh40000_dma_direct_unmap_sg,
4332dbb0718135 leoliu-oc 2024-05-13  162  	.unmap_resource		= kh40000_dma_direct_unmap_resource,
4332dbb0718135 leoliu-oc 2024-05-13  163  	.dma_supported		= dma_direct_supported,
4332dbb0718135 leoliu-oc 2024-05-13  164  	.free			= dma_direct_free,
4332dbb0718135 leoliu-oc 2024-05-13  165  	.alloc_pages		= dma_direct_alloc_pages,
4332dbb0718135 leoliu-oc 2024-05-13  166  	.free_pages		= dma_direct_free_pages,
4332dbb0718135 leoliu-oc 2024-05-13  167  	.sync_single_for_device	= dma_direct_sync_single_for_device,
4332dbb0718135 leoliu-oc 2024-05-13  168  	.sync_sg_for_device	= dma_direct_sync_sg_for_device,
4332dbb0718135 leoliu-oc 2024-05-13  169  	.get_required_mask	= dma_direct_get_required_mask,
4332dbb0718135 leoliu-oc 2024-05-13  170  	.max_mapping_size	= dma_direct_max_mapping_size,
4332dbb0718135 leoliu-oc 2024-05-13  171  	.mmap			= dma_direct_mmap,
4332dbb0718135 leoliu-oc 2024-05-13  172  	.get_sgtable		= dma_direct_get_sgtable,
4332dbb0718135 leoliu-oc 2024-05-13  173  	.map_page		= dma_direct_map_page,
4332dbb0718135 leoliu-oc 2024-05-13  174  	.map_sg			= dma_direct_map_sg,
4332dbb0718135 leoliu-oc 2024-05-13  175  	.map_resource		= dma_direct_map_resource,
4332dbb0718135 leoliu-oc 2024-05-13  176  };
ef20808db09987 leoliu-oc 2024-03-22  177  

:::::: The code at line 155 was first introduced by commit
:::::: 4332dbb07181359cccca3ba757ef54e434fb1296 Add kh40000_direct_dma_ops for KH-40000 platform

:::::: TO: leoliu-oc <leoliu-oc@zhaoxin.com>
:::::: CC: leoliu-oc <leoliu-oc@zhaoxin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
