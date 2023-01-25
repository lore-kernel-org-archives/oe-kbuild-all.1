Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B432FEC3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 02:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674612452; x=1706148452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZT2w0VrGBAVAUhjm7AQIMilQl7CYjSugYO6QLUa6ojw=;
  b=DXX1eESHb1RknLf8ME2UxHFx1e9mRR5u1gfbdNhI5qLQ5a2rc8OHX8L7
   HoI31k6B+2cLTBh/0YC49JuxDWMHJgx2DhMLB/xR0XD7Q8HY307GPd5Ne
   1OHP/FhwXUrObo/O3hLNYLxURYIuUH8Ta/ZH6Z6kTEajF9UvOHDYpbTtp
   0ANsO6k5Sc2AnS6H6nCYKQcHUpjJgIPGZ8+UBfL5ubRy11CPc3VuFIXgV
   J+kt0QmAFZNsphKdychoNkvu5p1fBD6x6W4dkwA7vWqZu45fS18TxtPcS
   iZ+9hxWu5P3JF3zaleJmu6npiq87AOnjBpb6/FrqhBmpkR4bFCXAApLIS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="306126247"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="306126247"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 18:07:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="804839558"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="804839558"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2023 18:07:31 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKVCE-0006xs-0S;
	Wed, 25 Jan 2023 02:07:30 +0000
Date: Wed, 25 Jan 2023 10:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6983/7678] ocelot_stats.c:undefined reference to
 `ethtool_aggregate_pause_stats'
Message-ID: <202301251054.zZwhG2Yz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a54df7622717a40ddec95fd98086aff8ba7839a6
commit: ab3f97a9610a8d90dc9934517e82c3272d4e98a0 [6983/7678] net: mscc: ocelot: export ethtool MAC Merge stats for Felix VSC9959
config: nios2-randconfig-r016-20230123 (https://download.01.org/0day-ci/archive/20230125/202301251054.zZwhG2Yz-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ab3f97a9610a8d90dc9934517e82c3272d4e98a0
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ab3f97a9610a8d90dc9934517e82c3272d4e98a0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/net/ethernet/mscc/ocelot_stats.o: in function `ocelot_port_get_pause_stats':
>> ocelot_stats.c:(.text+0xc5c): undefined reference to `ethtool_aggregate_pause_stats'
   ocelot_stats.c:(.text+0xc5c): relocation truncated to fit: R_NIOS2_CALL26 against `ethtool_aggregate_pause_stats'
   nios2-linux-ld: drivers/net/ethernet/mscc/ocelot_stats.o: in function `ocelot_port_get_rmon_stats':
>> ocelot_stats.c:(.text+0xd10): undefined reference to `ethtool_aggregate_rmon_stats'
   ocelot_stats.c:(.text+0xd10): relocation truncated to fit: R_NIOS2_CALL26 against `ethtool_aggregate_rmon_stats'
   nios2-linux-ld: drivers/net/ethernet/mscc/ocelot_stats.o: in function `ocelot_port_get_eth_ctrl_stats':
>> ocelot_stats.c:(.text+0xd88): undefined reference to `ethtool_aggregate_ctrl_stats'
   ocelot_stats.c:(.text+0xd88): relocation truncated to fit: R_NIOS2_CALL26 against `ethtool_aggregate_ctrl_stats'
   nios2-linux-ld: drivers/net/ethernet/mscc/ocelot_stats.o: in function `ocelot_port_get_eth_mac_stats':
>> ocelot_stats.c:(.text+0xe00): undefined reference to `ethtool_aggregate_mac_stats'
   ocelot_stats.c:(.text+0xe00): relocation truncated to fit: R_NIOS2_CALL26 against `ethtool_aggregate_mac_stats'
   nios2-linux-ld: drivers/net/ethernet/mscc/ocelot_stats.o: in function `ocelot_port_get_eth_phy_stats':
>> ocelot_stats.c:(.text+0xe78): undefined reference to `ethtool_aggregate_phy_stats'
   ocelot_stats.c:(.text+0xe78): relocation truncated to fit: R_NIOS2_CALL26 against `ethtool_aggregate_phy_stats'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
