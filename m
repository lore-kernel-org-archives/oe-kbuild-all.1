Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282F9139B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Oct 2023 02:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lG6TAUrX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696557871; x=1728093871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I4zHHtyfptc/wnmmbKchtGwMD+lDf7vkxa9q/YWufkQ=;
  b=lG6TAUrXvCB+l0dmL7rPD2SUpxOaLkt2mpc1uA7Fa0oWKYA8xN+eJhwQ
   /HUQDj/d+lgilmu4t7QnMn1GyKGNSxy/BISOAsp2+aXkf9SiI5bbV65mA
   UdLdU8BUPc6prvxGnEqBUQb3aEvGdmzSWIEsJXo3+g3ApoZ9h5fhWcjRE
   gWolkUPjpGhGhhw46m03znlQMmdKz6b/7Wy+b7+Xn/hZLIcksA+SSFtYp
   steeGph0YMHhPQDzLd1xGsQOFHXPsYeUMZLQvffIUrBI97HJVxbEuWZaf
   yQJSVffeLVwBx0T+mx6ljrpHSDVMqiTdeuuElOR+waI4RuloQ+ojbpxSs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="414646297"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="414646297"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 19:02:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="752025783"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="752025783"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Oct 2023 19:02:18 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoaAS-000M8G-0V;
	Fri, 06 Oct 2023 02:02:16 +0000
Date: Fri, 6 Oct 2023 10:01:37 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pablo-gtp:main 11/11] drivers/net/gtp.c:1145:13: warning: variable
 'ret' set but not used
Message-ID: <202310060925.xlvw7P2e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git main
head:   16dab95598162f8369adcd63a29ea3cc9e5bbab1
commit: 16dab95598162f8369adcd63a29ea3cc9e5bbab1 [11/11] gtp: support for IPv4-in-IPv6-GTP and IPv6-in-IPv4-GTP
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231006/202310060925.xlvw7P2e-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060925.xlvw7P2e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060925.xlvw7P2e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/gtp.c: In function 'gtp_build_skb_ip4':
>> drivers/net/gtp.c:1145:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1145 |         int ret;
         |             ^~~


vim +/ret +1145 drivers/net/gtp.c

2a7e9618007872 Pablo Neira Ayuso 2023-10-04  1137  
131a295c85342b Pablo Neira Ayuso 2023-10-04  1138  static int gtp_build_skb_ip4(struct sk_buff *skb, struct net_device *dev,
131a295c85342b Pablo Neira Ayuso 2023-10-04  1139  			     struct gtp_pktinfo *pktinfo)
131a295c85342b Pablo Neira Ayuso 2023-10-04  1140  {
131a295c85342b Pablo Neira Ayuso 2023-10-04  1141  	struct gtp_dev *gtp = netdev_priv(dev);
16dab95598162f Pablo Neira Ayuso 2023-10-05  1142  	struct net *net = gtp->net;
131a295c85342b Pablo Neira Ayuso 2023-10-04  1143  	struct pdp_ctx *pctx;
131a295c85342b Pablo Neira Ayuso 2023-10-04  1144  	struct iphdr *iph;
131a295c85342b Pablo Neira Ayuso 2023-10-04 @1145  	int ret;
131a295c85342b Pablo Neira Ayuso 2023-10-04  1146  
131a295c85342b Pablo Neira Ayuso 2023-10-04  1147  	/* Read the IP destination address and resolve the PDP context.
131a295c85342b Pablo Neira Ayuso 2023-10-04  1148  	 * Prepend PDP header with TEI/TID from PDP ctx.
131a295c85342b Pablo Neira Ayuso 2023-10-04  1149  	 */
131a295c85342b Pablo Neira Ayuso 2023-10-04  1150  	iph = ip_hdr(skb);
131a295c85342b Pablo Neira Ayuso 2023-10-04  1151  	if (gtp->role == GTP_ROLE_SGSN)
131a295c85342b Pablo Neira Ayuso 2023-10-04  1152  		pctx = ipv4_pdp_find(gtp, iph->saddr);
131a295c85342b Pablo Neira Ayuso 2023-10-04  1153  	else
131a295c85342b Pablo Neira Ayuso 2023-10-04  1154  		pctx = ipv4_pdp_find(gtp, iph->daddr);
131a295c85342b Pablo Neira Ayuso 2023-10-04  1155  
131a295c85342b Pablo Neira Ayuso 2023-10-04  1156  	if (!pctx) {
131a295c85342b Pablo Neira Ayuso 2023-10-04  1157  		netdev_dbg(dev, "no PDP ctx found for %pI4, skip\n",
131a295c85342b Pablo Neira Ayuso 2023-10-04  1158  			   &iph->daddr);
131a295c85342b Pablo Neira Ayuso 2023-10-04  1159  		return -ENOENT;
131a295c85342b Pablo Neira Ayuso 2023-10-04  1160  	}
131a295c85342b Pablo Neira Ayuso 2023-10-04  1161  	netdev_dbg(dev, "found PDP context %p\n", pctx);
131a295c85342b Pablo Neira Ayuso 2023-10-04  1162  
16dab95598162f Pablo Neira Ayuso 2023-10-05  1163  	switch (pctx->peer_af) {
16dab95598162f Pablo Neira Ayuso 2023-10-05  1164  	case AF_INET:
131a295c85342b Pablo Neira Ayuso 2023-10-04  1165  		ret = __gtp_build_skb_ip4(skb, dev, pktinfo, pctx,
131a295c85342b Pablo Neira Ayuso 2023-10-04  1166  					  iph->tos, iph->frag_off);
16dab95598162f Pablo Neira Ayuso 2023-10-05  1167  		break;
16dab95598162f Pablo Neira Ayuso 2023-10-05  1168  	case AF_INET6:
16dab95598162f Pablo Neira Ayuso 2023-10-05  1169  		ret = __gtp_build_skb_ip6(net, skb, dev, pktinfo, pctx, iph->tos);
16dab95598162f Pablo Neira Ayuso 2023-10-05  1170  		break;
16dab95598162f Pablo Neira Ayuso 2023-10-05  1171  	}
131a295c85342b Pablo Neira Ayuso 2023-10-04  1172  
131a295c85342b Pablo Neira Ayuso 2023-10-04  1173  	netdev_dbg(dev, "gtp -> IP src: %pI4 dst: %pI4\n",
131a295c85342b Pablo Neira Ayuso 2023-10-04  1174  		   &iph->saddr, &iph->daddr);
131a295c85342b Pablo Neira Ayuso 2023-10-04  1175  
131a295c85342b Pablo Neira Ayuso 2023-10-04  1176  	return 0;
131a295c85342b Pablo Neira Ayuso 2023-10-04  1177  }
131a295c85342b Pablo Neira Ayuso 2023-10-04  1178  

:::::: The code at line 1145 was first introduced by commit
:::::: 131a295c85342beb299bbd4dcee11f732fa0d2c3 gtp: add helper function to build GTP packets from an IPv4 packet

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
