Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E885E188A3A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 00:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761179138; cv=none; b=EX6jpKyqIw1ld4X/5/pLnHlA4uUYpymQOFcL2W1PAele61dorLsNG+gqBBSgR+WkX7kwwN6jtCHYuJb/vMVqLjpyNNDUcr3ugQoePHffCvNSw19o6VVNkv5CSNfNMg6JRZuF6dfQ8xx6UioqNf4PDDSII/A7OLhIHBiDPqV0ElQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761179138; c=relaxed/simple;
	bh=YYcMB7Q3mvTugbrTSzjRN78TCh/K5FdU735e2uugVwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOXXq2uTnBaDmtLbhHUL0HyHL1UozGvfIxcQ8WiDbdjAQ9F11r4ipJoGiW4DMsHU+uA7EZ+GQQmVLqmcHtEq7MMUUX9mInn9b+CbPU8K1UwiEYYpkv1fRQqPkfo7G6mCJJK5I6+eblPVDMX/fFM6DgR4YuvYpTQuaF7YWgetLmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFuUA9UG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFuUA9UG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761179137; x=1792715137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YYcMB7Q3mvTugbrTSzjRN78TCh/K5FdU735e2uugVwU=;
  b=LFuUA9UG+BRevllhoBNUx2en0N0W5Vnu4hsPuIsWsaMRA+Y5r0H/O2fU
   fAUOFcRfChCV7hAT5vbNro6PP2ilskGl8LWND5YqTQRyi4xj9Hj2ga8Ij
   zqJFPehSC14BJczaMySka+GaYXkp30u7nLGhZmLpB3o5pheatW7YiJbVx
   qoBIAYmltyF47Wc4/Tw2Fp4uQk1ZO0yrmHd4aWGCZNuAfnPIZqAo6+Xvb
   spiXLmowfWDpr4r+jWiAdS7DcJnAffEgjJcG3qot7vGDdpGp3loM4xPF1
   MkByAtnxR2DWnGDZiPoI36mp7KW0YCnAQnlZiUZ7qd0+inbA/27sk2Zzd
   w==;
X-CSE-ConnectionGUID: xGEPOMeTRN+QqY1kDLacbA==
X-CSE-MsgGUID: XhDda+YoStuZR4QtMGJHUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67205474"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="67205474"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 17:25:36 -0700
X-CSE-ConnectionGUID: shxj0CcnTT+x4lR6IEcqPQ==
X-CSE-MsgGUID: Q9oZZhToTg27z6LfIJU0Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183909661"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Oct 2025 17:25:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBj91-000CrD-28;
	Thu, 23 Oct 2025 00:25:31 +0000
Date: Thu, 23 Oct 2025 08:24:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Skorodumov <skorodumov.dmitry@huawei.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andrey.bokhanko@huawei.com,
	Dmitry Skorodumov <skorodumov.dmitry@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 7/8] ipvlan: Support IPv6 for learnable l2-bridge
Message-ID: <202510230845.sa3eZvoK-lkp@intel.com>
References: <20251021144410.257905-8-skorodumov.dmitry@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021144410.257905-8-skorodumov.dmitry@huawei.com>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Skorodumov/ipvlan-Implement-learnable-L2-bridge/20251021-224923
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251021144410.257905-8-skorodumov.dmitry%40huawei.com
patch subject: [PATCH net-next 7/8] ipvlan: Support IPv6 for learnable l2-bridge
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20251023/202510230845.sa3eZvoK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230845.sa3eZvoK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230845.sa3eZvoK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ipvlan/ipvlan_core.c: In function 'ipvlan_snat_patch_tx_ipv6':
>> drivers/net/ipvlan/ipvlan_core.c:832:30: error: implicit declaration of function 'csum_ipv6_magic'; did you mean 'csum_tcpudp_magic'? [-Wimplicit-function-declaration]
     832 |         icmph->icmp6_cksum = csum_ipv6_magic(&ip6h->saddr, &ip6h->daddr,
         |                              ^~~~~~~~~~~~~~~
         |                              csum_tcpudp_magic


vim +832 drivers/net/ipvlan/ipvlan_core.c

   788	
   789	static void ipvlan_snat_patch_tx_ipv6(struct ipvl_dev *ipvlan,
   790					      struct sk_buff *skb)
   791	{
   792		struct ipv6hdr *ip6h;
   793		struct icmp6hdr *icmph;
   794		u8 icmp_option;
   795		u8 *lladdr;
   796		u16 ndsize;
   797	
   798		if (unlikely(!pskb_may_pull(skb, sizeof(*ip6h))))
   799			return;
   800	
   801		if (ipv6_hdr(skb)->nexthdr != NEXTHDR_ICMP)
   802			return;
   803	
   804		if (unlikely(!pskb_may_pull(skb, sizeof(*ip6h) + sizeof(*icmph))))
   805			return;
   806	
   807		ip6h = ipv6_hdr(skb);
   808		icmph = (struct icmp6hdr *)(ip6h + 1);
   809	
   810		/* Patch Source-LL for solicitation, Target-LL for advertisement */
   811		if (icmph->icmp6_type == NDISC_NEIGHBOUR_SOLICITATION ||
   812		    icmph->icmp6_type == NDISC_ROUTER_SOLICITATION)
   813			icmp_option = ND_OPT_SOURCE_LL_ADDR;
   814		else if (icmph->icmp6_type == NDISC_NEIGHBOUR_ADVERTISEMENT)
   815			icmp_option = ND_OPT_TARGET_LL_ADDR;
   816		else
   817			return;
   818	
   819		ndsize = htons(ip6h->payload_len);
   820		if (unlikely(!pskb_may_pull(skb, sizeof(*ip6h) + ndsize)))
   821			return;
   822	
   823		lladdr = ipvlan_search_icmp6_ll_addr(skb, icmp_option);
   824		if (!lladdr)
   825			return;
   826	
   827		ether_addr_copy(lladdr, ipvlan->phy_dev->dev_addr);
   828	
   829		ip6h = ipv6_hdr(skb);
   830		icmph = (struct icmp6hdr *)(ip6h + 1);
   831		icmph->icmp6_cksum = 0;
 > 832		icmph->icmp6_cksum = csum_ipv6_magic(&ip6h->saddr, &ip6h->daddr,
   833						     ndsize,
   834						     IPPROTO_ICMPV6,
   835						     csum_partial(icmph,
   836								  ndsize,
   837								  0));
   838		skb->ip_summed = CHECKSUM_COMPLETE;
   839	}
   840	#else
   841	static void ipvlan_snat_patch_tx_ipv6(struct ipvl_dev *ipvlan,
   842					      struct sk_buff *skb)
   843	{
   844	}
   845	#endif
   846	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
