Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8D233E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 21:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676584428; x=1708120428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YUbT+xxneuAF02DbZVfC5cH8eobmoQhiBdzjPV4zhis=;
  b=bA6kqyous340G14EaJGMCc0KESIU3/TJVdTvtjlb38kFcNThosqltxWi
   GathIDfXyhrczURA5wuW1g057LfIN0YFW6T9Lw7SINX59iiUTsXPunMvB
   ntu6biLK8SMZGSitI9YPz7SbYNAOyo1hxZMbHKAH/NZ0TaNglm/XYs4mP
   4ULnReN/Im9u5uW1CWBHtu08ptHq+AhJX2q/s3AmBYSG/6jtP65tngjFW
   CHwg8iEZuruUQzKAuZKqocOf3u2Iye9fx8Qtjy5VyPlhO2NUZLTJ9rJw1
   pWLjfqpjbF0L3bEDfHJOgCY/5//lRMNqYsRbP/4dSEHeTcyYBLxIG+RZY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="319946588"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="319946588"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 13:53:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="739010824"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="739010824"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Feb 2023 13:53:47 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSmCI-000Arl-1n;
	Thu, 16 Feb 2023 21:53:46 +0000
Date: Fri, 17 Feb 2023 05:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.2-rc7-net-next-ethtool-eee-v3 7/21] ERROR: modpost:
 "phy_eee_clk_stop_enable" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko]
 undefined!
Message-ID: <202302170557.oFybDhQd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.2-rc7-net-next-ethtool-eee-v3
head:   9c8e8957f38659b7c61168de1a6a742000b75e64
commit: 9d09b574e5f5842487f05ec340786d631d1aff2f [7/21] net: stmmac: Drop usage of phy_init_eee()
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230217/202302170557.oFybDhQd-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/9d09b574e5f5842487f05ec340786d631d1aff2f
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.2-rc7-net-next-ethtool-eee-v3
        git checkout 9d09b574e5f5842487f05ec340786d631d1aff2f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170557.oFybDhQd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "phy_eee_clk_stop_enable" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
