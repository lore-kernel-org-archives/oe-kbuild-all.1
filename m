Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869CD25554
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 16:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjB/VWkm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704387372; x=1735923372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VXa6zI4zPkFszIbqPoRIuKGZFICqK3dkP+gOQ0cGi4c=;
  b=VjB/VWkmujDc/PfIXllIGhheq7yrhNUbn/DF3OSZG4NVALvbDgdz484m
   IlB35tT0sgzjkh9bibpmGLBf9+ga1SJAqUt4jGruPRdz8byHz01ppJKJM
   FlJMemCtoPO7vvMzK9OoN+L6eKWqiWL0hRb3JV+0gigQcJ8hZgVIVJIDX
   y8IEjKLg4IMspUwV/sC30Lf/0+gGE79cFthsJn1S2YgLjqfHeM67QUeAZ
   JNugc6FCnL95VHFakTRTz9mGJp97kcOpiSftn5aFI4/SqAh2FUCS3rbA3
   RrgfLgDfuUvs9VA0rznzt0RCjgnTeupw+PU6BKDzHeBiCYdbZyx0xDR/c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4076643"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="4076643"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 08:56:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="773581880"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="773581880"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Jan 2024 08:56:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLR0n-0000D8-23;
	Thu, 04 Jan 2024 16:56:05 +0000
Date: Fri, 5 Jan 2024 00:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, "Song, Youquan" <youquan.song@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Cornelia Huck <cohuck@redhat.com>, Christoph Hellwig <hch@lst.de>,
	Alex Williamson <alex.williamson@redhat.com>,
	Chen Zhuo <sagazchen@tencent.com>,
	Xinghui Li <korantli@tencent.com>
Subject: drivers/gpu/drm/i915/gvt/gvt.c:108:26: error: initialization of
 'ssize_t (*)(struct mdev_type *, struct mdev_type_attribute *, char *)' {aka
 'long int (*)(struct mdev_type *, struct mdev_type_attribute *, char *)'}
 from incompatible pointer type 'ssize_t ...
Message-ID: <202401050051.SzO58Xty-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git lts/5.4.119-20.0009.spr
head:   2b05031ac9b7e23091affe1b717425ef76750bd9
commit: 4804eaccc2985db994a5a507ad7edb4b6c162c7f vfio/mdev: Correct the function signatures for the mdev_type_attributes
date:   7 months ago
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20240105/202401050051.SzO58Xty-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401050051.SzO58Xty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401050051.SzO58Xty-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/gpu/drm/i915/i915_drv.h:39,
                    from drivers/gpu/drm/i915/gvt/gvt.c:37:
>> drivers/gpu/drm/i915/gvt/gvt.c:108:26: error: initialization of 'ssize_t (*)(struct mdev_type *, struct mdev_type_attribute *, char *)' {aka 'long int (*)(struct mdev_type *, struct mdev_type_attribute *, char *)'} from incompatible pointer type 'ssize_t (*)(struct kobject *, struct device *, char *)' {aka 'long int (*)(struct kobject *, struct device *, char *)'} [-Werror=incompatible-pointer-types]
     108 | static MDEV_TYPE_ATTR_RO(available_instances);
         |                          ^~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:117:19: note: in definition of macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:108:8: note: in expansion of macro 'MDEV_TYPE_ATTR_RO'
     108 | static MDEV_TYPE_ATTR_RO(available_instances);
         |        ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:108:26: note: (near initialization for 'mdev_type_attr_available_instances.show')
     108 | static MDEV_TYPE_ATTR_RO(available_instances);
         |                          ^~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:117:19: note: in definition of macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:108:8: note: in expansion of macro 'MDEV_TYPE_ATTR_RO'
     108 | static MDEV_TYPE_ATTR_RO(available_instances);
         |        ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:109:26: error: initialization of 'ssize_t (*)(struct mdev_type *, struct mdev_type_attribute *, char *)' {aka 'long int (*)(struct mdev_type *, struct mdev_type_attribute *, char *)'} from incompatible pointer type 'ssize_t (*)(struct kobject *, struct device *, char *)' {aka 'long int (*)(struct kobject *, struct device *, char *)'} [-Werror=incompatible-pointer-types]
     109 | static MDEV_TYPE_ATTR_RO(device_api);
         |                          ^~~~~~~~~~
   include/linux/sysfs.h:117:19: note: in definition of macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:109:8: note: in expansion of macro 'MDEV_TYPE_ATTR_RO'
     109 | static MDEV_TYPE_ATTR_RO(device_api);
         |        ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:109:26: note: (near initialization for 'mdev_type_attr_device_api.show')
     109 | static MDEV_TYPE_ATTR_RO(device_api);
         |                          ^~~~~~~~~~
   include/linux/sysfs.h:117:19: note: in definition of macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:109:8: note: in expansion of macro 'MDEV_TYPE_ATTR_RO'
     109 | static MDEV_TYPE_ATTR_RO(device_api);
         |        ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:110:26: error: initialization of 'ssize_t (*)(struct mdev_type *, struct mdev_type_attribute *, char *)' {aka 'long int (*)(struct mdev_type *, struct mdev_type_attribute *, char *)'} from incompatible pointer type 'ssize_t (*)(struct kobject *, struct device *, char *)' {aka 'long int (*)(struct kobject *, struct device *, char *)'} [-Werror=incompatible-pointer-types]
     110 | static MDEV_TYPE_ATTR_RO(description);
         |                          ^~~~~~~~~~~
   include/linux/sysfs.h:117:19: note: in definition of macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:110:8: note: in expansion of macro 'MDEV_TYPE_ATTR_RO'
     110 | static MDEV_TYPE_ATTR_RO(description);
         |        ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:110:26: note: (near initialization for 'mdev_type_attr_description.show')
     110 | static MDEV_TYPE_ATTR_RO(description);
         |                          ^~~~~~~~~~~
   include/linux/sysfs.h:117:19: note: in definition of macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/gpu/drm/i915/gvt/gvt.c:110:8: note: in expansion of macro 'MDEV_TYPE_ATTR_RO'
     110 | static MDEV_TYPE_ATTR_RO(description);
         |        ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +108 drivers/gpu/drm/i915/gvt/gvt.c

^590eaf1fec755 Kaixu Xia 2021-03-16  107  
^590eaf1fec755 Kaixu Xia 2021-03-16 @108  static MDEV_TYPE_ATTR_RO(available_instances);
^590eaf1fec755 Kaixu Xia 2021-03-16  109  static MDEV_TYPE_ATTR_RO(device_api);
^590eaf1fec755 Kaixu Xia 2021-03-16  110  static MDEV_TYPE_ATTR_RO(description);
^590eaf1fec755 Kaixu Xia 2021-03-16  111  

:::::: The code at line 108 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
