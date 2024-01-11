Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F6714AB7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 10:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6RWtMeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704969993; x=1736505993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lj9M38C0qSG4EhpwXiPb1ehMUiBhSys1qM+pRQswwGY=;
  b=I6RWtMeQY4lhU+QXT+y+wGSOi37mw4fksL5TSCd8vAD712/5a7uYv8ee
   diy85HjxhoDaIz0vSochtfFOstw/kw2E8C2MOHeRvHMVOwoClHowWdFnT
   5ejtjutvKWNFkkRySOP7Zp//y9wBl6CL6tK7tPU5KltDO6xX2gOesqslG
   ApNOtLG0znzrayahgzBMSgAf1fpjag9tX3G5go1aWAEEjQ26woZDuGcdk
   WtYHCC7gYZT8dhi4Y92q1WydYXrZdMDiu2IHOXBqPO+YwmRdIn7+DKia+
   0C9c1idyUbxKbW0ejdWZf6LrFy7E53YMkrhE+9ekhPUdW12yjY2+I4EA4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="463097378"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="463097378"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 02:46:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="30954200"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 11 Jan 2024 02:46:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNsZx-0008AA-1T;
	Thu, 11 Jan 2024 10:46:29 +0000
Date: Thu, 11 Jan 2024 18:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [linux-next:master 11933/13245]
 drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:220:undefined reference to
 `phylink_ethtool_get_pauseparam'
Message-ID: <202401111846.TjO5BA3A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
commit: 2fe2ca09da953bac778eab5dfb309b4e7d274b1a [11933/13245] net: wangxun: add flow control support
config: parisc-randconfig-r002-20221104 (https://download.01.org/0day-ci/archive/20240111/202401111846.TjO5BA3A-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111846.TjO5BA3A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111846.TjO5BA3A-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_remove':
   ngbe_main.c:(.text+0x1c): undefined reference to `phylink_destroy'
   hppa-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_close':
   ngbe_main.c:(.text+0x300): undefined reference to `phylink_stop'
   hppa-linux-ld: ngbe_main.c:(.text+0x330): undefined reference to `phylink_disconnect_phy'
   hppa-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_up':
   ngbe_main.c:(.text+0x874): undefined reference to `phylink_start'
   hppa-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_open':
   ngbe_main.c:(.text+0xae0): undefined reference to `phylink_connect_phy'
   hppa-linux-ld: ngbe_main.c:(.text+0xb20): undefined reference to `phylink_disconnect_phy'
   hppa-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_probe':
   ngbe_main.c:(.text+0x11c0): undefined reference to `phylink_destroy'
   hppa-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_nway_reset':
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:193:(.text+0x2cc): undefined reference to `phylink_ethtool_nway_reset'
   hppa-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_link_ksettings':
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:202:(.text+0x2f0): undefined reference to `phylink_ethtool_ksettings_get'
   hppa-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_set_link_ksettings':
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:211:(.text+0x318): undefined reference to `phylink_ethtool_ksettings_set'
   hppa-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_pauseparam':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:220:(.text+0x340): undefined reference to `phylink_ethtool_get_pauseparam'
   hppa-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_set_pauseparam':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:229:(.text+0x368): undefined reference to `phylink_ethtool_set_pauseparam'
   hppa-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_mdio.o: in function `ngbe_mdio_init':
   drivers/net/ethernet/wangxun/ngbe/ngbe_mdio.c:130:(.text+0x38c): undefined reference to `phylink_create'


vim +220 drivers/net/ethernet/wangxun/libwx/wx_ethtool.c

   214	
   215	void wx_get_pauseparam(struct net_device *netdev,
   216			       struct ethtool_pauseparam *pause)
   217	{
   218		struct wx *wx = netdev_priv(netdev);
   219	
 > 220		phylink_ethtool_get_pauseparam(wx->phylink, pause);
   221	}
   222	EXPORT_SYMBOL(wx_get_pauseparam);
   223	
   224	int wx_set_pauseparam(struct net_device *netdev,
   225			      struct ethtool_pauseparam *pause)
   226	{
   227		struct wx *wx = netdev_priv(netdev);
   228	
 > 229		return phylink_ethtool_set_pauseparam(wx->phylink, pause);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
