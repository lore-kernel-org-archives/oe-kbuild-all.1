Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48931184F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 05:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678684663; x=1710220663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4k310NJFmLoT691/oTyDdq9nLYflpWq6mqLReczV6Jg=;
  b=dtjOo0CJu5ry2BKNznzXVYE9BmNIULgb86hXXSJnIT8catfAmXXyCUDL
   XCEKxw6PeKpBHP81KDCWGt/na7gwXhHji5MU5lgJ9IAgGFDqcA8tFDT2b
   t9+iq4VEFA+zNDwBW32dApmAVH57I+X2B+pFzBbP0N8m+TAdmfnjRGn+f
   ggnu3n3PsAeHFb9WvPbi+tLzhB30R4zt+myIbVQFI1tX8RKlOXhxKgkNg
   NLV83Vwz5rhoi3uR25hOEAQRxqnyRScIo/jL8ajvJXzRBu5ZCIZJG6rQF
   +yIZ1SgJ+l9ldqB8u66Rbrii68q0G16OsajNk7eT3cba+Ixvug1JIPnvX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="335760634"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="335760634"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2023 22:17:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="802324557"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="802324557"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Mar 2023 22:17:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbaZ2-0005Gw-1g;
	Mon, 13 Mar 2023 05:17:40 +0000
Date: Mon, 13 Mar 2023 13:17:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/vfio_device_cdev_v7_candidate 18/32]
 drivers/vfio/vfio_main.c:1281: warning: This comment starts with '/**', but
 isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202303131334.E4DQBxPo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/vfio_device_cdev_v7_candidate
head:   e3cf0848eac9960f7ecb898d997a9e8200d552b0
commit: 5c5adb99ef9957a0f7d0b7c926d656542e3a681e [18/32] vfio/pci: Accept device fd in VFIO_DEVICE_PCI_HOT_RESET ioctl
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230313/202303131334.E4DQBxPo-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/5c5adb99ef9957a0f7d0b7c926d656542e3a681e
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/vfio_device_cdev_v7_candidate
        git checkout 5c5adb99ef9957a0f7d0b7c926d656542e3a681e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/vfio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303131334.E4DQBxPo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/vfio_main.c:1281: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Return true if the input file is a vfio device file and has opened


vim +1281 drivers/vfio/vfio_main.c

  1279	
  1280	/**
> 1281	 * Return true if the input file is a vfio device file and has opened
  1282	 * the input device. Otherwise, return false.
  1283	 */
  1284	static bool vfio_file_has_device_access(struct file *file,
  1285						struct vfio_device *device)
  1286	{
  1287		struct vfio_device *vdev = vfio_device_from_file(file);
  1288		struct vfio_device_file *df;
  1289	
  1290		if (!vdev || vdev != device)
  1291			return false;
  1292	
  1293		df = file->private_data;
  1294	
  1295		return READ_ONCE(df->access_granted);
  1296	}
  1297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
