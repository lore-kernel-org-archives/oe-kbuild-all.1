Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC14833F5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 11:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680868186; x=1712404186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0WykBZZ94h8+Pbn4GhI1o1WxSd0wl/nI0SaNYYyA0vM=;
  b=E9f6cK9C5d7vH8f1j0CIdOd8z4OBI12WyKMMAJCePvebj38Yjo2LRy87
   +Wmh2bfjdXj7b6psh5090p1upm9cZtL4M1RAuLETXQvkNuwt4xit7EMqW
   4Iiom0bmDY0yvYHiuTcoOr7aSA7tyjcTXc6XcI6YfbsLgx/N+Y/CRFoaF
   wFGwxWhZeMj2VoZAy25+SCThKqpT3pUO6fhvvWt0JBWc5VvFNpoSHZuOo
   JmYIkXze3UodcAYgDTFSYuE4Ej1chQq51v9Doa2+bVm2466k6Sd4ggAbP
   Ew1G1XiaVv+n7l9wOAinryKKlIkiHy1QN5dK6leEZJfD9XQuLc1noNaTC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="405789922"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="405789922"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 04:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="831162404"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="831162404"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2023 04:49:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkkb9-000SS2-0o;
	Fri, 07 Apr 2023 11:49:43 +0000
Date: Fri, 7 Apr 2023 19:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.1.y 90/90] make[4]: *** No rule to make target
 'drivers/char/rk3568-gpiomem.o', needed by 'drivers/char/built-in.a'.
Message-ID: <202304071924.DePkPBTG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steve,

First bad commit (maybe != root cause):

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   3a163dc2f239e1dbfed4cdb9ee515ef542684d1f
commit: 3a163dc2f239e1dbfed4cdb9ee515ef542684d1f [90/90] ODROID-M1: Add /dev/gpiomem device
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230407/202304071924.DePkPBTG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/tobetter/linux/commit/3a163dc2f239e1dbfed4cdb9ee515ef542684d1f
        git remote add tobetter https://github.com/tobetter/linux
        git fetch --no-tags tobetter odroid-6.1.y
        git checkout 3a163dc2f239e1dbfed4cdb9ee515ef542684d1f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304071924.DePkPBTG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'drivers/char/rk3568-gpiomem.o', needed by 'drivers/char/built-in.a'.
   make[4]: Target 'drivers/char/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
