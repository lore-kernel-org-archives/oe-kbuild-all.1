Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B84F4A12
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 10:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683109454; x=1714645454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vLQhq/VApEPvXYCLaOk78HWtuNnqSJ8PVVnItIpFZbQ=;
  b=ERl6WkRrhrrBd+4/8Ip7U2p79O8zpz5BMsFufh45TXGL8EBwcNiNmQvd
   03xHhXmg7y6HsT9/xo3qMqOO3Ln/OhEzUtCUowYgw1uF9dyUR1PkjI9zP
   Sfq4ALCewh+qeekz5QSBt3wKjiHc4cO3cmKYJv9RwZzFgev7FG6eHKsZM
   V65X03yUP/Cfkj/nPAs6z6jbYGfrxHcA6WAYuYoVHvXjw2q2rkqs3JpX4
   6jcZo0pv7W/p9uwnW6RV+EPzuMqTGiILi9OKMS/J2ptp6XUymVZyxCwC9
   a2o3AZD74kWuQW5ZsAWovNRW8avtp3xQcKwB5iW64zpP5M3xxM9YsiKrY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="414079141"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="414079141"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 03:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="840642009"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="840642009"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 May 2023 03:24:12 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pu9ec-0001tI-3C;
	Wed, 03 May 2023 10:24:10 +0000
Date: Wed, 3 May 2023 18:23:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_all_defdom 47/73]
 drivers/iommu/s390-iommu.c:153:18: error: 'struct zpci_dev' has no member
 named 'domain'
Message-ID: <202305031855.WTl74vnL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_all_defdom
head:   6c7c1e2dea2e92de43f4eaef4caf2d5a617344a7
commit: bcfeb0e1c7f901058662870dcc08f3e27777af01 [47/73] iommu/s390: Replace set_platform_dma_ops() with IOMMU_DOMAIN_PLATFORM
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230503/202305031855.WTl74vnL-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jgunthorpe/linux/commit/bcfeb0e1c7f901058662870dcc08f3e27777af01
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe iommu_all_defdom
        git checkout bcfeb0e1c7f901058662870dcc08f3e27777af01
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305031855.WTl74vnL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/s390-iommu.c: In function 's390_iommu_platform_attach':
>> drivers/iommu/s390-iommu.c:153:18: error: 'struct zpci_dev' has no member named 'domain'
     153 |         if (!zdev->domain)
         |                  ^~


vim +153 drivers/iommu/s390-iommu.c

   144	
   145	/*
   146	 * Switch control over the IOMMU to S390's internal dma_api ops
   147	 */
   148	static int s390_iommu_platform_attach(struct iommu_domain *platform_domain,
   149					      struct device *dev)
   150	{
   151		struct zpci_dev *zdev = to_zpci_dev(dev);
   152	
 > 153		if (!zdev->domain)
   154			return 0;
   155	
   156		__s390_iommu_detach_device(zdev);
   157		zpci_dma_init_device(zdev);
   158		return 0;
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
