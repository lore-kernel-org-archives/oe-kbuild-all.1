Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46463631
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 05:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681277822; x=1712813822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0/QzdFOMZ7OyL1YjBjqo+j6N0nk0sgE7+FMcQMyWB8o=;
  b=jgSCJNmOIY2ZAofr8mDr/bOp9K8U8PAKe1r1MDKXveOcRjR81xkQq41O
   lztUiAuk2hzLq9GFk4MQ1ACxeVbGpggd95eZHNxCd2q9WUqQzBtw45phy
   OVLCCyGQ/hsjpxH0CZwzZFpufJlS8emXVDKMBbQuLElvAYzgVJYeMapU6
   ZGZ33/xuBEStJTZJjcAdSIrYwbUyPvAVRgWKgN9FdHUfLgqMoTs+pbhsJ
   uG+x0S5PWDLrNRsIEnmmZS1sjdXs03n5RinGpl4A5LkNFf8Pv+x1BV9ch
   4ktoLcyC8+p9A4mJ5VOQhz/byPe4kYsWMJ12j7Oc+obP3VMgqlR8dVpRx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="342562078"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="342562078"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 22:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="666213446"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="666213446"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Apr 2023 22:36:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmTA7-000XKp-2V;
	Wed, 12 Apr 2023 05:36:55 +0000
Date: Wed, 12 Apr 2023 13:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Arun Ramadoss <arun.ramadoss@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH net-next v1 2/2] net: dsa: microchip: Add partial ACL
 support for ksz9477 switches
Message-ID: <202304121352.Fv5JpXcQ-lkp@intel.com>
References: <20230411172456.3003003-3-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411172456.3003003-3-o.rempel@pengutronix.de>

Hi Oleksij,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksij-Rempel/net-dsa-microchip-rework-ksz_prmw8/20230412-012709
patch link:    https://lore.kernel.org/r/20230411172456.3003003-3-o.rempel%40pengutronix.de
patch subject: [PATCH net-next v1 2/2] net: dsa: microchip: Add partial ACL support for ksz9477 switches
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230412/202304121352.Fv5JpXcQ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a25d395c637a31cbf5c2188bf8f8475d4bdeeee8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oleksij-Rempel/net-dsa-microchip-rework-ksz_prmw8/20230412-012709
        git checkout a25d395c637a31cbf5c2188bf8f8475d4bdeeee8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121352.Fv5JpXcQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/microchip/ksz9477_acl.c:622:27: warning: no previous prototype for 'ksz9477_acl_get_init_entry' [-Wmissing-prototypes]
     622 | struct ksz9477_acl_entry *ksz9477_acl_get_init_entry(struct ksz_device *dev,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/microchip/ksz9477_acl.c: In function 'ksz9477_cls_flower_add':
>> drivers/net/dsa/microchip/ksz9477_acl.c:887:35: warning: variable 'entry' set but not used [-Wunused-but-set-variable]
     887 |         struct ksz9477_acl_entry *entry;
         |                                   ^~~~~


vim +/ksz9477_acl_get_init_entry +622 drivers/net/dsa/microchip/ksz9477_acl.c

   609	
   610	/**
   611	 * ksz9477_acl_get_init_entry - Get a new uninitialized entry for a specified
   612	 *				port on a ksz_device.
   613	 * @dev: The ksz_device instance.
   614	 * @port: The port number to get the uninitialized entry for.
   615	 *
   616	 * This function retrieves the next available ACL entry for the specified port,
   617	 * clears all access flags, and associates it with the current cookie.
   618	 *
   619	 * Returns: A pointer to the new uninitialized ACL entry.
   620	 */
   621	
 > 622	struct ksz9477_acl_entry *ksz9477_acl_get_init_entry(struct ksz_device *dev,
   623							     int port)
   624	{
   625		struct ksz9477_acl_priv *acl = dev->ports[port].acl_priv;
   626		struct ksz9477_acl_entries *acles = &acl->acles;
   627		struct ksz9477_acl_entry *entry;
   628	
   629		entry = &acles->entries[acles->entries_count];
   630		entry->cookie = acl->current_cookie;
   631	
   632		/* clear all access flags */
   633		entry->entry[KSZ9477_ACL_PORT_ACCESS_10] = 0;
   634		entry->entry[KSZ9477_ACL_PORT_ACCESS_11] = 0;
   635	
   636		return entry;
   637	}
   638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
