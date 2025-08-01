Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226C42080C0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754035185; cv=none; b=m90hKP87ScaIaaox+SWRq+TYuFsK8ELjb0ReK1z6w1wIDqSsNgkdEukXUEQreqljUBh9sOBEfPIdsdhFUfF+f+zcgdO9naQzT/5Moi20R5SQKVxb+91DNMfbLEq0AnnwIIx2sAvp7ix0vMrUIsBjA6kiPoNw9/wRM3M/lvTOys8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754035185; c=relaxed/simple;
	bh=XNNADTsJ5E5PieJiqjUYGK+mTExu6fOXhayjIcCnyuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p8rHpH5HmabgRj1pjQwFHvjZeCyljd8whFHm1dgM4qTcNp0WIcdi/TcmU8lEH3ZqlXhaFdydYKb5o72zf3lu1pF9e2V1YpLkg/FUZqw4gs3jomoyK9SkUGxG1uM3FGrlt90UZSONJGwukeosPUuONjgks4AphYKiDuRFe2OuQKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDSgug4X; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDSgug4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754035182; x=1785571182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XNNADTsJ5E5PieJiqjUYGK+mTExu6fOXhayjIcCnyuU=;
  b=IDSgug4X30xcHdOP+YCApq/izDUztPlYJeOjMioHi0ToCj74Mb/KhBtE
   K+GCsSO7fxOWjM1FOQmuKgfa9gaI2t+3/KDXdT6NpZisPm1bwQI1UwAIG
   nh7isHGCkM8c1M5pk3s92o4UzwESgZHPaMxJwa4au7z4bBqLKm5Q+/5KO
   KovmPkVOb1UOB0QDh3sDMeka5DlHA7RbYpIkRUZY0BapLbma7R60Yc/7K
   1DJm52F4hnG0N+21be6Q+YQ/fqD/3J2IfYsMHQSQ4k8TGtmr+htFh9MdV
   iaMxmGz5qooTGvKvmu/dpaY7bzyTTmNKPXFftD+8lQ83+JDvlk/1mcL4p
   Q==;
X-CSE-ConnectionGUID: l8qaRDVJTOqTIiywc+Q0pw==
X-CSE-MsgGUID: AtEgfWgNRWCt9AlUx3X6BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67821718"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="67821718"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 00:59:42 -0700
X-CSE-ConnectionGUID: wb32X54iTCq1PhgpqKMaVQ==
X-CSE-MsgGUID: LF8wU6MuR0ScXyLDDfQiaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="194474111"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Aug 2025 00:59:40 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhkfx-0004RM-0n;
	Fri, 01 Aug 2025 07:59:37 +0000
Date: Fri, 1 Aug 2025 15:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shi Jing <shijing34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2618/2618]
 drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1869:3: error: call to
 undeclared function '__symbol_put'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202508011513.18ofSIpR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8c3c65c303f0b7266ec761ebaf173b86b36ac913
commit: 0bf0c942a09ba92e1d22e6960464b628dd4408fa [2618/2618] net/hinic3: Synchronize new NIC features and bug fixes
config: arm64-randconfig-001-20250801 (https://download.01.org/0day-ci/archive/20250801/202508011513.18ofSIpR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508011513.18ofSIpR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011513.18ofSIpR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:108:6: warning: no previous prototype for function 'hinic3_uld_lock_init' [-Wmissing-prototypes]
     108 | void hinic3_uld_lock_init(void)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     108 | void hinic3_uld_lock_init(void)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:526:5: warning: no previous prototype for function 'hinic3_pdev_is_virtfn' [-Wmissing-prototypes]
     526 | u32 hinic3_pdev_is_virtfn(struct pci_dev *pdev)
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:526:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     526 | u32 hinic3_pdev_is_virtfn(struct pci_dev *pdev)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:788:5: warning: no previous prototype for function '__set_vroce_func_state' [-Wmissing-prototypes]
     788 | int __set_vroce_func_state(struct hinic3_pcidev *pci_adapter)
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:788:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     788 | int __set_vroce_func_state(struct hinic3_pcidev *pci_adapter)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:831:6: warning: no previous prototype for function 'slave_host_mgmt_vroce_work' [-Wmissing-prototypes]
     831 | void slave_host_mgmt_vroce_work(struct work_struct *work)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:831:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     831 | void slave_host_mgmt_vroce_work(struct work_struct *work)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:841:7: warning: no previous prototype for function 'hinic3_get_roce_uld_by_pdev' [-Wmissing-prototypes]
     841 | void *hinic3_get_roce_uld_by_pdev(struct pci_dev *pdev)
         |       ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:841:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     841 | void *hinic3_get_roce_uld_by_pdev(struct pci_dev *pdev)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1784:6: warning: no previous prototype for function 'hinic3_set_func_state' [-Wmissing-prototypes]
    1784 | void hinic3_set_func_state(struct hinic3_pcidev *pci_adapter)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1784:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1784 | void hinic3_set_func_state(struct hinic3_pcidev *pci_adapter)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1810:6: warning: no previous prototype for function 'slave_host_mgmt_work' [-Wmissing-prototypes]
    1810 | void slave_host_mgmt_work(struct work_struct *work)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1810:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1810 | void slave_host_mgmt_work(struct work_struct *work)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1869:3: error: call to undeclared function '__symbol_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1869 |                 __symbol_put("migration_dev_migration_probe");
         |                 ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1869:3: note: did you mean '__symbol_get'?
   include/linux/module.h:301:7: note: '__symbol_get' declared here
     301 | void *__symbol_get(const char *symbol);
         |       ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1928:3: error: call to undeclared function '__symbol_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1928 |                 __symbol_put("migration_dev_add_vf");
         |                 ^
   7 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +/__symbol_put +1869 drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c

  1847	
  1848	static void slave_host_vfio_probe_delay_work(struct work_struct *work)
  1849	{
  1850		struct delayed_work *delay = to_delayed_work(work);
  1851		struct hinic3_pcidev *pci_adapter = container_of(delay, struct hinic3_pcidev,
  1852								 migration_probe_dwork);
  1853		struct pci_dev *pdev = pci_adapter->pcidev;
  1854		int (*dev_migration_probe)(struct pci_dev *pdev);
  1855		int rc;
  1856	
  1857		if (hinic3_func_type((struct hinic3_hwdev *)pci_adapter->hwdev) != TYPE_PF)
  1858			return;
  1859	
  1860		dev_migration_probe = __symbol_get("migration_dev_migration_probe");
  1861		if (!(dev_migration_probe)) {
  1862			sdk_err(&pdev->dev,
  1863				"Failed to find: migration_dev_migration_probe");
  1864			queue_delayed_work(pci_adapter->migration_probe_workq,
  1865					   &pci_adapter->migration_probe_dwork,
  1866					   WAIT_TIME * HZ);
  1867		} else {
  1868			rc = dev_migration_probe(pdev);
> 1869			__symbol_put("migration_dev_migration_probe");
  1870			if (rc) {
  1871				sdk_err(&pdev->dev,
  1872					"Failed to __dev_migration_probe, rc:0x%x, pf migrated(%d).\n",
  1873					rc, g_is_pf_migrated);
  1874			} else {
  1875				g_is_pf_migrated = true;
  1876				sdk_info(&pdev->dev,
  1877					 "Succeeded in __dev_migration_probe, pf migrated(%d).\n",
  1878					 g_is_pf_migrated);
  1879			}
  1880		}
  1881	}
  1882	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
