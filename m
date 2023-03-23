Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABC320E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 06:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679551456; x=1711087456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lTRLSEdFGde9x79abhgER+3tHOwEFQ63JzOZiJfa8H0=;
  b=E6dt2XRekk9Nm9iPt3vFcacHg9KCSZA9nlyX8j3BDeOMhp1tiK7VDkIQ
   P9NUCTaWtgmIJ/Huud47RBF6YKt27GPq/hKxEwELQXW5UJjnN5n+FyUt2
   7t3B46TPyP7aElKM4IqSRyb0KvXqPjO39rmCPVO3zydKn33XOQSeeIl9E
   ikbPJkGOdUuEDn2/QFXhzgCUGZc7CTBPoEazI26+FZfMuTUaNkdIoMO8r
   iS+3RiLkeeVtRrzu79Bqoc91hUMqeHIpIJIVYX8P400/tjawQ7LJ0Yjeg
   Ab7qPzjQbiL+yYrtQJI2mYmEKVTRTPxUVLiRO5DO3cv4K3K1vu7lcKw7c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319056593"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="319056593"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 23:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="714674251"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="714674251"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Mar 2023 23:04:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfE3X-000E1o-2H;
	Thu, 23 Mar 2023 06:04:11 +0000
Date: Thu, 23 Mar 2023 14:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/fsfa3 17/17] loongarch64-linux-gcc: error:
 unrecognized command-line option '-fstrict-flex-arrays=3'
Message-ID: <202303231323.YNz4H0a3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/fsfa3
head:   0866a2ea45cdf26bbee3f4b1bd9a840c74de54e3
commit: 0866a2ea45cdf26bbee3f4b1bd9a840c74de54e3 [17/17] Makefile: Enable -Wstringop-overflow and -Warray-bounds and -fstrict-flex-arrays=3
config: loongarch-randconfig-r021-20230322 (https://download.01.org/0day-ci/archive/20230323/202303231323.YNz4H0a3-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commit/?id=0866a2ea45cdf26bbee3f4b1bd9a840c74de54e3
        git remote add gustavoars https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git
        git fetch --no-tags gustavoars testing/fsfa3
        git checkout 0866a2ea45cdf26bbee3f4b1bd9a840c74de54e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231323.YNz4H0a3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> loongarch64-linux-gcc: error: unrecognized command-line option '-fstrict-flex-arrays=3'
   make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1
>> loongarch64-linux-gcc: error: unrecognized command-line option '-fstrict-flex-arrays=3'
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1288: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
