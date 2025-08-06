Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B43F260569
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 16:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754498835; cv=none; b=R2BjEsv+t7KM9ss9m09LqhF/vZaTlmenqcbeKu3uuYxPQlNDHerNWqqmtLCg2GYhDqC8fpaf+LFBZk2iR+KF9borR3yjycD956oo1g0McaLEc4vkAn+oQRwEtCJk8ofHOz7wM7BUMj1eek1PdTnM9fPJSwf2lpeRH5hGhXh/HY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754498835; c=relaxed/simple;
	bh=uH/woQatCqcyxFQoU8jkn4RvHpqeDEhHkqIeGPADvgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GRPJKxtkaEjY68q6+sAGq7ZIWjhQ5D1c98EoG0bxdOU8Gf3XWbpUod1IYdV+tM+4bIBvRQ8YopPedjPdYJu2nidxOZecgMGHUbV7mU37ydSewTnxqQGmUjVBIvmdFRQ70vYVpcJfpWDbHOev/nJUy/MnuX5cBB/Wwe0n48a8VfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMIOJ4PQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMIOJ4PQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754498832; x=1786034832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uH/woQatCqcyxFQoU8jkn4RvHpqeDEhHkqIeGPADvgA=;
  b=KMIOJ4PQ5gedGistLSkyIy7VNj5IAlm1wcN17Cvs7qWEwOL597GsEZ/u
   I0o3HXirps/aTP2ulE6+Am8k7ejy1uW7MY1HVpvqsriC6oA2Lq6GGfl32
   yjhLk39DAAs26LP8y6j4VhzTEzjx1/R0F0lD28IjFNhd8Dpr/8Jz4NCfI
   lAyL4+X3LETWsQoxIKQOntI/l7DeUJuLXXALL3rdll8NYVUsvopD23zc9
   o0p0Cn03VDbs2UCAg1Ewxtwu8BeGnPOdGgFf+GGqAilaSZkqRQpOVy2am
   +HsN/hE7UD4XGHetN1XwcBp1MuLP76bHcEJJkW2CWDsyf+fVhwzL3V9iV
   g==;
X-CSE-ConnectionGUID: 9Kxj82X6RESzurtcUwinSg==
X-CSE-MsgGUID: kuV052TuSLyy9JacNH1mJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67411497"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="67411497"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 09:47:12 -0700
X-CSE-ConnectionGUID: kXG/hdCuTwGwRyF17TeNVQ==
X-CSE-MsgGUID: AVRThEBrQn2ImMuOyTUtTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="169065939"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 06 Aug 2025 09:47:10 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujhIC-0002E7-2f;
	Wed, 06 Aug 2025 16:47:08 +0000
Date: Wed, 6 Aug 2025 18:46:33 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2658/2658] drivers/iommu/loongarch_iommu.c:610:6:
 warning: no previous prototype for function 'domain_deattach_iommu'
Message-ID: <202508061815.FqJo5TwT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8551213150db5f8eebd27273dae93f6fe258d63a
commit: 72fe4978ee346c10869113410da1b61710dd8d8f [2658/2658] LoongArch: add iommu support
config: loongarch-randconfig-2005-20250806 (https://download.01.org/0day-ci/archive/20250806/202508061815.FqJo5TwT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061815.FqJo5TwT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061815.FqJo5TwT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/loongarch_iommu.c:20:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/loongarch_iommu.c:610:6: warning: no previous prototype for function 'domain_deattach_iommu' [-Wmissing-prototypes]
     610 | void domain_deattach_iommu(struct dom_info *priv, struct iommu_info *info)
         |      ^
   drivers/iommu/loongarch_iommu.c:610:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     610 | void domain_deattach_iommu(struct dom_info *priv, struct iommu_info *info)
         | ^
         | static 
>> drivers/iommu/loongarch_iommu.c:651:29: warning: no previous prototype for function 'lookup_rlooptable' [-Wmissing-prototypes]
     651 | struct iommu_rlookup_entry *lookup_rlooptable(int pcisegment)
         |                             ^
   drivers/iommu/loongarch_iommu.c:651:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     651 | struct iommu_rlookup_entry *lookup_rlooptable(int pcisegment)
         | ^
         | static 
>> drivers/iommu/loongarch_iommu.c:662:25: warning: no previous prototype for function 'find_iommu_by_dev' [-Wmissing-prototypes]
     662 | struct loongarch_iommu *find_iommu_by_dev(struct pci_dev  *pdev)
         |                         ^
   drivers/iommu/loongarch_iommu.c:662:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     662 | struct loongarch_iommu *find_iommu_by_dev(struct pci_dev  *pdev)
         | ^
         | static 
>> drivers/iommu/loongarch_iommu.c:684:22: warning: no previous prototype for function 'iommu_init_device' [-Wmissing-prototypes]
     684 | struct iommu_device *iommu_init_device(struct device *dev)
         |                      ^
   drivers/iommu/loongarch_iommu.c:684:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     684 | struct iommu_device *iommu_init_device(struct device *dev)
         | ^
         | static 
>> drivers/iommu/loongarch_iommu.c:721:22: warning: no previous prototype for function 'la_iommu_probe_device' [-Wmissing-prototypes]
     721 | struct iommu_device *la_iommu_probe_device(struct device *dev)
         |                      ^
   drivers/iommu/loongarch_iommu.c:721:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     721 | struct iommu_device *la_iommu_probe_device(struct device *dev)
         | ^
         | static 
>> drivers/iommu/loongarch_iommu.c:752:20: warning: no previous prototype for function 'get_iommu_info_from_dom' [-Wmissing-prototypes]
     752 | struct iommu_info *get_iommu_info_from_dom(struct dom_info *priv, struct loongarch_iommu *iommu)
         |                    ^
   drivers/iommu/loongarch_iommu.c:752:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     752 | struct iommu_info *get_iommu_info_from_dom(struct dom_info *priv, struct loongarch_iommu *iommu)
         | ^
         | static 
>> drivers/iommu/loongarch_iommu.c:767:20: warning: no previous prototype for function 'domain_attach_iommu' [-Wmissing-prototypes]
     767 | struct iommu_info *domain_attach_iommu(struct dom_info *priv, struct loongarch_iommu *iommu)
         |                    ^
   drivers/iommu/loongarch_iommu.c:767:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     767 | struct iommu_info *domain_attach_iommu(struct dom_info *priv, struct loongarch_iommu *iommu)
         | ^
         | static 
>> drivers/iommu/loongarch_iommu.c:1197:25: warning: no previous prototype for function 'loongarch_get_iommu_by_devid' [-Wmissing-prototypes]
    1197 | struct loongarch_iommu *loongarch_get_iommu_by_devid(struct pci_dev *pdev)
         |                         ^
   drivers/iommu/loongarch_iommu.c:1197:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1197 | struct loongarch_iommu *loongarch_get_iommu_by_devid(struct pci_dev *pdev)
         | ^
         | static 
>> drivers/iommu/loongarch_iommu.c:1215:6: warning: no previous prototype for function 'check_device_compat' [-Wmissing-prototypes]
    1215 | bool check_device_compat(struct pci_dev *pdev)
         |      ^
   drivers/iommu/loongarch_iommu.c:1215:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1215 | bool check_device_compat(struct pci_dev *pdev)
         | ^
         | static 
>> drivers/iommu/loongarch_iommu.c:1344:29: warning: no previous prototype for function 'create_rlookup_entry' [-Wmissing-prototypes]
    1344 | struct iommu_rlookup_entry *create_rlookup_entry(int pcisegment)
         |                             ^
   drivers/iommu/loongarch_iommu.c:1344:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1344 | struct iommu_rlookup_entry *create_rlookup_entry(int pcisegment)
         | ^
         | static 
   14 warnings generated.
--
>> drivers/iommu/loongarch_iommu.c:1663: warning: Function parameter or member 'ivrs' not described in 'get_highest_supported_ivhd_type'


vim +/domain_deattach_iommu +610 drivers/iommu/loongarch_iommu.c

   609	
 > 610	void domain_deattach_iommu(struct dom_info *priv, struct iommu_info *info)
   611	{
   612		if ((priv == NULL) || (info == NULL) ||
   613			(info->dev_cnt != 0) || (info->iommu == NULL)) {
   614			pr_err("%s invalid parameter", __func__);
   615			return;
   616		}
   617		del_domain_from_list(info->iommu, priv);
   618		domain_id_free(info->iommu, info->id);
   619		spin_lock(&priv->lock);
   620		list_del(&info->list);
   621		spin_unlock(&priv->lock);
   622		kfree(info);
   623	}
   624	
   625	static void la_iommu_domain_free(struct iommu_domain *domain)
   626	{
   627		struct dom_info *priv;
   628		struct loongarch_iommu *iommu = NULL;
   629		struct iommu_info *info, *tmp;
   630	
   631		priv = to_dom_info(domain);
   632		spin_lock(&priv->lock);
   633		list_for_each_entry_safe(info, tmp, &priv->iommu_devlist, list) {
   634			if (info->dev_cnt > 0)
   635				detach_all_dev_by_domain(info);
   636			iommu = info->iommu;
   637			spin_unlock(&priv->lock);
   638			domain_deattach_iommu(priv, info);
   639			spin_lock(&priv->lock);
   640			iommu_flush_iotlb(iommu);
   641			if (!has_dom(iommu))
   642				iommu_translate_disable(iommu);
   643		}
   644		spin_unlock(&priv->lock);
   645		mutex_lock(&priv->ptl_lock);
   646		iommu_free_pagetable(priv);
   647		mutex_unlock(&priv->ptl_lock);
   648		dom_info_free(priv);
   649	}
   650	
 > 651	struct iommu_rlookup_entry *lookup_rlooptable(int pcisegment)
   652	{
   653		struct iommu_rlookup_entry *rlookupentry = NULL;
   654	
   655		list_for_each_entry(rlookupentry, &la_rlookup_iommu_list, list) {
   656			if (rlookupentry->pcisegment == pcisegment)
   657				return rlookupentry;
   658		}
   659		return NULL;
   660	}
   661	
 > 662	struct loongarch_iommu *find_iommu_by_dev(struct pci_dev  *pdev)
   663	{
   664		int pcisegment;
   665		unsigned short devid;
   666		struct iommu_rlookup_entry *rlookupentry = NULL;
   667		struct loongarch_iommu *iommu = NULL;
   668		struct pci_bus	*bus = pdev->bus;
   669	
   670		devid = PCI_DEVID(bus->number, pdev->devfn);
   671		pcisegment = pci_domain_nr(bus);
   672		rlookupentry = lookup_rlooptable(pcisegment);
   673		if (rlookupentry == NULL) {
   674			pr_info("%s find segment %d rlookupentry failed\n", __func__,
   675					pcisegment);
   676			return iommu;
   677		}
   678		iommu = rlookupentry->rlookup_table[devid];
   679		if (iommu && (!iommu->confbase))
   680			iommu = NULL;
   681		return iommu;
   682	}
   683	
 > 684	struct iommu_device *iommu_init_device(struct device *dev)
   685	{
   686		struct la_iommu_dev_data *dev_data;
   687		struct pci_dev	*pdev = to_pci_dev(dev);
   688		struct pci_bus	*bus = pdev->bus;
   689		unsigned short devid;
   690		struct loongarch_iommu *iommu = NULL;
   691		struct iommu_device *iommu_dev = ERR_PTR(-ENODEV);
   692	
   693		if (!dev_is_pci(dev))
   694			return iommu_dev;
   695	
   696		if (dev->archdata.iommu != NULL || bus == NULL) {
   697			pr_info("LA-IOMMU: bdf:0x%x has added\n", pdev->devfn);
   698			return iommu_dev;
   699		}
   700		iommu = find_iommu_by_dev(pdev);
   701		if (iommu == NULL) {
   702			pci_info(pdev, "%s find iommu failed by dev\n", __func__);
   703			return iommu_dev;
   704		}
   705		dev_data = kzalloc(sizeof(*dev_data), GFP_KERNEL);
   706		if (!dev_data)
   707			return iommu_dev;
   708		devid = PCI_DEVID(bus->number, pdev->devfn);
   709		dev_data->bdf = devid;
   710	
   711		pci_info(pdev, "%s bdf %#x iommu dev id %#x\n", __func__, dev_data->bdf, iommu->devid);
   712		/* The initial state is 0, and 1 is added only when attach dev */
   713		dev_data->count = 0;
   714		dev_data->iommu = iommu;
   715		dev_data->dev = dev;
   716		dev->archdata.iommu = dev_data;
   717		iommu_dev = &iommu->iommu_dev;
   718		return iommu_dev;
   719	}
   720	
 > 721	struct iommu_device *la_iommu_probe_device(struct device *dev)
   722	{
   723		return iommu_init_device(dev);
   724	}
   725	
   726	static struct iommu_group *la_iommu_device_group(struct device *dev)
   727	{
   728		struct iommu_group *group;
   729	
   730		/*
   731		 * We don't support devices sharing stream IDs other than PCI RID
   732		 * aliases, since the necessary ID-to-device lookup becomes rather
   733		 * impractical given a potential sparse 32-bit stream ID space.
   734		 */
   735		if (dev_is_pci(dev))
   736			group = pci_device_group(dev);
   737		else
   738			group = generic_device_group(dev);
   739		return group;
   740	}
   741	
   742	static void la_iommu_remove_device(struct device *dev)
   743	{
   744		struct la_iommu_dev_data *dev_data;
   745	
   746		iommu_group_remove_device(dev);
   747		dev_data = dev->archdata.iommu;
   748		dev->archdata.iommu = NULL;
   749		kfree(dev_data);
   750	}
   751	
 > 752	struct iommu_info *get_iommu_info_from_dom(struct dom_info *priv, struct loongarch_iommu *iommu)
   753	{
   754		struct iommu_info *info;
   755	
   756		spin_lock(&priv->lock);
   757		list_for_each_entry(info, &priv->iommu_devlist, list) {
   758			if (info->iommu == iommu) {
   759				spin_unlock(&priv->lock);
   760				return info;
   761			}
   762		}
   763		spin_unlock(&priv->lock);
   764		return NULL;
   765	}
   766	
 > 767	struct iommu_info *domain_attach_iommu(struct dom_info *priv, struct loongarch_iommu *iommu)
   768	{
   769		u32 dir_ctrl;
   770		struct iommu_info *info;
   771		unsigned long phys;
   772	
   773		info = get_iommu_info_from_dom(priv, iommu);
   774		if (info)
   775			return info;
   776	
   777		info = kzalloc(sizeof(struct iommu_info), GFP_KERNEL_ACCOUNT);
   778		if (!info)
   779			return NULL;
   780	
   781		INIT_LIST_HEAD(&info->dev_list);
   782		info->iommu = iommu;
   783		info->id = domain_id_alloc(iommu);
   784		if (info->id == -1) {
   785			pr_info("%s alloc id for domain failed\n", __func__);
   786			kfree(info);
   787			return NULL;
   788		}
   789	
   790		phys = virt_to_phys(priv->pgd);
   791		dir_ctrl = (IOMMU_LEVEL_STRIDE << 26) | (IOMMU_LEVEL_SHIFT(2) << 20);
   792		dir_ctrl |= (IOMMU_LEVEL_STRIDE <<  16) | (IOMMU_LEVEL_SHIFT(1) << 10);
   793		dir_ctrl |= (IOMMU_LEVEL_STRIDE << 6) | IOMMU_LEVEL_SHIFT(0);
   794		iommu_write_regl(iommu, LA_IOMMU_DIR_CTRL(info->id), dir_ctrl);
   795		iommu_write_regl(iommu, LA_IOMMU_PGD_HI(info->id), phys >> 32);
   796		iommu_write_regl(iommu, LA_IOMMU_PGD_LO(info->id), phys & UINT_MAX);
   797	
   798		spin_lock(&priv->lock);
   799		list_add(&info->list, &priv->iommu_devlist);
   800		spin_unlock(&priv->lock);
   801		add_domain_to_list(iommu, priv);
   802		return info;
   803	}
   804	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
