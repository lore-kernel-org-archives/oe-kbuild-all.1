Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF1B63DC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 06:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OzKSA1Qf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702879461; x=1734415461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E+b6W/1bNl232pY8WUkM2JHnonUAaI2S5/GHYS5BUQA=;
  b=OzKSA1QfejmuHhGrjNOSU+NsF/fWnyUGv4mNQLJX4mAL4aAKeM8TMj45
   8y/WbqpLmKS8H8EywhvJyox62Wck8/qdDaPR8EIhM3EQzC7+YkwNusp6K
   S5tHAzVwbepoKi5IKnXtJyCblrGiVjUda4nJZE9KN8Ao7y0gbJSRqohOj
   tLb53pID05QAZWeJ2VX7h1vIIOIWVayZkPMxCKNytqE1GoiQQiJT/tPf0
   Ok0x650HTjPKfHhiRH/5gpuuwmX0LZ/TF2+iSrPObxY6EuCiElDHJ2MP0
   060TglLJnMwuNtbCiDVX0X1GwDx50oyzmW7Rgcoh8M5CMT9YJHrLabvft
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="392629728"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="392629728"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 22:04:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="898845829"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="898845829"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Dec 2023 22:04:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF6jd-0003pB-0j;
	Mon, 18 Dec 2023 06:04:13 +0000
Date: Mon, 18 Dec 2023 14:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: oe-kbuild-all@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>
Subject: Re: [PATCH net-next v4 01/13] net: phy: Introduce ethernet link
 topology representation
Message-ID: <202312181303.RTKMlnzl-lkp@intel.com>
References: <20231215171237.1152563-2-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215171237.1152563-2-maxime.chevallier@bootlin.com>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-phy-Introduce-ethernet-link-topology-representation/20231216-012641
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231215171237.1152563-2-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next v4 01/13] net: phy: Introduce ethernet link topology representation
config: i386-randconfig-054-20231216 (https://download.01.org/0day-ci/archive/20231218/202312181303.RTKMlnzl-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312181303.RTKMlnzl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312181303.RTKMlnzl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phy_device.c:269:34: warning: 'phy_get_link_topology' defined but not used [-Wunused-function]
     269 | static struct phy_link_topology *phy_get_link_topology(struct phy_device *phydev)
         |                                  ^~~~~~~~~~~~~~~~~~~~~


vim +/phy_get_link_topology +269 drivers/net/phy/phy_device.c

   268	
 > 269	static struct phy_link_topology *phy_get_link_topology(struct phy_device *phydev)
   270	{
   271		if (phydev->attached_dev)
   272			return &phydev->attached_dev->link_topo;
   273	
   274		return NULL;
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
