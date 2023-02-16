Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D941017E2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 05:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676524278; x=1708060278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ARK/JWIrFkQw+RrJpLRHMZVXHxZeZ+NKW4Tr5uBwjds=;
  b=m3iYwmEbOETrWgCpJ32wTFi1UiQ8SplDXzGm2yDRyApVIzgBroy2RnSR
   7Hiq0L/Rm4UrXp3ZB6QBZzBbinsP65IQWGOxHCjw6nDolrCjM5hccBt9N
   Xn1ISVA84pBLB6vvOXB+x3WxYsQq06HiyrxnGNggIfoX9oPiPRC8tTn/K
   l7DD8gn1F3hJWOcWEg3D7YvKFG08YmXWq3QX87QliFtwiUMYhLj1UVrbf
   WjUIlqfyulH9uiKaN7RMHO3h5InBjgXrS75OKIFzoWkzIZVPdnECqKBaX
   AhlQRwv9PD7dzTqZQYFPVs3+lBgOxgtGrbD1xLqz9M4zzDtBvD3hOlHL/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="394047787"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="394047787"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 21:11:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="733733554"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="733733554"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Feb 2023 21:11:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSWY8-000A29-0k;
	Thu, 16 Feb 2023 05:11:16 +0000
Date: Thu, 16 Feb 2023 13:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommufd_hwpt 13/18]
 drivers/iommu/iommufd/selftest.c:161:22: warning: no previous prototype for
 'iommufd_selftest_domain_alloc'
Message-ID: <202302161331.0O1DYIv3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_hwpt
head:   82e583cb9cc344a911789e8d0d528d019b7fa28e
commit: 6903b4194a8f1c5ff4583031957b53529e772ef8 [13/18] iommufd: Make selftest create a more complete mock device
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230216/202302161331.0O1DYIv3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jgunthorpe/linux/commit/6903b4194a8f1c5ff4583031957b53529e772ef8
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe iommufd_hwpt
        git checkout 6903b4194a8f1c5ff4583031957b53529e772ef8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302161331.0O1DYIv3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/selftest.c:161:22: warning: no previous prototype for 'iommufd_selftest_domain_alloc' [-Wmissing-prototypes]
     161 | struct iommu_domain *iommufd_selftest_domain_alloc(void)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/iommufd_selftest_domain_alloc +161 drivers/iommu/iommufd/selftest.c

   160	
 > 161	struct iommu_domain *iommufd_selftest_domain_alloc(void)
   162	{
   163		return mock_domain_alloc(IOMMU_DOMAIN_UNMANAGED);
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
