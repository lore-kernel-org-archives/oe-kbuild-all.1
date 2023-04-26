Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF2E111F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 02:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682474592; x=1714010592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bdcm+jxDjrfmZqMSc3piLNjsOu/2KFu6jQpyHqZ1/Zo=;
  b=kK+QrJMxdw0ay7rUYPvNg02DtkOMpHAewLm60IkExvKFOtBFX1cvdcPS
   KfkSstfIFUEqGlQ52XVcpU2H4uNJqQmedEtu0e/hBfKjqJlD9w3KmQ5yG
   Hg/E9fc4eu6en5eY4BUpmrITxSvt0QryegrVAAjiI15yMDbiPU0vg+oa/
   m7oVvh8VJS3PR1TU9SNZSEbH4gm86WZ1R7g4EUZkcc24b9Rl7gZ2j80Em
   agJASaNKpjT3S6E/AlnbnQZPaH4pvGOVRPCW805JZ784n9LZDwngHWBhU
   1JJVkobe265maqyddpWAD5XLLchK2pY4CjqKr8MBXDrTjxEAyb0gRt+MC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="335865855"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="335865855"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 19:03:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="1023405102"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="1023405102"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Apr 2023 19:03:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prUUw-000jzC-19;
	Wed, 26 Apr 2023 02:03:10 +0000
Date: Wed, 26 Apr 2023 10:02:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-component-2023-04-25-v2 15/28] ERROR: modpost:
 "snd_soc_dlc_use_cpu_as_platform"
 [sound/soc/generic/snd-soc-simple-card-utils.ko] undefined!
Message-ID: <202304260910.IaoxhIJJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-component-2023-04-25-v2
head:   edc0bca1729bdd9ce5fc87a8076a5ef08e771aee
commit: d98b3fa5d38f436ae0cf9d515a2f9402bd3e0abe [15/28] ASoC: soc-core.c: add snd_soc_dlc_use_cpu_as_platform()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230426/202304260910.IaoxhIJJ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/morimoto/linux/commit/d98b3fa5d38f436ae0cf9d515a2f9402bd3e0abe
        git remote add morimoto https://github.com/morimoto/linux
        git fetch --no-tags morimoto sound-component-2023-04-25-v2
        git checkout d98b3fa5d38f436ae0cf9d515a2f9402bd3e0abe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304260910.IaoxhIJJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "snd_soc_dlc_use_cpu_as_platform" [sound/soc/generic/snd-soc-simple-card-utils.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
