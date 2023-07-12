Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8348D441F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 10:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689158636; x=1720694636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aEucenxcK3yJuO8nYLYmAuRgVvaCwxs9P6AOg1rw6sY=;
  b=aK2+Fzbomk7x6a/Y684Z+9jlDIVS50wUuZ8jJFgpvU2zA6eWfcxWHarv
   OFgIp/VZftERxL0z5abX9UJCHMiN9QyX8/3epbMW0egIw8TOvnj6j+Qqa
   R8KXHx1XyzakX0GHE9JEPWWRSeca9wNJpWJ4izI6jv6RdIpt0XJVvzKIh
   i8pZglS6b036HZ3CvGf7bnHt3KjuxUtgjx3A3Scbb03CFwa7+V72Hr8v4
   2/NIGicUGX8AkdIHUPzuD7HieHj30Bv2ib0tP8DyYjc6v7gWXfujLZ0nk
   6/MExNvrkshEwpbdfhu9ZVVoWS/prDhC3ZVyLzMqHcoiNUWzVclOgxkh4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362323268"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="362323268"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 03:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="724841785"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="724841785"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jul 2023 03:43:52 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJXK3-0005dL-2g;
	Wed, 12 Jul 2023 10:43:51 +0000
Date: Wed, 12 Jul 2023 18:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid 68/70]
 drivers/vfio/pci/vfio_pci.c:145:35: error:
 'vfio_iommufd_physical_pasid_attach_ioas' undeclared here (not in a
 function); did you mean 'vfio_iommufd_physical_attach_ioas'?
Message-ID: <202307121817.8ldDJAZF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid
head:   8db4af69ff01c9d7e21e41bf884c6c727dd8525a
commit: 3ec6edc4643d8e526bbcd6eff007c2c6e15383ee [68/70] vfio-iommufd: Support pasid [at|de]tach for physical VFIO devices
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230712/202307121817.8ldDJAZF-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121817.8ldDJAZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121817.8ldDJAZF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/pci/vfio_pci.c:145:35: error: 'vfio_iommufd_physical_pasid_attach_ioas' undeclared here (not in a function); did you mean 'vfio_iommufd_physical_attach_ioas'?
     145 |         .pasid_attach_ioas      = vfio_iommufd_physical_pasid_attach_ioas,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   vfio_iommufd_physical_attach_ioas
>> drivers/vfio/pci/vfio_pci.c:146:35: error: 'vfio_iommufd_physical_pasid_detach_ioas' undeclared here (not in a function); did you mean 'vfio_iommufd_physical_detach_ioas'?
     146 |         .pasid_detach_ioas      = vfio_iommufd_physical_pasid_detach_ioas,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   vfio_iommufd_physical_detach_ioas


vim +145 drivers/vfio/pci/vfio_pci.c

   127	
   128	static const struct vfio_device_ops vfio_pci_ops = {
   129		.name		= "vfio-pci",
   130		.init		= vfio_pci_core_init_dev,
   131		.release	= vfio_pci_core_release_dev,
   132		.open_device	= vfio_pci_open_device,
   133		.close_device	= vfio_pci_core_close_device,
   134		.ioctl		= vfio_pci_core_ioctl,
   135		.device_feature = vfio_pci_core_ioctl_feature,
   136		.read		= vfio_pci_core_read,
   137		.write		= vfio_pci_core_write,
   138		.mmap		= vfio_pci_core_mmap,
   139		.request	= vfio_pci_core_request,
   140		.match		= vfio_pci_core_match,
   141		.bind_iommufd	= vfio_iommufd_physical_bind,
   142		.unbind_iommufd	= vfio_iommufd_physical_unbind,
   143		.attach_ioas	= vfio_iommufd_physical_attach_ioas,
   144		.detach_ioas	= vfio_iommufd_physical_detach_ioas,
 > 145		.pasid_attach_ioas	= vfio_iommufd_physical_pasid_attach_ioas,
 > 146		.pasid_detach_ioas	= vfio_iommufd_physical_pasid_detach_ioas,
   147	};
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
