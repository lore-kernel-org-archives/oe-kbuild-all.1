Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A5B657
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 22:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686869526; x=1718405526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CPQRxfyezC9q63kj1ORxRAH6U4FrtOnigrTYdC8jhF0=;
  b=aYZ3FKEjKcENKVWwW/Z9Zr74paE/lweEbmAuOB5+kAK/eKNHOb0reIYh
   lw4mh7z7FLM8b6ckddrnGf0b1rKFF6VxLJ1gcBk1029D+rG5OWpKgfyu6
   WCfnQ77VAqpW/YZGp+duLXLu7Qq/pWkY4XzxGECbmSzssMyY7eVhn5yGJ
   LRVLpK98W9emXSwnyd0jzua6vvMYK/yiWZz4kA2jhfYEQEHSPzdYBmX94
   elBrbexLIrMciQbLdVVYdn7VeTlF7tDxr3LYoefVK6syad4GnVvsvQhdu
   +wuQA383e1ibHlImPYXgLyLkhxmuclwKT/f6FYanxXIv7w3UIILFIRH7W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445441790"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="445441790"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 15:52:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="662946412"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="662946412"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Jun 2023 15:51:54 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9voo-0000UX-0O;
	Thu, 15 Jun 2023 22:51:54 +0000
Date: Fri, 16 Jun 2023 06:51:19 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <simon.horman@corigine.com>,
	David Ahern <dsahern@kernel.org>
Subject: [linux-next:master 8208/10326]
 drivers/net/ethernet/sun/sunvnet_common.c:1277:16: error: implicit
 declaration of function 'skb_gso_segment'; did you mean 'skb_gso_reset'?
Message-ID: <202306160617.QUItIANP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   925294c9aa184801cc0a451b69a18dd0fe7d847d
commit: d457a0e329b0bfd3a1450e0b1a18cd2b47a25a08 [8208/10326] net: move gso declarations and functions to their own files
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230616/202306160617.QUItIANP-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d457a0e329b0bfd3a1450e0b1a18cd2b47a25a08
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d457a0e329b0bfd3a1450e0b1a18cd2b47a25a08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306160617.QUItIANP-lkp@intel.com/

Note: the linux-next/master HEAD 925294c9aa184801cc0a451b69a18dd0fe7d847d builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/net/ethernet/sun/sunvnet_common.c: In function 'vnet_handle_offloads':
>> drivers/net/ethernet/sun/sunvnet_common.c:1277:16: error: implicit declaration of function 'skb_gso_segment'; did you mean 'skb_gso_reset'? [-Werror=implicit-function-declaration]
    1277 |         segs = skb_gso_segment(skb, dev->features & ~NETIF_F_TSO);
         |                ^~~~~~~~~~~~~~~
         |                skb_gso_reset
   drivers/net/ethernet/sun/sunvnet_common.c:1277:14: warning: assignment to 'struct sk_buff *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1277 |         segs = skb_gso_segment(skb, dev->features & ~NETIF_F_TSO);
         |              ^
   cc1: some warnings being treated as errors


vim +1277 drivers/net/ethernet/sun/sunvnet_common.c

31762eaa0d0804 Aaron Young        2016-03-15  1218  
0e0cc31f6999df YueHaibing         2018-09-19  1219  static netdev_tx_t
0e0cc31f6999df YueHaibing         2018-09-19  1220  vnet_handle_offloads(struct vnet_port *port, struct sk_buff *skb,
67d0719f06ded9 Aaron Young        2016-03-15  1221  		     struct vnet_port *(*vnet_tx_port)
67d0719f06ded9 Aaron Young        2016-03-15  1222  		     (struct sk_buff *, struct net_device *))
31762eaa0d0804 Aaron Young        2016-03-15  1223  {
67d0719f06ded9 Aaron Young        2016-03-15  1224  	struct net_device *dev = VNET_PORT_TO_NET_DEVICE(port);
31762eaa0d0804 Aaron Young        2016-03-15  1225  	struct vio_dring_state *dr = &port->vio.drings[VIO_DRIVER_TX_RING];
90919f14507b7a Jason A. Donenfeld 2020-01-08  1226  	struct sk_buff *segs, *curr, *next;
31762eaa0d0804 Aaron Young        2016-03-15  1227  	int maclen, datalen;
31762eaa0d0804 Aaron Young        2016-03-15  1228  	int status;
31762eaa0d0804 Aaron Young        2016-03-15  1229  	int gso_size, gso_type, gso_segs;
31762eaa0d0804 Aaron Young        2016-03-15  1230  	int hlen = skb_transport_header(skb) - skb_mac_header(skb);
31762eaa0d0804 Aaron Young        2016-03-15  1231  	int proto = IPPROTO_IP;
31762eaa0d0804 Aaron Young        2016-03-15  1232  
31762eaa0d0804 Aaron Young        2016-03-15  1233  	if (skb->protocol == htons(ETH_P_IP))
31762eaa0d0804 Aaron Young        2016-03-15  1234  		proto = ip_hdr(skb)->protocol;
31762eaa0d0804 Aaron Young        2016-03-15  1235  	else if (skb->protocol == htons(ETH_P_IPV6))
31762eaa0d0804 Aaron Young        2016-03-15  1236  		proto = ipv6_hdr(skb)->nexthdr;
31762eaa0d0804 Aaron Young        2016-03-15  1237  
dc153f850daba6 Aaron Young        2016-03-15  1238  	if (proto == IPPROTO_TCP) {
31762eaa0d0804 Aaron Young        2016-03-15  1239  		hlen += tcp_hdr(skb)->doff * 4;
dc153f850daba6 Aaron Young        2016-03-15  1240  	} else if (proto == IPPROTO_UDP) {
31762eaa0d0804 Aaron Young        2016-03-15  1241  		hlen += sizeof(struct udphdr);
dc153f850daba6 Aaron Young        2016-03-15  1242  	} else {
31762eaa0d0804 Aaron Young        2016-03-15  1243  		pr_err("vnet_handle_offloads GSO with unknown transport "
31762eaa0d0804 Aaron Young        2016-03-15  1244  		       "protocol %d tproto %d\n", skb->protocol, proto);
31762eaa0d0804 Aaron Young        2016-03-15  1245  		hlen = 128; /* XXX */
31762eaa0d0804 Aaron Young        2016-03-15  1246  	}
31762eaa0d0804 Aaron Young        2016-03-15  1247  	datalen = port->tsolen - hlen;
31762eaa0d0804 Aaron Young        2016-03-15  1248  
31762eaa0d0804 Aaron Young        2016-03-15  1249  	gso_size = skb_shinfo(skb)->gso_size;
31762eaa0d0804 Aaron Young        2016-03-15  1250  	gso_type = skb_shinfo(skb)->gso_type;
31762eaa0d0804 Aaron Young        2016-03-15  1251  	gso_segs = skb_shinfo(skb)->gso_segs;
31762eaa0d0804 Aaron Young        2016-03-15  1252  
31762eaa0d0804 Aaron Young        2016-03-15  1253  	if (port->tso && gso_size < datalen)
31762eaa0d0804 Aaron Young        2016-03-15  1254  		gso_segs = DIV_ROUND_UP(skb->len - hlen, datalen);
31762eaa0d0804 Aaron Young        2016-03-15  1255  
31762eaa0d0804 Aaron Young        2016-03-15  1256  	if (unlikely(vnet_tx_dring_avail(dr) < gso_segs)) {
31762eaa0d0804 Aaron Young        2016-03-15  1257  		struct netdev_queue *txq;
31762eaa0d0804 Aaron Young        2016-03-15  1258  
31762eaa0d0804 Aaron Young        2016-03-15  1259  		txq  = netdev_get_tx_queue(dev, port->q_index);
31762eaa0d0804 Aaron Young        2016-03-15  1260  		netif_tx_stop_queue(txq);
31762eaa0d0804 Aaron Young        2016-03-15  1261  		if (vnet_tx_dring_avail(dr) < skb_shinfo(skb)->gso_segs)
31762eaa0d0804 Aaron Young        2016-03-15  1262  			return NETDEV_TX_BUSY;
31762eaa0d0804 Aaron Young        2016-03-15  1263  		netif_tx_wake_queue(txq);
31762eaa0d0804 Aaron Young        2016-03-15  1264  	}
31762eaa0d0804 Aaron Young        2016-03-15  1265  
31762eaa0d0804 Aaron Young        2016-03-15  1266  	maclen = skb_network_header(skb) - skb_mac_header(skb);
31762eaa0d0804 Aaron Young        2016-03-15  1267  	skb_pull(skb, maclen);
31762eaa0d0804 Aaron Young        2016-03-15  1268  
31762eaa0d0804 Aaron Young        2016-03-15  1269  	if (port->tso && gso_size < datalen) {
31762eaa0d0804 Aaron Young        2016-03-15  1270  		if (skb_unclone(skb, GFP_ATOMIC))
31762eaa0d0804 Aaron Young        2016-03-15  1271  			goto out_dropped;
31762eaa0d0804 Aaron Young        2016-03-15  1272  
31762eaa0d0804 Aaron Young        2016-03-15  1273  		/* segment to TSO size */
31762eaa0d0804 Aaron Young        2016-03-15  1274  		skb_shinfo(skb)->gso_size = datalen;
31762eaa0d0804 Aaron Young        2016-03-15  1275  		skb_shinfo(skb)->gso_segs = gso_segs;
31762eaa0d0804 Aaron Young        2016-03-15  1276  	}
31762eaa0d0804 Aaron Young        2016-03-15 @1277  	segs = skb_gso_segment(skb, dev->features & ~NETIF_F_TSO);
31762eaa0d0804 Aaron Young        2016-03-15  1278  	if (IS_ERR(segs))
31762eaa0d0804 Aaron Young        2016-03-15  1279  		goto out_dropped;
31762eaa0d0804 Aaron Young        2016-03-15  1280  
31762eaa0d0804 Aaron Young        2016-03-15  1281  	skb_push(skb, maclen);
31762eaa0d0804 Aaron Young        2016-03-15  1282  	skb_reset_mac_header(skb);
31762eaa0d0804 Aaron Young        2016-03-15  1283  
31762eaa0d0804 Aaron Young        2016-03-15  1284  	status = 0;
90919f14507b7a Jason A. Donenfeld 2020-01-08  1285  	skb_list_walk_safe(segs, curr, next) {
90919f14507b7a Jason A. Donenfeld 2020-01-08  1286  		skb_mark_not_on_list(curr);
31762eaa0d0804 Aaron Young        2016-03-15  1287  		if (port->tso && curr->len > dev->mtu) {
31762eaa0d0804 Aaron Young        2016-03-15  1288  			skb_shinfo(curr)->gso_size = gso_size;
31762eaa0d0804 Aaron Young        2016-03-15  1289  			skb_shinfo(curr)->gso_type = gso_type;
31762eaa0d0804 Aaron Young        2016-03-15  1290  			skb_shinfo(curr)->gso_segs =
31762eaa0d0804 Aaron Young        2016-03-15  1291  				DIV_ROUND_UP(curr->len - hlen, gso_size);
dc153f850daba6 Aaron Young        2016-03-15  1292  		} else {
31762eaa0d0804 Aaron Young        2016-03-15  1293  			skb_shinfo(curr)->gso_size = 0;
dc153f850daba6 Aaron Young        2016-03-15  1294  		}
31762eaa0d0804 Aaron Young        2016-03-15  1295  
31762eaa0d0804 Aaron Young        2016-03-15  1296  		skb_push(curr, maclen);
31762eaa0d0804 Aaron Young        2016-03-15  1297  		skb_reset_mac_header(curr);
31762eaa0d0804 Aaron Young        2016-03-15  1298  		memcpy(skb_mac_header(curr), skb_mac_header(skb),
31762eaa0d0804 Aaron Young        2016-03-15  1299  		       maclen);
31762eaa0d0804 Aaron Young        2016-03-15  1300  		curr->csum_start = skb_transport_header(curr) - curr->head;
31762eaa0d0804 Aaron Young        2016-03-15  1301  		if (ip_hdr(curr)->protocol == IPPROTO_TCP)
31762eaa0d0804 Aaron Young        2016-03-15  1302  			curr->csum_offset = offsetof(struct tcphdr, check);
31762eaa0d0804 Aaron Young        2016-03-15  1303  		else if (ip_hdr(curr)->protocol == IPPROTO_UDP)
31762eaa0d0804 Aaron Young        2016-03-15  1304  			curr->csum_offset = offsetof(struct udphdr, check);
31762eaa0d0804 Aaron Young        2016-03-15  1305  
31762eaa0d0804 Aaron Young        2016-03-15  1306  		if (!(status & NETDEV_TX_MASK))
67d0719f06ded9 Aaron Young        2016-03-15  1307  			status = sunvnet_start_xmit_common(curr, dev,
67d0719f06ded9 Aaron Young        2016-03-15  1308  							   vnet_tx_port);
31762eaa0d0804 Aaron Young        2016-03-15  1309  		if (status & NETDEV_TX_MASK)
31762eaa0d0804 Aaron Young        2016-03-15  1310  			dev_kfree_skb_any(curr);
31762eaa0d0804 Aaron Young        2016-03-15  1311  	}
31762eaa0d0804 Aaron Young        2016-03-15  1312  
31762eaa0d0804 Aaron Young        2016-03-15  1313  	if (!(status & NETDEV_TX_MASK))
31762eaa0d0804 Aaron Young        2016-03-15  1314  		dev_kfree_skb_any(skb);
31762eaa0d0804 Aaron Young        2016-03-15  1315  	return status;
31762eaa0d0804 Aaron Young        2016-03-15  1316  out_dropped:
31762eaa0d0804 Aaron Young        2016-03-15  1317  	dev->stats.tx_dropped++;
31762eaa0d0804 Aaron Young        2016-03-15  1318  	dev_kfree_skb_any(skb);
31762eaa0d0804 Aaron Young        2016-03-15  1319  	return NETDEV_TX_OK;
31762eaa0d0804 Aaron Young        2016-03-15  1320  }
31762eaa0d0804 Aaron Young        2016-03-15  1321  

:::::: The code at line 1277 was first introduced by commit
:::::: 31762eaa0d0804d34e297daad57cda45cbc6c961 ldmvsw: Split sunvnet driver into common code

:::::: TO: Aaron Young <aaron.young@oracle.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
