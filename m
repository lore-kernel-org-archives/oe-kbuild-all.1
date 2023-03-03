Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C501C1874
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 05:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677820974; x=1709356974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3mdgNOqccPPr+F/4yfbCsvkS0UwA896/tjFmZ/nfG94=;
  b=Mx7/CfJuj2LeoFOkDesDFw2uspkM0u/2cTKeR/xsCjqriNClWaHZY11Z
   0RB4Y/neJrjFCPwdYMSXmYwYjBpEfcIpC0Wk0zCtIXl5XzlmhqwxspOnP
   ABFRQ7dRd1wClvA7Imm6xR/0JDluRZZEmyi9TvxAKYt2qnwu9l0b0rIT8
   kRu57l5C6z62wSngvSf3aYsB7VgNM9VRgbC5xyj2qCNnVZKuz6MgFAI5t
   JPbePxDozXrHwzs2D2rO2wRTspFxCTLnk1w894ht++6EM3VwvEUbTH579
   7WJ9nQnHbFtuFyZlTGtAScdrGf9cv2XQ1qAWB0IBPzN90qKI155a14fYL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="323254622"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="323254622"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 21:22:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="799117764"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="799117764"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Mar 2023 21:22:50 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXxsX-0001DW-37;
	Fri, 03 Mar 2023 05:22:49 +0000
Date: Fri, 3 Mar 2023 13:21:57 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:tmp/for-baol-0303 32/53]
 drivers/iommu/iommufd/device.c:247:33: warning: cast to pointer from integer
 of different size
Message-ID: <202303031326.Apfli8PI-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230303/202303031326.Apfli8PI-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/ff36dc2e826bee1bb7c880b6fdd9612a7b13af24
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd tmp/for-baol-0303
        git checkout ff36dc2e826bee1bb7c880b6fdd9612a7b13af24
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031326.Apfli8PI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:746,
                    from include/linux/scatterlist.h:8,
                    from include/linux/iommu.h:10,
                    from drivers/iommu/iommufd/device.c:6:
   drivers/iommu/iommufd/device.c: In function 'iommufd_zero_fill_user':
>> drivers/iommu/iommufd/device.c:247:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     247 |                 if (put_user(0, (uint8_t __user *)(ptr + index)))
         |                                 ^
   arch/m68k/include/asm/uaccess.h:81:18: note: in definition of macro '__put_user'
      81 |         typeof(*(ptr)) __pu_val = (x);                                  \
         |                  ^~~
   drivers/iommu/iommufd/device.c:247:21: note: in expansion of macro 'put_user'
     247 |                 if (put_user(0, (uint8_t __user *)(ptr + index)))
         |                     ^~~~~~~~
>> drivers/iommu/iommufd/device.c:247:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     247 |                 if (put_user(0, (uint8_t __user *)(ptr + index)))
         |                                 ^
   arch/m68k/include/asm/uaccess.h:84:27: note: in definition of macro '__put_user'
      84 |         switch (sizeof (*(ptr))) {                                      \
         |                           ^~~
   drivers/iommu/iommufd/device.c:247:21: note: in expansion of macro 'put_user'
     247 |                 if (put_user(0, (uint8_t __user *)(ptr + index)))
         |                     ^~~~~~~~
>> drivers/iommu/iommufd/device.c:247:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     247 |                 if (put_user(0, (uint8_t __user *)(ptr + index)))
         |                                 ^
   arch/m68k/include/asm/uaccess.h:46:31: note: in definition of macro '__put_user_asm'
      46 |         : "+d" (res), "=m" (*(ptr))                     \
         |                               ^~~
   arch/m68k/include/asm/uaccess.h:102:33: note: in expansion of macro '__put_user'
     102 | #define put_user(x, ptr)        __put_user(x, ptr)
         |                                 ^~~~~~~~~~
   drivers/iommu/iommufd/device.c:247:21: note: in expansion of macro 'put_user'
     247 |                 if (put_user(0, (uint8_t __user *)(ptr + index)))
         |                     ^~~~~~~~
>> drivers/iommu/iommufd/device.c:247:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     247 |                 if (put_user(0, (uint8_t __user *)(ptr + index)))
         |                                 ^
   arch/m68k/include/asm/uaccess.h:46:31: note: in definition of macro '__put_user_asm'
      46 |         : "+d" (res), "=m" (*(ptr))                     \
         |                               ^~~
   arch/m68k/include/asm/uaccess.h:102:33: note: in expansion of macro '__put_user'
     102 | #define put_user(x, ptr)        __put_user(x, ptr)
         |                                 ^~~~~~~~~~
   drivers/iommu/iommufd/device.c:247:21: note: in expansion of macro 'put_user'
     247 |                 if (put_user(0, (uint8_t __user *)(ptr + index)))
         |                     ^~~~~~~~
>> drivers/iommu/iommufd/device.c:247:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     247 |                 if (put_user(0, (uint8_t __user *)(ptr + index)))
         |                                 ^
   arch/m68k/include/asm/uaccess.h:46:31: note: in definition of macro '__put_user_asm'
      46 |         : "+d" (res), "=m" (*(ptr))                     \
         |                               ^~~
   arch/m68k/include/asm/uaccess.h:102:33: note: in expansion of macro '__put_user'
     102 | #define put_user(x, ptr)        __put_user(x, ptr)
         |                                 ^~~~~~~~~~
   drivers/iommu/iommufd/device.c:247:21: note: in expansion of macro 'put_user'
     247 |                 if (put_user(0, (uint8_t __user *)(ptr + index)))
         |                     ^~~~~~~~
>> drivers/iommu/iommufd/device.c:247:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     247 |                 if (put_user(0, (uint8_t __user *)(ptr + index)))
         |                                 ^
   arch/m68k/include/asm/uaccess.h:51:55: note: in definition of macro '__put_user_asm8'
      51 |         const void *__pu_ptr = (const void __force *)(ptr);     \
         |                                                       ^~~
   arch/m68k/include/asm/uaccess.h:102:33: note: in expansion of macro '__put_user'
     102 | #define put_user(x, ptr)        __put_user(x, ptr)
         |                                 ^~~~~~~~~~
   drivers/iommu/iommufd/device.c:247:21: note: in expansion of macro 'put_user'
     247 |                 if (put_user(0, (uint8_t __user *)(ptr + index)))
         |                     ^~~~~~~~


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
