Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632A2648
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jan 2023 06:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674367818; x=1705903818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lekycOV0d+Ud0IRIv+QDBN5ZY9GBmzKbkEtDp9Wu/Qc=;
  b=mlA8EveUOFNVOnLJ8fmXBs5Hp+Ai4G17X/A6qQ7hrtXl3e9YBClwrZk5
   6c0cazAfiAMdj9WYMySspvw2KhNI7DhAMxMYsoUuuzHIwwghQoeJYg9ry
   nUPRcqsfxVWO01WRO0kWAKeJOSg3Pwp6dQrhm3NG/2/S0MZNWfYiWr/qE
   CYpde7JSdNQ7OegWdE0bmpqSFRtQukdDUn1oAoeeLan1hKNYj7R1l/JOc
   DGkTNuE+AAs7xSY8qMrPo0Uj2JiyyBLzkya2KJYkKds3ZDTa45PX8u4c/
   VwfIXJExVZ9gAVBCxLYq1fMrTC8BmC2pewM21cNIsobTIHYYrKO2gw3ry
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="325907769"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="325907769"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 22:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="834882282"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="834882282"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Jan 2023 22:10:16 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJTYV-0004oC-27;
	Sun, 22 Jan 2023 06:10:15 +0000
Date: Sun, 22 Jan 2023 14:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd-v6.2-rc4-nesting 19/43]
 drivers/iommu/iommufd/device.c:140:21: sparse: sparse: non size-preserving
 integer to pointer cast
Message-ID: <202301221445.kamShCvg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd-v6.2-rc4-nesting
head:   88fc43f83ab9bb5590e8f8f974e6b2958bf9b65d
commit: 780ff179e3d77515319b240ba246a691d9365477 [19/43] iommufd: Add IOMMU_DEVICE_GET_INFO
config: csky-randconfig-s041-20230122 (https://download.01.org/0day-ci/archive/20230122/202301221445.kamShCvg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/yiliu1765/iommufd/commit/780ff179e3d77515319b240ba246a691d9365477
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd-v6.2-rc4-nesting
        git checkout 780ff179e3d77515319b240ba246a691d9365477
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/iommufd/device.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
>> drivers/iommu/iommufd/device.c:140:21: sparse: sparse: non size-preserving integer to pointer cast
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)

vim +140 drivers/iommu/iommufd/device.c

   134	
   135	static int iommufd_zero_fill_user(u64 ptr, int bytes)
   136	{
   137		int index = 0;
   138	
   139		for (; index < bytes; index++) {
 > 140			if (put_user(0, (uint8_t __user *)(ptr + index)))
   141				return -EFAULT;
   142		}
   143		return 0;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
