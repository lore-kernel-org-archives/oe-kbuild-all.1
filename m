Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575368BE0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 18:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678300028; x=1709836028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5xt+Oxmh4ZD99PRtVYMgcMoTdrC8s3y2I1hzYqDESF4=;
  b=lv/uvu2YKVBWGeq7GFXog3QcUTMeAxuDmIcnV4Ff+X7g02qffCdPgsse
   TuDfUqFvFedsvSuQpYOSfZqo6JGQMfLTvQATujXDAtEhliKrJFaG5aMdD
   xIcZkk1IiMIR88Xy6sXCskWoqcRu+cvRX4/AnPtjich1TevovvmoWIkEV
   sLYlIGkn4h2lLyLCeK1nXSP9PJDrmFTaLcCzTcSCMz09vVFAFHp5vl5gJ
   h2tmAJMm0NRvn/7RjQDfMGTjGov0oc3iYHYWDw9PNJ8G+WlBnpwY8sKP/
   OIqTlFI4yJl825bPXVV51qfsFrMT3bjS9vtu64suUVlcsDCPp6ccahzai
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="401065312"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="401065312"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 10:27:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="766100262"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="766100262"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2023 10:26:55 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZyV5-0002Kv-0g;
	Wed, 08 Mar 2023 18:26:55 +0000
Date: Thu, 9 Mar 2023 02:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-omap@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Michael Walle <michael@walle.cc>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	thomas.petazzoni@bootlin.com, Russell King <linux@armlinux.org.uk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jay Vosburgh <j.vosburgh@gmail.com>,
	Veaceslav Falico <vfalico@gmail.com>,
	Andy Gospodarek <andy@greyhouse.net>,
	Joakim Zhang <qiangqing.zhang@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	UNGLinuxDriver@microchip.com,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Minghao Chi <chi.minghao@zte.com.cn>
Subject: Re: [PATCH v3 3/5] net: Let the active time stamping layer be
 selectable.
Message-ID: <202303090220.EervgFvH-lkp@intel.com>
References: <20230308135936.761794-4-kory.maincent@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308135936.761794-4-kory.maincent@bootlin.com>

Hi Köry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on v6.2]
[cannot apply to robh/for-next horms-ipvs/master net/master net-next/master linus/master v6.3-rc1 next-20230308]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/K-ry-Maincent/net-ethtool-Refactor-identical-get_ts_info-implementations/20230308-220453
patch link:    https://lore.kernel.org/r/20230308135936.761794-4-kory.maincent%40bootlin.com
patch subject: [PATCH v3 3/5] net: Let the active time stamping layer be selectable.
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230309/202303090220.EervgFvH-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d81a36f239360e7e3b9ca2633e52b3cb12205590
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review K-ry-Maincent/net-ethtool-Refactor-identical-get_ts_info-implementations/20230308-220453
        git checkout d81a36f239360e7e3b9ca2633e52b3cb12205590
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090220.EervgFvH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phy_device.c:1384:6: warning: no previous prototype for 'of_set_timestamp' [-Wmissing-prototypes]
    1384 | void of_set_timestamp(struct net_device *netdev, struct phy_device *phydev)
         |      ^~~~~~~~~~~~~~~~


vim +/of_set_timestamp +1384 drivers/net/phy/phy_device.c

  1383	
> 1384	void of_set_timestamp(struct net_device *netdev, struct phy_device *phydev)
  1385	{
  1386		struct device_node *node = phydev->mdio.dev.of_node;
  1387		const struct ethtool_ops *ops = netdev->ethtool_ops;
  1388		const char *s;
  1389		enum timestamping_layer ts_layer = 0;
  1390	
  1391		if (phy_has_hwtstamp(phydev))
  1392			ts_layer = PHY_TIMESTAMPING;
  1393		else if (ops->get_ts_info)
  1394			ts_layer = MAC_TIMESTAMPING;
  1395	
  1396		if (of_property_read_string(node, "preferred-timestamp", &s))
  1397			goto out;
  1398	
  1399		if (!s)
  1400			goto out;
  1401	
  1402		if (phy_has_hwtstamp(phydev) && !strcmp(s, "phy"))
  1403			ts_layer = PHY_TIMESTAMPING;
  1404	
  1405		if (ops->get_ts_info && !strcmp(s, "mac"))
  1406			ts_layer = MAC_TIMESTAMPING;
  1407	
  1408	out:
  1409		netdev->selected_timestamping_layer = ts_layer;
  1410	}
  1411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
