Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9403C08A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 08:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BU/+r4EM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701766464; x=1733302464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pf6CsHBZndBxQJ9AhyvitjXHUqSFgKNn6RsDZJB6Ylk=;
  b=BU/+r4EMyQkDMgAYZnHZHL/iIowvqmFPcmCMFH6bX64U/YMxQr4vFz/O
   VbT+m2mrc+BjW1LpiBrhAzv/SrS5INljaBTYrmohD2Ngf9lPQAJTyq61H
   FnDk+e0Lpc2QLmjsLaOTQyrG5WHZ0VbOBafcvtHiAQHKgCY4g8+leE+uQ
   Ze6qrJO9tUN+CLDUMXCGZCSAxNlDMqpZyXdVrv3bbJBDU9GKr4v5YsVvy
   6OhywPcEPMVQPZ+lgYxKHGBFm74f38T880yzYAI/Zuix5895VtC0Rcbyl
   xngbvqCl6AkAR+d8yuxXmF3mvnD30kzcv5ghaP9afBxumFDcxyWqLpqh7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="924957"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="924957"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 00:54:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="799891038"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="799891038"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 00:54:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rARC6-0008by-2z;
	Tue, 05 Dec 2023 08:54:19 +0000
Date: Tue, 5 Dec 2023 16:53:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.7-rc2-net-next-mv88e6xxx-leds-v2 7/7]
 drivers/net/dsa/qca/qca8k-8xxx.c:2018:10: error: 'const struct
 dsa_switch_ops' has no member named 'led_brightness_set'
Message-ID: <202312051620.BdDMhyvO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.7-rc2-net-next-mv88e6xxx-leds-v2
head:   f53b44745216770b0b090aa7a1def08f267575ac
commit: f53b44745216770b0b090aa7a1def08f267575ac [7/7] dsa: qca8k: Use DSA common code for LEDs
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20231205/202312051620.BdDMhyvO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051620.BdDMhyvO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051620.BdDMhyvO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/qca/qca8k-8xxx.c:2018:10: error: 'const struct dsa_switch_ops' has no member named 'led_brightness_set'
    2018 |         .led_brightness_set     = qca8k_led_brightness_set,
         |          ^~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/qca/qca8k-8xxx.c:2018:35: error: initialization of 'int (*)(struct dsa_switch *, int,  struct net_device *, struct netlink_ext_ack *)' from incompatible pointer type 'int (*)(struct dsa_switch *, int,  u8,  enum led_brightness)' {aka 'int (*)(struct dsa_switch *, int,  unsigned char,  enum led_brightness)'} [-Werror=incompatible-pointer-types]
    2018 |         .led_brightness_set     = qca8k_led_brightness_set,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:2018:35: note: (near initialization for 'qca8k_switch_ops.port_change_conduit')
>> drivers/net/dsa/qca/qca8k-8xxx.c:2019:10: error: 'const struct dsa_switch_ops' has no member named 'led_blink_set'
    2019 |         .led_blink_set          = qca8k_led_blink_set,
         |          ^~~~~~~~~~~~~
>> drivers/net/dsa/qca/qca8k-8xxx.c:2019:35: error: initialization of 'int (*)(struct dsa_switch *)' from incompatible pointer type 'int (*)(struct dsa_switch *, int,  u8,  long unsigned int *, long unsigned int *)' {aka 'int (*)(struct dsa_switch *, int,  unsigned char,  long unsigned int *, long unsigned int *)'} [-Werror=incompatible-pointer-types]
    2019 |         .led_blink_set          = qca8k_led_blink_set,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:2019:35: note: (near initialization for 'qca8k_switch_ops.setup')
   drivers/net/dsa/qca/qca8k-8xxx.c:2019:35: warning: initialized field overwritten [-Woverride-init]
   drivers/net/dsa/qca/qca8k-8xxx.c:2019:35: note: (near initialization for 'qca8k_switch_ops.setup')
>> drivers/net/dsa/qca/qca8k-8xxx.c:2020:10: error: 'const struct dsa_switch_ops' has no member named 'led_hw_control_is_supported'
    2020 |         .led_hw_control_is_supported = qca8k_led_hw_control_is_supported,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/qca/qca8k-8xxx.c:2020:40: error: initialization of 'void (*)(struct dsa_switch *)' from incompatible pointer type 'int (*)(struct dsa_switch *, int,  u8,  long unsigned int)' {aka 'int (*)(struct dsa_switch *, int,  unsigned char,  long unsigned int)'} [-Werror=incompatible-pointer-types]
    2020 |         .led_hw_control_is_supported = qca8k_led_hw_control_is_supported,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:2020:40: note: (near initialization for 'qca8k_switch_ops.teardown')
>> drivers/net/dsa/qca/qca8k-8xxx.c:2021:10: error: 'const struct dsa_switch_ops' has no member named 'led_hw_control_set'
    2021 |         .led_hw_control_set     = qca8k_led_hw_control_set,
         |          ^~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/qca/qca8k-8xxx.c:2021:35: error: initialization of 'int (*)(struct dsa_switch *, int)' from incompatible pointer type 'int (*)(struct dsa_switch *, int,  u8,  long unsigned int)' {aka 'int (*)(struct dsa_switch *, int,  unsigned char,  long unsigned int)'} [-Werror=incompatible-pointer-types]
    2021 |         .led_hw_control_set     = qca8k_led_hw_control_set,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:2021:35: note: (near initialization for 'qca8k_switch_ops.port_setup')
>> drivers/net/dsa/qca/qca8k-8xxx.c:2022:10: error: 'const struct dsa_switch_ops' has no member named 'led_hw_control_get'
    2022 |         .led_hw_control_get     = qca8k_led_hw_control_get,
         |          ^~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/qca/qca8k-8xxx.c:2022:35: error: initialization of 'void (*)(struct dsa_switch *, int)' from incompatible pointer type 'int (*)(struct dsa_switch *, int,  u8,  long unsigned int *)' {aka 'int (*)(struct dsa_switch *, int,  unsigned char,  long unsigned int *)'} [-Werror=incompatible-pointer-types]
    2022 |         .led_hw_control_get     = qca8k_led_hw_control_get,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:2022:35: note: (near initialization for 'qca8k_switch_ops.port_teardown')
   cc1: some warnings being treated as errors


vim +2018 drivers/net/dsa/qca/qca8k-8xxx.c

  1977	
  1978	static const struct dsa_switch_ops qca8k_switch_ops = {
  1979		.get_tag_protocol	= qca8k_get_tag_protocol,
  1980		.setup			= qca8k_setup,
  1981		.get_strings		= qca8k_get_strings,
  1982		.get_ethtool_stats	= qca8k_get_ethtool_stats,
  1983		.get_sset_count		= qca8k_get_sset_count,
  1984		.set_ageing_time	= qca8k_set_ageing_time,
  1985		.get_mac_eee		= qca8k_get_mac_eee,
  1986		.set_mac_eee		= qca8k_set_mac_eee,
  1987		.port_enable		= qca8k_port_enable,
  1988		.port_disable		= qca8k_port_disable,
  1989		.port_change_mtu	= qca8k_port_change_mtu,
  1990		.port_max_mtu		= qca8k_port_max_mtu,
  1991		.port_stp_state_set	= qca8k_port_stp_state_set,
  1992		.port_pre_bridge_flags	= qca8k_port_pre_bridge_flags,
  1993		.port_bridge_flags	= qca8k_port_bridge_flags,
  1994		.port_bridge_join	= qca8k_port_bridge_join,
  1995		.port_bridge_leave	= qca8k_port_bridge_leave,
  1996		.port_fast_age		= qca8k_port_fast_age,
  1997		.port_fdb_add		= qca8k_port_fdb_add,
  1998		.port_fdb_del		= qca8k_port_fdb_del,
  1999		.port_fdb_dump		= qca8k_port_fdb_dump,
  2000		.port_mdb_add		= qca8k_port_mdb_add,
  2001		.port_mdb_del		= qca8k_port_mdb_del,
  2002		.port_mirror_add	= qca8k_port_mirror_add,
  2003		.port_mirror_del	= qca8k_port_mirror_del,
  2004		.port_vlan_filtering	= qca8k_port_vlan_filtering,
  2005		.port_vlan_add		= qca8k_port_vlan_add,
  2006		.port_vlan_del		= qca8k_port_vlan_del,
  2007		.phylink_get_caps	= qca8k_phylink_get_caps,
  2008		.phylink_mac_select_pcs	= qca8k_phylink_mac_select_pcs,
  2009		.phylink_mac_config	= qca8k_phylink_mac_config,
  2010		.phylink_mac_link_down	= qca8k_phylink_mac_link_down,
  2011		.phylink_mac_link_up	= qca8k_phylink_mac_link_up,
  2012		.get_phy_flags		= qca8k_get_phy_flags,
  2013		.port_lag_join		= qca8k_port_lag_join,
  2014		.port_lag_leave		= qca8k_port_lag_leave,
  2015		.conduit_state_change	= qca8k_conduit_change,
  2016		.connect_tag_protocol	= qca8k_connect_tag_protocol,
  2017	#ifdef CONFIG_NET_DSA_QCA8K_LEDS_SUPPORT
> 2018		.led_brightness_set	= qca8k_led_brightness_set,
> 2019		.led_blink_set		= qca8k_led_blink_set,
> 2020		.led_hw_control_is_supported = qca8k_led_hw_control_is_supported,
> 2021		.led_hw_control_set	= qca8k_led_hw_control_set,
> 2022		.led_hw_control_get	= qca8k_led_hw_control_get,
  2023	#endif
  2024	};
  2025	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
