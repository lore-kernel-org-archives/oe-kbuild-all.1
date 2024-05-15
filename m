Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71D93839C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 02:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715741296; cv=none; b=Uj3F7uU8U4pq6fFAHQC+o4CBdbfcx+g4xHwlgbGhL7P2A0w91CWDAC9HPedyP+qa5wKO0/3tEjU8DSz3izQWocCpXrwv/4MFtGlb5UprGYUdXyDLS2BkTY4PcUw4bnOlHkBrNT6IJt4+L23OKxDcPe9sgkpMh3QROhUOTyznEIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715741296; c=relaxed/simple;
	bh=HJjuHjYFHG3Chu15AcQQEoaGK9GIlEcMY+mX98INIUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iXCcZmOE3aWBJ1+9zejbcijhzmJ4lhB6w53vJ+uowIqy+bwH0HDnsUmfzLbqrInPO1BIcIJV/BxAQsnzatveJbQMedAQeK0KmGJw5A4B7gOuqOVhiDhWj2SkBmOrsB8157UeUz8Sc1R/FG24Kl32CGdT+h0TUQJ7VesHyEu8fNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K100L5Q3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K100L5Q3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715741294; x=1747277294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HJjuHjYFHG3Chu15AcQQEoaGK9GIlEcMY+mX98INIUk=;
  b=K100L5Q30DlWwsC6tIuLMZXMKBUotzcshDsJ6N1iPeENiyPB3DRGdTPQ
   EG6J/cAT0rRY0ZZE90ElN1CjxZmk7TnORDP63DC54mDOmKTOemTY5cCC3
   VIuY07eWph9vyhYkr3LGJClsMsnTENJMFgwZ5TttSU93KP7asr3W9oTho
   2AwBQsF8pdWLyuNy6rx9iIFWyqljmzQeSQ7N4rBjt/eXbw+iIJ0iTXhZG
   dyL7Foj3MbSfEGW+DV8uhS4iolFuWJjozMnzBmLLPlxTp2Vv00Q0km/nL
   T/CgiKYF1rTEMeUe1alLYnJXrukjJ+ndhm6cELJk/eqXEADyGarSBgiMQ
   A==;
X-CSE-ConnectionGUID: WBxrR9a6QK6SOGv4dK8DUA==
X-CSE-MsgGUID: jmAxyJLeQVupamCskjMJ5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23164499"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="23164499"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 19:48:14 -0700
X-CSE-ConnectionGUID: re0Yie83RJqis0HC/DOs+A==
X-CSE-MsgGUID: nV06m4VXSGmBQx5Dy8lkOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="30926706"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 May 2024 19:48:13 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s74gc-000CH1-2x;
	Wed, 15 May 2024 02:48:10 +0000
Date: Wed, 15 May 2024 10:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 6910/9610]
 drivers/net/ethernet/hisilicon/hns3/hns3_roh.c:79:53: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202405151052.AH2YMcM9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c6c7d83d2bc788cd9aef8983afa59eae25e148e
commit: c7489eeb1b4ed08f28172986d496abb02d1258f1 [6910/9610] net: hns3: support arp proxy
config: arm64-randconfig-r132-20240515 (https://download.01.org/0day-ci/archive/20240515/202405151052.AH2YMcM9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240515/202405151052.AH2YMcM9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405151052.AH2YMcM9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3_roh.c:79:53: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] vlan_tci @@     got unsigned short [usertype] vlan_tci @@
   drivers/net/ethernet/hisilicon/hns3/hns3_roh.c:79:53: sparse:     expected restricted __be16 [usertype] vlan_tci
   drivers/net/ethernet/hisilicon/hns3/hns3_roh.c:79:53: sparse:     got unsigned short [usertype] vlan_tci
>> drivers/net/ethernet/hisilicon/hns3/hns3_roh.c:128:58: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] vlan_tci @@     got restricted __be16 [usertype] vlan_tci @@
   drivers/net/ethernet/hisilicon/hns3/hns3_roh.c:128:58: sparse:     expected unsigned short [usertype] vlan_tci
   drivers/net/ethernet/hisilicon/hns3/hns3_roh.c:128:58: sparse:     got restricted __be16 [usertype] vlan_tci
   drivers/net/ethernet/hisilicon/hns3/hns3_roh.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:245:46: sparse: sparse: self-comparison always evaluates to false

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
    69		reply_idx = hns3_roh_arp_reply_idx_move_fd(reply_idx);
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
