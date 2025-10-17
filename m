Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C493C305E05
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 04:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760673827; cv=none; b=mwdjS+ymAa0gXH6h38sf5HGrLltjjpnPSMZsV6qkaW6z1vbg2X3RzS+CwoyS2abbkCl2mKsdjjP7pR7Bd2sOMIF0+B2TmF6CiOxEyFclcpw4iULMJrLYF0YaQgWMcKrIuEWXIIBaHt7u2o3BV3raFbc3QrFHPR8AcxYg8i5JaiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760673827; c=relaxed/simple;
	bh=WJm92ECObQ5J6CunLg7QywQxWnX03AjXHJ47AvuRAq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9zcbILMJNO48cl3xmDp03q6UFCsyctmoUcDQLoxP6SeG4oMGq88A57wynWsuZktaPLiybFUehx42OZOn+JBLxOttqcG0l3aK4SXYFWPxkp7rla1ZzzjP0n7q+4TR0ER22VEUrWiXQbb0YYsPBicKjAjLhJMIoJz9CrC81zW/As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSsQw83i; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSsQw83i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760673825; x=1792209825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WJm92ECObQ5J6CunLg7QywQxWnX03AjXHJ47AvuRAq0=;
  b=PSsQw83idntVjqQRSP7zGxwOv6/HkqFjzrdSFEEuUK1xR4uCxS1+Vv1b
   KFXpRDA08/iFEByzr3ybfJzYTYvfu2w3AjSwI7u+rsQ4KDWMhlnAMlYTN
   50MRaly+zyKHM8fh00wdZwLUwhmE5MkTSiqCIey2r40rFY1djiZWobndR
   vkipZXGOZWd/h0de7dROciQRNgNJ5aaRqRoRCjvHdtNIwsbduMFdRCc5n
   TV1XvRSSBU2CO6kHPMlnzJlRQw1AkevnNVOdSBvMPhLrr4dJwzWeplHkN
   rRo+OjPc7fm3y0cHJMx5JDR75iH5NE8uS557Yenm6d55QT7i7mg9yufiR
   A==;
X-CSE-ConnectionGUID: c2Y5u2xARWqjlKoQp9bK4w==
X-CSE-MsgGUID: uic2bBfmS/iWMEoyqpo1qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="50447159"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="50447159"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 21:03:45 -0700
X-CSE-ConnectionGUID: TypUd1KqS7uEAUefzD9acA==
X-CSE-MsgGUID: b1DeeOG1TiK+w3vSS3tbMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="183106245"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 16 Oct 2025 21:03:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9bgr-0005W1-3B;
	Fri, 17 Oct 2025 04:03:41 +0000
Date: Fri, 17 Oct 2025 12:02:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Kunkun Jiang <jiangkunkun@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2976/2976]
 arch/arm64/include/../../../drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:940:44:
 error: no member named 'flags' in 'struct iommu_fwspec'
Message-ID: <202510171131.XB9hn3b4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1411c9cacc81e717a12469bc436d6b114f517692
commit: 115aeeba0e638db97ec4448f77101a3a1c7c23b2 [2976/2976] iommu/arm-smmu-v3: Report IOMMU_CAP_ENFORCE_CACHE_COHERENCY for CANWBS
config: arm64-randconfig-004-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171131.XB9hn3b4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171131.XB9hn3b4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171131.XB9hn3b4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/access.c:2:
   In file included from include/linux/pci.h:1669:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/pci/access.c:13:
   In file included from arch/arm64/include/asm/virtcca_coda.h:11:
>> arch/arm64/include/../../../drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:940:44: error: no member named 'flags' in 'struct iommu_fwspec'
     940 |         return dev_iommu_fwspec_get(master->dev)->flags &
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
>> arch/arm64/include/../../../drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:941:9: error: use of undeclared identifier 'IOMMU_FWSPEC_PCI_RC_CANWBS'
     941 |                IOMMU_FWSPEC_PCI_RC_CANWBS;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/coda/coda.c:5:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/coda/coda.c:7:
   In file included from arch/arm64/include/asm/virtcca_coda.h:11:
>> arch/arm64/include/../../../drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:940:44: error: no member named 'flags' in 'struct iommu_fwspec'
     940 |         return dev_iommu_fwspec_get(master->dev)->flags &
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
>> arch/arm64/include/../../../drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:941:9: error: use of undeclared identifier 'IOMMU_FWSPEC_PCI_RC_CANWBS'
     941 |                IOMMU_FWSPEC_PCI_RC_CANWBS;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/coda/coda.c:504:11: error: call to undeclared function 'dev_iommu_priv_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     504 |         master = dev_iommu_priv_get(dev);
         |                  ^
   drivers/coda/coda.c:504:11: note: did you mean 'dev_iommu_fwspec_get'?
   include/linux/iommu.h:1598:36: note: 'dev_iommu_fwspec_get' declared here
    1598 | static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
         |                                    ^
   drivers/coda/coda.c:504:9: error: incompatible integer to pointer conversion assigning to 'struct arm_smmu_master *' from 'int' [-Wint-conversion]
     504 |         master = dev_iommu_priv_get(dev);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/coda/coda.c:486:5: warning: no previous prototype for function 'virtcca_secure_dev_operator' [-Wmissing-prototypes]
     486 | int virtcca_secure_dev_operator(struct device *dev, void *domain)
         |     ^
   drivers/coda/coda.c:486:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     486 | int virtcca_secure_dev_operator(struct device *dev, void *domain)
         | ^
         | static 
   2 warnings and 4 errors generated.
--
   In file included from drivers/coda/coda_vfio.c:5:
   In file included from include/linux/io-pgtable.h:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/coda/coda_vfio.c:8:
   In file included from arch/arm64/include/asm/virtcca_coda.h:11:
>> arch/arm64/include/../../../drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:940:44: error: no member named 'flags' in 'struct iommu_fwspec'
     940 |         return dev_iommu_fwspec_get(master->dev)->flags &
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
>> arch/arm64/include/../../../drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:941:9: error: use of undeclared identifier 'IOMMU_FWSPEC_PCI_RC_CANWBS'
     941 |                IOMMU_FWSPEC_PCI_RC_CANWBS;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/coda/coda_vfio.c:171:12: error: call to undeclared function 'iommu_pgsize'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     171 |                 pgsize = iommu_pgsize(domain, iova, paddr, size, &count);
         |                          ^
   drivers/coda/coda_vfio.c:192:21: error: incomplete definition of type 'const struct iommu_domain_ops'
     192 |         if (ret == 0 && ops->iotlb_sync_map) {
         |                         ~~~^
   include/linux/iommu.h:39:8: note: forward declaration of 'struct iommu_domain_ops'
      39 | struct iommu_domain_ops;
         |        ^
   drivers/coda/coda_vfio.c:193:12: error: incomplete definition of type 'const struct iommu_domain_ops'
     193 |                 ret = ops->iotlb_sync_map(domain, iova, size);
         |                       ~~~^
   include/linux/iommu.h:39:8: note: forward declaration of 'struct iommu_domain_ops'
      39 | struct iommu_domain_ops;
         |        ^
   drivers/coda/coda_vfio.c:257:12: error: call to undeclared function 'iommu_pgsize'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     257 |                 pgsize = iommu_pgsize(domain, iova, iova, size - unmapped, &count);
         |                          ^
   drivers/coda/coda_vfio.c:323:5: warning: no previous prototype for function 'virtcca_set_dev_msi_addr' [-Wmissing-prototypes]
     323 | int virtcca_set_dev_msi_addr(struct device *dev, void *iova)
         |     ^
   drivers/coda/coda_vfio.c:323:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     323 | int virtcca_set_dev_msi_addr(struct device *dev, void *iova)
         | ^
         | static 
   2 warnings and 6 errors generated.


vim +940 arch/arm64/include/../../../drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h

   916	
   917	void arm_smmu_clear_cd(struct arm_smmu_master *master, ioasid_t ssid);
   918	struct arm_smmu_cd *arm_smmu_get_cd_ptr(struct arm_smmu_master *master,
   919						u32 ssid);
   920	void arm_smmu_make_s1_cd(struct arm_smmu_cd *target,
   921				 struct arm_smmu_master *master,
   922				 struct arm_smmu_domain *smmu_domain);
   923	void arm_smmu_write_cd_entry(struct arm_smmu_master *master, int ssid,
   924				     struct arm_smmu_cd *cdptr,
   925				     const struct arm_smmu_cd *target);
   926	
   927	int arm_smmu_set_pasid(struct arm_smmu_master *master,
   928			       struct arm_smmu_domain *smmu_domain, ioasid_t pasid,
   929			       struct arm_smmu_cd *cd);
   930	
   931	void arm_smmu_tlb_inv_asid(struct arm_smmu_device *smmu, u16 asid);
   932	void arm_smmu_tlb_inv_range_asid(unsigned long iova, size_t size, int asid,
   933					 size_t granule, bool leaf,
   934					 struct arm_smmu_domain *smmu_domain);
   935	int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
   936				    unsigned long iova, size_t size);
   937	
   938	static inline bool arm_smmu_master_canwbs(struct arm_smmu_master *master)
   939	{
 > 940		return dev_iommu_fwspec_get(master->dev)->flags &
 > 941		       IOMMU_FWSPEC_PCI_RC_CANWBS;
   942	}
   943	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
