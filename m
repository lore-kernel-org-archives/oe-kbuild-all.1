Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6A13B7A6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 19:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfXgXxFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696881468; x=1728417468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Js971sKS/1PzBLNic0V93M/o4QVtQcmRpD9RYFPgw/E=;
  b=hfXgXxFzop+jCWsM7Yu3uz/LzKkM3nFVOZ/GXiiwq2CjknefJhMnc2sX
   8Lwc6COtsKYUBUEBimM4vEyILA0h1bHPXVWx1YMlqCbR/5UrwJYjb5Hoj
   TmLx1VmuPC/1fVEWKzA9DP8tqT/5CS8ZbKt70uBXmJ1dTcQqjDOAZyAHg
   8m6SPGMYeeuOpmu5SA6s3uiBp5lrBiyN137lMtN7x5GVhfCU4Euht8DI7
   pSiuaDjBq6zK+DTQzF8ceaJ+URb8mTx4o0wXS7F8Bp01A/+UqBMlt0glp
   uvJ5u7Crp064L0uGqvtvCxcLT734SeORwvVs61mtlmS4AyyIL58KlBaka
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387067625"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="387067625"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 12:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1000342172"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="1000342172"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 09 Oct 2023 12:57:39 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpwNk-0000bU-33;
	Mon, 09 Oct 2023 19:57:36 +0000
Date: Tue, 10 Oct 2023 03:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jay Vosburgh <j.vosburgh@gmail.com>,
	Andy Gospodarek <andy@greyhouse.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Cochran <richardcochran@gmail.com>,
	Radu Pirea <radu-nicolae.pirea@oss.nxp.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Michael Walle <michael@walle.cc>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>
Subject: Re: [PATCH net-next v5 03/16] net: ethtool: Refactor identical
 get_ts_info implementations.
Message-ID: <202310100344.QG4Jg301-lkp@intel.com>
References: <20231009155138.86458-4-kory.maincent@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231009155138.86458-4-kory.maincent@bootlin.com>

Hi Köry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/K-ry-Maincent/net-Convert-PHYs-hwtstamp-callback-to-use-kernel_hwtstamp_config/20231009-235451
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231009155138.86458-4-kory.maincent%40bootlin.com
patch subject: [PATCH net-next v5 03/16] net: ethtool: Refactor identical get_ts_info implementations.
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231010/202310100344.QG4Jg301-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100344.QG4Jg301-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100344.QG4Jg301-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/bonding/bond_main.c: In function 'bond_ethtool_get_ts_info':
>> drivers/net/bonding/bond_main.c:5755:28: warning: unused variable 'phydev' [-Wunused-variable]
    5755 |         struct phy_device *phydev;
         |                            ^~~~~~
>> drivers/net/bonding/bond_main.c:5752:35: warning: unused variable 'ops' [-Wunused-variable]
    5752 |         const struct ethtool_ops *ops;
         |                                   ^~~


vim +/phydev +5755 drivers/net/bonding/bond_main.c

217df670d9a4da Jay Vosburgh    2005-09-26  5746  
94dd016ae538b1 Hangbin Liu     2021-11-30  5747  static int bond_ethtool_get_ts_info(struct net_device *bond_dev,
94dd016ae538b1 Hangbin Liu     2021-11-30  5748  				    struct ethtool_ts_info *info)
94dd016ae538b1 Hangbin Liu     2021-11-30  5749  {
94dd016ae538b1 Hangbin Liu     2021-11-30  5750  	struct bonding *bond = netdev_priv(bond_dev);
980f0799a15c75 Hangbin Liu     2023-04-18  5751  	struct ethtool_ts_info ts_info;
94dd016ae538b1 Hangbin Liu     2021-11-30 @5752  	const struct ethtool_ops *ops;
94dd016ae538b1 Hangbin Liu     2021-11-30  5753  	struct net_device *real_dev;
980f0799a15c75 Hangbin Liu     2023-04-18  5754  	bool sw_tx_support = false;
94dd016ae538b1 Hangbin Liu     2021-11-30 @5755  	struct phy_device *phydev;
980f0799a15c75 Hangbin Liu     2023-04-18  5756  	struct list_head *iter;
980f0799a15c75 Hangbin Liu     2023-04-18  5757  	struct slave *slave;
9b80ccda233fa6 Hangbin Liu     2022-05-19  5758  	int ret = 0;
94dd016ae538b1 Hangbin Liu     2021-11-30  5759  
9b80ccda233fa6 Hangbin Liu     2022-05-19  5760  	rcu_read_lock();
94dd016ae538b1 Hangbin Liu     2021-11-30  5761  	real_dev = bond_option_active_slave_get_rcu(bond);
9b80ccda233fa6 Hangbin Liu     2022-05-19  5762  	dev_hold(real_dev);
9b80ccda233fa6 Hangbin Liu     2022-05-19  5763  	rcu_read_unlock();
9b80ccda233fa6 Hangbin Liu     2022-05-19  5764  
94dd016ae538b1 Hangbin Liu     2021-11-30  5765  	if (real_dev) {
59b068fe2f41f9 Richard Cochran 2023-10-09  5766  		ret = ethtool_get_ts_info_by_layer(real_dev, info);
980f0799a15c75 Hangbin Liu     2023-04-18  5767  	} else {
980f0799a15c75 Hangbin Liu     2023-04-18  5768  		/* Check if all slaves support software tx timestamping */
980f0799a15c75 Hangbin Liu     2023-04-18  5769  		rcu_read_lock();
980f0799a15c75 Hangbin Liu     2023-04-18  5770  		bond_for_each_slave_rcu(bond, slave, iter) {
59b068fe2f41f9 Richard Cochran 2023-10-09  5771  			ret = ethtool_get_ts_info_by_layer(slave->dev, &ts_info);
980f0799a15c75 Hangbin Liu     2023-04-18  5772  			if (!ret && (ts_info.so_timestamping & SOF_TIMESTAMPING_TX_SOFTWARE)) {
980f0799a15c75 Hangbin Liu     2023-04-18  5773  				sw_tx_support = true;
980f0799a15c75 Hangbin Liu     2023-04-18  5774  				continue;
980f0799a15c75 Hangbin Liu     2023-04-18  5775  			}
980f0799a15c75 Hangbin Liu     2023-04-18  5776  
980f0799a15c75 Hangbin Liu     2023-04-18  5777  			sw_tx_support = false;
980f0799a15c75 Hangbin Liu     2023-04-18  5778  			break;
980f0799a15c75 Hangbin Liu     2023-04-18  5779  		}
980f0799a15c75 Hangbin Liu     2023-04-18  5780  		rcu_read_unlock();
94dd016ae538b1 Hangbin Liu     2021-11-30  5781  	}
94dd016ae538b1 Hangbin Liu     2021-11-30  5782  
980f0799a15c75 Hangbin Liu     2023-04-18  5783  	if (sw_tx_support)
980f0799a15c75 Hangbin Liu     2023-04-18  5784  		info->so_timestamping |= SOF_TIMESTAMPING_TX_SOFTWARE;
980f0799a15c75 Hangbin Liu     2023-04-18  5785  
9b80ccda233fa6 Hangbin Liu     2022-05-19  5786  	dev_put(real_dev);
9b80ccda233fa6 Hangbin Liu     2022-05-19  5787  	return ret;
94dd016ae538b1 Hangbin Liu     2021-11-30  5788  }
94dd016ae538b1 Hangbin Liu     2021-11-30  5789  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
