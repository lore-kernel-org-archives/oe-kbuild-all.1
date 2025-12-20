Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3F886277
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 20:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766262827; cv=none; b=FlY8kYRVwwFRkwpMwP6xUbwIv+vjT9Sm3gImXQXfFVFm82mG2kLu0xtcY6KXitwhzX8axNjw0J3noaq0913qvQWWmFaU+BvQCJ0MbG3SbjXG76uXvVu7jJibdUV5Ud701S0dqYHKf5SE3RgaDGYio+iF0sXSkBQiRhgQDiRGX58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766262827; c=relaxed/simple;
	bh=/lWm8Ei6q1p7yDZnM6xnCBXO5FJC2897/H5hOHStKQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YWD6zqWjK1nvNHERVUJAs7y3q8hoNZGZt8IZLiLp0NKYfXUDLZa0sD3HiGDl01A/bgNP2FfiVoEe3/F6BG2OE3OHMdAF3N9t+NsSTsSKc478J9BpGcp2TlROsr49avCCWR/EskMy/0Ov28mxg+lMyhx4PvMtX5wyX66/mCuEmpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmC1vcVX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmC1vcVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766262825; x=1797798825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/lWm8Ei6q1p7yDZnM6xnCBXO5FJC2897/H5hOHStKQM=;
  b=PmC1vcVXOT1S2jBp+dRNZAEl+qD7NF/HZyTCH+rcpHJxJZBAsmM6shlU
   X0fzdeQEjThztlrvFWpvpUsdHZRGrv/g+1Xr7juI34WXoraf001mxm0by
   0yk98ryyVptOKOMnCn6BTBVHXz/LdjAZDYoOcWCOUYtAEYo/4orXjzt5t
   /pKxGpZYkp+P6x52889SWpWrJLjxBkLKNRaVCMn9BIqWQDD59PNce4Uzx
   Xzpuss1MkUNBeN3ivGnvlRLmxH9+vfSNMB/JcC4f4ssLlLaoIyW/2aJaZ
   7NLx8G2yl6xyiYrUF4KOBqrGR9n2vWZ6C4FuAML+8vp4w6Tz4TYPq2qD8
   A==;
X-CSE-ConnectionGUID: aONJhNKtR4iM1JJMeeEWJw==
X-CSE-MsgGUID: mt7tMaluQMeM+r8xaUzanA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67936176"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67936176"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 12:33:45 -0800
X-CSE-ConnectionGUID: HY6Lrc5hQpq1S92lYh+1rA==
X-CSE-MsgGUID: no0/HTR5RP+Tp8ajCVJCZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199143500"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Dec 2025 12:33:43 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX3e1-0000000057B-11Ho;
	Sat, 20 Dec 2025 20:33:41 +0000
Date: Sun, 21 Dec 2025 04:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shi Jing <shijing34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3547/3547]
 drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1860:22: warning:
 assignment to 'int (*)(struct pci_dev *)' from 'int' makes pointer from
 integer without a cast
Message-ID: <202512210450.P2GW20wS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 0bf0c942a09ba92e1d22e6960464b628dd4408fa [3547/3547] net/hinic3: Synchronize new NIC features and bug fixes
config: arm64-randconfig-003-20251216 (https://download.01.org/0day-ci/archive/20251221/202512210450.P2GW20wS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210450.P2GW20wS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210450.P2GW20wS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:108:6: warning: no previous prototype for 'hinic3_uld_lock_init' [-Wmissing-prototypes]
     108 | void hinic3_uld_lock_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:526:5: warning: no previous prototype for 'hinic3_pdev_is_virtfn' [-Wmissing-prototypes]
     526 | u32 hinic3_pdev_is_virtfn(struct pci_dev *pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:788:5: warning: no previous prototype for '__set_vroce_func_state' [-Wmissing-prototypes]
     788 | int __set_vroce_func_state(struct hinic3_pcidev *pci_adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:831:6: warning: no previous prototype for 'slave_host_mgmt_vroce_work' [-Wmissing-prototypes]
     831 | void slave_host_mgmt_vroce_work(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:841:7: warning: no previous prototype for 'hinic3_get_roce_uld_by_pdev' [-Wmissing-prototypes]
     841 | void *hinic3_get_roce_uld_by_pdev(struct pci_dev *pdev)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1784:6: warning: no previous prototype for 'hinic3_set_func_state' [-Wmissing-prototypes]
    1784 | void hinic3_set_func_state(struct hinic3_pcidev *pci_adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1810:6: warning: no previous prototype for 'slave_host_mgmt_work' [-Wmissing-prototypes]
    1810 | void slave_host_mgmt_work(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c: In function 'slave_host_vfio_probe_delay_work':
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1860:24: error: implicit declaration of function '__symbol_get'; did you mean 'symbol_get'? [-Werror=implicit-function-declaration]
    1860 |  dev_migration_probe = __symbol_get("migration_dev_migration_probe");
         |                        ^~~~~~~~~~~~
         |                        symbol_get
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1860:22: warning: assignment to 'int (*)(struct pci_dev *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1860 |  dev_migration_probe = __symbol_get("migration_dev_migration_probe");
         |                      ^
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1869:3: error: implicit declaration of function '__symbol_put'; did you mean 'symbol_put'? [-Werror=implicit-function-declaration]
    1869 |   __symbol_put("migration_dev_migration_probe");
         |   ^~~~~~~~~~~~
         |   symbol_put
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c: In function 'slave_host_migration_vf_add_delay_work':
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1925:23: warning: assignment to 'int (*)(struct pci_dev *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1925 |  migration_dev_add_vf = __symbol_get("migration_dev_add_vf");
         |                       ^
   cc1: some warnings being treated as errors
--
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:621:6: warning: no previous prototype for 'print_port_info' [-Wmissing-prototypes]
     621 | void print_port_info(struct hinic3_nic_io *nic_io,
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:803:6: warning: no previous prototype for 'hinic3_notify_vf_bond_status' [-Wmissing-prototypes]
     803 | void hinic3_notify_vf_bond_status(struct hinic3_nic_io *nic_io,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:833:6: warning: no previous prototype for 'hinic3_notify_all_vfs_bond_changed' [-Wmissing-prototypes]
     833 | void hinic3_notify_all_vfs_bond_changed(void *hwdev, u8 bond_status)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:1671:5: warning: no previous prototype for 'set_fecparam' [-Wmissing-prototypes]
    1671 | int set_fecparam(void *hwdev, u8 fecparam)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:1699:5: warning: no previous prototype for 'get_fecparam' [-Wmissing-prototypes]
    1699 | int get_fecparam(void *hwdev, u8 *advertised_fec, u8 *supported_fec)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c: In function 'get_port_temperature_power.isra':
>> drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:548:38: warning: ', rx power: ' directive output may be truncated writing 12 bytes into a region of size between 1 and 512 [-Wformat-truncation=]
     548 |   snprintf(str, CAP_INFO_MAX_LEN, "%s, rx power: %uuW, tx power: %uuW",
         |                                      ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:548:3: note: 'snprintf' output between 31 and 560 bytes into a destination of size 512
     548 |   snprintf(str, CAP_INFO_MAX_LEN, "%s, rx power: %uuW, tx power: %uuW",
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     549 |     cap_info, info->power[0x0], info->power[0x1]);
         |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:544:39: warning: ', rx power: ' directive output may be truncated writing 12 bytes into a region of size between 1 and 512 [-Wformat-truncation=]
     544 |   snprintf(str,  CAP_INFO_MAX_LEN, "%s, rx power: %uuw %uuW %uuW %uuW",
         |                                       ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:544:3: note: 'snprintf' output between 28 and 575 bytes into a destination of size 512
     544 |   snprintf(str,  CAP_INFO_MAX_LEN, "%s, rx power: %uuw %uuW %uuW %uuW",
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     545 |     cap_info, info->power[0x0], info->power[0x1],
         |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     546 |     info->power[0x2], info->power[0x3]);
         |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [y]:
   - SXE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 || ARM64 [=y]) && PCI [=y]
   - SXE_VF [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 || ARM64 [=y]) && PCI [=y]


vim +1860 drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c

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
> 1860		dev_migration_probe = __symbol_get("migration_dev_migration_probe");
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
