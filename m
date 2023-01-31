Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74D8659
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 07:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675150244; x=1706686244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PUj3qZdVB/XzeobcS19ObUv5dsdHGtrRDT9PH4h7EA0=;
  b=iarhfw1FvDtfrEOxHKy2JZMYzTB6UUTbFNYCNfDxEhFhqdvHvqpbOXFf
   PrhjBQEWu3BQsRrjYXn+80YdJQ9ODF6mM8L24LvjEmYjZaiyOoVsZ0/DG
   G8ILt8yK45vK+Q6elttcRIytq7/UOiuUC0xSONwrpC7IGGdEPyJvyes1K
   gmHyl0ObjtW5hJm9COYKl9iEwubJkoLCu8ah+BYiJZOju+con5NdW3hyG
   PMrUkHw+lA8y1iDiEDPHq0JcLnmO8u8KxnO79hPAgLkgPZ7JJnIOkFTeO
   Ay8pJThc+RtlJ2DYxFadQrv3au5Dr/6Xf+BjWoYAzXCSJ6Z5g72D5EJym
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="329881183"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="329881183"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 23:30:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="664399700"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="664399700"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2023 23:30:41 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMl6G-0004Gc-34;
	Tue, 31 Jan 2023 07:30:40 +0000
Date: Tue, 31 Jan 2023 15:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Seth Forshee <sforshee@kernel.org>
Subject: [vfs-idmapping:b4/fs-acl-remove-generic-xattr-handlers 7/9]
 super.c:undefined reference to `reiserfs_xattr_handlers'
Message-ID: <202301311511.u49Egefl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git b4/fs-acl-remove-generic-xattr-handlers
head:   d62ca8f8268fbd7f6e1c53dff832a4a46ef7ac2c
commit: 54ded711483dcfd67961ed213a2b0719c8c66db5 [7/9] reiserfs: rework ->listxattr() implementation
config: ia64-randconfig-r023-20230129 (https://download.01.org/0day-ci/archive/20230131/202301311511.u49Egefl-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git/commit/?id=54ded711483dcfd67961ed213a2b0719c8c66db5
        git remote add vfs-idmapping https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git
        git fetch --no-tags vfs-idmapping b4/fs-acl-remove-generic-xattr-handlers
        git checkout 54ded711483dcfd67961ed213a2b0719c8c66db5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ia64-linux-ld: ia64-linux-ld: DWARF error: could not find abbrev number 76
   fs/reiserfs/super.o: in function `reiserfs_fill_super':
>> super.c:(.text+0x67c0): undefined reference to `reiserfs_xattr_handlers'
>> ia64-linux-ld: super.c:(.text+0x67d0): undefined reference to `reiserfs_xattr_handlers'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
