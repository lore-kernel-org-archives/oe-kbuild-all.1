Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC5C2F5B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687268416; x=1718804416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nljyBPPRpkqDi+0NC8mMYPe+ALjklYZ8+CsrBUmt9F4=;
  b=SsYuWkg9wywSfJLRJ8mE7C8MJOWN7bt2ZerELKndqcQJECIfLiOCCfmx
   okgCQiJIO5fJI/fP81KmFDDgtLWxkPGXpyolWe6r6kvF6cvdeF5HVjUz8
   4VJ9EuGWOKA65tzon1IK5Yj4RmmAtmF6S6NlGdv6R/2CcqWLOrj4ONay6
   sTEylwbIxNPxcc7cprO8nUQzuGQpDb4WVI5so1anT9fg6mrMDaJ3lTkVg
   +PKFUu1wmz2Qa06QKSPF5mcsJKm6TkU5FntvA345/0IUB36YQpjajmrF1
   nEBsw0jNG6NLes70I1bqlJkp8A6Cfu7RfgzuaNSIQKreRtlm/+8OKM9nw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="425815265"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="425815265"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 06:40:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="838210755"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="838210755"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Jun 2023 06:40:14 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBbaf-0005um-25;
	Tue, 20 Jun 2023 13:40:13 +0000
Date: Tue, 20 Jun 2023 21:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9692/11071] drivers/s390/net/lcs.c:2150:
 undefined reference to `fddi_type_trans'
Message-ID: <202306202129.pl0AqK8G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9dbf40840551df336c95ce2a3adbdd25ed53c0ef
commit: 1282723361209d06fb1466ffb90e63b1161320b6 [9692/11071] s390/net: lcs: use IS_ENABLED() for kconfig detection
config: s390-randconfig-r016-20230620 (https://download.01.org/0day-ci/archive/20230620/202306202129.pl0AqK8G-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306202129.pl0AqK8G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306202129.pl0AqK8G-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/s390/net/lcs.o: in function `lcs_new_device':
>> drivers/s390/net/lcs.c:2150: undefined reference to `fddi_type_trans'
>> s390-linux-ld: drivers/s390/net/lcs.c:2151: undefined reference to `alloc_fddidev'


vim +2150 drivers/s390/net/lcs.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  2098  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2099  static int
^1da177e4c3f41 Linus Torvalds      2005-04-16  2100  lcs_new_device(struct ccwgroup_device *ccwgdev)
^1da177e4c3f41 Linus Torvalds      2005-04-16  2101  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2102  	struct  lcs_card *card;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2103  	struct net_device *dev=NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2104  	enum lcs_dev_states recover_state;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2105  	int rc;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2106  
dff59b64af94dc Greg Kroah-Hartman  2009-05-04  2107  	card = dev_get_drvdata(&ccwgdev->dev);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2108  	if (!card)
^1da177e4c3f41 Linus Torvalds      2005-04-16  2109  		return -ENODEV;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2110  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2111  	LCS_DBF_TEXT(2, setup, "newdev");
^1da177e4c3f41 Linus Torvalds      2005-04-16  2112  	LCS_DBF_HEX(3, setup, &card, sizeof(void*));
^1da177e4c3f41 Linus Torvalds      2005-04-16  2113  	card->read.ccwdev  = ccwgdev->cdev[0];
^1da177e4c3f41 Linus Torvalds      2005-04-16  2114  	card->write.ccwdev = ccwgdev->cdev[1];
^1da177e4c3f41 Linus Torvalds      2005-04-16  2115  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2116  	recover_state = card->state;
d816d4238245b0 Klaus-Dieter Wacker 2009-10-14  2117  	rc = ccw_device_set_online(card->read.ccwdev);
d816d4238245b0 Klaus-Dieter Wacker 2009-10-14  2118  	if (rc)
d816d4238245b0 Klaus-Dieter Wacker 2009-10-14  2119  		goto out_err;
d816d4238245b0 Klaus-Dieter Wacker 2009-10-14  2120  	rc = ccw_device_set_online(card->write.ccwdev);
d816d4238245b0 Klaus-Dieter Wacker 2009-10-14  2121  	if (rc)
d816d4238245b0 Klaus-Dieter Wacker 2009-10-14  2122  		goto out_werr;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2123  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2124  	LCS_DBF_TEXT(3, setup, "lcsnewdv");
^1da177e4c3f41 Linus Torvalds      2005-04-16  2125  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2126  	lcs_setup_card(card);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2127  	rc = lcs_detect(card);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2128  	if (rc) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2129  		LCS_DBF_TEXT(2, setup, "dtctfail");
89a2a8e76b8193 Peter Oberparleiter 2015-05-18  2130  		dev_err(&ccwgdev->dev,
c99fc5dadcd87e Klaus-D. Wacker     2008-12-25  2131  			"Detecting a network adapter for LCS devices"
c99fc5dadcd87e Klaus-D. Wacker     2008-12-25  2132  			" failed with rc=%d (0x%x)\n", rc, rc);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2133  		lcs_stopcard(card);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2134  		goto out;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2135  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2136  	if (card->dev) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2137  		LCS_DBF_TEXT(2, setup, "samedev");
^1da177e4c3f41 Linus Torvalds      2005-04-16  2138  		LCS_DBF_HEX(3, setup, &card, sizeof(void*));
^1da177e4c3f41 Linus Torvalds      2005-04-16  2139  		goto netdev_out;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2140  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2141  	switch (card->lan_type) {
1282723361209d Randy Dunlap        2023-06-15  2142  #if IS_ENABLED(CONFIG_ETHERNET)
^1da177e4c3f41 Linus Torvalds      2005-04-16  2143  	case LCS_FRAME_TYPE_ENET:
^1da177e4c3f41 Linus Torvalds      2005-04-16  2144  		card->lan_type_trans = eth_type_trans;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2145  		dev = alloc_etherdev(0);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2146  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2147  #endif
1282723361209d Randy Dunlap        2023-06-15  2148  #if IS_ENABLED(CONFIG_FDDI)
^1da177e4c3f41 Linus Torvalds      2005-04-16  2149  	case LCS_FRAME_TYPE_FDDI:
^1da177e4c3f41 Linus Torvalds      2005-04-16 @2150  		card->lan_type_trans = fddi_type_trans;
^1da177e4c3f41 Linus Torvalds      2005-04-16 @2151  		dev = alloc_fddidev(0);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2152  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2153  #endif
^1da177e4c3f41 Linus Torvalds      2005-04-16  2154  	default:
^1da177e4c3f41 Linus Torvalds      2005-04-16  2155  		LCS_DBF_TEXT(3, setup, "errinit");
c99fc5dadcd87e Klaus-D. Wacker     2008-12-25  2156  		pr_err(" Initialization failed\n");
^1da177e4c3f41 Linus Torvalds      2005-04-16  2157  		goto out;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2158  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2159  	if (!dev)
^1da177e4c3f41 Linus Torvalds      2005-04-16  2160  		goto out;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2161  	card->dev = dev;
ad660e2f97e7dc Wang Chen           2008-12-06  2162  	card->dev->ml_priv = card;
0e0b46d80f8768 Frank Blaschka      2009-01-09  2163  	card->dev->netdev_ops = &lcs_netdev_ops;
71c4689780f8f3 Ursula Braun        2018-04-26  2164  	card->dev->dev_port = card->portno;
978bb0ae8b8309 Jakub Kicinski      2021-10-21  2165  	eth_hw_addr_set(card->dev, card->mac);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2166  #ifdef CONFIG_IP_MULTICAST
^1da177e4c3f41 Linus Torvalds      2005-04-16  2167  	if (!lcs_check_multicast_support(card))
0e0b46d80f8768 Frank Blaschka      2009-01-09  2168  		card->dev->netdev_ops = &lcs_mc_netdev_ops;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2169  #endif
b5f9d55b64a5c7 Frank Pavlic        2005-05-12  2170  netdev_out:
^1da177e4c3f41 Linus Torvalds      2005-04-16  2171  	lcs_set_allowed_threads(card,0xffffffff);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2172  	if (recover_state == DEV_STATE_RECOVER) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2173  		lcs_set_multicast_list(card->dev);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2174  		card->dev->flags |= IFF_UP;
27eb5ac8f01568 Klaus Wacker        2006-05-24  2175  		netif_carrier_on(card->dev);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2176  		netif_wake_queue(card->dev);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2177  		card->state = DEV_STATE_UP;
b5f9d55b64a5c7 Frank Pavlic        2005-05-12  2178  	} else {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2179  		lcs_stopcard(card);
b5f9d55b64a5c7 Frank Pavlic        2005-05-12  2180  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2181  
b5f9d55b64a5c7 Frank Pavlic        2005-05-12  2182  	if (lcs_register_netdev(ccwgdev) != 0)
b5f9d55b64a5c7 Frank Pavlic        2005-05-12  2183  		goto out;
b5f9d55b64a5c7 Frank Pavlic        2005-05-12  2184  
b5f9d55b64a5c7 Frank Pavlic        2005-05-12  2185  	/* Print out supported assists: IPv6 */
c99fc5dadcd87e Klaus-D. Wacker     2008-12-25  2186  	pr_info("LCS device %s %s IPv6 support\n", card->dev->name,
b5f9d55b64a5c7 Frank Pavlic        2005-05-12  2187  		(card->ip_assists_supported & LCS_IPASS_IPV6_SUPPORT) ?
b5f9d55b64a5c7 Frank Pavlic        2005-05-12  2188  		"with" : "without");
b5f9d55b64a5c7 Frank Pavlic        2005-05-12  2189  	/* Print out supported assist: Multicast */
c99fc5dadcd87e Klaus-D. Wacker     2008-12-25  2190  	pr_info("LCS device %s %s Multicast support\n", card->dev->name,
b5f9d55b64a5c7 Frank Pavlic        2005-05-12  2191  		(card->ip_assists_supported & LCS_IPASS_MULTICAST_SUPPORT) ?
b5f9d55b64a5c7 Frank Pavlic        2005-05-12  2192  		"with" : "without");
^1da177e4c3f41 Linus Torvalds      2005-04-16  2193  	return 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2194  out:
^1da177e4c3f41 Linus Torvalds      2005-04-16  2195  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2196  	ccw_device_set_offline(card->write.ccwdev);
d816d4238245b0 Klaus-Dieter Wacker 2009-10-14  2197  out_werr:
d816d4238245b0 Klaus-Dieter Wacker 2009-10-14  2198  	ccw_device_set_offline(card->read.ccwdev);
d816d4238245b0 Klaus-Dieter Wacker 2009-10-14  2199  out_err:
^1da177e4c3f41 Linus Torvalds      2005-04-16  2200  	return -ENODEV;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2201  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  2202  

:::::: The code at line 2150 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
