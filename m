Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822AF409131
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 May 2026 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779458557; cv=none; b=axzD6VB7Zduo2fB/Q/EWAOXDN9ynwA1s5NMATYvEF7F6GubnUwMSvjFvbUFLZQOeLc7KFVp+Bd4/z0M4e5NUVVlzWObKaYCrdlXcz7J0QC7hnOcVt+YfhPwKquRYUgONspkamplAYwRxmLSYlJyqhwHvcARDm9hrRbFb9E+7udc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779458557; c=relaxed/simple;
	bh=LK6/yx0vWyWVp75oQHlOURT21LAB+jmOiCDeY9hdZo8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XaGbwop/8xuwaz/74FSC7LZyVBaF3XO6lRb1IzINcgg2Q8TyZthNhJO+qmFfOzcX70yJR/p91NaOpGudC8wYU7y9mRACyN3hnqliIXD1joJ8OfNGdYkDjLaOcn02Vy3yEABLi6eMtxLvQhdZ7tnseNXhfrL5Qel1oLc9iWw+JwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wh0CgGZQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wh0CgGZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779458553; x=1810994553;
  h=date:from:to:cc:subject:message-id;
  bh=LK6/yx0vWyWVp75oQHlOURT21LAB+jmOiCDeY9hdZo8=;
  b=Wh0CgGZQBuFKmcuoIN6Ut5sIwDQ3ur1047dmXkzBLTOGtUbYDkksKZed
   JQt629pDkcTM1DFjSYyKSS3X9rnQ43Li+oNmhCqdNZQdmgw3mmaBxIRiI
   W+t8JP0bILZD84+jBNNRmrJCjl0Ol3w3CRp+mzTllrLWD0CqiHiWGdGBT
   rFM8oHTbZCXG+RVeUjCUazTBlFGO8lReQxwc3YYu/XIK1O/ls27tQzpbS
   7gsF8qysJeF6L1Z5G5V6knXRZdeDNewD+tooFTImrqxOnLiQxMsxln4jd
   4CRBss3UMM8mAdfpryzQyQxxMqrSULNvK5lalOdSMObBp9onkB9h02eSN
   g==;
X-CSE-ConnectionGUID: NUxj0gZxR66C9ytMlh1kcg==
X-CSE-MsgGUID: leDezqP0TEC0u54Wj3F0aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80508368"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80508368"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 07:02:30 -0700
X-CSE-ConnectionGUID: 6cIkYQA3S5aBYxipH3BNJA==
X-CSE-MsgGUID: 9hyt+NWCSxuhoM4WPOWoYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="264741803"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 May 2026 07:02:28 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQQSI-00000000BMR-2anu;
	Fri, 22 May 2026 14:02:26 +0000
Date: Fri, 22 May 2026 16:02:00 +0200
From: kernel test robot <lkp@intel.com>
To: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/ipv6/seg6_local.c:2106:22: error: implicit declaration
 of function 'csum_ipv6_magic'; did you mean 'csum_tcpudp_magic'?
Message-ID: <202605221550.U3AXw6yq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Yuya-Kusakabe/seg6-add-End-MAP-behavior/20260511-092357
head:   5546b6655fa48f3d7fa7a6efdaea29424275b552
commit: fae5ef8e15d7cd2a32e88acdb34e40640e4b255e seg6: add End.M.GTP6.E behavior
date:   12 days ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260522/202605221550.U3AXw6yq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221550.U3AXw6yq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221550.U3AXw6yq-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv6/seg6_local.c: In function 'input_action_end_m_gtp6_e_finish':
>> net/ipv6/seg6_local.c:2106:22: error: implicit declaration of function 'csum_ipv6_magic'; did you mean 'csum_tcpudp_magic'? [-Wimplicit-function-declaration]
    2106 |         uh->check = ~csum_ipv6_magic(&new_ip6h->saddr, &new_ip6h->daddr,
         |                      ^~~~~~~~~~~~~~~
         |                      csum_tcpudp_magic


vim +2106 net/ipv6/seg6_local.c

  2030	
  2031	#define SEG6_MOBILE_GTP6_E_CB(skb)	\
  2032		((struct seg6_mobile_gtp6_e_cb *)((skb)->cb))
  2033	
  2034	static int input_action_end_m_gtp6_e_finish(struct net *net,
  2035						    struct sock *sk,
  2036						    struct sk_buff *skb)
  2037	{
  2038		enum skb_drop_reason reason = SKB_DROP_REASON_SEG6_MOBILE_NOMEM;
  2039		struct seg6_mobile_gtp6_e_cb cb = *SEG6_MOBILE_GTP6_E_CB(skb);
  2040		struct dst_entry *orig_dst = skb_dst(skb);
  2041		const struct seg6_mobile_info *minfo;
  2042		struct seg6_local_lwt *slwt;
  2043		struct ipv6hdr *new_ip6h;
  2044		struct udphdr *uh;
  2045	
  2046		slwt = seg6_local_lwtunnel(orig_dst->lwtstate);
  2047		minfo = &slwt->mobile_info;
  2048	
  2049		/* Reject GSO packets that would not fit the egress IPv6/UDP/GTP-U
  2050		 * path after our outer headers are added; the GSO segmenter cannot
  2051		 * adjust mss across SRv6 -> GTP-U conversion.  Skip the check
  2052		 * entirely when no MTU is known on the current dst.
  2053		 */
  2054		if (skb_is_gso(skb)) {
  2055			unsigned int ovhd = sizeof(*new_ip6h) + sizeof(*uh) +
  2056					    sizeof(struct gtp1_header_long) +
  2057					    sizeof(struct seg6_mobile_pdu_session_ext);
  2058			unsigned int mtu = dst_mtu(skb_dst(skb));
  2059	
  2060			if (mtu && (mtu <= ovhd ||
  2061				    !skb_gso_validate_network_len(skb, mtu - ovhd))) {
  2062				reason = SKB_DROP_REASON_SEG6_MOBILE_MTU_EXCEEDED;
  2063				goto drop;
  2064			}
  2065		}
  2066	
  2067		/* Reserve worst-case headroom for the entire outer chain we are about
  2068		 * to push: IPv6 + UDP + GTP-U long header + PDU Session extension.
  2069		 * Subsequent skb_cow_head() calls inside seg6_mobile_push_gtpu() then
  2070		 * become no-ops.
  2071		 */
  2072		if (skb_cow_head(skb,
  2073				 sizeof(*new_ip6h) + sizeof(*uh) +
  2074				 sizeof(struct gtp1_header_long) +
  2075				 sizeof(struct seg6_mobile_pdu_session_ext)))
  2076			goto drop;
  2077	
  2078		if (seg6_mobile_push_gtpu(skb, cb.teid, cb.qfi, cb.pdu_type,
  2079					  cb.pdu_type_set))
  2080			goto drop;
  2081	
  2082		uh = skb_push(skb, sizeof(*uh));
  2083		skb_reset_transport_header(skb);
  2084		uh->source = htons(GTP1U_PORT);
  2085		uh->dest = htons(GTP1U_PORT);
  2086		uh->len = htons(skb->len);
  2087	
  2088		new_ip6h = skb_push(skb, sizeof(*new_ip6h));
  2089		skb_reset_network_header(skb);
  2090		memset(new_ip6h, 0, sizeof(*new_ip6h));
  2091		ip6_flow_hdr(new_ip6h, cb.tclass, cb.flowlabel);
  2092		new_ip6h->payload_len = htons(skb->len - sizeof(*new_ip6h));
  2093		new_ip6h->nexthdr = IPPROTO_UDP;
  2094		new_ip6h->hop_limit = cb.hop_limit;
  2095		new_ip6h->saddr = minfo->src_addr;
  2096		new_ip6h->daddr = cb.next_sid;
  2097	
  2098		/* RFC 8200 requires UDP/IPv6 checksums.  Initialise the
  2099		 * pseudo-header sum and let the stack/NIC complete it via
  2100		 * CHECKSUM_PARTIAL so we do not pay a per-packet linear sum and
  2101		 * we cooperate with offload.
  2102		 */
  2103		skb->ip_summed = CHECKSUM_PARTIAL;
  2104		skb->csum_start = (unsigned char *)uh - skb->head;
  2105		skb->csum_offset = offsetof(struct udphdr, check);
> 2106		uh->check = ~csum_ipv6_magic(&new_ip6h->saddr, &new_ip6h->daddr,
  2107					     skb->len - sizeof(*new_ip6h),
  2108					     IPPROTO_UDP, 0);
  2109	
  2110		skb->protocol = htons(ETH_P_IPV6);
  2111		nf_reset_ct(skb);
  2112		skb_dst_drop(skb);
  2113	
  2114		seg6_lookup_any_nexthop(skb, &cb.next_sid, 0, false, slwt->oif);
  2115		return dst_input(skb);
  2116	
  2117	drop:
  2118		kfree_skb_reason(skb, reason);
  2119		return -EINVAL;
  2120	}
  2121	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
