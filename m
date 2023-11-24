Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1806E8F52
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 07:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDtcxlP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700812659; x=1732348659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RnvY/f1LzSkkOmATJ5/DwwRDM/F2WQSYKfAu/U1+pQE=;
  b=cDtcxlP6y5gcfs/WATg5Qc63Z4h2s1xDZ4xfde8VmBT1iu9CYWvC5wSS
   R3+JqhqJj9bA4NtPiTYTEvQXD4uzE4uT6jX9QYLAqRkvuoEdpxdND+P2S
   6RVVxn0AmxBR1Gh8p6sULPjocgatu/4kkY2RBjb1LhGlVzEifXqsxkLaS
   /Sy8oXGTtUNETQqvBbxmq6/SIETHWFHZIHUg4pWTOEAFFHpEKraCjqlIM
   MBt5Cgon70XLI51k1+YNtAfU//VbH9Ms3vaRfqEeyQJ2k8H0OwirDQ4Si
   SErRfP8PWVP0GW4WclqzIQg3gGo1sKB1zq0GGN9jV2QxQu2k+Y+5aZwxL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395199301"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="395199301"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 23:57:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="767393131"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="767393131"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Nov 2023 23:57:37 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6R4A-0002F8-2x;
	Fri, 24 Nov 2023 07:57:34 +0000
Date: Fri, 24 Nov 2023 15:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11232023 87/95]
 drivers/vfio/pci/vfio_pci_core.c:1506:6: warning: unused variable 'header'
Message-ID: <202311241257.k3au52EQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting+pasid-11232023
head:   e2f3401a12ddf3a5e89ad7718249b994db525080
commit: 506687fa55be9d003435a9ae3d1d1774d3e8bb70 [87/95] vfio: Expose PASID capability via VFIO_DEVICE_FEATURE ioctl
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231124/202311241257.k3au52EQ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241257.k3au52EQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241257.k3au52EQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/pci/vfio_pci_core.c:1506:6: warning: unused variable 'header' [-Wunused-variable]
           u32 header = 0, cap_ctrl = 0;
               ^
   1 warning generated.


vim +/header +1506 drivers/vfio/pci/vfio_pci_core.c

  1497	
  1498	static int vfio_pci_core_feature_pasid(struct vfio_device *device, u32 flags,
  1499					       struct vfio_device_feature_pasid __user *arg,
  1500					       size_t argsz)
  1501	{
  1502		struct vfio_pci_core_device *vdev =
  1503			container_of(device, struct vfio_pci_core_device, vdev);
  1504		struct vfio_device_feature_pasid pasid = { 0 };
  1505		struct pci_dev *pdev = vdev->pdev;
> 1506		u32 header = 0, cap_ctrl = 0;
  1507		int ret;
  1508	
  1509		/* We do not support SET of the PASID capability */
  1510		ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
  1511					 sizeof(pasid));
  1512		if (ret != 1)
  1513			return ret;
  1514	
  1515		if (!pdev->pasid_enabled)
  1516			goto out;
  1517	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
