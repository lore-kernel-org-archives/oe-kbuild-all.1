Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E80C3D76
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714924660; cv=none; b=A0cYeeNQwNpwtBKXFo/4cFxIIdPVCNqSF5lRMzEg0AzUZYiFMQCD3Ejh3JG3lV2qUre4BvCpqtfGCC/ke2LeAApdIQg5WOJjKu44/CeGtyisFqNWpnyRm1p/SQOPvjyGy12x1199gCbLupj4bKYoA00arhICE0RWUWNxprghhTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714924660; c=relaxed/simple;
	bh=GTo8Rm+SvnY9HNJ5FgeH1VwoQEg3mqSp2qTv+C8myJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dX0z7mhakfQariXyAqQ8NJ8SmBjgGq0F9anSh/p4tuoxLDv+Rru0+Nuj5mGTNMTO+SMmAXeWI0atCmapT5gure6rj9HaU+gjZtzjEguFrXpYbM2X1LyqeW4WzNMjLMCtWP8lejwtr8SgyPlLB9SLG2H63wxp4MEmmQxxJAmMUw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POaq5hmd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POaq5hmd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714924657; x=1746460657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GTo8Rm+SvnY9HNJ5FgeH1VwoQEg3mqSp2qTv+C8myJ0=;
  b=POaq5hmdAMycpHCZAY2fPoPF7IRoNB7OyYINE9BSVYGSYIwcq+P0B/zp
   sU1xYpqzNj1dt2Qw2HdBAvJOXdQwV80PhTXKzaVCQGgGTwB3QTXbENyCY
   VSTgiloYOPVXmzAZyYhQB7JeTO+TPOgTzY+7KG8v0lt4IbhVzj2hKgtfg
   MoLW4wb8TwGRBxq2UDYv6ehf6jlX7v7O7auAiTUda1psqfkLsJw2wglUg
   3K2PmYbvzWk/DCYDgOidTG4oIfLhljwP8SDg7xKReRYyj8NrK277pV1cM
   6RCggf3FQ9TWvBpCVxAt8LIvFG3RkIaVedAS4fo32Ghf8Y077RNcFSGOB
   A==;
X-CSE-ConnectionGUID: 9g13oczhSdKBxWkADI2uVw==
X-CSE-MsgGUID: TjCdUFzkTLeMc5RvIpGzEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="22080142"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="22080142"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 08:57:36 -0700
X-CSE-ConnectionGUID: ALLmbas0SeS+DVpHewNvbQ==
X-CSE-MsgGUID: 2eFgYWm4TISzWc52B3ehtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="32605709"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 May 2024 08:57:34 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3eF2-00001c-0l;
	Sun, 05 May 2024 15:57:32 +0000
Date: Sun, 5 May 2024 23:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [arm:zii 35/93] drivers/net/dsa/b53/b53_common.c:2283:10: error:
 'const struct dsa_switch_ops' has no member named 'adjust_link'
Message-ID: <202405052355.pG0dj25L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   b602a1302aefbab72bb6e770c84998f0878536f8
commit: 3517bea94ef507148072d1ae9b6b1cfc097fa278 [35/93] net: dsa: Remove adjust_link paths
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240505/202405052355.pG0dj25L-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405052355.pG0dj25L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405052355.pG0dj25L-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/b53/b53_common.c:2283:10: error: 'const struct dsa_switch_ops' has no member named 'adjust_link'
    2283 |         .adjust_link            = b53_adjust_link,
         |          ^~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:2283:35: error: initialization of 'void (*)(struct dsa_switch *, int,  struct phylink_config *)' from incompatible pointer type 'void (*)(struct dsa_switch *, int,  struct phy_device *)' [-Werror=incompatible-pointer-types]
    2283 |         .adjust_link            = b53_adjust_link,
         |                                   ^~~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2283:35: note: (near initialization for 'b53_switch_ops.phylink_get_caps')
   drivers/net/dsa/b53/b53_common.c:2284:35: warning: initialized field overwritten [-Woverride-init]
    2284 |         .phylink_get_caps       = b53_phylink_get_caps,
         |                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2284:35: note: (near initialization for 'b53_switch_ops.phylink_get_caps')
   cc1: some warnings being treated as errors


vim +2283 drivers/net/dsa/b53/b53_common.c

6ae5834b983ac1 Murali Krishna Policharla 2020-03-27  2272  
a82f67afe8e297 Florian Fainelli          2017-01-08  2273  static const struct dsa_switch_ops b53_switch_ops = {
7b314362a2344f Andrew Lunn               2016-08-22  2274  	.get_tag_protocol	= b53_get_tag_protocol,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2275  	.setup			= b53_setup,
4f6a5caf187ff5 Florian Fainelli          2020-09-09  2276  	.teardown		= b53_teardown,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2277  	.get_strings		= b53_get_strings,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2278  	.get_ethtool_stats	= b53_get_ethtool_stats,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2279  	.get_sset_count		= b53_get_sset_count,
c7d28c9df292a4 Florian Fainelli          2018-04-25  2280  	.get_ethtool_phy_stats	= b53_get_ethtool_phy_stats,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2281  	.phy_read		= b53_phy_read16,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2282  	.phy_write		= b53_phy_write16,
967dd82ffc52e9 Florian Fainelli          2016-06-09 @2283  	.adjust_link		= b53_adjust_link,
dda1c25751fa22 Russell King (Oracle      2022-02-22  2284) 	.phylink_get_caps	= b53_phylink_get_caps,
79396934e289db Russell King (Oracle      2022-04-29  2285) 	.phylink_mac_select_pcs	= b53_phylink_mac_select_pcs,
a8e8b98531369c Florian Fainelli          2018-09-05  2286  	.phylink_mac_config	= b53_phylink_mac_config,
a8e8b98531369c Florian Fainelli          2018-09-05  2287  	.phylink_mac_link_down	= b53_phylink_mac_link_down,
a8e8b98531369c Florian Fainelli          2018-09-05  2288  	.phylink_mac_link_up	= b53_phylink_mac_link_up,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2289  	.port_enable		= b53_enable_port,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2290  	.port_disable		= b53_disable_port,
f43a2dbe959703 Florian Fainelli          2017-09-19  2291  	.get_mac_eee		= b53_get_mac_eee,
f43a2dbe959703 Florian Fainelli          2017-09-19  2292  	.set_mac_eee		= b53_set_mac_eee,
ff39c2d68679c8 Florian Fainelli          2016-06-09  2293  	.port_bridge_join	= b53_br_join,
ff39c2d68679c8 Florian Fainelli          2016-06-09  2294  	.port_bridge_leave	= b53_br_leave,
a8b659e7ff75a6 Vladimir Oltean           2021-02-12  2295  	.port_pre_bridge_flags	= b53_br_flags_pre,
a8b659e7ff75a6 Vladimir Oltean           2021-02-12  2296  	.port_bridge_flags	= b53_br_flags,
ff39c2d68679c8 Florian Fainelli          2016-06-09  2297  	.port_stp_state_set	= b53_br_set_stp_state,
597698f1e00d37 Vivien Didelot            2016-09-22  2298  	.port_fast_age		= b53_br_fast_age,
a2482d2ce34986 Florian Fainelli          2016-06-09  2299  	.port_vlan_filtering	= b53_vlan_filtering,
a2482d2ce34986 Florian Fainelli          2016-06-09  2300  	.port_vlan_add		= b53_vlan_add,
a2482d2ce34986 Florian Fainelli          2016-06-09  2301  	.port_vlan_del		= b53_vlan_del,
1da6df85c6fbed Florian Fainelli          2016-06-09  2302  	.port_fdb_dump		= b53_fdb_dump,
1da6df85c6fbed Florian Fainelli          2016-06-09  2303  	.port_fdb_add		= b53_fdb_add,
1da6df85c6fbed Florian Fainelli          2016-06-09  2304  	.port_fdb_del		= b53_fdb_del,
ed3af5fd08ebe3 Florian Fainelli          2017-01-30  2305  	.port_mirror_add	= b53_mirror_add,
ed3af5fd08ebe3 Florian Fainelli          2017-01-30  2306  	.port_mirror_del	= b53_mirror_del,
5d65b64a3d9701 Florian Fainelli          2019-10-24  2307  	.port_mdb_add		= b53_mdb_add,
5d65b64a3d9701 Florian Fainelli          2019-10-24  2308  	.port_mdb_del		= b53_mdb_del,
6ae5834b983ac1 Murali Krishna Policharla 2020-03-27  2309  	.port_max_mtu		= b53_get_max_mtu,
6ae5834b983ac1 Murali Krishna Policharla 2020-03-27  2310  	.port_change_mtu	= b53_change_mtu,
967dd82ffc52e9 Florian Fainelli          2016-06-09  2311  };
967dd82ffc52e9 Florian Fainelli          2016-06-09  2312  

:::::: The code at line 2283 was first introduced by commit
:::::: 967dd82ffc52e9d8ea0defde094f9a39a3f4eeed net: dsa: b53: Add support for Broadcom RoboSwitch

:::::: TO: Florian Fainelli <f.fainelli@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
