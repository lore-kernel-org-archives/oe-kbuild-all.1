Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE81243376
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 04:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762747996; cv=none; b=FHTXCy29QxSpanajbRcowxnm/N1+062YMRh5qLv2wYOOrhW2YhkrsnU9eQQJ8A6QYApnL+FS4kveU3VszLF/t3UJRn20G1XEmIsL5qFP3sKfy7R2ZRI2WLlcJKWkX9Thgyo5nNhaoICO1sRFP7y3nvaFjp/wGCtORaUwxDnLWoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762747996; c=relaxed/simple;
	bh=yZzzD59OOefT6CuZF8yIFgYyFTx+LnwCGot1dwF41hk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Smlh609Hu71GfvagLIa8xtoLix+saNzmY1rSslzezpkWGcTtfNrcBT/4J6cz7hO5zsxw+TerDjs+lH8eX65iP2YP6f64WFONBo9v/vFn/S47FAYnKzoCwfCnhjUDkltTvQ+FWrgO0aqif9yTmKpFXGZx7b7DaN73Hp6ybQaStX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGREIZ9t; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGREIZ9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762747995; x=1794283995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yZzzD59OOefT6CuZF8yIFgYyFTx+LnwCGot1dwF41hk=;
  b=mGREIZ9tNuUdN1or6t3JmC58MWnKe3gfKyf9r2AS2j/IjvMMNr9u/Hod
   9MyrEFdbtw2jruce4UeZcED/3FaeZczLKuj4wyh03NU7KktHAWT9M1ZTb
   KVh/wPInDnBKPVk5cckDjTAEq+H+qs0GCbnF0Hb/fPKUEevudi1ob0DUJ
   vq1ut+dr5qGfWhxJZ4doeY/3IgvRurtr7DPtPHXUod7fX5ld4pZT9iMU7
   kfjkPEy9eFkDnX9WiEk0QXFnfJ01eH3DdBXnyI9nZ5C0mPSVM/g+0QrWk
   ozKvRp5FXCcN4fNW4vUzgXI+mjhbmI3Gw4l1U4c1+tFnszn202hV6zNjS
   g==;
X-CSE-ConnectionGUID: S48iGuGZQC64ID5HghRPig==
X-CSE-MsgGUID: hOARG6deQ4eNLZDufhCK/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64885514"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="64885514"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 20:13:15 -0800
X-CSE-ConnectionGUID: wxnfz31FQDaVJMYB4DLvRw==
X-CSE-MsgGUID: CtRRyJOuRaOh8qnFLVG6vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="189008378"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Nov 2025 20:13:13 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIJHD-0002eV-0N;
	Mon, 10 Nov 2025 04:13:11 +0000
Date: Mon, 10 Nov 2025 12:12:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:225:undefined
 reference to `phylink_ethtool_nway_reset'
Message-ID: <202511101227.KAE47Twi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
commit: a0008a3658a34a54e77f2568bdaa2626233b1459 net: wangxun: add ngbevf build
date:   4 months ago
config: x86_64-randconfig-072-20251110 (https://download.01.org/0day-ci/archive/20251110/202511101227.KAE47Twi-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511101227.KAE47Twi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511101227.KAE47Twi-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_nway_reset':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:225:(.text+0x1ea0): undefined reference to `phylink_ethtool_nway_reset'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_link_ksettings':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:234:(.text+0x1ef7): undefined reference to `phylink_ethtool_ksettings_get'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_set_link_ksettings':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:246:(.text+0x1f74): undefined reference to `phylink_ethtool_ksettings_set'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_set_pauseparam':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:270:(.text+0x2014): undefined reference to `phylink_ethtool_set_pauseparam'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_pauseparam':
>> drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:258:(.text+0x27a4): undefined reference to `phylink_ethtool_get_pauseparam'


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
