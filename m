Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D7610E7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jun 2023 04:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686458450; x=1717994450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=77sBEmTZ/Z/quW/Pq+HAyg7oivDFKUgeirHC4/TUoks=;
  b=LswgMEhOPnpu2dTZD1LJfPNacySzgqsxh8nJGPlzT3jBT/4SO8YLBLRj
   RtLAuTlk8b15k6A7LkrFUJpevnqwPI5FU9pniu7B9wdzoKEpRReOfDeaM
   wqntdshSHrrjC+lbkxOEfGQZJE/eNZcXu8c60JPqc8tz87VkD8EFez0qt
   d+WMygLEVhAmXUaOHmQgrNbIgl+G6Jm4iWLlMkn70eiuIsjyuPmj2Dihc
   sbJscZeZuRTD/NS/cj9YlIoTIXULlrHU+xSGFficQ+YUsmkZUzcVrn0Qa
   +7wjW79W1WyO1cQTTj1aLOZyPQ/fd0bIC2DFao8rBGFvHzwXY93PfNdDg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="357825065"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="357825065"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 21:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="1040927675"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="1040927675"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Jun 2023 21:40:48 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8Csh-000Adg-1f;
	Sun, 11 Jun 2023 04:40:47 +0000
Date: Sun, 11 Jun 2023 12:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <simon.horman@corigine.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>
Subject: [netdev-net-next:main 26/28] ERROR: modpost: "efx_tc_netevent_event"
 [drivers/net/ethernet/sfc/sfc.ko] undefined!
Message-ID: <202306111208.EvCl14JF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
head:   e431e712c83676a8a9cd3988b323e3ef994a8ff3
commit: 7e5e7d800011adf4aeda615f8a1bc31c0c1e2bb9 [26/28] sfc: neighbour lookup for TC encap action offload
config: arc-randconfig-r002-20230611 (https://download.01.org/0day-ci/archive/20230611/202306111208.EvCl14JF-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=7e5e7d800011adf4aeda615f8a1bc31c0c1e2bb9
        git remote add netdev-net-next https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
        git fetch --no-tags netdev-net-next main
        git checkout 7e5e7d800011adf4aeda615f8a1bc31c0c1e2bb9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306111208.EvCl14JF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "efx_tc_netevent_event" [drivers/net/ethernet/sfc/sfc.ko] undefined!
>> ERROR: modpost: "efx_tc_netdev_event" [drivers/net/ethernet/sfc/sfc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
