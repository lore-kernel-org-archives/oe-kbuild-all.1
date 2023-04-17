Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F4E1847
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Apr 2023 04:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681704875; x=1713240875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+j7T8KEb0ekRITWFFW+49IFlzd0ihGDlKtDs8VHzGw8=;
  b=JVNe07Tv/oBRrs5hf1Jg5iiNiZb5x5vSD25G77WiYKef1ww42E9zJ7Xi
   4qrPylJ2+B1lFk5y719uLhn0OzhGIsBIktolwiw3FyQMuaGF2DIitwK4O
   990THv3ry8+dUDknJDODGjjXtZrdHU0bb1K1xGOhZ7uWXDcu285ZA8F60
   t0Hv9JYjQ3TNwx7KVaHwWMjlZLgL4J7rLXf6xu/ZpnFbG5lxf3J/mo8pq
   ICINKwwsKVFIWxInhg8F2pZJk1IGlbXevr13yfj3sQvb/2Hwmsmy2OrPi
   8UodwCxZ4AYnpxFF2w4iPB55VStdRFcpcCYAsuqsL++tFPi8PDqOao0La
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="347534649"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="347534649"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 21:14:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="684014864"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="684014864"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Apr 2023 21:14:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poGG8-000c75-2S;
	Mon, 17 Apr 2023 04:14:32 +0000
Date: Mon, 17 Apr 2023 12:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:for-6.4/block 72/80] lib/fault-inject.c:433: undefined
 reference to `config_group_init_type_name'
Message-ID: <202304171225.hKEjCew1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.4/block
head:   26a42b614eb934f400cd3d1cc0b7fa1955ae3320
commit: 4668c7a2940d134bea50058e138591b97485c5da [72/80] fault-inject: allow configuration via configfs
config: powerpc-randconfig-r034-20230417 (https://download.01.org/0day-ci/archive/20230417/202304171225.hKEjCew1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=4668c7a2940d134bea50058e138591b97485c5da
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block for-6.4/block
        git checkout 4668c7a2940d134bea50058e138591b97485c5da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304171225.hKEjCew1-lkp@intel.com/

Note: the axboe-block/for-6.4/block HEAD 26a42b614eb934f400cd3d1cc0b7fa1955ae3320 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   powerpc-linux-ld: lib/fault-inject.o: in function `fault_config_init':
>> lib/fault-inject.c:433: undefined reference to `config_group_init_type_name'


vim +433 lib/fault-inject.c

   430	
   431	void fault_config_init(struct fault_config *config, const char *name)
   432	{
 > 433		config_group_init_type_name(&config->group, name, &fault_config_type);
   434	}
   435	EXPORT_SYMBOL_GPL(fault_config_init);
   436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
