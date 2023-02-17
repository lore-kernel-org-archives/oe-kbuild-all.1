Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F390376
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 02:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676602018; x=1708138018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NR/BFJoLBLite0GY3BiABSyqHeGpiY7yAkqqguQDFCc=;
  b=jMfwPChaUzDw+aIWR5MmP1ZZPidai7LIjnftkmWx2ZG/MzZN/+GF3Bth
   zkOFps5+hOLTQ6R20BFQCV4AQhVEFUjfWQB6YA+wYrlvnyYA4XSzUG8HV
   IG6P5x63U7ao+5DRN3FRIWlM7cjdokP7i7M730NVUKkN0ApyXn2Jg6wUi
   Ln3ZzIVq2DpxJrEEY8SNojbmy6fRzBVjD5POflfkLccqRDg9copMayaum
   BwNVt7OFRiv2U5xunmI/TiIhM7z1TKGj6ubrlAAxyctq6ABhjmed1uaWZ
   fTKniQlnF5Ov1Hm3KtIpukf75vpaVNOVtR7hb1Kz0I6bAVfeTHqA+vDep
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333255617"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="333255617"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 18:46:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="999305971"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="999305971"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 16 Feb 2023 18:46:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSqm0-000B3d-0s;
	Fri, 17 Feb 2023 02:46:56 +0000
Date: Fri, 17 Feb 2023 10:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.2-rc7-net-next-ethtool-eee-v3 13/21] ERROR: modpost:
 "phy_eee_clk_stop_enable"
 [drivers/net/ethernet/samsung/sxgbe/samsung-sxgbe.ko] undefined!
Message-ID: <202302171027.zmJmUc9C-lkp@intel.com>
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
commit: 68d8417bf5faf6a826b7197648fc7f49e0641cec [13/21] net: sxgdb: Fixup EEE
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230217/202302171027.zmJmUc9C-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/68d8417bf5faf6a826b7197648fc7f49e0641cec
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.2-rc7-net-next-ethtool-eee-v3
        git checkout 68d8417bf5faf6a826b7197648fc7f49e0641cec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302171027.zmJmUc9C-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "phy_eee_clk_stop_enable" [drivers/net/ethernet/samsung/sxgbe/samsung-sxgbe.ko] undefined!
ERROR: modpost: "phy_eee_clk_stop_enable" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
