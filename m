Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE3810E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 22:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680215236; x=1711751236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OhpZX5z3m6fiVAu1EfPaWNb/0YCMRhgafwpiaq2/bhw=;
  b=D8nFVa2vdDpzCENpwxzsd9rsjCpGB64ArnjQdzwCDZrLLi48ElLDlZ4p
   gHLdJeUeN7RrWHH76Yy7XPF/B36OaeW50d53QOy6+7xn0r+HxKm3yu8/Q
   XQulj7qk4aMuX8XIrdJ9655Hylc+wqnTb5umGvXmb0VR7AIf3iSRCIgZ+
   x6gbTwaQ4eO7emAdpbl/ciXdKtp98Ez4ZNqTlKL4lwvy1krAeK4wRaUZs
   fkVM+hiQR8u54Txd+oZ7lpRAYExwPn9YgLO94O5s71mZUSHDi314ooIFe
   8R/pidwQFZQtCkW3z1jbw2uQfgXEN+iEiCdcfw5eksMtZ/YnA/OKZXJYJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="404000146"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="404000146"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 15:27:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="754189047"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="754189047"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2023 15:27:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi0jg-000LGm-1W;
	Thu, 30 Mar 2023 22:27:12 +0000
Date: Fri, 31 Mar 2023 06:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-03292023-yi 3/42]
 drivers/iommu/iommufd/device.c:271:21: sparse: sparse: non size-preserving
 integer to pointer cast
Message-ID: <202303310622.LDQO1rSg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-03292023-yi
head:   032ce679f2322b426350f8721d7a1afca1bb7aab
commit: 06ac6c12f5cac61638684e9d6f3fee0fca1287d3 [3/42] iommufd: Add IOMMU_DEVICE_GET_HW_INFO
config: arc-randconfig-s032-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310622.LDQO1rSg-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/yiliu1765/iommufd/commit/06ac6c12f5cac61638684e9d6f3fee0fca1287d3
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd_nesting-03292023-yi
        git checkout 06ac6c12f5cac61638684e9d6f3fee0fca1287d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310622.LDQO1rSg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/device.c:271:21: sparse: sparse: non size-preserving integer to pointer cast

vim +271 drivers/iommu/iommufd/device.c

   265	
   266	static int iommufd_zero_fill_user(u64 ptr, int bytes)
   267	{
   268		int index = 0;
   269	
   270		for (; index < bytes; index++) {
 > 271			if (put_user(0, (uint8_t __user *)(ptr + index)))
   272				return -EFAULT;
   273		}
   274		return 0;
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
