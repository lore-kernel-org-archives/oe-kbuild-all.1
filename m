Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B037E12B95
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 15:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvFko2P2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697298424; x=1728834424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iaOIyrH+7SkhJBkDzUU1E4c0zkh+gCM0WPVGAklAPSI=;
  b=BvFko2P2OYgWhrgnZQBAIVedUqbSdie8Uz6vppBgHU9nc980Y6Qdckmw
   WNdzQYz/TqY+1lxOOkGYjd6A6/nYwaaVkvsfZbv2XMcH/JpjfZdZULixX
   P0RVg8IaXwK7t104hLfkK0yVwJaZY/U1w1BBKKEhWnCBkujwiTjucHMoN
   2NNAakXrXXSkruoal9Jh1RyxM9LBTlce5NjXtvPrS6/Za98uzK4PV7jfn
   2Zj671wZgwhThcIJbUrkuO72VeUSSNzCbAuAySvdV1ZGZgFlDMMLcGyC+
   d8+mkm5UcxP7tvWzgPm9iGW4p3tpteAPW6A+y3UvSF2N1e0bx/Ymrp7mS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="449521964"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="449521964"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 08:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1086504489"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1086504489"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Oct 2023 08:47:02 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrgqy-0006KF-17;
	Sat, 14 Oct 2023 15:47:00 +0000
Date: Sat, 14 Oct 2023 23:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pablo-gtp:main 9/11] drivers/net/gtp.c:1011:12: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202310142352.LUjQLXaW-lkp@intel.com>
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
commit: 131a295c85342beb299bbd4dcee11f732fa0d2c3 [9/11] gtp: add helper function to build GTP packets from an IPv4 packet
config: i386-randconfig-062-20231014 (https://download.01.org/0day-ci/archive/20231014/202310142352.LUjQLXaW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142352.LUjQLXaW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142352.LUjQLXaW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/gtp.c:1011:12: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] df @@     got unsigned short [usertype] frag_off @@
   drivers/net/gtp.c:1011:12: sparse:     expected restricted __be16 [usertype] df
   drivers/net/gtp.c:1011:12: sparse:     got unsigned short [usertype] frag_off
>> drivers/net/gtp.c:1029:24: sparse: sparse: restricted __be16 degrades to integer
>> drivers/net/gtp.c:1073:48: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned short [usertype] frag_off @@     got restricted __be16 [usertype] frag_off @@
   drivers/net/gtp.c:1073:48: sparse:     expected unsigned short [usertype] frag_off
   drivers/net/gtp.c:1073:48: sparse:     got restricted __be16 [usertype] frag_off
   drivers/net/gtp.c:1211:45: sparse: sparse: incorrect type in argument 9 (different base types) @@     expected restricted __be32 [usertype] label @@     got unsigned char [addressable] [usertype] tos @@
   drivers/net/gtp.c:1211:45: sparse:     expected restricted __be32 [usertype] label
   drivers/net/gtp.c:1211:45: sparse:     got unsigned char [addressable] [usertype] tos

vim +1011 drivers/net/gtp.c

   984	
   985	static int __gtp_build_skb_ip4(struct sk_buff *skb, struct net_device *dev,
   986				       struct gtp_pktinfo *pktinfo,
   987				       struct pdp_ctx *pctx, __u8 tos, __u16 frag_off)
   988	{
   989		struct rtable *rt;
   990		struct flowi4 fl4;
   991		__be16 df;
   992		int mtu;
   993	
   994		rt = ip4_route_output_gtp(&fl4, pctx->sk, pctx->ip4.peer_addr.s_addr,
   995					  inet_sk(pctx->sk)->inet_saddr);
   996		if (IS_ERR(rt)) {
   997			netdev_dbg(dev, "no route to SSGN %pI4\n",
   998				   &pctx->ip4.peer_addr.s_addr);
   999			dev->stats.tx_carrier_errors++;
  1000			goto err;
  1001		}
  1002	
  1003		if (rt->dst.dev == dev) {
  1004			netdev_dbg(dev, "circular route to SSGN %pI4\n",
  1005				   &pctx->ip4.peer_addr.s_addr);
  1006			dev->stats.collisions++;
  1007			goto err_rt;
  1008		}
  1009	
  1010		/* This is similar to tnl_update_pmtu(). */
> 1011		df = frag_off;
  1012		if (df) {
  1013			mtu = dst_mtu(&rt->dst) - dev->hard_header_len -
  1014				sizeof(struct iphdr) - sizeof(struct udphdr);
  1015			switch (pctx->gtp_version) {
  1016			case GTP_V0:
  1017				mtu -= sizeof(struct gtp0_header);
  1018				break;
  1019			case GTP_V1:
  1020				mtu -= sizeof(struct gtp1_header);
  1021				break;
  1022			}
  1023		} else {
  1024			mtu = dst_mtu(&rt->dst);
  1025		}
  1026	
  1027		skb_dst_update_pmtu_no_confirm(skb, mtu);
  1028	
> 1029		if (frag_off & htons(IP_DF) &&
  1030		    ((!skb_is_gso(skb) && skb->len > mtu) ||
  1031		     (skb_is_gso(skb) && !skb_gso_validate_network_len(skb, mtu)))) {
  1032			netdev_dbg(dev, "packet too big, fragmentation needed\n");
  1033			icmp_ndo_send(skb, ICMP_DEST_UNREACH, ICMP_FRAG_NEEDED,
  1034				      htonl(mtu));
  1035			goto err_rt;
  1036		}
  1037	
  1038		gtp_set_pktinfo_ipv4(pktinfo, pctx->sk, tos, pctx, rt, &fl4, dev);
  1039		gtp_push_header(skb, pktinfo);
  1040	
  1041		return 0;
  1042	err_rt:
  1043		ip_rt_put(rt);
  1044	err:
  1045		return -EBADMSG;
  1046	}
  1047	
  1048	static int gtp_build_skb_ip4(struct sk_buff *skb, struct net_device *dev,
  1049				     struct gtp_pktinfo *pktinfo)
  1050	{
  1051		struct gtp_dev *gtp = netdev_priv(dev);
  1052		struct pdp_ctx *pctx;
  1053		struct iphdr *iph;
  1054		int ret;
  1055	
  1056		/* Read the IP destination address and resolve the PDP context.
  1057		 * Prepend PDP header with TEI/TID from PDP ctx.
  1058		 */
  1059		iph = ip_hdr(skb);
  1060		if (gtp->role == GTP_ROLE_SGSN)
  1061			pctx = ipv4_pdp_find(gtp, iph->saddr);
  1062		else
  1063			pctx = ipv4_pdp_find(gtp, iph->daddr);
  1064	
  1065		if (!pctx) {
  1066			netdev_dbg(dev, "no PDP ctx found for %pI4, skip\n",
  1067				   &iph->daddr);
  1068			return -ENOENT;
  1069		}
  1070		netdev_dbg(dev, "found PDP context %p\n", pctx);
  1071	
  1072		ret = __gtp_build_skb_ip4(skb, dev, pktinfo, pctx,
> 1073					  iph->tos, iph->frag_off);
  1074		if (ret < 0)
  1075			return ret;
  1076	
  1077		netdev_dbg(dev, "gtp -> IP src: %pI4 dst: %pI4\n",
  1078			   &iph->saddr, &iph->daddr);
  1079	
  1080		return 0;
  1081	}
  1082	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
