Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D6665A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 06:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676702572; x=1708238572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mak+2spDnkPdkezU10rF7hygWi0+nInQyHNrSb7oJeM=;
  b=BjB+sj3Qof239+S9C13kt6xyY6RQsKG4638maWkPNCfv3qTE0rCEkZxd
   5a2uiuectO1N4tz3Yf0ILLRbbHgbH7/BwCuYDCUQguGKgbcLrmpK3kWq3
   5BYUg+5RaUGJwKN3JGovyVSNtvrNPPpBQS6DYUa/n8h5sQlW9HyTDAOnl
   OVmSX+aDA/3VAR0N/zoGhf2f79Zc9dXQT4dhT4ymcKbPxPDNUiPnZuoT2
   7P0yCs605lcTOljR5FNTRSikNnqmgL7vMeFfXilazM1d/h0PNHtgIuNiq
   BEykESAza1BbO3s8dkXDQxyj4akcWMH2/dbJqmzWV5ToVMh9NEM+Og1jE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="333510458"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="333510458"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 22:42:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="759644965"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="759644965"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Feb 2023 22:42:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTGvq-000CBo-06;
	Sat, 18 Feb 2023 06:42:50 +0000
Date: Sat, 18 Feb 2023 14:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommufd_hwpt 23/30] drivers/iommu/iommu.c:2192:5:
 warning: no previous prototype for 'iommu_group_replace_domain'
Message-ID: <202302181411.yCRCqU5U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_hwpt
head:   81e455ea8edf14c10d6c4db85d654bbbb3e0c387
commit: 86076ff7edfa93947a9d97fd573e795cf3a0505f [23/30] iommu: Introduce a new iommu_group_replace_domain() API
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230218/202302181411.yCRCqU5U-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jgunthorpe/linux/commit/86076ff7edfa93947a9d97fd573e795cf3a0505f
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe iommufd_hwpt
        git checkout 86076ff7edfa93947a9d97fd573e795cf3a0505f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302181411.yCRCqU5U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommu.c:2192:5: warning: no previous prototype for 'iommu_group_replace_domain' [-Wmissing-prototypes]
    2192 | int iommu_group_replace_domain(struct iommu_group *group,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/iommu_group_replace_domain +2192 drivers/iommu/iommu.c

  2180	
  2181	/**
  2182	 * iommu_group_replace_domain - replace the domain that a group is attached to
  2183	 * @new_domain: new IOMMU domain to replace with
  2184	 * @group: IOMMU group that will be attached to the new domain
  2185	 *
  2186	 * This API allows the group to switch domains without being forced to go to
  2187	 * the blocking domain in-between.
  2188	 *
  2189	 * If the currently attached domain is a core domain (e.g. a default_domain),
  2190	 * it will act just like the iommu_attach_group().
  2191	 */
> 2192	int iommu_group_replace_domain(struct iommu_group *group,
  2193				       struct iommu_domain *new_domain)
  2194	{
  2195		int ret;
  2196	
  2197		if (!new_domain)
  2198			return -EINVAL;
  2199	
  2200		mutex_lock(&group->mutex);
  2201		ret = __iommu_group_set_domain(group, new_domain);
  2202		if (ret)
  2203			__iommu_group_set_domain(group, group->domain);
  2204		mutex_unlock(&group->mutex);
  2205		return ret;
  2206	}
  2207	EXPORT_SYMBOL_NS_GPL(iommu_group_replace_domain, IOMMUFD_INTERNAL);
  2208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
