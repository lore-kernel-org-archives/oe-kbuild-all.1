Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222DD17C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 10:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685097550; x=1716633550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IjuPU7GQbObvEXU8KLSmWapvtbP3H8Sx59dzOaJ2kwM=;
  b=YoMCJ4s/7fxmbmbD4kRxx8utIvziOACCoCwTHdkmmvoNuZOUueDmlSBg
   xsxsCxDqbl4xxPyiGBAkiS6XJVtB9B3zySezyJ+SiOfFdwqwp7WaEAOpP
   ZKSK7akzbOhO4+pDbx1LaS7W1NAwhEk5xxDsyYAfpE+yJ753jED0F4DdF
   kIKO9IHjcXyPVFtbGvjat3teci0DL1U2j0XB49ZSIwz4+DxHUhXV+hyO6
   uYaYoHgeU3VbEejTu0lajvl/H/S7dH+X5NFFAg79R5FKsg5QBl7GcQlqT
   mOvYNFvRBIFh9L7QopXo665pPpv9qd3LY/9g4/wEDa8fN3b1+bMnR+Cqd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="343669020"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="343669020"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 03:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="735954030"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="735954030"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 May 2023 03:38:26 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2Uq1-000JFb-2u;
	Fri, 26 May 2023 10:38:25 +0000
Date: Fri, 26 May 2023 18:37:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-20230525 6/31] fops.c:undefined reference
 to `iomap_file_buffered_write'
Message-ID: <202305261804.xEnDm3bm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230525
head:   1e9b17615c8ad5829f88f54de36523f291a145cc
commit: 1c054f288031a44c5b7d174d51f4889dfd755d17 [6/31] block: use iomap for writes to block devices
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20230526/202305261804.xEnDm3bm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=1c054f288031a44c5b7d174d51f4889dfd755d17
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next large-block-20230525
        git checkout 1c054f288031a44c5b7d174d51f4889dfd755d17
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261804.xEnDm3bm-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: block/fops.o: in function `.L272':
>> fops.c:(.text+0x11d4): undefined reference to `iomap_file_buffered_write'
   loongarch64-linux-ld: block/fops.o: in function `.L266':
   fops.c:(.text+0x121c): undefined reference to `iomap_file_buffered_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
