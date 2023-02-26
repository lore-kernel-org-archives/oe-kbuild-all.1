Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6185B2F3C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Feb 2023 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677429787; x=1708965787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7uunXoNnUxKNq1ui9MmWqmrmk9v6+Ydvlv17w1s/iLw=;
  b=OVq8yb3ShVH/E26CcB9YVlgDFCfIfo4iI8C2KcDYb7W/4qO7QYKuF8pc
   mdkoRsmMbHik5gaNeIr+vEUr2qlAW19DkU7WekABbks3LW2OuB2+xgxcI
   m6/vfNdlEc8LoR630bF24RaR+tdS9TTccP2ECo8c/Q723TZUbRDEOGu+R
   iywwz7Lh638ByQBXfGxz5pzVzmeOkf8qEt3RPIrHjUNGp1vi53Lb9KBY6
   +7p9wAaA7Kk5rJ3CHs5m9f3tqRAZmTMjJ1pRQ4lIqCW5dTf9MAQNgZ5mr
   DQ5Vfrq0Pf1lGPF93lO0UMvqoTL4cp7uM+dRz3Xz42YpjkLyQOKPJW/38
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="313399037"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="313399037"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 08:43:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="742225450"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="742225450"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 Feb 2023 08:43:02 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWK73-0003pB-13;
	Sun, 26 Feb 2023 16:43:01 +0000
Date: Mon, 27 Feb 2023 00:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:vfio_device_cdev_v5 13/24]
 drivers/vfio/pci/vfio_pci_core.c:1350:7: warning: variable 'slot' set but
 not used
Message-ID: <202302270022.cCVzbvMS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git vfio_device_cdev_v5
head:   bd79c2852f6d7b50c6049240e2b34577255cf2c7
commit: 29c5cd7a057dd29a17a05dba2e2b8e7df76279ad [13/24] vfio/pci: Allow passing zero-length fd array in vfio_pci_hot_reset
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230227/202302270022.cCVzbvMS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/29c5cd7a057dd29a17a05dba2e2b8e7df76279ad
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd vfio_device_cdev_v5
        git checkout 29c5cd7a057dd29a17a05dba2e2b8e7df76279ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/vfio/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302270022.cCVzbvMS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/pci/vfio_pci_core.c:1350:7: warning: variable 'slot' set but not used [-Wunused-but-set-variable]
           bool slot = false;
                ^
   1 warning generated.


vim +/slot +1350 drivers/vfio/pci/vfio_pci_core.c

  1343	
  1344	static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
  1345						struct vfio_pci_hot_reset __user *arg)
  1346	{
  1347		unsigned long minsz = offsetofend(struct vfio_pci_hot_reset, count);
  1348		struct vfio_pci_hot_reset hdr;
  1349		struct iommufd_ctx *iommufd;
> 1350		bool slot = false;
  1351		int ret;
  1352	
  1353		if (copy_from_user(&hdr, arg, minsz))
  1354			return -EFAULT;
  1355	
  1356		if (hdr.argsz < minsz || hdr.flags)
  1357			return -EINVAL;
  1358	
  1359		/* Can we do a slot or bus reset or neither? */
  1360		if (!pci_probe_reset_slot(vdev->pdev->slot))
  1361			slot = true;
  1362		else if (pci_probe_reset_bus(vdev->pdev->bus))
  1363			return -ENODEV;
  1364	
  1365		if (!hdr.count)
  1366			return vfio_pci_ioctl_pci_hot_reset_groups(vdev, &hdr, arg);
  1367	
  1368		iommufd = vfio_device_iommufd(&vdev->vdev);
  1369		if (!iommufd)
  1370			return -EINVAL;
  1371	
  1372		ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, NULL, iommufd);
  1373		return ret;
  1374	}
  1375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
