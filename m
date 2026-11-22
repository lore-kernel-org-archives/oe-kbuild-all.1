Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323060;
	b=l1HajAKoVrOJLjtvrQnBJiZjnprSE3i059XUsOtgl1pAoYjLvSNe422wvQpBCVk2BfrT
	 EqoIWeWTasHLAPQJQRKwhahJWfVBkoLsFP9UJ8m/XGQftt+OBdSVyDx1mDgSzMRidKjvN
	 +do1517Xw9ogvfbndvqHh3O+4L/WtM17fo7m3DWh5bAgJ5gHKhC90Ax27BiiDp4wfOXir
	 jZO+hivbCg9Di/0UYNgSdA4I2NABqOeBYttePkmixLhgCuvuHThc6/XYhYC4hZbhOlROc
	 WNjst4fyxfEJQgpTAsnFeXtnMa5F92B7L3/yMpl7g8vSLHwWfIa/DT6FZqDy0fQukTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323060;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wqN/3wwoS4Z/aavo3Z1dDTOiT5O71VTn7uR7Pvd+wxI=;
	b=VpxDAuWc7W3Zk17a0hFBUjDppKZe+3Hpei1ZvBbzSyA6xJEqRg0DN2SvaXDfGSqOjYSf
	 NTCv47OS4guqGNGFAlLjr/Yxgvf29jQ2GCad1gORALwvoP3KF7t58omiQxo1FklLp7ANJ
	 7tUd3mCuOr0HEp2HqmHUy1UauMWLRN6LxLoccD1ru42hFSp7QMPgP13EUXeBjwc0q+flP
	 mvICq06oGzjeiNH7e3fAtFwNOpTQnOm2pRMBtvdSV6DOaSFTRbpBNmQ/no+74jBECbJR7
	 NppGXeW05qy/K3gIBmiymA2E/CHQ4j4EpJHyd4Qk4YL5jVp5b/La+NzVPic2/Cm+2/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XVXDk3f0;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C275606A320
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 04:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C275606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XVXDk3f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795323060; x=1826859060;
  h=date:from:to:cc:subject:message-id;
  bh=lKXHRJBHTkZIrE9giEPtDUxMfjBptL/o6La7P00oQhI=;
  b=XVXDk3f0PeO+ol+Im+TmZs1aCsvzxuyKrCPdDHik0XGTsjaLSmV0A1WA
   BkuJesFYmwKzwtILB5+/lCZ1/UV68jIMCNo425S0/1cc8qRXismuooBVN
   xJm6+XIdeJZlu2QSTyHZIZFgAfMJ7X6wxfQ3vYv9eP7mHVD47oHbGLuFl
   N3dbfGRj64DKSMLari6xyIPRdiwid5hJsI04KweAi3hBlfrx9y7tLPAA/
   UY9XrLy1QSj8k/nxhMUDdVVXumtTkgXtBIOORGhN1erHVWnz+omj/nD0S
   ZuM8znb5oKEPtKJHGMIF+FsxFUH+KefVKdlTpD+uzOBt8ZBNwIzP8FUc0
   Q==;
X-CSE-ConnectionGUID: Bn1QEoF1S8imk/uOyEkkNQ==
X-CSE-MsgGUID: lgtdEpCqTZ+ebZyINhY70g==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4070812"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4070812"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 20:50:59 -0800
X-CSE-ConnectionGUID: s97X0A0jQ0KT4AcS6JZ1UA==
X-CSE-MsgGUID: ySom8664T46bBbCjYBoLVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11027104"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 21 Nov 2026 20:50:57 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUzXS-000000004Up-3OfX;
	Sun, 22 Nov 2026 04:50:54 +0000
Date: Sun, 22 Nov 2026 05:50:16 +0100
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 Mina Almasry <almasrymina@google.com>
Subject: [linux-next:master 5400/10560]
 drivers/net/ethernet/sun/sunvnet_common.c:1184:46: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <20261122054255.JYRt2s9E-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   909ef7a9a30fa139e69e555e3606680f5cca7726
commit: 23fe6ac2e97a932cff1472f81498e2c42810125c [5400/10560] net: skbuff: make skb_copy_and_csum_bits() report unreadable frags
config: sparc64-randconfig-r2302-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122054255.JYRt2s9E-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122054255.JYRt2s9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261122054255.JYRt2s9E-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/sun/sunvnet_common.c:420:32: sparse: sparse: restricted __be16 degrades to integer
>> drivers/net/ethernet/sun/sunvnet_common.c:1184:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __wsum [addressable] [usertype] csum @@     got restricted __sum16 @@
   drivers/net/ethernet/sun/sunvnet_common.c:1184:46: sparse:     expected restricted __wsum [addressable] [usertype] csum
   drivers/net/ethernet/sun/sunvnet_common.c:1184:46: sparse:     got restricted __sum16
   drivers/net/ethernet/sun/sunvnet_common.c:1195:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __wsum [addressable] [usertype] csum @@     got restricted __sum16 @@
   drivers/net/ethernet/sun/sunvnet_common.c:1195:46: sparse:     expected restricted __wsum [addressable] [usertype] csum
   drivers/net/ethernet/sun/sunvnet_common.c:1195:46: sparse:     got restricted __sum16
>> drivers/net/ethernet/sun/sunvnet_common.c:1204:59: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __sum16 [usertype] @@     got restricted __wsum [addressable] [usertype] csum @@
   drivers/net/ethernet/sun/sunvnet_common.c:1204:59: sparse:     expected restricted __sum16 [usertype]
   drivers/net/ethernet/sun/sunvnet_common.c:1204:59: sparse:     got restricted __wsum [addressable] [usertype] csum

vim +1184 drivers/net/ethernet/sun/sunvnet_common.c

31762eaa0d0804 Aaron Young    2016-03-15  1108  
31762eaa0d0804 Aaron Young    2016-03-15  1109  static inline struct sk_buff *vnet_skb_shape(struct sk_buff *skb, int ncookies)
31762eaa0d0804 Aaron Young    2016-03-15  1110  {
31762eaa0d0804 Aaron Young    2016-03-15  1111  	struct sk_buff *nskb;
31762eaa0d0804 Aaron Young    2016-03-15  1112  	int i, len, pad, docopy;
31762eaa0d0804 Aaron Young    2016-03-15  1113  
31762eaa0d0804 Aaron Young    2016-03-15  1114  	len = skb->len;
31762eaa0d0804 Aaron Young    2016-03-15  1115  	pad = 0;
31762eaa0d0804 Aaron Young    2016-03-15  1116  	if (len < ETH_ZLEN) {
31762eaa0d0804 Aaron Young    2016-03-15  1117  		pad += ETH_ZLEN - skb->len;
31762eaa0d0804 Aaron Young    2016-03-15  1118  		len += pad;
31762eaa0d0804 Aaron Young    2016-03-15  1119  	}
31762eaa0d0804 Aaron Young    2016-03-15  1120  	len += VNET_PACKET_SKIP;
31762eaa0d0804 Aaron Young    2016-03-15  1121  	pad += 8 - (len & 7);
31762eaa0d0804 Aaron Young    2016-03-15  1122  
31762eaa0d0804 Aaron Young    2016-03-15  1123  	/* make sure we have enough cookies and alignment in every frag */
31762eaa0d0804 Aaron Young    2016-03-15  1124  	docopy = skb_shinfo(skb)->nr_frags >= ncookies;
31762eaa0d0804 Aaron Young    2016-03-15  1125  	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
31762eaa0d0804 Aaron Young    2016-03-15  1126  		skb_frag_t *f = &skb_shinfo(skb)->frags[i];
31762eaa0d0804 Aaron Young    2016-03-15  1127  
b54c9d5bd6e38e Jonathan Lemon 2019-07-30  1128  		docopy |= skb_frag_off(f) & 7;
31762eaa0d0804 Aaron Young    2016-03-15  1129  	}
31762eaa0d0804 Aaron Young    2016-03-15  1130  	if (((unsigned long)skb->data & 7) != VNET_PACKET_SKIP ||
31762eaa0d0804 Aaron Young    2016-03-15  1131  	    skb_tailroom(skb) < pad ||
31762eaa0d0804 Aaron Young    2016-03-15  1132  	    skb_headroom(skb) < VNET_PACKET_SKIP || docopy) {
31762eaa0d0804 Aaron Young    2016-03-15  1133  		int start = 0, offset;
31762eaa0d0804 Aaron Young    2016-03-15  1134  		__wsum csum;
31762eaa0d0804 Aaron Young    2016-03-15  1135  
31762eaa0d0804 Aaron Young    2016-03-15  1136  		len = skb->len > ETH_ZLEN ? skb->len : ETH_ZLEN;
31762eaa0d0804 Aaron Young    2016-03-15  1137  		nskb = alloc_and_align_skb(skb->dev, len);
dc153f850daba6 Aaron Young    2016-03-15  1138  		if (!nskb) {
31762eaa0d0804 Aaron Young    2016-03-15  1139  			dev_kfree_skb(skb);
31762eaa0d0804 Aaron Young    2016-03-15  1140  			return NULL;
31762eaa0d0804 Aaron Young    2016-03-15  1141  		}
31762eaa0d0804 Aaron Young    2016-03-15  1142  		skb_reserve(nskb, VNET_PACKET_SKIP);
31762eaa0d0804 Aaron Young    2016-03-15  1143  
31762eaa0d0804 Aaron Young    2016-03-15  1144  		nskb->protocol = skb->protocol;
31762eaa0d0804 Aaron Young    2016-03-15  1145  		offset = skb_mac_header(skb) - skb->data;
31762eaa0d0804 Aaron Young    2016-03-15  1146  		skb_set_mac_header(nskb, offset);
80bfab79b8351c Eric Dumazet   2024-02-29  1147  		offset = skb_network_offset(skb);
31762eaa0d0804 Aaron Young    2016-03-15  1148  		skb_set_network_header(nskb, offset);
80bfab79b8351c Eric Dumazet   2024-02-29  1149  		offset = skb_transport_offset(skb);
31762eaa0d0804 Aaron Young    2016-03-15  1150  		skb_set_transport_header(nskb, offset);
31762eaa0d0804 Aaron Young    2016-03-15  1151  
31762eaa0d0804 Aaron Young    2016-03-15  1152  		offset = 0;
31762eaa0d0804 Aaron Young    2016-03-15  1153  		nskb->csum_offset = skb->csum_offset;
31762eaa0d0804 Aaron Young    2016-03-15  1154  		nskb->ip_summed = skb->ip_summed;
31762eaa0d0804 Aaron Young    2016-03-15  1155  
31762eaa0d0804 Aaron Young    2016-03-15  1156  		if (skb->ip_summed == CHECKSUM_PARTIAL)
31762eaa0d0804 Aaron Young    2016-03-15  1157  			start = skb_checksum_start_offset(skb);
31762eaa0d0804 Aaron Young    2016-03-15  1158  		if (start) {
31762eaa0d0804 Aaron Young    2016-03-15  1159  			int offset = start + nskb->csum_offset;
31762eaa0d0804 Aaron Young    2016-03-15  1160  
98524e04e0500a Shannon Nelson 2017-07-06  1161  			/* copy the headers, no csum here */
31762eaa0d0804 Aaron Young    2016-03-15  1162  			if (skb_copy_bits(skb, 0, nskb->data, start)) {
31762eaa0d0804 Aaron Young    2016-03-15  1163  				dev_kfree_skb(nskb);
31762eaa0d0804 Aaron Young    2016-03-15  1164  				dev_kfree_skb(skb);
31762eaa0d0804 Aaron Young    2016-03-15  1165  				return NULL;
31762eaa0d0804 Aaron Young    2016-03-15  1166  			}
98524e04e0500a Shannon Nelson 2017-07-06  1167  
98524e04e0500a Shannon Nelson 2017-07-06  1168  			/* copy the rest, with csum calculation */
31762eaa0d0804 Aaron Young    2016-03-15  1169  			*(__sum16 *)(skb->data + offset) = 0;
23fe6ac2e97a93 Josef Bacik    2026-11-04  1170  			if (skb_copy_and_csum_bits(skb, start,
31762eaa0d0804 Aaron Young    2016-03-15  1171  						   nskb->data + start,
23fe6ac2e97a93 Josef Bacik    2026-11-04  1172  						   skb->len - start, &csum)) {
23fe6ac2e97a93 Josef Bacik    2026-11-04  1173  				dev_kfree_skb(nskb);
23fe6ac2e97a93 Josef Bacik    2026-11-04  1174  				dev_kfree_skb(skb);
23fe6ac2e97a93 Josef Bacik    2026-11-04  1175  				return NULL;
23fe6ac2e97a93 Josef Bacik    2026-11-04  1176  			}
98524e04e0500a Shannon Nelson 2017-07-06  1177  
98524e04e0500a Shannon Nelson 2017-07-06  1178  			/* add in the header checksums */
98524e04e0500a Shannon Nelson 2017-07-06  1179  			if (skb->protocol == htons(ETH_P_IP)) {
98524e04e0500a Shannon Nelson 2017-07-06  1180  				struct iphdr *iph = ip_hdr(nskb);
98524e04e0500a Shannon Nelson 2017-07-06  1181  
31762eaa0d0804 Aaron Young    2016-03-15  1182  				if (iph->protocol == IPPROTO_TCP ||
31762eaa0d0804 Aaron Young    2016-03-15  1183  				    iph->protocol == IPPROTO_UDP) {
98524e04e0500a Shannon Nelson 2017-07-06 @1184  					csum = csum_tcpudp_magic(iph->saddr,
98524e04e0500a Shannon Nelson 2017-07-06  1185  								 iph->daddr,
31762eaa0d0804 Aaron Young    2016-03-15  1186  								 skb->len - start,
98524e04e0500a Shannon Nelson 2017-07-06  1187  								 iph->protocol,
98524e04e0500a Shannon Nelson 2017-07-06  1188  								 csum);
31762eaa0d0804 Aaron Young    2016-03-15  1189  				}
98524e04e0500a Shannon Nelson 2017-07-06  1190  			} else if (skb->protocol == htons(ETH_P_IPV6)) {
98524e04e0500a Shannon Nelson 2017-07-06  1191  				struct ipv6hdr *ip6h = ipv6_hdr(nskb);
98524e04e0500a Shannon Nelson 2017-07-06  1192  
98524e04e0500a Shannon Nelson 2017-07-06  1193  				if (ip6h->nexthdr == IPPROTO_TCP ||
98524e04e0500a Shannon Nelson 2017-07-06  1194  				    ip6h->nexthdr == IPPROTO_UDP) {
98524e04e0500a Shannon Nelson 2017-07-06  1195  					csum = csum_ipv6_magic(&ip6h->saddr,
98524e04e0500a Shannon Nelson 2017-07-06  1196  							       &ip6h->daddr,
98524e04e0500a Shannon Nelson 2017-07-06  1197  							       skb->len - start,
98524e04e0500a Shannon Nelson 2017-07-06  1198  							       ip6h->nexthdr,
98524e04e0500a Shannon Nelson 2017-07-06  1199  							       csum);
98524e04e0500a Shannon Nelson 2017-07-06  1200  				}
98524e04e0500a Shannon Nelson 2017-07-06  1201  			}
98524e04e0500a Shannon Nelson 2017-07-06  1202  
98524e04e0500a Shannon Nelson 2017-07-06  1203  			/* save the final result */
31762eaa0d0804 Aaron Young    2016-03-15 @1204  			*(__sum16 *)(nskb->data + offset) = csum;
31762eaa0d0804 Aaron Young    2016-03-15  1205  
31762eaa0d0804 Aaron Young    2016-03-15  1206  			nskb->ip_summed = CHECKSUM_NONE;
31762eaa0d0804 Aaron Young    2016-03-15  1207  		} else if (skb_copy_bits(skb, 0, nskb->data, skb->len)) {
31762eaa0d0804 Aaron Young    2016-03-15  1208  			dev_kfree_skb(nskb);
31762eaa0d0804 Aaron Young    2016-03-15  1209  			dev_kfree_skb(skb);
31762eaa0d0804 Aaron Young    2016-03-15  1210  			return NULL;
31762eaa0d0804 Aaron Young    2016-03-15  1211  		}
31762eaa0d0804 Aaron Young    2016-03-15  1212  		(void)skb_put(nskb, skb->len);
31762eaa0d0804 Aaron Young    2016-03-15  1213  		if (skb_is_gso(skb)) {
31762eaa0d0804 Aaron Young    2016-03-15  1214  			skb_shinfo(nskb)->gso_size = skb_shinfo(skb)->gso_size;
31762eaa0d0804 Aaron Young    2016-03-15  1215  			skb_shinfo(nskb)->gso_type = skb_shinfo(skb)->gso_type;
31762eaa0d0804 Aaron Young    2016-03-15  1216  		}
31762eaa0d0804 Aaron Young    2016-03-15  1217  		nskb->queue_mapping = skb->queue_mapping;
31762eaa0d0804 Aaron Young    2016-03-15  1218  		dev_kfree_skb(skb);
31762eaa0d0804 Aaron Young    2016-03-15  1219  		skb = nskb;
31762eaa0d0804 Aaron Young    2016-03-15  1220  	}
31762eaa0d0804 Aaron Young    2016-03-15  1221  	return skb;
31762eaa0d0804 Aaron Young    2016-03-15  1222  }
31762eaa0d0804 Aaron Young    2016-03-15  1223  

:::::: The code at line 1184 was first introduced by commit
:::::: 98524e04e0500a04fc461195c99e4385001fc18f sunvnet: add support for IPv6 checksum offloads

:::::: TO: Shannon Nelson <shannon.nelson@oracle.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
