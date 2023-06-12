Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E970A23406
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 21:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686606680; x=1718142680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZxzHwa2NTOZnTwOjNaBmnUfRjqPrT6SlD8MnNq5rq48=;
  b=PzXeEr6cH4DoiQ4WSM90EdmoC1ozBs880kgwnizv25z9JtmjJyn5+QD/
   SncbpPfVCWWLEcUPRDg1kF9xkBM+o7E+OOdmioEZRbViQ/nXEcGuqxjWP
   1AYiUbov0INyD9+FnE91y2UCKFjFhU1gzPfVsQxXKZfQYAxQSN+YHjKlc
   OfowE36bsrH5mMKqxfjHNz3IbJ3jXKstygAaQuOsoD5iNCO9+gMS7RuNY
   NtnJU3vJWqGCghLpaz7p52eV1SO4+z1lHPYAyIgIOtWHFe2M/L3fpiiG7
   yDAfkwBH6UZVa1ACxgwYEDb0MOr/cdH1qXHoRKJKhzFvF5CrIS4E5hwog
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="386560083"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="386560083"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 14:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="711380777"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="711380777"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Jun 2023 14:51:17 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8pRU-0000m6-1a;
	Mon, 12 Jun 2023 21:51:16 +0000
Date: Tue, 13 Jun 2023 05:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sarath Babu Naidu Gaddam <sarath.babu.naidu.gaddam@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 3/3] ERROR: modpost:
 "xilinx_vdma_channel_set_config"
 [drivers/net/ethernet/xilinx/xilinx_emac.ko] undefined!
Message-ID: <202306130512.gVDkAht2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   008dab8f0109b0f762a72a01e3ffa8a334ec447b
commit: 008dab8f0109b0f762a72a01e3ffa8a334ec447b [3/3] net: axienet: Introduce dmaengine support
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230613/202306130512.gVDkAht2-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/008dab8f0109b0f762a72a01e3ffa8a334ec447b
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx lkp_test
        git checkout 008dab8f0109b0f762a72a01e3ffa8a334ec447b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130512.gVDkAht2-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "xilinx_vdma_channel_set_config" [drivers/net/ethernet/xilinx/xilinx_emac.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
