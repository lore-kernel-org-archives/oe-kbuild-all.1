Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A0121FF59
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 06:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751093437; cv=none; b=FgUUc7MVl4StQHaf8nOUCQyPxNBG7Ketfx9jA8qy+IGYgivdRyXr23TWck2z7chpGOXNCh6CF0rcoZC1yl1KTmZJ6Xda55zPq8geuY7V/IChPDn1jw1uASdntH0oA2kHuLXkekrDVnSX65fYo/7lahvnfSRBnwW77YzD9oUZofs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751093437; c=relaxed/simple;
	bh=YIXSV8/3I4ujw2zHs5UGQQG7ZKaS4RL1GeSs6riO77U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qVyG+LzrrI1/MRyZ/NN+wuvZEm+Shr159qzugBHlrRXp3ejU2e3fpiEJschZdBSsum4eKLlSynx+YWlvsGgLFo6CE1+42eglGU1PQB9GEwyZ8z2xe6m6OK6SaA8OqWwPS0IY8dSTis0KHnsH4WWnHBP4wT9bobAPJKq8pm028EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EENf6SYE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EENf6SYE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751093434; x=1782629434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YIXSV8/3I4ujw2zHs5UGQQG7ZKaS4RL1GeSs6riO77U=;
  b=EENf6SYEslpQL1Ww1HncWvNi5/xa3QCHgb+UP6uSgFj9vQEj5W6602Cj
   45if+v34Ak2WuRMYfAgV9ksp0cE9xTPgow/UbGd5DKyUzdCQY1Hbstt8D
   Q3Zj4Tvzc/P7hKfkJo8RZtlKYNab9PrIKnknS0J0ymXPxpfsSx4rK5YcX
   Qqjx5SzR9jP5Tp/o6LiWLKlzC8jgeER4/00cExlA+i/seR79IO8dAXI1/
   RX1xFbcpuCohgNSMd9ayfqYPt/9//4BSWvBZHmr/vZAcL3fpywYwGfDw7
   Vq9WbZdDtJKj1CEJFO+0GNT3g0vN5IehexKuFRPh7ihHFXA9ULhFtEaKm
   Q==;
X-CSE-ConnectionGUID: 9Ra3oh6fSG6+P7QV2Spq8w==
X-CSE-MsgGUID: VbWjc7GVTUGSptNoMOD0pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53489330"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="53489330"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 23:50:32 -0700
X-CSE-ConnectionGUID: 4jtgzjsVS7iwURyd0bMFow==
X-CSE-MsgGUID: fjOFENOFS761pOMAo+seFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="153693530"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jun 2025 23:50:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVPOP-000WsO-02;
	Sat, 28 Jun 2025 06:50:29 +0000
Date: Sat, 28 Jun 2025 14:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shi Jing <shijing34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2989/2989]
 drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1879:17: error: implicit
 declaration of function '__symbol_put'; did you mean '__symbol_get'?
Message-ID: <202506281459.uUU3BKjw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c245365237da527fb423d85e7ec54648113f843d
commit: 79871cd2cd720225eb582c9ed49fb4a96a270b3b [2989/2989] net/hinic3: Synchronize new NIC features and bug fixes
config: x86_64-buildonly-randconfig-006-20250628 (https://download.01.org/0day-ci/archive/20250628/202506281459.uUU3BKjw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506281459.uUU3BKjw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506281459.uUU3BKjw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:103:6: warning: no previous prototype for 'hinic3_uld_lock_init' [-Wmissing-prototypes]
     103 | void hinic3_uld_lock_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:525:5: warning: no previous prototype for 'hinic3_pdev_is_virtfn' [-Wmissing-prototypes]
     525 | u32 hinic3_pdev_is_virtfn(struct pci_dev *pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:785:5: warning: no previous prototype for '__set_vroce_func_state' [-Wmissing-prototypes]
     785 | int __set_vroce_func_state(struct hinic3_pcidev *pci_adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:826:6: warning: no previous prototype for 'slave_host_mgmt_vroce_work' [-Wmissing-prototypes]
     826 | void slave_host_mgmt_vroce_work(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:834:7: warning: no previous prototype for 'hinic3_get_roce_uld_by_pdev' [-Wmissing-prototypes]
     834 | void *hinic3_get_roce_uld_by_pdev(struct pci_dev *pdev)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1796:6: warning: no previous prototype for 'hinic3_set_func_state' [-Wmissing-prototypes]
    1796 | void hinic3_set_func_state(struct hinic3_pcidev *pci_adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1822:6: warning: no previous prototype for 'slave_host_mgmt_work' [-Wmissing-prototypes]
    1822 | void slave_host_mgmt_work(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c: In function 'slave_host_vfio_probe_delay_work':
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1879:17: error: implicit declaration of function '__symbol_put'; did you mean '__symbol_get'? [-Werror=implicit-function-declaration]
    1879 |                 __symbol_put("migration_dev_migration_probe");
         |                 ^~~~~~~~~~~~
         |                 __symbol_get
   cc1: some warnings being treated as errors


vim +1879 drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c

  1858	
  1859	static void slave_host_vfio_probe_delay_work(struct work_struct *work)
  1860	{
  1861		struct delayed_work *delay = to_delayed_work(work);
  1862		struct hinic3_pcidev *pci_adapter = container_of(delay, struct hinic3_pcidev, migration_probe_dwork);
  1863		struct pci_dev *pdev = pci_adapter->pcidev;
  1864		int (*dev_migration_probe)(struct pci_dev *);
  1865		int rc;
  1866	
  1867		if (hinic3_func_type((struct hinic3_hwdev *)pci_adapter->hwdev) != TYPE_PF) {
  1868			return;
  1869		}
  1870	
  1871		dev_migration_probe = __symbol_get("migration_dev_migration_probe");
  1872		if (!(dev_migration_probe)) {
  1873			sdk_err(&pdev->dev,
  1874				"Failed to find: migration_dev_migration_probe");
  1875			queue_delayed_work(pci_adapter->migration_probe_workq,
  1876				&pci_adapter->migration_probe_dwork, WAIT_TIME * HZ);
  1877		} else {
  1878			rc = dev_migration_probe(pdev);
> 1879			__symbol_put("migration_dev_migration_probe");
  1880			if (rc) {
  1881				sdk_err(&pdev->dev,
  1882					"Failed to __dev_migration_probe, rc:0x%x, pf migrated(%d).\n",
  1883					rc, g_is_pf_migrated);
  1884			} else {
  1885				g_is_pf_migrated = true;
  1886				sdk_info(&pdev->dev,
  1887					 "Successed in __dev_migration_probe, pf migrated(%d).\n",
  1888					 g_is_pf_migrated);
  1889			}
  1890		}
  1891	
  1892		return;
  1893	}
  1894	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
