Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A13319BC3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 15:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686326010; x=1717862010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PnEcmmPcWUbOef8mrx7KdCR85NWYFsHg8gXOQ/9iOvM=;
  b=Kngl69JqQOhRwreWX6I/z+Chk8qUoTJd19Yfo76aOhRx8j5HCHr39aCE
   PwnNMcvB+Ak2fPTkMyOxR09o87WQLO2lw6/0z6x5pI9hRfoSeTWo2ovJD
   1VG5AZXbZqp5HcSvqZiyezxA9yxnmJxgl1t9HQw4TLSaD1tUUGKK6ldlr
   KSnVmrfnGWeUbTwGHTLlmkoZfKN6d/l157oEF16mOEflV3wIDTcEkbt7A
   bwevoYoIjw7Hum9ZobozEFDJdY+u0WPZ+dnY59LGCETT4wHe6/OXo5+44
   sNd+OF4ZU3Oc+EJ8aqRBRdg+5u1MDnYgxvLOxmMc4Qr3ves64LdLTeEfW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="357630022"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="357630022"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 08:53:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="704595083"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="704595083"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Jun 2023 08:53:25 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7eQW-0009Bm-1H;
	Fri, 09 Jun 2023 15:53:24 +0000
Date: Fri, 9 Jun 2023 23:52:26 +0800
From: kernel test robot <lkp@intel.com>
To: alexis.lothore@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	paul.arola@telus.com, scott.roberts@telus.com
Subject: Re: [PATCH net-next 2/2] net: dsa: mv88e6xxx: implement egress tbf
 qdisc for 6393x family
Message-ID: <202306092327.Gf6CXGqE-lkp@intel.com>
References: <20230609141812.297521-3-alexis.lothore@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609141812.297521-3-alexis.lothore@bootlin.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/alexis-lothore-bootlin-com/net-dsa-mv88e6xxx-allow-driver-to-hook-TC-callback/20230609-222048
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230609141812.297521-3-alexis.lothore%40bootlin.com
patch subject: [PATCH net-next 2/2] net: dsa: mv88e6xxx: implement egress tbf qdisc for 6393x family
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230609/202306092327.Gf6CXGqE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add net-next https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
        git fetch net-next main
        git checkout net-next/main
        b4 shazam https://lore.kernel.org/r/20230609141812.297521-3-alexis.lothore@bootlin.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306092327.Gf6CXGqE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/mv88e6xxx/port.c:1504:5: warning: no previous prototype for 'mv88e6393x_tbf_add' [-Wmissing-prototypes]
    1504 | int mv88e6393x_tbf_add(struct mv88e6xxx_chip *chip, int port,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/mv88e6xxx/port.c:1559:5: warning: no previous prototype for 'mv88e6393x_tbf_del' [-Wmissing-prototypes]
    1559 | int mv88e6393x_tbf_del(struct mv88e6xxx_chip *chip, int port)
         |     ^~~~~~~~~~~~~~~~~~


vim +/mv88e6393x_tbf_add +1504 drivers/net/dsa/mv88e6xxx/port.c

  1503	
> 1504	int mv88e6393x_tbf_add(struct mv88e6xxx_chip *chip, int port,
  1505			       struct tc_tbf_qopt_offload_replace_params *replace_params)
  1506	{
  1507		int rate_kbps = DIV_ROUND_UP(replace_params->rate.rate_bytes_ps * 8, 1000);
  1508		int overhead = DIV_ROUND_UP(replace_params->rate.overhead, 4);
  1509		int rate_step, decrement_rate, err;
  1510		u16 val;
  1511	
  1512		if (rate_kbps < MV88E6393X_PORT_EGRESS_RATE_MIN_KBPS ||
  1513		    rate_kbps >= MV88E6393X_PORT_EGRESS_RATE_MAX_KBPS)
  1514			return -EOPNOTSUPP;
  1515	
  1516		if (replace_params->rate.overhead > MV88E6393X_PORT_EGRESS_MAX_OVERHEAD)
  1517			return -EOPNOTSUPP;
  1518	
  1519		/* Switch supports only max rate configuration. There is no
  1520		 * configurable burst/max size nor latency.
  1521		 * Formula defining registers value is:
  1522		 * EgressRate = 8 * EgressDec / (16ns * desired Rate)
  1523		 * EgressRate is a set of fixed values depending of targeted range
  1524		 */
  1525		if (rate_kbps < MBPS_TO_KBPS(1)) {
  1526			decrement_rate = rate_kbps / 64;
  1527			rate_step = MV88E6XXX_PORT_EGRESS_RATE_CTL1_STEP_64_KBPS;
  1528		} else if (rate_kbps < MBPS_TO_KBPS(100)) {
  1529			decrement_rate = rate_kbps / MBPS_TO_KBPS(1);
  1530			rate_step = MV88E6XXX_PORT_EGRESS_RATE_CTL1_STEP_1_MBPS;
  1531		} else if (rate_kbps < GBPS_TO_KBPS(1)) {
  1532			decrement_rate = rate_kbps / MBPS_TO_KBPS(10);
  1533			rate_step = MV88E6XXX_PORT_EGRESS_RATE_CTL1_STEP_10_MBPS;
  1534		} else {
  1535			decrement_rate = rate_kbps / MBPS_TO_KBPS(100);
  1536			rate_step = MV88E6XXX_PORT_EGRESS_RATE_CTL1_STEP_100_MBPS;
  1537		}
  1538	
  1539		dev_dbg(chip->dev, "p%d: adding egress tbf qdisc with %dkbps rate",
  1540			port, rate_kbps);
  1541		val = decrement_rate;
  1542		val |= (overhead << MV88E6XXX_PORT_EGRESS_RATE_CTL1_FRAME_OVERHEAD_SHIFT);
  1543		err = mv88e6xxx_port_write(chip, port, MV88E6XXX_PORT_EGRESS_RATE_CTL1,
  1544					   val);
  1545		if (err)
  1546			return err;
  1547	
  1548		val = rate_step;
  1549		/* Configure mode to bits per second mode, on layer 1 */
  1550		val |= MV88E6XXX_PORT_EGRESS_RATE_CTL2_COUNT_L1_BYTES;
  1551		err = mv88e6xxx_port_write(chip, port, MV88E6XXX_PORT_EGRESS_RATE_CTL2,
  1552					   val);
  1553		if (err)
  1554			return err;
  1555	
  1556		return 0;
  1557	}
  1558	
> 1559	int mv88e6393x_tbf_del(struct mv88e6xxx_chip *chip, int port)
  1560	{
  1561		int err;
  1562	
  1563		dev_dbg(chip->dev, "p%d: removing tbf qdisc", port);
  1564		err = mv88e6xxx_port_write(chip, port, MV88E6XXX_PORT_EGRESS_RATE_CTL2,
  1565					   0x0000);
  1566		if (err)
  1567			return err;
  1568		return mv88e6xxx_port_write(chip, port, MV88E6XXX_PORT_EGRESS_RATE_CTL1,
  1569					    0x0001);
  1570	}
  1571	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
