Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8694D7B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 18:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676485621; x=1708021621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BpYwEck1Ccoc12Iuw1GT9H2bkKU48l9m9cnB5/F+uh4=;
  b=VBjzpbdyPeIMebPe2k1rzdBYofKTIulzOJ2O4qq/0aXu+anjpAMlCNNl
   bHM8seJ71y1aAQoQXPljvuN47YoVMu18OXNV+b1EBBVE2zp5TaxYPHgWq
   nbvXbP5uB6NsT2GnZX1tisY/HXNJU7EwX7pEPGahv22cegA1sCuBPT0OB
   CWATfBuqIADEaHIYsjXSUKz2tKpyUWAeEIW5Nc4EYSg5wqrjj3FGocrVY
   mjVzYgkREH/6cy5TQu5nnmFkG7OI+jNXk8pd6xS1c0Uc2yWHCOTAOhYXP
   qeEJ7iKgnb6PlzVFALXJoInIX/lSyahgvTSrwhK5CzcRO+Wtr+WnV9SEz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="319549555"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="319549555"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 10:27:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="700105214"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="700105214"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Feb 2023 10:27:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSMUd-0009fM-0c;
	Wed, 15 Feb 2023 18:26:59 +0000
Date: Thu, 16 Feb 2023 02:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:pptrs-online-parent-repair 81/84] arceb-elf-ld:
 parent.c:undefined reference to `xfblob_store'
Message-ID: <202302160251.D6l9Ane3-lkp@intel.com>
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
config: arc-randconfig-r031-20230212 (https://download.01.org/0day-ci/archive/20230216/202302160251.D6l9Ane3-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=38b7897f888103dc3bbcbe748590dd3dca5f78f2
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs pptrs-online-parent-repair
        git checkout 38b7897f888103dc3bbcbe748590dd3dca5f78f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302160251.D6l9Ane3-lkp@intel.com/

All errors (new ones prefixed by >>):

   arceb-elf-ld: arceb-elf-ld: DWARF error: could not find abbrev number 39
   fs/xfs/scrub/listxattr.o: in function `xchk_xattr_find_leftmost_leaf':
   listxattr.c:(.text+0xfe): undefined reference to `xbitmap_set'
   arceb-elf-ld: listxattr.c:(.text+0xfe): undefined reference to `xbitmap_set'
   arceb-elf-ld: listxattr.c:(.text+0x124): undefined reference to `xbitmap_test'
   arceb-elf-ld: listxattr.c:(.text+0x124): undefined reference to `xbitmap_test'
   arceb-elf-ld: listxattr.c:(.text+0x15e): undefined reference to `xbitmap_set'
   arceb-elf-ld: listxattr.c:(.text+0x15e): undefined reference to `xbitmap_set'
   arceb-elf-ld: fs/xfs/scrub/listxattr.o: in function `xchk_xattr_walk_node':
   listxattr.c:(.text+0x2bc): undefined reference to `xbitmap_init'
   arceb-elf-ld: listxattr.c:(.text+0x2bc): undefined reference to `xbitmap_init'
   arceb-elf-ld: listxattr.c:(.text+0x314): undefined reference to `xbitmap_test'
   arceb-elf-ld: listxattr.c:(.text+0x314): undefined reference to `xbitmap_test'
   arceb-elf-ld: listxattr.c:(.text+0x338): undefined reference to `xbitmap_set'
   arceb-elf-ld: listxattr.c:(.text+0x338): undefined reference to `xbitmap_set'
   arceb-elf-ld: listxattr.c:(.text+0x34c): undefined reference to `xbitmap_destroy'
   arceb-elf-ld: listxattr.c:(.text+0x34c): undefined reference to `xbitmap_destroy'
   arceb-elf-ld: arceb-elf-ld: DWARF error: could not find abbrev number 67
   fs/xfs/scrub/parent.o: in function `xchk_parent_scan_attr':
   parent.c:(.text+0x400): undefined reference to `xfblob_store'
>> arceb-elf-ld: parent.c:(.text+0x400): undefined reference to `xfblob_store'
   arceb-elf-ld: fs/xfs/scrub/parent.o: in function `xchk_parent_slow_pptr':
   parent.c:(.text+0x754): undefined reference to `xfblob_load'
>> arceb-elf-ld: parent.c:(.text+0x754): undefined reference to `xfblob_load'
   arceb-elf-ld: fs/xfs/scrub/parent.o: in function `xchk_parent_finish_slow_pptrs':
   parent.c:(.text+0x8ba): undefined reference to `xfblob_truncate'
>> arceb-elf-ld: parent.c:(.text+0x8ba): undefined reference to `xfblob_truncate'
   arceb-elf-ld: fs/xfs/scrub/parent.o: in function `xchk_parent_pptr':
   parent.c:(.text+0x95e): undefined reference to `xfblob_create'
>> arceb-elf-ld: parent.c:(.text+0x95e): undefined reference to `xfblob_create'
>> arceb-elf-ld: parent.c:(.text+0x994): undefined reference to `xfblob_destroy'
>> arceb-elf-ld: parent.c:(.text+0x994): undefined reference to `xfblob_destroy'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
