Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A66EB425
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 19:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674155483; x=1705691483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ykzgq/6G3VWsomwF9bdKS2YXS+pfapl7/sMfA5hLsLw=;
  b=BCD89JBNVbiOW378GdQymfTyKhuXbbURDuHNcoCI29fWrMbmvgys2LjX
   dFygBcFW7SO0hWErukCJvcljazNIMKrFHjySQYz+1IZh2c4KyaXKw7MzM
   bYjzfvz2qini/Jj8jPYiYXJqqjoZbRhp0HjwojAwVXZCqbTOQuteiJFHt
   Sbg/6yqffZsCDszjBO5eOTcQ2OTixY6BD+4fQNWe3zX5jCtEnH1pXZXrE
   WQZWrhbSOT+8wUVDI+E6PdjZqWm195fgQFkD+9YjeQWAnpp1uOsfSkegw
   ftDXZL0glsAv/sOWzwbVlUxo2sguPhI1QIx1nCIeh4TiNJr3NEzpa4YjL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="325430631"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="325430631"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 11:07:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="768350202"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="768350202"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2023 11:07:07 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIaFf-0001ky-08;
	Thu, 19 Jan 2023 19:07:07 +0000
Date: Fri, 20 Jan 2023 03:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd-v6.2-rc4-nesting 18/44]
 drivers/iommu/iommufd/iommufd_private.h:12:10: fatal error: ../iommu-priv.h:
 No such file or directory
Message-ID: <202301200351.KqeMrMVC-lkp@intel.com>
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
config: nios2-randconfig-r024-20230119 (https://download.01.org/0day-ci/archive/20230120/202301200351.KqeMrMVC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/5356ffe0f2a2009d50ff8141044f0f86c145b557
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd-v6.2-rc4-nesting
        git checkout 5356ffe0f2a2009d50ff8141044f0f86c145b557
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommufd/io_pagetable.h:13,
                    from drivers/iommu/iommufd/device.c:9:
>> drivers/iommu/iommufd/iommufd_private.h:12:10: fatal error: ../iommu-priv.h: No such file or directory
      12 | #include "../iommu-priv.h"
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +12 drivers/iommu/iommufd/iommufd_private.h

    11	
  > 12	#include "../iommu-priv.h"
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
