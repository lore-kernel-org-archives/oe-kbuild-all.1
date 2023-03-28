Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D8AA21
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 03:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679974613; x=1711510613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j5hmjjyKk5Psz1U4nuya4ZEXu6xtodg5+e6026qUC0c=;
  b=ACHcw3lum1ln2MkXQWzcK7L0yUgmyD6P0C2/nzljwq22+EJSq9+LoWi5
   fdo5bYa++Ww3uDH+FpllvePDwC7OVx2rXKKtqysL/4alxmUATj86ja/jy
   S+Jn4+oJVX3OlGWb0Sg6PkckZHSctqw9xcRtAl4Xy+BO1V/jaFJuYwKR7
   u1p0fZpAiHIZm8dtn7RsRV9hBwPwJRwjopq90wri6xrbs8Dsd6Sx425WS
   OtyKBzt9rS18Km+ge0ps/mcdYi+gA+o1we/GQtWL0fV4qL1KbFFbi+UB2
   /y9+Cwstif/fICWSQ5fw6ZD6eGcAZ0XtsUZTfV/CvzhUQ+7a4UlgKjvOm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="320861203"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="320861203"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 20:36:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="807715325"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="807715325"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Mar 2023 20:36:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph08c-000IFb-1y;
	Tue, 28 Mar 2023 03:36:46 +0000
Date: Tue, 28 Mar 2023 11:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, Wei Fang <wei.fang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>, Amit Cohen <amcohen@nvidia.com>,
	Gal Pressman <gal@nvidia.com>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next v2 4/8] ethtool: eee: Rework get/set handler for
 SmartEEE-capable PHYs with non-EEE MACs
Message-ID: <202303281117.3288i7kT-lkp@intel.com>
References: <20230327142202.3754446-5-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327142202.3754446-5-o.rempel@pengutronix.de>

Hi Oleksij,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksij-Rempel/net-phy-Add-driver-specific-get-set_eee-support-for-non-standard-PHYs/20230327-222630
patch link:    https://lore.kernel.org/r/20230327142202.3754446-5-o.rempel%40pengutronix.de
patch subject: [PATCH net-next v2 4/8] ethtool: eee: Rework get/set handler for SmartEEE-capable PHYs with non-EEE MACs
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230328/202303281117.3288i7kT-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fcee3230c8abb824746744ba0fc39dfd626faa65
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oleksij-Rempel/net-phy-Add-driver-specific-get-set_eee-support-for-non-standard-PHYs/20230327-222630
        git checkout fcee3230c8abb824746744ba0fc39dfd626faa65
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303281117.3288i7kT-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: net/ethtool/common.o: in function `__ethtool_get_eee':
   common.c:(.text+0x45c): undefined reference to `phy_ethtool_get_eee'
   csky-linux-ld: net/ethtool/common.o: in function `__ethtool_set_eee':
   common.c:(.text+0x49c): undefined reference to `phy_ethtool_set_eee'
>> csky-linux-ld: common.c:(.text+0x4b8): undefined reference to `phy_ethtool_get_eee'
>> csky-linux-ld: common.c:(.text+0x4bc): undefined reference to `phy_ethtool_set_eee'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
