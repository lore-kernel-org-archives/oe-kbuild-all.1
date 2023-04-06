Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BFAAD47
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 20:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680811519; x=1712347519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0jJFX+NxxD3y63NdjFHfumRNUKace3N+dcy0eSlMoyU=;
  b=lAmDBNviYyiJDPG2rBlqGM42NWjZK4zydsYYb/wbS3outsyn9EugTQ9M
   bJfEoA0jfp0tBrF2ZcX6qmXk6oowm8y02WCkJs8qFpYP1brTj5AU+7Yms
   VuPp1iY4A77+ihIKMkZQn5KKbCUCYpmNe+9d9VNqmc1lQJJfNvJgQa7C6
   cjKF3EIr+IAOjf0JExz1EeuE8R1ai5Ea9otVBfBPvcEBhKvbogDhY7nv1
   UwZ8VuPXqOCh38zJjjyjGy0ReXiLHj+2UbxtdP5SvPLJdsCmoF253mQTX
   M3S5/KP4hWC77XOuXA1zf46tIh8pbt8yzdhZ8Iz3jmq98IuOM9ud+eZ7o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="407953715"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="407953715"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 13:05:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="687265844"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="687265844"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Apr 2023 13:05:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkVr2-000RiE-0I;
	Thu, 06 Apr 2023 20:05:08 +0000
Date: Fri, 7 Apr 2023 04:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC v4 4/5] net: Let the active time stamping
 layer be selectable.
Message-ID: <202304070311.WGdYV3gx-lkp@intel.com>
References: <20230406173308.401924-5-kory.maincent@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230406173308.401924-5-kory.maincent@bootlin.com>

Hi Köry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/K-ry-Maincent/net-ethtool-Refactor-identical-get_ts_info-implementations/20230407-013517
patch link:    https://lore.kernel.org/r/20230406173308.401924-5-kory.maincent%40bootlin.com
patch subject: [PATCH net-next RFC v4 4/5] net: Let the active time stamping layer be selectable.
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230407/202304070311.WGdYV3gx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/33059abec2b9e9f064c3a8ac681fc91bf857d888
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review K-ry-Maincent/net-ethtool-Refactor-identical-get_ts_info-implementations/20230407-013517
        git checkout 33059abec2b9e9f064c3a8ac681fc91bf857d888
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070311.WGdYV3gx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phy_device.c:1414: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * A whitelist for PHYs selected as default timesetamping.


vim +1414 drivers/net/phy/phy_device.c

  1412	
  1413	/**
> 1414	 * A whitelist for PHYs selected as default timesetamping.
  1415	 * Its use is to keep compatibility with old PTP API which is selecting
  1416	 * these PHYs as default timestamping.
  1417	 * The new API is selecting the MAC as default timestamping.
  1418	 */
  1419	const char * const phy_timestamping_whitelist[] = {
  1420		"Broadcom BCM5411",
  1421		"Broadcom BCM5421",
  1422		"Broadcom BCM54210E",
  1423		"Broadcom BCM5461",
  1424		"Broadcom BCM54612E",
  1425		"Broadcom BCM5464",
  1426		"Broadcom BCM5481",
  1427		"Broadcom BCM54810",
  1428		"Broadcom BCM54811",
  1429		"Broadcom BCM5482",
  1430		"Broadcom BCM50610",
  1431		"Broadcom BCM50610M",
  1432		"Broadcom BCM57780",
  1433		"Broadcom BCM5395",
  1434		"Broadcom BCM53125",
  1435		"Broadcom BCM53128",
  1436		"Broadcom BCM89610",
  1437		"NatSemi DP83640",
  1438		"Microchip LAN8841 Gigabit PHY"
  1439		"Microchip INDY Gigabit Quad PHY",
  1440		"Microsemi GE VSC856X SyncE",
  1441		"Microsemi GE VSC8575 SyncE",
  1442		"Microsemi GE VSC8582 SyncE",
  1443		"Microsemi GE VSC8584 SyncE",
  1444		"NXP C45 TJA1103",
  1445		NULL,
  1446	};
  1447	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
