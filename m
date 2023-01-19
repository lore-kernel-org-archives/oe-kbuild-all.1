Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20843B425
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 18:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674153969; x=1705689969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YU3IbzjC/Yb8k3ZDmNtUr8vZgKAkkw1MCBxY4W00tQo=;
  b=MjOWziCfpnKD8sYef9l4edYKSULe8xd2nsY/p/X0xa26walVl1T1imnf
   aHdpPsBwN0LCA6ElPd7xvjGGtjWbbndRh9GVpnDL1mn686PBRDTY3FNIP
   bd5OmvXXlXlHAjiZG4zHxBnEMXJbFGjUyqjru/hQzva7iteZYavTBuwOY
   4rdm8OQqnms/kRKp/oxt336n2TNn/lNUDkLkv/rU7CTGH6hyY0r8d9OGG
   qrO36GESm/I4Io0XrwcKaMuJyuYuRcFfz+LBsxc9Sz2o5nKQ8sL0Ozr+K
   88wH2BN5m0FfTeq0mCYUpM0X4g9hS9MKpVbI2PMvinDINCaQxC5rqTtT9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="352637125"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="352637125"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 10:46:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="660303057"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="660303057"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Jan 2023 10:46:07 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIZvK-0001kA-0v;
	Thu, 19 Jan 2023 18:46:06 +0000
Date: Fri, 20 Jan 2023 02:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd-v6.2-rc4-nesting 18/44]
 drivers/iommu/iommufd/iommufd_private.h:12:10: fatal error:
 '../iommu-priv.h' file not found
Message-ID: <202301200227.QthEOgIa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd-v6.2-rc4-nesting
head:   7eee8c49202d2327b315ddebf336ab63c31cc09c
commit: 5356ffe0f2a2009d50ff8141044f0f86c145b557 [18/44] iommufd: Add IOMMU_DEVICE_GET_INFO
config: riscv-randconfig-r023-20230119 (https://download.01.org/0day-ci/archive/20230120/202301200227.QthEOgIa-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/yiliu1765/iommufd/commit/5356ffe0f2a2009d50ff8141044f0f86c145b557
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd-v6.2-rc4-nesting
        git checkout 5356ffe0f2a2009d50ff8141044f0f86c145b557
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommufd/device.c:9:
   In file included from drivers/iommu/iommufd/io_pagetable.h:13:
>> drivers/iommu/iommufd/iommufd_private.h:12:10: fatal error: '../iommu-priv.h' file not found
   #include "../iommu-priv.h"
            ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +12 drivers/iommu/iommufd/iommufd_private.h

    11	
  > 12	#include "../iommu-priv.h"
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
