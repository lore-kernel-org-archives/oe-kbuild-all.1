Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9D9157469
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 13:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732800709; cv=none; b=YULebXtYg83zu7YVqwOxyRB7JGU9429uKivjpGXbD+6cZZC//TQWFZlGZlVeYhkLdSO3JLcIaGWhDYm9zjPhL39trPLAvz1Jf3WpbggZFvpKINGz6iHGSrfY69JEQz8PGY/RFXEY0csUYa+FcWIKQdXos6Hvu9m6ekEaKNIYOb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732800709; c=relaxed/simple;
	bh=6pofEh33BLyPfGxuGQ6ZBp2hQse8dUGYK6aRlwG2jrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uO1GUnq0aXAGNBI6UeAOm//2SbCSYY3hHwJjowRYEjeWvQBAgfAGt4lCClxaglQOjfNNAw8/mikHt8z0a8nKTO+U1n88+/W7AhMp2l92o5d95v59+lXZQLwkg85AraFCwLeCqB0sUB1L3VfbautiDpPz6XzYJ6b3530OSF0G2wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUKVxtyc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUKVxtyc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732800707; x=1764336707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6pofEh33BLyPfGxuGQ6ZBp2hQse8dUGYK6aRlwG2jrM=;
  b=WUKVxtycuEfFvLfSQDrvR77Pv/wYl40RQbwVU+3jNZv2BUxRls1ngC1u
   Xl0DX0HQiwKhtjKgguGVjWQ2Hrl+V/z5vjPT/EwtWuBKbpXbsJAgQigwo
   hiv469l6h8PR5w9hhhaWyw1MOhJ60F60MnTm9+66cckmUk/PbxTmUHA2o
   Y0E6hvYkbV98QlSSDztejNc8/Msj9+nvhFdqpTALCvlfb9LEt7lz3jjZM
   JPJjXhRjtZpJNCQB/iBx+kfm4L6OG7gbI2tc0ThrroWb4aYeeWtDlNgqx
   bbTeNBNZFs4ztGIdeCTqWCVqaPkDtPZOjDtkiRBCPXvgDOho+fUrDPhWy
   Q==;
X-CSE-ConnectionGUID: cp610GCXRKe79DDcwm4QgQ==
X-CSE-MsgGUID: XwKlXBpzQA6+6IE6Fca4uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33089505"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="33089505"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 05:31:46 -0800
X-CSE-ConnectionGUID: gk460yxRS/yaM/B6125Gmg==
X-CSE-MsgGUID: lc+3g8M9SZu00Pndtsjq3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="123202671"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Nov 2024 05:31:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGecQ-0009c5-2V;
	Thu, 28 Nov 2024 13:31:42 +0000
Date: Thu, 28 Nov 2024 21:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1540/1540]
 arch/arm64/kvm/../../../virt/kvm/vfio.c:581:5: warning: no previous
 prototype for 'cvm_smmu_domain_judge'
Message-ID: <202411282114.3K6QSB4D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   95bc69473a373c2e578d4fc39734e5811a03ead3
commit: ad540a13eb8292fc92651b3bf281088a502a85f9 [1540/1540] virtcca feature: fix msi iova map
config: arm64-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241128/202411282114.3K6QSB4D-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411282114.3K6QSB4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411282114.3K6QSB4D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/../../../virt/kvm/vfio.c:518:5: warning: no previous prototype for 'find_arm_smmu_domain' [-Wmissing-prototypes]
     518 | int find_arm_smmu_domain(struct device *dev, void *data)
         |     ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/vfio.c:581:5: warning: no previous prototype for 'cvm_smmu_domain_judge' [-Wmissing-prototypes]
     581 | int cvm_smmu_domain_judge(struct device *dev, void *data)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/vfio.c:599:5: warning: no previous prototype for 'virtcca_cvm_smmu_domain_judge' [-Wmissing-prototypes]
     599 | int virtcca_cvm_smmu_domain_judge(struct iommu_group *group, struct arm_smmu_domain *smmu_domain)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/vfio.c:616:5: warning: no previous prototype for 'virtcca_iommu_group_map_msi_address' [-Wmissing-prototypes]
     616 | int virtcca_iommu_group_map_msi_address(struct kvm *kvm, struct kvm_vfio_file *kvf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   arch/arm64/kvm/virtcca_cvm.c:963:5: warning: no previous prototype for 'kvm_cvm_create_dev_ttt_levels' [-Wmissing-prototypes]
     963 | int kvm_cvm_create_dev_ttt_levels(struct kvm *kvm, struct virtcca_cvm *cvm,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/virtcca_cvm.c:1193:5: warning: no previous prototype for 'cvm_arm_smmu_domain_set_kvm' [-Wmissing-prototypes]
    1193 | int cvm_arm_smmu_domain_set_kvm(struct device *dev, void *data)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/coda/coda_vfio.c:323:5: warning: no previous prototype for 'virtcca_set_dev_msi_addr' [-Wmissing-prototypes]
     323 | int virtcca_set_dev_msi_addr(struct device *dev, void *iova)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/coda/coda.c:478:5: warning: no previous prototype for 'virtcca_secure_dev_operator' [-Wmissing-prototypes]
     478 | int virtcca_secure_dev_operator(struct device *dev, void *domain)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:330:13: warning: no previous prototype for 'virtcca_smmu_gerror_handler' [-Wmissing-prototypes]
     330 | irqreturn_t virtcca_smmu_gerror_handler(int irq, void *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:588:6: warning: no previous prototype for 'virtcca_smmu_map_init' [-Wmissing-prototypes]
     588 | bool virtcca_smmu_map_init(struct arm_smmu_device *smmu, resource_size_t ioaddr)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/cvm_smmu_domain_judge +581 arch/arm64/kvm/../../../virt/kvm/vfio.c

   512	
   513	/**
   514	 * find_arm_smmu_domain - Find smmu domain list from kvm vfio file
   515	 * @kvf: Kvm vfio file
   516	 * @smmu_domain_group_list: List of smmu domain group
   517	 */
 > 518	int find_arm_smmu_domain(struct device *dev, void *data)
   519	{
   520		int ret = 0;
   521		struct iommu_domain *domain = NULL;
   522		struct arm_smmu_domain *arm_smmu_domain = NULL;
   523		struct arm_smmu_domain *arm_smmu_domain_node = NULL;
   524		struct list_head *smmu_domain_group_list = (struct list_head *)data;
   525	
   526		domain = iommu_get_domain_for_dev(dev);
   527		arm_smmu_domain = to_smmu_domain(domain);
   528		list_for_each_entry(arm_smmu_domain_node,
   529			smmu_domain_group_list, node) {
   530			if (arm_smmu_domain_node == arm_smmu_domain) {
   531				ret = -1;
   532				break;
   533			}
   534		}
   535		if (!ret)
   536			list_add_tail(&arm_smmu_domain->node, smmu_domain_group_list);
   537	
   538		return 1;
   539	}
   540	
   541	/**
   542	 * kvm_get_arm_smmu_domain - Find kvm vfio file from kvm
   543	 * @kvm: Kvm handle
   544	 * @smmu_domain_group_list: List of smmu domain group
   545	 */
   546	void kvm_get_arm_smmu_domain(struct kvm *kvm, struct list_head *smmu_domain_group_list)
   547	{
   548		struct kvm_device *dev;
   549		struct kvm_vfio *kv;
   550		struct kvm_vfio_file *kvf;
   551		struct iommu_group *iommu_group = NULL;
   552	
   553		INIT_LIST_HEAD(smmu_domain_group_list);
   554	
   555		list_for_each_entry(dev, &kvm->devices, vm_node) {
   556			/* The device name passed through the vfio driver is called kvm-vfio */
   557			if (dev->ops && strcmp(dev->ops->name, "kvm-vfio") != 0)
   558				continue;
   559	
   560			kv = (struct kvm_vfio *)dev->private;
   561			mutex_lock(&kv->lock);
   562			list_for_each_entry(kvf, &kv->file_list, node) {
   563				iommu_group = cvm_vfio_file_iommu_group(kvf->file);
   564				iommu_group_for_each_dev(iommu_group,
   565					(void *)smmu_domain_group_list, find_arm_smmu_domain);
   566			}
   567			mutex_unlock(&kv->lock);
   568		}
   569	}
   570	
   571	/**
   572	 * cvm_smmu_domain_judge - Find the iommu group corresponding to the smmu domain
   573	 * @dev: The handle of device
   574	 * @data: Smmu domain
   575	 *
   576	 * Returns:
   577	 * %-ENXIO if domain is null
   578	 * %SMMU_DOMAIN_IS_SAME if find the iommu group corresponding to the smmu domain
   579	 * %1 if does not find the iommu group
   580	 */
 > 581	int cvm_smmu_domain_judge(struct device *dev, void *data)
   582	{
   583		struct iommu_domain *domain = NULL;
   584		struct arm_smmu_domain *arm_smmu_domain = NULL;
   585		struct arm_smmu_domain *smmu_domain = (struct arm_smmu_domain *)data;
   586	
   587		domain = iommu_get_domain_for_dev(dev);
   588		if (!domain)
   589			return -ENXIO;
   590	
   591		arm_smmu_domain = to_smmu_domain(domain);
   592		if (arm_smmu_domain == smmu_domain)
   593			return SMMU_DOMAIN_IS_SAME;
   594	
   595		return 1;
   596	}
   597	
   598	/* Judge the iommu group correspond to the smmu domain */
 > 599	int virtcca_cvm_smmu_domain_judge(struct iommu_group *group, struct arm_smmu_domain *smmu_domain)
   600	{
   601		int ret;
   602	
   603		ret = iommu_group_for_each_dev((struct iommu_group *)group,
   604			(void *)smmu_domain, cvm_smmu_domain_judge);
   605		return ret;
   606	}
   607	
   608	/**
   609	 * virtcca_iommu_group_map_msi_address - Find iommu group from kvm vfio file, map it
   610	 * @kvm: The handle of kvm
   611	 * @kvf: Kvm vfio file
   612	 * @smmu_domain: Smmu domain
   613	 * @pa: Physical address
   614	 * @map_size: Mapped size
   615	 */
 > 616	int virtcca_iommu_group_map_msi_address(struct kvm *kvm, struct kvm_vfio_file *kvf,
   617		struct arm_smmu_domain *smmu_domain, phys_addr_t pa, unsigned long map_size)
   618	{
   619		unsigned long iova;
   620		int ret = 0;
   621		struct iommu_group *iommu_group = NULL;
   622	
   623		iommu_group = cvm_vfio_file_iommu_group(kvf->file);
   624		if (iommu_group) {
   625			if (virtcca_cvm_smmu_domain_judge(iommu_group, smmu_domain) ==
   626				SMMU_DOMAIN_IS_SAME) {
   627				iova = virtcca_get_iommu_device_msi_addr(iommu_group);
   628				if (!iova)
   629					return -ENXIO;
   630	
   631				ret = virtcca_iommu_group_set_dev_msi_addr(iommu_group, &iova);
   632				if (ret)
   633					return ret;
   634	
   635				ret = cvm_map_unmap_ipa_range(kvm, iova, pa, map_size, true);
   636				if (ret)
   637					return ret;
   638			}
   639		}
   640		return ret;
   641	}
   642	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
