Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB151FA3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 19:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8/aBtoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697311542; x=1728847542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ChvhNy4FVh0iUY/l1FQ/lkSS7LUqwdrE8vgsWSPVS0=;
  b=A8/aBtoaxEFAhsIZYQ4WlA8ZvUR2wZdVlE8rKjZZ0Sx2/TVA0WvzZj5B
   16UXj1giR8ShxK/fSGfytnDPdoT7AHHduBkQLKHBO55j184GnFxnEVrzU
   fkQEYUTcuL6yQutfVJdtKc0Xxlz7zVns7hy2J9Y1YGTUXh0LfNZQSJDxP
   AOQV2tjf5wX3MGSfwInW5vWrBO4AQtJj3cs8znTmOc1tAc8Pbtuwyc76U
   Xkk9xzb4M6kJPGU4btYwoSxYNldP/NfBNsQamLWIhgHtSF/a9kwo3NpHi
   2TVSQfENtR0s/cQ6wOIJgdqzDxeFKB32qlzf9zt74PK8mFMrswfztWQHq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375696284"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="375696284"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 12:25:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="845875440"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="845875440"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Oct 2023 12:25:28 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrkGM-0006Z7-1U;
	Sat, 14 Oct 2023 19:25:26 +0000
Date: Sun, 15 Oct 2023 03:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pablo-gtp:main 11/11] drivers/net/gtp.c:281:30: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202310150313.IPOOVXlp-lkp@intel.com>
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
commit: 230b7c1e9db7fcb2b796845017ce64f35e7430f1 [11/11] gtp: support for IPv4-in-IPv6-GTP and IPv6-in-IPv4-GTP
config: i386-randconfig-062-20231014 (https://download.01.org/0day-ci/archive/20231015/202310150313.IPOOVXlp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150313.IPOOVXlp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150313.IPOOVXlp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/gtp.c:260:17: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/gtp.c:260:17: sparse: sparse: restricted __be16 degrades to integer
>> drivers/net/gtp.c:281:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] @@     got int @@
   drivers/net/gtp.c:281:30: sparse:     expected restricted __be16 [usertype]
   drivers/net/gtp.c:281:30: sparse:     got int
   drivers/net/gtp.c:284:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] @@     got int @@
   drivers/net/gtp.c:284:30: sparse:     expected restricted __be16 [usertype]
   drivers/net/gtp.c:284:30: sparse:     got int
>> drivers/net/gtp.c:309:47: sparse: sparse: cast from restricted __be16
   drivers/net/gtp.c:1044:12: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] df @@     got unsigned short [usertype] frag_off @@
   drivers/net/gtp.c:1044:12: sparse:     expected restricted __be16 [usertype] df
   drivers/net/gtp.c:1044:12: sparse:     got unsigned short [usertype] frag_off
   drivers/net/gtp.c:1062:24: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/gtp.c:1166:56: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned short [usertype] frag_off @@     got restricted __be16 [usertype] frag_off @@
   drivers/net/gtp.c:1166:56: sparse:     expected unsigned short [usertype] frag_off
   drivers/net/gtp.c:1166:56: sparse:     got restricted __be16 [usertype] frag_off
   drivers/net/gtp.c:1276:45: sparse: sparse: incorrect type in argument 9 (different base types) @@     expected restricted __be32 [usertype] label @@     got unsigned char [addressable] [usertype] tos @@
   drivers/net/gtp.c:1276:45: sparse:     expected restricted __be32 [usertype] label
   drivers/net/gtp.c:1276:45: sparse:     got unsigned char [addressable] [usertype] tos

vim +281 drivers/net/gtp.c

   268	
   269	static int gtp_inner_proto(struct sk_buff *skb, unsigned int hdrlen,
   270				   __be16 *inner_proto)
   271	{
   272		__u8 *ip_version, _ip_version;
   273	
   274		ip_version = skb_header_pointer(skb, hdrlen, sizeof(ip_version),
   275						&_ip_version);
   276		if (!ip_version)
   277			return -1;
   278	
   279		switch (*ip_version & 0xf0) {
   280		case 0x40:
 > 281			*inner_proto = ETH_P_IP;
   282			break;
   283		case 0x60:
   284			*inner_proto = ETH_P_IPV6;
   285			break;
   286		default:
   287			return -1;
   288		}
   289	
   290		return 0;
   291	}
   292	
   293	static int gtp_rx(struct pdp_ctx *pctx, struct sk_buff *skb,
   294			  unsigned int hdrlen, unsigned int role)
   295	{
   296		__be16 inner_proto;
   297	
   298		if (gtp_inner_proto(skb, hdrlen, &inner_proto) < 0) {
   299			netdev_dbg(pctx->dev, "GTP packet does not encapsulate an IP packet\n");
   300			return -1;
   301		}
   302	
   303		if (!gtp_check_ms(skb, pctx, hdrlen, role, inner_proto)) {
   304			netdev_dbg(pctx->dev, "No PDP ctx for this MS\n");
   305			return 1;
   306		}
   307	
   308		/* Get rid of the GTP + UDP headers. */
 > 309		if (iptunnel_pull_header(skb, hdrlen, htons(inner_proto),
   310				 !net_eq(sock_net(pctx->sk), dev_net(pctx->dev)))) {
   311			pctx->dev->stats.rx_length_errors++;
   312			goto err;
   313		}
   314	
   315		netdev_dbg(pctx->dev, "forwarding packet from GGSN to uplink\n");
   316	
   317		/* Now that the UDP and the GTP header have been removed, set up the
   318		 * new network header. This is required by the upper layer to
   319		 * calculate the transport header.
   320		 */
   321		skb_reset_network_header(skb);
   322		skb_reset_mac_header(skb);
   323	
   324		skb->dev = pctx->dev;
   325	
   326		dev_sw_netstats_rx_add(pctx->dev, skb->len);
   327	
   328		__netif_rx(skb);
   329		return 0;
   330	
   331	err:
   332		pctx->dev->stats.rx_dropped++;
   333		return -1;
   334	}
   335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
