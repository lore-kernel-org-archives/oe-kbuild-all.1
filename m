Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA55184F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 05:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678686524; x=1710222524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fTe5COlRH3nMIvS/fnBmV57fdGBoBxGzmiUuVUaFyPs=;
  b=gwpP2/7aaPngPu24NI6EQmrgTjjNn4LB3twiGw7j8z4cdUIAxhNpcxcc
   g62eHo3xdBPWEL54rAhyIU757vrTJEqyXyegLplwem4FSm850LNhyLc0A
   oF7WVTIRCni5CL25zKSxwogy8CvqfnEo9Xl9JdUTZQhwnpd6NLYRjkS/C
   XJbLtGkFqwu2DyIg7fSm2e6oTC2rtoBFR8G4BEta2VGGppJVfFrng/r6O
   PnwbUY4A7dzNEb3t4xVtZ1VAbwwZKgzcpP5s4suA3iSB+RJwJLaY7W/BN
   7LiGZVG67jxtn9zYETaA6yhOMBLgTUJHzbEJK1VI7PzLnnt6uAvspB48P
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="339436338"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="339436338"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2023 22:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="788796857"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="788796857"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Mar 2023 22:48:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbb34-0005IC-0E;
	Mon, 13 Mar 2023 05:48:42 +0000
Date: Mon, 13 Mar 2023 13:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/vfio_device_cdev_v7_candidate 18/32]
 drivers/vfio/vfio_main.c:1281: warning: This comment starts with '/**', but
 isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202303131347.8kMnnhVH-lkp@intel.com>
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
config: x86_64-randconfig-a012-20230313 (https://download.01.org/0day-ci/archive/20230313/202303131347.8kMnnhVH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/5c5adb99ef9957a0f7d0b7c926d656542e3a681e
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/vfio_device_cdev_v7_candidate
        git checkout 5c5adb99ef9957a0f7d0b7c926d656542e3a681e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/vfio/ net/sunrpc/auth_gss/auth_rpcgss.ko

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303131347.8kMnnhVH-lkp@intel.com/

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
