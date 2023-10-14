Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACE815B8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 12:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bx4/S6Yp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697285728; x=1728821728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L3Ovc4auYD06GQXpB2632UsOyBc8NVV0ZQY7CfVl1YQ=;
  b=Bx4/S6Yprkx8PVyHZVQW65NCwfho//Rchg0f3HjIVwkQVha2lA8Cbap3
   zRglfp4A6YjNaheB3S52+jC25oSmK7Bosd+lMtCT7W2V1pGZiaLLyelYC
   CPQeP8xw49lm2mRG5eKfI7zOwE78x/hp0v0gczjxpYsEhTIC+8J0bI38L
   C6SZH3x4VUNiAnef/mgxmBx7kp4F5G68s5jeE/EeDMQLldgzgj36xHWhN
   utcpK6XNXePyHn3tZOnw+AHNGhwCzHS4MMLY7F14CASxnxJJzNzUeAXvb
   6d5Dd84cx9PH5WnhkyEvYDG7k/q3C2wv6r/+p2/s6NDa4cF5vhoi2RhLt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="384191582"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="384191582"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 05:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="758787407"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="758787407"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2023 05:15:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrdYB-00069V-2O;
	Sat, 14 Oct 2023 12:15:23 +0000
Date: Sat, 14 Oct 2023 20:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pablo-gtp:main 8/11] drivers/net/gtp.c:1197:45: sparse: sparse:
 incorrect type in argument 9 (different base types)
Message-ID: <202310142009.vKJll0Uf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git main
head:   230b7c1e9db7fcb2b796845017ce64f35e7430f1
commit: cb1bf181ddcc4a7f28deb5cde00e14ed37b7c3d9 [8/11] gtp: remove IPv4 and IPv6 header from context object
config: i386-randconfig-062-20231014 (https://download.01.org/0day-ci/archive/20231014/202310142009.vKJll0Uf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142009.vKJll0Uf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142009.vKJll0Uf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/gtp.c:1197:45: sparse: sparse: incorrect type in argument 9 (different base types) @@     expected restricted __be32 [usertype] label @@     got unsigned char [addressable] [usertype] tos @@
   drivers/net/gtp.c:1197:45: sparse:     expected restricted __be32 [usertype] label
   drivers/net/gtp.c:1197:45: sparse:     got unsigned char [addressable] [usertype] tos

vim +1197 drivers/net/gtp.c

  1148	
  1149	static netdev_tx_t gtp_dev_xmit(struct sk_buff *skb, struct net_device *dev)
  1150	{
  1151		unsigned int proto = ntohs(skb->protocol);
  1152		struct gtp_pktinfo pktinfo;
  1153		int err;
  1154	
  1155		/* Ensure there is sufficient headroom. */
  1156		if (skb_cow_head(skb, dev->needed_headroom))
  1157			goto tx_err;
  1158	
  1159		skb_reset_inner_headers(skb);
  1160	
  1161		/* PDP context lookups in gtp_build_skb_*() need rcu read-side lock. */
  1162		rcu_read_lock();
  1163		switch (proto) {
  1164		case ETH_P_IP:
  1165			err = gtp_build_skb_ip4(skb, dev, &pktinfo);
  1166			break;
  1167		case ETH_P_IPV6:
  1168			err = gtp_build_skb_ip6(skb, dev, &pktinfo);
  1169			break;
  1170		default:
  1171			err = -EOPNOTSUPP;
  1172			break;
  1173		}
  1174		rcu_read_unlock();
  1175	
  1176		if (err < 0)
  1177			goto tx_err;
  1178	
  1179		switch (proto) {
  1180		case ETH_P_IP:
  1181			udp_tunnel_xmit_skb(pktinfo.rt, pktinfo.sk, skb,
  1182					    pktinfo.fl4.saddr, pktinfo.fl4.daddr,
  1183					    pktinfo.tos,
  1184					    ip4_dst_hoplimit(&pktinfo.rt->dst),
  1185					    0,
  1186					    pktinfo.gtph_port, pktinfo.gtph_port,
  1187					    !net_eq(sock_net(pktinfo.pctx->sk),
  1188						    dev_net(dev)),
  1189					    false);
  1190			break;
  1191		case ETH_P_IPV6:
  1192	#if IS_ENABLED(CONFIG_IPV6)
  1193			udp_tunnel6_xmit_skb(&pktinfo.rt6->dst, pktinfo.sk, skb, dev,
  1194					     &pktinfo.fl6.saddr, &pktinfo.fl6.daddr,
  1195					     0,
  1196					     ip6_dst_hoplimit(&pktinfo.rt->dst),
> 1197					     pktinfo.tos,
  1198					     pktinfo.gtph_port, pktinfo.gtph_port,
  1199					     false);
  1200	#else
  1201			goto tx_err;
  1202	#endif
  1203			break;
  1204		}
  1205	
  1206		return NETDEV_TX_OK;
  1207	tx_err:
  1208		dev->stats.tx_errors++;
  1209		dev_kfree_skb(skb);
  1210		return NETDEV_TX_OK;
  1211	}
  1212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
