Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DB47ED
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 06:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680762822; x=1712298822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=74syxOw8DTjKaCFlWKvbH7aLiDeRxut6tbnvi1jskZE=;
  b=MWvpV8PXBH3FRJdlZQ3h/UR+USLJH77wrH+rDC0IFbS2U1FvfATMWN5R
   yUzQ7pGEEQZW6aivpOhY3/sMYXS/qJgjFWH6bh70mjbrkZSjFLiiP3Njj
   fgUMTcOf57XOA6xAaSe3he2q/JKP7Vvw71mkOJxo0PUscHRRxgwhBr0h2
   bfR7U68bROjySrNdqCF7br+ic1XrZgVhZsowWTsVV/ycZA4T8Kn0CCcWI
   kNPGkq3Dmcym0RHpUvrh+99QgNcsm92hJj4pZFpq144yoeu7MouJ97yPZ
   gOxWaLkGftqGqFGaeFpDyORyU9JglBa+KzjW3fIzd2fehInjurXWKYwBR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322303561"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="322303561"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 23:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="798208191"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="798208191"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Apr 2023 23:33:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkJBk-000R7u-15;
	Thu, 06 Apr 2023 06:33:40 +0000
Date: Thu, 6 Apr 2023 14:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230404-module-alloc-opts-v2 39/41] powerpc-linux-ld:
 stats.c:undefined reference to `__udivdi3'
Message-ID: <202304061446.YUxFMW1b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230404-module-alloc-opts-v2
head:   95fd5294d0e19a463b9f303638481eeb16ea0cff
commit: 25ef6ee28d33cbad22e4a68b6d39094fceae6dda [39/41] module: add debug stats to help identify memory pressure
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230406/202304061446.YUxFMW1b-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=25ef6ee28d33cbad22e4a68b6d39094fceae6dda
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230404-module-alloc-opts-v2
        git checkout 25ef6ee28d33cbad22e4a68b6d39094fceae6dda
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304061446.YUxFMW1b-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: kernel/module/stats.o: in function `read_file_mod_stats':
   stats.c:(.text+0x370): undefined reference to `__udivdi3'
>> powerpc-linux-ld: stats.c:(.text+0x3e8): undefined reference to `__udivdi3'
   powerpc-linux-ld: stats.c:(.text+0x47c): undefined reference to `__udivdi3'
   powerpc-linux-ld: stats.c:(.text+0x514): undefined reference to `__udivdi3'
   powerpc-linux-ld: stats.c:(.text+0x5ac): undefined reference to `__udivdi3'
   powerpc-linux-ld: kernel/module/stats.o:stats.c:(.text+0x644): more undefined references to `__udivdi3' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
