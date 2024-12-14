Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6241A47
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 05:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734154850; cv=none; b=ADIHOvDWurT0u6g0fyM38SGPu9B3iJJaHoj3l+WTho/6qTri3oqChI36bRt6OpTiXbeM5LnTogFAUOCljczTVZ581UWuQbFosdyky7+lDHCuzRXKzzS6Bs0XH/iwvUegjfSlB7DJedVmmePNN3esNSR1APL2QrMDqhJd3reAOzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734154850; c=relaxed/simple;
	bh=pI5YpBjsS53j4/bEBd9V373w1baihbuEyNggL6s/3eo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jehz0LvH3OZLNIB6DtSi4wEn950N3F98wr1d64KiJwQpbZQH1X/NZPZFmdpGeadaPLzJjkUc/nfRq7+L5sxk8HJn7JSQoPDTY4DdZMPhNVqQMOvRB9IpuMH5kVr3WB3inDbD8k4dCp6kN5vQOACDeGV2yH210B+6IhSW0htuUvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWtmlh51; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWtmlh51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734154848; x=1765690848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pI5YpBjsS53j4/bEBd9V373w1baihbuEyNggL6s/3eo=;
  b=SWtmlh51L0eMKatx7Hy3nv8CsfVBQq/nFBGoL7RhH05kZScwzWciYrMd
   jS7Npg9tNLx7o6Xt+T8ASM33F2RYjAu3Z+YXxuVQMn1lxOBQgUaWsJkeb
   e9c7NGFVsJmMND8fpGPt5t0TROBpgWXk7ttFcEpR1JTxmk9FoMc0lbe0p
   D+r6uUtekLQVzaU4uzIQIEC5rDRaLeonBJnb7mxiOOuSlKZprb2rzNbhv
   hTb4p5f5YevNVPTduf+8aZKPwkksu49Zha/MVj+nkteD5s15DWcY4zy9i
   gznguxqtbgyzlvz4/Ki7HDJIALGqIvS/bVk7fKwFmLXLQP/NT+Q8poUj+
   Q==;
X-CSE-ConnectionGUID: 6pOs32J8SsSKEm8g1KICzA==
X-CSE-MsgGUID: qjcvds3sTRCTqk6A9kby2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34756854"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="34756854"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 21:40:47 -0800
X-CSE-ConnectionGUID: 1jFV5zEvRW2Zwr4lp/0puA==
X-CSE-MsgGUID: h/ilokCmT22mSsoZEggTYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="101815202"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Dec 2024 21:40:46 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMKtP-000Cjd-2U;
	Sat, 14 Dec 2024 05:40:43 +0000
Date: Sat, 14 Dec 2024 13:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1636/1636] drivers/iommu/loongarch_iommu.c:610:6:
 warning: no previous prototype for 'domain_deattach_iommu'
Message-ID: <202412141302.zMMD8AS7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d68dc6ee371ec5466be9b2d76bdca0b360940adc
commit: 72fe4978ee346c10869113410da1b61710dd8d8f [1636/1636] LoongArch: add iommu support
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241214/202412141302.zMMD8AS7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412141302.zMMD8AS7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141302.zMMD8AS7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/loongarch_iommu.c:610:6: warning: no previous prototype for 'domain_deattach_iommu' [-Wmissing-prototypes]
     610 | void domain_deattach_iommu(struct dom_info *priv, struct iommu_info *info)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/loongarch_iommu.c:651:29: warning: no previous prototype for 'lookup_rlooptable' [-Wmissing-prototypes]
     651 | struct iommu_rlookup_entry *lookup_rlooptable(int pcisegment)
         |                             ^~~~~~~~~~~~~~~~~
>> drivers/iommu/loongarch_iommu.c:662:25: warning: no previous prototype for 'find_iommu_by_dev' [-Wmissing-prototypes]
     662 | struct loongarch_iommu *find_iommu_by_dev(struct pci_dev  *pdev)
         |                         ^~~~~~~~~~~~~~~~~
>> drivers/iommu/loongarch_iommu.c:684:22: warning: no previous prototype for 'iommu_init_device' [-Wmissing-prototypes]
     684 | struct iommu_device *iommu_init_device(struct device *dev)
         |                      ^~~~~~~~~~~~~~~~~
>> drivers/iommu/loongarch_iommu.c:721:22: warning: no previous prototype for 'la_iommu_probe_device' [-Wmissing-prototypes]
     721 | struct iommu_device *la_iommu_probe_device(struct device *dev)
         |                      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/loongarch_iommu.c:752:20: warning: no previous prototype for 'get_iommu_info_from_dom' [-Wmissing-prototypes]
     752 | struct iommu_info *get_iommu_info_from_dom(struct dom_info *priv, struct loongarch_iommu *iommu)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/loongarch_iommu.c:767:20: warning: no previous prototype for 'domain_attach_iommu' [-Wmissing-prototypes]
     767 | struct iommu_info *domain_attach_iommu(struct dom_info *priv, struct loongarch_iommu *iommu)
         |                    ^~~~~~~~~~~~~~~~~~~
>> drivers/iommu/loongarch_iommu.c:1197:25: warning: no previous prototype for 'loongarch_get_iommu_by_devid' [-Wmissing-prototypes]
    1197 | struct loongarch_iommu *loongarch_get_iommu_by_devid(struct pci_dev *pdev)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/loongarch_iommu.c:1215:6: warning: no previous prototype for 'check_device_compat' [-Wmissing-prototypes]
    1215 | bool check_device_compat(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/iommu/loongarch_iommu.c:1344:29: warning: no previous prototype for 'create_rlookup_entry' [-Wmissing-prototypes]
    1344 | struct iommu_rlookup_entry *create_rlookup_entry(int pcisegment)
         |                             ^~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/loongarch_iommu.c:1765:19: warning: 'la_iommu_setup' defined but not used [-Wunused-function]
    1765 | static int __init la_iommu_setup(char *str)
         |                   ^~~~~~~~~~~~~~
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
