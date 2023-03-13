Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F80184F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 05:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678685323; x=1710221323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p1V6oxvTr7fsioEgsQwBM5eCKAKX2rZiPOcWshXYr9s=;
  b=b9ImiEN/nn6Ye0oA6ST0dOWHC7ZNpgqZSF/RHwXWx1K+jZL+bo6GUwnd
   clP8kW6M46307Kv0iq/EOXQ2AKiGv+mCnmYSdCVxqXzPytQkAVuhzfwRb
   1K/6MM7ig1kLae3XYYUSze6aktgxplltAICpG6rQvgJuKD7XnpGudOfX0
   dzq4y3bYR7Lb6LfBbkJuPR8EnihOdVK3i61Xja2gIyqJ/YHvYpP45r7v+
   p2zgY8aRNEWeb9OSu3fHSVtPUBaOrvWp/FPMCU4Hx5+Xyt+QtBi32NQuo
   T031qPnlmGWdmr7yKOgJ2XyqOSh0O88fezzoq0QTOp5AwkYesfZu6Wwjl
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="325422424"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="325422424"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2023 22:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="821810303"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="821810303"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Mar 2023 22:28:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbajh-0005HK-0p;
	Mon, 13 Mar 2023 05:28:41 +0000
Date: Mon, 13 Mar 2023 13:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/vfio_device_cdev_v7_candidate 24/32]
 drivers/vfio/group.c:190:5: warning: no previous prototype for function
 'vfio_device_group_attach_compat_ioas'
Message-ID: <202303131306.hSZccHFU-lkp@intel.com>
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
commit: 61736068803cb2135b42cbf5618c3f116500aa1d [24/32] vfio-iommufd: Move the bind_iommufd and compat_ioas attach to group.c
config: arm64-randconfig-r012-20230313 (https://download.01.org/0day-ci/archive/20230313/202303131306.hSZccHFU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/yiliu1765/iommufd/commit/61736068803cb2135b42cbf5618c3f116500aa1d
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/vfio_device_cdev_v7_candidate
        git checkout 61736068803cb2135b42cbf5618c3f116500aa1d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/vfio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303131306.hSZccHFU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/group.c:190:5: warning: no previous prototype for function 'vfio_device_group_attach_compat_ioas' [-Wmissing-prototypes]
   int vfio_device_group_attach_compat_ioas(struct vfio_device *device,
       ^
   drivers/vfio/group.c:190:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vfio_device_group_attach_compat_ioas(struct vfio_device *device,
   ^
   static 
   1 warning generated.


vim +/vfio_device_group_attach_compat_ioas +190 drivers/vfio/group.c

   189	
 > 190	int vfio_device_group_attach_compat_ioas(struct vfio_device *device,
   191						 struct iommufd_ctx *iommufd)
   192	{
   193		u32 ioas_id;
   194		int ret;
   195	
   196		lockdep_assert_held(&device->dev_set->lock);
   197	
   198		ret = iommufd_vfio_compat_ioas_get_id(iommufd, &ioas_id);
   199		if (ret)
   200			return ret;
   201	
   202		/* The legacy path has no way to return the selected pt_id */
   203		return device->ops->attach_ioas(device, &ioas_id);
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
