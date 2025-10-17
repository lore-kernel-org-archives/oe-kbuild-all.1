Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0103FCC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 00:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760659983; cv=none; b=Df4ILgJZM8xMne3McOfm6xiHJjUjiGmIPimLqvmZBXw5bfivthhEHMEf3WyJsAJNHwUkvDA6QH5EtC1ofE4TLTV4S3zNGhFt8BhKeDWY3OOQv5bNIE1e301cBLqwZ0EffxsP6FQcHl2I9t4743d0vBJYAN2nS5feS4efXjjI4zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760659983; c=relaxed/simple;
	bh=sLkx5K3ubEehIQl20JUGCa7AKISTtbLx4XHcrX6YMpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IYzFzIMVBszRFE3r/hMa20ea7yDrdFQd+rKjJB+dFhmtwd1jY/Lxe10uX6QZgQyQhHc8g4glwkDcr3oRkTBr0KglN1YoT3+3kYu9VSdy6jjePnciIlOe6eAvPgPOjZjZM55HuJSFvbu0fZA5HIPR1POP6yBr3X6x0sco9qfGik8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUKDR/tL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUKDR/tL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760659978; x=1792195978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sLkx5K3ubEehIQl20JUGCa7AKISTtbLx4XHcrX6YMpQ=;
  b=HUKDR/tLWi3Qc2u1iii+iH1NY75jK6yQvzQxrfM8alUH5nHsxb/Is+Q5
   y0anfDfgqIH+s+NT8WrPDwzjdPGQvr+Vs/zPutzXYykSQt5H3pBH5TKMe
   3gFARrxVc/G006jyzxFOl14ThVBuqexuE61Zu/Ze+EQ8fnugEcgnQjDlP
   FI7WNUJekxqjBq2ti7VOkLNtwssP1Y9c5lehvc65JlOEQ8JH90TKsVS9o
   xeOFNp+fDiB4BqCDf1fWV4ZV6OcpROLongp978ggmtt4YuLYPsIRC3mlU
   6e2xZC0PHwB8+3Uz9ORZw3S0UjokDHotNEARkASRzlEQJRwJU8O0/Aa3N
   A==;
X-CSE-ConnectionGUID: 02dSB8C2QC2Opxz9szx7cA==
X-CSE-MsgGUID: 4rJLCeLXSOSzdI82va8J0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62769964"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62769964"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 17:12:57 -0700
X-CSE-ConnectionGUID: bbJ46G5JRxaMgz1FMIFmSg==
X-CSE-MsgGUID: L6qFj+D4TYOArQhgwzBd3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="181729765"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 16 Oct 2025 17:12:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Y5V-0005Lj-2t;
	Fri, 17 Oct 2025 00:12:53 +0000
Date: Fri, 17 Oct 2025 08:12:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2976/2976] drivers/coda/coda.c:496:11: error:
 call to undeclared function 'dev_iommu_priv_get'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202510170815.7lnVu89P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   65461ffb14372269f333f0e18867775c14741e76
commit: ad540a13eb8292fc92651b3bf281088a502a85f9 [2976/2976] virtcca feature: fix msi iova map
config: arm64-randconfig-004-20251017 (https://download.01.org/0day-ci/archive/20251017/202510170815.7lnVu89P-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170815.7lnVu89P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170815.7lnVu89P-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/coda/coda.c:5:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2243:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/coda/coda.c:496:11: error: call to undeclared function 'dev_iommu_priv_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     496 |         master = dev_iommu_priv_get(dev);
         |                  ^
   drivers/coda/coda.c:496:11: note: did you mean 'dev_iommu_fwspec_get'?
   include/linux/iommu.h:1498:36: note: 'dev_iommu_fwspec_get' declared here
    1498 | static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
         |                                    ^
>> drivers/coda/coda.c:496:9: error: incompatible integer to pointer conversion assigning to 'struct arm_smmu_master *' from 'int' [-Wint-conversion]
     496 |         master = dev_iommu_priv_get(dev);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/coda/coda.c:478:5: warning: no previous prototype for function 'virtcca_secure_dev_operator' [-Wmissing-prototypes]
     478 | int virtcca_secure_dev_operator(struct device *dev, void *domain)
         |     ^
   drivers/coda/coda.c:478:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     478 | int virtcca_secure_dev_operator(struct device *dev, void *domain)
         | ^
         | static 
   2 warnings and 2 errors generated.
--
   In file included from drivers/coda/coda_vfio.c:5:
   In file included from include/linux/io-pgtable.h:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2243:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/coda/coda_vfio.c:171:12: error: call to undeclared function 'iommu_pgsize'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     171 |                 pgsize = iommu_pgsize(domain, iova, paddr, size, &count);
         |                          ^
>> drivers/coda/coda_vfio.c:192:21: error: incomplete definition of type 'const struct iommu_domain_ops'
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
   2 warnings and 4 errors generated.


vim +/dev_iommu_priv_get +496 drivers/coda/coda.c

   464	
   465	/**
   466	 * virtcca_secure_dev_operator - Implement security settings for corresponding devices
   467	 * targeting the secure smmu domain
   468	 * @domain: The handle of iommu_domain
   469	 * @dev: Secure device
   470	 *
   471	 * Returns:
   472	 * %0 if the domain does not need to enable secure or the domain
   473	 * successfully set up security features
   474	 * %-EINVAL if the smmu does not initialize secure state
   475	 * %-ENOMEM if the device create secure ste failed
   476	 * %-ENOENT if the device does not have fwspec
   477	 */
   478	int virtcca_secure_dev_operator(struct device *dev, void *domain)
   479	{
   480		int i, j;
   481		int ret;
   482		struct iommu_domain *iommu_domain = (struct iommu_domain *)domain;
   483		struct iommu_fwspec *fwspec = NULL;
   484		struct arm_smmu_device *smmu = NULL;
   485		struct arm_smmu_domain *smmu_domain = NULL;
   486		struct arm_smmu_master *master = NULL;
   487	
   488		if (!is_virtcca_cvm_enable())
   489			return 0;
   490	
   491		fwspec = dev_iommu_fwspec_get(dev);
   492		if (!fwspec)
   493			return -ENOENT;
   494	
   495		smmu_domain = to_smmu_domain(iommu_domain);
 > 496		master = dev_iommu_priv_get(dev);
   497		smmu = master->smmu;
   498	
   499		if (!smmu && !virtcca_smmu_enable(smmu)) {
   500			dev_err(smmu->dev, "CoDA: security smmu not initialized for the device\n");
   501			return -EINVAL;
   502		}
   503	
   504		ret = virtcca_enable_secure_dev(smmu_domain, master, dev);
   505		if (ret)
   506			return ret;
   507	
   508		for (i = 0; i < master->num_streams; i++) {
   509			u32 sid = master->streams[i].id;
   510			/* Bridged PCI devices may end up with duplicated IDs */
   511			for (j = 0; j < i; j++)
   512				if (master->streams[j].id == sid)
   513					break;
   514			if (j < i)
   515				continue;
   516			if (virtcca_secure_dev_ste_create(smmu, master, sid))
   517				return -ENOMEM;
   518		}
   519	
   520		dev_info(smmu->dev, "CoDA: attach confidential dev: %s", dev_name(dev));
   521	
   522		return ret;
   523	}
   524	EXPORT_SYMBOL_GPL(virtcca_secure_dev_operator);
   525	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
