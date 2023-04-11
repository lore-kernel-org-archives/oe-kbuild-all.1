Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD4A8F4D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 16:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681229518; x=1712765518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yEiqQNs/vmI3Sygxu5HasRX8D6La1NiQ9OSNHH56wDQ=;
  b=MM7MHHIXzq6Nykyjh5lxhUdF6jrsKC+oZ6eM/1ebKKlBUVWpaOqAC7h+
   UVw1/e9vV7uV89CFMGKcN8KAMUiSZXEFz9qxYumNMgeo7gCbuE9IMuh01
   1+sH3mvPQUeVVQQdRLSAMD8NtkJLQCIwAxgU4uYhJtVOASJDSSIB/x9vB
   AeTJ8mIBGlwmc+v986ZvA60r0SiwcinHzeOu6c1Ctfb5oKNRJDILSAev9
   FKrzciWCjHy8UEmzZbCHrjsVnBL+e1scqRe7Abc0UKRuLaMXT89QRWY7G
   5fbRDikxKNOLGSbCmrasMLwqK/A1PDGWXB5QFKUyI8BC4jIqmY2gJWVfI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="343669296"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="343669296"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 09:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="691210000"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="691210000"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Apr 2023 09:10:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmGZT-000WST-26;
	Tue, 11 Apr 2023 16:10:15 +0000
Date: Wed, 12 Apr 2023 00:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>,
	linux-erofs@lists.ozlabs.org
Subject: [xiang-erofs:dev-test 17/17] inode.c:undefined reference to
 `z_erofs_aops'
Message-ID: <202304120041.dKiP6YdV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
head:   64be79d41fc0aefc57b4127f949e9995e739398e
commit: 64be79d41fc0aefc57b4127f949e9995e739398e [17/17] erofs: get rid of z_erofs_fill_inode()
config: m68k-randconfig-r021-20230410 (https://download.01.org/0day-ci/archive/20230412/202304120041.dKiP6YdV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git/commit/?id=64be79d41fc0aefc57b4127f949e9995e739398e
        git remote add xiang-erofs https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git
        git fetch --no-tags xiang-erofs dev-test
        git checkout 64be79d41fc0aefc57b4127f949e9995e739398e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304120041.dKiP6YdV-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: fs/erofs/inode.o: in function `erofs_fill_inode':
>> inode.c:(.text+0x9be): undefined reference to `z_erofs_aops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
