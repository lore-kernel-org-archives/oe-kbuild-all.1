Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E781117C7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 03:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682652081; x=1714188081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z+iaNz7W+pV890AvlbwjKhMzXKjAsRA5/nLxHO0dakk=;
  b=YRkKZZDZPnVRZ3D33oSZ8QBKMOfDCKaHp8Z97jrt+hdVXqcm3uKx1uiB
   +Gf30fYEVJbwaXTU1qL85GVa1pMgIknOPJ//gWMj3oqyQCQdUaLNtr544
   yv45IEUIWOyCOTcI0/wduFtDqBFJ1jWu+0KZ0wy6TNNvpnTz+CqrMCN2R
   2ncRQ5TG2qqyGC2eZpfzxWrrLOnL8tbbstIUFsiCJif1IwX7/nkRW7727
   3zK9kpt6DKD2gShi396V3wXLDBgpo0t+oJXenJXj3RMgHBmLtaPl1R0UI
   Zs0m9BZGxYy24c46ymV5BtpP8A9B0zdXOd24hIFFziOsQnFZkX2jrtZHl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="331941793"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="331941793"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 20:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="694658192"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="694658192"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Apr 2023 20:21:16 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psEfc-00004F-0o;
	Fri, 28 Apr 2023 03:21:16 +0000
Date: Fri, 28 Apr 2023 11:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 287/382] ERROR: modpost:
 "phy_mipi_dphy_get_default_config_for_hsclk"
 [drivers/media/platform/cadence/cdns-csi2rx.ko] undefined!
Message-ID: <202304281127.Sj0eNIpR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   d0673ae878bb78807f65a6021cd9642d6d45bb93
commit: f892c1ab1a9175a9d59ecd6e62654014937e72a5 [287/382] media: cadence: csi2rx: Add external DPHY support
config: hexagon-randconfig-r014-20230428 (https://download.01.org/0day-ci/archive/20230428/202304281127.Sj0eNIpR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout f892c1ab1a9175a9d59ecd6e62654014937e72a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281127.Sj0eNIpR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "phy_mipi_dphy_get_default_config_for_hsclk" [drivers/media/platform/cadence/cdns-csi2rx.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
