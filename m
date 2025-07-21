Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BFA2BE026
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 12:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753100542; cv=none; b=B+GndFBSGlfsZ48cK/u1G16eIn/VfAkOQpO86r5Llp22YS6H1ACZlTAVGOVGoqzAbJ8rOxmHdAd6AWh+zccDBbgc4TAM36NwKdmcqeTw5DsBACV2loHavtEqvXreFOw1RY0yvFFXdRHvWeAecrfGWxtiBTSb0fJl2t4dJd3K4IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753100542; c=relaxed/simple;
	bh=EOb/bKm7d+02jDIwUtanCefbkpdE4Jk/M3kY+0gMaHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d26wC97dzavfTWKjQhzBzi6XmmT5Jo9TFtyzkHnFuTKhn92IZ+qNXXMCeSIYPWHYPDw8f0UrfptJ79NNFS+/MHMtPu4N7muPkv4JyiLpjwnEETbbd50R7irIx4lXmSbrC0d0cNMI7HJ5epUpUZasnktWoJ+R/sxDHHi1sPhgL54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNZao63y; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNZao63y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753100541; x=1784636541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EOb/bKm7d+02jDIwUtanCefbkpdE4Jk/M3kY+0gMaHM=;
  b=NNZao63ylWYaU3NdEddrQYcYV4bdY8qLm2RnIzY10KbJjfb0BmkaVvWO
   E+xcjTYl3W6FYo4889g460bMULOc5tGCxe2XCgtDLNCUtqJFncANCHjvi
   7mNnwEnrM1Ti9lW8cClpxWOGB5KSnvX5Rkdilw+jZwmf1VsQ5LljuPkrX
   0x6rR/eGeLnNJn0Ib6FSuxVEJnznrxybdM3K++mxwpedsyeqemZhQ+1j9
   ai+lpizBXUPjXFC/m/qoxHCk/xdNz+qZBNV8KD4j4n5xTwx8BY84vrHV9
   5TSOnidbB2e55C7ytfeGUlunR/gbAU/qYnGhOlsA6cP0DztW0Ywb/TT9i
   Q==;
X-CSE-ConnectionGUID: Wz65XFyvTxmRm3vOsxtung==
X-CSE-MsgGUID: sF8NrU5jTDiip+nCZLJggw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="57933505"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="57933505"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 05:22:20 -0700
X-CSE-ConnectionGUID: 9SMsu6UVTzyPLar7FSmm2A==
X-CSE-MsgGUID: TJlx+MQAT1qoMzlw5DhH2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="162869852"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jul 2025 05:22:19 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udpX6-000Gn9-1p;
	Mon, 21 Jul 2025 12:22:16 +0000
Date: Mon, 21 Jul 2025 20:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2564/2564]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:1260:7:
 warning: variable 'mdev' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202507212015.E4IEaBTY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   53a788b898e925f28e495dbd4e4a7ffd349b42ba
commit: 69181c3c9413ccaa4dab458057d13efda520cb60 [2564/2564] Net: nebula_matrix: fix ci build warning
config: arm64-randconfig-004-20250721 (https://download.01.org/0day-ci/archive/20250721/202507212015.E4IEaBTY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507212015.E4IEaBTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507212015.E4IEaBTY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:6:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_product_base.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_include.h:12:
   In file included from include/linux/pci.h:1669:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
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
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:475:14: warning: variable 'hw_addr' set but not used [-Wunused-but-set-variable]
     475 |         u8 __iomem *hw_addr;
         |                     ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:676:23: warning: variable 'vfn' set but not used [-Wunused-but-set-variable]
     676 |         unsigned long vaddr, vfn;
         |                              ^
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:1260:7: warning: variable 'mdev' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1260 |                 if (IS_ERR(cdev)) {
         |                     ^~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:1283:18: note: uninitialized use occurs here
    1283 |         devm_kfree(dev, mdev);
         |                         ^~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:1260:3: note: remove the 'if' if its condition is always false
    1260 |                 if (IS_ERR(cdev)) {
         |                 ^~~~~~~~~~~~~~~~~~~
    1261 |                         dev_err(dev, "device create failed\n");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1262 |                         idr_remove(&nbl_userdev.cidr, minor);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1263 |                         mutex_unlock(&nbl_userdev.clock);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1264 |                         goto free_dev;
         |                         ~~~~~~~~~~~~~~
    1265 |                 }
         |                 ~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:1252:7: warning: variable 'mdev' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1252 |                 if (minor < 0) {
         |                     ^~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:1283:18: note: uninitialized use occurs here
    1283 |         devm_kfree(dev, mdev);
         |                         ^~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:1252:3: note: remove the 'if' if its condition is always false
    1252 |                 if (minor < 0) {
         |                 ^~~~~~~~~~~~~~~~
    1253 |                         dev_err(dev, "alloc userdev dev minor failed\n");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1254 |                         mutex_unlock(&nbl_userdev.clock);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1255 |                         goto free_dev;
         |                         ~~~~~~~~~~~~~~
    1256 |                 }
         |                 ~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:1168:35: note: initialize the variable 'mdev' to silence this warning
    1168 |         struct device *cdev = NULL, *mdev;
         |                                          ^
         |                                           = NULL
   9 warnings generated.


vim +1260 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c

bad535d287c9c1 Bennie Yan 2024-09-24  1162  
bad535d287c9c1 Bennie Yan 2024-09-24  1163  void nbl_dev_start_user_dev(struct nbl_adapter *adapter)
bad535d287c9c1 Bennie Yan 2024-09-24  1164  {
bad535d287c9c1 Bennie Yan 2024-09-24  1165  	struct nbl_dev_mgt *dev_mgt = (struct nbl_dev_mgt *)NBL_ADAPTER_TO_DEV_MGT(adapter);
bad535d287c9c1 Bennie Yan 2024-09-24  1166  	struct nbl_common_info *common = NBL_ADAPTER_TO_COMMON(adapter);
bad535d287c9c1 Bennie Yan 2024-09-24  1167  	struct device *dev = NBL_COMMON_TO_DEV(common);
bad535d287c9c1 Bennie Yan 2024-09-24  1168  	struct device *cdev = NULL, *mdev;
bad535d287c9c1 Bennie Yan 2024-09-24  1169  	struct pci_dev *pdev = NBL_COMMON_TO_PDEV(common);
bad535d287c9c1 Bennie Yan 2024-09-24  1170  	struct nbl_dev_user *user;
bad535d287c9c1 Bennie Yan 2024-09-24  1171  	void *shm_msg_ring;
bad535d287c9c1 Bennie Yan 2024-09-24  1172  	bool iommu_status = 0, remap_status = 0;
bad535d287c9c1 Bennie Yan 2024-09-24  1173  	int minor = 0, ret;
bad535d287c9c1 Bennie Yan 2024-09-24  1174  
bad535d287c9c1 Bennie Yan 2024-09-24  1175  	if (!nbl_userdev.success)
bad535d287c9c1 Bennie Yan 2024-09-24  1176  		return;
bad535d287c9c1 Bennie Yan 2024-09-24  1177  
bad535d287c9c1 Bennie Yan 2024-09-24  1178  	if (!dev_is_dma_coherent(dev))
bad535d287c9c1 Bennie Yan 2024-09-24  1179  		return;
bad535d287c9c1 Bennie Yan 2024-09-24  1180  
bad535d287c9c1 Bennie Yan 2024-09-24  1181  	if (dma_get_mask(dev) != DMA_BIT_MASK(64))
bad535d287c9c1 Bennie Yan 2024-09-24  1182  		return;
bad535d287c9c1 Bennie Yan 2024-09-24  1183  
bad535d287c9c1 Bennie Yan 2024-09-24  1184  	iommu_status = nbl_dma_iommu_status(pdev);
bad535d287c9c1 Bennie Yan 2024-09-24  1185  	remap_status = nbl_dma_remap_status(pdev);
bad535d287c9c1 Bennie Yan 2024-09-24  1186  
bad535d287c9c1 Bennie Yan 2024-09-24  1187  	/* iommu passthrough */
bad535d287c9c1 Bennie Yan 2024-09-24  1188  	if (iommu_status && !remap_status) {
bad535d287c9c1 Bennie Yan 2024-09-24  1189  		if (common->dma_dev == common->dev)
bad535d287c9c1 Bennie Yan 2024-09-24  1190  			return;
bad535d287c9c1 Bennie Yan 2024-09-24  1191  		remap_status = 1;
bad535d287c9c1 Bennie Yan 2024-09-24  1192  	}
bad535d287c9c1 Bennie Yan 2024-09-24  1193  
bad535d287c9c1 Bennie Yan 2024-09-24  1194  	shm_msg_ring = kzalloc(NBL_USER_DEV_SHMMSGRING_SIZE, GFP_KERNEL);
bad535d287c9c1 Bennie Yan 2024-09-24  1195  	if (!shm_msg_ring)
bad535d287c9c1 Bennie Yan 2024-09-24  1196  		return;
bad535d287c9c1 Bennie Yan 2024-09-24  1197  
bad535d287c9c1 Bennie Yan 2024-09-24  1198  	user = devm_kzalloc(dev, sizeof(struct nbl_dev_user), GFP_KERNEL);
bad535d287c9c1 Bennie Yan 2024-09-24  1199  	if (!user) {
bad535d287c9c1 Bennie Yan 2024-09-24  1200  		kfree(shm_msg_ring);
bad535d287c9c1 Bennie Yan 2024-09-24  1201  		return;
bad535d287c9c1 Bennie Yan 2024-09-24  1202  	}
bad535d287c9c1 Bennie Yan 2024-09-24  1203  
bad535d287c9c1 Bennie Yan 2024-09-24  1204  	if (remap_status) {
bad535d287c9c1 Bennie Yan 2024-09-24  1205  		/* mdev init */
bad535d287c9c1 Bennie Yan 2024-09-24  1206  		mdev = devm_kzalloc(dev, sizeof(struct device), GFP_KERNEL);
bad535d287c9c1 Bennie Yan 2024-09-24  1207  		if (!mdev) {
bad535d287c9c1 Bennie Yan 2024-09-24  1208  			kfree(shm_msg_ring);
bad535d287c9c1 Bennie Yan 2024-09-24  1209  			return;
bad535d287c9c1 Bennie Yan 2024-09-24  1210  		}
bad535d287c9c1 Bennie Yan 2024-09-24  1211  
bad535d287c9c1 Bennie Yan 2024-09-24  1212  		device_initialize(mdev);
bad535d287c9c1 Bennie Yan 2024-09-24  1213  		mdev->parent = dev;
bad535d287c9c1 Bennie Yan 2024-09-24  1214  
bad535d287c9c1 Bennie Yan 2024-09-24  1215  		mdev->bus = &nbl_bus_type;
bad535d287c9c1 Bennie Yan 2024-09-24  1216  
bad535d287c9c1 Bennie Yan 2024-09-24  1217  		mdev->release = nbl_mdev_device_release;
bad535d287c9c1 Bennie Yan 2024-09-24  1218  
bad535d287c9c1 Bennie Yan 2024-09-24  1219  		ret = dev_set_name(mdev, pci_name(pdev));
bad535d287c9c1 Bennie Yan 2024-09-24  1220  		if (ret) {
bad535d287c9c1 Bennie Yan 2024-09-24  1221  			dev_info(dev, "mdev set name failed\n");
bad535d287c9c1 Bennie Yan 2024-09-24  1222  			goto free_dev;
bad535d287c9c1 Bennie Yan 2024-09-24  1223  		}
bad535d287c9c1 Bennie Yan 2024-09-24  1224  
bad535d287c9c1 Bennie Yan 2024-09-24  1225  		ret = device_add(mdev);
bad535d287c9c1 Bennie Yan 2024-09-24  1226  		if (ret) {
bad535d287c9c1 Bennie Yan 2024-09-24  1227  			dev_err(dev, "mdev add failed\n");
bad535d287c9c1 Bennie Yan 2024-09-24  1228  			goto free_dev;
bad535d287c9c1 Bennie Yan 2024-09-24  1229  		}
bad535d287c9c1 Bennie Yan 2024-09-24  1230  		dev_info(dev, "MDEV: created\n");
bad535d287c9c1 Bennie Yan 2024-09-24  1231  
bad535d287c9c1 Bennie Yan 2024-09-24  1232  		devm_kfree(dev, user);
bad535d287c9c1 Bennie Yan 2024-09-24  1233  
bad535d287c9c1 Bennie Yan 2024-09-24  1234  		user = vfio_alloc_device(nbl_dev_user, vdev, mdev, &nbl_vfio_dev_ops);
bad535d287c9c1 Bennie Yan 2024-09-24  1235  		if (IS_ERR(user)) {
bad535d287c9c1 Bennie Yan 2024-09-24  1236  			device_del(mdev);
bad535d287c9c1 Bennie Yan 2024-09-24  1237  			goto free_dev;
bad535d287c9c1 Bennie Yan 2024-09-24  1238  		}
bad535d287c9c1 Bennie Yan 2024-09-24  1239  
bad535d287c9c1 Bennie Yan 2024-09-24  1240  		ret = vfio_register_emulated_iommu_dev(&user->vdev);
bad535d287c9c1 Bennie Yan 2024-09-24  1241  		if (ret) {
bad535d287c9c1 Bennie Yan 2024-09-24  1242  			vfio_put_device(&user->vdev);
bad535d287c9c1 Bennie Yan 2024-09-24  1243  			device_del(mdev);
bad535d287c9c1 Bennie Yan 2024-09-24  1244  			goto free_dev;
bad535d287c9c1 Bennie Yan 2024-09-24  1245  		}
bad535d287c9c1 Bennie Yan 2024-09-24  1246  
bad535d287c9c1 Bennie Yan 2024-09-24  1247  		user->mdev = mdev;
bad535d287c9c1 Bennie Yan 2024-09-24  1248  		mdev->driver = &nbl_mdev_driver.driver;
bad535d287c9c1 Bennie Yan 2024-09-24  1249  	} else {
bad535d287c9c1 Bennie Yan 2024-09-24  1250  		mutex_lock(&nbl_userdev.clock);
bad535d287c9c1 Bennie Yan 2024-09-24  1251  		minor = idr_alloc(&nbl_userdev.cidr, adapter, 1, MINORMASK + 1, GFP_KERNEL);
bad535d287c9c1 Bennie Yan 2024-09-24  1252  		if (minor < 0) {
bad535d287c9c1 Bennie Yan 2024-09-24  1253  			dev_err(dev, "alloc userdev dev minor failed\n");
bad535d287c9c1 Bennie Yan 2024-09-24  1254  			mutex_unlock(&nbl_userdev.clock);
bad535d287c9c1 Bennie Yan 2024-09-24  1255  			goto free_dev;
bad535d287c9c1 Bennie Yan 2024-09-24  1256  		}
bad535d287c9c1 Bennie Yan 2024-09-24  1257  
bad535d287c9c1 Bennie Yan 2024-09-24  1258  		cdev = device_create(nbl_userdev.cls, NULL, MKDEV(MAJOR(nbl_userdev.cdevt), minor),
bad535d287c9c1 Bennie Yan 2024-09-24  1259  				     NULL, pci_name(pdev));
bad535d287c9c1 Bennie Yan 2024-09-24 @1260  		if (IS_ERR(cdev)) {
bad535d287c9c1 Bennie Yan 2024-09-24  1261  			dev_err(dev, "device create failed\n");
bad535d287c9c1 Bennie Yan 2024-09-24  1262  			idr_remove(&nbl_userdev.cidr, minor);
bad535d287c9c1 Bennie Yan 2024-09-24  1263  			mutex_unlock(&nbl_userdev.clock);
bad535d287c9c1 Bennie Yan 2024-09-24  1264  			goto free_dev;
bad535d287c9c1 Bennie Yan 2024-09-24  1265  		}
bad535d287c9c1 Bennie Yan 2024-09-24  1266  		mutex_unlock(&nbl_userdev.clock);
bad535d287c9c1 Bennie Yan 2024-09-24  1267  		user->dev = cdev;
bad535d287c9c1 Bennie Yan 2024-09-24  1268  		user->minor = minor;
bad535d287c9c1 Bennie Yan 2024-09-24  1269  	}
bad535d287c9c1 Bennie Yan 2024-09-24  1270  
bad535d287c9c1 Bennie Yan 2024-09-24  1271  	user->shm_msg_ring = shm_msg_ring;
bad535d287c9c1 Bennie Yan 2024-09-24  1272  	user->adapter = adapter;
bad535d287c9c1 Bennie Yan 2024-09-24  1273  	user->iommu_status = iommu_status;
bad535d287c9c1 Bennie Yan 2024-09-24  1274  	user->remap_status = remap_status;
bad535d287c9c1 Bennie Yan 2024-09-24  1275  	atomic_set(&user->open_cnt, 0);
bad535d287c9c1 Bennie Yan 2024-09-24  1276  	user->network_type = NBL_KERNEL_NETWORK;
bad535d287c9c1 Bennie Yan 2024-09-24  1277  
bad535d287c9c1 Bennie Yan 2024-09-24  1278  	NBL_DEV_MGT_TO_USER_DEV(dev_mgt) = user;
bad535d287c9c1 Bennie Yan 2024-09-24  1279  
bad535d287c9c1 Bennie Yan 2024-09-24  1280  	return;
bad535d287c9c1 Bennie Yan 2024-09-24  1281  
bad535d287c9c1 Bennie Yan 2024-09-24  1282  free_dev:
bad535d287c9c1 Bennie Yan 2024-09-24  1283  	devm_kfree(dev, mdev);
bad535d287c9c1 Bennie Yan 2024-09-24  1284  	kfree(shm_msg_ring);
bad535d287c9c1 Bennie Yan 2024-09-24  1285  }
bad535d287c9c1 Bennie Yan 2024-09-24  1286  

:::::: The code at line 1260 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
