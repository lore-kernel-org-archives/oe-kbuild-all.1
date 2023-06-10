Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F80B8464
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 10:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686391711; x=1717927711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1+1X0pMqHCkH0/kCqA5rDwYyeGaCl6xUofy1///FVbw=;
  b=iaYuKdQIQis2RCa5Z/ARU7MJSvooDCr4NGsI+jPQ1XbaAb5JLiwAoxDI
   rVX7jB5KeHjhCqzDCJjWr2EEQLA9Idlk0fvIF3T8BK3Lm22hBm9r8+2Wr
   UiC5fpFOz0KXHUvUz4oWs5SfuMoVw3L5LewwjYUWKqGicYKRZCclNcH2i
   37rMJ6SPVUcC4LHgT15w/wUOw20X6cfWMufu9t/pn5UD7RthtK1YZaMUd
   ISvDYy34/UlIWlGNsN1dMV+sE/7roFnVrPnVu0LXpBkWY7iMUDPeByGHv
   p6cgELT9bhAKjvh8vjL2F+4jds2PUzoTGHEzjIARHdtuEEHnk6Yckq8AT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="347395282"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="347395282"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 03:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="957423221"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="957423221"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jun 2023 03:08:29 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7vWG-0009zi-2I;
	Sat, 10 Jun 2023 10:08:28 +0000
Date: Sat, 10 Jun 2023 18:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-05112023-yi-no-bitmap 30/51]
 drivers/iommu/iommufd/hw_pagetable.o: warning: objtool: iommufd_hwpt_alloc()
 falls through to next function kzalloc()
Message-ID: <202306101827.GQMzFsQI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-05112023-yi-no-bitmap
head:   9d42da14a06f33e64fc593b2287ad9a9a4d12880
commit: 0330eb928dba98c4fb3043c7c965cc6a3db7e133 [30/51] iommu/vt-d: Add nested domain allocation
config: x86_64-randconfig-a006-20230609 (https://download.01.org/0day-ci/archive/20230610/202306101827.GQMzFsQI-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/0330eb928dba98c4fb3043c7c965cc6a3db7e133
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd_nesting-05112023-yi-no-bitmap
        git checkout 0330eb928dba98c4fb3043c7c965cc6a3db7e133
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/iommu/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101827.GQMzFsQI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/iommufd/hw_pagetable.c:218:7: warning: variable 'pt_obj' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (WARN_ON(klen < 0)) {
                       ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:121:28: note: expanded from macro 'WARN_ON'
   #define WARN_ON(condition) ({                                           \
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:299:21: note: uninitialized use occurs here
           iommufd_put_object(pt_obj);
                              ^~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:218:3: note: remove the 'if' if its condition is always false
                   if (WARN_ON(klen < 0)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:191:31: note: initialize the variable 'pt_obj' to silence this warning
           struct iommufd_object *pt_obj;
                                        ^
                                         = NULL
   1 warning generated.
>> drivers/iommu/iommufd/hw_pagetable.o: warning: objtool: iommufd_hwpt_alloc() falls through to next function kzalloc()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
