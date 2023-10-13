Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EF0224DF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 22:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7eksDCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697237607; x=1728773607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2C5UrgkdXJHfjfoqNAM4SPZu5C0wbXCYHnYx7Cjk8OU=;
  b=O7eksDCbmGI5tuUYAXDnPvAZHlPY/uKCHM7eoULNPUspvsYI9S0LG+BE
   KyV2ZE2zxi+WeXp7o6o5cXzywcnJdaJMWmg2b2sChqsJPxBsh4p3guWzv
   Ophlaq5KpwG5Pe34NRym7rIMP4MDLS9IAGkNgot3cm21Y8KTRz7n6evB9
   R7YZzKjePuhP3c5k+TfTbG+7QHAHeSPwWgZXcLCEmpdR/0dV4QH83JiOo
   Ag+oaUZvoJsgq82rjzWfqlWjsQlKx8t4M3s5Dz2vzhzl0hb42ToZa3zrT
   LyuZxMCK9bWuNhnoMawcN8QKceERRBeF+pOUVsJraISc2yRg+0/t10GtF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388134477"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="388134477"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 15:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871267063"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="871267063"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 15:52:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrR1b-0005US-1U;
	Fri, 13 Oct 2023 22:52:55 +0000
Date: Sat, 14 Oct 2023 06:52:04 +0800
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
Subject: Re: [PATCH net-next v5 10/16] net: ethtool: Add a command to list
 available time stamping layers
Message-ID: <202310140615.H4ByVgnr-lkp@intel.com>
References: <20231009155138.86458-11-kory.maincent@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231009155138.86458-11-kory.maincent@bootlin.com>

Hi Köry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/K-ry-Maincent/net-Convert-PHYs-hwtstamp-callback-to-use-kernel_hwtstamp_config/20231009-235451
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231009155138.86458-11-kory.maincent%40bootlin.com
patch subject: [PATCH net-next v5 10/16] net: ethtool: Add a command to list available time stamping layers
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140615.H4ByVgnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140615.H4ByVgnr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/networking/ethtool-netlink.rst:2022: WARNING: Title underline too short.

vim +2022 Documentation/networking/ethtool-netlink.rst

  2020	
  2021	TS_LIST_GET
> 2022	==========
  2023	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
