Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F051874
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 05:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677820972; x=1709356972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AevYiE/UG2Y1wd6JWzoSVdx3Jwglu1K77FhsYDNjF2k=;
  b=ZmVsf7yWhzxeBz66WpEg9JAhAFd1Eqn+BnYByARhqjeynMkqo0N+ltU5
   hTOeHhnErDAUtrbgr46rbxqRWbG4wpRtmtJ9eYZMWcm8e/3PAfaDGmJUk
   CGDHoIeptliEq9vjBqoSaZxl6qQQeOzWXGfQwpiynB52Kr2oI3Uqtm9S6
   CNsy/iF5LmRf7apCnS4TvLWRbvwMfsTKGo3HyALffBgPoAaG9b5frf17M
   hRh1dLea+9JUpu4o/aWcIHpRJvajI0/0uYd0C8dYhDzGr1OTY6hv4Mnyg
   rFAxKSc3LvKq4rZIeY74JjGz8YsASIJeHlpjejVHJ9dDoL1Fl/s6eKtx9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="323254623"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="323254623"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 21:22:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="799117767"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="799117767"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Mar 2023 21:22:50 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXxsX-0001DY-3B;
	Fri, 03 Mar 2023 05:22:49 +0000
Date: Fri, 3 Mar 2023 13:21:58 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:tmp/for-baol-0303 17/53]
 drivers/vfio/group.c:185:9: error: call to undeclared function
 'iommufd_vfio_compat_ioas_get_id'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202303031352.wjlHM654-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git tmp/for-baol-0303
head:   028abaf51f935755b020cbb2c8f196862dd3a312
commit: 47d3e152b660af969c89ac719f5f6cd8eeffcac6 [17/53] vfio: Add infrastructure for bind_iommufd from userspace
config: arm-randconfig-r031-20230302 (https://download.01.org/0day-ci/archive/20230303/202303031352.wjlHM654-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/yiliu1765/iommufd/commit/47d3e152b660af969c89ac719f5f6cd8eeffcac6
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd tmp/for-baol-0303
        git checkout 47d3e152b660af969c89ac719f5f6cd8eeffcac6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/vfio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031352.wjlHM654-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/group.c:185:9: error: call to undeclared function 'iommufd_vfio_compat_ioas_get_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = iommufd_vfio_compat_ioas_get_id(device->group->iommufd,
                         ^
   drivers/vfio/group.c:185:9: note: did you mean 'iommufd_vfio_compat_ioas_create'?
   include/linux/iommufd.h:96:19: note: 'iommufd_vfio_compat_ioas_create' declared here
   static inline int iommufd_vfio_compat_ioas_create(struct iommufd_ctx *ictx)
                     ^
   1 error generated.


vim +/iommufd_vfio_compat_ioas_get_id +185 drivers/vfio/group.c

   171	
   172	static int vfio_device_group_open(struct vfio_device_file *df)
   173	{
   174		struct vfio_device *device = df->device;
   175		u32 ioas_id;
   176		int ret;
   177	
   178		mutex_lock(&device->group->group_lock);
   179		if (!vfio_group_has_iommu(device->group)) {
   180			ret = -EINVAL;
   181			goto out_unlock;
   182		}
   183	
   184		if (device->group->iommufd) {
 > 185			ret = iommufd_vfio_compat_ioas_get_id(device->group->iommufd,
   186							      &ioas_id);
   187			if (ret)
   188				goto out_unlock;
   189		}
   190	
   191		mutex_lock(&device->dev_set->lock);
   192	
   193		/*
   194		 * Before the first device open, get the KVM pointer currently
   195		 * associated with the group (if there is one) and obtain a reference
   196		 * now that will be held until the open_count reaches 0 again.  Save
   197		 * the pointer in the device for use by drivers.
   198		 */
   199		if (device->open_count == 0)
   200			vfio_device_group_get_kvm_safe(device);
   201	
   202		if (device->group->iommufd) {
   203			df->iommufd = device->group->iommufd;
   204			ret = vfio_device_open(df, NULL, &ioas_id);
   205		} else {
   206			ret = vfio_device_open(df, NULL, NULL);
   207		}
   208		if (ret)
   209			df->iommufd = NULL;
   210	
   211		if (device->open_count == 0)
   212			vfio_device_put_kvm(device);
   213	
   214		/*
   215		 * Paired with smp_load_acquire() in vfio_device_fops::ioctl/
   216		 * read/write/mmap
   217		 */
   218		smp_store_release(&df->access_granted, true);
   219	
   220		mutex_unlock(&device->dev_set->lock);
   221	
   222	out_unlock:
   223		mutex_unlock(&device->group->group_lock);
   224		return ret;
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
