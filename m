Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A070883E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 19:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682711369; x=1714247369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CDvDvV9LlUsbZFJcpsCSJsribAonTbKc6Uh8poGXHVU=;
  b=GmG1X/aJ5JGJHGiTZodmp0smzZgcKPjGdhfLO+DUK215lC4vHlPrL26L
   VwxEsJfmznwyylXcO2QxSK8END19M/P1+q9dcd/PifW2FyaS3uILhTsbq
   TOoyCXCiVJf+25ybRKOQymOP4aytfrvX3P1tHvLnCm1uxBmVrSH99981n
   lw3P4+eOOo3KAg8BieyA3Q1wfYQ+B/7tHYaBedNNkLN2cRJ/oil7wCv99
   pj6p+drCpaYSwH6S/I6GZgqxu+QVMEK8LXaK0flEtaqG0gqIaIFkF83lG
   Ge45Qhs26wifYIaQM7S/AyLC+LtQSDl8U8q9rpWKFCrZdV43wg5yLVWyK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="327462368"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="327462368"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 12:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="838960270"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="838960270"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2023 12:46:42 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psU3F-0000dx-1C;
	Fri, 28 Apr 2023 19:46:41 +0000
Date: Sat, 29 Apr 2023 03:46:41 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-rebased 121/187] mm/shmem.c:96:8: warning: type
 qualifiers ignored on function return type
Message-ID: <202304290311.8VGLVc90-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-rebased
head:   e8ecda1e3b7f3e01508b712df489f21260c4c9c6
commit: b9d83a7aa2d40b09c37253fa71af3e0f4654625d [121/187] shmem: 16K on 4K hack
config: microblaze-randconfig-r032-20230428 (https://download.01.org/0day-ci/archive/20230429/202304290311.8VGLVc90-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/b9d83a7aa2d40b09c37253fa71af3e0f4654625d
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/rust-rebased
        git checkout b9d83a7aa2d40b09c37253fa71af3e0f4654625d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290311.8VGLVc90-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:96:8: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
      96 | static const unsigned long shmem_base_nr(struct address_space *mapping) {
         |        ^~~~~


vim +96 mm/shmem.c

    95	
  > 96	static const unsigned long shmem_base_nr(struct address_space *mapping) {
    97		return 1L << mapping->order;
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
