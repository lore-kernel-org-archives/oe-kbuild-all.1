Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B594B425
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 19:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674155440; x=1705691440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vljlea7gMzkGTx4DedEtCSQmRg4P12oWW4gFXPJDU48=;
  b=Ij3V0OLElQfCCDysQ0gf+qoqKxrAg20kSiRHojlME59Df8nYdXXk+/PO
   AfGye94hAQIWBuokUXyfMNZ7KmyZrxuTWXVsahcigRLccf8/46raMwE1n
   hELTn3m2d7y82JAhNGnKz9SXXxy99ys3/nV+uSQF2YpzCbdn0FgpgA0TU
   17/aZrssm4G+ZgRvEqmZ4u4fc05zpZEriVOmM2KzMg4o7OhyE2uQc32fE
   wrGh14QzokLC2cZ7+HHvslvmAmeqZtEw49aOUHBHiejNHQU8PCqaAYwpU
   pxd08Yn4cwasI3IRpLPkJaCsUeUorX617RtgDGkh0YpGnJEBj5Mbf540v
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="326668945"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="326668945"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 11:07:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="749034472"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="749034472"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Jan 2023 11:07:07 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIaFf-0001l0-0L;
	Thu, 19 Jan 2023 19:07:07 +0000
Date: Fri, 20 Jan 2023 03:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd-v6.2-rc4-nesting 18/44]
 drivers/iommu/iommufd/iommufd_private.h:12:10: fatal error: ../iommu-priv.h:
 No such file or directory
Message-ID: <202301200358.ctqZYZaM-lkp@intel.com>
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
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230120/202301200358.ctqZYZaM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/5356ffe0f2a2009d50ff8141044f0f86c145b557
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd-v6.2-rc4-nesting
        git checkout 5356ffe0f2a2009d50ff8141044f0f86c145b557
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/iommu/

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
