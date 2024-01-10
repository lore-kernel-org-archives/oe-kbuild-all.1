Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEAD2E623
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4dtiDhr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704867654; x=1736403654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iKbolRSUiKyQJgsM41sLwZ/GoMm/hJjuaqhsWp3z/Fc=;
  b=K4dtiDhrb8tyYLb8JxY72zjgbQNKjyqbpV+Kueb7oCxhWGzjZUmOQDqN
   hLrAUg7MahJI71URPRAwTPOEc7/XoH9KjhqsX5QRe/9yKcgQTZ6G/1L6N
   JEv75fyCegygBnLnsu0NZMHqClIPpgvyMCxBtUe6BTv3ooldXPKIqJWs+
   BLdt/Dv0dac8g/8QKVpIFhOm7CvWvN8lFUqJdUwIzs4p7mWwjT0vbSRzd
   n24jrLQo//w/WGft5RtUMddJIbrGsoTkN6Isceb3x8f5PWp70xZ7k5bp/
   prCNVvl/83+gojjJO930xTtO12EwX4ewMW/LuouCPeRWyxSarCX0vg1Qn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5781999"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5781999"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 22:20:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="872504428"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="872504428"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Jan 2024 22:20:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNRqb-0006gK-0J;
	Wed, 10 Jan 2024 06:14:59 +0000
Date: Wed, 10 Jan 2024 14:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [linux-next:master 12033/13011]
 drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:193:undefined reference to
 `phylink_ethtool_nway_reset'
Message-ID: <202401101414.8GvBGMXw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f067394dd3b2af3263339cf7183bdb6ee0ac1f8
commit: e8e138cf7383cf820419fcbec63992e75a01467b [12033/13011] net: libwx: add phylink to libwx
config: parisc-randconfig-r002-20221104 (https://download.01.org/0day-ci/archive/20240110/202401101414.8GvBGMXw-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401101414.8GvBGMXw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401101414.8GvBGMXw-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_nway_reset':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:193:(.text+0x2cc): undefined reference to `phylink_ethtool_nway_reset'
   hppa-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_link_ksettings':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:202:(.text+0x2f0): undefined reference to `phylink_ethtool_ksettings_get'
   hppa-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_set_link_ksettings':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:211:(.text+0x318): undefined reference to `phylink_ethtool_ksettings_set'


vim +193 drivers/net/ethernet/wangxun/libwx/wx_ethtool.c

   188	
   189	int wx_nway_reset(struct net_device *netdev)
   190	{
   191		struct wx *wx = netdev_priv(netdev);
   192	
 > 193		return phylink_ethtool_nway_reset(wx->phylink);
   194	}
   195	EXPORT_SYMBOL(wx_nway_reset);
   196	
   197	int wx_get_link_ksettings(struct net_device *netdev,
   198				  struct ethtool_link_ksettings *cmd)
   199	{
   200		struct wx *wx = netdev_priv(netdev);
   201	
 > 202		return phylink_ethtool_ksettings_get(wx->phylink, cmd);
   203	}
   204	EXPORT_SYMBOL(wx_get_link_ksettings);
   205	
   206	int wx_set_link_ksettings(struct net_device *netdev,
   207				  const struct ethtool_link_ksettings *cmd)
   208	{
   209		struct wx *wx = netdev_priv(netdev);
   210	
 > 211		return phylink_ethtool_ksettings_set(wx->phylink, cmd);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
