Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE523101C0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 09:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770457180; cv=none; b=cEgcgwYdq+60ZP9pEYXVHE8K0gpVmhXfGNctF+kjIfKgVdpuFEbNf4BvFwmn/ObTPZ1Wfa9tdxkW+c7YOluITCT8eZcKmj12voZsx2M0xr54u+z8YjiKkluFQugAci3QnGq9vjDK88gGo5S/I7W95Gk3J2XKL242mXDeGVbY3G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770457180; c=relaxed/simple;
	bh=5QcONy8A1RB+KvOkJzuRgaQkypGD+FlIlFifhzm5bA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ckneHhrVhVXqnA65L9YDYAvk86p0m+zhu+R84NbEr9Ogcu/Ic93IPIHEMTCS3eEyl+YGNBzTiT9gkQWjtnznBFfumCmTR92n7TUhCxP6dK0tYR2ZuatEeVtzHZZ8+s31+oVpwt69ZyD+0CQui1J1MjkKDmj/VChk6T+nzZUAGNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qxfj2GxR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qxfj2GxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770457180; x=1801993180;
  h=date:from:to:cc:subject:message-id;
  bh=5QcONy8A1RB+KvOkJzuRgaQkypGD+FlIlFifhzm5bA4=;
  b=Qxfj2GxRStd38nZvDQug+eEwMOfJQLwBVu3PABMnhBx+kN6OZkDUVZTL
   ls3MLYoHVMVyp1tQhOad3d1DZgTvptHMS6TIrMoJkjVL8nYBn+KXDHThi
   p2zV68vxoAAFu+8LJInp8v1n7qJ4UVwjcwkv7HQIhh2WESpCzNr9fIkBm
   wpsPlthjV8bFulw0VP4jVyZT23NCHG5SVv1YJEk8tmCNfeBwemXz0Pqga
   DVUxZD9RrImoKtwN6hSc9sXZeKBFeZKXgsFnWvsqpkzRnbuDpt2aLLcRz
   dqiZM9fWOyRpEJ8tYvyGY5Lt+5uIGRuMYNfHZaHGfpzA3cKAbeJcw1k/m
   A==;
X-CSE-ConnectionGUID: OMFvoAe7RgKxvxH56+Fkrg==
X-CSE-MsgGUID: g540xd7nR02+mcmsjnpwiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="70845832"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="70845832"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 01:39:39 -0800
X-CSE-ConnectionGUID: Kf0j3H3zQPStDFVFP1y6RA==
X-CSE-MsgGUID: HAHJniORRj6G4Ix2ywOwjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="234046604"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2026 01:39:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voemt-00000000lXi-2LJY;
	Sat, 07 Feb 2026 09:39:35 +0000
Date: Sat, 07 Feb 2026 17:39:11 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>
Subject: drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c:1608:62:
 error: 'struct vfio_device' has no member named 'debug_root'
Message-ID: <202602071722.ONa34Ix3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2687c848e57820651b9f69d30c4710f4219f7dbf
commit: f5caeb3689ea2d8a8c0790d9eea68b63e8f15496 xfs: XFS_ONLINE_SCRUB_STATS should depend on DEBUG_FS
date:   4 months ago
config: arm64-randconfig-r063-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071722.ONa34Ix3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071722.ONa34Ix3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071722.ONa34Ix3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c: In function 'hisi_acc_vfio_debug_init':
>> drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c:1608:62: error: 'struct vfio_device' has no member named 'debug_root'
    1608 |         vfio_dev_migration = debugfs_lookup("migration", vdev->debug_root);
         |                                                              ^~


vim +1608 drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c

ee3a5b2359e0e5b Shameer Kolothum 2022-03-08  1592  
b398f91779b86e5 Longfang Liu     2024-11-12  1593  static void hisi_acc_vfio_debug_init(struct hisi_acc_vf_core_device *hisi_acc_vdev)
b398f91779b86e5 Longfang Liu     2024-11-12  1594  {
b398f91779b86e5 Longfang Liu     2024-11-12  1595  	struct vfio_device *vdev = &hisi_acc_vdev->core_device.vdev;
b398f91779b86e5 Longfang Liu     2024-11-12  1596  	struct hisi_acc_vf_migration_file *migf;
b398f91779b86e5 Longfang Liu     2024-11-12  1597  	struct dentry *vfio_dev_migration;
b398f91779b86e5 Longfang Liu     2024-11-12  1598  	struct dentry *vfio_hisi_acc;
b398f91779b86e5 Longfang Liu     2024-11-12  1599  	struct device *dev = vdev->dev;
b398f91779b86e5 Longfang Liu     2024-11-12  1600  
b398f91779b86e5 Longfang Liu     2024-11-12  1601  	if (!debugfs_initialized() ||
b398f91779b86e5 Longfang Liu     2024-11-12  1602  	    !IS_ENABLED(CONFIG_VFIO_DEBUGFS))
b398f91779b86e5 Longfang Liu     2024-11-12  1603  		return;
b398f91779b86e5 Longfang Liu     2024-11-12  1604  
b398f91779b86e5 Longfang Liu     2024-11-12  1605  	if (vdev->ops != &hisi_acc_vfio_pci_migrn_ops)
b398f91779b86e5 Longfang Liu     2024-11-12  1606  		return;
b398f91779b86e5 Longfang Liu     2024-11-12  1607  
b398f91779b86e5 Longfang Liu     2024-11-12 @1608  	vfio_dev_migration = debugfs_lookup("migration", vdev->debug_root);
b398f91779b86e5 Longfang Liu     2024-11-12  1609  	if (!vfio_dev_migration) {
b398f91779b86e5 Longfang Liu     2024-11-12  1610  		dev_err(dev, "failed to lookup migration debugfs file!\n");
b398f91779b86e5 Longfang Liu     2024-11-12  1611  		return;
b398f91779b86e5 Longfang Liu     2024-11-12  1612  	}
b398f91779b86e5 Longfang Liu     2024-11-12  1613  
b398f91779b86e5 Longfang Liu     2024-11-12  1614  	migf = kzalloc(sizeof(*migf), GFP_KERNEL);
eaba58355ecd124 Miaoqian Lin     2025-09-01  1615  	if (!migf) {
eaba58355ecd124 Miaoqian Lin     2025-09-01  1616  		dput(vfio_dev_migration);
b398f91779b86e5 Longfang Liu     2024-11-12  1617  		return;
eaba58355ecd124 Miaoqian Lin     2025-09-01  1618  	}
b398f91779b86e5 Longfang Liu     2024-11-12  1619  	hisi_acc_vdev->debug_migf = migf;
b398f91779b86e5 Longfang Liu     2024-11-12  1620  
b398f91779b86e5 Longfang Liu     2024-11-12  1621  	vfio_hisi_acc = debugfs_create_dir("hisi_acc", vfio_dev_migration);
b398f91779b86e5 Longfang Liu     2024-11-12  1622  	debugfs_create_devm_seqfile(dev, "dev_data", vfio_hisi_acc,
b398f91779b86e5 Longfang Liu     2024-11-12  1623  				    hisi_acc_vf_dev_read);
b398f91779b86e5 Longfang Liu     2024-11-12  1624  	debugfs_create_devm_seqfile(dev, "migf_data", vfio_hisi_acc,
b398f91779b86e5 Longfang Liu     2024-11-12  1625  				    hisi_acc_vf_migf_read);
b398f91779b86e5 Longfang Liu     2024-11-12  1626  	debugfs_create_devm_seqfile(dev, "cmd_state", vfio_hisi_acc,
b398f91779b86e5 Longfang Liu     2024-11-12  1627  				    hisi_acc_vf_debug_cmd);
eaba58355ecd124 Miaoqian Lin     2025-09-01  1628  
eaba58355ecd124 Miaoqian Lin     2025-09-01  1629  	dput(vfio_dev_migration);
b398f91779b86e5 Longfang Liu     2024-11-12  1630  }
b398f91779b86e5 Longfang Liu     2024-11-12  1631  

:::::: The code at line 1608 was first introduced by commit
:::::: b398f91779b86e5f285d9f0df5d2e753ddcdac3f hisi_acc_vfio_pci: register debugfs for hisilicon migration driver

:::::: TO: Longfang Liu <liulongfang@huawei.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
