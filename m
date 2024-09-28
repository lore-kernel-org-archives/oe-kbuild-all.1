Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A129613A40C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 21:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727560743; cv=none; b=K29e5MVfLKqh/E+f17u45XRM5IB/WXRvl7OZXnnFDIR66miQ5Qv/wZBv/Cmrt4YMFe2BUl5JZLemgRMovIR5txRJsfZotbtDW8mm6ZLVdYuKOZV3Y4FUYlo0fxC1xOF+Q4RDuNJ8798VeQFfSpH2JcdYRQFleEj5yd26xF5xOD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727560743; c=relaxed/simple;
	bh=idSUVe7gRcQS5NFEB5NLMDiwfYcQW2zQDtkOm3kFOGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=InCbCIvJMHGVRql1fw2Gn9UJ9Xs9vIuj+GTJ9fqXnZuhumwHy1gyn4jZ/QPUK/u2a4ePPUMEh3ape5FFl1tfcX4/OD0A+sPqjRCn4avOxWtshkiRXjLvLMdQDpHh+0MK/0i5cpE/xaApDhhFcGDrsVV8iM4zhVP634yi808Piw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOnh1uV6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOnh1uV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727560742; x=1759096742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=idSUVe7gRcQS5NFEB5NLMDiwfYcQW2zQDtkOm3kFOGM=;
  b=jOnh1uV6RQ9/4d1e//ufzPeg/l3xhc1/8mDly0IBcvDeG4jGG6IeLR7o
   JDtImts+n26aRBNgWodzPcZqr0YKstOgc+Qcu0FBYmJkdt56eJ85jkIJw
   vvK/vDnduiEdqzELemfItW70ANW4Z50u6Alwl59+4bNtkRkhycSbCdEvw
   nRd3leBJhmcX3umkMFJy0Iq3kWPe8iBS3Z01Xi9EOrR57XVgol17EHY7Z
   bWJ5R2oB1H/Qn6JeHjJcEPPWwjfRn41IdUV8j9YnA8KNnPPe0eDszCyoL
   9yyPvgA9U55qiooS45ED+NZ6t1ddZhXcNLBSrQY30R80GZyJ0q1laFkVE
   g==;
X-CSE-ConnectionGUID: S9vKc0C/RweXniNL3P58iA==
X-CSE-MsgGUID: jS/Sf/XFQa2CWmvIAAe1zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="37261312"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="37261312"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 14:59:01 -0700
X-CSE-ConnectionGUID: 1o7LwhmyTB+qIPHHT3YR5Q==
X-CSE-MsgGUID: S9gSklr3S9KBemjWH0obsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72458894"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2024 14:59:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sufSr-000Ngi-2u;
	Sat, 28 Sep 2024 21:58:57 +0000
Date: Sun, 29 Sep 2024 05:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21084/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3_roh.c:79:53: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202409290547.aSbDInhQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: 0b68f4778af4fded021ba67f5eb3fb74ff8d7fc1 [21084/30000] net: hns3: support arp proxy
config: arm64-randconfig-r131-20240925 (https://download.01.org/0day-ci/archive/20240929/202409290547.aSbDInhQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240929/202409290547.aSbDInhQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290547.aSbDInhQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3_roh.c:79:53: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] vlan_tci @@     got unsigned short [usertype] vlan_tci @@
   drivers/net/ethernet/hisilicon/hns3/hns3_roh.c:79:53: sparse:     expected restricted __be16 [usertype] vlan_tci
   drivers/net/ethernet/hisilicon/hns3/hns3_roh.c:79:53: sparse:     got unsigned short [usertype] vlan_tci
>> drivers/net/ethernet/hisilicon/hns3/hns3_roh.c:128:58: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] vlan_tci @@     got restricted __be16 [usertype] vlan_tci @@
   drivers/net/ethernet/hisilicon/hns3/hns3_roh.c:128:58: sparse:     expected unsigned short [usertype] vlan_tci
   drivers/net/ethernet/hisilicon/hns3/hns3_roh.c:128:58: sparse:     got restricted __be16 [usertype] vlan_tci

vim +79 drivers/net/ethernet/hisilicon/hns3/hns3_roh.c

    56	
    57	int hns3_handle_roh_arp_req(struct sk_buff *skb, struct hns3_nic_priv *priv)
    58	{
    59		struct hnae3_handle *h = priv->ae_handle;
    60		struct hns3_enet_ring *ring;
    61		struct arphdr *arphdr;
    62		struct ethhdr *ethhdr;
    63		int reply_idx, len;
    64		__be32 *sip, *tip;
    65	
    66		/* use same queue num in rx */
    67		ring = &priv->ring[skb->queue_mapping + h->kinfo.num_tqps];
    68		reply_idx = ring->arp_reply_tail;
    69		hns3_roh_arp_reply_idx_move_fd(reply_idx);
    70		/* This smp_load_acquire() pairs with smp_store_release() in
    71		 * hns3_handle_roh_arp_reply().
    72		 */
    73		if (reply_idx == smp_load_acquire(&ring->arp_reply_head))
    74			return NETDEV_TX_BUSY;
    75		len = skb->len;
    76	
    77		if (skb_vlan_tagged(skb)) {
    78			ring->arp_reply[reply_idx].has_vlan = true;
  > 79			ring->arp_reply[reply_idx].vlan_tci = skb_vlan_tag_get(skb);
    80			skb_vlan_pop(skb);
    81			len += VLAN_HLEN;
    82		} else {
    83			ring->arp_reply[reply_idx].has_vlan = false;
    84		}
    85	
    86		ethhdr = eth_hdr(skb);
    87		arphdr = arp_hdr(skb);
    88	
    89		hns3_extract_arp_ip_field(arphdr, &sip, &tip, skb->dev->addr_len);
    90		ether_addr_copy(ring->arp_reply[reply_idx].dest_hw, ethhdr->h_source);
    91		ether_addr_copy(ring->arp_reply[reply_idx].src_hw, ethhdr->h_dest);
    92		ring->arp_reply[reply_idx].dest_ip = *sip;
    93		ring->arp_reply[reply_idx].src_ip = *tip;
    94		hns3_roh_update_mac_by_ip(be32_to_cpu(*tip),
    95					  ring->arp_reply[reply_idx].src_hw);
    96		/* This smp_store_release() pairs with smp_load_acquire() in
    97		 * hns3_handle_roh_arp_reply(). Ensure that the arp_reply_tail is
    98		 * update validly.
    99		 */
   100		smp_store_release(&ring->arp_reply_tail, reply_idx);
   101	
   102		ring = &priv->ring[skb->queue_mapping];
   103		u64_stats_update_begin(&ring->syncp);
   104		ring->stats.tx_pkts++;
   105		ring->stats.tx_bytes += len;
   106		u64_stats_update_end(&ring->syncp);
   107	
   108		dev_kfree_skb_any(skb);
   109		napi_schedule(&ring->tqp_vector->napi);
   110		return NETDEV_TX_OK;
   111	}
   112	
   113	static struct sk_buff *setup_arp_reply_skb(struct hns3_arp_reply *arp_reply,
   114						   struct hns3_nic_priv *priv)
   115	{
   116		struct sk_buff *skb = arp_create(ARPOP_REPLY, ETH_P_ARP,
   117						 arp_reply->dest_ip, priv->netdev,
   118						 arp_reply->src_ip, arp_reply->dest_hw,
   119						 arp_reply->src_hw, arp_reply->dest_hw);
   120		if (!skb)
   121			return NULL;
   122	
   123		skb_reset_mac_header(skb);
   124		skb_reset_mac_len(skb);
   125	
   126		if (arp_reply->has_vlan) {
   127			skb = vlan_insert_tag_set_proto(skb, htons(ETH_P_8021Q),
 > 128							arp_reply->vlan_tci);
   129			if (!skb)
   130				return NULL;
   131			skb_reset_network_header(skb);
   132		}
   133	
   134		skb_reserve(skb, skb->mac_len);
   135		return skb;
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
