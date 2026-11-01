Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793506373;
	b=g/gWv8IoCDwohLksQOsSypTg59AnpUi6kANjJCjUkg1wpM/JPVbs+hb4aq3zzVqbXcB2
	 zraNFd0jp4efu5ujp89YUBKPgt/vMeKuR8EacN4efu0wmogItfTkh2XW+jOAvFVqeAF4G
	 gtxtWMfu5/X6rNwiK7H0LgGF6ypVW3Q7Eeh+Ezn98btRiSwo5QuYlGYaGiJ1A1MDviUww
	 llvWP97WAYj2yisgDa1u8zUjhaOyoB/jo5SJkQqWZzKfGefTLTPxcZkysYMvo7KlND9OP
	 X2Vu4O/htTE30Gfq84XVlo3PGq2XsVufxKUabgQ1QIM1qAUkT5qaHlExUSxDI2is4qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793506373;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=hO/+P3Td3wNwkEtYO2g/WJJ6jmuq7Ax6ILtBhBfgEDs=;
	b=tUYVa89mNph3djUXLRMKjVvH76p2Jl/2Fm+/uuBZ5HynfMZuDw0TLcQeODkW+PPaz7of
	 3eGdQKKE5acP0/yc8WD2zDQMevNoiB243cGNV69pOaMVRhqHluZaHcjDyL3U1+JZYgqo+
	 Au+ry5RLrddAKRWtgjV/XHwbDR6iUffs6g2dcUbEk0eq1/zJSiNKVPd3aJJA89lJ8sWlD
	 0OAT9sijf1FZKnm7cIMxjcXPjFuVFncNs258dUR+YqI2jMWsbXBY9oYj1nY8s7INuYBX5
	 s9tIA2dkEsMLtecFsE+zBZXvOl8HhVae2Z0vcRf+DJAQmh4xXzfaKq8QM9QA5dV8qTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="OAhf/R8b";
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59369606A329
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 04:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59369606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OAhf/R8b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793506371; x=1825042371;
  h=date:from:to:cc:subject:message-id;
  bh=yQbnzjl6gfov+6xQYnPIdCSLM8cNA2Q4v43h8G7cumE=;
  b=OAhf/R8b6nw/2O7PykbmQZHg5AxnoBBQCr0Bki2dHj1sYVOfpzK/r9tq
   mydq0S6jz4mpMisiG5pBZVGf/9VSOuMinbgH1S5zDZDWWoXU+eViSB1xl
   Jz+uc87VPmobDot4cheGd2D7IJs0JdQMAfBZp/pdpla1ozAbj9vblBweS
   fiVUHrEEjdRNteTMifkmxrvITRDZqquTfhH+5H5Yz8JxhLA+NyBv4E9xO
   Uf25WXunXMDiCGZrMwxeTYAUQp4ZK79K5Hxc4PgyRI4SHc1+N607PfiJX
   KOOchw7yO1R7+/oVg+0vdk326Tz/A0G2dVuJM5nh+b2GImJRwpOUC/Cy8
   g==;
X-CSE-ConnectionGUID: QR7OLxvLT3WSuhQYSth02g==
X-CSE-MsgGUID: K5xgjYfVSya8iKYuZSuxBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2118220"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2118220"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 21:12:49 -0700
X-CSE-ConnectionGUID: TEVf9u6qQTukRVP6Sarwrg==
X-CSE-MsgGUID: unOTJ3fuTWSGxYMo1+IRyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="7602324"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 31 Oct 2026 21:12:46 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNMw0-000000006KR-1HpF;
	Sun, 01 Nov 2026 04:12:44 +0000
Date: Sun, 01 Nov 2026 05:11:53 +0100
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>
Subject: 
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1494:24: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202611010511.Mk620DTd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
commit: 9a56a27e6002e29a6707dc4238d469ec84c3a68e net: stmmac: selftests: Pass the IP proto mask in the TC selftest
date:   9 weeks ago
config: hexagon-randconfig-r2309-20261101 (https://download.01.org/0day-ci/archive/20261101/202611010511.Mk620DTd-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8f6b51ca8bab1d49006ddaa042bc7e4e7306975d)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611010511.Mk620DTd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9a56a27e6002 ("net: stmmac: selftests: Pass the IP proto mask in the TC selftest")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611010511.Mk620DTd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1118:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] mask @@     got int @@
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1118:27: sparse:     expected restricted __be32 [usertype] mask
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1118:27: sparse:     got int
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1363:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [addressable] [usertype] src @@     got unsigned int [usertype] src_mask @@
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1363:18: sparse:     expected restricted __be32 [addressable] [usertype] src
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1363:18: sparse:     got unsigned int [usertype] src_mask
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1364:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [addressable] [usertype] dst @@     got unsigned int [usertype] dst_mask @@
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1364:18: sparse:     expected restricted __be32 [addressable] [usertype] dst
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1364:18: sparse:     got unsigned int [usertype] dst_mask
>> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1494:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [addressable] [assigned] [usertype] src @@     got unsigned int [usertype] src_mask @@
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1494:24: sparse:     expected restricted __be16 [addressable] [assigned] [usertype] src
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1494:24: sparse:     got unsigned int [usertype] src_mask
>> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1495:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [addressable] [assigned] [usertype] dst @@     got unsigned int [usertype] dst_mask @@
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1495:24: sparse:     expected restricted __be16 [addressable] [assigned] [usertype] dst
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1495:24: sparse:     got unsigned int [usertype] dst_mask

vim +1494 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c

4647e021193d63 Jose Abreu        2019-09-04  1427  
4647e021193d63 Jose Abreu        2019-09-04  1428  #ifdef CONFIG_NET_CLS_ACT
4647e021193d63 Jose Abreu        2019-09-04  1429  static int __stmmac_test_l4filt(struct stmmac_priv *priv, u32 dst, u32 src,
4647e021193d63 Jose Abreu        2019-09-04  1430  				u32 dst_mask, u32 src_mask, bool udp)
4647e021193d63 Jose Abreu        2019-09-04  1431  {
4647e021193d63 Jose Abreu        2019-09-04  1432  	struct {
4647e021193d63 Jose Abreu        2019-09-04  1433  		struct flow_dissector_key_basic bkey;
4647e021193d63 Jose Abreu        2019-09-04  1434  		struct flow_dissector_key_ports key;
9a56a27e6002e2 Maxime Chevallier 2026-08-25  1435  	} __aligned(BITS_PER_LONG / 8) keys = { };
4647e021193d63 Jose Abreu        2019-09-04  1436  	struct {
4647e021193d63 Jose Abreu        2019-09-04  1437  		struct flow_dissector_key_basic bmask;
4647e021193d63 Jose Abreu        2019-09-04  1438  		struct flow_dissector_key_ports mask;
9a56a27e6002e2 Maxime Chevallier 2026-08-25  1439  	} __aligned(BITS_PER_LONG / 8) masks = { };
4647e021193d63 Jose Abreu        2019-09-04  1440  	unsigned long dummy_cookie = 0xdeadbeef;
4647e021193d63 Jose Abreu        2019-09-04  1441  	struct stmmac_packet_attrs attr = { };
4647e021193d63 Jose Abreu        2019-09-04  1442  	struct flow_dissector *dissector;
4647e021193d63 Jose Abreu        2019-09-04  1443  	struct flow_cls_offload *cls;
e715d745043529 Jose Abreu        2020-01-10  1444  	int ret, old_enable = 0;
4647e021193d63 Jose Abreu        2019-09-04  1445  	struct flow_rule *rule;
4647e021193d63 Jose Abreu        2019-09-04  1446  
4647e021193d63 Jose Abreu        2019-09-04  1447  	if (!tc_can_offload(priv->dev))
4647e021193d63 Jose Abreu        2019-09-04  1448  		return -EOPNOTSUPP;
4647e021193d63 Jose Abreu        2019-09-04  1449  	if (!priv->dma_cap.l3l4fnum)
4647e021193d63 Jose Abreu        2019-09-04  1450  		return -EOPNOTSUPP;
e715d745043529 Jose Abreu        2020-01-10  1451  	if (priv->rss.enable) {
e715d745043529 Jose Abreu        2020-01-10  1452  		old_enable = priv->rss.enable;
e715d745043529 Jose Abreu        2020-01-10  1453  		priv->rss.enable = false;
b6b6cc9acd7b99 Arnd Bergmann     2019-09-19  1454  		stmmac_rss_configure(priv, priv->hw, NULL,
4647e021193d63 Jose Abreu        2019-09-04  1455  				     priv->plat->rx_queues_to_use);
e715d745043529 Jose Abreu        2020-01-10  1456  	}
4647e021193d63 Jose Abreu        2019-09-04  1457  
bf4afc53b77aea Linus Torvalds    2026-02-21  1458  	dissector = kzalloc_obj(*dissector);
4647e021193d63 Jose Abreu        2019-09-04  1459  	if (!dissector) {
4647e021193d63 Jose Abreu        2019-09-04  1460  		ret = -ENOMEM;
4647e021193d63 Jose Abreu        2019-09-04  1461  		goto cleanup_rss;
4647e021193d63 Jose Abreu        2019-09-04  1462  	}
4647e021193d63 Jose Abreu        2019-09-04  1463  
2b3082c6ef3b01 Ratheesh Kannoth  2023-07-29  1464  	dissector->used_keys |= (1ULL << FLOW_DISSECTOR_KEY_BASIC);
2b3082c6ef3b01 Ratheesh Kannoth  2023-07-29  1465  	dissector->used_keys |= (1ULL << FLOW_DISSECTOR_KEY_PORTS);
4647e021193d63 Jose Abreu        2019-09-04  1466  	dissector->offset[FLOW_DISSECTOR_KEY_BASIC] = 0;
4647e021193d63 Jose Abreu        2019-09-04  1467  	dissector->offset[FLOW_DISSECTOR_KEY_PORTS] = offsetof(typeof(keys), key);
4647e021193d63 Jose Abreu        2019-09-04  1468  
bf4afc53b77aea Linus Torvalds    2026-02-21  1469  	cls = kzalloc_obj(*cls);
4647e021193d63 Jose Abreu        2019-09-04  1470  	if (!cls) {
4647e021193d63 Jose Abreu        2019-09-04  1471  		ret = -ENOMEM;
4647e021193d63 Jose Abreu        2019-09-04  1472  		goto cleanup_dissector;
4647e021193d63 Jose Abreu        2019-09-04  1473  	}
4647e021193d63 Jose Abreu        2019-09-04  1474  
4647e021193d63 Jose Abreu        2019-09-04  1475  	cls->common.chain_index = 0;
4647e021193d63 Jose Abreu        2019-09-04  1476  	cls->command = FLOW_CLS_REPLACE;
4647e021193d63 Jose Abreu        2019-09-04  1477  	cls->cookie = dummy_cookie;
4647e021193d63 Jose Abreu        2019-09-04  1478  
323bbfcf1ef883 Linus Torvalds    2026-02-21  1479  	rule = kzalloc_flex(*rule, action.entries, 1);
4647e021193d63 Jose Abreu        2019-09-04  1480  	if (!rule) {
4647e021193d63 Jose Abreu        2019-09-04  1481  		ret = -ENOMEM;
4647e021193d63 Jose Abreu        2019-09-04  1482  		goto cleanup_cls;
4647e021193d63 Jose Abreu        2019-09-04  1483  	}
4647e021193d63 Jose Abreu        2019-09-04  1484  
4647e021193d63 Jose Abreu        2019-09-04  1485  	rule->match.dissector = dissector;
4647e021193d63 Jose Abreu        2019-09-04  1486  	rule->match.key = (void *)&keys;
4647e021193d63 Jose Abreu        2019-09-04  1487  	rule->match.mask = (void *)&masks;
4647e021193d63 Jose Abreu        2019-09-04  1488  
4647e021193d63 Jose Abreu        2019-09-04  1489  	keys.bkey.ip_proto = udp ? IPPROTO_UDP : IPPROTO_TCP;
4647e021193d63 Jose Abreu        2019-09-04  1490  	keys.key.src = htons(src);
4647e021193d63 Jose Abreu        2019-09-04  1491  	keys.key.dst = htons(dst);
9a56a27e6002e2 Maxime Chevallier 2026-08-25  1492  	/* Match the full IP proto field */
9a56a27e6002e2 Maxime Chevallier 2026-08-25  1493  	masks.bmask.ip_proto = 0xff;
4647e021193d63 Jose Abreu        2019-09-04 @1494  	masks.mask.src = src_mask;
4647e021193d63 Jose Abreu        2019-09-04 @1495  	masks.mask.dst = dst_mask;
4647e021193d63 Jose Abreu        2019-09-04  1496  
4647e021193d63 Jose Abreu        2019-09-04  1497  	cls->rule = rule;
4647e021193d63 Jose Abreu        2019-09-04  1498  
4647e021193d63 Jose Abreu        2019-09-04  1499  	rule->action.entries[0].id = FLOW_ACTION_DROP;
0dfb2d82af4cd7 Jakub Kicinski    2020-03-19  1500  	rule->action.entries[0].hw_stats = FLOW_ACTION_HW_STATS_ANY;
4647e021193d63 Jose Abreu        2019-09-04  1501  	rule->action.num_entries = 1;
4647e021193d63 Jose Abreu        2019-09-04  1502  
4647e021193d63 Jose Abreu        2019-09-04  1503  	attr.dst = priv->dev->dev_addr;
4647e021193d63 Jose Abreu        2019-09-04  1504  	attr.tcp = !udp;
4647e021193d63 Jose Abreu        2019-09-04  1505  	attr.sport = src;
4647e021193d63 Jose Abreu        2019-09-04  1506  	attr.dport = dst;
4647e021193d63 Jose Abreu        2019-09-04  1507  	attr.ip_dst = 0;
4647e021193d63 Jose Abreu        2019-09-04  1508  
4647e021193d63 Jose Abreu        2019-09-04  1509  	/* Shall receive packet */
4647e021193d63 Jose Abreu        2019-09-04  1510  	ret = __stmmac_test_loopback(priv, &attr);
4647e021193d63 Jose Abreu        2019-09-04  1511  	if (ret)
4647e021193d63 Jose Abreu        2019-09-04  1512  		goto cleanup_rule;
4647e021193d63 Jose Abreu        2019-09-04  1513  
4647e021193d63 Jose Abreu        2019-09-04  1514  	ret = stmmac_tc_setup_cls(priv, priv, cls);
4647e021193d63 Jose Abreu        2019-09-04  1515  	if (ret)
4647e021193d63 Jose Abreu        2019-09-04  1516  		goto cleanup_rule;
4647e021193d63 Jose Abreu        2019-09-04  1517  
4647e021193d63 Jose Abreu        2019-09-04  1518  	/* Shall NOT receive packet */
4647e021193d63 Jose Abreu        2019-09-04  1519  	ret = __stmmac_test_loopback(priv, &attr);
4647e021193d63 Jose Abreu        2019-09-04  1520  	ret = ret ? 0 : -EINVAL;
4647e021193d63 Jose Abreu        2019-09-04  1521  
4647e021193d63 Jose Abreu        2019-09-04  1522  	cls->command = FLOW_CLS_DESTROY;
4647e021193d63 Jose Abreu        2019-09-04  1523  	stmmac_tc_setup_cls(priv, priv, cls);
4647e021193d63 Jose Abreu        2019-09-04  1524  cleanup_rule:
4647e021193d63 Jose Abreu        2019-09-04  1525  	kfree(rule);
4647e021193d63 Jose Abreu        2019-09-04  1526  cleanup_cls:
4647e021193d63 Jose Abreu        2019-09-04  1527  	kfree(cls);
4647e021193d63 Jose Abreu        2019-09-04  1528  cleanup_dissector:
4647e021193d63 Jose Abreu        2019-09-04  1529  	kfree(dissector);
4647e021193d63 Jose Abreu        2019-09-04  1530  cleanup_rss:
e715d745043529 Jose Abreu        2020-01-10  1531  	if (old_enable) {
e715d745043529 Jose Abreu        2020-01-10  1532  		priv->rss.enable = old_enable;
4647e021193d63 Jose Abreu        2019-09-04  1533  		stmmac_rss_configure(priv, priv->hw, &priv->rss,
4647e021193d63 Jose Abreu        2019-09-04  1534  				     priv->plat->rx_queues_to_use);
4647e021193d63 Jose Abreu        2019-09-04  1535  	}
4647e021193d63 Jose Abreu        2019-09-04  1536  
4647e021193d63 Jose Abreu        2019-09-04  1537  	return ret;
4647e021193d63 Jose Abreu        2019-09-04  1538  }
4647e021193d63 Jose Abreu        2019-09-04  1539  #else
4647e021193d63 Jose Abreu        2019-09-04  1540  static int __stmmac_test_l4filt(struct stmmac_priv *priv, u32 dst, u32 src,
4647e021193d63 Jose Abreu        2019-09-04  1541  				u32 dst_mask, u32 src_mask, bool udp)
4647e021193d63 Jose Abreu        2019-09-04  1542  {
4647e021193d63 Jose Abreu        2019-09-04  1543  	return -EOPNOTSUPP;
4647e021193d63 Jose Abreu        2019-09-04  1544  }
4647e021193d63 Jose Abreu        2019-09-04  1545  #endif
4647e021193d63 Jose Abreu        2019-09-04  1546  

:::::: The code at line 1494 was first introduced by commit
:::::: 4647e021193d638d3c87d1f1b9a5f7f7a48f36a3 net: stmmac: selftests: Add selftest for L3/L4 Filters

:::::: TO: Jose Abreu <Jose.Abreu@synopsys.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
