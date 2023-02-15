Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4317B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 17:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676483159; x=1708019159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dw2+oK+CUqpJDgYL6Jo7PELE9WLjlEusltFBXD9esP4=;
  b=iOVgL55UgJ7wmCaGB6hIwz1RGk5XoOqlUxVp+Geu+5zSVOyADM7S1V21
   tFT+RDJRawwyKh3YfbmVV6cQYXQTu38P1y+W513BJzmSolKKsaCRA/pCD
   TT7BL6iEPbuGC6IQtNkNnKU46eFMlK0XDhWrXT4IdSj9my/Qxrir76bJL
   0bzPvXwAITu3sc4asMY1ZJfdSAwzqYauDrKnuKfNZNb6DmDJDEOzwIcE/
   n5lrhiO0onvU3yhNG/6qykZf1ddAKw1UB349R8QPzLB3bHLJLordq+DBh
   4W7C3ztJ+zw/bjb4vPlaKw37ibXOs+ZJF/ydj9tvDwJ0Mmp0mEF894kNf
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="393897383"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="393897383"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 09:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="700085860"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="700085860"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Feb 2023 09:45:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSLqu-0009c1-1q;
	Wed, 15 Feb 2023 17:45:56 +0000
Date: Thu, 16 Feb 2023 01:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:pptrs-online-parent-repair 81/84] parent.c:undefined
 reference to `xfblob_store'
Message-ID: <202302160145.YOkonzsF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git pptrs-online-parent-repair
head:   3d6a7fbcc79ebb1a96479c8b10d26de1c3591f36
commit: 38b7897f888103dc3bbcbe748590dd3dca5f78f2 [81/84] xfs: deferred scrub of parent pointers
config: loongarch-buildonly-randconfig-r001-20230213 (https://download.01.org/0day-ci/archive/20230216/202302160145.YOkonzsF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=38b7897f888103dc3bbcbe748590dd3dca5f78f2
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs pptrs-online-parent-repair
        git checkout 38b7897f888103dc3bbcbe748590dd3dca5f78f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302160145.YOkonzsF-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: fs/xfs/scrub/listxattr.o: in function `.L34':
   listxattr.c:(.text+0x188): undefined reference to `xbitmap_set'
   loongarch64-linux-ld: fs/xfs/scrub/listxattr.o: in function `.L21':
   listxattr.c:(.text+0x1c4): undefined reference to `xbitmap_test'
   loongarch64-linux-ld: fs/xfs/scrub/listxattr.o: in function `.L15':
   listxattr.c:(.text+0x248): undefined reference to `xbitmap_set'
   loongarch64-linux-ld: fs/xfs/scrub/listxattr.o: in function `.L14':
   listxattr.c:(.text+0x304): undefined reference to `xbitmap_set'
   loongarch64-linux-ld: fs/xfs/scrub/listxattr.o: in function `xchk_xattr_walk_node':
   listxattr.c:(.text+0x5b0): undefined reference to `xbitmap_init'
   loongarch64-linux-ld: listxattr.c:(.text+0x614): undefined reference to `xbitmap_test'
   loongarch64-linux-ld: listxattr.c:(.text+0x644): undefined reference to `xbitmap_set'
   loongarch64-linux-ld: listxattr.c:(.text+0x688): undefined reference to `xbitmap_destroy'
   loongarch64-linux-ld: fs/xfs/scrub/parent.o: in function `.L81':
>> parent.c:(.text+0x6ec): undefined reference to `xfblob_store'
   loongarch64-linux-ld: fs/xfs/scrub/parent.o: in function `xchk_parent_slow_pptr':
>> parent.c:(.text+0x804): undefined reference to `xfblob_load'
   loongarch64-linux-ld: fs/xfs/scrub/parent.o: in function `.L124':
>> parent.c:(.text+0xa74): undefined reference to `xfblob_truncate'
   loongarch64-linux-ld: fs/xfs/scrub/parent.o: in function `.L139':
>> parent.c:(.text+0xb64): undefined reference to `xfblob_create'
   loongarch64-linux-ld: fs/xfs/scrub/parent.o: in function `.L135':
>> parent.c:(.text+0xba8): undefined reference to `xfblob_destroy'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
