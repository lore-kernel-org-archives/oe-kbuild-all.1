Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0EEB43E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 19:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674157030; x=1705693030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9sz20wgTJxs/h7cQOaWaKlMzwm16fgnWVE0HJAOeXfw=;
  b=mjTMWGONEnLj+7ZT6LzBOAI2TeOCwOrNexqbFLc9R3Eo2h5l4Eq5b3M7
   Ti+kD6jW9vXpiKvMdjkRiIqOYgU8AA7B4FjyYGjDnZUi0ncPMSS5zWMGe
   jUANQcgAR5XqEwCNHO0bLcFEqZP2yuo5iqYMs8q2me/xm+NhhB0LVM9xK
   XaPsa52Kt+y/C2V3m/pV8PeVJbqGKhTjVexdk4T9XtBJ179coqcPTG/xz
   hOhuQrBxwx8dXNx0TtNEJyA4c3cGXjyn5C8OrDDQTxWIMcfdci3Yzf+Kk
   cNVFMHBFPoQuTRoKzHkYM0VWEWdlW6dBsumkZyd3wotMTBu++RzTl4Obw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305765519"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="305765519"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 11:37:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="905670645"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="905670645"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Jan 2023 11:37:09 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIaii-0001mq-1v;
	Thu, 19 Jan 2023 19:37:08 +0000
Date: Fri, 20 Jan 2023 03:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd-v6.2-rc4-nesting 17/44]
 drivers/iommu/iommu.c:38:10: fatal error: iommu-priv.h: No such file or
 directory
Message-ID: <202301200346.YJTCQ7pZ-lkp@intel.com>
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
commit: 8bd1167527f81e6228018b1b00513b992e5d3210 [17/44] iommu: Move dev_iommu_ops() to private header
config: x86_64-rhel-8.3-syz (https://download.01.org/0day-ci/archive/20230120/202301200346.YJTCQ7pZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/yiliu1765/iommufd/commit/8bd1167527f81e6228018b1b00513b992e5d3210
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd-v6.2-rc4-nesting
        git checkout 8bd1167527f81e6228018b1b00513b992e5d3210
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/iommu/iommu.c:38:10: fatal error: iommu-priv.h: No such file or directory
      38 | #include "iommu-priv.h"
         |          ^~~~~~~~~~~~~~
   compilation terminated.


vim +38 drivers/iommu/iommu.c

    37	
  > 38	#include "iommu-priv.h"
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
