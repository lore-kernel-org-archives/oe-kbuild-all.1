Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086D79445
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708856461; cv=none; b=QTLSfRC2Ra0cAUBDWInTMcGPTtSG4mxQW+Qu04eQIqMNcBfKwIAT+s4Rjkcci3jRm/UN9kKntcrEZebLVnSH18m9nzaeeFz7Frf29Zvg5CU0jHXt9UJYDDGsohIxhuBI0T21tj7c2JVg/QQVBTxlHiLO868RACs2Qumx+i/Wj5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708856461; c=relaxed/simple;
	bh=xs3c2SY/UO+DW3aCMp8CBSc5dOPj8qdoCprt0m+JLbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a9/k4nONY3w07gy8qjL3Mkw1+Uetc6QyD9mErWe3iuasGxgTTF8HfZXkiIk/faIvzYQ0aRI6czVAJOUfFTH6CTYMSc2dlO/HJloH5CafRAqJXuhHUUuK54QxK6962cvSrqaiujmQ7w85BUv1qpv4NYHoPlEx+ylrvbKhXAYSn08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Khol8/Up; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Khol8/Up"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708856460; x=1740392460;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xs3c2SY/UO+DW3aCMp8CBSc5dOPj8qdoCprt0m+JLbs=;
  b=Khol8/UpVUUI/ht2plB1svVZAh1M4LaBaJ3EkKuM40e6R+daB9cdIZhX
   vdH7J6NQMu8/kwUK01kYMzw23xyJCvT1g4GqAEuS4DUtcwmoAqXQPb+Ta
   dZFoeuPhZsh2QE3Py5yn0FCfcyQi4PsBo0JbX1a7JOOdDRDGARKWSqnoH
   B3gQWzfG0OfxF8oqgNqXodKbF/EBB9dP6ebsgl0DgTBxU5FHssuCB/KLO
   d7nFLCzjiqZ4T2VQCOae2ztcB5TaX3Ts2AML7bzvoGmF6P+MoRVzakI2L
   1IxGnqouDY1B5uL+S2T0WrocOdb7pggYq/ps2Aemf/mENhs14AIDowGGf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="14579873"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="14579873"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 02:20:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="6286254"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Feb 2024 02:20:57 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reBcW-0009SS-0s;
	Sun, 25 Feb 2024 10:20:40 +0000
Date: Sun, 25 Feb 2024 18:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:4.14-main 5375/28369] net/dsa/slave.c:1256:26:
 warning: variable 'cpu_dp' set but not used
Message-ID: <202402251841.BWr7Kzcl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/frank-w/BPI-R2-4.14 4.14-main
head:   d8596a70452e988b924cced76234cb516485149d
commit: a293bdb3d53aac4216fb379f84aa25aa65aaa3ef [5375/28369] [gmac] added second gmac
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240225/202402251841.BWr7Kzcl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251841.BWr7Kzcl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402251841.BWr7Kzcl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/workqueue.h:9,
                    from include/linux/mm_types.h:16,
                    from include/linux/fs.h:22,
                    from include/linux/net.h:27,
                    from include/linux/skbuff.h:29,
                    from include/linux/if_ether.h:23,
                    from include/linux/etherdevice.h:25,
                    from net/dsa/slave.c:12:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   net/dsa/slave.c: In function 'dsa_slave_create':
>> net/dsa/slave.c:1256:26: warning: variable 'cpu_dp' set but not used [-Wunused-but-set-variable]
    1256 |         struct dsa_port *cpu_dp;
         |                          ^~~~~~
   net/dsa/slave.c: In function 'dsa_cpu_port_get_strings':
   net/dsa/slave.c:618:38: warning: '%.2d' directive output may be truncated writing between 2 and 4 bytes into a region of size 3 [-Wformat-truncation=]
     618 |         snprintf(pfx, sizeof(pfx), "p%.2d", cpu_port);
         |                                      ^~~~
   net/dsa/slave.c:618:36: note: directive argument in the range [-128, 127]
     618 |         snprintf(pfx, sizeof(pfx), "p%.2d", cpu_port);
         |                                    ^~~~~~~
   net/dsa/slave.c:618:9: note: 'snprintf' output between 4 and 6 bytes into a destination of size 4
     618 |         snprintf(pfx, sizeof(pfx), "p%.2d", cpu_port);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/dsa/slave.c:1: warning: no structured comments found


vim +/cpu_dp +1256 net/dsa/slave.c

2446254915a7d6 Florian Fainelli  2014-09-18  1248  
4cfbf09cf97f26 Vivien Didelot    2017-08-05  1249  int dsa_slave_create(struct dsa_port *port, const char *name)
91da11f870f00a Lennert Buytenhek 2008-10-07  1250  {
4cfbf09cf97f26 Vivien Didelot    2017-08-05  1251  	struct dsa_switch *ds = port->ds;
badf3ada60ab8f Florian Fainelli  2016-04-27  1252  	struct dsa_switch_tree *dst = ds->dst;
83c0afaec7b730 Andrew Lunn       2016-06-04  1253  	struct net_device *master;
91da11f870f00a Lennert Buytenhek 2008-10-07  1254  	struct net_device *slave_dev;
91da11f870f00a Lennert Buytenhek 2008-10-07  1255  	struct dsa_slave_priv *p;
a29342e7391152 Florian Fainelli  2017-06-13 @1256  	struct dsa_port *cpu_dp;
91da11f870f00a Lennert Buytenhek 2008-10-07  1257  	int ret;
91da11f870f00a Lennert Buytenhek 2008-10-07  1258  
a29342e7391152 Florian Fainelli  2017-06-13  1259  	cpu_dp = ds->dst->cpu_dp;
a293bdb3d53aac Frank Wunderlich  2018-06-30  1260  	master = ds->ports[port->upstream].ethernet;
83c0afaec7b730 Andrew Lunn       2016-06-04  1261  
55199df6d2af55 Florian Fainelli  2017-09-03  1262  	if (!ds->num_tx_queues)
55199df6d2af55 Florian Fainelli  2017-09-03  1263  		ds->num_tx_queues = 1;
55199df6d2af55 Florian Fainelli  2017-09-03  1264  
55199df6d2af55 Florian Fainelli  2017-09-03  1265  	slave_dev = alloc_netdev_mqs(sizeof(struct dsa_slave_priv), name,
55199df6d2af55 Florian Fainelli  2017-09-03  1266  				     NET_NAME_UNKNOWN, ether_setup,
55199df6d2af55 Florian Fainelli  2017-09-03  1267  				     ds->num_tx_queues, 1);
91da11f870f00a Lennert Buytenhek 2008-10-07  1268  	if (slave_dev == NULL)
d87d6f44d7c125 Guenter Roeck     2015-02-24  1269  		return -ENOMEM;
91da11f870f00a Lennert Buytenhek 2008-10-07  1270  
f50f212749e8a2 Florian Fainelli  2017-01-30  1271  	slave_dev->features = master->vlan_features | NETIF_F_HW_TC;
f50f212749e8a2 Florian Fainelli  2017-01-30  1272  	slave_dev->hw_features |= NETIF_F_HW_TC;
7ad24ea4bf620a Wilfried Klaebe   2014-05-11  1273  	slave_dev->ethtool_ops = &dsa_slave_ethtool_ops;
2fcc8005834a39 Bjørn Mork        2013-08-30  1274  	eth_hw_addr_inherit(slave_dev, master);
0a5f107b6774aa Phil Sutter       2015-08-18  1275  	slave_dev->priv_flags |= IFF_NO_QUEUE;
3e8a72d1dae374 Florian Fainelli  2014-08-27  1276  	slave_dev->netdev_ops = &dsa_slave_netdev_ops;
9d47c0a2d958e0 Jiri Pirko        2015-05-10  1277  	slave_dev->switchdev_ops = &dsa_slave_switchdev_ops;
8b1efc0f83f1f7 Jarod Wilson      2016-10-20  1278  	slave_dev->min_mtu = 0;
8b1efc0f83f1f7 Jarod Wilson      2016-10-20  1279  	slave_dev->max_mtu = ETH_MAX_MTU;
f37db85d0c1eb6 Florian Fainelli  2015-09-23  1280  	SET_NETDEV_DEVTYPE(slave_dev, &dsa_type);
d442ad4ab1c86b Stephen Hemminger 2009-01-06  1281  
448b4482c6713c Andrew Lunn       2015-05-06  1282  	netdev_for_each_tx_queue(slave_dev, dsa_slave_set_lockdep_class_one,
448b4482c6713c Andrew Lunn       2015-05-06  1283  				 NULL);
448b4482c6713c Andrew Lunn       2015-05-06  1284  
4cfbf09cf97f26 Vivien Didelot    2017-08-05  1285  	SET_NETDEV_DEV(slave_dev, port->ds->dev);
4cfbf09cf97f26 Vivien Didelot    2017-08-05  1286  	slave_dev->dev.of_node = port->dn;
5075314e4e4b55 Alexander Duyck   2014-09-15  1287  	slave_dev->vlan_features = master->vlan_features;
5075314e4e4b55 Alexander Duyck   2014-09-15  1288  
5075314e4e4b55 Alexander Duyck   2014-09-15  1289  	p = netdev_priv(slave_dev);
5f6b4e14cada6d Florian Fainelli  2017-08-03  1290  	p->stats64 = netdev_alloc_pcpu_stats(struct pcpu_sw_netstats);
5f6b4e14cada6d Florian Fainelli  2017-08-03  1291  	if (!p->stats64) {
5f6b4e14cada6d Florian Fainelli  2017-08-03  1292  		free_netdev(slave_dev);
5f6b4e14cada6d Florian Fainelli  2017-08-03  1293  		return -ENOMEM;
5f6b4e14cada6d Florian Fainelli  2017-08-03  1294  	}
4cfbf09cf97f26 Vivien Didelot    2017-08-05  1295  	p->dp = port;
f50f212749e8a2 Florian Fainelli  2017-01-30  1296  	INIT_LIST_HEAD(&p->mall_tc_list);
39a7f2a4eb496c Andrew Lunn       2016-06-04  1297  	p->xmit = dst->tag_ops->xmit;
a293bdb3d53aac Frank Wunderlich  2018-06-30  1298  	p->master = master;
d442ad4ab1c86b Stephen Hemminger 2009-01-06  1299  
0d8bcdd383b886 Florian Fainelli  2014-08-27  1300  	p->old_pause = -1;
0d8bcdd383b886 Florian Fainelli  2014-08-27  1301  	p->old_link = -1;
0d8bcdd383b886 Florian Fainelli  2014-08-27  1302  	p->old_duplex = -1;
0d8bcdd383b886 Florian Fainelli  2014-08-27  1303  
4cfbf09cf97f26 Vivien Didelot    2017-08-05  1304  	port->netdev = slave_dev;
e804441cfe0b60 Florian Fainelli  2017-09-25  1305  
e804441cfe0b60 Florian Fainelli  2017-09-25  1306  	netif_carrier_off(slave_dev);
e804441cfe0b60 Florian Fainelli  2017-09-25  1307  
e804441cfe0b60 Florian Fainelli  2017-09-25  1308  	ret = dsa_slave_phy_setup(p, slave_dev);
e804441cfe0b60 Florian Fainelli  2017-09-25  1309  	if (ret) {
e804441cfe0b60 Florian Fainelli  2017-09-25  1310  		netdev_err(master, "error %d setting up slave phy\n", ret);
e804441cfe0b60 Florian Fainelli  2017-09-25  1311  		goto out_free;
e804441cfe0b60 Florian Fainelli  2017-09-25  1312  	}
e804441cfe0b60 Florian Fainelli  2017-09-25  1313  
91da11f870f00a Lennert Buytenhek 2008-10-07  1314  	ret = register_netdev(slave_dev);
91da11f870f00a Lennert Buytenhek 2008-10-07  1315  	if (ret) {
a2ae6007a442d6 Joe Perches       2014-11-09  1316  		netdev_err(master, "error %d registering interface %s\n",
a2ae6007a442d6 Joe Perches       2014-11-09  1317  			   ret, slave_dev->name);
e804441cfe0b60 Florian Fainelli  2017-09-25  1318  		goto out_phy;
91da11f870f00a Lennert Buytenhek 2008-10-07  1319  	}
91da11f870f00a Lennert Buytenhek 2008-10-07  1320  
e804441cfe0b60 Florian Fainelli  2017-09-25  1321  	return 0;
91da11f870f00a Lennert Buytenhek 2008-10-07  1322  
e804441cfe0b60 Florian Fainelli  2017-09-25  1323  out_phy:
e804441cfe0b60 Florian Fainelli  2017-09-25  1324  	phy_disconnect(p->phy);
e804441cfe0b60 Florian Fainelli  2017-09-25  1325  	if (of_phy_is_fixed_link(p->dp->dn))
e804441cfe0b60 Florian Fainelli  2017-09-25  1326  		of_phy_deregister_fixed_link(p->dp->dn);
e804441cfe0b60 Florian Fainelli  2017-09-25  1327  out_free:
5f6b4e14cada6d Florian Fainelli  2017-08-03  1328  	free_percpu(p->stats64);
0071f56e46dadb Andrew Lunn       2016-01-06  1329  	free_netdev(slave_dev);
e804441cfe0b60 Florian Fainelli  2017-09-25  1330  	port->netdev = NULL;
0071f56e46dadb Andrew Lunn       2016-01-06  1331  	return ret;
0071f56e46dadb Andrew Lunn       2016-01-06  1332  }
0071f56e46dadb Andrew Lunn       2016-01-06  1333  

:::::: The code at line 1256 was first introduced by commit
:::::: a29342e739115211615acc33616e547b2d3e0663 net: dsa: Associate slave network device with CPU port

:::::: TO: Florian Fainelli <f.fainelli@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
