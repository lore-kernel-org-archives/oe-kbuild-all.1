Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6320E29A9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Feb 2023 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677426662; x=1708962662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PIY9DLstbtqGFVmjtN/OA87eGLgsfiPYZ3iweTGn0hE=;
  b=KTZbZE1CuDkESUirsdSU2kpHEnVBYycrAlcmE71746Ww2kxskBiVLyVN
   ZEwc7WFIiOeMs/ZgWm/C4YJUJDGCJg4XLtLUYk4ZDJhng07L2Oc1Ln948
   pi6cRh4en+eB+XmatJDkFHtO6mOLm/BTIzUF83LP7PoUtG/q0FZVb2lTr
   FTpdJQzIYdX+7SXokXyFKD4kBtGbrfsYwnMmYX71jDsgccKRTmsLbZll2
   9F43nOEOenG340EkO4Dsj+3TLCvv0egmunN/jrhu8GCC1cQVB1QnEILrI
   zXYfw0x6wxCwflvdzt/yOFbFdY8QCOhjamGqzNKcKGMQ/GO50uArq7kUK
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="314146819"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="314146819"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 07:51:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="737371993"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="737371993"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Feb 2023 07:51:00 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWJIh-0003nr-2d;
	Sun, 26 Feb 2023 15:50:59 +0000
Date: Sun, 26 Feb 2023 23:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:vfio_device_cdev_v5 13/24]
 drivers/vfio/pci/vfio_pci_core.c:1350:14: warning: variable 'slot' set but
 not used
Message-ID: <202302262359.vM94WDQv-lkp@intel.com>
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
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230226/202302262359.vM94WDQv-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/29c5cd7a057dd29a17a05dba2e2b8e7df76279ad
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd vfio_device_cdev_v5
        git checkout 29c5cd7a057dd29a17a05dba2e2b8e7df76279ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/vfio/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302262359.vM94WDQv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/vfio/pci/vfio_pci_core.c: In function 'vfio_pci_ioctl_pci_hot_reset':
>> drivers/vfio/pci/vfio_pci_core.c:1350:14: warning: variable 'slot' set but not used [-Wunused-but-set-variable]
    1350 |         bool slot = false;
         |              ^~~~


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
