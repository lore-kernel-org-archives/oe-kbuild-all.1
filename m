Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6CA6108
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676472657; x=1708008657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xXPA4ZdR4cjxR9dv5EIJil+jj9oaLw/HVB5aoYCw5Oo=;
  b=BbcTnMFZyzF3RtP/zMmRyifgNNcI+ndz2p2VnKAW0FO4v0ryuz9oI5Bn
   X5yZDVKjb0ViQlocxaHnurkEYR1Dna8fCLJBweuu+MabRjGF4RRtQinvl
   /rY0WgCb1waXyYPKX1aurZE6AHKAZxKwevYjvtHsTnL3eXMtn+F4lz2uP
   XlH304xu0I3f1zJS77mzvao66NwLbJyk4HgsESsrb/6anEU/qL2SW+ZUI
   r+1NFuWDszV8IPnZJbYu/cIpKsF73OrTb8u9HRJIXFloDXbsPMJApfgz5
   1gRcDpPv+yNoh94hbMk0oP3YhQQedX3Wluw/8OsxzT2cNHkDU3rcBNUah
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="396065679"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="396065679"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 06:50:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="843593534"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="843593534"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Feb 2023 06:50:55 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSJ7R-0009Sp-25;
	Wed, 15 Feb 2023 14:50:49 +0000
Date: Wed, 15 Feb 2023 22:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:pptrs-online-parent-repair 72/84] listxattr.c:undefined
 reference to `xbitmap_test'
Message-ID: <202302152248.jufJghyN-lkp@intel.com>
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
commit: 211c4efb2241d80825c302ee45de35fbff1b3cb3 [72/84] xfs: create an xattr iteration function for scrub
config: loongarch-buildonly-randconfig-r001-20230213 (https://download.01.org/0day-ci/archive/20230215/202302152248.jufJghyN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=211c4efb2241d80825c302ee45de35fbff1b3cb3
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs pptrs-online-parent-repair
        git checkout 211c4efb2241d80825c302ee45de35fbff1b3cb3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302152248.jufJghyN-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: fs/xfs/scrub/listxattr.o: in function `.L34':
   listxattr.c:(.text+0x188): undefined reference to `xbitmap_set'
   loongarch64-linux-ld: fs/xfs/scrub/listxattr.o: in function `.L21':
>> listxattr.c:(.text+0x1c4): undefined reference to `xbitmap_test'
   loongarch64-linux-ld: fs/xfs/scrub/listxattr.o: in function `.L15':
   listxattr.c:(.text+0x248): undefined reference to `xbitmap_set'
   loongarch64-linux-ld: fs/xfs/scrub/listxattr.o: in function `.L14':
   listxattr.c:(.text+0x304): undefined reference to `xbitmap_set'
   loongarch64-linux-ld: fs/xfs/scrub/listxattr.o: in function `xchk_xattr_walk_node':
   listxattr.c:(.text+0x5b0): undefined reference to `xbitmap_init'
>> loongarch64-linux-ld: listxattr.c:(.text+0x614): undefined reference to `xbitmap_test'
>> loongarch64-linux-ld: listxattr.c:(.text+0x644): undefined reference to `xbitmap_set'
>> loongarch64-linux-ld: listxattr.c:(.text+0x688): undefined reference to `xbitmap_destroy'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
