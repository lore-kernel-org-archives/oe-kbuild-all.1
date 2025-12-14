Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA631E4AF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 00:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765672296; cv=none; b=MOhoLumeWp3hOp/y5O81O2gljYcqhCFgyQYr9aeCcPYgQiHJx6ZeaBISz1u2fpVttRUKmvMIo2MbuO9Yt7XNZF7YQwE0E2lVqtqC/MTmsIKzg5RY1tiFOBzFLpn5H6LfFMW3zn7dnz62X0UaRpRnnLdP5QrvfKOw3UrqupTqavc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765672296; c=relaxed/simple;
	bh=feRU/gBi3kgb1yc+LRnRcQFXuRaUBrRPQRl2JWe9AgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L3fm5IB8+kMqkUBBRefjbJLhH3N28h+HeYH+OCA/33EYWVmwEOrMYkSfD2tEIC03x3Bs+jlFfRx+bqBO5pMhPplPoYCr3ds5/w/egGIMMv57IRGXEfw6ni89OTdNyF1Txjnj56FersOv7fVUFF3erKPF0WXhoAPdyxmqxMBdaZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iR1szm2Q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iR1szm2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765672295; x=1797208295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=feRU/gBi3kgb1yc+LRnRcQFXuRaUBrRPQRl2JWe9AgQ=;
  b=iR1szm2QgdtrrkJZ0ROrBDOWkHbpQu7Mm+A1umn3UTsRgsx3MnOoshF+
   ylg6nuCOcA4DDRF+FtLBl+s+mSeaqq6gVv9aetG7/2dOmNSOnhg3rMsng
   BSSrtpNeQsCC86BXHF6TRsHQHRhaH3s/55Om5PawzWcAN0lgavA01u5bh
   mZupvYzqpSu21EmHHbaZyr+eL/lAtblIMCRGO/oVuRan6+ZYyW3ryD25G
   b8DC8uCL5Fjh+m2fWbjTGT+T8ttI/S9PXt25zc4CiEdJ1VQ/qTvgf/TCd
   jniCk9N6vwf+0SIzJCpdq46CMcfnHw0auXboMoHPDQ9ZduHxUkDDL+Zzp
   g==;
X-CSE-ConnectionGUID: zHDDXPMQS3eoa0y958qd1Q==
X-CSE-MsgGUID: Gp487eZ6SPWkaXMXHzVrOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67508992"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67508992"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 16:31:34 -0800
X-CSE-ConnectionGUID: 8xMAk1yNSECDAxrseGx6Rg==
X-CSE-MsgGUID: 28hJ2Q9HS1W6924fjPzmmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197303841"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2025 16:31:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUa1K-000000008NT-3IvT;
	Sun, 14 Dec 2025 00:31:30 +0000
Date: Sun, 14 Dec 2025 08:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:225: undefined
 reference to `phylink_ethtool_nway_reset'
Message-ID: <202512140852.VA3cquzw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mengyuan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: a0008a3658a34a54e77f2568bdaa2626233b1459 net: wangxun: add ngbevf build
date:   5 months ago
config: powerpc64-randconfig-002-20251214 (https://download.01.org/0day-ci/archive/20251214/202512140852.VA3cquzw-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140852.VA3cquzw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140852.VA3cquzw-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `phylink_ethtool_get_pauseparam'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_nway_reset':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:225: undefined reference to `phylink_ethtool_nway_reset'
   powerpc64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_link_ksettings':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:234: undefined reference to `phylink_ethtool_ksettings_get'
   powerpc64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_set_link_ksettings':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:246: undefined reference to `phylink_ethtool_ksettings_set'
   powerpc64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_pauseparam':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:258: undefined reference to `phylink_ethtool_get_pauseparam'
   powerpc64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_set_pauseparam':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:270: undefined reference to `phylink_ethtool_set_pauseparam'


vim +225 drivers/net/ethernet/wangxun/libwx/wx_ethtool.c

e8e138cf7383cf Jiawen Wu 2024-01-03  217  
e8e138cf7383cf Jiawen Wu 2024-01-03  218  int wx_nway_reset(struct net_device *netdev)
e8e138cf7383cf Jiawen Wu 2024-01-03  219  {
e8e138cf7383cf Jiawen Wu 2024-01-03  220  	struct wx *wx = netdev_priv(netdev);
e8e138cf7383cf Jiawen Wu 2024-01-03  221  
39709fe4bacda6 Jiawen Wu 2025-05-21  222  	if (wx->mac.type == wx_mac_aml40)
2e5af6b2ae8532 Jiawen Wu 2025-02-21  223  		return -EOPNOTSUPP;
2e5af6b2ae8532 Jiawen Wu 2025-02-21  224  
e8e138cf7383cf Jiawen Wu 2024-01-03 @225  	return phylink_ethtool_nway_reset(wx->phylink);
e8e138cf7383cf Jiawen Wu 2024-01-03  226  }
e8e138cf7383cf Jiawen Wu 2024-01-03  227  EXPORT_SYMBOL(wx_nway_reset);
e8e138cf7383cf Jiawen Wu 2024-01-03  228  
e8e138cf7383cf Jiawen Wu 2024-01-03  229  int wx_get_link_ksettings(struct net_device *netdev,
e8e138cf7383cf Jiawen Wu 2024-01-03  230  			  struct ethtool_link_ksettings *cmd)
e8e138cf7383cf Jiawen Wu 2024-01-03  231  {
e8e138cf7383cf Jiawen Wu 2024-01-03  232  	struct wx *wx = netdev_priv(netdev);
e8e138cf7383cf Jiawen Wu 2024-01-03  233  
e8e138cf7383cf Jiawen Wu 2024-01-03 @234  	return phylink_ethtool_ksettings_get(wx->phylink, cmd);
e8e138cf7383cf Jiawen Wu 2024-01-03  235  }
e8e138cf7383cf Jiawen Wu 2024-01-03  236  EXPORT_SYMBOL(wx_get_link_ksettings);
e8e138cf7383cf Jiawen Wu 2024-01-03  237  
e8e138cf7383cf Jiawen Wu 2024-01-03  238  int wx_set_link_ksettings(struct net_device *netdev,
e8e138cf7383cf Jiawen Wu 2024-01-03  239  			  const struct ethtool_link_ksettings *cmd)
e8e138cf7383cf Jiawen Wu 2024-01-03  240  {
e8e138cf7383cf Jiawen Wu 2024-01-03  241  	struct wx *wx = netdev_priv(netdev);
e8e138cf7383cf Jiawen Wu 2024-01-03  242  
39709fe4bacda6 Jiawen Wu 2025-05-21  243  	if (wx->mac.type == wx_mac_aml40)
2e5af6b2ae8532 Jiawen Wu 2025-02-21  244  		return -EOPNOTSUPP;
2e5af6b2ae8532 Jiawen Wu 2025-02-21  245  
e8e138cf7383cf Jiawen Wu 2024-01-03 @246  	return phylink_ethtool_ksettings_set(wx->phylink, cmd);
e8e138cf7383cf Jiawen Wu 2024-01-03  247  }
e8e138cf7383cf Jiawen Wu 2024-01-03  248  EXPORT_SYMBOL(wx_set_link_ksettings);
2fe2ca09da953b Jiawen Wu 2024-01-03  249  
2fe2ca09da953b Jiawen Wu 2024-01-03  250  void wx_get_pauseparam(struct net_device *netdev,
2fe2ca09da953b Jiawen Wu 2024-01-03  251  		       struct ethtool_pauseparam *pause)
2fe2ca09da953b Jiawen Wu 2024-01-03  252  {
2fe2ca09da953b Jiawen Wu 2024-01-03  253  	struct wx *wx = netdev_priv(netdev);
2fe2ca09da953b Jiawen Wu 2024-01-03  254  
39709fe4bacda6 Jiawen Wu 2025-05-21  255  	if (wx->mac.type == wx_mac_aml40)
2e5af6b2ae8532 Jiawen Wu 2025-02-21  256  		return;
2e5af6b2ae8532 Jiawen Wu 2025-02-21  257  
2fe2ca09da953b Jiawen Wu 2024-01-03 @258  	phylink_ethtool_get_pauseparam(wx->phylink, pause);
2fe2ca09da953b Jiawen Wu 2024-01-03  259  }
2fe2ca09da953b Jiawen Wu 2024-01-03  260  EXPORT_SYMBOL(wx_get_pauseparam);
2fe2ca09da953b Jiawen Wu 2024-01-03  261  
2fe2ca09da953b Jiawen Wu 2024-01-03  262  int wx_set_pauseparam(struct net_device *netdev,
2fe2ca09da953b Jiawen Wu 2024-01-03  263  		      struct ethtool_pauseparam *pause)
2fe2ca09da953b Jiawen Wu 2024-01-03  264  {
2fe2ca09da953b Jiawen Wu 2024-01-03  265  	struct wx *wx = netdev_priv(netdev);
2fe2ca09da953b Jiawen Wu 2024-01-03  266  
39709fe4bacda6 Jiawen Wu 2025-05-21  267  	if (wx->mac.type == wx_mac_aml40)
2e5af6b2ae8532 Jiawen Wu 2025-02-21  268  		return -EOPNOTSUPP;
2e5af6b2ae8532 Jiawen Wu 2025-02-21  269  
2fe2ca09da953b Jiawen Wu 2024-01-03 @270  	return phylink_ethtool_set_pauseparam(wx->phylink, pause);
2fe2ca09da953b Jiawen Wu 2024-01-03  271  }
2fe2ca09da953b Jiawen Wu 2024-01-03  272  EXPORT_SYMBOL(wx_set_pauseparam);
883b5984a5d290 Jiawen Wu 2024-01-03  273  

:::::: The code at line 225 was first introduced by commit
:::::: e8e138cf7383cf820419fcbec63992e75a01467b net: libwx: add phylink to libwx

:::::: TO: Jiawen Wu <jiawenwu@trustnetic.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
