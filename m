Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBDA184F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 05:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678685924; x=1710221924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=edFt7zfY0q/kut04n6X47oEY2x/KNKiRyt3vpoSWICk=;
  b=n84MzUYrBWOW3nMMcDTBu4oaRFphfEdsXAI7oEFJX5F+oo+fSRrUyZsN
   QDeBEG1uco6wmsqch/BOP9+fSrQzxQQxO6yeo08aV3W00G5SblYPSi/Ot
   HJ4dPYcHOaT01sMNpper0Nqikc0KchF77asc5PjzSkgz8Es0mJyqYDAEB
   cyShv7q8q1TsUlWUd5sBlvwuDStjiiLC5YrUf6RoTWVzIQSsPS0tGd9Gr
   NRMZ15BM7RQYl4PAQ5nTUXljCbsvcuqbIjE4LfV4OM9kIW3S75DOBKWfq
   BaIRr7pfWVmWnFhKRjEXUJ63wstPqTv2YvpQNNDyTgBHelW7uXgLADhCJ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="316715387"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="316715387"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2023 22:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="671772682"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="671772682"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Mar 2023 22:38:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbatN-0005HS-0w;
	Mon, 13 Mar 2023 05:38:41 +0000
Date: Mon, 13 Mar 2023 13:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/vfio_device_cdev_v7_candidate 24/32]
 drivers/vfio/group.c:190:5: warning: no previous prototype for
 'vfio_device_group_attach_compat_ioas'
Message-ID: <202303131339.59A950mL-lkp@intel.com>
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
config: arc-randconfig-r043-20230313 (https://download.01.org/0day-ci/archive/20230313/202303131339.59A950mL-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/61736068803cb2135b42cbf5618c3f116500aa1d
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/vfio_device_cdev_v7_candidate
        git checkout 61736068803cb2135b42cbf5618c3f116500aa1d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/vfio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303131339.59A950mL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/group.c:190:5: warning: no previous prototype for 'vfio_device_group_attach_compat_ioas' [-Wmissing-prototypes]
     190 | int vfio_device_group_attach_compat_ioas(struct vfio_device *device,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
