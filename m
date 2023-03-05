Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84381D2E6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Mar 2023 03:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677988396; x=1709524396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SQGTQJAPR5rLvbnsGerV9PwwtknZ5FU6RGFUc0IKCYk=;
  b=N4NYoae2MdXftf6+8ZgcQVNJdTI/njwSJnMeW/cW2wD160yqcukl5SR+
   xpWewxe/BGwW0u9GkD42uhLc5r0WR415dIwynGjTnhm8+3JDQmSk6q2CG
   exehdFl+HCC85JZ4mOPq9g+lKArsAeUwBhK0oIU4qkVZv7ZnTnwivK5Od
   TXWRwLpOf5Nc1s+wlDWWfVtOZiUhbuszqMPcLrOj2Ua3DtJ1cf1alUek6
   0+vLgPENJ+73GBeHTrHLGuU8gMpgJx0Jatnd+23JT3d3E5UhUDEQ9IX1A
   X9phZGn5jWnfkZ1EswhCy15fVu2wOZAwTRnkp7motRJGSLNZO/spT28pc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="319166925"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="319166925"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 19:53:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="706058724"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="706058724"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Mar 2023 19:53:14 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYfQw-0002XK-0j;
	Sun, 05 Mar 2023 03:53:14 +0000
Date: Sun, 5 Mar 2023 11:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:tmp/for-baol-0303 32/53]
 drivers/iommu/iommufd/device.c:247:21: sparse: sparse: non size-preserving
 integer to pointer cast
Message-ID: <202303051145.IAIuz9Fp-lkp@intel.com>
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
commit: ff36dc2e826bee1bb7c880b6fdd9612a7b13af24 [32/53] iommufd: Add IOMMU_DEVICE_GET_INFO
config: openrisc-randconfig-s042-20230302 (https://download.01.org/0day-ci/archive/20230305/202303051145.IAIuz9Fp-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/yiliu1765/iommufd/commit/ff36dc2e826bee1bb7c880b6fdd9612a7b13af24
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd tmp/for-baol-0303
        git checkout ff36dc2e826bee1bb7c880b6fdd9612a7b13af24
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303051145.IAIuz9Fp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/device.c:247:21: sparse: sparse: non size-preserving integer to pointer cast

vim +247 drivers/iommu/iommufd/device.c

   241	
   242	static int iommufd_zero_fill_user(u64 ptr, int bytes)
   243	{
   244		int index = 0;
   245	
   246		for (; index < bytes; index++) {
 > 247			if (put_user(0, (uint8_t __user *)(ptr + index)))
   248				return -EFAULT;
   249		}
   250		return 0;
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
