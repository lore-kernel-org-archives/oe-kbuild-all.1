Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4A979C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 20:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679949993; x=1711485993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UVPqjOMY1TZCKCQX+ltrwedWkt30zfNICDn1ygjTVK4=;
  b=O3FJuNFFOXBkNzAykWnaHS0CRxJbSbkVzB/EU5rkXw0AjdIJtXBXpfb2
   KjXPUBqkEguM+afl4yGQfKhBBSJgfyr8WuIGT6OMZdwPg4gUEJ7W835o1
   IT4vk3WZp99DQur5oFlnkdB5B8mAtKVqGgt5ETnV3nHDZov3uWzeXIshj
   TvzmlYDGvQ/UIADx8+rsYUpr1hoBN26muaTTaDX54DOkqypEfOZn5UfkD
   PBHRWJ/p3J3/jokARIoHBbjJaU5WPOAhlBAJdaQ+ja7Ph3plzqicv4TXa
   iINautQn2rY95uRUKpITbG1vbIg+q89FoTQhiLJ4X2ZJ8FxAP0d+ATnJf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="328829396"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="328829396"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 13:46:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="748145264"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="748145264"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Mar 2023 13:46:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgtjX-000I0X-1x;
	Mon, 27 Mar 2023 20:46:27 +0000
Date: Tue, 28 Mar 2023 04:45:31 +0800
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
Message-ID: <202303280408.Krp7V753-lkp@intel.com>
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
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230328/202303280408.Krp7V753-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/fcee3230c8abb824746744ba0fc39dfd626faa65
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oleksij-Rempel/net-phy-Add-driver-specific-get-set_eee-support-for-non-standard-PHYs/20230327-222630
        git checkout fcee3230c8abb824746744ba0fc39dfd626faa65
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303280408.Krp7V753-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: net/ethtool/common.o: in function `__ethtool_get_eee':
>> net/ethtool/common.c:677: undefined reference to `phy_ethtool_get_eee'
   /usr/bin/ld: net/ethtool/common.o: in function `__ethtool_set_eee':
>> net/ethtool/common.c:696: undefined reference to `phy_ethtool_set_eee'
   collect2: error: ld returned 1 exit status


vim +677 net/ethtool/common.c

   663	
   664	int __ethtool_get_eee(struct net_device *dev, struct ethtool_eee *eee)
   665	{
   666		const struct ethtool_ops *ops = dev->ethtool_ops;
   667		struct phy_device *phydev = dev->phydev;
   668		int ret;
   669	
   670		if (ops->get_eee)
   671			ret = ops->get_eee(dev, eee);
   672		else
   673			ret = -EOPNOTSUPP;
   674	
   675		if (ret == -EOPNOTSUPP) {
   676			if (phydev && phydev->is_smart_eee_phy)
 > 677				ret = phy_ethtool_get_eee(phydev, eee);
   678		}
   679	
   680		return ret;
   681	}
   682	
   683	int __ethtool_set_eee(struct net_device *dev, struct ethtool_eee *eee)
   684	{
   685		const struct ethtool_ops *ops = dev->ethtool_ops;
   686		struct phy_device *phydev = dev->phydev;
   687		int ret;
   688	
   689		if (ops->set_eee)
   690			ret = ops->set_eee(dev, eee);
   691		else
   692			ret = -EOPNOTSUPP;
   693	
   694		if (ret == -EOPNOTSUPP) {
   695			if (phydev && phydev->is_smart_eee_phy)
 > 696				ret = phy_ethtool_set_eee(phydev, eee);
   697		}
   698	
   699		return ret;
   700	}
   701	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
